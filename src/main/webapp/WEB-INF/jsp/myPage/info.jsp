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

            <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
            <script src="https://code.jquery.com/ui/1.13.0/jquery-ui.js"></script>
            <style>
                table {
                    width: 800px;
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
                            <button class="btn btn-primary" id="sidebarToggle">메뉴</button>
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
                            <div class="col-md-7 col-md-offset-5">
                                <form name="frm" action="myPage" method="post">
                                    <input type="hidden" name="type" value="aoList" />
                                    <table>
                                        <tbody align=center>

                                            <thead>
                                                <tr>
                                                    <td>
                                                        <div class="row">
                                                            <div class="col-md-3">
                                                                <select id="SearchType" name="searchType"
                                                                    class="form-select">
                                                                    <option value="0">휴게소검색</option>
                                                                    <option value="1">주문내역</option>
                                                                    <option value="2">리뷰관리</option>
                                                                    <option value="3">장바구니</option>
                                                                    <option value="4">휴게소검색</option>
                                                                </select>
                                                            </div>
                                                            <div class="col-md-7">
                                                                <div class="input-group">
                                                                    <!-- <input class="form-control"
                                                                                placeholder="검색어를 입력하세요"
                                                                                aria-describedby="button-addon"
                                                                                type="text" id="searchValue"
                                                                                name="searchValue" /> -->
                                                                    <input type="button" class="btn btn-dark"
                                                                        onclick="sendKeyword(this.form)" value="이동"
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
                                <form id="form1" name="form1" method="post" action="${cart}">
                                    <table id="cart_table">
                                        <thead>
                                            <tr>
                                                <td colspan="5">
                                                    <h1>장바구니</h1>
                                                </td>
                                            </tr>
                                            <tr>
                                                <th>상품명</th>
                                                <th>단가</th>
                                                <th>수량</th>
                                                <th>금액</th>
                                                <th>&nbsp;</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <!-- map에 있는 list출력하기 위해 forEach문을 사용해 row라는 변수에 넣는다. -->
                                            <c:forEach var="row" items="${map.list}">
                                                <tr align="center">
                                                    <td>${row.product_name}</td>

                                                    <td>
                                                        <fmt:formatNumber value="${row.price}" pattern="#,###,###" />
                                                    </td>
                                                    <!-- fmt:formatNumber 태그는 숫자를 양식에 맞춰서 문자열로 변환해주는 태그이다 -->
                                                    <!-- 여기서는 금액을 표현할 때 사용 -->
                                                    <!-- ex) 5,000 / 10,000 등등등-->

                                                    <td><input type="number" name="amount" style="width:30px;"
                                                            value="<fmt:formatNumber value=" ${row.amount}"
                                                            pattern="#,###,###" />">
                                                        <!-- 물건의 개수 (amount)를 fmt태그를 사용해서 패턴의 형식에 맞춰서 문자열로 변환함 -->
                                                        <!--1,000 / 5,000 등등~  -->

                                                        <input type="hidden" name="cart_id" value="${row.cart_id}">


                                                    </td>
                                                    <td>
                                                        <fmt:formatNumber value="${row.money}" pattern="#,###,###" />
                                                    </td>
                                                    <td><a
                                                            href="${path}/shop/cart/delete.do?cart_id=${row.cart_id}">[삭제]</a>
                                                        <!-- 삭제 버튼을 누르면 delete.do로 장바구니 개별 id (삭제하길원하는 장바구니 id)를 보내서 삭제한다. -->
                                                    </td>
                                                </tr>
                                            </c:forEach>
                                            <tr>
                                                <td colspan="5" align="right">
                                                    장바구니 금액 합계 :
                                                    <fmt:formatNumber value="${map.sumMoney}" pattern="#,###,###" /><br>
                                                    배송료 : ${map.fee}<br>
                                                    총합계 :
                                                    <fmt:formatNumber value="${map.sum}" pattern="#,###,###" />
                                                </td>
                                            </tr>
                                        </tbody>
                                        <tfoot>
                                            <tr>
                                                <td colspan="5">
                                                    <button id="btnUpdate">수정</button>
                                                    <button type="button" id="btnDelete">장바구니 비우기</button>
                                                    <!--btnUpdate와 btnDelete id는 위쪽에 있는 자바스크립트가 처리한다.-->
                                                    <button type="button" id="btnList">결제하기</button>
                                                </td>
                                            </tr>
                                        </tfoot>
                                    </table>

                                </form>
                            </c:otherwise>
                        </c:choose>
                        <!--
                                <div class="row">
                                    <div class="col-md-1"></div>
                                    <div class="col-md-9">
                                        <table class="table table-hover">
                                            <thead>
                                                <tr style="background:'#353535'">
                                                    <th>목록</th>
                                                    <th>주문자</th>
                                                    <th>주문번호</th>
                                                    <th>상품번호</th>
                                                    <th>주문상태</th>
                                                </tr>
                                            </thead>

                                                <tbody>
                                                    <c:forEach var="pvo" items="${requestScope.ar }" varStatus="st">
                                                        <tr>
                                                            <%--<td>${page.totalRecord -
                                                                ((page.nowPage-1)*page.numPerPage+st.index) }</td> --%>
                                                                <td>${pvo.o_idx}</td>
                                                                <td>${pvo.o_class}</td>
                                                                <td><a href="Controller?type=aoView&o_idx=${pvo.o_idx }">
                                                                    <c:out value="${pvo.o_num }"></c:out>
                                                                </a></td>
                                                                <td>${pvo.p_idx}</td>
                                                                <td>
                                                                    <c:choose>
                                                                        <c:when test="${pvo.o_status == 1}">배송준비중</c:when>
                                                                        <c:when test="${pvo.o_status == 2}">배송중</c:when>
                                                                        <c:when test="${pvo.o_status == 3}">배송완료</c:when>
                                                                        <c:when test="${pvo.o_status == 4}">주문완료</c:when>
                                                                        <c:when test="${pvo.o_status == 5}">주문취소</c:when>
                                                                        
                                                                        <c:otherwise>택배가 가출했어요</c:otherwise>
                                                                    </c:choose>
                                                                </td>
                                                            </tr>
                                                        </c:forEach>
                                                    </tbody>
                                                </table>
                                            </form>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-4"></div>
                                        <div class="col-md-5">
                                            <table>
                                                <tfoot>
                                                    <tr>
                                                        <td>
                                                            <ol class="pagination">
                                                                <c:if test="${page.startPage < page.pagePerBlock}">
                                                                    <li class="page-item disabled"><a
                                                                        class="page-link">&lt;</a></li>
                                                                    </c:if>
                                                                    <c:if test="${page.startPage >= page.pagePerBlock}">
                                                                        <li class="page-item"><a class="page-link"
                                                                            href="Controller?type=aoList&cPage=${page.startPage-page.pagePerBlock }">&lt;</a>
                                                                        </li>
                                                                    </c:if>
                                                                    <c:forEach begin="${page.startPage }" end="${page.endPage }"
                                                                    varStatus="st">
                                                                    <c:if test="${page.nowPage eq st.index}">
                                                                        <li class="page-item active"><a
                                                                            class="page-link">${st.index}</a></li>
                                                                        </c:if>
                                                                        <c:if test="${page.nowPage ne st.index }">
                                                                            <li class="page-item"><a class="page-link"
                                                                                href="Controller?type=aoList&cPage=${st.index}">${st.index
                                                                                }</a></li>
                                                                            </c:if>
                                                                        </c:forEach>
                                                                        <c:if test="${page.endPage<page.totalPage}">
                                                                            <li class="page-item"><a class="page-link"
                                                                                href="Controller?type=aoList&cPage=${page.startPage+page.pagePerBlock }">&gt;</a>
                                                                            </li>
                                                                        </c:if>
                                                                        <c:if test="${page.endPage == page.totalPage}">
                                                                            <li class="page-item disabled"><a
                                                                                class="page-link">&gt;</a></li>
                                                                            </c:if>
                                                                        </ol>
                                                                    </td>
                                                                </tr>
                                                            </tfoot>
                                                        </table>
                                                    </div>
                                                </div>
                                            -->



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
                    console.log(value);
                    if (value.trim().length < 1) {
                        alert("검색어를 1자 이상 입력하세요");
                        $("searchValue").focus();
                        return;
                    }
                    document.frm.submit();
                }


                $(function () {
                    $("#btnList").click(function () {
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

                });

            </script>
        </body>

        </html>