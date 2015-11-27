#!/usr/bin/gawk -f


BEGIN {
  pass1=1;
  nomovlb=0;
  nomovlb_jumps=0;  #do not try to deduce bsr at labels.
  norewritegoto=0;
  nokillgoto=0;
  nobra=0;
  bcache["_main"] = -1;
  kValueNotYetKnown=-1;
  kValueContradiction=-3;
  kValueNotFoundInCache=-4;
  kValueUnknownFromJump=-2;

  kValueDisregardJumps=-10;
}

// {
  printed=0;
  gmatched=0;
  ++currline;
}
  

/	processor	12F1822/ {
  nobra=1;
} 

/FNROOT/ {
  if (V963==1 && !pass1) {  # reenable this for 9.63 compilation
    printed = 1;
    print ";" $0
  }
}

/FNBREAK/ {
  if (!pass1) {  # reenable this for 9.63 compilation
    printed = 1;
    print ";" $0
  }
}

/^[[:space:]]*psect/ || /^\tcall/ || /^\tfcall/ {
  bvalue=kValueNotYetKnown;
  currline = 0;
}

/^[[:space:]]*psect/ {
  split($2, tmp, ",");
  currpsect = tmp[1];
}

function ApplyValueToLabel(label) {
  if (bvalue == kValueNotYetKnown) {
    bcache[label] = kValueUnknownFromJump;
  } else if (!(label in bcache)) {
    bcache[label] = bvalue;
  } else if (bvalue != bcache[label]) {
    bcache[label] = -3;
  } # else we agreed with whatever was in the cache already
}

/^[[:space:]]*$/ || /^[[:space:]]*;/ {
  --currline;
}

/^[[:alnum:]_]+:/ {
  # this is a label
  --currline;
  split($0, tmp, ":");
  label = tmp[1];
  comment="\t;";
  if (gmatch_state == 2 || gmatch_state == 4) {
    comment = comment " | gmatch["gmatch_state"]='" label "' ";
    gmatch_labels[gmatch_state++] = label;
    gmatched = 1;
  }
  if (pass1) {
    #we have to union the follow-through path with the jump path.
    ApplyValueToLabel(label);
    bvalue = bcache[label];
    # maintains mapping of label->psect
    label_place_psect[label] = currpsect;
    label_place_line[label] = currline;
  } else {
    nvalue = kValueNotFoundInCache;
    if (label in bcache) nvalue = bcache[label];
    printed = 1;
    if (label in gmatch_rewrite) {
      gmatch_kill_next_goto = gmatch_rewrite[label];
    }
    print $0 comment " | bvalue=" bvalue ", nvalue=" nvalue ", bcache['" label "']=" bcache[label]
    if (bvalue != nvalue) bvalue = kValueContradiction;
  }
  if (nomovlb_jumps) bvalue = kValueDisregardJumps;
}

/^\tgoto/ {
  label=$2
  comment="\t;";
  if (gmatch_state==0 || gmatch_state==1 || gmatch_state==3) {
    comment = comment " | gmatch["gmatch_state"]='" label "' ";
    gmatch_labels[gmatch_state++] = label;
    gmatched = 1;
  }
  if (label in gmatch_rewrite) {
    comment = comment " | gmatch_rewrite to " gmatch_rewrite[label]
  }
  if (label in gmatch_kill) {
    comment = comment " | gmatch_kill "
  }
  if (pass1) {
    ApplyValueToLabel(label);
  } else {
    printed = 1;
    kill=0;
    dest=label;
    insn = "goto";
    if (label in gmatch_rewrite && !norewritegoto) {
      dest = gmatch_rewrite[label];
      comment = comment " | orig " label
    } else if (label in gmatch_kill) {
      kill = 1;
      comment = comment " | gmatch_kill ";
    } else if (label == gmatch_kill_current_goto) {
      kill = 1;
      comment = comment " | gotorewrite_kill ";
    }
    if (nokillgoto) kill=0;
    if (!nobra) insn="bra";
    if (currpsect != label_place_psect[dest]) {
      #comment = comment "| dest "dest" psect'"label_place_psect[dest]"'!=currpsect'"currpsect"'"
      insn = "goto";
    }
    comment = comment "| bvalue=" bvalue ", cache[" label "]=" bcache[label]
    print (kill ? ";" : "") "\t" insn "\t" dest comment;
  }
  #bvalue=-1;
}

/^\tb(ra|c|nc|z|nz|ov|nov|n|nn)/ {
  label=$2
  if (pass1) {
    bcache[label] = -3;
    #ApplyValueToLabel(label);
  }
}

/^\tline/ {
#  printed = 1;
}

/PCL/ {
  print "; computed GOTO detected. turning off MOVLB optimization"
  nomovlb = 1;
}

/^\tmovlb/ {
  arg = $3
  printed = 1;
  if (!pass1) {
    if ((bvalue != $2) || (nomovlb)) {
      print $0 "; bvalue " bvalue
    } else {
      print "; " $0 " ; bvalue " bvalue
    }
  }
  bvalue=$2;
}


function printgmatch()  {
  print "; gmatch rewrite= "
  for (i in gmatch_rewrite) {
    print ";[" i "]="gmatch_rewrite[i] 
  }
}

// {
  if (!gmatched) gmatch_state = 0;
  if (gmatch_state == 5) {
    if (pass1 && gmatch_labels[0] == gmatch_labels[2] &&
        gmatch_labels[1] == gmatch_labels[4]) {
      gmatch_rewrite[gmatch_labels[0]] = gmatch_labels[3];
      gmatch_kill[gmatch_labels[1]] = 1;
    }
  }
  gmatch_kill_current_goto = gmatch_kill_next_goto
  gmatch_kill_next_goto = "adanfxanwkunwuexafa"
  if (!pass1 && !printed) print;
}

/^\tend$/ {
  if (pass1) {
    pass1=0
    nextfile
  }
}

END {
  
}
