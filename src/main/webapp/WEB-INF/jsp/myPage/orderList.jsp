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
                                                <div class="dropdown-menu dropdown-menu-end"
                                                    aria-labelledby="navbarDropdown">
                                                    <a class="dropdown-item" href="#!">공지사항</a> <a
                                                        class="dropdown-item" href="#!">이벤트</a>
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
                                        <h1>올리비아 세바스찬 루이 28세님 환영합니다. </h1>
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
                                                                            <option value="0">관심검색</option>
                                                                            <option value="1">주문내역</option>
                                                                            <option value="2">리뷰관리</option>
                                                                            <option value="3">장바구니</option>
                                                                            <option value="4">휴게소검색</option>
                                                                        </select>
                                                                    </div>
                                                                    <div class="col-md-7">
                                                                        <div class="input-group">
                                                                            <input class="form-control"
                                                                                placeholder="검색어를 입력하세요"
                                                                                aria-describedby="button-addon"
                                                                                type="text" id="searchValue"
                                                                                name="searchValue" />
                                                                            <input type="button" class="btn btn-dark"
                                                                                onclick="sendKeyword(this.form)"
                                                                                value="검색" id="button-addon" />
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
                                                <tr style="background:'#353535'">
                                                    <th colspan="5">주문내역</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <%-- <c:forEach var="pvo" items="${requestScope.ar }" varStatus="st"> --%>
                                                    <tr>
                                                        <%-- 주석시작 --%>
                                                        <%--<td>${page.totalRecord -
                                                            ((page.nowPage-1)*page.numPerPage+st.index) }</td> --%>
                                                            <%-- <td>${pvo.o_idx}</td>
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
                                                            </td> --%>
                                                        <%-- 주석끝 --%>


                                                        <td>이미지</td>
                                                        <td colspan="4">
                                                            <div><p style="font-size: 15px; font-weight: bold;">휴게소명</p></div>
                                                            <div><p style="font-size: 12px; ">업소명 : 2023-06-24</p></div>
                                                            <div>떡볶이 외 21건 </div>
                                                            <div>-------------------------- </div>
                                                            <div> 총 218,000원</div>
                                                            <div style="text-align: right;">
                                                                <button type="button">삭제</button>
                                                            </div>
                                                        </td>    
                                                    </tr>
                                                    <tr>

                                                        <td>이미지</td>
                                                        <td colspan="4">
                                                            <div><p style="font-size: 15px; font-weight: bold;">휴게소명</p></div>
                                                            <div><p style="font-size: 12px; ">업소명 : 2023-06-24</p></div>
                                                            <div>티본스테이크 외 4건 </div>
                                                            <div>-------------------------- </div>
                                                            <div> 총 467,000원</div>
                                                            <div style="text-align: right;">
                                                                <button type="button">삭제</button>
                                                            </div>
                                                        </td>    
                                                    </tr>
                                                <%-- </c:forEach> --%>
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

                                
                                
                            </div>
                            <div>
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
                            console.log(value);
                            if (value.trim().length < 1) {
                                alert("검색어를 1자 이상 입력하세요");
                                $("searchValue").focus();
                                return;
                            }
                            document.frm.submit();
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