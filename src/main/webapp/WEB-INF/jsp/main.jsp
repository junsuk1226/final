<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>내 손안에 휴게소, 마이휴</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<link rel="stylesheet" href="../css/main_custom.css" />
<style>
    @media (max-width: 767px) {
        .custom-image {
            max-width: 100%;
            height: auto;
        }
    }
    /*모바일 화면 로그인 버튼*/
    @media (max-width: 767px) {
    .main_custom_menubar .d-flex {
      flex-direction: row;
      justify-content: flex-end;
    }
    .main_custom_menubar .col-md-3 {
      flex-basis: 100%;
    }
  }

    .hover-fade img {
      width: 100%;
      height: auto;
      -webkit-transition: all 0.5s ease-in-out;
      -moz-transition: all 0.5s ease-in-out;
      -o-transition: all 0.5s ease-in-out;
      -ms-transition: all 0.5s ease-in-out;
      transition: all 0.5s ease-in-out;
    }
    .hover-fade:hover img {
      -webkit-transform: scale(1.05);
      -moz-transform: scale(1.05);
      -o-transform: scale(1.05);
      -ms-transform: scale(1.05);
      transform: scale(1.05);
      -ms-filter: "progid: DXImageTransform.Microsoft.Alpha(Opacity=0.5)";
      filter: alpha(opacity=0.5);
      opacity: 0.5;
    }
</style>

</head>
<body>
<!-- <div class="mycustom-bg"> -->
    <!-- 메뉴바 ----------------------------------------------------------------------------------------------------------->
    <div class="container main_custom_menubar">
        <header class="d-flex justify-content-between py-3">
            <div class="col-md-3">
                <a href="/main"><img style="max-width: 180px;" class="pb-3" src="../main_images/logo.png"/></a>
            </div>
            <c:if test="${sessionScope.mvo == null}">
                <div class="col-md-3 text-end d-flex align-items-center">
                    <button type="button" class="btn btn-outline-success me-2 mycustom-mem-btn" onclick="location.href='/login'">로그인</button>
                    <button type="button" class="btn btn-outline-success mycustom-mem-btn" onclick="location.href='/join'">회원가입</button>
                </div>
            </c:if>
            <c:if test="${sessionScope.mvo != null}">
            <div class="col-md-3 text-end d-flex align-items-center"> 
                <button type="button" class="btn btn-outline-success me-2 mycustom-mem-btn" onclick="location.href='/logout'">로그 아웃</button>
                <button type="button" class="btn btn-outline-success mycustom-mem-btn" onclick="location.href='/myPage'">마이페이지</button>
            </div>
            </c:if>
        </header>
    </div>
    <!-- 메뉴바끝 (배너 시작) ----------------------------------------------------------------------------------------------------------->

    



    <div class="container-fluid row align-items-center justify-content-center"  >
        <div class="d-flex flex-wrap align-items-center justify-content-sm-between py-3 ">

            <div class ="container-fluid text-center">
                <div class="row justify-content-center ">
                    <div class="col-md-12">
                        <a href=""><img class="img-fluid" style="max-height: 400px;" src="../main_images/hand2.png"/></a>
                    </div>
                </div>
            </div>   
        </div>
    </div>


    <!-- search_area----------------------------------------------------------------------------------------------->
    <div class="container-fluid row align-items-center justify-content-center mycustom-search_area">
        <div class="container-fluid row  mycustom-search_group">

            <div class="mycustom-search_group_inner"> 
                <div class="mycustom-search_logo mb-1"><img class="mycustom-search_logo_icon " src="../main_images/search_Icon2.png"></div>
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
    <div class="container mycustom-main_search_btn_container">
        <div class="rectangle mycustom-main_rectangle">
          <div class="quadrant mycustom-main_quadrant quadrant-0 mycustom-main_quadrant-0 " style="margin: 5px;">
            <a href="/map">
                <div class="mycustom-diagonal_image_area hover-fade">
                    <img  src="../main_images/searchLogo.png" alt="Image 1" class="diagonal-image mycustom-main_diagonal-image">
                </div>
            </a>
          </div>
          <div class="quadrant mycustom-main_quadrant quadrant-1 mycustom-main_quadrant-1 hover-fade" style="margin: 5px;">
            <a href="/lineSearchList"><img  src="../main_images/wayLogo.png" alt="Image 2" class="diagonal-image mycustom-main_diagonal-image"></a>
          </div>
        </div>
    </div>
      <!--------------------------------------------------->
    


    
  
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