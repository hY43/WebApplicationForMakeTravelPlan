<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src = "http://ajax.aspnetcdn.com/ajax/jQuery/jquery-3.0.0.min.js"></script>
<meta name="viewport" content="initial-scale=1.0, user-scalable=no">
    <meta charset="utf-8">
    <style>
      html, body {
        height: 500px;
        margin: 0;
        padding: 0;
      }
      #map {
        height: 500px;
        width:500px;
      }
    </style>
    <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDvYOWAhJM1YAx0EiVUNbLpJPOPBKmTTPw&signed_in=true&callback=initMap"
        async defer></script>
        <script type="text/javascript">
     	    var zoo =19;
     	    var la = 32.219221, ln = 76.337636;
     	    var marker;
   		 	function initMap() {
   		  	 var map = new google.maps.Map(document.getElementById('map'), {
   	    	 zoom: zoo,
   	    	 center: {lat: la, lng: ln}
    	 	 });
   		   	  marker = new google.maps.Marker({
   			    map: map,
   			    draggable: true,
   			    animation: google.maps.Animation.DROP,
   			    position: {lat: la, lng: ln}
   			  });
   			  marker.addListener('click', toggleBounce);
   			  
   			 }
   		 function toggleBounce() {
   		  if (marker.getAnimation() !== null) {
   		    marker.setAnimation(null);
   		  } else {
   		    marker.setAnimation(google.maps.Animation.BOUNCE);
   		  }
   		}
   		 	$(function(){
   		 		$("#zoomIn").on("click",function(){
   		 		console.log("눌림 줌인");
   		 		zoo += 1;
   		 		initMap();
   		 		});
   				 $("#zoomOut").on("click",function(){
   				console.log("눌림 줌아웃");
		 		zoo -= 1;
		 		initMap();
		 		});	
   				 $("#move").on("click",function(){
   					 la = parseInt($("#lat").val());
   					 ln = parseInt($("#lng").val());
   					initMap();
   				 });
   		 	});
   		 	
        </script>
</head>
<body>
	<div id="map"></div>

    <div>
    	<input type="text" name="" id="lat" />
    	<input type="text" name="" id="lng" />
    	<input type="button" value="이동" id ="move" />
    	<input type="button" value="줌인" id="zoomIn"/>
    	<input type="button" value="줌아웃" id="zoomOut"/>
    </div>
    
  </body>
</body>
</html>