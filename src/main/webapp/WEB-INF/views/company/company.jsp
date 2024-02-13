<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<meta charset="UTF-8">
<jsp:include page="../layout/header.jsp"></jsp:include>
<h1>company임!</h1>
	<div id="map" style="width: 100%; height:500px;"></div>
	
	
<script>
	var mapOptions = {
		center : new naver.maps.LatLng(37.3595704, 127.105399),
		zoom : 10
	};
	var map = new naver.maps.Map('map', mapOptions);
	
	//크기조절
	window.addEventListener('DOMContentLoaded', function(){
	    resize();
	    window.addEventListener('resize', resize);
	});
	 
	function resize(){
	    var mapWidth = window.innerWidth;
	    var mapHeight = window.innerHeight  - document.getElementById('appHead').offsetHeight 
	                                        - document.getElementById('appFooter').offsetHeight;
	    var Size = new naver.maps.Size(mapWidth, mapHeight);
	    map.setSize(Size);
	}
</script>
<jsp:include page="../layout/footer.jsp"></jsp:include>


