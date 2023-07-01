<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
                <style>
                

                    .popup {
                        display: none;
                    }

                    div.carousel-item img{
                        object-fit:cover; 
                        width: 100%; 
                        height:100%;
                    }
                    div.carousel-item{
                        width: 20rem; 
                        height:13rem;
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
                                </nav>
                       
                            <!-- Page content-->
                            <div class="container-fluid">
                                <div class="row justify-content-center mt-5">
                                    <div class="col-md-9 mb-3">
                                            <h2 class=" lh-base mt-5" style="font-family: 'suite'">
                                                ${sessionScope.mvo.m_name}<span class="text-muted">님 환영합니다.</span>
                                            </h2>
                                    </div>
                                </div>
                            </div>
                            <div class="container-fluid">
                                <div class="row justify-content-center my-5">
                                    <div class="col-md-6 mb-3">
                                            <div class="card 30em shadow p-3 mb-5 bg-body rounded position-relative" style="border: none;">
                                                <div class="card-body">
                                                    <h4 style="font-family: 'suite';"class="card-title text-muted mt-2">내 정보</h4>
                                                    <hr/>
                                                    <!--이메일-->
                                                    <label for="email" class="form-label mt-4 "><span class="ms-1">이메일</span></label>
                                                    <div class="input-group input-group-lg">
                                                        <input style="border: none;" type="text" id="email" class="text-muted form-control" value="${sessionScope.mvo.m_id}" disabled>
                                                    </div>

                                                    <!--닉네임-->
                                                    <c:set var="tel" value="${sessionScope.mvo.m_phone}"/>
                                                    <label for="name" class="form-label mt-4 "><span class="ms-1">닉네임</span></label>
                                                    <div class="input-group mb-1 input-group-lg">
                                                        <input style="border: none;" id="name" type="text" class="text-muted form-control"  value="${sessionScope.mvo.m_name}" disabled>
                                                    </div>

                                                    <!--연락처 (페이지 상에서 기호 표현)-->
                                                    <c:set var="tel" value="${sessionScope.mvo.m_phone}"/>
                                                    <label for="phone" class="form-label mt-4 "><span class="ms-1">휴대폰 번호</span></label>
                                                    <div class="input-group mb-5 input-group-lg">
                                                        <input style="border: none;" id="phone" type="text" class="text-muted form-control" value="${fn:substring(tel, 0, 3)}-${fn:substring(tel, 3, 7)}-${fn:substring(tel, 7,11)}" disabled>
                                                    </div>


                                                    <!--버튼-->
                                                    <div class="d-grid gap-2 col-7 mx-auto " style="max-width: 240px;" href="/infopw">
                                                        <button type="button" class="btn btn-dark " > 
                                                            <a class="nav-link" href="/info">회원정보<br/>수정하러 가기</a>
                                                        </button>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-md-4 ms-1 me-1 d-flex justify-content-center"> 
                                            <div class="row">
                                            <!--캐러셀-->
                                                <div class="carousel slide" data-bs-ride="carousel">
                                                    <div class="carousel-inner shadow bg-body rounded" style="max-width: 300px;">
                                                    <div class="carousel-item active" data-bs-interval="4000">
                                                        <img src="../images/도토리묵밥.jpg" class="d-block rounded w-100" alt="...">
                                                    </div>
                                                    <div class="carousel-item" data-bs-interval="4000">
                                                        <img src="../images/김치볶음밥.png" class="d-block rounded w-100" alt="...">
                                                    </div>
                                                    <div class="carousel-item">
                                                        <img src="../images/어묵탕.png" class="d-block rounded w-100" alt="...">
                                                    </div>
                                                    </div>
                                                    
                                                    <!--카드-->
                                                    <div class="card mt-5 shadow bg-body rounded" style="border: none;">
                                                        <div class="card-body">
                                                            <div class="card-title"><h5 class=" lh-base mt-2" style="font-family: 'suite'">나의 현황</h5></div>
                                                            <hr/>
                                                            <!--카드 내부 영역 (어떤 정보 가져올 것인지?정확하게 정하기)-->
                                                            <table>
                                                                <colgroup>
                                                                    <col width="100px;"/>
                                                                    <col width="100px;"/>
                                                                    <col width="100px;"/>
                                                                </colgroup>
                                                                <tbody>
                                                                    <tr>
                                                                        <th>리뷰</th>
                                                                        <td>0개</td>
                                                                        <td style="text-align: right;">
                                                                            <input type="button" class="btn btn-outline-success me-2 mycustom-mem-btn"  onclick="review1(this.form)" value="조회" id="btn btn-link" />
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <th>적립금</th>
                                                                        <td>230원</td>
                                                                        <td style="text-align: right;"> <input type="button" class="btn btn-outline-success me-2 mycustom-mem-btn" onclick="" value="조회" id="btn btn-link" /></td>
                                                                    </tr>
                                                                    <tr>
                                                                        <th>쿠폰</th>
                                                                        <td>2개</td>
                                                                        <td style="text-align: right;"> <input type="button" class="btn btn-outline-success me-2 mycustom-mem-btn" onclick="" value="조회" id="btn btn-link" /></td>
                                                                    </tr>
                                                                    <tr>
                                                                        <th>지난 주문</th>
                                                                        <td>21건</td>
                                                                        <td style="text-align: right;"> <input type="button" class="btn btn-outline-success me-2 mycustom-mem-btn" onclick="" value="조회" id="btn btn-link" /></td>
                                                                    </tr>
                                                                </tbody>  
                                                            </table>
                                                        </div>
                                                    </div>
                                                </div><!---캐러셀의 끝--->
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                        
                                        
                                        
                                        
                            </div>
                        </div>
                    </div>
                                        
                                        <!-- footer 시작---------------------------------------------------------------------------------------------->
                                        <!-- <body class="d-flex flex-column"> -->
                                            <footer id="sticky-footer" class="flex-shrink-0 py-4 bg-dark text-white-50 mycustom-main_footer">
                                                <div class="container text-center">
                                                    <small>Copyright &copy; 2023 쉬-잇 </small>
                                                </div>
                                            </footer>
                                            
                                            <!-- </body>  -->
                                            <!-- footer 끝---------------------------------------------------------------------------------------------->
                                            
                                    <%-- 추가Popup --%>
                                    <div id="add_popup" class="popup" title="내역 수정 ">
                                        <div id="content">
                                            <form action="Controller" method="post">
                                                <input type="hidden" name="type" value="add" />
                                                <label for="deptno">주문환불</label>
                                                <input type="text" id="deptno" name="deptno" /><br />
                                                <label for="dname">주문반품</label>
                                                <input type="text" id="dname" name="dname" /><br />
                                                <label for="location_id">주문상태확인</label>
                                                <input type="text" id="location_id" name="location_id" /><br />
                                                
                                                <input type="button" value="뒤로" onclick="add(this.form)" />
                                                
                                            </form>
                                        </div>
                                    </div>
                                    
                            <div id="search_popup" class="popup" title="리모컨">
                                <div id="content">
                                    <form action="Controller" method="post">
                                        <input type="hidden" name="type" value="list" />
                                        <select id="searchType" name="search1">
                                            <option value="0">뒤로</option>
                                            <option value="1">메인으로</option>
                                            <option value="2">상품창으로</option>
                                        </select>
                                        <input type="text" id="searchValue" name="search2" /><br />
                                        <input type="button" value="이동" onclick="search(this.form)" />
                                    </form>
                                </div>
                                
                            </div>
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
                        function sendKeyword(form) {

                            var value = $("#searchValue").val();
                           
                            if (value == 1){
                                location.href = "MainController?type=Main";
                            }
                            
                        }
                        function  review1(form){
                             location.href = "/review";
                        }

                       


                    </script>
                </body>

                </html>