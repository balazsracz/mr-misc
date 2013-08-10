#!/usr/bin/gawk -f

BEGIN {
  FS=":";
  printf "\\tlabel{resistors:}\n" > "resistors.tex"
  printf "\\tlabel{other:}\n" > "other.tex"
  printf "\\tlabel{unknown:}\n" > "unknown.tex"
  sumprice = 0;
}

// {
  type = "unknown";
}

// {
  cost_raw = $5;
  gsub(",", ".", cost_raw);
  value=strtonum(cost_raw);
  count=$3
  if (count) net_value=(value*count-40.0)/count; else net_value=1;

  chf_value=net_value/220.0 + 0.05;
  chf_value = int(chf_value / 0.05 + 0.99)*0.05
  lomex=$2
  description=$6
  split(description, descwords, " ");
  sumprice = sumprice + chf_value * count;
}


function lomexline() {
  return sprintf("{\\lomexline{%s}{%.2f}{%d}}", lomex, chf_value,count)
}

/0204/ {
  rtype = "0204";
  chf_value = 0.05;
}
/0207/ {
  rtype = "0207";
  chf_value = 0.05;
}
/0414/ {
  rtype = "0414";
  chf_value = 0.1;
}

/0204/|| /0207/ || /0414/ {
  type = "resistor";
  Pmax=0;
  fuse = ""
  if ($6 ~ / 0.4W/) Pmax=0.4;
  if ($6 ~ / 0.6W/) Pmax=0.6;
  if ($6 ~ / 0.5W/) {
    Pmax=0.5;
    fuse = "FUSIBLE"
  }
  if ($6 ~ / 2W/) Pmax=2;

  value_raw=descwords[1];
  if (value_raw ~ /[[:digit:]]+R[[:digit:]]*/) {
    gsub("R", ".", value_raw);
    exponent=1;
    exponentm="";
  } else if (value_raw ~ /[[:digit:]]+[kK][[:digit:]]*/) {
    gsub("[kK]", ".", value_raw);
    exponent=1e3;
    exponentm="k";
  } else if (value_raw ~ /[[:digit:]]+M[[:digit:]]*/) {
    gsub("[mM]", ".", value_raw);
    exponent=1e6;
    exponentm="M";
  } else {
    print "error: unknown resistor value: " value_raw >> "resistors.tex";
    next;
  }
  value = strtonum(value_raw) * exponent;
  Imax=sqrt(Pmax / value);
  imaxexp="";
  if (Imax < 0.1) {
    Imax *= 1000;
    imaxexp = "\\mathrm{m}";
  }
  Umax=sqrt(Pmax * value);
  if (Umax > 100) Umax = int(Umax);
  printf ("\\resistor{%s}{%.3g%s}" "{%.2f}{%.4g}{%.2g%s}{%s}%s\n"),
      rtype, value_raw, exponentm,
      Pmax, Umax, Imax, imaxexp, fuse, lomexline() >> "resistors.tex"
  next;
}

/:DIP[[:digit:]]/ {
  diptype = descwords[1];
  width = strtonum(descwords[2])
  printf "\\dipsocket{%s}{%.1f}%s\n", diptype, width*1.0/10, lomexline() >> "other.tex"
  next;
}

/BZX/ {
  voltage = descwords[1];
  power_str = descwords[3];
  type_str = descwords[5];
  package = descwords[8];
  Imax = strtonum(power_str)*1.0/strtonum(voltage);
  imaxexp="";
  if (Imax < 0.1) {
    Imax *= 1000;
    imaxexp = "\\mathrm{m}";
  }
  printf "\\zener{%s}{%s}{%s}{%s}{%.2g%s}%s\n",
      voltage, package, type_str, power_str, Imax, imaxexp, lomexline() >> "other.tex"
  next;
}

/:[[:digit:]]+[unp]F/ {
  capacitance = descwords[1];
  voltage = substr(descwords[2], 1, length(descwords[2]) - 1);
  prec = descwords[5];
  gsub("%","\\%",prec);
  if (/CER/) {
    name = "cercap";
    size = descwords[4];
  } else {
    name = "elco"; 
    size = descwords[3];
  }
  printf "\\%s{%s}{%s}{%s}{%s}%s\n",
      name, capacitance, voltage, prec, size, lomexline() >> "other.tex"
  next;
}

/QUARZ/ {
  mhz=descwords[1];
  printf "\\crystal{%s}%s\n", mhz, lomexline() >> "other.tex"
}


// {
  print type ":" chf_value ":" $0
  printf "\\unknown{%s}%s\n", description, lomexline() >> "unknown.tex"
}

END {
  printf "\\filllabel{}\n\\filllabel{}\n\\filllabel{}\n" >> "resistors.tex";
  printf "\\filllabel{}\n\\filllabel{}\n\\filllabel{}\n" >> "other.tex";
  print "sum price" sumprice;
}
