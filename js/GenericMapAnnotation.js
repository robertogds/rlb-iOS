(function() {
  var GenericMapAnnotation;
  GenericMapAnnotation = (function() {
    function GenericMapAnnotation(id, latitude, longitude, title, subtitle) {
      this.annotation = Titanium.Map.createAnnotation({
        latitude: latitude,
        longitude: longitude,
        title: title,
        subtitle: subtitle,
        pincolor: Titanium.Map.ANNOTATION_RED,
        animate: true,
        myid: id
      });
    }
    return GenericMapAnnotation;
  })();
  root.GenericMapAnnotation = GenericMapAnnotation;
}).call(this);
