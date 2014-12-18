$(function(){
    var mapCenter = new google.maps.LatLng(40.41331,-3.69392);
    var mapOptions = {
      center: mapCenter,
      zoom: 6
    };
    var map = new google.maps.Map($('#map-canvas')[0], mapOptions);

    var marker = new google.maps.Marker({
        position: mapCenter,
        map: map,
        draggable:true
    });
})