
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Utrecht Guessr</title>
    <script async defer
            src="https://maps.googleapis.com/maps/api/js?key=AIzaSyARs25YxEdNMmX65Osv7B6VInIGM8R4DO0&callback=initMap">
    </script>
</head>
<body>
    Ok... here we go.. :)
    ${message}




    <div id="photo_plus_map">
        <div id = "photo">
            <img src="https://maps.googleapis.com/maps/api/streetview?size=400x400&location=Wilhelminapark,Utrecht&fov=90&heading=235&pitch=10 &key=AIzaSyCfqW-2mC1LcI-7cDDzSuXxMwY5uvHHg44">
        </div>
        <div id="map" style="width: 800px; height: 600px"></div>

        <script>
            function initMap() {
                var myLatlng = {lat: 52.09073739999999, lng: 5.121420100000023};

                var map = new google.maps.Map(document.getElementById('map'), {
                    zoom: 14,
                    center: myLatlng
                });


                map.addListener('center_changed', function() {
                    // 3 seconds after the center of the map has changed, pan back to the
                    // marker.
                    window.setTimeout(function() {
                        map.panTo(marker.getPosition());
                    }, 3000);
                });

                map.addListener('click', function(e) {
//                    alert("Latitude: " + e.latLng.lat() + "\r\nLongitude: " + e.latLng.lng());
                    var clickedPosition = {lat: e.latLng.lat(), lng: e.latLng.lng()};
                    var marker = new google.maps.Marker({
                        position: clickedPosition,
                        map: map,
//                        icon: 'http://www.googlemapsmarkers.com/v1/A/0099FF/',
                        icon:'http://maps.google.com/mapfiles/ms/icons/green-dot.png',
                        title: 'your guess'
                    });
                });

            }
        </script>

    </div>


</body>
</html>
