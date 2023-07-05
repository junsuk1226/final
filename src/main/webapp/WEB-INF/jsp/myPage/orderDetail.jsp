<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
                
            <!--아이콘 cdn-->
            <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">

            <style>
                .nav-link{
                    color: #6600db;
                }
                .nav-link:hover{
                    color: #b699ee; cursor: pointer;
                }

            </style>

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
                                    <div class="col-md-6 mb-3">
                                            <h2 class=" lh-base mt-5 ms-1" style="font-family: 'suite'">
                                                <span class="text-muted">주문 상세정보</span>
                                            </h2>
                                    </div>
                                </div>
                            </div>
                            
                            <div class="container-fluid mb-4">
                                <div class="row justify-content-center col-md-12 my-5">
                                    <div  class="col-md-6">
                                         <div class="card shadow p-3 mb-5 bg-body rounded justify-content-center" style="border: none;">
                                            <div class="card-body justify-content-center text-center">
                                                <form action="" name="frm" method="get">
                                                    <input type="hidden" name="restNm" value="${pvo.restNm}"/>
                                                    <span class="text-muted">주문번호</span>
                                                    <div class="text-center"><h1>${pvo.p_oNum}</h1></div>
                                                    <hr/>
                                                    <div class="d-flex justify-content-between mt-3 mb-5 align-items-center">
                                                        <div class ="text-start" style="font-weight: bold; font-size: x-large;"><span>${pvo.restNm}</span></div>
                                                        <div class="text-end text-muted" style="font-size: small;">${pvo.p_date}&nbsp;${pvo.p_time}</div>
                                                    </div>
                                                        <div class="mb-3">
                                                            <c:set var="foodNm" value="${fn:split(pvo.foodNm, '/')}"></c:set>
                                                            <c:set var="foodCost" value="${fn:split(pvo.foodCost, '/')}"></c:set>
                                                            <c:set var="foodQn" value="${fn:split(pvo.foodQn, '/')}"></c:set>
                                                            <c:forEach var="i" begin="0" end="${fn:length(foodNm) - 1}">
                                                                <c:set var="price" value="${fn:trim(foodCost[i])}" />
                                                                <hr style="border: 1px dashed black;"/>
                                                                <div class="d-flex ">
                                                                    <div class="d-flex col-md-12">    
                                                                        <div class="mx-3 col-md-3" style ="width: 100px; height: 100px;">
                                                                            <img id="${foodNm[i]}_img" style="object-fit: cover; width: 100%; height: 100%; background-color: rgb(240, 240, 240);" class="rounded "/> 
                                                                        </div>
                                                                        
                                                                        <div class="row col-md-9 ms-1">
                                                                            <div class="col-md-12 text-start">
                                                                                <span style="font-size: large; font-weight: bold;">${foodNm[i]}</span>
                                                                                <br/>
                                                                                <span class="ps-2 text-muted">└ ${foodQn[i]}개</span>
                                                                            </div>
                                                                            <div class="text-end col-md-12 d-flex justify-content-end">
                                                                                <span class="me-2 text-muted">개당</span><fmt:formatNumber value="${foodCost[i]}" pattern="#,###,###" />원
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </c:forEach>
                                                        </div>
                                                        <hr/>
                                                        <div class="d-flex justify-content-between">
                                                            <div class="text-start" style="font-size: larger; font-weight: bold;"><span>결제금액</span></div> 
                                                            <div class="text-end">
                                                                <fmt:formatNumber value="${pvo.totalCost}" pattern="#,###,###" />원<br/>
                                                                <c:choose>
                                                                    <c:when test="${pvo.payMethod eq '0'}"><span class="text-muted">(카카오페이 결제)</span></c:when>
                                                                    <c:when test="${pvo.payMethod eq '1'}"><span class="text-muted">(토스페이 결제)</span></c:when>
                                                                    <c:otherwise>(...)</c:otherwise>
                                                                </c:choose>
                                                            </div> 
                                                        </div>
                                                        <div class="text-end"><span class="text-muted"> 결제자: ${sessionScope.mvo.m_name}</span></div>
                                                        <div class="row justify-content-end mt-4">
                                                            <div class="col-6 mb-2 float-end text-end">
                                                                <a class="nav-link" onclick="writeReview()" style="font-family: 'suite'; font-weight: bold; font-size: large;" >리뷰 작성<i class="fa fa-pencil-square-o fa-lg ms-2" aria-hidden="true"></i></a>
                                                            </div>
                                                        </div>
            
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

                        //파일이름을 비동기식으로 가져오기
                        $(document).ready(function() {
                            
                            <c:forEach var="i" begin="0" end="${fn:length(foodNm) - 1}">
                                var foodNm = "${foodNm[i]}";
                                sendAjaxRequest(foodNm);
                                //console.log(foodNm);
                            </c:forEach>


                            function sendAjaxRequest(foodNm){
                                $.ajax({
                                    url:"/getFileName",
                                    method: 'post',
                                    data: {'foodNm': foodNm},
                                    dataType: 'text'
                                }).done(function(data){
                                    // var imageUrl = encodeURIComponent(data);
                                    console.log(data);

                                    $("#" + foodNm + "_img").attr("src",data);
                                });

                            }
                        
                        })


                    </script>
                </body>

                </html>