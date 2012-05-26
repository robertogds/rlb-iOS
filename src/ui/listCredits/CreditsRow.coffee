class CreditsRow
	constructor: (credit) ->
		@row = Ti.UI.createTableViewRow
			hasChild: false
			backgroundGradient: root.bgGradient
		
		moneyLabel = Titanium.UI.createLabel
			text: credit.credits  + ' €' 
			color: '#fff'
			font:
				fontSize: 24
				fontWeight: 'bold'
			left: 10
			height: 60
		@row.add(moneyLabel)
		
		createdSubtitle = new root.GenericSubtitleLabel(35,80,L('coupon_created')+': ').label
		expireSubtitle = new root.GenericSubtitleLabel(35,200,L('coupon_expire')+': ').label
		@row.add(createdSubtitle)
		@row.add(expireSubtitle)
		titleLabel = new root.GenericBlueTitleLabel(5,80,credit.key+' - '+ credit.title).label		
		@row.add(titleLabel)
		createdLabel = new root.GenericTextLabel(35,130,credit.created).label
		expireLabel = new root.GenericTextLabel(35,250,credit.expire).label
		if credit.credits < 1
			expireLabel.text = L('expired')
			if credit.used is true
				expireLabel.text = L('used')
			expireLabel.color = '#7f0000'
		@row.add(createdLabel)
		@row.add(expireLabel)

root.CreditsRow = CreditsRow