function loadMap(){
    var $eventLatInput = $('#event_location_lat');
    var $eventLongInput = $('#event_location_long');
    var eventLat = $eventLatInput.val();
    var eventLong = $eventLongInput.val();
    var mapCenter;
    var zoom;
    if(eventLat.length > 0 && eventLong.length > 0){
        mapCenter = new google.maps.LatLng(eventLat, eventLong);
        zoom = 15;
    } else {
        mapCenter = null;
    }

    if(mapCenter){
        var mapOptions = {
          center: mapCenter,
          zoom: zoom
        };

        var map = new google.maps.Map($('#map-canvas')[0], mapOptions);

        var marker = new google.maps.Marker({
            position: mapCenter,
            map: map,
            draggable: false
        });

        var contentString = '<a href="https://www.google.com/maps/place/'+mapCenter.lat()+','+mapCenter.lng()+'">'+
          'Ver en Google Maps</a> ';

      var infowindow = new google.maps.InfoWindow({
          content: contentString
      });
      google.maps.event.addListener(marker, 'click', function() {
        infowindow.open(map,marker);
      });
    }
}