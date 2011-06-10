(function() {
  var buttonView, infoLabel, monthColumn, pickerView, yearColumn;
  root.expiresView = Titanium.UI.createView({
    background: 'transparent',
    borderWidth: 0,
    width: 320,
    top: 100
  });
  pickerView = Titanium.UI.createView({
    background: 'transparent',
    top: 150
  });
  buttonView = Titanium.UI.createView({
    backgroundColor: '#75757f',
    opacity: 0.9,
    top: 0
  });
  root.expiresPicker = Titanium.UI.createPicker();
  root.expiresPicker.addEventListener('change', function(e) {
    Ti.API.info("You selected row: " + e.row + ", column: " + e.column + ", custom_item: " + e.row.custom_item);
    if (e.row.month_item) {
      root.cardExpiresMonth = e.row.month_item;
    } else if (e.row.year_item) {
      root.cardExpiresYear = e.row.year_item;
    }
    return 1;
  });
  monthColumn = Ti.UI.createPickerColumn({
    opacity: 0
  });
  monthColumn.addRow(Ti.UI.createPickerRow({
    title: 'Enero',
    month_item: '1'
  }));
  monthColumn.addRow(Ti.UI.createPickerRow({
    title: 'Febrero',
    month_item: '2'
  }));
  monthColumn.addRow(Ti.UI.createPickerRow({
    title: 'Marzo',
    month_item: '3'
  }));
  monthColumn.addRow(Ti.UI.createPickerRow({
    title: 'Abril',
    month_item: '4'
  }));
  monthColumn.addRow(Ti.UI.createPickerRow({
    title: 'Mayo',
    month_item: '5'
  }));
  monthColumn.addRow(Ti.UI.createPickerRow({
    title: 'Junio',
    month_item: '6'
  }));
  monthColumn.addRow(Ti.UI.createPickerRow({
    title: 'Julio',
    month_item: '7'
  }));
  monthColumn.addRow(Ti.UI.createPickerRow({
    title: 'Agosto',
    month_item: '8'
  }));
  monthColumn.addRow(Ti.UI.createPickerRow({
    title: 'Septiembre',
    month_item: '9'
  }));
  monthColumn.addRow(Ti.UI.createPickerRow({
    title: 'Octubre',
    month_item: '10'
  }));
  monthColumn.addRow(Ti.UI.createPickerRow({
    title: 'Noviembre',
    month_item: '11'
  }));
  monthColumn.addRow(Ti.UI.createPickerRow({
    title: 'Diciembre',
    month_item: '12'
  }));
  yearColumn = Ti.UI.createPickerColumn();
  yearColumn.addRow(Ti.UI.createPickerRow({
    title: '2011',
    year_item: '2011'
  }));
  yearColumn.addRow(Ti.UI.createPickerRow({
    title: '2012',
    year_item: '2012'
  }));
  yearColumn.addRow(Ti.UI.createPickerRow({
    title: '2013',
    year_item: '2013'
  }));
  yearColumn.addRow(Ti.UI.createPickerRow({
    title: '2014',
    year_item: '2014'
  }));
  yearColumn.addRow(Ti.UI.createPickerRow({
    title: '2015',
    year_item: '2015'
  }));
  yearColumn.addRow(Ti.UI.createPickerRow({
    title: '2016',
    year_item: '2016'
  }));
  yearColumn.addRow(Ti.UI.createPickerRow({
    title: '2017',
    year_item: '2017'
  }));
  yearColumn.addRow(Ti.UI.createPickerRow({
    title: '2018',
    year_item: '2018'
  }));
  yearColumn.addRow(Ti.UI.createPickerRow({
    title: '2019',
    year_item: '2019'
  }));
  yearColumn.addRow(Ti.UI.createPickerRow({
    title: '2020',
    year_item: '2020'
  }));
  yearColumn.addRow(Ti.UI.createPickerRow({
    title: '2021',
    year_item: '2021'
  }));
  root.expiresPicker.add([monthColumn, yearColumn]);
  root.expiresPicker.selectionIndicator = true;
  infoLabel = Titanium.UI.createLabel({
    width: 320,
    height: 60,
    textAlign: 'center',
    text: 'Indica la fecha de caducidad',
    color: '#fff',
    font: {
      fontSize: 14,
      fontWeight: 'normal',
      fontFamily: 'Helvetica Neue'
    },
    top: 0
  });
  root.expiresButton = Titanium.UI.createButton({
    backgroundImage: 'images/BUTT_gry_off.png',
    backgroundSelectedImage: 'images/BUTT_gry_on.png',
    backgroundDisabledImage: 'images/BUTT_drk_off.png',
    borderWidth: 0,
    color: '#000',
    title: 'Hecho',
    width: 220,
    height: 40,
    font: {
      fontSize: 20,
      fontWeight: 'bold',
      fontFamily: 'Helvetica Neue'
    },
    top: 50
  });
  root.expiresButton.addEventListener('click', function(e) {
    root.expiresView.hide();
    root.expiresLabel.text = root.cardExpiresMonth + '/' + root.cardExpiresYear;
    return 1;
  });
  pickerView.add(root.expiresPicker);
  buttonView.add(infoLabel);
  buttonView.add(root.expiresButton);
  root.expiresView.add(buttonView);
  root.expiresView.add(pickerView);
  root.expiresView.hide();
}).call(this);
