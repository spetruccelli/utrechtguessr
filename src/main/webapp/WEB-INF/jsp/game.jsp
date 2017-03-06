<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core_1_1" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Utrecht Guessr</title>
    <script async defer
            src="https://maps.googleapis.com/maps/api/js?key=AIzaSyARs25YxEdNMmX65Osv7B6VInIGM8R4DO0&callback=initMap&libraries=geometry">
    </script>
    <script src="../js/game.js"></script>
</head>
<body>
Ok... here we go.. :)
${message}


<div id="photos_plus_map">
<c:forEach items="${locationList}" var="location">
    <table style="border: blue 4px solid;" >
        <tr>
            <td><img src="${location.image}" style="width: 500px; height: 500px"/></td>
            <td style="width: 7px;">&nbsp;</td>
            <td><div id="map${location.id}" style="width: 500px; height: 500px"></div></td>
            <td style="width: 7px;">&nbsp;</td>
            <td style="width: 200px;text-align: left;" >Your score is: </td>
        </tr>
    </table>
</c:forEach>
</div>



    <script>
        function initMap() {
            var mapCenter = new google.maps.LatLng(52.09073739999999, 5.121420100000023);

//            //------------------------------------------//
//            var xmlhttp = new XMLHttpRequest();
//            var url = "../images/data.json";
//
//            xmlhttp.onreadystatechange = function() {
//                if (this.readyState == 4 && this.status == 200) {
//                    var myArr = JSON.parse(this.responseText);
//                    console.log(myArr);
//                }
//            };
//
//            xmlhttp.open("GET", url, true);
//            xmlhttp.send();
//
//            //------------------------------------------//
//

            var opt = {
                zoom: 14,
                maxZoom: 16,
                minZoom: 13,
                center: mapCenter
            };


            var map1 = new google.maps.Map(document.getElementById('map1'), opt);
            var listener1 = map1.addListener('click', function (e) {
                var clickedPosition = new google.maps.LatLng(e.latLng.lat(), e.latLng.lng());
                var actualPosition = new google.maps.LatLng(${locationList.get(0).latitude}, ${locationList.get(0).longitude});
                var marker1a = new google.maps.Marker({
                    position: clickedPosition,
                    map: map1,
                    icon: 'http://maps.google.com/mapfiles/ms/icons/green-dot.png',
                    title: 'your guess'
                });
                var marker1b = new google.maps.Marker({
                    position: actualPosition,
                    map: map1,
                    icon: 'http://maps.google.com/mapfiles/ms/icons/red-dot.png',
                    title: 'actual location'
                });
                google.maps.event.removeListener(listener1);
                alert("Afstand tot de werkelijke locatie is: " + google.maps.geometry.spherical.computeDistanceBetween(clickedPosition, actualPosition).toFixed(2) + " meter");
            });

            var map2 = new google.maps.Map(document.getElementById('map2'), opt);
            var listener2 = map2.addListener('click', function (e) {
                var clickedPosition = new google.maps.LatLng(e.latLng.lat(), e.latLng.lng());
                var actualPosition = new google.maps.LatLng(${locationList.get(1).latitude}, ${locationList.get(1).longitude});
                var marker2a = new google.maps.Marker({
                    position: clickedPosition,
                    map: map2,
                    icon: 'http://maps.google.com/mapfiles/ms/icons/green-dot.png',
                    title: 'your guess'
                });
                var marker2b = new google.maps.Marker({
                    position: actualPosition,
                    map: map2,
                    icon: 'http://maps.google.com/mapfiles/ms/icons/red-dot.png',
                    title: 'actual location'
                });
                google.maps.event.removeListener(listener2);
                alert("Afstand tot de werkelijke locatie is: " + google.maps.geometry.spherical.computeDistanceBetween(clickedPosition, actualPosition).toFixed(2) + " meter");
            });

            var map3 = new google.maps.Map(document.getElementById('map3'), opt);
            var listener3 = map3.addListener('click', function (e) {
                var clickedPosition = new google.maps.LatLng(e.latLng.lat(), e.latLng.lng());
                var actualPosition = new google.maps.LatLng(${locationList.get(2).latitude}, ${locationList.get(2).longitude});
                var marker3a = new google.maps.Marker({
                    position: clickedPosition,
                    map: map3,
                    icon: 'http://maps.google.com/mapfiles/ms/icons/green-dot.png',
                    title: 'your guess'
                });
                var marker3b = new google.maps.Marker({
                    position: actualPosition,
                    map: map3,
                    icon: 'http://maps.google.com/mapfiles/ms/icons/red-dot.png',
                    title: 'actual location'
                });
                google.maps.event.removeListener(listener3);
                alert("Afstand tot de werkelijke locatie is: " + google.maps.geometry.spherical.computeDistanceBetween(clickedPosition, actualPosition).toFixed(2) + " meter");
            });


        }
    </script>



</body>
</html>
