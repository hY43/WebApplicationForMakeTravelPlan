<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src = "http://ajax.aspnetcdn.com/ajax/jQuery/jquery-3.0.0.min.js"></script>
<script type="text/javascript">
	$(function(){
		$(".time").on("click",function(){
			console.dir($(this).attr("id"));
			var id = $(this).attr("id");
			var num = id.split("_");
			console.log(num);
			if(hour>=1){
				 for(var i=0;i<hour+2;i++){
					 if($("#"+num[0]+"_"+eval(num[1]-i)).html()!=null){
						alert("일정이 겹칩니다.");
						break;
					 }else{
						$("#"+num[0]+"_"+eval(num[1]-i)).html("movetime").css("backgroundColor","yellow");
					
					 }
					
				} 
			}else
			$("#"+id).html(selcity).css("backgroundColor","yellow");
			$("#map").show(1000);
		});
		/* $.ajax({
			url:"maketable.jsp",
			type:"GET",
			data:"day="+day,
			datatype:"text",
			success:function(data){
				alert("완료");
				$("#plan").html(data);
			}
		}); */
	});
</script>
<style type="text/css">
	table{
		width:500px;
		height:1000px;
	}
	table, tr, td{
		border: 1px solid black;
		text-align: center;
	}
	.time{
		width:400px;
	}
</style>
</head>
<body>
	<div id="plan">
			<table>
				<tr>
					<td>1시</td>
					<td class="time" id="day_1"></td>
				</tr>
				<tr>
					<td>2시</td>
					<td class="time" id="day_2"></td>
				</tr>
				<tr>
					<td>3시</td>
					<td class="time" id="day_3"></td>
				</tr>
				<tr>
					<td>4시</td>
					<td class="time" id="day_4"></td>
				</tr>
				<tr>
					<td>5시</td>
					<td class="time" id="day_5"></td>
				</tr>
				<tr>
					<td>6시</td>
					<td class="time" id="day_6"></td>
				</tr>
				<tr>
					<td>7시</td>
					<td class="time" id="day_7"></td>
				</tr>
				<tr>
					<td>8시</td>
					<td class="time" id="day_8"></td>
				</tr>
				<tr>
					<td>9시</td>
					<td class="time" id="day_9"></td>
				</tr>
				<tr>
					<td>10시</td>
					<td class="time" id="day_10"></td>
				</tr>
				<tr>
					<td>11시</td>
					<td class="time" id="day_11"></td>
				</tr>
				<tr>
					<td>12시</td>
					<td class="time" id="day_12"></td>
				</tr>
				<tr>
					<td>13시</td>
					<td class="time" id="day_13"></td>
				</tr>
				<tr>
					<td>14시</td>
					<td class="time" id="day_14"></td>
				</tr>
				<tr>
					<td>15시</td>
					<td class="time" id="day_15"></td>
				</tr>
				<tr>
					<td>16시</td>
					<td class="time" id="day_16"></td>
				</tr>
				<tr>
					<td>17시</td>
					<td class="time" id="day_17"></td>
				</tr>
				<tr>
					<td>18시</td>
					<td class="time" id="day_18"></td>
				</tr>
				<tr>
					<td>19시</td>
					<td class="time" id="day_19"></td>
				</tr>
				<tr>
					<td>20시</td>
					<td class="time" id="day_20"></td>
				</tr>
				<tr>
					<td>21시</td>
					<td class="time" id="day_21"></td>
				</tr>
				<tr>
					<td>22시</td>
					<td class="time" id="day_22"></td>
				</tr>
				<tr>
					<td>23시</td>
					<td class="time" id="day_23"></td>
				</tr>
				<tr>
					<td>24시</td>
					<td class="time" id="day_24"></td>
				</tr>
			</table>
	</div>
</body>
</html>