$(function(){

    var $eventLatInput = $('#event_location_attributes_lat');
    var $eventLongInput = $('#event_location_attributes_long');
    var eventLat = $eventLatInput.val();
    var eventLong = $eventLongInput.val();
    var mapCenter;
    var zoom;
    if(eventLat.length > 0 && eventLong.length > 0){
        mapCenter = new google.maps.LatLng(eventLat, eventLong);
        zoom = 15;
    } else {
        mapCenter = new google.maps.LatLng(40.41331,-3.69392);
        zoom = 6;
    }

    var mapOptions = {
      center: mapCenter,
      zoom: zoom
    };
    var map = new google.maps.Map($('#map-canvas')[0], mapOptions);

    var marker = new google.maps.Marker({
        position: mapCenter,
        map: map,
        draggable: true
    });

    var geocoder = new google.maps.Geocoder();

    function codeAddress(address) {
        geocoder.geocode( { 'address': address}, function(results, status) {
          if (status == google.maps.GeocoderStatus.OK) {
            map.setCenter(results[0].geometry.location);
            map.setZoom(15);
            marker.setPosition(results[0].geometry.location);
          } else {
            alert("No hemos podido encontrar la dirección proporcionada");
          }
        });
    }

    function onAddressRequest(ev){
        ev.preventDefault();
        var address = $addressInput.val();
        codeAddress(address);
    }

    var $addressInput = $('#event_location_attributes_address');

    $addressInput.keypress(function(event) {
        if (event.which == 13) {
            onAddressRequest(event);
        }
    });

    var $searchAddressBtn = $('#searchAddress');

    $searchAddressBtn.on('click', function(event) {
        onAddressRequest(event);
    })

    google.maps.event.addListener(marker, 'position_changed', function() {
        var markerPos = marker.getPosition();
        var markerLat = markerPos.lat();
        var markerLong = markerPos.lng();
        $eventLatInput.val(markerLat);
        $eventLongInput.val(markerLong);
    });
})