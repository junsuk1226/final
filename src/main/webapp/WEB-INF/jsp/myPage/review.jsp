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
            <!--아이콘 cdn-->
            <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">
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
                    .fa-trash{
                        color: rgb(167, 102, 102);
                    }
                    .fa-trash:hover{
                        color: red;
                        cursor: pointer;
                        transform: translateY(-4px);
                    }
                    .btn:active {
                        outline: none !important;
                        box-shadow: none !important;
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
                            <a class="list-group-item list-group-item-action list-group-item-light p-3" href="/info">회원정보 수정</a> <a
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

                            <div class="container-fluid">
                                <div class="row justify-content-center mt-5">
                                    <div class="col-md-9 mb-3">
                                            <h2 class=" lh-base mt-5 ms-1" style="font-family: 'suite'">
                                                ${sessionScope.mvo.m_name}<span class="text-muted">님의 리뷰 목록</span>
                                            </h2>
                                    </div>
                                </div>
                            </div>
                            <!--별점 평균-->
                            <div class="container-fluid">
                                <div class="row justify-content-center mt-5">
                                    <div class="col-md-9 mb-3">
                                            <div class ="card shadow-sm p-3 mb-3 bg-body rounded" style="border: none;">
                                                <div class = "card-body">
                                                    <div class="card-title">
                                                        <span>나의 별점 평균</span>
                                                        <div class="row justify-content-between">
                                                            <div class="score-num col-md-3">
                                                                <h2>4.5</h2>
                                                            </div>
                                                            <div class="score-bar col-md-6">
                                                                <div class="progress mb-2">
                                                                    <label for="">1점(0)</span>
                                                                    <div class="progress-bar bg-warning"  role="progressbar" style="width: 25%" aria-valuenow="25" aria-valuemin="0" aria-valuemax="100"></div>
                                                                </div>
                                                                <div class="progress mb-2">
                                                                    <div class="progress-bar bg-warning" role="progressbar" style="width: 50%" aria-valuenow="50" aria-valuemin="0" aria-valuemax="100"></div>
                                                                </div>
                                                                <div class="progress mb-2">
                                                                    <div class="progress-bar bg-warning" role="progressbar" style="width: 75%" aria-valuenow="75" aria-valuemin="0" aria-valuemax="100"></div>
                                                                </div>
                                                                <div class="progress mb-2">
                                                                    <div class="progress-bar bg-warning" role="progressbar" style="width: 100%" aria-valuenow="100" aria-valuemin="0" aria-valuemax="100"></div>
                                                                </div>
                                                                <div class="progress mb-12">
                                                                    <div class="progress-bar bg-warning" role="progressbar" style="width: 100%" aria-valuenow="100" aria-valuemin="0" aria-valuemax="100"></div>
                                                                </div>
                                                            </div>
                                                        
                                                        </div>
                                                    </div>
                                                </div>  
                                            </div>
                                    </div>
                                </div>
                            </div>
                            <!-------->

                            <div class="row justify-content-center my-5">
                                <div class="col-md-9 mb-3">
                                        <div class="card ms-2 me-1 shadow p-3 mb-5 bg-body rounded" style="border: none;">
                                            <div class="card-body justify-content-center">
                                                <c:forEach var="rvo" items="${requestScope.ar }" varStatus="st">
                                
                                                    <input type="hidden" value="1" name="p_idx"/>  <!--${pvo.p_idx}-->
                                                    <div class = "row justify-content-around">
                                                        <div class="col-md-3 mb-3 .square-div">
                                                            <img style="object-fit: cover; width: 100%; height:auto;" class="rounded img-fluid" src="..\images\중앙선0550-07-000249.png">
                                                        </div>
                                                    
                                                        <div class="col-md-7 mx-2">
                                                            <div class ="row ">
                                                                <div class="d-flex justify-content-between" >
                                                                    <p style="font-size: larger; font-weight: bold; font-family:'suite';">${rvo.r_restNm}</p>
                                                                    <em><p style="font-size: medium; font-family: 'suite';" class="text-muted">${rvo.r_writedate}</p></em>
                                                                </div>
                                                                <div class="my-3">${rvo.r_content}</div>
                                                                <div style="text-align: right;">
                                                                    <a  onclick="del('${rvo.r_idx}')">
                                                                        <i class="fa fa-trash fa-2x" aria-hidden="true"></i>
                                                                    </a>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                        
                                                    <hr/><!--구분선-->

                                                </c:forEach>

                                                <!--db 없어서 css 보려고 만들어 놓음!!-->
                                                <input type="hidden" value="1" name="p_idx"/>  <!--${pvo.p_idx}-->
                                                    <div class = "row justify-content-around">
                                                        <div class="col-md-3 mb-3 .square-div">
                                                            <img style="object-fit: cover; width: 100%; height:auto;" class="rounded img-fluid" src="..\editor_upload\KakaoTalk_20230617_200836354.jpg">
                                                        </div>
                                                    
                                                        <div class="col-md-7 mx-2">
                                                            <div class ="row ">
                                                                <div class="d-flex justify-content-between" >
                                                                    <p style="font-size: larger; font-weight: bold; font-family:'suite';">평창자연휴게소</p>
                                                                    <em><p style="font-size: medium; font-family: 'suite';" class="text-muted">2023-06-28</p></em>
                                                                </div>
                                                                <div class="my-3">리뷰입니다.</div>
                                                                <div style="text-align: right;">
                                                                    <a  onclick="del('1')">
                                                                        <i class="fa fa-trash fa-2x" aria-hidden="true"></i>
                                                                    </a>
                                                                </div>

                                                            </div>
                                                        </div>
                                                    </div>
                                                    <hr/>
                                                    <!------------------>
                                            </div> 
                                                      
                                        

                                                <div class="col-md-6 d-grid gap-2 my-3 mx-auto justify-content-center">
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
                                                </div>
                                            
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

                        function del(rIdx){
                            console.log(rIdx);
                            if(confirm("삭제하시겠습니까?"))
                                location.href="/delReview?r_idx="+rIdx;
                        }
                    </script>
                </body>

                </html>