<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core_1_1" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Utrecht Guessr</title>
    <script async defer
            src="https://maps.googleapis.com/maps/api/js?key=AIzaSyARs25YxEdNMmX65Osv7B6VInIGM8R4DO0&callback=initMap&libraries=geometry">
    </script>
    <script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
</head>
<body>
Ok... here we go.. :)
${message}

<div id="totalScore1" style="width: 1000px;text-align: left;color:RED">Your total score up to now is: 0 out of 100</div>


<div id="photos_plus_map">
    <c:forEach items="${locationList}" var="location">
        <table style="border: blue 4px solid;">
            <tr>
                <td><img src="${location.image}" style="width: 500px; height: 500px"/></td>
                <td style="width: 7px;">&nbsp;</td>
                <td>
                    <div id="map${location.id}" style="width: 500px; height: 500px"></div>
                </td>
                <td style="width: 7px;">&nbsp;</td>
            </tr>
            <tr>
                <td id="distance${location.id}" style="width: 200px;text-align: left;"> <p>Choose the location of the
                    picture shown</p>
                </td>
                <td id="score${location.id}" style="width: 200px;text-align: left;"></td>
            </tr>

        </table>
    </c:forEach>
</div>

<div id="totalScore2" style="width: 1000px;text-align: left;color:RED">Your total score up to now is: 0 out of 100</div>

<script>
    var totalScore = 0;

    function initMap() {
        var mapCenter = new google.maps.LatLng(52.09073739999999, 5.121420100000023);

        var opt = {
            zoom: 13,
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
            var score = calculateScore(distance, score);
            totalScore = totalScore + score;
            document.getElementById('totalScore1').textContent = "Your total score up to now is: " + totalScore + " out of 100";
            document.getElementById('totalScore2').textContent = "Your total score up to now is: " + totalScore + " out of 100";

            var distanceMessage = "Distance from the actual location: " + distance + " meter";
            var scoreMessage = "Your score: " + score + " out of 10";
            document.getElementById('distance${location.id}').textContent = distanceMessage;
            document.getElementById('score${location.id}').textContent = scoreMessage;


            $.ajax({
                url: '/score/addscore',
                type: 'POST',
                data: {id: ${location.id}, distance: distance, points: score},
                dataType: 'JSON',
                success: function (data) {

                }
            });

        });

        </c:forEach>


    }

    function calculateScore(distance, score) {
        if (distance < 30) {
            score = 10;
        }
        else if (distance < 50) {
            score = 9;
        }
        else if (distance < 100) {
            score = 8;
        }
        else if (distance < 500) {
            score = 7;
        }
        else if (distance < 1000) {
            score = 6;
        }
        else if (distance < 1500) {
            score = 5;
        }
        else if (distance < 2000) {
            score = 4;
        }
        else if (distance < 2500) {
            score = 3;
        }
        else if (distance < 3000) {
            score = 2;
        }
        else {
            score = 1;
        }
        return score;
    }

</script>

</body>
</html>
