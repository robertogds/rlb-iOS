(function() {

  Titanium.UI.setBackgroundColor('black');

  root.citiesWindow = new root.GenericWindow(L('cities')).win;

  root.countriesWindow = new root.GenericWindow(L('countries')).win;

  root.listDealsWindow = new root.GenericWindow('Madrid').win;

  root.listDealsMapWindow = new root.GenericWindow(L('map')).win;

  root.bookingsWindow = new root.GenericWindow(L('yourBookings')).win;

  root.accountWindow = new root.GenericWindow(L('profile')).win;

  root.oneDealWindow = new root.GenericWindow('').win;

  root.oneBookingWindow = new root.GenericWindow(L('booking')).win;

  root.optionsWindow = new root.GenericWindow(L('options')).win;

  root.imagesWindow = new root.GenericWindow(L('photos')).win;

  root.newAccountWindow = new root.GenericWindow(L('newAccount')).win;

  root.editAccountWindow = new root.GenericWindow(L('editAccount')).win;

  root.confirmBookingWindow = new root.GenericWindow(L('orderSummary')).win;

  root.supportWindow = new root.GenericWindow(L('userSupport')).win;

  root.errorWindow = new root.GenericWindow('Error').win;

  root.aboutWindow = new root.GenericWindow(L('about')).win;

  root.forHotelsWindow = new root.GenericWindow(L('toHotels')).win;

  root.termsWindow = new root.GenericWindow(L('terms')).win;

  root.privacyWindow = new root.GenericWindow(L('privacy')).win;

  root.rememberPassWindow = new root.GenericWindow(L('resetPassword')).win;

  root.paymentWindow = new root.GenericWindow(L('creditCard')).win;

  root.bookingForWindow = new root.GenericWindow(L('bookingFor')).win;

  root.nightsWindow = new root.GenericWindow(L('extraNights')).win;

  root.why3Window = new root.GenericWindow('ReallyLateBooking').win;

  root.imagesWindow.backButtonTitle = L('back');

  root.imagesWindow.tabBarHidden = true;

  root.tabGroup = Titanium.UI.createTabGroup({
    barColor: 'black',
    id: 'tabGroup'
  });

  root.dealsTab = Titanium.UI.createTab({
    icon: 'icons/icon_deal.png',
    title: L('cities'),
    window: root.citiesWindow
  });

  root.bookingTab = Titanium.UI.createTab({
    icon: 'icons/icon_buy.png',
    title: L('bookings'),
    window: root.bookingsWindow
  });

  root.accountTab = Titanium.UI.createTab({
    icon: 'icons/icon_user.png',
    title: L('profile'),
    window: root.accountWindow
  });

  root.optionsTab = Titanium.UI.createTab({
    icon: 'icons/icon_conf.png',
    title: L('options'),
    window: root.optionsWindow
  });

  root.tabGroup.addTab(root.dealsTab);

  root.tabGroup.addTab(root.bookingTab);

  root.tabGroup.addTab(root.accountTab);

  root.tabGroup.addTab(root.optionsTab);

  root.tabGroup.open();

  root.showError = function(window) {
    root.errorWindow = window;
    return window.add(root.errorView);
  };

}).call(this);
