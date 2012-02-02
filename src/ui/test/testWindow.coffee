root.testWindow = new root.GenericWindow('Table Test').win
data = [
	{title: 'Adam', header: 'A'}
	{title: 'Alex'}
	{title: 'August'}
	{title: 'Beth', header: 'B'}
	{title: 'Bradley'}
	{title: 'Brandom'}
	{title: 'Chris', header: 'C'}
	{title: 'Christine'}
	{title: 'Cristina'}
	{title: 'Dave', header: 'D'}
	{title: 'David'}
	{title: 'Donald'}
	{title: 'Edward', header: 'E'}
	{title: 'Ernest'}
	{title: 'Eric'}
	]
	
tableViewOptions = {data: data}

tableview = Titanium.UI.createTableView(tableViewOptions)
root.testWindow.add(tableview)
tableview.scrollToIndex(10)