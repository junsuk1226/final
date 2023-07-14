<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<link rel="stylesheet" href="../css/main_custom.css" />
<link rel="stylesheet" href="../css/menu.css" />
 <!--아이콘 cdn-->
 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">
</head>
<body>

    <!-- 메뉴바 -->
    <nav class="navbar bg-light mycustom-menuInfo_menubar">
        <div class="container-fluid d-flex justify-content-between" style="max-width: 700px; padding:20px;">
          <span class="navbar-text mycustom-menuInfo_title">
            ${RestNm}
          </span>
          <form class="d-flex align-items-center">
           

            <button class="mycustom-menu_info_icon_btn me-2" type="button" onclick="location.href='/menu?RestNm=${RestNm}'">
              <img class="mycustom-menu_info_icon" src="../images/back.png">
            </button>
            <c:if test="${sessionScope.listSize ne null}">
              <button class="mycustom-menu_info_icon_btn me-2 position-relative" type="button" onclick='location.href="/cart"'>
                <span class="position-absolute top-0 start-100 translate-middle badge rounded-pill bg-danger">
                  ${sessionScope.listSize}+
                  <span class="visually-hidden">unread messages</span>
                </span>
              
                <img class="mycustom-menu_info_icon" src="../images/cart-icon.png">
              </button>
           </c:if>
           <c:if test="${sessionScope.listSize eq null}">
              <button class="mycustom-menu_info_icon_btn me-2 position-relative" type="button" onclick='location.href="/cart"'>
                <span class="position-absolute top-0 start-100 translate-middle badge rounded-pill bg-danger">
                  0
                  <span class="visually-hidden">unread messages</span>
                </span>
              
                <img class="mycustom-menu_info_icon" src="../images/cart-icon.png">
              </button>
           </c:if>
          </form>
        </div>
    </nav>

    <!-- 메뉴바 끝-->

    <!-- menuinfo area -->
    <div class="container mycustom-menuinfo_area" style="max-width: 700px; padding: 0;">
        <div class="d-flex flex-wrap justify-content-center" style="max-width: 700px; padding: 0;">
            <ul class="mycustom-menu_info_list">
                <li><img class="mycuston-menu_info_img" src="${f_image}" style="height:500px; width: 100%; margin-bottom: 20px; padding: 0px 10px; object-fit: cover;"></li>
                <li>
                  <h1 class="mycustom-menuInfo_menu_title" style="padding: 10px">${foodNm}</h1>
                </li>
                <li><h5 class="mycustom-menuInfo_menu_etc" style="padding: 10px">${etc}</h5></li>
                <!-- <li><h6 class="mycustom-menuInfo_menu_foodMaterial">재료: ${foodMaterial}</h6></li> -->
                <div class="container-fluid d-flex justify-content-between mycustom-menuInfo_menu_price" style="padding:10px">
                  <h5 class="mycustom-menuInfo_count_num">가격</h5>
                  <h5 class="mycustom-menuInfo_count_num">
                    <c:set var="formattedCost" value="${foodCost}" />
                    <fmt:formatNumber value="${formattedCost}" pattern="###,###원" />
                  </h5>
                </div>
              </ul>
            </div>
            <div class="container-fluid d-flex justify-content-between mycustom-menuInfo_count" style="padding: 10px">
                <p class="mycustom-menuInfo_count_num">수량</p>
                <div class="d-flex justify-content-center mycustom-menuInfo_count_box"> 
                  <button class="mycustom-menuInfo_count_num" type ="button" id="minus_btn">-</button>
                  <input class="mycustom-menuInfo_count_num" type="text" id="pop_out" name="pop_out" value="1" readonly="readonly" style="text-align:center; width: 150px;/">
                  <button class="mycustom-menuInfo_count_num" type="button" id="plus_btn">+</button>
                </div>
            </div>
          </div>
          
          <!--menuinfo area 끝----------->
          
          <footer class="d-flex flex-wrap justify-content-center text-center">
            <div class="container fixed-bottom d-flex flex-wrap justify-content-center" style="padding:0;">
              <div class="container mycustom-menuInfo_footer">
                <button type="button" class="mycustom-cart_btn" onclick="cart()">1</button>
            </div>
        </div>
    </footer>

    <form action="/viewCart" method="POST" id="frm">
      <input type="hidden" name="foodNm" value="${foodNm}">
      <input type="hidden" name="foodCost" value="${foodCost}">
      <input type="hidden" name="RestNm"  value="${RestNm}">
      <input type="hidden" name="totalPrice" value="${foodCost}">
      <input type="hidden" name="quantity" value="1">
      <input type="hidden" name="emptyCart" id="emptyCart">
      <input type="hidden" name="seq" value="${seq}">
      </form>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
    
    
    <script>
       // "+" 버튼 클릭 이벤트 핸들러
       var formatted = new Intl.NumberFormat("ko-KR", { style: "currency", currency: "KRW" , currencyDisplay: "narrowSymbol"});
        var formattedCost = formatted.format("${foodCost}").replace(/₩/g, "");
       $(".mycustom-cart_btn").text(formattedCost + "원 담기");

        $("#plus_btn").click(function() {
          var quantity = parseInt($("#pop_out").val()); // 현재 수량 가져오기
          quantity += 1; // 수량 증가
          $("#pop_out").val(quantity); // 수량 업데이트

          var unitPrice = parseInt("${foodCost}"); // 단일 가격 가져오기
          var totalPrice = quantity * unitPrice; // 총 가격 계산
          var formatted = new Intl.NumberFormat("ko-KR", { style: "currency", currency: "KRW" , currencyDisplay: "narrowSymbol"});
          var formattedCost = formatted.format(totalPrice).replace(/₩/g, "");

          $(".mycustom-cart_btn").text(formattedCost + "원 담기"); // 가격 업데이트


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

          var formatted = new Intl.NumberFormat("ko-KR", { style: "currency", currency: "KRW" , currencyDisplay: "narrowSymbol"});
          var formattedCost = formatted.format(totalPrice).replace(/₩/g, "");
          $(".mycustom-cart_btn").text(formattedCost + "원 담기"); // 가격 업데이트

          $("input[name='quantity']").val(quantity);
          $("input[name='totalPrice']").val(totalPrice);
        });

      function cart(){
        var inputElement = document.querySelector('input[name="RestNm"]');

        // 값 가져오기
        var restNm = inputElement.value;
        var getRestNm = "${sessionScope.RestNm}";
        
        if (restNm != getRestNm && getRestNm != null) {
          var confirmMessage = "장바구니에는 같은 휴게소의 메뉴만 담을 수 있습니다.\n\n";
          confirmMessage += "선택하신 메뉴를 장바구니에 담을 경우 이전에 담은 메뉴가 삭제됩니다.\n\n";

          // 휴게소가 달라졌으니 emptyCart의 value를 1로 지정하고 서버로 보낸다.
          $("#emptyCart").val("1");
          if (!confirm(confirmMessage)) {
            return; // 취소 버튼을 눌렀을 경우 함수 실행 중단
          }
        }

        document.getElementById('frm').submit();
      }
    </script>

  </body>
</html>