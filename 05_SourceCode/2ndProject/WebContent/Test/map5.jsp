<%@page import="vo.PlaceVO"%>
<%@page import="proDAO.PlaceDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="vo.CityVO"%>
<%@page import="proDAO.CityDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	CityDAO cdao = new CityDAO();
	ArrayList<CityVO> list = cdao.selectAll();
	PlaceDAO pdao = new PlaceDAO();
	ArrayList<PlaceVO> plist = new ArrayList<PlaceVO>();
	int selcity = 0;
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	html, body{
		height:500px;
		margin:0;
		padding:0;
	}
	#map{
		height:500px;
		
	}
</style>
<script type="text/javascript" src = "http://ajax.aspnetcdn.com/ajax/jQuery/jquery-3.0.0.min.js"></script>
<script type="text/javascript" src="../js/httpRequest.js"></script>
<script
src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCW6b-GWi5ZtdTBeodeIem_UlidZMCulIk&signed_in=true&libraries=places&callback=initMap" async defer></script>


<script type="text/javascript">
	var directionsService; //디렉션 서비스 인스턴스화
	var directionDisplay; // 디렉션 랜더러 인스턴스화
	var markerArray = [<%=list.size()%>];
	var cityMarker = null;
	var la = 20.742807,ln = 80.240566;
	var mapflag = false;
	var zoom = 5;
	var selMarker = [];
	var routeMarker = [];
	var waypoints = [];
	var waycnt = 0;
	var placecnt = 0;
	var selcity = "";
	var map;
	var hour = 0;
	var day = 3;
	$(function(){
		$("#out").on("click",function(){
			zoom=5;
			la = 20.742807;
			ln = 80.240566;
			initMap();
		});
		$("#route").on("click",function(){
			console.log("눌림");
			console.log(selMarker.length);
			/* for (var i = 0; i < selMarker.length; i++) {
				routeMarker[i] = new google.maps.Marker({
					map : map,
					label : selMarker[i].label,
					draggable : false,
					position : {
						lat : selMarker[i].position.lat(),
						lng : selMarker[i].position.lng()
					},
					icon : "./marker/marker3.png"
				});
			} */
			for (var i = 1; i < selMarker.length-1; i++) {
				console.log("waypoint");
				waypoints[waycnt] = {
					location : selMarker[i].position.lat()+","+selMarker[i].position.lng(),
					stopover : true
				};
				console.log(waycnt);
				waycnt++;

			}
			console.log(waypoints);
			calculateAndDisplayRoute(directionsService,directionDisplay);
		});
	});
	function initMap(){
		directionsService = new google.maps.DirectionsService;
		directionDisplay = new google.maps.DirectionsRenderer;
		map = new google.maps.Map($("#map")[0],{
			zoom : zoom,
		center : {
			lat : la,
			lng : ln
		}
		});
		
		directionDisplay.setMap(map); //디스플레이객체에 지도 셋팅
		//directionDisplay.setPanel($("#panel")[0]);
		if(cityMarker != null){
		
		for (var i = 0; i < cityMarker.length; i++) {
			console.log(cityMarker[i].label);
			
		}
		}
		makemarker();
	}
	function makemarker(){
		console.log(selcity);
		console.log("마커실행");
		<%
		int i = 0;
		for(CityVO vo : list){
		%>
		markerArray[<%=i%>] = new google.maps.Marker({
			map : map,
			label:'<%=vo.getCityName()%>',
			draggable : false,
			animation:google.maps.Animation.DROP,
			position:{
				lat : <%=vo.getLatitude()%>,
				lng : <%=vo.getLongitude()%>
			},
			icon : "./marker/marker1.png"
		});
		<%-- console.log(markerArray[<%=i%>].label); --%>
		markerArray[<%=i%>].addListener("click",function(){
			console.log(" "+'<%=vo.getCityName()%>');
			mapflag = true;
			$.ajax({
				url:"map6.jsp",
				type:"GET",
				data:"cno="+<%=vo.getCityno()%>,
				datatype:"text",
				success:function(data){
					//alert("요청 성공시 호출");
					makeplace(data);
				}
			});
		});
		<%
		i++;
		}
		%>
		
	}
	function makeplace(data){
		$("#doc").html(data);
	}
	function back(){
		if(xhr.resdyState ==4 && xhr.status ==200){
			var data = xhr.responseText;
			data = data.trim();
			console.log(data);
			
		}
	}
	function sampleRoute(directionService,directionDisplay){
		directionService.route({
			origin : selMarker[selMarker.length-2].position.lat() + "," + selMarker[selMarker.length-2].position.lng(),
			destination : selMarker[selMarker.length-1].position.lat() + "," + selMarker[selMarker.length-1].position.lng(),
			travelMode: google.maps.TravelMode.DRIVING
		}, function(response, status) {
		    if (status === google.maps.DirectionsStatus.OK) {
		    	
		       // directionDisplay.setDirections(response);
		    	console.log(response.routes[0].legs[0].duration.value/3600);
		    	hour = parseInt(response.routes[0].legs[0].duration.value/3600);
		      } else {
		        window.alert('Directions request failed due to ' + status);
		      }
		    });
	}

	function calculateAndDisplayRoute(directionService,directionDisplay){
			console.log("route");
			directionService.route({
				origin : selMarker[0].position.lat() + "," + selMarker[0].position.lng(),
				destination : selMarker[selMarker.length-1].position.lat() + "," + selMarker[selMarker.length-1].position.lng(),
				waypoints: waypoints,
				optimizeWaypoints:true,
				travelMode: google.maps.TravelMode.DRIVING
			}, function(response, status) {
			    if (status === google.maps.DirectionsStatus.OK) {
			        directionDisplay.setDirections(response);
			
			      } else {
			        window.alert('Directions request failed due to ' + status);
			      }
			    	for (var i = 0; i < response.routes[0].legs.length; i++) {
					console.log(response.routes[0].legs[i].duration.value/3600);
						
					}
			    });
		
		}
	/* function getName(num){
		 if(markerArray[num].getAnimation() !==null){
			markerArray[num].setAnimation(null);
		}else{
			console.log("Madras Crocodile Bank");
			markerArray[num].setAnimation(google.maps.Animation.BOUNCE);
		} 
		
	} */
</script>
</head>
<body>
		<input type="button" value="줌아웃" id="out" />
		<input type="button" value="경로보기" id="route" />
	<div id="map">
	</div>
	<div id="panel"></div>
	<div id="doc"></div>
</body>
</html>