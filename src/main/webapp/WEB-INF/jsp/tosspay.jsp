<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
            <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
                <!DOCTYPE html>
                <html class="no-js" lang="en">


                <head>
                    <meta charset="utf-8">
                    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
                    <meta http-equiv="X-UA-Compatible" content="IE=edge">
                    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
                        rel="stylesheet"
                        integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
                        crossorigin="anonymous">
                    <title>내 손안에 휴게소-마이휴 결제 페이지</title>
                    <style>
                        .paybox{
                            width: 100%;
                            margin: 0 auto;
                            min-width: 450px;
                            max-width: 450px;
                            border: 1px solid black;
                        }

                        .paybutton{
                            display: block;
                            margin: 2px auto;
                        }
                    </style>

                    <!-----------토스페이 시작------------->

                    <meta charset="utf-8" />
                    <!-- 결제위젯 SDK 추가 -->
                    <script src="https://js.tosspayments.com/v1/payment-widget"></script>

                    <!-----------토스페이 끝-------------->
                </head>

                <body>
                    <div class="container main_custom_menubar">
                        <header class="d-flex flex-wrap align-items-center justify-content-md-between py-3 mb-3">
                            <a class="nav-link logo_custom" href="/main">내 손안에 휴게소</a>
                            <c:if test="${sessionScope.mvo == null}">
                                <div class="col-md-3 text-end">

                                    <button type="button" class="btn btn-outline-success me-2 mycustom-mem-btn"
                                        onclick="location.href='/login'">로그인</button>
                                    <button type="button" class="btn btn-outline-success mycustom-mem-btn"
                                        onclick="location.href='/join'">회원가입</button>
                                </div>
                            </c:if>
                            <c:if test="${sessionScope.mvo != null}">
                                <div class="col-md-3 text-end">
                                    <button type="button" class="btn btn-outline-success me-2 mycustom-mem-btn"
                                        onclick="location.href='/logout'">로그 아웃</button>
                                    <button type="button" class="btn btn-outline-success mycustom-mem-btn"
                                        onclick="location.href='/main'">메인화면</button>
                                </div>
                            </c:if>
                        </header>
                    </div>

                    <div class="top_area">
                        <!------------------상단----------------->
                        <div class="container-fluid text-center">
                            <div class="row justify-content-center ">
                                <div class="col-md-12">
                                    <a href="/main"><img src="assets/img/logo.png" /></a>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-----------토스페이 시작------------->

                    <!-- 결제위젯, 이용약관 영역 -->
                    <div id="payment-method"></div>
                    <div id="agreement"></div>
                    <!-- 결제하기 버튼 -->
                    <button id="payment-button">결제하기</button>
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
                        paymentWidget.renderPaymentMethods("#payment-method", { value: 1000000 }) //-----------------------------------------총 결제금액 넣을 자리

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
                            orderName: "떡볶이 곱배기 먹고싶다..",                 // foodNm으로 표시 
                            successUrl: "http://localhost:8080/tosspayment/success",  // 결제에 성공시 이동하는 페이지
                            failUrl: "http://localhost:8080/orderpay",        // 결제에 실패시 이동하는 페이지
                            customerEmail: "customer123@gmail.com", //m_id
                            customerName: "김토스"  //m_name
                        })
                        })
                    </script>
 
                     <!-----------토스페이 끝-------------->
                    <script>
                        
                    </script>
                </body>

                <!-- footer 시작----------------------------------------------------------------------------------------------> 
                <!-- <body class="d-flex flex-column"> -->
                <footer id="sticky-footer" class="flex-shrink-0 py-4 bg-dark text-white-50 mycustom-main_footer">
                    <div class="container text-center">
                    <small>Copyright &copy; 2023 쉬-잇 </small>
                    </div>
                </footer>
                <!-- </body>  -->
                <!-- footer 끝---------------------------------------------------------------------------------------------->

                </html>