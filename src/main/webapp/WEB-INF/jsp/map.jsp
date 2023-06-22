<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<html>
<head>
	<meta charset="utf-8">
	<title>다음 지도 API</title>
</head>
<body>
	<div id="map" style="width:700px;height:500px;"></div>

	<p id="unitName"></p>
	<p id="routeName"></p>
	<div id="resultContainer"></div>

	

	<script src="https://code.jquery.com/jquery-3.7.0.js" integrity="sha256-JlqSTELeR4TLqP0OG9dxM7yDPqX1ox/HfgiSLBj8+kM=" crossorigin="anonymous"></script>
	<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=092a22d4a329417bd5fb9544ca6bb378"></script>


	<script>
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
		    mapOption = {
		        center: new kakao.maps.LatLng(37.56623, 126.97856), // 지도의 중심좌표
		        level: 2, // 지도의 확대 레벨
		        mapTypeId : kakao.maps.MapTypeId.ROADMAP // 지도종류
		    }; 

		// 지도를 생성한다 
		var map = new kakao.maps.Map(mapContainer, mapOption); 

		// HTML5의 geolocation으로 사용할 수 있는지 확인합니다 
		if (navigator.geolocation) {
			
			// GeoLocation을 이용해서 접속 위치를 얻어옵니다
			navigator.geolocation.getCurrentPosition(function(position) {
				
				var lat = position.coords.latitude, // 위도
					lon = position.coords.longitude; // 경도

					$.ajax({
						url: 'reqMap',
						type: 'POST',
						data: {
							lat: lat,
							lon: lon
						},
						dataType: 'json', // 데이터 타입을 JSON으로 지정
						success: function(response) {
							// 요청이 성공했을 때의 동작
							console.log('위도와 경도를 controller로 전달했습니다.');
							console.log(response); // controller에서 반환한 응답 데이터

							var mapX = response.xValue;
							var mapY = response.yValue;
							var unitName = response.unitName;
							var routeName = response.routeName;

							var locPosition = new kakao.maps.LatLng(mapY, mapX);
							var message = '<div style="padding:5px;">'+unitName+'</div>';

							$("#unitName").text(unitName);
							$("#routeName").text(routeName);

							

							// 마커와 인포윈도우를 표시합니다
							displayMarker(locPosition, message);

							var info = response.info;
							var resultHTML = "";

							for(var i = 0 ; i < info.length; i++){
								if(info[i].brdName != null)
								var brdName = info[i].brdName;
								else
								var bardName = "정보 없음";
								if(info[i].brdDesc != null)
								var brdDesc = info[i].brdDesc;
								else
								var brdDesc = "정보 없음";
								if(info[i].stime != null)
								var stime = info[i].stime;
								else
								var stime = "정보 없음";
								if(info[i].etime != null)
								var etime = info[i].etime;
								else
								var etime = "정보 없음";
								if(info[i].psName != null)
								var psName = info[i].psName;
								else
								var psName = "정보 없음";
								if(info[i].psDesc != null)
								var psDesc = info[i].psDesc;
								else
								var psDesc = "정보 없음";

								resultHTML += '<p>'+'브랜드명:'+brdName+'</p>'+ '<p>'+'상세내용:'+brdDesc+'</p>'+ '<p>'+'시작시간:'+stime+'</p>'
								+ '<p>'+'종료시간:'+etime+'</p>'+ '<p>'+'편의시설:'+psName+'</p>' + '<p>'+'상세내용:'+psDesc+'</p>' ;
							}

							document.getElementById('resultContainer').innerHTML = resultHTML;

						},
						error: function() {
							var locPosition = new kakao.maps.LatLng(33.450701, 126.570667);
							var message = 'geolocation을 사용할수 없어요..';
							
							displayMarker(locPosition, message);
						}
						});


				var locPosition = new kakao.maps.LatLng(lat, lon), // 마커가 표시될 위치를 geolocation으로 얻어온 좌표로 생성합니다
					message = '<div style="padding:5px;">여기에 계신가요?!</div>'; // 인포윈도우에 표시될 내용입니다
				
				// 마커와 인포윈도우를 표시합니다
				displayMarker(locPosition, message);
					
			});
			
		} else { // HTML5의 GeoLocation을 사용할 수 없을때 마커 표시 위치와 인포윈도우 내용을 설정합니다
			
			var locPosition = new kakao.maps.LatLng(33.450701, 126.570667),    
				message = 'geolocation을 사용할수 없어요..'
				
			displayMarker(locPosition, message);
		}	

		function displayMarker(locPosition, message) {

		// 마커를 생성합니다
		var marker = new kakao.maps.Marker({  
			map: map, 
			position: locPosition
		}); 

		var iwContent = message, // 인포윈도우에 표시할 내용
			iwRemoveable = true;

		// 인포윈도우를 생성합니다
		var infowindow = new kakao.maps.InfoWindow({
			content : iwContent,
			removable : iwRemoveable
		});

		// 인포윈도우를 마커위에 표시합니다 
		infowindow.open(map, marker);

		// 지도 중심좌표를 접속위치로 변경합니다
		map.setCenter(locPosition);      
		}    

		// 마커에 클릭 이벤트를 등록한다 (우클릭 : rightclick)
		kakao.maps.event.addListener(marker, 'click', function() {
		    alert('마커를 클릭했습니다!');
		});

	</script>
</body>
</html>