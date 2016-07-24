<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src = "http://ajax.aspnetcdn.com/ajax/jQuery/jquery-3.0.0.min.js"></script>
<script
src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCW6b-GWi5ZtdTBeodeIem_UlidZMCulIk&signed_in=true&libraries=places&callback=initMap" async defer></script>
<style type="text/css">
	 html, body {
        height: 500px;
        margin: 0;
        padding: 0;
      }
      #map {
        height: 500px;
      }
</style>
<script type="text/javascript">
			var la = 12.742807, ln = 80.240566;
		function initMap() {
			  var map = new google.maps.Map(document.getElementById('map'), {
			    zoom: 18,
			    center: {lat: la, lng: ln}
			  });

			  var bounds = {
			    17: [[20969, 20970], [50657, 50658]],
			    18: [[41939, 41940], [101315, 101317]],
			    19: [[83878, 83881], [202631, 202634]],
			    20: [[167757, 167763], [405263, 405269]]
			  };

			  var imageMapType = new google.maps.ImageMapType({
			    getTileUrl: function(coord, zoom) {
			      if (zoom < 17 || zoom > 20 ||
			          bounds[zoom][0][0] > coord.x || coord.x > bounds[zoom][0][1] ||
			          bounds[zoom][1][0] > coord.y || coord.y > bounds[zoom][1][1]) {
			        return null;
			      }

			      return ['http://www.gstatic.com/io2010maps/tiles/5/L2_',
			          zoom, '_', coord.x, '_', coord.y, '.png'].join('');
			    },
			    tileSize: new google.maps.Size(256, 256)
			  });

			  map.overlayMapTypes.push(imageMapType);
			}
		$(function(){
			$("#btn").on("click",function(){
				la = parseInt($("#lat").val());
				ln = parseInt($("#lng").val());
				initMap();
			});
		});
</script>
</head>
<body>
	<div id="map"></div>
	<input type="text" name="" id="lat" />
	<input type="text" name="" id="lng" />
	<input type="button" value="이동" id="btn" />
</body>
</html>