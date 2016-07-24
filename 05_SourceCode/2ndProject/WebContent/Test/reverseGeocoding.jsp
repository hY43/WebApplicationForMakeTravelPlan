<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html>
  <head>
    <meta name="viewport" content="initial-scale=1.0, user-scalable=no">
    <meta charset="utf-8">
    <title>Reverse Geocoding</title>
    <style>
      html, body {
        height: 500px;
        margin: 0;
        padding: 0;
      }
      #map {
        height: 500px;
      }
#floating-panel {
  position: absolute;
  top: 10px;
  left: 25%;
  z-index: 5;
  background-color: #fff;
  padding: 5px;
  border: 1px solid #999;
  text-align: center;
  font-family: 'Roboto','sans-serif';
  line-height: 30px;
  padding-left: 10px;
}

    </style>
    <style>
      #floating-panel {
        position: absolute;
        top: 5px;
        left: 50%;
        margin-left: -180px;
        width: 350px;
        z-index: 5;
        background-color: #fff;
        padding: 5px;
        border: 1px solid #999;
      }
      #latlng {
        width: 225px;
      }
    </style>
  </head>
  <body>
    <div id="floating-panel">
      <input id="latlng" type="text" value="40.714224,-73.961452">
      <input id="submit" type="button" value="Reverse Geocode">
    </div>
    <div id="map"></div>
    <script>
function initMap() {
	var markerArray = []; //markerArray생성
	var directionsService = new google.maps.DirectionsService; //길찾기 서비스 인스턴스화
  var map = new google.maps.Map(document.getElementById('map'), {
    zoom: 8,
    center: {lat: 40.731, lng: -73.997}
  }); //맵 인스턴스화
  var directionsDisplay = new google.maps.DirectionsRenderer({map: map}); //랜더러인스턴스화 하여 맵과 바인딩
  var stepDisplay = new google.maps.InfoWindow; //단계적으로 길찾기 서비스를 사용하기 위해 스텝디스플레이 인스턴스화
  calculateAndDisplayRoute(
	      directionsDisplay, directionsService, markerArray, stepDisplay, map); //경로를 표시하기 위해 경로 그리기 메서드 실행
	      

  var geocoder = new google.maps.Geocoder;
  var infowindow = new google.maps.InfoWindow;

  document.getElementById('submit').addEventListener('click', function() {
    geocodeLatLng(geocoder, map, infowindow);
  });
}
function calculateAndDisplayRoute(directionsDisplay, directionsService,
	    markerArray, stepDisplay, map) {
	  // First, remove any existing markers from the map.
	  for (var i = 0; i < markerArray.length; i++) {
	    markerArray[i].setMap(null);
	  }
	  // Retrieve the start and end locations and create a DirectionsRequest using
	  // WALKING directions.
	  directionsService.route({
	    origin: document.getElementById('start').value,
	    destination: document.getElementById('end').value,
	    travelMode: google.maps.TravelMode.WALKING
	  }, function(response, status) {
	    // Route the directions and pass the response to a function to create
	    // markers for each step.
	    if (status === google.maps.DirectionsStatus.OK) {
	      document.getElementById('warnings-panel').innerHTML =
	          '<b>' + response.routes[0].warnings + '</b>';
	      directionsDisplay.setDirections(response);
	      showSteps(response, markerArray, stepDisplay, map);
	    } else {
	      window.alert('Directions request failed due to ' + status);
	    }
	  });
	}
function showSteps(directionResult, markerArray, stepDisplay, map) {
	  // For each step, place a marker, and add the text to the marker's infowindow.
	  // Also attach the marker to an array so we can keep track of it and remove it
	  // when calculating new routes.
	  var myRoute = directionResult.routes[0].legs[0];
	  for (var i = 0; i < myRoute.steps.length; i++) {
	    var marker = markerArray[i] = markerArray[i] || new google.maps.Marker;
	    marker.setMap(map);
	    marker.setPosition(myRoute.steps[i].start_location);
	    attachInstructionText(
	        stepDisplay, marker, myRoute.steps[i].instructions, map);
	  }
	}
function attachInstructionText(stepDisplay, marker, text, map) {
	  google.maps.event.addListener(marker, 'click', function() {
	    // Open an info window when the marker is clicked on, containing the text
	    // of the step.
	    stepDisplay.setContent(text);
	    stepDisplay.open(map, marker);
	  });
	}



function geocodeLatLng(geocoder, map, infowindow) {
  var input = document.getElementById('latlng').value;
  var latlngStr = input.split(',', 2);
  var latlng = {lat: parseFloat(latlngStr[0]), lng: parseFloat(latlngStr[1])};
  geocoder.geocode({'location': latlng}, function(results, status) {
    if (status === google.maps.GeocoderStatus.OK) {
      if (results[1]) {
        map.setZoom(11);
        var marker = new google.maps.Marker({
          position: latlng,
          map: map
        });
        infowindow.setContent(results[1].formatted_address);
        infowindow.open(map, marker);
      } else {
        window.alert('No results found');
      }
    } else {
      window.alert('Geocoder failed due to: ' + status);
    }
  });
}

    </script>
    <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCW6b-GWi5ZtdTBeodeIem_UlidZMCulIk&signed_in=true&callback=initMap"
        async defer></script>
  </body>
</html>