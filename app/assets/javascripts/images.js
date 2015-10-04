$(document).ready(function() {

  if(typeof(gon) == "undefined") {
    return ;
  }

  // Get coordinates from events for plotting
  var events = gon.events;
  validEvents = _.filter(events, function(e) {
    return e.latitude && e.longitude;
  });
  var coordinates = _.map(validEvents, function(e) {
    return [e.latitude, e.longitude];
  });
  coordinates = _.uniq(coordinates, function(item, key, a) {
    return item[0] + ":" + item[1];
  });
  console.log(coordinates);

  // Plot map and coordinates
  var Map = (function () {
    var mapCenter = new google.maps.LatLng(0, 0),
        mapCanvas = document.getElementById('map_canvas'),
        mapOptions = {
          center: mapCenter,
          zoom: 2,
          scrollwheel: true,
          draggable: true,
          disableDefaultUI: true,
          mapTypeId: google.maps.MapTypeId.ROADMAP
        },
        map = new google.maps.Map(mapCanvas, mapOptions),
        contentString =
          '<div id="content">'+
          '<div id="siteNotice">'+
          '</div>'+
          '<h1 id="firstHeading" class="firstHeading">Loc:</h1>'+
          '<p></p>' +
          '<div id="bodyContent"'+
          '</div>'+
          '</div>',
        infowindow = new google.maps.InfoWindow({
          content: contentString,
          maxWidth: 300
        })
    
    var getMarker = function(coordinate) {
        var loc = new google.maps.LatLng(coordinate[0], coordinate[1]),
        marker = new google.maps.Marker({
          position: loc,
          map: map
        });
        return marker
    }

    return {
      init: function () {
        map.set('styles', [{
          featureType: 'landscape',
          elementType: 'geometry',
          stylers: [
            { hue: '#ffff00' },
            { saturation: 30 },
            { lightness: 10}
          ]}
        ]);
        coordinates.forEach(function(coord) {
          var marker = getMarker(coord);
          google.maps.event.addListener(marker, 'click', function () {
            infowindow.open(map, marker);
          });
        });        
      }
    };
  }());

  Map.init();
});
