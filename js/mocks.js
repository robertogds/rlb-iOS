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
      'image': '/images/RLB_a coruña_def.png',
      'hasZones': false
    }, {
      'name': 'Barcelona',
      'url': 'barcelona',
      'image': '/images/RLB_barcelona_def.png',
      'hasZones': false
    }, {
      'name': 'Berlín',
      'url': 'berlin',
      'image': '/images/RLB_berlin_def.png',
      'hasZones': false
    }, {
      'name': 'Bilbao',
      'url': 'bilbao',
      'image': '/images/RLB_bilbao_def.png',
      'hasZones': false
    }, {
      'name': 'Londres',
      'url': 'london',
      'image': '/images/RLB_london_def.png',
      'hasZones': false
    }, {
      'name': 'Madrid',
      'url': 'madrid',
      'image': '/images/RLB_madrid_def.png',
      'hasZones': true
    }, {
      'name': 'Milán',
      'url': 'milan',
      'image': '/images/RLB_milan_def.png',
      'hasZones': false
    }, {
      'name': 'Málaga',
      'url': 'malaga',
      'image': '/images/RLB_santiago_300pp.png',
      'hasZones': false
    }, {
      'name': 'París',
      'url': 'paris',
      'image': '/images/RLB_santiago_150pp.png',
      'hasZones': false
    }, {
      'name': 'Santiago',
      'url': 'santiago',
      'image': '/images/RLB_santiago_def.tif',
      'hasZones': false
    }, {
      'name': 'Sevilla',
      'url': 'sevilla',
      'image': '/images/RLB_santiago_150pp.png',
      'hasZones': false
    }, {
      'name': 'Valencia',
      'url': 'valencia',
      'image': '/images/RLB_santiago_107.jpg',
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
