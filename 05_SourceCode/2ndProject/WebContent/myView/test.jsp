<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title> </title>
<meta http-equiv="X-UA-Compatible" content="IE=Edge"/>

<style type="text/css">
html, body { width:100%; height:100%;  margin:0px; padding:0px; background-color:yellow; }
.full { width:150px; height:25px; background-color:red; cursor:pointer;
font-size: 12px; font-weight: bold; color: #fff; line-height:25px; text-align:center; }
.clip { width: 800px; height: 500px; background-color:#ccc; }
</style>

<script type="text/javascript" src="http://code.jquery.com/jquery-1.9.1.min.js"></script>
<script type="text/javascript">
$(function(){

var st = "off";

$(".full").click(function(){
   if(st == "off"){
      $(".clip").css({"width":"100%","height":"100%","position":"fixed","top":"0px","left":"0px","z-index":"1"});
      $(".full").css({"position":"fixed","top":"0px","left":"0px","z-index":"2"}).text("축소화면보기");
      st = "on";
   }else{
      $(".clip").css({"width":"800px","height":"500px","position":"relative"});
      $(".full").css({"position":"relative"}).text("전체화면보기");
      st = "off";
   }
});

});
</script>

</head>
<body>

<div class="full">전체화면보기</div>

<div class="clip">
     <video width="100%" height="100%" controls autoplay id="player">
     <source id="movie_src" src="aaaa.mp4" type="video/mp4">
     브라우저 재생 불가
     </video>
</div>

</body>
</html>