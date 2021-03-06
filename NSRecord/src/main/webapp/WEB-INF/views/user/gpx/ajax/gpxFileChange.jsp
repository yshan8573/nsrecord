<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<script>
	var mapContainer = document.getElementById('gpxMap'), // 지도를 표시할 div 
	mapOption = {
		center: new kakao.maps.LatLng(37.548541, 126.996463), // 지도의 중심좌표
		level: 5 // 지도의 확대 레벨
	};
	
	// 지도를 표시할 div와  지도 옵션으로  지도를 생성합니다
	var map = new kakao.maps.Map(mapContainer, mapOption);
	

	
	
	// 코스 좌표 담기
	var coursePoints = [];
	var latArr = [];
	var lonArr = [];

	// 지도를 재설정할 범위정보를 가지고 있을 LatLngBounds 객체를 생성합니다
	var bounds = new kakao.maps.LatLngBounds();
	
	<c:forEach items="${mapList }" var="map">
	
		var lat = "${map.lat }";
		var lon = "${map.lon }";
		var p = new kakao.maps.LatLng(lat, lon);
		coursePoints.push(p);
		latArr.push(lat);
		lonArr.push(lon);
		
		// LatLngBounds 객체에 좌표를 추가합니다
		bounds.extend(p);
		
	</c:forEach>
	
 	// polyline 속성 이용
	var polyline = new kakao.maps.Polyline({
		map : map,
		path : coursePoints,
		strokeWeight : 2,
		strokeColor : '#FF00FF',
		strokeOpacity : 1,
		strokeStyle : 'solid'
	});

	polyline.setMap(map); // 카카오맵에 적용

	// LatLngBounds 객체에 추가된 좌표들을 기준으로 지도의 범위를 재설정합니다
	// 이때 지도의 중심좌표와 레벨이 변경될 수 있습니다
	map.setBounds(bounds);
	
	
</script>

<div id="gpxMap" class="gpxMap" style="width: 100%; height: 350px;"></div>