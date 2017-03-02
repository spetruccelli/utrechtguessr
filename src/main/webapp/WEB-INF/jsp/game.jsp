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
    ${location.image}

    <div id="photo_plus_map">
        <div id = "photo">
            <%--<img src="https://maps.googleapis.com/maps/api/streetview?size=400x400&location=Wilhelminapark,Utrecht&fov=90&heading=235&pitch=10 &key=AIzaSyCfqW-2mC1LcI-7cDDzSuXxMwY5uvHHg44">--%>
            <img src="${location.image}">
                <%--<img src="/images/image1.jpg">--%>
        </div>
        <div id="map" style="width: 800px; height: 600px"></div>

        <script>
            function initMap() {
                var myLatlng = new google.maps.LatLng(52.09073739999999, 5.121420100000023);

                var opt = { zoom: 14,
                    maxZoom: 16,
                    minZoom: 13,
                    center: myLatlng };

                var map = new google.maps.Map(document.getElementById('map'), opt);

                var listener1 = map.addListener('click', function(e) {
                    var clickedPosition = new google.maps.LatLng(e.latLng.lat(), e.latLng.lng());
//                    var actualPosition = new google.maps.LatLng(52.09073739999999, 5.121420100000023);
                    var actualPosition = new google.maps.LatLng(${location.latitude}, ${location.longitude});
                    var marker = new google.maps.Marker({
                        position: clickedPosition,
                        map: map,
                        icon:'http://maps.google.com/mapfiles/ms/icons/green-dot.png',
                        title: 'your guess'
                    });
                    var marker2 = new google.maps.Marker({
                        position: actualPosition,
                        map: map,
                        icon:'http://maps.google.com/mapfiles/ms/icons/red-dot.png',
                        title: 'actual location'
                    });
                    google.maps.event.removeListener(listener1);
                    alert("Afstand tot de Dom is: " + google.maps.geometry.spherical.computeDistanceBetween(clickedPosition, actualPosition).toFixed(2) + " meter");
                });

            }
        </script>

    </div>


</body>
</html>
