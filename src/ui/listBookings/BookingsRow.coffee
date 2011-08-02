class BookingsRow
  constructor: (booking) ->
     @row = Ti.UI.createTableViewRow
       hasChild: true
       rightImage: '/images/yellow_arrow.png'
       backgroundGradient: root.bgGradient
       booking: booking

root.BookingsRow = BookingsRow