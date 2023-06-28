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
            ${RestNm}
          </span>
          <form class="d-flex align-items-center">
            <button class="mycustom-menu_info_icon_btn me-2" type="button" onclick="location.href='/menu?RestNm=${RestNm}'">
              <img class="mycustom-menu_info_icon" src="../images/home-icon.png">
            </button>
            <button class="mycustom-menu_info_icon_btn me-2 position-relative" type="button" onclick='location.href="/cart"'>
              <span class="position-absolute top-0 start-100 translate-middle badge rounded-pill bg-danger">
                9+
                <span class="visually-hidden">unread messages</span>
              </span>
            
              <img class="mycustom-menu_info_icon" src="../images/cart-icon.png">
            </button>
          </form>
        </div>
    </nav>

    <!-- 메뉴바 끝-->

    <!-- menuinfo area -->
    <div class="container mycustom-menuinfo_area" style="max-width: 700px;">
        <div class="d-flex flex-wrap justify-content-center" style="max-width: 700px;">
            <ul class="mycustom-menu_info_list">
                <li><img class="mycuston-menu_info_img" src="${f_image}"></li>
                <li><h1>${foodNm}</h1></li>
                <li><h5>${etc}</h5></li>
                <li><h6>${foodMaterial}</h6></li>
                <li><h5>
                  <c:set var="formattedCost" value="${fvo.foodCost}" />
                  <fmt:formatNumber value="${formattedCost}" pattern="###,###원" />
                </h5></li>
                <tr style="text-align:center;">
                  
                  <td>
                      <button type ="button" id="plus_btn">+</button>
                      <input type="text" id="pop_out" name="pop_out" value="1" readonly="readonly" style="text-align:center;"/>
                      <button type="button" id="minus_btn">-</button>
                  </td>
                </tr>
            </ul>
        </div>
    </div>
    
    <!--menuinfo area 끝----------->

    <footer class="d-flex flex-wrap justify-content-center text-center">
        <div class="container fixed-bottom d-flex flex-wrap justify-content-center">
            <div class="container mycustom-menuInfo_footer">
                <button type="button" class="mycustom-cart_btn" onclick="cart()">
                  ${foodCost}원 담기
                </button>
            </div>
        </div>
    </footer>

    <form action="/viewCart" method="POST" id="frm">
      <input type="hidden" name="foodNm" value="${foodNm}">
      <input type="hidden" name="foodCost" value="${foodCost}">
      <input type="hidden" name="RestNm" value="${RestNm}">
      <input type="hidden" name="totalPrice" value="">
      <input type="hidden" name="quantity" value="">
      </form>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
    
    
    <script>
       // "+" 버튼 클릭 이벤트 핸들러
        $("#plus_btn").click(function() {
          var quantity = parseInt($("#pop_out").val()); // 현재 수량 가져오기
          quantity += 1; // 수량 증가
          $("#pop_out").val(quantity); // 수량 업데이트

          var unitPrice = parseInt("${foodCost}"); // 단일 가격 가져오기
          var totalPrice = quantity * unitPrice; // 총 가격 계산
          $(".mycustom-cart_btn").text(totalPrice + "원 담기"); // 가격 업데이트

          $("input[name='quantity']").val(quantity);
          $("input[name='totalPrice']").val(totalPrice);
        });

        // "-" 버튼 클릭 이벤트 핸들러
        $("#minus_btn").click(function() {
          var quantity = parseInt($("#pop_out").val()); // 현재 수량 가져오기
          quantity = Math.max(quantity - 1, 1); // 수량 감소 (단, 최소값은 0으로 설정)
          $("#pop_out").val(quantity); // 수량 업데이트

          var unitPrice = parseInt("${foodCost}"); // 단일 가격 가져오기
          var totalPrice = quantity * unitPrice; // 총 가격 계산
          $(".mycustom-cart_btn").text(totalPrice + "원 담기"); // 가격 업데이트

          $("input[name='quantity']").val(quantity);
          $("input[name='totalPrice']").val(totalPrice);
        });

      function cart(){
        document.getElementById('frm').submit();
      }
    </script>

  </body>
</html>