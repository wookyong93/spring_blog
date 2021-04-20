<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>지도 생성하기</title>
    
</head>
<body>
<!-- 지도를 표시할 div 입니다 -->
<div id="map" style="width:100%;height:350px;"></div>

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=c57ee5f558f1ae2e69425ccf6a16bdb7"></script>
<script>
var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = { 
        center: new kakao.maps.LatLng(37.62547, 127.14848), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    };
    //?urlX=532777&urlY=1146221&urlLevel=3&itemId=1709325274&q=다산역경기행복주택아파트&srcid=1709325274&map_type=TYPE_MAP

// 지도를 표시할 div와  지도 옵션으로  지도를 생성합니다
var map = new kakao.maps.Map(mapContainer, mapOption); 
//지도에 마커를 생성하고 표시한다
var marker = new kakao.maps.Marker({
    position: new kakao.maps.LatLng(37.62547, 127.14848), // 마커의 좌표
    map: map // 마커를 표시할 지도 객체
});
</script>
</body>
</html>