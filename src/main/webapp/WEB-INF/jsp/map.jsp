<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<link rel="stylesheet" href="../css/main_custom.css" />
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css"/>
<html>
	<style>
		.sky-blue-text {
		  color: blue;
		}

		.wrap {position: absolute;left: 0;bottom: 40px;width: 288px;height: 132px;margin-left: -144px;text-align: left;overflow: hidden;font-size: 12px;font-family: 'Malgun Gothic', dotum, '돋움', sans-serif;line-height: 1.5;}
    .wrap * {padding: 0;margin: 0;}
    .wrap .info {width: 286px;height: 120px;border-radius: 5px;border-bottom: 2px solid #ccc;border-right: 1px solid #ccc;overflow: hidden;background: #fff;}
    .wrap .info:nth-child(1) {border: 0;box-shadow: 0px 1px 2px #888;}
    .info .title {padding: 5px 0 0 10px;height: 30px;background: #eee;border-bottom: 1px solid #ddd;font-size: 18px;font-weight: bold;}
    .info .close {position: absolute;top: 10px;right: 10px;color: #888;width: 17px;height: 17px;background: url('https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/overlay_close.png');}
    .info .close:hover {cursor: pointer;}
    .info .body {position: relative;overflow: hidden;}
    .info .desc {position: relative;margin: 13px 0 0 90px;height: 75px;}
    .desc .ellipsis {overflow: hidden;text-overflow: ellipsis;white-space: nowrap;}
    .desc .jibun {font-size: 11px;color: #888;margin-top: -2px;}
    .info .img {position: absolute;top: 6px;left: 5px;width: 73px;height: 71px;border: 1px solid #ddd;color: #888;overflow: hidden;}
    .info:after {content: '';position: absolute;margin-left: -12px;left: 50%;bottom: 0;width: 22px;height: 12px;background: url('https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/vertex_white.png')}
    .info .link {color: #5085BB;}
		
	  </style>
<head>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta charset="utf-8">
	<title>다음 지도 API</title>
</head> 
<body>

   <!-- 메뉴바 ----------------------------------------------------------------------------------------------------------->
   <div class="container main_custom_menubar">
		<header class="d-flex flex-wrap align-items-center justify-content-end py-3 mb-3 me-2">
			<a class="nav-link logo_custom"></a>
			<c:if test="${sessionScope.mvo == null}">
				<div class="col-md-3 text-end ms-auto">
					<button type="button" class="btn btn-outline-success me-2 mycustom-mem-btn" onclick="location.href='/login'">로그인</button>
					<button type="button" class="btn btn-outline-success mycustom-mem-btn" onclick="location.href='/join'">회원가입</button>
				</div>
			</c:if>
		</header>
	</div>
	<!-- 메뉴바끝 ----------------------------------------------------------------------------------------------------------->
	


	<div class ="container-fluid text-center" >
		<div class="row justify-content-center" >

			<div class="col-md-12" >
				<a href="/main"><img style="max-width: 300px;" src="../main_images/logo.png"></a>  
			</div>

		</div>
	</div>

	
<div class="container" style="max-width: 800px;">
	<div class="row justify-content-center" style="max-width:100%;">
		<div class="col-md-6 row-cols-1 row-cols-md-3 g-4" style="width:100%; padding-right: 0px;">
			<div class="input_area col-md-12 mx-auto card shadow p-3 mb-4 bg-body rounded" style="margin: 0 auto; border:none; width:100%; padding: 0; ">
				<div class="card-header">
					마이휴가 추천하는 지금 날씨에 먹기 좋은 음식!
				  </div>
				<div class="card-body align-items-center">
					<div class = "row justify-content-evenly ">
						<div class="mycustom-weather col-md-3 d-flex align-items-center"    style="justify-content: center;">
							<div id="weather" class="me-3" ></div>
						</div>
						<div class="mycustom-weather col-md-3 d-flex align-items-center"  style=" justify-content: center; padding-left:60px">
						<div id="tem"class="me-5" style="text-align: center; font-size: 25px; font-weight: bold;"></div>
							
						</div>
						<div class="col-md-2" id ="recommFood" style="text-align: center;">
						
						</div>
					
						<div class="col-md-2" id ="recommFood1" style="text-align: center;">
							
						</div>
						<div class="col-md-2" id ="recommFood2" style="text-align: center;">
							
						</div>
						
					</div>
				</div>
			</div>
		</div>
	</div>
</div>




	<!-------------------------------------------------------------------------------------------->
	<!-- <div class="container d-flex flex-wrap align-items-center justify-content-center" style="border: 1px solid black; width:800px;">
		<div class="mycustom-weather">
			<div id="weather" ></div>
			<div id="tem" style="text-align: center; font-size: 25px;"></div>
		</div>
		<div class="row row-cols-1 row-cols-md-3 g-4">
			<div class="col">
				
			  <div class="card h-100" style="width: 200px;">
				<img src="../images/raining.png" class="card-img-top" alt="...">
				
				
			  </div>
			</div>
			<div class="col">
			  <div class="card h-100" style="width: 200px;">
				<img src="../images/sun.png" class="card-img-top" alt="...">
			  </div>
			</div>
			<div class="col">
			  <div class="card h-100" style="width: 200px;">
				<img src="../images/snow.png" class="card-img-top" alt="...">
			  </div>
			</div>
		  </div>
	

	</div> -->
	<form action="menu" method="get" id="frm">
		<input type="hidden" id="RestNm" name="RestNm" value=""/>
	</form>


	<div class="container d-flex flex-wrap align-items-center justify-content-center mycustom-map_area" style="max-width: 800px;">

		<button class="mycustom-order_btn" type="button" onclick="exe()">
			<span><img class="mycustom-order_icon" src="https://cdn-icons-png.flaticon.com/512/4645/4645316.png"/></span>
			주문하기
		</button>
		
		<div id="map" style="width: 100%; height: 500px;"></div>
	</div>

	
	<div class="container" id="accordionExample">
		<div class="row">
			<div class="container align-items-center justify-content-center mycustom-line_search_accordion_area" style="max-width: 800px; padding: 0;">
				<div class="accordion accordion-flush">
					
					
						
					<div class="accordion-item mycustom-line_search_info mycustom_now_info" style="width: 100%;">
						<h2 class="accordion-header" id="panelsStayOpen-headingOne" style="width: 100%;">
							<button style="width: 100%; padding: 10px;" class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#panelsStayOpen-collapseOne" aria-expanded="true" aria-controls="panelsStayOpen-collapseOne">
								<img class="mycustom-line_search_img" style="object-fit: contain;" src="../main_images/hand2.png"/>
								<ul class="mycustom-line_search_ul" id="unitName" > 
							</button>
						</h2>
						<div id="panelsStayOpen-collapseOne" class="accordion-collapse collapse show" aria-labelledby="panelsStayOpen-headingOne">
							<div class="accordion-body" style="padding:0">
								<div class="container" style="padding:0">
									<p id="unitName"></p> 
									<div id="resultContainer"></div>
									<div id="resultContainer2"></div>
									
								</div>
							</div>
						</div>
					</div>
					
					
				</div>
			</div>
		</div>
	</div>
	<!-- 아코디언 끝-->

	<!-- footer 시작---------------------------------------------------------------------------------------------->
    <body class="d-flex flex-column">
        <footer id="sticky-footer" class="flex-shrink-0 py-4 bg-dark text-white-50">
          <div class="container text-center">
            <small>Copyright &copy; 2023 팀이름 </small>
          </div>
        </footer>

    </body> 
    <!-- footer 끝---------------------------------------------------------------------------------------------->

	
	

	<script src="https://code.jquery.com/jquery-3.7.0.js" integrity="sha256-JlqSTELeR4TLqP0OG9dxM7yDPqX1ox/HfgiSLBj8+kM=" crossorigin="anonymous"></script>
	<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=092a22d4a329417bd5fb9544ca6bb378"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>


	<script>

		var unitName;
		

		

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
							unitName = response.unitName;
							var routeName = response.routeName;

							var locPosition = new kakao.maps.LatLng(mapY, mapX);
							var message = '<div style="padding:5px;">'+unitName+'</div>';


							var avg = response.avg;

							// 휴게소 정보
							var info = response.info;
							var rest = response.rest;
							var review = response.review;

							var locPosition = new kakao.maps.LatLng(mapY, mapX);
						
							$("#unitName").text(unitName);
							$("#routeName").text(routeName);

							// 날씨 정보
							var unitName2 = response.unitName2;
							var weatherContents = response.weatherContents;
							var tempValue = response.tempValue;
							
							// 날씨 상태에 따른 이미지
							if(weatherContents.includes("구름조금"))
							var imgSrc = "../images/cloudy.png"; 
							else if(weatherContents.includes("구름많음"))
							var imgSrc = "../images/cloud.png"; 
							else if(weatherContents.includes("맑음"))
							var imgSrc = "../images/sun.png"; 
							else if(weatherContents.includes("비"))
							var imgSrc = "../images/raining.png"; 
							else if(weatherContents.includes("눈"))
							var imgSrc = "../images/snow.png"; 
							else
							var imgSrc = "../images/cloud	.png"; 

							var icon = "../images/free-icon-celsius-481431.png";

							var imgElement = $("<img>").attr("src", imgSrc).css("width", "70px");
							var temDiv = $("#tem");
							var imgElement2 = $("<img>").attr("src", icon).css("width", "30px");
							var spanElement = $("<span>").text(parseInt(tempValue));

							$("#weather").empty().append(imgElement);

							var containerDiv = $("<div>").css("display", "flex");
							containerDiv.append(spanElement).append(imgElement2);
							temDiv.append(containerDiv);

							// 음식 정보
							var far = response.far;
							

							var food_img = null;

							/*
							for(var i = 0; i < far.length; i++) {
							//	console.log("i="+i);
							summerFood = null;
							winterFood = null;
							allFood = null;
								

								if(far[i].seasonMenu === "S") {
									summerFood = far[i].f_image;
									
								//	console.log(far[i].seasonMenu);
								} else if(far[i].seasonMenu === "W") {
									winterFood = far[i].f_image;
								//	console.log(far[i].seasonMenu);
							
								} else if(far[i].seasonMenu === "4") {
									allFood = far[i].f_image;
									
								}
								
							
								sFoodImg = $("<img>").attr("src", summerFood).css("width", "70px");
								
								wFoodImg = $("<img>").attr("src", winterFood).css("width", "70px");
							
								aFoodImg = $("<img>").attr("src", allFood).css("width", "70px");
								
						


								if(parseInt(tempValue) >= 26)
								$("#recommFood").append(sFoodImg[0].outerHTML);
								else if(parseInt(tempValue) <= 10)
								$("#recommFood").append(wFoodImg[0].outerHTML);
								else if(parseInt(tempValue) < 26 && parseInt(tempValue) > 10)
								$("#recommFood").append(aFoodImg[0].outerHTML);
								
							}
							*/
							

							for(var i = 0; i < 1; i++) {
								food_img = $("<img>").attr("src", far[0].f_image).css({"width": "80px", "height": "50px"});
								food_img1 = $("<img>").attr("src", far[1].f_image).css({"width": "80px", "height": "50px"});
								food_img2 = $("<img>").attr("src", far[2].f_image).css({"width": "80px", "height": "50px"});
								$("#recommFood").append(food_img[0].outerHTML).append($("<span>").text(far[0].foodNm).css({
																															"display": "flex",
																															"justify-content": "center",
																																																														
																															}));
								$("#recommFood1").append(food_img1[0].outerHTML).append($("<span>").text(far[1].foodNm).css({
																															"display": "flex",
																															"justify-content": "center",
																																	
																															}));
								$("#recommFood2").append(food_img2[0].outerHTML).append($("<span>").text(far[2].foodNm).css({
																															"display": "flex",
																															"justify-content": "center",
																																	
																															}));
								
							}
							// 마커와 인포윈도우를 표시합니다
							var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
							mapOption = {
								center: locPosition, // 지도의 중심좌표
								level: 2, // 지도의 확대 레벨
								mapTypeId : kakao.maps.MapTypeId.ROADMAP // 지도종류
							}; 

							// 지도를 생성한다 
							var map = new kakao.maps.Map(mapContainer, mapOption); 


							var marker = new kakao.maps.Marker({
								map: map, 
								position: locPosition
							});

							// 커스텀 오버레이에 표시할 컨텐츠 입니다
							// 커스텀 오버레이는 아래와 같이 사용자가 자유롭게 컨텐츠를 구성하고 이벤트를 제어할 수 있기 때문에
							// 별도의 이벤트 메소드를 제공하지 않습니다 
							var content = '<div class="wrap" id="overlay">' + 
										'    <div class="info">' + 
										'        <div class="title">' + 
																unitName + 
										'            <div class="close" onclick="closeOverlay()" title="닫기"></div>' + 
										'        </div>' + 
										'        <div class="body">' + 
										'            <div class="img">' +
										'                <img src="../main_images/hand2.png" width="73" height="70">' +
										'           </div>' + 
										'            <div class="desc">' + 
										'                <div class="ellipsis">'+info[0].svarAddr+'</div>' + 
											'                <div class="jibun ellipsis"><img src="../images/star.png" style="width:30px; height:30px; padding-bottom:5px">&nbsp;'+avg+ "&nbsp;리뷰"+'('+review+')'+'</div>' + 
										'             </div>' + 
										'        </div>' + 
										'    </div>' +    
										'</div>';

							// 마커 위에 커스텀오버레이를 표시합니다
							// 마커를 중심으로 커스텀 오버레이를 표시하기위해 CSS를 이용해 위치를 설정했습니다
							var overlay = new kakao.maps.CustomOverlay({
								content: content,
								map: map,
								position: marker.getPosition()       
							});

							// 마커를 클릭했을 때 커스텀 오버레이를 표시합니다
							kakao.maps.event.addListener(marker, 'click', function() {
								overlay.setMap(map);
							});

							// 커스텀 오버레이를 닫기 위해 호출되는 함수입니다 
							function closeOverlay() {
								overlay.setMap(null);  
								document.getElementById("overlay").style.display = "none";
							}
							
						//	displayMarker(locPosition);
							
							
							// 휴게소의 브랜드 매장 정보
							var info = response.info;
							var rest = response.rest;
							var resultHTML = "";
							var resultHTML2 = "";

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
								

								resultHTML += `
									<div class="card mb-3">
									<div class="card-body ">
										<h5 class="card-title sky-blue-text">브랜드명: `+brdName+`</h5>
										<p class="card-text">상세내용: `+brdDesc+`</p>
										<p class="card-text">시작시간: `+stime+`</p>
										<p class="card-text">종료시간: `+etime+`</p>
									</div>
									</div>`;
							}

							for(var i = 0 ; i < rest.length; i++){
								if(rest[i].psName != null)
								var psName = rest[i].psName;
								else
								var psName = "정보 없음";
								if(rest[i].psDesc != null)
								var psDesc = rest[i].psDesc;
								else
								var psDesc = "정보 없음";

								resultHTML2 += `
												<div class="card mb-3">
												<div class="card-body">
													<h5 class="card-title sky-blue-text">편의시설: `+psName+`</h5>
													<p class="card-text">상세내용: `+psDesc+`</p>
												</div>
												</div>`;
							}

							document.getElementById('resultContainer').innerHTML = resultHTML;
							document.getElementById('resultContainer2').innerHTML = resultHTML2;

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

		function exe() {
			document.getElementById("RestNm").value = unitName;
	
			document.getElementById("frm").submit();
		}
		
	</script>
</body>
</html>