var GoogleSpreadsheet = require('google-spreadsheet');
var async = require('async');
var trim = require('trim');
var SerialPort = require('serialport');

// spreadsheet key is the long id in the sheets URL 
var doc = new GoogleSpreadsheet('1kJRyywHc4ca6B0WiCN4F4WyukNorzj3YCU0LPewcK2A');
var sheet;

var portName;
var expectedSerial = 'usb-Microchip_Technology_Inc._Training_Board-if00'
var port_obj;


function get_sheet_name() {
    var date = new Date();
    return '' + date.getUTCFullYear() + '-' + date.getUTCMonth();
}

function add_entry_to_sheet(e) {
    var payload = String(e);
    var row = {
        timestamp: Date.now(),
        entry: payload
    };
    console.log(row);
    sheet.addRow(row, function() {});
}

function setAuth(step) {
    // see notes below for authentication instructions! 
    var creds = require('./cred.json');
    doc.useServiceAccountAuth(creds, step);
}

function retriable(fun) {
    var numTry = 1;
    function retry() {
        ++numTry;
        console.log("waiting before try " + numTry);
        setTimeout(singletry, 1000);
    }
    function singletry() {
        fun(retry);
    }
    singletry();
}

function getSheets(step) {
    sheetName = get_sheet_name();
    retriable(function(retry) {
        doc.getInfo(function(err, info) {
            if (err) { console.log('failed getsheets'); retry(); return;}
            console.log(info);
            sheet = undefined;
            info.worksheets.forEach(function(sh) {
                if (sh.title == sheetName) {
                    sheet = sh;
                }
            });
            step();
        });
    });
}

function maybeCreateSheet(step) {
    if (sheet) { step(); return; }
    retriable(function(retry) {
        doc.addWorksheet({
            title: sheetName
        }, function(err, sh) {
            if (err) { 
                console.log("error adding sheet: " + err);
                retry();
                return;
            }
            sheet = sh;
            // change a sheet's title 
            sheet.setTitle(sheetName); //async 
            //resize a sheet 
            sheet.resize({rowCount: 1, colCount: 2}); //async 
            sheet.setHeaderRow(['timestamp', 'entry']); //async 
            step();
        });
    });
}

function log_data_entry(entry) {
    var sheetName = get_sheet_name();
    if (sheet && (sheet.title == sheetName)) {
        add_entry_to_sheet(entry);
    } else {
        async.series([
            setAuth,
            getSheets,
            maybeCreateSheet,
            function addEntry(step) {
                add_entry_to_sheet(entry);
            }
        ]);
    }
}


function process_incoming_data(data) {
    var text = trim(String(data));
    console.log('data received: "' + text + '"');
    log_data_entry(text);
}

function serialport_tryfind(step) {
    SerialPort.list(function(err, ports) {
        ports.forEach(function(port) {
            if (port.pnpId == expectedSerial) {
                console.log("found port: " + port.comName);
                portName = port.comName;
            }
        });
        if (!portName) {
            console.log('Could not find serial port \'' + expectedSerial + '\'. Is the board plugged in?');
            console.log('Known serial ports:');
            ports.forEach(function(port) {
                console.log('port "' + port.comName +
                            '" pnp id: \'' + port.pnpId +
                            '\' manufacturer: ' + port.manufacturer);
            });
        } else {
            step();
        }
    });
}

function serialport_open(step) {
    console.log('Opening ' + portName);
    var openerror = function(error) {
        console.log(
            'Failed to open serial port ' + portdev + ': ' + error);
    }
    try {
        port_obj = new SerialPort(portName, {baudrate: 115200});
    } catch (err) {
        openerror(err);
        process.exit(1);
    }
    port_obj.on('open', function(error) {
        if (error) { openerror(error); return; }
        console.log("Opened " + portName);
        port_obj.on('close', function() {
            console.log("Serial port " + portName + " closed.");
            process.exit(1);
        });
        port_obj.on('error', function(err) {
            console.log('error on serial port ' + portName + ': ' + err);
            port_obj.close();
            process.exit(1);
        });
        port_obj.on('data', function(data) {
            process_incoming_data(data);
        });
        step();
    });
}

async.series([
    serialport_tryfind,
    serialport_open,
    setAuth,
    getSheets,
    maybeCreateSheet
]);
var rest = [
  function getInfoAndWorksheets(step) {
      retriable(function(retry) {
          doc.getInfo(function(err, info) {
              if (err) {console.log('error getting sheet info'); retry(); return;}
              console.log(info);
              console.log('Loaded doc: '+info.title+' by '+info.author.email);
              sheet = info.worksheets[0];
              console.log('sheet 1: '+sheet.title+' '+sheet.rowCount+'x'+sheet.colCount);
              step();
          });
      });
  },
  function workingWithRows(step) {
    // google provides some query options 
    sheet.getRows({
      offset: 1,
      limit: 20,
      orderby: 'col2'
    }, function( err, rows ){
      console.log('Read '+rows.length+' rows');
 
      console.log('row 0 ', rows[0]);
      console.log('row 1 ', rows[1]);
      console.log('row 2 ', rows[2]);

      // the row is an object with keys set by the column headers 
      //rows[0].colname = 'new val';
      //rows[0].save(); // this is async 
 
      // deleting a row 
      //rows[0].del();  // this is async 
 
      step();
    });
  }
];
