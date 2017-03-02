<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Utrecht Guessr</title>
    <script async defer
            src="https://maps.googleapis.com/maps/api/js?key=AIzaSyARs25YxEdNMmX65Osv7B6VInIGM8R4DO0&callback=initMap&libraries=geometry">
    </script>
</head>
<body>
Ok... here we go.. :)
${message}

<div id="photo_plus_map">
    <div id="photo">
        <img src="${locationList.get(0).image}"/>
        <img src="${locationList.get(1).image}"/>
        <img src="${locationList.get(2).image}"/>
    </div>
    <div id="map" style="width: 800px; height: 600px"></div>

    <script>
        function initMap() {
            var myLatlng = new google.maps.LatLng(52.09073739999999, 5.121420100000023);

            var opt = {
                zoom: 14,
                maxZoom: 16,
                minZoom: 13,
                center: myLatlng
            };

            var map = new google.maps.Map(document.getElementById('map'), opt);

            var listener = map.addListener('click', function (e) {
                var clickedPosition = new google.maps.LatLng(e.latLng.lat(), e.latLng.lng());
                var actualPosition = new google.maps.LatLng(${locationList.get(0).latitude}, ${locationList.get(0).longitude});
                var marker1 = new google.maps.Marker({
                    position: clickedPosition,
                    map: map,
                    icon: 'http://maps.google.com/mapfiles/ms/icons/green-dot.png',
                    title: 'your guess'
                });
                var marker2 = new google.maps.Marker({
                    position: actualPosition,
                    map: map,
                    icon: 'http://maps.google.com/mapfiles/ms/icons/red-dot.png',
                    title: 'actual location'
                });
                google.maps.event.removeListener(listener);
                alert("Afstand tot de Dom is: " + google.maps.geometry.spherical.computeDistanceBetween(clickedPosition, actualPosition).toFixed(2) + " meter");
            });

        }
    </script>

</div>


</body>
</html>
