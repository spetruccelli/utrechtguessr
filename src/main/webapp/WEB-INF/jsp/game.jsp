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


<%--<c:forEach items="${scoreList}" var="score">--%>
    <%--<table style="border: blue 4px solid;" >--%>
        <%--<tr>--%>
            <%--<td >${score.id} </td>--%>
            <%--<td >${score.distance} </td>--%>
            <%--<td >${score.points} </td>--%>
        <%--</tr>--%>
    <%--</table>--%>
<%--</c:forEach>--%>


<div id="photos_plus_map">
<c:forEach items="${locationList}" var="location">
    <table style="border: blue 4px solid;" >
        <tr>
            <td><img src="${location.image}" style="width: 500px; height: 500px"/></td>
            <td style="width: 7px;">&nbsp;</td>
            <td><div id="map${location.id}" style="width: 500px; height: 500px"></div></td>
            <td style="width: 7px;">&nbsp;</td>
            <td id="distance${location.id}" style="width: 200px;text-align: left;" > Choose the location of the picture shown</td>
            <td id="score${location.id}" style="width: 200px;text-align: left;" > </td>
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


            <c:forEach items="${locationList}" var="location">

            var map${location.id} = new google.maps.Map(document.getElementById('map${location.id}'), opt);
            var listener${location.id} = map${location.id}.addListener('click', function (e) {
                var clickedPosition = new google.maps.LatLng(e.latLng.lat(), e.latLng.lng());
                var actualPosition = new google.maps.LatLng(${location.latitude}, ${location.longitude});
                var marker${location.id}a = new google.maps.Marker({
                    position: clickedPosition,
                    map: map${location.id},
                    icon: 'http://maps.google.com/mapfiles/ms/icons/green-dot.png',
                    title: 'your guess'
                });
                var marker${location.id}b = new google.maps.Marker({
                    position: actualPosition,
                    map: map${location.id},
                    icon: 'http://maps.google.com/mapfiles/ms/icons/red-dot.png',
                    title: 'actual location ${location.id}'
                });
                google.maps.event.removeListener(listener${location.id});
                var distance = google.maps.geometry.spherical.computeDistanceBetween(clickedPosition, actualPosition).toFixed(2);
                var distanceMessage = "Afstand tot de werkelijke locatie is: " + google.maps.geometry.spherical.computeDistanceBetween(clickedPosition, actualPosition).toFixed(2) + " meter";
                var scoreMessage = "Je score is: 5";
                document.getElementById('distance${location.id}').textContent = distanceMessage;
                document.getElementById('score${location.id}').textContent = scoreMessage;

            });

            </c:forEach>


        }
    </script>


</body>
</html>
