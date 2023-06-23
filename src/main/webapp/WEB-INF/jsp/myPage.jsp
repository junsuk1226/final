<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

    <style>
        table {
           width: 80%;
           margin: 0 auto;
        }
    
        table th,
        table td {
            /*border: 2px solid black;*/
            padding: 4px;
        }
    
        table caption {
            text-indent: -9999px;
            height: 0;
        }
    
        .popup {
            display: none;
        }
    
        .empty {
            height: 50px;
            color: #ababab;
        }
    </style>

        <!DOCTYPE html>
        <html>

        <head>
            <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
            <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
            <meta name="description" content="" />
            <meta name="author" content="" />
            <title>Insert title here</title>

            <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
            <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet"
                integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
                crossorigin="anonymous">

            <link rel="stylesheet" href="../css/main_custom.css" />

            <!-- 새로추가 -->
            <link rel="stylesheet" href="//code.jquery.com/ui/1.13.0/themes/base/jquery-ui.css">
            <link rel="stylesheet" href="css/summernote-lite.css">
            
            <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
            <script src="https://code.jquery.com/ui/1.13.0/jquery-ui.js"></script>
        </head>

        <body>
            <!-- 메뉴바 ----------------------------------------------------------------------------------------------------------->
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
                            onclick="location.href='/main'">메인페이지</button>
                        </div>
                    </c:if>
                </header>
            </div>
            <!-- 메뉴바 ----------------------------------------------------------------------------------------------------------->
         
                <dvi class="d-flex" id="wrapper">

                    <form id="mypage" action="/myPage" class="input-group my-5" method="post" name="frr">
                        
                            <div class="border-end bg-white" id="sidebar-wrapper">
                                <div class="sidebar-heading border-bottom bg-light">마이페이지</div>
                                <div class="list-group list-group-flush">
                                    <a class="list-group-item list-group-item-action list-group-item-light p-3" href="Controller?type=aviewList">회원정보수정</a> <a class="list-group-item list-group-item-action list-group-item-light p-3"
                                    href="Controller?type=aoList">주문내역</a> <a
                                    class="list-group-item list-group-item-action list-group-item-light p-3" href="Controller?type=aqList">리뷰관리</a> <a class="list-group-item list-group-item-action list-group-item-light p-3"
                                    href="Controller?type=amList">모루게써1</a> <a
                                    
                               
                            </div>
                        </form>
                        <div id="page-content-wrapper">
                            <!-- Top navigation-->
                            <nav class="navbar navbar-expand-lg navbar-light bg-light border-bottom">
                                <div class="container-fluid">
                                    <button class="btn btn-primary" id="sidebarToggle">메인 페이지</button>
                                    <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
                                    data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false"
                                    aria-label="Toggle navigation">
                                    <span class="navbar-toggler-icon"></span>
                                </button>
                                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                                    <ul class="navbar-nav ms-auto mt-2 mt-lg-0">
                                        <li class="nav-item active"><a class="nav-link" href="#!">홈끄</a></li>
                                        <li class="nav-item"><a class="nav-link" href="#!">링끄</a></li>
                                        <li class="nav-item dropdown"><a class="nav-link dropdown-toggle" id="navbarDropdown" href="#"
                                            role="button" data-bs-toggle="dropdown" aria-haspopup="true"
                                            aria-expanded="false">계정탈퇴</a>
                                            <div class="dropdown-menu dropdown-menu-end" aria-labelledby="navbarDropdown">
                                                <a class="dropdown-item" href="#!">Action</a> <a class="dropdown-item" href="#!">Another
                                                    action</a>
                                                    <div class="dropdown-divider"></div>
                                                    <a class="dropdown-item" href="#!">Something else here</a>
                                                </div>
                                            </li>
                                        </ul>
                                    </div>
                                </div>
                            </nav>
                            <!---------- 화면단 ---------------->
<div class="container-fluid">
    <div class="row">
        
        <div class="col-md-11">
            <br />
            <h1>회원테이블수정</h1>
            <br />
            <br />
        </div>
    </div>
    <div class="row">
        <div class="col-md-1"></div>
        <div class="col-md-7 col-md-offset-5">
            <form name="frm" action="Controller" method="post">
                <input type="hidden" name="type" value="aoList" />
                <table>
                    <tbody align=center>

                        <thead>
                            <tr>
                                <td>
                                    <div class="row">
                                        <div class="col-md-3">
                                            <select id="SearchType" name="searchType" class="form-select">
                                                <option value="0">목록</option>
                                                <option value="1">예시1</option>
                                                <option value="2">예시2</option>
                                                <option value="3">예시3</option>
                                                <option value="4">예시4</option>
                                            </select>
                                        </div>
                                        <div class="col-md-7">
                                            <div class="input-group">
                                                <input class="form-control" placeholder="검색어를 입력하세요"
                                                    aria-describedby="button-addon" type="text" id="searchValue"
                                                    name="searchValue" />
                                                <input type="button" class="btn btn-dark"
                                                    onclick="sendKeyword(this.form)" value="검색" id="button-addon" />
                                            </div>
                                        </div>
                                </td>
                            </tr>
                        </thead>
                </table>
        </div>
    </div>
    <div class="row">
        <div class="col-md-1"></div>
        <div class="col-md-9">
            <table class="table table-hover">
                <thead>
                    <tr style="">
                        <th>예시1</th>
                        <th>예시2</th>
                        <th>예시3</th>
                        <th>예시4</th>
                        <th>예시5</th>
                    </tr>
                </thead>
                <tbody>

                            
                        </form>
                    </div>
    </div>
    </div>
                
                
                <!-- footer 시작---------------------------------------------------------------------------------------------->
                
                <footer id="sticky-footer" class="flex-shrink-0 py-4 bg-dark text-white-50 mycustom-main_footer">
                    <div class="container text-center">
                        <small>Copyright &copy; 2023 쉬-잇 </small>
                    </div>
                </footer>
            
                                    <!-- footer 끝---------------------------------------------------------------------------------------------->
                
                <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
                integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
                crossorigin="anonymous"></script>

                <script src="https://code.jquery.com/jquery-3.6.0.min.js"
                integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
                <script src="js/scripts.js"></script>
                <script src="js/summernote-lite.js"></script>
                <script src="js/lang/summernote-ko-KR.min.js"></script>
            </script>
        </body>
        </html>