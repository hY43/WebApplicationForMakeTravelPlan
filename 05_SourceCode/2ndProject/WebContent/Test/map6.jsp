<%@page import="vo.CityVO"%>
<%@page import="proDAO.CityDAO"%>
<%@page import="proDAO.PlaceDAO"%>
<%@page import="vo.PlaceVO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	String cno = request.getParameter("cno");
	CityDAO cdao = new CityDAO();
	CityVO cvo = cdao.selectOne(Integer.parseInt(cno));
	PlaceDAO dao = new PlaceDAO();
	ArrayList<PlaceVO> list = dao.selectAll(Integer.parseInt(cno));
	int i=0;
	out.println("<script>cityMarker = ["+list.size()+"]</script>");
	
	out.println("<script>zoom = 11; "+
			"console.log("+cvo.getLatitude()+");"+
			"la="+cvo.getLatitude()+";ln="+cvo.getLongitude() +	
			";console.log(la + ',' + ln);initMap();</script>");
	for(PlaceVO vo : list){
		out.println("<script>cityMarker["+i+"] = new google.maps.Marker({"+
				"map : map,"+
				"label:'"+vo.getPlaceName()+"',"+
				"draggable : true,"+
				"animation:google.maps.Animation.DROP,"+
				"position:{lat : " + vo.getLatitude() + ",lng : " + vo.getLongitude() +"},"+
				"icon : './marker/marker2.png'"+
				"});"+
				"cityMarker["+i+"].addListener('click',function(){"+
					"selMarker[placecnt] = new google.maps.Marker({map : map, label : cityMarker["+i+"].label, position : cityMarker["+i+"].position, icon : './marker/marker3.png'});"+
					"console.log(selMarker[placecnt]);"+
					"selcity = cityMarker["+i+"].label;"+
					"console.log(selcity);"+
					"$('#map').hide(1000);"+
					"if(selMarker.length>=2) sampleRoute(directionsService,directionDisplay);"+
					"placecnt++;"+
				"});"+
				"</script>");
		i++;
	}
%>
