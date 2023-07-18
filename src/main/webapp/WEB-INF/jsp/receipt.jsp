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
                    <title>내 손안에 휴게소-마이휴 장바구니 페이지</title>
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

                    <!---------------------------------결제 영역 ------------------------------------->
                    <div class="paybox">
                        지혜 파트 파이팅!</br>
                        주문 번호: 값 주세요(휴게소별 번호 다르게, 999번 초기화)</br>
                        주문 일시: 값 주세요(날짜 시간)모두 db에서 뽑아
                    </div></br>

                    <div class="paybox">
                        회원 이름: 값 주세요</br>
                        회원 전호번호: 값 주세요
                    </div></br>

                    <div class="paybox">
                        휴게소: 값 주세요 휴게소</br>
                        상품 이름: 값 주세요 1 / 수량: 값 주세요 1 / 가격: <fmt:formatNumber value="${row.price}" pattern="#,###,###" />원</br>
                        상품 이름: 값 주세요 2 / 수량: 값 주세요 2 / 가격: <fmt:formatNumber value="${row.price}" pattern="#,###,###" />원</br>
                        총 결제 금액: <fmt:formatNumber value="${row.price}" pattern="#,###,###" />원</br>
                        결제방식: 값 주세요
                    </div></br>

                    <div class="paybox">
                        <button type="button" class="paybutton" id="btnok" onclick="location.href='/main'">확인</button>
                    </div></br>
                    <!---------------------------------결제 영역 끝------------------------------------->
                    <script>
                        
                    </script>
                </body>

                <!-- footer 시작----------------------------------------------------------------------------------------------> 
                <!-- <body class="d-flex flex-column"> -->
                <footer id="sticky-footer" class="flex-shrink-0 py-4 bg-dark text-white-50 mycustom-main_footer">
                    <div class="container text-center">
                    <small>Copyright &copy; 2023 마이휴 </small>
                    </div>
                </footer>
                <!-- </body>  -->
                <!-- footer 끝---------------------------------------------------------------------------------------------->

                </html>