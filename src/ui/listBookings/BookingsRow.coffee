class BookingsRow
  constructor: (booking) ->
     @row = Ti.UI.createTableViewRow
       hasChild: true
       booking: booking
       backgroundGradient:
         type:'linear'
         colors:[{color:'#093344',position:0.1},{color:'#0b222e',position:0.50},{color:'#0c1b24',position:1.0}]

      bookingLabel = Titanium.UI.createLabel
        text: booking.id + ' ' + booking.hotelName + ' ' + booking.priceCents + '€' 
        color: '#fff'
        font:
          fontSize: 16
          fontWeight: 'bold'
        left: 10
      @row.add(bookingLabel)

root.BookingsRow = BookingsRow