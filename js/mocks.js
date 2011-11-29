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
      'hasZones': false
    }, {
      'name': 'Barcelona',
      'url': 'barcelona',
      'image': '/images/barcelona.jpg',
      'hasZones': false
    }, {
      'name': 'Berlín',
      'url': 'berlin',
      'image': '/images/berlin.jpg',
      'hasZones': false
    }, {
      'name': 'Bilbao',
      'url': 'bilbao',
      'image': '/images/bilbao.jpg',
      'hasZones': false
    }, {
      'name': 'Londres',
      'url': 'london',
      'image': '/images/london.jpg',
      'hasZones': false
    }, {
      'name': 'Madrid',
      'url': 'madrid',
      'image': '/images/madrid.jpg',
      'hasZones': true
    }, {
      'name': 'Milán',
      'url': 'milan',
      'image': '/images/milan.jpg',
      'hasZones': false
    }, {
      'name': 'Málaga',
      'url': 'malaga',
      'image': '/images/malaga.jpg',
      'hasZones': false
    }, {
      'name': 'París',
      'url': 'paris',
      'image': '/images/paris.jpg',
      'hasZones': false
    }, {
      'name': 'Santiago',
      'url': 'santiago',
      'image': '/images/santiago.jpg',
      'hasZones': false
    }, {
      'name': 'Sevilla',
      'url': 'sevilla',
      'image': '/images/sevilla.jpg',
      'hasZones': false
    }, {
      'name': 'Valencia',
      'url': 'valencia',
      'image': '/images/valencia.jpg',
      'hasZones': false
    }, {
      'name': 'Valladolid',
      'url': 'valladolid',
      'image': '/images/valladolid.png',
      'hasZones': false
    }, {
      'name': 'Zaragoza',
      'url': 'zaragoza',
      'image': '/images/zaragoza.png',
      'hasZones': false
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
