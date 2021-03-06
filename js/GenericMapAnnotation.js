(function() {
  var GenericMapAnnotation;

  GenericMapAnnotation = (function() {

    function GenericMapAnnotation(id, latitude, longitude, title, subtitle, rightView) {
      this.annotation = Titanium.Map.createAnnotation({
        latitude: latitude,
        longitude: longitude,
        title: title,
        subtitle: subtitle,
        pincolor: Titanium.Map.ANNOTATION_RED,
        animate: true,
        rightView: rightView,
        myid: id
      });
    }

    return GenericMapAnnotation;

  })();

  root.GenericMapAnnotation = GenericMapAnnotation;

}).call(this);
