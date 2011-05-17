root.cargarDeal = (deal) ->
  root.oneDealWindow.title = deal.hotelName
  root.oneDealImage.image = deal.image1 
  root.oneDealPriceLabel.text = deal.salePriceCents + "€" + '  Sólo Esta Noche'
  root.descriptionLabel.text = deal.description

  root.oneDealView.add(root.oneDealImage)
  root.oneDealView.add(root.oneDealPriceLabel)
  root.oneDealView.add(root.buyButton)
  root.oneDealView.add(root.descriptionLabel)  
  
  root.oneDealWindow.add(root.oneDealView)
  root.oneDealWindow