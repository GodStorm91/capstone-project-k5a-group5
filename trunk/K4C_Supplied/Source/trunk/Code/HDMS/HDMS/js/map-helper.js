var goMap = $.goMap;

var addOneMarkerInMap = function () {
    google.maps.event.addListener(goMap.map, 'click', function (event) {
        if (!goMap.singleMarker) {
            var options = {
                position: event.latLng,
                draggable: true
            };

            var marker = goMap.createMarker(options);
            goMap.singleMarker = true;

            google.maps.event.addListener(marker, 'dblclick', function (event) {
                marker.setMap(null);
                goMap.removeMarker(marker.id);
                goMap.singleMarker = false;
            });
        }
    });
};