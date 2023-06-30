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

            <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
            <script src="https://code.jquery.com/ui/1.13.0/jquery-ui.js"></script>
            <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css" />
            <link rel="stylesheet" href="../css/main_custom.css" />
            <style>
                table {
                    width: 100%;
                    border-collapse: collapse;
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
                        <a class="list-group-item list-group-item-action list-group-item-light p-3"
                            href="/info">회원정보수정</a> <a
                            class="list-group-item list-group-item-action list-group-item-light p-3" href="/order">주문
                            내역</a> <a class="list-group-item list-group-item-action list-group-item-light p-3"
                            href="/review">리뷰 관리</a> <a
                            class="list-group-item list-group-item-action list-group-item-light p-3" href="/cart">내
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
                                    <li class="nav-item dropdown"><a class="nav-link dropdown-toggle" id="navbarDropdown" href="#" role="button"
                                            data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">박스</a>
                                        <div class="dropdown-menu dropdown-menu-end" aria-labelledby="navbarDropdown">
                                            <a class="dropdown-item" href="#!">공지사항</a> <a class="dropdown-item"
                                                href="#!">이벤트</a>
                                            <a class="dropdown-item" href="#!">고객센터</a>
                                            <div class="dropdown-divider"></div>
                                            <a class="dropdown-item" href="#!">환경설정</a>
                                        </div>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </nav>
                    <!-- Page content-->

                    <div class="container-fluid">
                        <div class="row">
                            <div class="col-md-1"></div>
                            <div class="col-md-11">
                                <br />
                                <h1>OOO님 환영합니다. </h1>
                                <br />
                                <br />
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-1"></div>
                            <div class="col-md-12 col-md-offset-5">
                                <form name="frm" action="/orderpay" method="post">
                                    <input type="hidden" name="type" value="aoList" />
                                    <table>
                                        <tbody align=center>

                                            <thead>
                                                <tr>
                                                    <td>
                                                        <div class="row">
                                                            <div class="col-md-3">
                                                                <select id="SearchType" name="searchType"
                                                                    class="btn btn-outline-success me-2 mycustom-mem-btn">
                                                                    <option value="0">주문내역</option>
                                                                    
                                                                </select>
                                                            </div>
                                                            <div class="col-md-7">
                                                                <div class="input-group">
                                                                    <!-- <input class="form-control"
                                                                                placeholder="검색어를 입력하세요"
                                                                                aria-describedby="button-addon"
                                                                                type="text" id="searchValue"
                                                                                name="searchValue" /> -->
                                                                    <input type="button" class="btn btn-outline-success me-2 mycustom-mem-btn"
                                                                        onclick="sendKeyword(this.form)" value="검색"
                                                                        id="button-addon" />
                                                                </div>
                                                            </div>
                                                    </td>
                                                </tr>
                                            </thead>
                                    </table>
                            </div>
                        </div>

                        <c:choose>
                            <c:when test="${map.count == 0 }">
                                <!-- when은 ~~일때 라는 뜻 그러니까 map의 count가 0일때... -->
                                <!-- xml파일에서 hashmap에 list를 넣어놓았기 때문에 현재 map에 자료가 들어있다.  -->
                                <!-- map에 자료가 아무것도 없다면 -->
                                장바구니가 비었습니다.
                            </c:when>

                            <c:otherwise>
                                <!-- map.count가 0이 아닐때, 즉 자료가 있을때 -->
                                <!-- form을 실행한다.  -->
                                <!-- form의 id를 form1로 하고, method 방식을 post로 한다. 그리고 update.do페이지로 이동시킨다. -->
                               
                                    <table id="cart_table">
                                        <colgroup>
                                            <col width="20%" />
                                            <col width="80%" />
                                        </colgroup>
                                        <thead>
                                            <tr>
                                                <td colspan="5">
                                                    <h1>장바구니</h1>
                                                </td>
                                            </tr>
                                            <tr>
                                                <th>상품명</th>
                                                
                                                <th>&nbsp;</th>
                                            </tr>
                                        </thead>
                                        
                                        
                                        <tbody>
                                            
                                            <hr />
                                            <c:set var="sumPrice" value="0"/>
                                            <c:set var="fee" value="0"/>
                                                <c:forEach var="pvo" items="${sessionScope.cart.list }" varStatus="st"> 
                                                        <tr >
                                                            <td>${pvo.foodNm} 이미지</td>
                                                            <td colspan="4">
                                                                <div>
                                                                    <p style="font-size: 15px; font-weight: bold;">${pvo.restNm}</p>
                                                                </div>
                                                                <div>
                                                                    <p style="font-size: 12px; ">${pvo.restNm} : 2023-06-24</p>
                                                                </div>
                                                                <div>주문 음식 : ${pvo.foodNm}</div>
                                                                <hr style="border:3px dotted green;" />
                                                                <div> &nbsp;&nbsp; <fmt:formatNumber value="${pvo.totalPrice}" pattern="#,###,###" />원</div>
                                                                <div style="text-align: right;">
                                                                    
                                                                 <button class="btn btn-outline-success me-2 mycustom-mem-btn" type="button">삭제</button>
                                                                <hr />
                                                                </div>
                                                            </td>
                                                            <input type="hidden" value="1" name="p_idx" /> <%--${pvo.p_idx}--%>
                                            
                                                        </tr>
                                                        <c:set var="sumPrice" value="${sumPrice+pvo.totalPrice}"/>
                                                    </c:forEach>
                                                    
                                                    
                                                    
                                                    <!-- map에 있는 list출력하기 위해 forEach문을 사용해 row라는 변수에 넣는다. -->
                                                    <%--
                                                    카트:<c:out value="${fn:length(cart.list)}"/>
                                                    <c:forEach var="pvo" items="${sessionScope.cart.list}">
                                                        <tr align="center">
                                                            <td>${pvo.foodNm}</td>
                                                            
                                                            <td>
                                                                <fmt:formatNumber value="${pvo.foodCost}" pattern="#,###,###" />
                                                            </td>
                                                            <!-- fmt:formatNumber 태그는 숫자를 양식에 맞춰서 문자열로 변환해주는 태그이다 -->
                                                            <!-- 여기서는 금액을 표현할 때 사용 -->
                                                            <!-- ex) 5,000 / 10,000 등등등-->
                                                            
                                                            <td><input type="number" name="amount" style="width:30px;"
                                                                value="<fmt:formatNumber value='${pvo.quantity}'
                                                                pattern='#,###,###' />">
                                                                <!-- 물건의 개수 (amount)를 fmt태그를 사용해서 패턴의 형식에 맞춰서 문자열로 변환함 -->
                                                                <!--1,000 / 5,000 등등~  -->
                                                                
                                                                
                                                            </td>
                                                            <td>
                                                                <fmt:formatNumber value="${pvo.totalPrice}" pattern="#,###,###" />
                                                            </td>
                                                            <td><a
                                                                href="${path}/shop/cart/delete.do?cart_id=${row.cart_id}">[삭제]</a>
                                                                <!-- 삭제 버튼을 누르면 delete.do로 장바구니 개별 id (삭제하길원하는 장바구니 id)를 보내서 삭제한다. -->
                                                            </td>
                                                        </tr>
                                                        
                                                    </c:forEach>
                                                    --%>         
                                                    
                                                    <tr>
                                                        <td colspan="5" align="right">
                                                            
                                                            
                                                            장바구니 금액 합계 :
                                                            
                                                            <fmt:formatNumber value="${sumPrice}" pattern="#,###,###" />원
                                                               
                                                            
                                                            <br/>
                                                            총개수 :
                                                            <fmt:formatNumber value="${fn:length(cart.list)}" pattern="#,###,###" />
                                                        </td>
                                                    </tr>
                                                    
                                                    <tr>
                                                        <td colspan="2" align="right">
                                                            
                                                            <button type="button" id="btnDelete" class="btn btn-outline-success me-2 mycustom-mem-btn">장바구니 비우기</button>
                                                            <!--btnUpdate와 btnDelete id는 위쪽에 있는 자바스크립트가 처리한다.-->
                                                            <button type="button" id="btnList" class="btn btn-outline-success me-2 mycustom-mem-btn" onclick="sendData(this.form)">결제하기</button>
                                                        </td>
                                                    </tr>
                                                    
                                                </tbody>
                                            </table>
                                        </form>
                                            
                                            
                            </c:otherwise>
                        </c:choose>
                       

                    </div>
                    <div>
                        <!-- footer 시작---------------------------------------------------------------------------------------------->
                        <!-- <body class="d-flex flex-column"> -->
                        <footer id="sticky-footer"
                            class="flex-shrink-0 py-4 bg-dark text-white-50 mycustom-main_footer">
                            <div class="container text-center">
                                <small>Copyright &copy; 2023 쉬-잇 </small>
                            </div>
                        </footer>

                        
                        <form action="/orderpay" method="POST" name="frm2">
                            <input type="hidden" name="foodNm" value="${foodNm}">
                            <input type="hidden" name="foodCost" value="${foodCost}">
                            <input type="hidden" name="RestNm" value="${RestNm}">
                            <input type="hidden" name="totalPrice" value="${foodCost}">
                            <input type="hidden" name="quantity" value="1">
                        </form>
                        

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
                                <input type="button" value="검색" onclick="search(this.form)" />
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

                
                
                function sendData(frm) {
                   
                   document.frm2.submit();
               }


                function sendKeyword(form) {

                    var value = $("#searchValue").val();
                    console.log(value);
                    if (value.trim().length < 1) {
                        alert("검색어를 1자 이상 입력하세요");
                        $("searchValue").focus();
                        return;
                    }
                    document.frm.submit();
                }


               



                    $("#Lis").click(function () {
                        location.href = "${path}/shop/product/list.do";
                    });

                    $("#btnDelete").click(function () {
                        if (confirm("장바구니를 비우시겠습니까?")) {
                            location.href = "${path}/shop/cart/deleteAll.do";
                        }
                    });
                    function delete12() {

                        if ("wish" == "wish") {
                            alert("장바구니가 비어졌습니다.");
                        }
                    }

               
                  function fn_cancel_order(order_id) {
                        var answer = confirm("주문을 취소하시겠습니까?");
                        if (answer == true) {
                            var formObj = document.createElement("form");
                            var i_order_id = document.createElement("input");

                            i_order_id.name = "order_id";
                            i_order_id.value = order_id;

                            formObj.appendChild(i_order_id);
                            document.body.appendChild(formObj);
                            formObj.method = "post";
                            formObj.action = "${contextPath}/mypage/cancelMyOrder.do";
                            formObj.submit();
                        }


                    }

            </script>
        </body>

        </html>