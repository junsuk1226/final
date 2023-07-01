<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Insert title here</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
    <link rel="stylesheet" href="../css/main_custom.css" />
</head>

<body>

    <!-- 메뉴바 ----------------------------------------------------------------------------------------------------------->
    <div class="container main_custom_menubar">
        <header class="d-flex justify-content-between py-3">
            <div class="col-md-3">
                <a href="/main"><img style="max-width: 180px;" class="pb-3" src="../main_images/logo.png"/></a>
            </div>
            <c:if test="${sessionScope.mvo == null}">
                <div class="col-md-3 text-end d-flex align-items-center">
                    <button type="button" class="btn btn-outline-success me-2 mycustom-mem-btn" onclick="location.href='/login'">로그인</button>
                    <button type="button" class="btn btn-outline-success mycustom-mem-btn" onclick="location.href='/join'">회원가입</button>
                </div>
            </c:if>
            <c:if test="${sessionScope.mvo != null}">
            <div class="col-md-3 text-end d-flex align-items-center"> 
                <button type="button" class="btn btn-outline-success me-2 mycustom-mem-btn" onclick="location.href='/logout'">로그 아웃</button>
                <button type="button" class="btn btn-outline-success mycustom-mem-btn" onclick="location.href='/myPage'">마이페이지</button>
            </div>
            </c:if>
        </header>
    </div>
    <!-- 메뉴바끝 ----------------------------------------------------------------------------------------------------------->

    <div class="container d-flex flex-wrap align-items-center justify-content-center mycustom-line_search_btn_area">
        <button class="mycustom-line_search_btn" id="dLabel" type="button" data-bs-toggle="dropdown" aria-expanded="false">
            <c:if test="${lineName == null}">
                노선으로 휴게소 검색
            </c:if>
            <c:if test="${lineName != null}">
                ${lineName}
            </c:if>
          </button>
        <ul class="dropdown-menu mycustom-line_search_dropdown_menu">
            <li><h6 class="dropdown-header mycustom-line_search_dropdown_header">노선 선택</h6></li>
            <li><a class="dropdown-item" value="0010">경부선</a></li>
            <li><a class="dropdown-item" value="1200">경인선</a></li>
            <li><a class="dropdown-item" value="0140">고창담양선</a></li>
            <li><a class="dropdown-item" value="0120">광주대구선</a></li>
            <li><a class="dropdown-item" value="5000">광주외곽순환선</a></li>
            <li><a class="dropdown-item" value="0520">광주원주선</a></li>
            <li><a class="dropdown-item" value="0290">구리포천선</a></li>
            <li><a class="dropdown-item" value="4002">구리포천지선</a></li>
            <li><a class="dropdown-item" value="1020">남해1지선</a></li>
            <li><a class="dropdown-item" value="1040">남해2지선</a></li>
            <li><a class="dropdown-item" value="0100">남해선(순천-부산)</a></li>
            <li><a class="dropdown-item" value="0101">남해선(영암-순천)</a></li>
            <li><a class="dropdown-item" value="0252">논산천안선</a></li>
            <li><a class="dropdown-item" value="0301">당진대전선</a></li>
            <li><a class="dropdown-item" value="0552">대구부산선</a></li>
            <li><a class="dropdown-item" value="0700">대구외곽순환선</a></li>
            <li><a class="dropdown-item" value="0200">대구포항선</a></li>
            <li><a class="dropdown-item" value="3000">대전남부선</a></li>
            <li><a class="dropdown-item" value="0652">동해선(부산-포항)</a></li>
            <li><a class="dropdown-item" value="0650">동해선(삼척-속초)</a></li>
            <li><a class="dropdown-item" value="0121">무안광주선</a></li>
            <li><a class="dropdown-item" value="4000">봉담동탄선</a></li>
            <li><a class="dropdown-item" value="4003">봉담송산선</a></li>
            <li><a class="dropdown-item" value="0105">부산신항선</a></li>
            <li><a class="dropdown-item" value="6000">부산외곽선</a></li>
            <li><a class="dropdown-item" value="0651">부산울산선</a></li>
            <li><a class="dropdown-item" value="3010">상주영천선</a></li>
            <li><a class="dropdown-item" value="0172">서울문산선</a></li>
            <li><a class="dropdown-item" value="0173">서울문산지선</a></li>
            <li><a class="dropdown-item" value="0600">서울양양선</a></li>
            <li><a class="dropdown-item" value="1201">서울제물포선</a></li>
            <li><a class="dropdown-item" value="1510">서천공주선</a></li>
            <li><a class="dropdown-item" value="0150">서해안선</a></li>
            <li><a class="dropdown-item" value="1000">수도권제1순환선</a></li>
            <li><a class="dropdown-item" value="4005">수도권제2순환선(화도-양평)</a></li>
            <li><a class="dropdown-item" value="0174">수원광명선</a></li>
            <li><a class="dropdown-item" value="0270">순천완주선</a></li>
            <li><a class="dropdown-item" value="0500">영동선</a></li>
            <li><a class="dropdown-item" value="0171">오산화성선</a></li>
            <li><a class="dropdown-item" value="0320">옥산오창선</a></li>
            <li><a class="dropdown-item" value="1710">용인서울선</a></li>
            <li><a class="dropdown-item" value="0160">울산선</a></li>
            <li><a class="dropdown-item" value="0201">익산장수선</a></li>
            <li><a class="dropdown-item" value="1300">인천공항선</a></li>
            <li><a class="dropdown-item" value="4001">인천김포선</a></li>
            <li><a class="dropdown-item" value="1102">인천대교선</a></li>
            <li><a class="dropdown-item" value="1103">인천대교지선</a></li>
            <li><a class="dropdown-item" value="1100">제2경인선</a></li>
            <li><a class="dropdown-item" value="3700">제2중부선</a></li>
            <li><a class="dropdown-item" value="3300">제3경인선</a></li>
            <li><a class="dropdown-item" value="0450">중부내륙선</a></li>
            <li><a class="dropdown-item" value="4510">중부내륙지선</a></li>
            <li><a class="dropdown-item" value="0352">중부선</a></li>
            <li><a class="dropdown-item" value="0550">중앙선</a></li>
            <li><a class="dropdown-item" value="5510">중앙선지선</a></li>
            <li><a class="dropdown-item" value="0300">청주영덕선</a></li>
            <li><a class="dropdown-item" value="0351">통영대전선</a></li>
            <li><a class="dropdown-item" value="0153">평택시흥선</a></li>
            <li><a class="dropdown-item" value="0400">평택제천선</a></li>
            <li><a class="dropdown-item" value="0170">평택화성선</a></li>
            <li><a class="dropdown-item" value="0141">함양울산선</a></li>
            <li><a class="dropdown-item" value="0251">호남선</a></li>
            <li><a class="dropdown-item" value="2510">호남지선</a></li>
            <li><a class="dropdown-item" value="4004">화성광주선</a></li>

        </ul>
    </div>


    <!-- 휴게소 list area----------------------------------------------------------------------------------------------->
    <div class="container d-flex flex-wrap align-items-center justify-content-center mycustom-line_search_accordion_area">
        <ul class="list-group">
            <c:if test="${linelist ne null}">
                <c:forEach var="vo" items="${linelist}" varStatus="loop">
                    <li class="list-group-item mycustom-line_search_listgroup">
                        <form action="/menu" method="get">
                            <input type="hidden" name="r_photo" value="${photolist[loop.index].r_photo}"/>
                            <input type="hidden" name="svarCd" value="${vo.svarCd}"/>
                            <input type="hidden" name="RestNm" value="${vo.svarNm}"/>
                            <button class="accordion-button" type="submit">
                                <img class="mycustom-line_search_img" src="${photolist[loop.index].r_photo}"/>
                                <ul class="mycustom-line_search_ul">${vo.svarNm}(${vo.gudClssNm})
                                    <li>${vo.svarAddr} | 전화번호: ${vo.rprsTelNo}</li>
                                    <li>소형차주차대수: ${vo.cocrPrkgTrcn} | 대형차주차대수: ${vo.fscarPrkgTrcn} | 장애인주차대수: ${vo.dspnPrkgTrcn}</li>
                                </ul>
                            </button>
                        </form>
                    </li>
                </c:forEach> 
            </c:if>
        </ul>
        
        <c:if test="${linelist eq null}">
            <h1>휴게소가 없습니다.</h1>
        </c:if>
    </div>
    <!-- 휴게소 list area 끝----------------------------------------------------------------------------------------------->


    <!-- footer 시작---------------------------------------------------------------------------------------------->
    <body class="d-flex flex-column">
        <footer id="sticky-footer" class="flex-shrink-0 py-4 bg-dark text-white-50">
          <div class="container text-center">
            <small>Copyright &copy; 2023 팀이름 </small>
          </div>
        </footer>
      </body> 
    <!-- footer 끝---------------------------------------------------------------------------------------------->

    <script src="https://code.jquery.com/jquery-3.7.0.min.js" integrity="sha256-2Pmvv0kuTBOenSvLm6bvfBSSHrUJ+3A7x6P5Ebd07/g=" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>

    <script>
    $(document).ready(function() {

        $('.dropdown-item').click(function(e) {
            // 클릭 이벤트 핸들러 내용
            var value = $(this).attr('value');
            var lineName = $(this).text();
            location.href="/lineSearchList?getrouteCd="+value+"&lineName="+lineName;
        }); 
    });

   </script>
</body>
</html>