function BraczMbedMidi1() {
  print("in construcing fn");
  function newDeck(led_play, led_beat, led_pfl) {
    var deck = function() {}
    deck.led_play = led_play;
    deck.led_beat = led_beat;
    deck.led_pfl = led_pfl;
    return deck;
  }

  var deck1 = newDeck(3, 2, 1);
  var deck2 = newDeck(6, 4, 5);
//  var deck1 = newDeck(11, 12, 1);
//  var deck2 = newDeck(14, 13, 5);

  function getDeck(group) {
    if (group == "[Channel1]") return deck1;
    if (group == "[Channel2]") return deck2;
    print("getDeck for unknown group: " + group);
    return null;
  }

  function updateLed(note, value) {
    if (value > 0) {
      print("setting note " + note + " to on.");
      midi.sendShortMsg("0x90", note, 0x7f);
    } else {
      print("setting note " + note + " to off.");
      midi.sendShortMsg("0x90", note, 0x0);
    }
  }
  print("in construcing fn2");

  this.onPlay = function(value, group, key) {
    print("onPlay called " + group + ", value " + value);
    var deck = getDeck(group);
    if (deck) {
      updateLed(deck.led_play, value);
    }
  }

  this.onBeatActive = function(value, group, key) {
    var deck = getDeck(group);
    if (deck) {
      updateLed(deck.led_beat, value);
    }
  }

  this.onPfl = function(value, group, key) {
    var deck = getDeck(group);
    if (deck) {
      updateLed(deck.led_pfl, value);
    }
  }

  function connectDeckControls(group) {
    print("connecting functions");
    BraczMbedMidi1.onPlay = function(value, group, key) {
      print("onplay proxy called");
      BraczMbedMidi1.impl.onPlay(value, group, key);
    }
    BraczMbedMidi1.onBeatActive = function(value, group, key) {
      BraczMbedMidi1.impl.onBeatActive(value, group, key);
    }
    BraczMbedMidi1.onPfl = function(value, group, key) {
      BraczMbedMidi1.impl.onPfl(value, group, key);
    }
    engine.connectControl(group,"play","BraczMbedMidi1.impl.onPlay");
    engine.connectControl(group,"beat_active","BraczMbedMidi1.impl.onBeatActive");
    engine.connectControl(group,"pfl","BraczMbedMidi1.impl.onPfl");
  }

  function touchAllDeckControls(group) {
    engine.trigger(group, "play");
    engine.trigger(group, "beat_active");
    engine.trigger(group, "pfl");
  }

  function flashAllLedsOn(deck) {
    updateLed(deck.led_play, 0x7f);
    updateLed(deck.led_beat, 0x7f);
    updateLed(deck.led_pfl, 0x7f);
  }

  rewind8Beats = function(group) {
      //group = "[Channel1]";
      //engine.setValue(group,"beatjump",-8);
      //return;
      print("rewind8 called. current loop=" +
            engine.getValue(group,"beatloop"));
      engine.setValue(group,"beatloop_8_activate",0);
      engine.setValue(group,"hotcue_1_set",1);
      /*engine.setValue(group,"beatloop_8_activate",1);
      var nextpos = engine.getValue(group,"loop_end_position");
      var cpos = engine.getValue(group,"loop_start_position");
      var new_start_pos = cpos - (nextpos - cpos);
      print("loop end = " + nextpos);
      print("loop start = " + cpos);
      print("new start pos = " + new_start_pos);
      engine.setValue(group,"beatloop_8_toggle",1);
      engine.setValue(group,"hotcue_1_enabled",1);
      engine.setValue(group,"hotcue_1_position",new_start_pos);
      var after = engine.getValue(group,"hotcue_1_position");
      print("hotcue 1 is " + new_start_pos);*/
      engine.beginTimer(200, "BraczMbedMidi1.rew1(\""+group+"\")", true);
  }

  this.touchAll = function() {
    touchAllDeckControls("[Channel1]");
    touchAllDeckControls("[Channel2]");
  }

  this.initialize = function() {
    engine.softTakeover("[Master]","crossfader",true);
    engine.softTakeover("[Master]","headMix",false);
    engine.softTakeover("[Master]","volume",true);
    engine.softTakeover("[Master]","headVolume",false);
    connectDeckControls("[Channel1]");
    connectDeckControls("[Channel2]");
    flashAllLedsOn(deck1);
    flashAllLedsOn(deck2);
    engine.beginTimer(500, "BraczMbedMidi1.impl.touchAll", true);
  }

  engine.softTakeover("[Master]","crossfader",true);

  print("constructed mbed midi object");
}

BraczMbedMidi1.rew1 = function(group) {
    print("rew1 " + group);
    engine.setValue(group,"beatloop_8_activate",1);
    engine.beginTimer(200, "BraczMbedMidi1.rew2(\""+group+"\")", true);
}

BraczMbedMidi1.rew2 = function(group) {
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
    engine.beginTimer(200, "BraczMbedMidi1.rew3(\""+group+"\")", true);
}

BraczMbedMidi1.rew3 = function(group) {
    print("going to hotcue1 on group " + group);
    engine.setValue(group,"hotcue_1_goto",1);
}


BraczMbedMidi1.init = function() {
  print("Initializing bracz-mbed-midi.");
  BraczMbedMidi1.impl = new BraczMbedMidi1();
  BraczMbedMidi1.impl.initialize();
  BraczMbedMidi1.scrollObj = BraczMbedMidi1.padControls[0];
}

BraczMbedMidi1.shutdown = function(id) {
  print("Shutting down bracz-mbed-midi.");
}

BraczMbedMidi1.stopBeatLoop1 = function() {
  print("stopping beatloop 1. current loop=" +
      engine.getValue("[Channel1]","beatloop"));
  engine.setValue("[Channel1]","beatloop_1_toggle",1);
}
BraczMbedMidi1.stopBeatLoop2 = function() {
  print("stopping beatloop 2");
  engine.setValue("[Channel2]","beatloop_1_toggle",1);
//  engine.setValue("[Channel2]","beatloop_1_toggle",1);
}

BraczMbedMidi1.padControls = {
    21 : { "group": "[Channel1]", "name": "beats_translate_curpos", "type": "btn"  },
    22 : { "group": "[Channel2]", "name": "beats_translate_curpos", "type": "btn"  },

    24 : { "group": "[Channel1]", "plus": "beats_translate_plus", "minus" : "beats_translate_minus",  "type": "scroll", "diff": 2 },
    25 : { "group": "[Channel2]", "plus": "beats_translate_plus", "minus" : "beats_translate_minus",  "type": "scroll", "diff": 2  },

    0 : { "group": "[Playlist]", "plus": "SelectNextTrack", "minus": "SelectPrevTrack", "type": "scroll" },

    30 : { "group": "[Channel1]", "name": "LoadSelectedTrack", "type": "btn" },
    31 : { "group": "[Channel2]", "name": "LoadSelectedTrack", "type": "btn" },

    27 : { "group": "[Channel1]", "name": "cue_default", "type": "btn" },
    28 : { "group": "[Channel2]", "name": "cue_default", "type": "btn" },
}

BraczMbedMidi1.padPress = function(channel, control, value, status, group) {
    print ("pad perss: control " + control + ", value " + value + ", status " + status);
    if ((control == 29 || control == 32) && status == 0x80) {
        this.rewind8Beats("[Channel1]");
        return;
    }
    if ((control == 26 || control == 33) && status == 0x80) {
        this.rewind8Beats("[Channel2]");
        return;
    }
    if (!BraczMbedMidi1.padControls[control]) {
        print("unknown pad control: " + control);
        return;
    }
    var d = BraczMbedMidi1.padControls[control];
    print("pressed: " + d);
    if (d["type"] == "btn") {
        if (status != 0x90) return;
        engine.setValue(d["group"], d["name"], 1);
        engine.setValue(d["group"], d["name"], 0);
    }
    if (d["type"] == "scroll") {
        if (status == 0x90) {
            BraczMbedMidi1.scrollObj = d;
        } else {
            BraczMbedMidi1.scrollObj = BraczMbedMidi1.padControls[0];
        }
    }
}

BraczMbedMidi1.encoderPlus = function(channel, control, value, status, group) {
    if (!BraczMbedMidi1.scrollObj) return;
    var d = BraczMbedMidi1.scrollObj;
    if (d["plus"]) {
        var count = 1;
        if (d["diff"]) count = d["diff"];
        for (var i = 0; i < count; ++i) {
            print("setting value " + d["group"] + d["plus"]);
            engine.setValue(d["group"], d["plus"], 1);
            engine.setValue(d["group"], d["plus"], 0);
        }
    }
}

BraczMbedMidi1.encoderMinus = function(channel, control, value, status, group) {
    if (!BraczMbedMidi1.scrollObj) return;
    var d = BraczMbedMidi1.scrollObj;
    if (d["minus"]) {
        var count = 1;
        if (d["diff"]) count = d["diff"];
        for (var i = 0; i < count; ++i) {
            engine.setValue(d["group"], d["minus"], 1);
            engine.setValue(d["group"], d["minus"], 0);
        }
    }
}

BraczMbedMidi1.skipBeat = function(channel, control, value, status, group) {
    
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
    engine.beginTimer(800, "BraczMbedMidi1.stopBeatLoop1", true);
  } else if (group == "[Channel2]") {
    engine.beginTimer(800, "BraczMbedMidi1.stopBeatLoop2", true);
  } else {
    print("Unknown group for skipbeat: " + group);
  }
  return;



  nextpos = engine.getValue("[Channel1]","loop_end_position");
  cpos = engine.getValue("[Channel1]","loop_start_position");
  print("loop end = " + nextpos);
  print("loop start = " + cpos);
  if (group == "[Channel1]") {
    engine.beginTimer(150, "BraczMbedMidi1.stopBeatLoop1", true);
  } else if (group == "[Channel2]") {
    engine.beginTimer(150, "BraczMbedMidi1.stopBeatLoop2", true);
  } else {
    print("Unknown group for skipbeat: " + group);
  }
  return;
  engine.setValue("[Channel1]","hotcue_4_set",1);
  engine.setValue("[Channel1]","hotcue_4_position",nextpos);
  var hcpos = engine.getValue("[Channel1]","hotcue_4_position");
  print("hc pos = " + hcpos);
  //engine.setValue("[Channel1]","hotcue_4_position",nextpos);
  hcpos = engine.getValue("[Channel1]","hotcue_4_position");
  print("hc pos = " + hcpos);
  //engine.setValue("[Channel1]","hotcue_4_gotoandplay",1);

  return;
    var nextpos = engine.getValue("[Channel1]","loop_end_position");
    var cpos = engine.getValue("[Channel1]","loop_start_position");
    var newpos = cpos + (nextpos - cpos);
    print("loop end = " + nextpos);
    print("loop start = " + cpos);
    engine.setValue("[Channel1]","beatloop_1_toggle",1);
    engine.setValue("[Channel1]","hotcue_1_position",newpos);
    engine.setValue("[Channel1]","hotcue_1_gotoandplay",1);
    //engine.setValue("[Channel1]","hotcue_1_clear",1);

    //beatloop_1_activate = 1
    //loop_end_position
    //beatloop_1_enabled = 0
    //hotcue_1_position
    //hotcue_1_gotoandplay
}
