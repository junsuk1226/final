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
    </style>
    <head>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta charset="utf-8">
        <title>결제창</title>
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Gothic+A1:wght@1000&display=swap" rel="stylesheet">
        <style>
            *{
                font-family: 'Gothic A1', sans-serif !important;
            }
            
            #order_title{
                font-weight: 1000;
            }

            .text_bold{
                font-size: 18px;
                font-weight: 1000; 
            }
            
        </style>
    </head> 
    <body class="d-flex flex-column">
    <!-- 메뉴바 ----------------------------------------------------------------------------------------------------------->
        <div class="container main_custom_menubar">
            <header class="d-flex flex-wrap align-items-center justify-content-md-between py-3 mb-3">
                <a class="nav-link logo_custom"></a>
                <c:if test="${sessionScope.mvo == null}">
                    <div class="col-md-3 text-end">
                        <button type="button" class="btn btn-outline-success me-2 mycustom-mem-btn" onclick="location.href='/login'">로그인</button>
                        <button type="button" class="btn btn-outline-success mycustom-mem-btn" onclick="location.href='/join'">회원가입</button>
                    </div>
                </c:if>
            </header>
        </div>
        <!-- 메뉴바끝  메인 이미지 시작-------------------------------------------------------------------------------------------------->
        <div class ="container-fluid text-center">
            <div class="row justify-content-center ">

                <div class="col-md-12" >
                    <a href="/main"><img style="max-width: 300px;" src="../main_images/logo.png"></a>  
                </div>

                <div id="faux-gif"></div>
            </div>
        </div>
        <!-- 메인 이미지 끝-------------------------------------------------------------------------------------------------->

        <!---------------------------------결제 영역 ------------------------------------->
        <div class="container">
            <div class="d-flex justify-content-center">
                <div class="p-3 mb-2 bg-secondary bg-opacity-25">
                    <div class="card" style="width: 30rem;">
                        <div class="p-3 mb-2 bg-white text-dark rounded">
                            <div class="card-body">
                                <div class="d-flex justify-content-center">
                                    <h3 class="card-title" id="order_title">주문하기</h3>
                                </div></br>
                                <div class="card border border-2" style="width: 26rem;">
                                    <div class="paybox">
                                        <p class="text-left text_bold" style="margin-left: 20px; margin-top: 15px;" >주문자: ${mvo.m_id}개똥이</p>
                                        <p class="text-left" style="margin-left: 20px;" >전호번호: ${mvo.m_phone}999-9999-9999</p>
                                    </div>
                                </div></br>
                            
                                <div class="card border border-2 container" style="width: 26rem;">
                                    <div class="paybox row">
                                        <p class="text-left text_bold" style="margin-left: 10px; margin-top: 15px;" >서울만남(부산)휴게소(하행)</p>
                                        <p class="col-md-12">
                                            <span style="display: inline-block; float: left; margin-left: 10px;" >상품 이름1 / 1개</span>
                                            <span style="display: inline-block; float: right; margin-right: 10px;"><fmt:formatNumber value="${row.price}" pattern="#,###,###" />11,111원</span>
                                        </p>
                                        <p class="col-md-12">
                                            <span style="display: inline-block; float: left; margin-left: 10px;" >상품 이름2 / 2개</span>
                                            <span style="display: inline-block; float: right; margin-right: 10px;"><fmt:formatNumber value="${row.price}" pattern="#,###,###" />22,222원</span>
                                        </p>
                                        <p class="col-md-12" style="font-weight: 800">
                                            <span style="display: inline-block; float: left; margin-left: 10px;" >총 결제금액</span>
                                            <span style="display: inline-block; float: right; margin-right: 10px;"><fmt:formatNumber value="${row.price}" pattern="#,###,###" />199,999원</span>
                                        </p>
                                    </div>
                                </div></br>
                            
                                <div class="card border border-2" style="width: 26rem; text-align: center;">
                                    <div class="paybox"></br>
                                        <a href="/kakao/pay">
                                            <img style="width: 360px;" src="images/kakao_pay.png">
                                        </a>
                                    </div>
                                    <div class="paybox" style="padding-top: 30px; padding-bottom: 20px;">
                                        <a href="/toss/pay">
                                            <img style="height: 30px;" src="images/toss_pay.png">
                                        </a>
                                    </div>
                                </div></br>
                                <div style="text-align: right;">
                                    <button type="button" class="btn btn-outline-secondary" onclick="location.href='/main'">결제 취소</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div></br>
        
        
        <!---------------------------------결제 영역 끝------------------------------------->
                    

        <!-- footer 시작---------------------------------------------------------------------------------------------->
        <footer id="sticky-footer" class="flex-shrink-0 py-4 bg-dark text-white-50">
            <div class="container text-center">
            <small>Copyright &copy; 2023 팀이름 </small>
            </div>
        </footer>

        <script src="https://code.jquery.com/jquery-3.7.0.js" integrity="sha256-JlqSTELeR4TLqP0OG9dxM7yDPqX1ox/HfgiSLBj8+kM=" crossorigin="anonymous"></script>
        <script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=092a22d4a329417bd5fb9544ca6bb378"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
        
    </body> 
    <!-- footer 끝---------------------------------------------------------------------------------------------->

</html>