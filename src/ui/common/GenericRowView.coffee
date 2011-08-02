class GenericRowView
  constructor: (top,text) ->
    @view = Titanium.UI.createView
      background: 'transparent'
      top:top
    table = Titanium.UI.createTableView
      top: 10
      height: 40
      width: '95%'
      borderWidth:0
      borderRadius: 10
      scrollable: false
      moving: false
      backgroundColor: '#fff'
    @label = Titanium.UI.createLabel
      width: '100%'
      height: '100%'
      text: text
      color: '#000'
      left: 8
      font:
        fontSize: 15
        fontWeight: 'bold'
    section = Titanium.UI.createTableViewSection()
    data = []
    row = Titanium.UI.createTableViewRow(hasChild:true)
    row.add(@label)
    section.add(row)
    data[0] = section
    table.data = data
    @view.add(table)

root.GenericRowView = GenericRowView