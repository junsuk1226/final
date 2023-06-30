<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<link rel="stylesheet" href="../css/main_custom.css" />
<link rel="stylesheet" href="../css/menu.css" />
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.3/font/bootstrap-icons.css">
</head>
<body>
    
    <!-- 메뉴바 ----------------------------------------------------------------------------------------------------------->
    <div class="container main_custom_menubar">
        <header class="d-flex flex-wrap align-items-center justify-content-sm-between py-3">
            <!-- <a class="nav-link logo_custom" href="/main">내 손안에 휴게소</a> -->
            <div class="col-md-3">
                <a href="/main"><img style="max-width: 200px;" src="../main_images/logo.png"/></a>
            </div>
            <c:if test="${sessionScope.mvo == null}">
                <div class="col-md-3 text-end mt-2">
                    <button type="button" class="btn btn-outline-success me-2 mycustom-mem-btn" onclick="location.href='/login'">로그인</button>
                    <button type="button" class="btn btn-outline-success mycustom-mem-btn" onclick="location.href='/join'">회원가입</button>
                </div>
            </c:if>
            <c:if test="${sessionScope.mvo != null}">
            <div class="col-md-4 text-end"> 
                <button type="button" class="btn btn-outline-success me-2 mycustom-mem-btn" onclick="location.href='/logout'">로그 아웃</button>
                <button type="button" class="btn btn-outline-success mycustom-mem-btn" onclick="location.href='/myPage'">마이페이지</button>
                
        </div>
            </c:if>
        </header>
    </div>
    <!-- 메뉴바끝 ----------------------------------------------------------------------------------------------------------->

    <div class="container" style="max-width: 700px;">
        <c:if test="${r_photo != '../images/rest_default_photo.png' && r_photo != null}">
            <img class="mycustom-menuList_main_image" src="${r_photo}">
        </c:if>
        <c:if test="${r_photo == '../images/rest_default_photo.png' || r_photo == null}">
            <img class="mycustom-menuList_main_image" src="../main_images/hand2.png">
        </c:if>
    </div>

    <!-- tab 영역------------------------------------------------------------------------------------------------------------>
    <div class="sticky-top mycustom-sticky_menu">
        <div class="container" style="max-width: 700px;">
            <div style="border: 1px solid #bebebe; border-left:0; border-right:0; margin: 10px 0px;">
                <h1 class="mycustom-rest_name">${favo.serviceAreaName}</h1>
                <h3 class="mycustom-rest_direction">${favo.direction} 방향</h3>
            </div>
                <div class="container" style="max-width: 700px; margin-bottom: 10px;">
                    <button style="width: 100%;" class="btn btn-outline-success me-2 mycustom-mem-btn"  onclick="location.href='/cart'">장바구니</button>
                </div>
                <div class="row">
                    <div class="col">
                        <ul class="nav nav-tabs" id="myTab" role="tablist" style="max-width: 100%;">
                            <li class="nav-item mycustom-nav_item" role="presentation" style="max-width: 33%;">
                                <button onclick="hide()" class="nav-link active mycustom-nav_btn" id="menu-tab" data-bs-toggle="tab" data-bs-target="#menu-tab-pane" type="button" role="tab" aria-controls="menu-tab-pane" aria-selected="true">
                                    메뉴
                                </button>
                            </li>
                            <li class="nav-item mycustom-nav_item" role="presentation" style="max-width: 33%;">
                                <button onclick="show()" class="nav-link mycustom-nav_btn" id="info-tab" data-bs-toggle="tab" data-bs-target="#info-tab-pane" type="button" role="tab" aria-controls="info-tab-pane" aria-selected="false">
                                    정보
                                </button>
                            </li>
                            <li class="nav-item mycustom-nav_item" role="presentation" style="max-width: 34%;">
                                <button onclick="hide()" class="nav-link mycustom-nav_btn" id="review-tab" data-bs-toggle="tab" data-bs-target="#review-tab-pane" type="button" role="tab" aria-controls="review-tab-pane" aria-selected="false">
                                    리뷰
                                </button>
                            </li>
                        </ul>
                    </div>
                </div>
            
        </div>
    </div>
    

    <div class="container" style="max-width: 700px;">

        <div class="tab-content mycustom-tab_content" id="myTabContent">
            <!-- 메뉴 ------------------------------------------------------------------------------------------------------>
            <div class="tab-pane fade show active" id="menu-tab-pane" role="tabpanel" aria-labelledby="menu-tab" tabindex="0">
                
                <div class="container d-flex flex-wrap justify-content-center" style="padding:0px">
                    <ul class="list-group" style="max-width: 700px; width: 100%;">
                        
                        <!-- 반복문 돌릴구간 ---------------------------->
                        <c:forEach var="fvo" items="${fList}">
                            <form action="/menu/info">
                                <input type="hidden" name="RestNm" value="${RestNm}">
                                <input type="hidden" name="foodCost" value="${fvo.foodCost}">
                                <input type="hidden" name="foodNm" value="${fvo.foodNm}">
                                <input type="hidden" name="foodMaterial" value="${fvo.foodMaterial}">
                                <input type="hidden" name="etc" value="${fvo.etc}">
                                <input type="hidden" name="f_image" value="${fvo.f_image}">
                                <c:if test="${r_photo != '../images/rest_default_photo.png' || r_photo != null}">
                                    <input type="hidden" name="r_photo" value="${r_photo}">
                                </c:if>
                                <c:if test="${r_photo == '../images/rest_default_photo.png' || r_photo == null}">
                                    <input type="hidden" name="r_photo" value="../main_images/hand2.png">
                                </c:if>
                                
                                
                                
                                <button type="submit" class="mycustom-menu_list_btn">
                                    <li class="list-group-item mycustom-menu_list_group_item">
                                        <div class="d-flex">
                                            <div class="mycustom-menu_img">
                                                <img class="mycustom-menu_img position-relative" src="${fvo.f_image}">
                                            </div>
                                            <div class="mycustom-menu_info">
                                                <h3>${fvo.foodNm} <c:if test="${fvo.bestfoodyn eq 'Y'}"><img class="mycustom-menu_img" src="../images/recommend.png" style="width:30px; height: 30px;"></c:if></h3>
                                                <a>
                                                    <c:set var="formattedCost" value="${fvo.foodCost}" />
                                                    <fmt:formatNumber value="${formattedCost}" pattern="###,###원" />
                                                </a>
                                            
                                        </div>
                                    </div>
                                </li>
                            </button>

                            </form>
                        </c:forEach>

                        <c:forEach var="fvo" items="${fvo}">
                            <form action="/menu/info">
                                <input type="hidden" name="RestNm" value="${RestNm}">
                                <input type="hidden" name="foodCost" value="${fvo.foodCost}">
                                <input type="hidden" name="foodNm" value="${fvo.foodNm}">
                                <input type="hidden" name="foodMaterial" value="${fvo.foodMaterial}">
                                <input type="hidden" name="etc" value="${fvo.etc}">
                                
                                <input id="addr" type="hidden" name="svarAddr" value="${favo.svarAddr}">
                                
                                <button type="submit" class="mycustom-menu_list_btn">
                                    <li class="list-group-item mycustom-menu_list_group_item">
                                        <div class="d-flex">
                                        <c:if test="${fvo.f_image != null}">
                                            <div class="mycustom-menu_img">
                                                <img class="mycustom-menu_img" src="${fvo.f_image}"><!-- 메뉴 사진-->
                                            </div>
                                        </c:if>
                                        <div class="mycustom-menu_info">
                                            <h3>${fvo.foodNm}</h3>
                                            <a>
                                                <c:set var="formattedCost" value="${fvo.foodCost}" />
                                                <fmt:formatNumber value="${formattedCost}" pattern="###,###원" />
                                            </a>
                                        </div>
                                        </div>
                                    </li>
                                </button>

                            </form>
                        </c:forEach>
                        <!---------------------------------------------->

                        
                    </ul>
                </div>

            </div>
            <!-- 메뉴 끝------------------------------------------------------------------------------------------------->

            <!-- 휴게소정보 ---------------------------------------------------------------------------------------------->
            
            <div id="info-tab-pane" style="max-width: 680px; height: 350px;"  role="tabpanel" aria-labelledby="info-tab" tabindex="1"></div>
            <div class="container justify-content-center tab-pane fade" id="info-tab-pane2" style="padding: 0">
                <div class="card mycustom-restInfo_card">
                    <div class="card-body shadow-sm">
                        <h5 class="mycustom-restInfo_card_title">영업정보</h5>
                        <p class="mycustom-restInfo_card_text">노선명: ${favo.routeName}</p>
                        <p class="mycustom-restInfo_card_text">주소: ${favo.svarAddr}</p>
                        <p class="mycustom-restInfo_card_text">연락처: ${favo.telNo}</p>
                    </div>
                </div> 
                <div class="card mycustom-restInfo_card">
                    <div class="card-body shadow-sm">
                        <h5 class="mycustom-restInfo_card_title">편의시설 정보</h5>
                        <p class="mycustom-restInfo_card_text">편의시설: ${favo.convenience}</p>
                        <p class="mycustom-restInfo_card_text">브랜드: ${favo.brand}</p>
                        <p class="mycustom-restInfo_card_text">화물 휴게소 유무: ${favo.truckSaYn}</p>
                        <p class="mycustom-restInfo_card_text">경정비 유무: ${favo.truckSaYn}</p>
                    </div>
                </div>
            </div>
            
            <!-- 휴게소정보 끝 -------------------------------------------------------------------------------------------->
           
            <!-- 리뷰 ----------------------------------------------------------------------------------------------------->
            <div class="tab-pane fade" id="review-tab-pane" role="tabpanel" aria-labelledby="review-tab" tabindex="2">
                <div class="container d-flex flex-wrap justify-content-center">
                    <ul class="list-group list-group-flush" style="max-width: 700px; width: 100%;">

                        <c:forEach var="rvo" items="${rList}">
                            <!-- 반복문 돌릴구간-->
                            <li class="list-group-item" style="padding: 0;">
                                <div class="card mycustom-review_card" style="width: 100%">
                                    <div class="card-body" style="padding: 0;">
                                        <h6 class="card-title" style="margin-top: 10px;">
                                            ${rvo.m_name}
                                        </h6>
                                        <h6 class="card-subtitle mb-2 text-muted">
                                            <div class="col-md-3 my-2 me-5 justify-content-center">
                                                <c:forEach begin="1" end="${rvo.r_score}">
                                                    <i class="bi bi-star-fill" style="color: #FBB202;"></i>
                                                </c:forEach>
                                                <c:forEach begin="1" end="${5 - rvo.r_score}">
                                                    <i class="bi bi-star" style="color: #FBB202;"></i>
                                                </c:forEach>
                                                <h6>
                                                    ${rvo.r_writedate}
                                                </h6>
                                            </div>
                                            
                                        </h6>
                                        <p class="card-text">
                                            <!-- 리뷰 사진이 null이 아닐경우-->
                                            <c:if test="${rvo.r_file != null}">
                                                <img style="width: 100%;" src="/editor_upload/${rvo.r_file}">
                                            </c:if>
                                            <h6>${rvo.r_content}</h6>
                                        </p>
                                    </div>
                                </div>
                            </li>
                            <!-------------------->
                        </c:forEach>
                    </ul>
                </div>
            </div>
            <!-- 리뷰 끝--------------------------------------------------------------------------------------------------->
        </div>
    </div>
    <!-- tab 영역 끝------------------------------------------------------------------------------------------------>

    <!-- footer 시작----------------------------------------------------------------------------------------------> 
    <footer id="sticky-footer" class="flex-shrink-0 py-4 bg-dark text-white-50 mycustom-main_footer">
        <div class="container text-center">
            <small>Copyright &copy; 2023 마이휴 </small>
        </div>
    </footer>
    <!-- footer 끝---------------------------------------------------------------------------------------------->
    
    <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=092a22d4a329417bd5fb9544ca6bb378&libraries=services"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
    <script>

        var addr = $("#addr").val();
            
        var mapContainer = document.getElementById('info-tab-pane'), // 지도를 표시할 div 
        mapOption = {
            center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
            draggable: false,
            level: 3 // 지도의 확대 레벨
        };  

        // 지도를 생성합니다    
        var map = new kakao.maps.Map(mapContainer, mapOption); 

        // 주소-좌표 변환 객체를 생성합니다
        var geocoder = new kakao.maps.services.Geocoder();

        // 주소로 좌표를 검색합니다
        geocoder.addressSearch(addr, function(result, status) {

            // 정상적으로 검색이 완료됐으면 
            if (status === kakao.maps.services.Status.OK) {

                var coords = new kakao.maps.LatLng(result[0].y, result[0].x);

                // 결과값으로 받은 위치를 마커로 표시합니다
                var marker = new kakao.maps.Marker({
                    map: map,
                    position: coords
                });

                // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
                map.setCenter(coords);
            } 
        });
   

        
        
        $("#info-tab-pane").addClass("tab-pane fade");


        function show(){
            $("#info-tab-pane2").addClass("show active");
        }

        function hide(){
            $("#info-tab-pane2").removeClass("show active");
        }
    </script>
</body>
</html>