(function() {
  root.zones = {};
  root.mockDeals = [
    {
      'hotelName': 'Petit Palace Embassy',
      'salePriceCents': 140,
      'roomType': 'lujo',
      'priceCents': 250
    }, {
      'hotelName': 'Hotel Regina',
      'salePriceCents': 135,
      'roomType': 'elegante',
      'priceDay2': 110,
      'priceCents': 200
    }, {
      'hotelName': 'Vincci Soho',
      'salePriceCents': 120,
      'roomType': 'confort',
      'priceCents': 180
    }
  ];
  root.mockCities = [
    {
      'name': 'A coruña',
      'url': 'a_coruna',
      'image': '/images/coruna.jpg',
      'hasZones': false,
      'latitude': '43.3417952463001',
      'longitude': '-8.40568243887656'
    }, {
      'name': 'Barcelona',
      'url': 'barcelona',
      'image': '/images/barcelona.jpg',
      'hasZones': false,
      'latitude': '41.3861686529528',
      'longitude': '2.16852657798428'
    }, {
      'name': 'Berlín',
      'url': 'berlin',
      'image': '/images/berlin.jpg',
      'hasZones': false,
      'latitude': '52.514809',
      'longitude': '13.465834'
    }, {
      'name': 'Bilbao',
      'url': 'bilbao',
      'image': '/images/bilbao.jpg',
      'hasZones': false,
      'latitude': '43.26262593',
      'longitude': '-2.93492407'
    }, {
      'name': 'Londres',
      'url': 'london',
      'image': '/images/london.jpg',
      'hasZones': false,
      'latitude': '51.496194',
      'longitude': '-0.179724'
    }, {
      'name': 'Madrid',
      'url': 'madrid',
      'image': '/images/madrid.jpg',
      'hasZones': true,
      'latitude': '40.4165037719591',
      'longitude': '-3.70576523796732'
    }, {
      'name': 'Milán',
      'url': 'milan',
      'image': '/images/milan.jpg',
      'hasZones': false,
      'latitude': '45.48953801 ',
      'longitude': '9.20102432'
    }, {
      'name': 'Málaga',
      'url': 'malaga',
      'image': '/images/malaga.jpg',
      'hasZones': false,
      'latitude': '36.72065391',
      'longitude': '-4.42140091'
    }, {
      'name': 'París',
      'url': 'paris',
      'image': '/images/paris.jpg',
      'hasZones': false,
      'latitude': '48.84991568 ',
      'longitude': '2.34298682'
    }, {
      'name': 'Santiago',
      'url': 'santiago',
      'image': '/images/santiago.jpg',
      'hasZones': false,
      'latitude': '42.8797739300837',
      'longitude': '-8.54217693925009'
    }, {
      'name': 'Sevilla',
      'url': 'sevilla',
      'image': '/images/sevilla.jpg',
      'hasZones': false,
      'latitude': '37.4090382917136',
      'longitude': '-5.99575904637746'
    }, {
      'name': 'Valencia',
      'url': 'valencia',
      'image': '/images/valencia.jpg',
      'hasZones': false,
      'latitude': '39.47305083',
      'longitude': '-0.3754655'
    }, {
      'name': 'Valladolid',
      'url': 'valladolid',
      'image': '/images/valladolid.png',
      'hasZones': false,
      'latitude': '41.64900974',
      'longitude': '-4.72485135'
    }, {
      'name': 'Zaragoza',
      'url': 'zaragoza',
      'image': '/images/zaragoza.png',
      'hasZones': false,
      'latitude': '41.63769007',
      'longitude': '-0.90407878'
    }
  ];
  root.zones['madrid'] = [
    {
      'name': 'Aeropuerto',
      'url': 'madrid_aeropuerto',
      'image': '/images/madrid.jpg'
    }, {
      'name': 'Norte',
      'url': 'madrid_norte',
      'image': '/images/madrid.jpg'
    }, {
      'name': 'Centro',
      'url': 'madrid_centro',
      'image': '/images/madrid.jpg'
    }
  ];
}).call(this);
