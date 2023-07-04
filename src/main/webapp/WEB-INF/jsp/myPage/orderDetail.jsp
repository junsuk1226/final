<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>

        <html lang="en">

        <head>
            <meta charset="utf-8" />
            <meta http-equiv="X-UA-Compatible" content="IE=edge">

            <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
            <meta name="description" content="" />
            <meta name="author" content="" />
            <title>Simple Sidebar - Start Bootstrap Template</title>
            <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
            <!-- Core theme CSS (includes Bootstrap)-->
            <link href="css/styles.css" rel="stylesheet" />
            <link href="css/bootstrap.css" rel="stylesheet" />
            <!-- 새로추가 -->
            <link rel="stylesheet" href="//code.jquery.com/ui/1.13.0/themes/base/jquery-ui.css">
            <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css" />
            <link rel="stylesheet" href="../css/main_custom.css" />

            <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
            <script src="https://code.jquery.com/ui/1.13.0/jquery-ui.js"></script>
                


                    <!-- Favicon-->
                </head>

                <body>
                    <div class="d-flex" id="wrapper">
                        <!-- Sidebar-->
                    <div class="border-end bg-white" id="sidebar-wrapper">
                        <div class="sidebar-heading border-bottom bg-light"> <a href="/main"><img style="max-width: 200px;"
                                    src="../main_images/logo.png"></a></div>
                        <div class="list-group list-group-flush">
                            <a class="list-group-item list-group-item-action list-group-item-light p-3" href="/myPage">마이
                                페이지</a>
                            <a class="list-group-item list-group-item-action list-group-item-light p-3" href="/info">회원정보 수정</a> <a
                                class="list-group-item list-group-item-action list-group-item-light p-3" href="/order">주문
                                내역</a> <a class="list-group-item list-group-item-action list-group-item-light p-3" href="/review">리뷰 관리</a>
                            <a class="list-group-item list-group-item-action list-group-item-light p-3" href="/cart">내
                                장바구니</a>
                        </div>
                    </div>
                        <!-- Page content wrapper-->
                        <div id="page-content-wrapper">
                            <!-- Top navigation-->
                            <nav class="navbar navbar-expand-lg navbar-light bg-light border-bottom">
                                <div class="container-fluid">
                                    <button class="btn btn-outline-success me-2 mycustom-mem-btn" id="sidebarToggle">메뉴</button>
                                    <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
                                        data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent"
                                        aria-expanded="false" aria-label="Toggle navigation">
                                        <span class="navbar-toggler-icon"></span>
                                    </button>
                                    <div class="collapse navbar-collapse" id="navbarSupportedContent">
                                        <ul class="navbar-nav ms-auto mt-2 mt-lg-0">
                                            <li class="nav-item active"><a class="nav-link" href="/main">홈</a></li>
                                            <li class="nav-item"><a class="nav-link" href="/logout">로그아웃</a></li>
                                            
                                        </ul>
                                    </div>
                                </div>
                            </nav>
                            <!-- Page content-->

                            <div class="container-fluid">
                                <div class="row justify-content-center mt-5">
                                    <div class="col-md-9 mb-3">
                                            <h2 class=" lh-base mt-5 ms-1" style="font-family: 'suite'">
                                                <span class="text-muted">주문 상세정보</span>
                                            </h2>
                                    </div>
                                </div>
                            </div>
        
                            <div class="container-fluid mb-4">
                                <div class="row justify-content-center col-md-12 my-5">
                                    <div  class="col-md-9">
                                         <div class="card shadow p-3 mb-5 bg-body rounded justify-content-center" style="border: none;">
                                            <div class="card-body">
                                                <form action="" name="frm" method="get">
                                        
                                                    <div class="paybox">
                                                        주문 번호: </br>
                                                        주문 일시: ${pvo.p_date}
                                                    </div></br>
                                
                                                    <div class="paybox">
                                                        회원 이름: 값 주세요</br>
                                                        회원 전화번호: 값 주세요
                                                    </div></br>
                                
                                                    <div class="paybox">
                                                        휴게소: 값 주세요 휴게소</br>
                                                        상품 이름: 값 주세요 1 / 수량: 값 주세요 1 / 가격: <fmt:formatNumber value="${row.price}" pattern="#,###,###" />원</br>
                                                        상품 이름: 값 주세요 2 / 수량: 값 주세요 2 / 가격: <fmt:formatNumber value="${row.price}" pattern="#,###,###" />원</br>
                                                        총 결제 금액: <fmt:formatNumber value="${row.price}" pattern="#,###,###" />원</br>
                                                        결제방식: 값 주세요
                                                    </div></br>
                                
                                                    <div class="paybox">
                                                    </div></br>
            
                                                    <button class="btn btn-outline-success me-2 mycustom-mem-btn" onclick="writeReview()" type="button">리뷰쓰기</button>
            
                                                </form>
                                                
                                                
                                            </div>
                                        </div>
        
                                    </div>
                                </div>
                            </div>
        
                            <div>
                                    
                                    
                    
                            
                                <!-- footer 시작---------------------------------------------------------------------------------------------->
                                <!-- <body class="d-flex flex-column"> -->
                                <footer id="sticky-footer" class="flex-shrink-0 py-4 bg-dark text-white-50 mycustom-main_footer">
                                    <div class="container text-center">
                                        <small>Copyright &copy; 2023 쉬-잇 </small>
                                    </div>
                                </footer>
                            
                                <!-- </body>  -->
                                <!-- footer 끝---------------------------------------------------------------------------------------------->
                            
                            </div>
                        </div>


                    <script type="text/javascript" src="js/bootstrap.js"></script>

                    <!-- 제이쿼리 -->
                    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js">
                    </script>

                    <!-- 합쳐지고 최소화된 최신 자바스크립트 -->
                    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
                    </script>



                    <!-- Bootstrap core JS-->
                    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
                    <!-- Core theme JS-->
                    <script src="js/scripts.js"></script>

                    <script>
                        function writeReview() {

                            document.frm.action="/writeReview";
                            document.frm.submit();
                        }

                       


                    </script>
                </body>

                </html>