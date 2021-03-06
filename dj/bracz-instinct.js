function HCInstinct() {};



// ----------   Global variables    ---------- 
HCInstinct.scratching = [false, false];
HCInstinct.pitchSpeedFast = true; 	// temporary Pitch Speed of +/-  true = 
HCInstinct.vinylButton = false;			
HCInstinct.pitchSwitches = new Array();
HCInstinct.pitchSwitches["A"] = [0,0];
HCInstinct.pitchSwitches["B"] = [0,0];

HCInstinct.pitchB = [0,0];

HCInstinct.beat_downsample = 3;

// ----------   Functions    ----------

HCInstinct.deck1 = {
    led_beat: 23,
    group: "[Channel1]",
    scratching: false,
    edeck : 1,
};

HCInstinct.deck2 = {
    led_beat: 49,
    group: "[Channel2]",
    scratching: false,
    edeck : 2,
}

HCInstinct.getDeck = function(group) {
    if (group == "[Channel1]") return HCInstinct.deck1;
    if (group == "[Channel2]") return HCInstinct.deck2;
    print("getDeck for unknown group: " + group);
    return null;
}

// called when the MIDI device is opened & set up
HCInstinct.init = function(id, debugging) {	
    HCInstinct.id = id;
    HCInstinct.FastPosition=[0,0];
    HCInstinct.jogFastPosition=[0,0];

    HCInstinct.allLedOff();

    // Switch-on some LEDs for improve the usability
    // midi.sendShortMsg(0x90, 46, 0x7F);	// Automix LED
    midi.sendShortMsg(0x90, 21, 0x7F);	// Cue deck A LED
    midi.sendShortMsg(0x90, 47, 0x7F);	// Cue deck B LED

    midi.sendShortMsg(0x90, 56, 0x7F);	// files
    midi.sendShortMsg(0x90, 57, 0x7F);	// folders

    engine.connectControl("[Channel1]","beat_active","HCInstinct.onBeatActive");
    engine.connectControl("[Channel2]","beat_active","HCInstinct.onBeatActive");

    engine.softTakeover("[Master]","crossfader",true);
    engine.softTakeover("[Master]","headMix",true);

    print ("***** Hercules DJ Instinct Control id: \""+id+"\" initialized.");
};

// Called when the MIDI device is closed
HCInstinct.shutdown = function(id) {
    HCInstinct.allLedOff();
    print ("***** Hercules DJ Instinct Control id: \""+id+"\" shutdown.");	
};


// === MISC TO MANAGE LEDS ===

HCInstinct.allLedOff = function () {
    // Switch off all LEDs
    for(var i = 1; i <=57; ++i) {
	midi.sendShortMsg(0x90, i, 0);
    }
};

// Use VinylButton as "Shift"-Button
HCInstinct.vinylButtonHandler = function(channel,control, value, status) {
    if (value == ButtonState.pressed) {
	HCInstinct.vinylButton = true;
    }
    else {
	HCInstinct.vinylButton=false;
    }
};

HCInstinct.updateLed = function(note, value) {
    if (value > 0) {
        midi.sendShortMsg("0x90", note, 0x7f);
    } else {
        midi.sendShortMsg("0x90", note, 0x0);
    }
};

HCInstinct.onBeatActive = function(value, group, key) {
    var deck = this.getDeck(group);
    if (deck) {
        this.updateLed(deck.led_beat, value);
    }
};

// The button that enables/disables scratching
HCInstinct.wheelTouch = function (channel, control, value, status) {
    var deck;
    if (control == 0x1a) {
        deck = HCInstinct.deck1;
    } else if (control == 0x34) {
        deck = HCInstinct.deck2;
    } else {
        print("wheel touch unknown deck control=" + control);
        return;
    }
    print("wheel touch " + deck.group + " control " + control + " value " + value);
    var play = engine.getValue(deck.group, "play");
    if (play) {
        print("not scratching on playing deck");
        value = 0;
    }
    if (value == 0x7F && !deck.scratching) { // catch only first touch
        var alpha = 1.0/8;
        var beta = alpha/32;
        engine.scratchEnable(deck.edeck, 128, 33+1/3, alpha, beta);
        // Keep track of whether we're scratching on this virtual deck
        deck.scratching = true;
    }
    else {    //  button up
        engine.scratchDisable(deck.edeck);
        deck.scratching = false;
    }

};

HCInstinct.wheelTranslate = function(deck, value) {
    if (!deck.beats_translate) {
        print("not translating now");
        return;
    }
    if (value < 64) {
        deck.beats_ofs = deck.beats_ofs - 1;
        if (deck.beats_ofs <= -HCInstinct.beat_downsample) {
            print("translate -");
            engine.setValue(deck.group, "beats_translate_plus", 1);
            engine.setValue(deck.group, "beats_translate_plus", 0);
            deck.beats_ofs = 0;
        } else {
            print("no translate ofs " + deck.beats_ofs);
        }
    } else {
        deck.beats_ofs = deck.beats_ofs + 1;
        if (deck.beats_ofs >= HCInstinct.beat_downsample) {
            engine.setValue(deck.group, "beats_translate_minus", 1);
            engine.setValue(deck.group, "beats_translate_minus", 0);
            deck.beats_ofs = 0;
        }
    }
}

HCInstinct.wheelTurn = function (channel, control, value, status) {
    var deck;
    if (control % 2) {
        deck = HCInstinct.deck2;
    } else {
        deck = HCInstinct.deck1;
    }
    print("wheel push-turn " + deck.group + " control " + control + " value " + value);
    if (!deck.scratching)  return;
    
    var newValue;
    if (value-64 > 0) newValue = value-128; // 7F, 7E, 7D
    else newValue = value;
    engine.scratchTick(deck.edeck ,newValue);
};

HCInstinct.wheelRotate = function (channel, control, value, status) {
    var deck;
    if (control % 2) {
        deck = HCInstinct.deck2;
    } else {
        deck = HCInstinct.deck1;
    }
    print("wheel rotate " + deck.group + " control " + control + " value " + value);
    HCInstinct.wheelTranslate(deck, value);
    return;
    // See if we're on scratching.
    //if (HCInstinct.scratching[0] == false )  return;
    
    var newValue;
    if (value-64 > 0) newValue = value-128; // 7F, 7E, 7D
    else newValue = value;
    engine.scratchTick(1,newValue);
};

HCInstinct.knobIncrement = function (group, action, minValue, maxValue, centralValue, step, sign) {
    // This function allows you to increment a non-linear value like the volume's knob
    // sign must be 1 for positive increment, -1 for negative increment
    semiStep = step/2;
    rangeWidthLeft = centralValue-minValue;
    rangeWidthRight = maxValue-centralValue;
    actual = engine.getValue(group, action);
    
    if (actual < 1){
	increment = ((rangeWidthLeft)/semiStep)*sign;
    }
    else if (actual > 1){
	increment = ((rangeWidthRight)/semiStep)*sign;
    }
    else if (actual == 1){
	increment = (sign == 1) ? rangeWidthRight/semiStep : (rangeWidthLeft/semiStep)*sign;
    }

    if (sign == 1 && actual < maxValue){
	newValue = actual + increment;
    }
    else if (sign == -1 && actual > minValue){
	newValue = actual + increment;
    }
    
    return newValue;
};



// Pitch +/- 
HCInstinct.pitch = function (midino, control, value, status, group) {
    var speed = (HCInstinct.vinylButton == true) ? "" : "_small";
    var state = (value == 0x7F) ? 1 : 0;
    switch (control){
    case 0x11: HCInstinct.pitchSwitches["A"][0]=state;
	engine.setValue(group, "rate_temp_down"+speed, state); 
	break;
    case 0x12: HCInstinct.pitchSwitches["A"][1]=state;
	engine.setValue(group, "rate_temp_up"+speed, state); 
	break;
    case 0x2B: HCInstinct.pitchSwitches["B"][0]=state;
	engine.setValue(group, "rate_temp_down"+speed, state); 
	break;
    case 0x2C: HCInstinct.pitchSwitches["B"][1]=state;
	engine.setValue(group, "rate_temp_up"+speed, state); 
	break;
    };	
    // when buttons + and - pressed simultanously
    if (HCInstinct.pitchSwitches["A"][0] && HCInstinct.pitchSwitches["A"][1]) {
	// reset pitch to 0
	engine.setValue(group, "rate", 0); 
    };
    if (HCInstinct.pitchSwitches["B"][0] && HCInstinct.pitchSwitches["B"][1]) {
	engine.setValue(group, "rate", 0); 
    }
};

// Up/Down-Siwtches 
HCInstinct.tempPitch = function (midino, control, value, status, group) {
    var rate = (value==0x7F) ? "rate_perm_down" : "rate_perm_up" ;
    if (HCInstinct.vinylButton == false) {
	rate = rate + "_small";
    }	
    engine.setValue(group, rate, 1);
    engine.setValue(group, rate, 0);
};

HCInstinct.onFwd = function(channel, control, value, status, group) {
    if (value != 0x7F) return;
  print("skipBeat called. current loop=" +
        engine.getValue(group,"beatloop"));
  //engine.getValue(group,"rate");
    engine.setValue(group,"loop_in", 1);
    engine.setValue(group,"beatloop_1_activate",1);
    
  //engine.setValue(group,"beatloop_1_toggle",1);
  var nextpos = engine.getValue(group,"loop_end_position");
  var cpos = engine.getValue(group,"loop_start_position");
  print("loop end = " + nextpos);
  print("loop start = " + cpos);
  if (group == "[Channel1]") {
    engine.beginTimer(800, "HCInstinct.stopBeatLoop1", true);
  } else if (group == "[Channel2]") {
    engine.beginTimer(800, "HCInstinct.stopBeatLoop2", true);
  } else {
    print("Unknown group for skipbeat: " + group);
  }
  return;
}

HCInstinct.stopBeatLoop1 = function() {
  print("stopping beatloop 1. current loop=" +
      engine.getValue("[Channel1]","beatloop"));
  engine.setValue("[Channel1]","beatloop_1_toggle",1);
}
HCInstinct.stopBeatLoop2 = function() {
  print("stopping beatloop 2");
  engine.setValue("[Channel2]","beatloop_1_toggle",1);
}

HCInstinct.onBack = function(channel, control, value, status, group) {
    if (value != 0x7F) return;
    print("rewind8 called. current loop=" +
          engine.getValue(group,"beatloop"));
    engine.setValue(group,"beatloop_8_activate",0);
    engine.setValue(group,"hotcue_1_set",1);
    engine.beginTimer(200, "HCInstinct.rew1(\""+group+"\")", true);
}

HCInstinct.rew1 = function(group) {
    print("rew1 " + group);
    engine.setValue(group,"beatloop_8_activate",1);
    engine.beginTimer(200, "HCInstinct.rew2(\""+group+"\")", true);
}

HCInstinct.rew2 = function(group) {
    print("rew2 " + group);
    var nextpos = engine.getValue(group,"loop_end_position");
    var cpos = engine.getValue(group,"loop_start_position");
    var new_start_pos = cpos - (nextpos - cpos);
    print("loop end = " + nextpos);
    print("loop start = " + cpos);
    print("new start pos = " + new_start_pos);
    engine.setValue(group,"beatloop_8_toggle",1);
    engine.setValue(group,"loop_start_position",-1);
    engine.setValue(group,"loop_end_position",-1);
    //engine.setValue(group,"hotcue_1_enabled",1);
    engine.setValue(group,"hotcue_1_position",new_start_pos);
    var after = engine.getValue(group,"hotcue_1_position");
    print("hotcue 1 is " + new_start_pos);
    engine.beginTimer(200, "HCInstinct.rew3(\""+group+"\")", true);
}

HCInstinct.rew3 = function(group) {
    print("going to hotcue1 on group " + group);
    engine.setValue(group,"hotcue_1_goto",1);
}

HCInstinct.onSoftButton =  function(channel, control, value, status, group) {
    print("soft button on " + channel + " control " + control + " vlaue " + value + " group " + group);
    if (control == 42 || control == 16) {
        var deck = HCInstinct.getDeck(group);
        if (value < 0x40) {
            print("stopping beat translate on deck " + deck.group)
            deck.beats_translate = false;
        } else {
            print("starting beat translate on deck " + deck.group)
            deck.beats_translate = true;
            deck.beats_ofs = 0;
        }
    }
    return;
}
