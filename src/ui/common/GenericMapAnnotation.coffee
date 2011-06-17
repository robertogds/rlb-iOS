class GenericMapAnnotation
  constructor: (id,latitude,longitude,title,subtitle) ->
    @annotation = Titanium.Map.createAnnotation
      latitude: latitude
      longitude: longitude
      title: title
      subtitle: subtitle
      pincolor:Titanium.Map.ANNOTATION_RED
      animate: true
      myid: id 
root.GenericMapAnnotation = GenericMapAnnotation