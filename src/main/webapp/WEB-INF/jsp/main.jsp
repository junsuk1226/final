<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
<!-- <div class="mycustom-bg"> -->
    <!-- 메뉴바 ----------------------------------------------------------------------------------------------------------->
    <div class="container main_custom_menubar">
        <header class="d-flex flex-wrap align-items-center justify-content-md-between py-3 mb-3">
            <!-- <a class="nav-link logo_custom" href="/main">내 손안에 휴게소</a> -->
            <div class="col-md-9">
                <a href="/main"><img style="max-width: 200px;" src="../main_images/logo.png"/></a>
            </div>
            <c:if test="${sessionScope.mvo == null}">
                <div class="col-md-3 text-end">
                    <button type="button" class="btn btn-outline-success me-2 mycustom-mem-btn" onclick="location.href='/login'">로그인</button>
                    <button type="button" class="btn btn-outline-success mycustom-mem-btn" onclick="location.href='/join'">회원가입</button>
                </div>
            </c:if>
            <c:if test="${sessionScope.mvo != null}">
            <div class="col-md-3 text-end"> 
                <button type="button" class="btn btn-outline-success me-2 mycustom-mem-btn" onclick="location.href='/logout'">로그 아웃</button>
            <button type="button" class="btn btn-outline-success mycustom-mem-btn" onclick="location.href='/mypage'">마이페이지</button>
            </div>
            </c:if>
        </header>
    </div>
    <!-- 메뉴바끝 (배너 시작) ----------------------------------------------------------------------------------------------------------->

    <div class ="container-fluid text-center">
        <div class="row justify-content-center ">
            <div class="col-md-12">
                <a href="/main"><img style="max-width: 300px;" src="../main_images/main_logo.png"/></a><!--배너가 들어갈 곳-->
            </div>

        </div>
    </div>
    <!-- search_area----------------------------------------------------------------------------------------------->
    <div class="container-fluid row align-items-center justify-content-center mycustom-search_area">
        <div class="container-fluid row  mycustom-search_group">

            <div class="mycustom-search_group_inner"> 
                <h1 class="mycustom-search_logo"><img class="mycustom-search_logo_icon" src="../main_images/search_Icon2.png"></h1>
                <form id="sform" name="search" method="post" action="/search">
                    <fieldset>
                        <input type="hidden">
                        <div class="mycustom-search_inputbox">
                            <input class="mycustom-search_input" placeholder="휴게소명을 입력해 주세요." type="text" id="search1" name="sname" onkeyup="if(window.event.keyCode==13){sendData(this.form)}">
                        </div>
                        <button class="mycustom-search_btn" type="button" onclick="sendData(this.form)"><img class="mycustom-search_icon" src="../main_images/search.png"></button>
                    </fieldset>
                </form>
            </div>
            
        </div>
    </div>
    <!-- search_area 끝----------------------------------------------------------------------------------------------->

    <!--test-->
    <div class="container test_container">
        <div class="rectangle test_rectangle">
          <div class="quadrant quadrant-0 test_quadrant-0_">
            <a href="/map"><img style="min-width: 200px;" src="../main_images/searchLogo.png" alt="Image 1" class="diagonal-image test_diagonal-image"></a>
          </div>
          <!-- <div class="quadrant quadrant-1 test_quadrant-1"></div> -->
          <div class="quadrant quadrant-1 test_quadrant-1">
            <a href="/lineSearchList"><img style="min-width: 200px;" src="../main_images/wayLogo.png" alt="Image 2" class="diagonal-image test_diagonal-image"></a>
          </div>
          <!-- <div class="quadrant quadrant-3 test_quadrant-3"></div> -->
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

<!-- </div> bg 끝 -->

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"
    integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
<script>
    function sendData(frm) {
        let nm = $("#search1").val().trim();
        if (nm.length == 0) {
            alert("검색어를 입력하세요");
            return;
        }
        //$("#svarNm").val(nm);
        frm.submit();
    }
   
</script>
</body>
</html>