function gmap_show(lat, lng) {
  if ((lat == null) || (lng == null) ) {    // validation check if coordinates are there
    return 0;
  }

  handler = Gmaps.build('Google');    // map init
  handler.buildMap({ provider: {}, internal: {id: 'map'}}, function(){
    markers = handler.addMarkers([    // put marker method
      {
        "lat": lat,    // coordinates from parameter company
        "lng": lng,
        "picture": {    // setup marker icon
          "url": '/assets/orange-dot.png',
          "width":  32,
          "height": 32
        },
        "infowindow": "I live here"
      }
    ]);
    handler.bounds.extendWith(markers);
    handler.fitMapToBounds();
    handler.getMap().setZoom(5);    // set the default zoom of the map
  });
}
;
