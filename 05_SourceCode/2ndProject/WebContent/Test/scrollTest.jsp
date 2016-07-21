<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
#img1 {
   height: 800px;
   width: 500px;
}

#img2 {
   height: 800px;
   width: 500px;
   position: absolute;
   top:800px;
}
#img3 {
   height: 800px;
   width: 500px;
      position: absolute;
   top:1600px;
}
#img4 {
   height: 800px;
   width: 500px;
      position: absolute;
   top:2400px;
}
#img5 {
   height: 800px;
   width: 500px;
      position: absolute;
   top:3200px;
}
#img6 {
   height: 800px;
   width: 500px;
      position: absolute;
   top:4000px;
}
#img7 {
   height: 800px;
   width: 500px;
         position: absolute;
   top:4800px;
}

#imgMain {
   width: 150px;
   height: 150px;
   position: absolute;
   right: 100px;
   top: 50px;
   /* list-style-type: none; */
}
</style>
<script type="text/javascript"
   src="http://ajax.aspnetcdn.com/ajax/jQuery/jquery-3.0.0.min.js">
   
</script>
<script type="text/javascript">
   $(function() {
      var top = parseInt($("#imgMain").css("top"));
      
      $(window).scroll(function() {
         var scrollTop = $(window).scrollTop();
         var moveTop = scrollTop + top;
         /* console.log($("#imgMain").css("top") + " " + $("#img6").css("top")); */
		 if(parseInt($("#imgMain").css("top")) >= parseInt($("#img6").css("top"))){
			console.log("hello");
			$("#imgMain").attr("src", "../images/movie2.jpg");
			/* console.dir($("#imgMain")); */
		 }
         $("#imgMain").stop().animate({
            top : moveTop
         }, 0);
         
      })
   });
</script>
</head>
<body>
   <div id="quickmenu">
      <img src="../images/movie3.jpg" alt="" id="imgMain" />

   </div>
   <table>
      <tr>
         <td><img src="../images/movie1.jpg" alt="" id="img1" /></td>
      </tr>
      <tr>
         <td><img src="../images/movie2.jpg" alt="" id="img2" /></td>
      </tr>
      <tr>
         <td><img src="../images/movie3.jpg" alt="" id="img3" /></td>
      </tr>
      <tr>
         <td><img src="../images/movie4.jpg" alt="" id="img4" /></td>
      </tr>
      <tr>
         <td><img src="../images/movie5.jpg" alt="" id="img5" /></td>
      </tr>
      <tr>
         <td><img src="../images/movie6.jpg" alt="" id="img6" /></td>
      </tr>
      <tr>
         <td><img src="../images/movie7.jpg" alt="" id="img7" /></td>
      </tr>
      
   </table>
</body>
</html>