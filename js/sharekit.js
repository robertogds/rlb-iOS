(function() {
  root.sharekit = require("com.0x82.sharekit");
  root.sharekit.configure({
    exclude_services: ['Delicious', 'GoogleReader', 'ReadItLater', 'Instapaper', 'Tumblr'],
    my_app_name: 'ReallyLateBooking',
    my_app_url: 'http://reallylatebooking.com',
    shared_with_signature: false,
    twitter_consumer_key: 'qh0YsCgy4RyVPKciB9ID8A',
    twitter_consumer_secret: 'gdbjx3TieKZbFnDa23JKvRWcfhL3tBc089pOeEtFaQ',
    twitter_callback_url: 'http://reallylatebooking.com',
    facebook_key: '210123832352906',
    facebook_secret: '6b9d8250dbb6f8a1fc1698a6fcad7246',
    facebook_use_session_proxy: false,
    facebook_session_proxy_url: '',
    bar_style: 'UIBarStyleDefault'
  });
}).call(this);
