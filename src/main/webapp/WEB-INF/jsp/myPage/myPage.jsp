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
                <style>
                

                    .popup {
                        display: none;
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
                            <a class="list-group-item list-group-item-action list-group-item-light p-3" href="/info">회원정보수정</a> <a
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

                            <div class="right">
                                <div class="row">
                                    <div class="col-md-1"></div>
                                    <div class="col-md-11">
                                        <br />
                                        <h1>${sessionScope.mvo.m_name}님 환영합니다. </h1>
                                        <br />
                                        <br />
                                    </div>
                                </div>
                                
                                    <div class="col-md-3"></div>
                                    <div class="col-md-16 col-md-offset-5" class="right">
                                     
                                            <table>
                                                <tbody >
                                                    <colgroup>
                                                        <col width="30%"/>
                                                        <col width="70%"/>
                                                    </colgroup>

                                                        <tr>
                                                            <td>
                                                                <div class="row" >
                                                                    
                                                                <div class="xans-element- xans-myshop xans-myshop-bankbook ">
                                                                    <ul>
                                                                        <li class="coupon displaynone">
                                                                            <strong class="title">리뷰</strong>
                                                                            <strong class="cont">
                                                                                <span> 0개</span>
                                                                            </strong>
                                                                           
                                                                            <input type="button" class="btn btn-outline-success mycustom-mem-btn"  onclick="review1(this.form)" value="조회" id="btn btn-link" />
                                                                        </li>
                                                                        <br />
                                                                        <li class="mileage ">
                                                                            <strong class="title">적립금&nbsp;</strong>
                                                                            <strong class="cont"> 230원</strong>
                                                                            
                                                                            <input type="button" class="btn btn-outline-success me-2 mycustom-mem-btn" onclick=""
                                                                             value="조회" id="button-addon" />
                                                                        </li>
                                                                        <br/>
                                                                        <li class="coupon displaynone">
                                                                            <strong class="title">쿠폰</strong>
                                                                            <strong class="cont">
                                                                                <span> 2개</span>
                                                                            </strong>
                                                                            
                                                                            <input type="button" class="btn btn-outline-success me-2 mycustom-mem-btn"
                                                                            value="조회" id="btn btn-link">
                                                                        </li>
                                                                        <br />
                                                                        <li class="coupon displaynone">
                                                                            <strong class="title">지난&nbsp;주문내역&nbsp;</strong>
                                                                            <strong class="cont">
                                                                                <span>21개</span>
                                                                            </strong>
                                                                           
                                                                            <input type="button" class="btn btn-outline-success me-2 mycustom-mem-btn" onclick="" value="조회" id="btn btn-link" />
                                                                        </li>
                                                                        <br/>
                                                                        <li class="coupon displaynone">
                                                                            <strong class="title">고객센터&nbsp;</strong>
                                                                            <strong class="cont">
                                                                                <span>02-112</span>
                                                                            </strong>
                                                                            
                                                                            <input type="button" class="btn btn-outline-success me-2 mycustom-mem-btn" onclick="" value="연결하기" id="btn btn-link" />
                                                                        </li>
                                                                    </ul>
                                                                </div>
                                                            </td>
                                                            <td>
                                                                <div class="left">
                                                                    <div class="input-group">
                                                                        <div class="col-md-11">
                                                                
                                                                            <h2>내 정보 </h2>
                                                                            <br />
                                                                        </div>
                                                                        <div class="card-body">
                                                                            <form action="/myPage/myPage" method="post" class="needs-validation" novalidate>
                                                                                <ul class="list-unstyled">
                                                                                    <li class="mb-3">이메일</li>
                                                                                    <div class="form-floating ">
                                                                                        <input type="text" placeholder="Email" class="form-control" name="j_email" id="j_email" required
                                                                                            value="${sessionScope.mvo.m_id}" disabled>
                                                                                        <label for="floatingInput" class="text-secondary">
                                                                
                                                                                        </label>
                                                                                        <div class="valid-feedback">
                                                                                        </div>
                                                                
                                                                                    </div>
                                                                                    <br />
                                                                
                                                                                    <br />
                                                                                    <li class="mb-3">닉네임</li>
                                                                                    <div class="form-floating">
                                                                                        <input type="text" placeholder="Nickname" class="form-control input" name="j_nickname"
                                                                                            id="j_nickname" required value="${sessionScope.mvo.m_name}" disabled>
                                                                
                                                                                        <div class="valid-feedback">
                                                                                        </div>
                                                                                        <br />
                                                                                    </div>
                                                                                    <br />
                                                                                    <li class="mb-3">휴대폰 번호</li>
                                                                
                                                                                    <div class="form-floating mb-5">
                                                                                        <input type="text" placeholder="PhoneNumber" class="form-control input" name="m_phone"
                                                                                            id="m_phone" required value="${sessionScope.mvo.m_phone}" disabled>
                                                                
                                                                                        <div class="valid-feedback">
                                                                                        </div>
                                                                
                                                                                    </div>
                                                                
                                                                
                                                                                    <br />
                                                                                    <div class="col-7 d-grid gap-2  mx-auto" href="/infopw">
                                                                                        <button type="button" class="btn btn-dark "> <a class="nav-link" href="/info">회원정보 수정하러 가기
                                                                                                <a /></button>
                                                                                    </div>
                                                                                </ul>
                                                                            </form>
                                                                            <hr>
                                                                
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </td>
                                                        </tr>
                                                    </tbody>
                                            </table>
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
                                            
                                            
                                        </div>                                            
                                    </div>
                                    
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