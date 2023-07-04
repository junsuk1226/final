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
        <title>토스페이 결제창</title>
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Gothic+A1:wght@1000&display=swap" rel="stylesheet">
        <style>
            *{
                font-family: 'Gothic A1', sans-serif !important;
            }

            
            
        </style>
        <!-----------토스페이 시작------------->

        <meta charset="utf-8" />
        <!-- 결제위젯 SDK 추가 -->
        <script src="https://js.tosspayments.com/v1/payment-widget"></script>

        <!-----------토스페이 끝-------------->
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
        <div class ="container-fluid text-center" >
            <div class="row justify-content-center" >
                <div class="col-md-12" >
                    <a href="/main"><img style="max-width: 300px;" src="../main_images/logo.png"></a>  
                </div>
            </div>
        </div>
        <!-- 메인 이미지 끝-------------------------------------------------------------------------------------------------->

        <!-----------토스페이 시작------------->
        <div class="container d-flex justify-content-center">
            <div class="row p-3 bg-secondary bg-opacity-25" style="width: 32rem;">
                <div class="card p-3 bg-white text-dark rounded" >
                    <div class="card paybox border-2">
                        <!-- 결제위젯, 이용약관 영역 -->
                        <div id="payment-method"></div>
                        <div id="agreement"></div>
                    </div></br>
                    <div style="text-align: right;">
                        <button type="button" class="btn btn-outline-secondary" id="payment-button">결제하기</button>
                    </div>
                </div>
            </div>
        </div></br>

        <script>
            const clientKey = "test_ck_YyZqmkKeP8gObZJ9knn8bQRxB9lG"
            const customerKey = "HV_7WljA1x4k2dp1ZQOJj" // 내 상점에서 고객을 구분하기 위해 발급한 고객의 고유 ID--------------------(m_idx 예정)
            const button = document.getElementById("payment-button")

            // ------  결제위젯 초기화 ------ 
            // 비회원 결제에는 customerKey 대신 ANONYMOUS를 사용하세요.
            const paymentWidget = PaymentWidget(clientKey, customerKey) // 회원 결제
            // const paymentWidget = PaymentWidget(clientKey, PaymentWidget.ANONYMOUS) // 비회원 결제

            // ------  결제위젯 렌더링 ------ 
            // 결제수단 UI를 렌더링할 위치를 지정합니다. `#payment-method`와 같은 CSS 선택자와 결제 금액 객체를 추가하세요.
            // https://docs.tosspayments.com/reference/widget-sdk#renderpaymentmethods선택자-결제-금액-옵션
            paymentWidget.renderPaymentMethods("#payment-method", { value: "${sumPrice}" }) //-----------------------------------------총 결제금액 넣을 자리

            // ------  이용약관 렌더링 ------
            // 이용약관 UI를 렌더링할 위치를 지정합니다. `#agreement`와 같은 CSS 선택자를 추가하세요.
            // https://docs.tosspayments.com/reference/widget-sdk#renderagreement선택자
            paymentWidget.renderAgreement('#agreement')

            // ------ '결제하기' 버튼 누르면 결제창 띄우기 ------
            // 더 많은 결제 정보 파라미터는 결제위젯 SDK에서 확인하세요.
            // https://docs.tosspayments.com/reference/widget-sdk#requestpayment결제-정보
            button.addEventListener("click", function () {
            paymentWidget.requestPayment({
                orderId: "${orderId}",            // 48자리 랜덤변수 예정
                orderName: "${foodNm}",                 // foodNm으로 표시 
                successUrl: "http://localhost:8080/tosspayment/success",  // 결제에 성공시 이동하는 페이지
                failUrl: "http://localhost:8080/orderpay",        // 결제에 실패시 이동하는 페이지
                customerEmail: "${mvo.m_id}", //m_id
                customerName: "${mvo.m_name}"  //m_name
            })
            })
        </script>
        <!-----------토스페이 끝-------------->

    <!-- footer 시작---------------------------------------------------------------------------------------------->
        <footer id="sticky-footer" class="flex-shrink-0 py-4 bg-dark text-white-50 mycustom-main_footer">
            <div class="container text-center">
                <small>Copyright &copy; 2023 쉬-잇 </small>
            </div>
        </footer>

        <script src="https://code.jquery.com/jquery-3.7.0.js" integrity="sha256-JlqSTELeR4TLqP0OG9dxM7yDPqX1ox/HfgiSLBj8+kM=" crossorigin="anonymous"></script>
        <script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=092a22d4a329417bd5fb9544ca6bb378"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
        
    </body> 
    <!-- footer 끝---------------------------------------------------------------------------------------------->

</html>