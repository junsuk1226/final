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
<link rel="stylesheet" href="../css/menu.css" />
</head>
<body>

    <!-- 메뉴바 -->
    <nav class="navbar bg-light mycustom-menuInfo_menubar">
        <div class="container-fluid d-flex justify-content-between" style="max-width: 700px;">
          <span class="navbar-text mycustom-menuInfo_title">
            메뉴명
          </span>
          <form class="d-flex align-items-center">
            <button class="mycustom-menu_info_icon_btn me-2" type="button">
              <img class="mycustom-menu_info_icon" src="../images/home-icon.png">
            </button>
            <button class="mycustom-menu_info_icon_btn me-2" type="button">
              <img class="mycustom-menu_info_icon" src="../images/cart-icon.png">
            </button>
          </form>
        </div>
    </nav>

    <!-- 메뉴바 끝-->

    <!-- menuinfo area -->
    <div class="container mycustom-menuinfo_area" style="max-width: 700px;">
        <div class="d-flex flex-wrap justify-content-center">
            <ul class="mycustom-menu_info_list">
                <li><img class="mycuston-menu_info_img" src="https://img-cf.kurly.com/shop/data/goodsview/20200818/gv00000105647_1.jpg"></li>
                <li><h1>메뉴명</h1></li>
                <li><h6>메뉴 정보</h6></li>
                <li><h5>가격 10,000원</h5></li>
            </ul>
        </div>
    </div>
    <!--menuinfo area 끝----------->

    <footer class="d-flex flex-wrap justify-content-center text-center">
        <div class="container fixed-bottom d-flex flex-wrap justify-content-center">
            <div class="container mycustom-menuInfo_footer">
                <button type="button" class="mycustom-cart_btn">
                    10,000원 담기
                </button>
            </div>
        </div>
    </footer>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
</body>
</html>