<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src = "http://ajax.aspnetcdn.com/ajax/jQuery/jquery-3.0.0.min.js"></script>
<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDvYOWAhJM1YAx0EiVUNbLpJPOPBKmTTPw&sensor=true"></script>
<script type="text/javascript">
    
		var zoo = 30;
		var la = 32.219221,ln = 76.337636;
    	$(function(){
    		
    		 var myLatLng = {lat: la, lng: ln};

   			 var mapOptions = {
   			      		center: new google.maps.LatLng(la,ln), //좌표
   			      		zoom: zoo, //확대정도
   			      		mapTypeId: google.maps.MapTypeId.ROADMAP //기본지도사용(위성지도및 기타지도도있음~)
   			    	};
           	var map = new google.maps.Map(document.getElementById("map_canvas"),mapOptions);
           	var marker = new google.maps.Marker({
           	    position: myLatLng,
           	    map: map,
           	    title: 'Hello World!'
           	  });
    		
            	$("#btn").on("click",function(){
        			console.log("눌림");
        			zoo += 10;
        			initialize();
        			
        		});
            	$("#btn1").on("click",function(){
        			console.log("눌림");
        			zoo -= 10;
        			initialize();
        			
        		});
            	$("#btn2").on("click",function(){
            		console.log("눌림");
            		la = $("#lat").val();
            		ln = $("#lng").val();
            		initialize();
            	});
            	function initialize() {
       			 myLatLng = {lat: la, lng: ln};

       			 mapOptions = {
       			      		center: new google.maps.LatLng(la,ln), //좌표
       			      		zoom: zoo, //확대정도
       			      		mapTypeId: google.maps.MapTypeId.ROADMAP //기본지도사용(위성지도및 기타지도도있음~)
       			    	};
       			console.log(mapOptions.zoom);
               	 map = new google.maps.Map(document.getElementById("map_canvas"),mapOptions);
               	marker = new google.maps.Marker({
               	    position: myLatLng,
               	    map: map,
               	    title: 'Hello World!'
               	  }); 
          		}
    	
    	});
		
		
		
	</script>
</head>
<body>
<div id="map_canvas" style="width:640px;height:640px;">
					
</div>
<input type="text" name="" id="lat" />
<input type="text" name="" id="lng" />
<input type="button" value="이동" id="btn2" />
<input type="button" value="줌아웃" id = "btn" />
<input type="button" value="줌인" id = "btn1" />
</body>
</html>