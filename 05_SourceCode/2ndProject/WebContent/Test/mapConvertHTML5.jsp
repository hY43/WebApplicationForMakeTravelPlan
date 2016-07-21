<!DOCTYPE html>

<!-- Created with Ai->Canvas Export Plug-In Version 1.3 (PC/64) -->
<!-- By Mike Swanson (http://blog.mikeswanson.com/)             -->

<html lang="en">
<head>
<meta charset="UTF-8" />
<title>test</title>
<style type="text/css">
	canvas{
		position:absolute;
		left:0px;
	}

</style>
<script type="text/javascript" src="http://ajax.aspnetcdn.com/ajax/jQuery/jquery-3.0.0.min.js"></script>
<script>
    $(function init() {
      var canvas1 = document.getElementById("canvas1");
      var canvas2 = document.getElementById("canvas2");
      var canvas3 = document.getElementById("canvas3");
      var ctxSouth = canvas1.getContext("2d");
      var ctxNorth = canvas2.getContext("2d");
      var ctxMNorth = canvas3.getContext("2d");

      drawSouth(ctxSouth);
      drawNorth(ctxNorth);
      drawMNorth(ctxMNorth);
      
      $("#canvas3").on("mouseover", function(){
          ctxMNorth.fillStyle = "rgb(0, 0, 0)";
          ctxMNorth.fill();
          ctxMNorth.restore();
      });
      
      $("#canvas3").on("mouseout", function(){
    	  ctxMNorth.fillStyle = "rgb(243, 151, 0)";
    	  ctxMNorth.fill();
    	  ctxMNorth.restore();
      });  
      
    });

    function drawSouth(ctx) {
      // south/
      ctx.save();
      ctx.beginPath();
      ctx.moveTo(78.9, 192.8);
      ctx.lineTo(253.4, 192.8);
      ctx.lineTo(248.8, 189.9);
      ctx.lineTo(239.7, 189.9);
      ctx.lineTo(239.5, 185.2);
      ctx.lineTo(241.5, 185.2);
      ctx.lineTo(241.2, 180.6);
      ctx.lineTo(243.2, 180.6);
      ctx.lineTo(245.1, 176.0);
      ctx.lineTo(243.2, 174.5);
      ctx.lineTo(243.2, 172.3);
      ctx.lineTo(245.1, 172.3);
      ctx.lineTo(245.1, 168.1);
      ctx.lineTo(247.6, 168.1);
      ctx.lineTo(247.8, 164.5);
      ctx.lineTo(251.0, 161.3);
      ctx.lineTo(251.2, 155.2);
      ctx.lineTo(244.4, 148.8);
      ctx.lineTo(231.4, 140.3);
      ctx.lineTo(229.5, 140.3);
      ctx.lineTo(217.5, 123.9);
      ctx.lineTo(214.3, 114.4);
      ctx.lineTo(212.4, 111.9);
      ctx.lineTo(212.1, 105.3);
      ctx.lineTo(219.2, 105.3);
      ctx.lineTo(223.1, 108.5);
      ctx.lineTo(225.3, 108.5);
      ctx.lineTo(226.5, 105.3);
      ctx.lineTo(230.0, 105.3);
      ctx.lineTo(232.2, 106.6);
      ctx.lineTo(232.7, 101.4);
      ctx.lineTo(228.3, 97.8);
      ctx.lineTo(227.5, 94.8);
      ctx.lineTo(221.7, 89.4);
      ctx.lineTo(221.9, 79.2);
      ctx.lineTo(219.9, 76.0);
      ctx.lineTo(219.9, 71.1);
      ctx.lineTo(227.5, 71.1);
      ctx.lineTo(230.7, 69.2);
      ctx.lineTo(232.4, 67.2);
      ctx.lineTo(232.9, 65.3);
      ctx.lineTo(239.3, 60.6);
      ctx.lineTo(243.2, 56.7);
      ctx.lineTo(243.2, 50.3);
      ctx.lineTo(244.9, 48.4);
      ctx.lineTo(245.6, 35.9);
      ctx.lineTo(241.0, 32.3);
      ctx.lineTo(231.7, 32.3);
      ctx.lineTo(230.7, 34.0);
      ctx.lineTo(229.0, 32.3);
      ctx.lineTo(215.5, 32.3);
      ctx.lineTo(213.3, 34.7);
      ctx.lineTo(211.4, 34.7);
      ctx.lineTo(204.3, 37.4);
      ctx.lineTo(200.9, 37.1);
      ctx.lineTo(198.2, 34.0);
      ctx.lineTo(190.4, 30.3);
      ctx.lineTo(186.7, 30.3);
      ctx.lineTo(186.7, 23.2);
      ctx.lineTo(176.9, 16.6);
      ctx.lineTo(174.7, 16.6);
      ctx.lineTo(162.3, 3.7);
      ctx.lineTo(153.5, 2.2);
      ctx.lineTo(151.5, 0.0);
      ctx.lineTo(143.7, 0.0);
      ctx.lineTo(141.7, 2.2);
      ctx.lineTo(136.4, 2.2);
      ctx.lineTo(135.4, 4.2);
      ctx.lineTo(131.0, 4.2);
      ctx.lineTo(117.3, 12.7);
      ctx.lineTo(110.7, 14.4);
      ctx.lineTo(111.0, 23.0);
      ctx.lineTo(116.3, 23.7);
      ctx.lineTo(122.7, 27.1);
      ctx.lineTo(124.6, 30.1);
      ctx.lineTo(127.1, 31.0);
      ctx.lineTo(128.5, 36.4);
      ctx.lineTo(132.0, 45.9);
      ctx.lineTo(129.0, 50.3);
      ctx.lineTo(125.1, 57.2);
      ctx.lineTo(123.9, 71.8);
      ctx.lineTo(126.3, 77.5);
      ctx.lineTo(125.6, 85.8);
      ctx.lineTo(128.1, 89.9);
      ctx.lineTo(127.8, 91.4);
      ctx.lineTo(136.9, 93.4);
      ctx.lineTo(138.6, 94.8);
      ctx.lineTo(140.8, 94.8);
      ctx.lineTo(152.0, 107.5);
      ctx.lineTo(149.1, 111.0);
      ctx.lineTo(143.0, 111.7);
      ctx.lineTo(138.6, 117.3);
      ctx.lineTo(133.9, 134.9);
      ctx.lineTo(128.5, 138.1);
      ctx.lineTo(125.4, 142.0);
      ctx.lineTo(116.8, 153.7);
      ctx.lineTo(110.5, 161.8);
      ctx.lineTo(104.6, 173.0);
      ctx.lineTo(90.7, 179.4);
      ctx.lineTo(88.5, 183.8);
      ctx.lineTo(78.9, 192.8);
      ctx.closePath();
      ctx.fillStyle = "rgb(3, 110, 184)";
      ctx.fill();
      ctx.restore();
    }
    
    function drawMNorth(ctx){
        // mNorth/
        ctx.save();
        ctx.beginPath();
        ctx.moveTo(80.9, 388.8);
        ctx.lineTo(339.7, 388.8);
        ctx.lineTo(332.6, 392.0);
        ctx.lineTo(329.9, 396.4);
        ctx.lineTo(325.3, 400.1);
        ctx.lineTo(322.3, 405.7);
        ctx.lineTo(313.1, 410.6);
        ctx.lineTo(313.3, 413.5);
        ctx.lineTo(315.0, 415.7);
        ctx.lineTo(314.5, 419.1);
        ctx.lineTo(306.7, 423.5);
        ctx.lineTo(300.1, 429.1);
        ctx.lineTo(289.4, 436.2);
        ctx.lineTo(286.7, 439.7);
        ctx.lineTo(283.2, 441.6);
        ctx.lineTo(276.4, 444.3);
        ctx.lineTo(275.2, 450.2);
        ctx.lineTo(273.2, 453.8);
        ctx.lineTo(272.7, 457.2);
        ctx.lineTo(259.8, 457.2);
        ctx.lineTo(255.6, 460.2);
        ctx.lineTo(245.4, 460.2);
        ctx.lineTo(249.0, 463.6);
        ctx.lineTo(241.9, 470.9);
        ctx.lineTo(235.3, 469.5);
        ctx.lineTo(227.8, 478.8);
        ctx.lineTo(223.1, 486.3);
        ctx.lineTo(225.3, 488.8);
        ctx.lineTo(225.6, 514.9);
        ctx.lineTo(227.0, 519.1);
        ctx.lineTo(229.2, 530.3);
        ctx.lineTo(226.1, 536.2);
        ctx.lineTo(222.6, 544.0);
        ctx.lineTo(213.8, 558.7);
        ctx.lineTo(216.0, 571.9);
        ctx.lineTo(211.9, 576.5);
        ctx.lineTo(214.6, 579.9);
        ctx.lineTo(214.6, 592.9);
        ctx.lineTo(209.2, 592.9);
        ctx.lineTo(202.4, 592.9);
        ctx.lineTo(199.4, 600.9);
        ctx.lineTo(191.6, 600.9);
        ctx.lineTo(192.8, 606.6);
        ctx.lineTo(193.3, 614.4);
        ctx.lineTo(192.1, 618.5);
        ctx.lineTo(179.9, 621.5);
        ctx.lineTo(178.2, 630.3);
        ctx.lineTo(167.2, 640.5);
        ctx.lineTo(159.3, 636.1);
        ctx.lineTo(157.4, 627.8);
        ctx.lineTo(154.7, 619.0);
        ctx.lineTo(138.1, 614.1);
        ctx.lineTo(135.9, 602.2);
        ctx.lineTo(136.6, 583.6);
        ctx.lineTo(131.0, 569.4);
        ctx.lineTo(127.3, 549.9);
        ctx.lineTo(122.7, 538.1);
        ctx.lineTo(113.4, 529.1);
        ctx.lineTo(109.7, 515.9);
        ctx.lineTo(107.3, 503.9);
        ctx.lineTo(103.4, 491.5);
        ctx.lineTo(90.4, 480.7);
        ctx.lineTo(88.5, 473.4);
        ctx.lineTo(92.6, 470.7);
        ctx.lineTo(98.7, 469.7);
        ctx.lineTo(95.1, 465.8);
        ctx.lineTo(91.9, 463.8);
        ctx.lineTo(88.2, 455.8);
        ctx.lineTo(86.8, 445.3);
        ctx.lineTo(89.0, 441.6);
        ctx.lineTo(84.3, 428.4);
        ctx.lineTo(82.4, 409.3);
        ctx.lineTo(82.1, 399.8);
        ctx.lineTo(80.9, 388.8);
        ctx.closePath();
        ctx.fillStyle = "rgb(243, 151, 0)";
        ctx.fill();
        ctx.restore();
    }
    function drawNorth(ctx){

        // north/
        ctx.save();
        ctx.beginPath();
        ctx.moveTo(78.9, 192.8);
        ctx.lineTo(253.4, 192.8);
        ctx.lineTo(261.8, 198.5);
        ctx.lineTo(265.9, 206.3);
        ctx.lineTo(288.1, 215.8);
        ctx.lineTo(298.2, 221.4);
        ctx.lineTo(323.3, 221.4);
        ctx.lineTo(328.2, 223.9);
        ctx.lineTo(329.4, 228.3);
        ctx.lineTo(339.0, 234.9);
        ctx.lineTo(346.1, 234.9);
        ctx.lineTo(350.7, 238.0);
        ctx.lineTo(359.7, 239.7);
        ctx.lineTo(370.5, 240.7);
        ctx.lineTo(387.1, 242.2);
        ctx.lineTo(395.2, 233.1);
        ctx.lineTo(398.4, 229.0);
        ctx.lineTo(403.2, 228.3);
        ctx.lineTo(405.7, 222.6);
        ctx.lineTo(408.6, 230.0);
        ctx.lineTo(418.9, 233.1);
        ctx.bezierCurveTo(418.9, 233.1, 440.1, 233.1, 440.9, 233.1);
        ctx.bezierCurveTo(441.6, 233.1, 466.8, 231.2, 466.8, 231.2);
        ctx.lineTo(468.7, 219.9);
        ctx.lineTo(472.6, 210.4);
        ctx.lineTo(478.5, 207.0);
        ctx.lineTo(479.7, 201.4);
        ctx.lineTo(482.9, 200.2);
        ctx.lineTo(487.8, 192.8);
        ctx.lineTo(491.7, 189.6);
        ctx.lineTo(500.3, 188.7);
        ctx.lineTo(503.4, 187.4);
        ctx.lineTo(507.8, 178.2);
        ctx.lineTo(531.8, 176.9);
        ctx.lineTo(543.8, 172.5);
        ctx.lineTo(551.6, 179.6);
        ctx.lineTo(551.6, 185.5);
        ctx.lineTo(559.6, 191.4);
        ctx.lineTo(566.5, 199.2);
        ctx.lineTo(560.6, 205.3);
        ctx.lineTo(558.2, 215.5);
        ctx.lineTo(556.2, 218.5);
        ctx.lineTo(546.9, 218.5);
        ctx.lineTo(544.5, 220.4);
        ctx.lineTo(542.3, 225.1);
        ctx.lineTo(532.3, 231.4);
        ctx.lineTo(532.0, 235.3);
        ctx.lineTo(528.4, 238.8);
        ctx.lineTo(527.1, 252.0);
        ctx.lineTo(522.3, 260.3);
        ctx.lineTo(521.5, 272.5);
        ctx.lineTo(508.8, 293.8);
        ctx.lineTo(504.7, 291.3);
        ctx.lineTo(502.0, 292.5);
        ctx.lineTo(497.3, 293.8);
        ctx.lineTo(495.9, 296.2);
        ctx.lineTo(495.9, 311.3);
        ctx.lineTo(493.2, 326.5);
        ctx.lineTo(491.0, 335.3);
        ctx.lineTo(486.6, 335.3);
        ctx.lineTo(479.5, 317.0);
        ctx.lineTo(478.0, 308.4);
        ctx.lineTo(475.1, 303.8);
        ctx.lineTo(468.5, 302.6);
        ctx.lineTo(465.3, 305.5);
        ctx.lineTo(466.8, 311.3);
        ctx.lineTo(464.8, 315.7);
        ctx.lineTo(461.4, 316.7);
        ctx.lineTo(454.8, 311.3);
        ctx.lineTo(453.6, 298.2);
        ctx.lineTo(459.2, 291.6);
        ctx.lineTo(471.4, 284.0);
        ctx.lineTo(471.4, 270.8);
        ctx.lineTo(466.3, 270.8);
        ctx.lineTo(463.6, 268.6);
        ctx.lineTo(425.2, 268.1);
        ctx.lineTo(424.7, 263.4);
        ctx.lineTo(426.7, 260.8);
        ctx.lineTo(423.0, 256.6);
        ctx.lineTo(423.0, 253.9);
        ctx.lineTo(417.7, 249.5);
        ctx.lineTo(394.2, 250.5);
        ctx.lineTo(396.4, 255.1);
        ctx.lineTo(404.7, 267.6);
        ctx.lineTo(406.4, 268.8);
        ctx.lineTo(397.9, 273.2);
        ctx.lineTo(395.7, 277.1);
        ctx.lineTo(392.0, 277.6);
        ctx.lineTo(393.2, 281.8);
        ctx.lineTo(402.5, 288.1);
        ctx.lineTo(404.2, 295.0);
        ctx.lineTo(405.9, 306.7);
        ctx.lineTo(407.6, 308.4);
        ctx.lineTo(408.1, 313.8);
        ctx.lineTo(409.6, 319.7);
        ctx.lineTo(411.8, 323.3);
        ctx.lineTo(410.3, 335.3);
        ctx.lineTo(412.0, 338.0);
        ctx.lineTo(410.8, 347.0);
        ctx.lineTo(396.2, 347.0);
        ctx.lineTo(391.0, 338.0);
        ctx.lineTo(381.2, 348.0);
        ctx.lineTo(375.6, 352.9);
        ctx.lineTo(365.8, 354.8);
        ctx.lineTo(369.0, 357.8);
        ctx.lineTo(366.1, 363.4);
        ctx.lineTo(358.3, 365.4);
        ctx.lineTo(358.5, 378.8);
        ctx.lineTo(339.7, 388.8);
        ctx.lineTo(80.9, 388.8);
        ctx.lineTo(81.9, 383.9);
        ctx.lineTo(78.9, 380.5);
        ctx.lineTo(78.9, 363.2);
        ctx.lineTo(84.1, 354.1);
        ctx.lineTo(84.8, 337.5);
        ctx.lineTo(81.1, 335.5);
        ctx.lineTo(81.9, 331.1);
        ctx.lineTo(78.9, 327.5);
        ctx.lineTo(67.9, 328.5);
        ctx.lineTo(65.3, 334.3);
        ctx.lineTo(65.3, 343.9);
        ctx.lineTo(52.5, 350.9);
        ctx.lineTo(45.5, 352.4);
        ctx.lineTo(39.6, 347.3);
        ctx.lineTo(33.7, 346.1);
        ctx.lineTo(30.8, 346.1);
        ctx.lineTo(32.3, 341.2);
        ctx.lineTo(30.8, 336.8);
        ctx.lineTo(28.8, 331.9);
        ctx.lineTo(22.5, 329.2);
        ctx.lineTo(20.5, 318.2);
        ctx.lineTo(32.0, 308.2);
        ctx.lineTo(38.6, 306.9);
        ctx.lineTo(38.4, 302.3);
        ctx.lineTo(43.0, 299.9);
        ctx.lineTo(36.7, 296.9);
        ctx.lineTo(33.2, 300.4);
        ctx.lineTo(17.8, 298.9);
        ctx.lineTo(10.3, 294.5);
        ctx.lineTo(2.0, 284.0);
        ctx.lineTo(3.7, 282.5);
        ctx.lineTo(0.0, 277.1);
        ctx.lineTo(10.3, 271.0);
        ctx.lineTo(30.8, 270.5);
        ctx.lineTo(34.2, 274.4);
        ctx.lineTo(39.6, 274.4);
        ctx.lineTo(40.3, 270.8);
        ctx.lineTo(48.4, 270.5);
        ctx.lineTo(50.3, 273.7);
        ctx.lineTo(54.5, 271.5);
        ctx.lineTo(57.9, 273.7);
        ctx.lineTo(59.6, 271.5);
        ctx.lineTo(56.0, 267.8);
        ctx.lineTo(59.4, 265.6);
        ctx.lineTo(56.0, 257.6);
        ctx.lineTo(51.3, 249.0);
        ctx.lineTo(55.2, 246.3);
        ctx.lineTo(50.3, 244.4);
        ctx.lineTo(48.4, 241.5);
        ctx.lineTo(44.2, 241.5);
        ctx.lineTo(44.5, 230.0);
        ctx.lineTo(46.7, 223.9);
        ctx.lineTo(43.5, 219.5);
        ctx.lineTo(36.7, 219.5);
        ctx.lineTo(34.2, 210.2);
        ctx.lineTo(47.9, 194.5);
        ctx.lineTo(57.4, 194.3);
        ctx.lineTo(63.5, 198.2);
        ctx.lineTo(68.2, 198.9);
        ctx.lineTo(68.2, 195.5);
        ctx.lineTo(73.3, 196.5);
        ctx.lineTo(78.9, 192.8);
        ctx.closePath();
        ctx.fillStyle = "rgb(45, 167, 224)";
        ctx.fill();
        ctx.restore();
    	
    }
  </script>
</head>
<body>
	<div>
	<canvas id="canvas1" width="567" height="641"></canvas>
	<canvas id="canvas2" width="567" height="641"></canvas>
	<canvas id="canvas3" width="567" height="641"></canvas>
	</div>
</body>
</html>