root.expiresPicker = Titanium.UI.createPicker
  useSpinner:true

root.expiresPicker.addEventListener 'change', (e) ->
  if e.row.month_item
    root.cardExpiresMonth = e.row.month_item
  else if e.row.year_item
    root.cardExpiresYear = e.row.year_item
  1

monthColumn = Ti.UI.createPickerColumn({opacity:0})
monthColumn.addRow(Ti.UI.createPickerRow({title:L('jan'),month_item:'1'}))
monthColumn.addRow(Ti.UI.createPickerRow({title:L('feb'),month_item:'2'}))
monthColumn.addRow(Ti.UI.createPickerRow({title:L('mar'),month_item:'3'}))
monthColumn.addRow(Ti.UI.createPickerRow({title:L('apr'),month_item:'4'}))
monthColumn.addRow(Ti.UI.createPickerRow({title:L('may'),month_item:'5'}))
monthColumn.addRow(Ti.UI.createPickerRow({title:L('jun'),month_item:'6'}))
monthColumn.addRow(Ti.UI.createPickerRow({title:L('jul'),month_item:'7'}))
monthColumn.addRow(Ti.UI.createPickerRow({title:L('aug'),month_item:'8'}))
monthColumn.addRow(Ti.UI.createPickerRow({title:L('sep'),month_item:'9'}))
monthColumn.addRow(Ti.UI.createPickerRow({title:L('oct'),month_item:'10'}))
monthColumn.addRow(Ti.UI.createPickerRow({title:L('nov'),month_item:'11'}))
monthColumn.addRow(Ti.UI.createPickerRow({title:L('dec'),month_item:'12'}))

yearColumn = Ti.UI.createPickerColumn()
yearColumn.addRow(Ti.UI.createPickerRow({title:'2012',year_item:'2012'}))
yearColumn.addRow(Ti.UI.createPickerRow({title:'2013',year_item:'2013'}))
yearColumn.addRow(Ti.UI.createPickerRow({title:'2014',year_item:'2014'}))
yearColumn.addRow(Ti.UI.createPickerRow({title:'2015',year_item:'2015'}))
yearColumn.addRow(Ti.UI.createPickerRow({title:'2016',year_item:'2016'}))
yearColumn.addRow(Ti.UI.createPickerRow({title:'2017',year_item:'2017'}))
yearColumn.addRow(Ti.UI.createPickerRow({title:'2018',year_item:'2018'}))
yearColumn.addRow(Ti.UI.createPickerRow({title:'2019',year_item:'2019'}))
yearColumn.addRow(Ti.UI.createPickerRow({title:'2020',year_item:'2020'}))
yearColumn.addRow(Ti.UI.createPickerRow({title:'2021',year_item:'2021'}))
yearColumn.addRow(Ti.UI.createPickerRow({title:'2021',year_item:'2022'}))

# 2 columns as an array
#root.expiresPicker.add([monthColumn,yearColumn])
root.expiresPicker.add(monthColumn)
root.expiresPicker.add(yearColumn)

root.expiresPicker.selectionIndicator = true