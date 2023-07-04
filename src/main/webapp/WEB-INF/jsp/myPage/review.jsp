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
                                                    <div class="card-title mb-2">
                                                        <span style="font-size: larger;">나의 별점 평균
                                                            <span class="text-muted mb-1" style="font-size: large;">(${scoreCnt}건)
                                                                
                                                            </span>
                                                        </span>
                                                        <div class="row justify-content-around align-items-center">
                                                            <div class="score-num col-md-3 justify-content-end">
                                                                <h2><i class="fa fa-star me-2" aria-hidden="true" style="color: #ffd000;"></i><span>${scoreAvg}</span></h2>
                                                            </div>
                                                            <c:set var="score" value="${score}"></c:set>
                                                            <div class="col-md-8">
                                                                <div class="row d-flex">
                                                                    <table>
                                                                        <colgroup>
                                                                            <col style="width:65px;"/>
                                                                            <col style="width:auto;"/>
                                                                        </colgroup>
                                                                        <tbody>
                                                                          <tr>
                                                                            <td>
                                                                              <span>1점<span class="text-muted ms-1" style="font-size: small;">(${score.one})</span></span>
                                                                            </td>
                                                                            <td>
                                                                              <div class="progress mb-2">
                                                                                <div class="progress-bar bg-warning" style="width: ${(score.one / scoreCnt) * 100}%;" role="progressbar" aria-valuenow="${score.one}" aria-valuemin="0" aria-valuemax="${scoreCnt}"></div>
                                                                              </div>
                                                                            </td>
                                                                          </tr>
                                                                          <tr>
                                                                            <td>
                                                                              <span>2점<span class="text-muted ms-1" style="font-size: small;">(${score.two})</span></span>
                                                                            </td>
                                                                            <td>
                                                                              <div class="progress mb-2">
                                                                                <div class="progress-bar bg-warning" role="progressbar" style="width: ${(score.two / scoreCnt) * 100}%;" aria-valuenow="${score.two}" aria-valuemin="0" aria-valuemax="${scoreCnt}"></div>
                                                                              </div>
                                                                            </td>
                                                                          </tr>
                                                                          <tr>
                                                                            <td>
                                                                              <span>3점<span class="text-muted ms-1" style="font-size: small;">(${score.three})</span></span>
                                                                            </td>
                                                                            <td>
                                                                              <div class="progress mb-2">
                                                                                <div class="progress-bar bg-warning" role="progressbar" style="width: ${(score.three / scoreCnt) * 100}%;" aria-valuenow="${score.three}" aria-valuemin="0" aria-valuemax="${scoreCnt}"></div>
                                                                              </div>
                                                                            </td>
                                                                          </tr>
                                                                          <tr>
                                                                            <td>
                                                                              <span>4점<span class="text-muted ms-1" style="font-size: small;">(${score.four})</span></span>
                                                                            </td>
                                                                            <td>
                                                                              <div class="progress mb-2">
                                                                                <div class="progress-bar bg-warning" role="progressbar" style="width: ${(score.four / scoreCnt) * 100}%;" aria-valuenow="${score.four}" aria-valuemin="0" aria-valuemax="${scoreCnt}"></div>
                                                                              </div>
                                                                            </td>
                                                                          </tr>
                                                                          <tr>
                                                                            <td>
                                                                              <span>5점<span class="text-muted ms-1" style="font-size: small;">(${score.five})</span></span>
                                                                            </td>
                                                                            <td>
                                                                              <div class="progress mb-2">
                                                                                <div class="progress-bar bg-warning" role="progressbar" style="width: ${(score.five / scoreCnt) * 100}%;" aria-valuenow="${score.five}" aria-valuemin="0" aria-valuemax="${scoreCnt}"></div>
                                                                              </div>
                                                                            </td>
                                                                          </tr>
                                                                        </tbody>
                                                                      </table>
                                                                      
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
                            <!-----리뷰 목록------>
                            <div class="row justify-content-center my-5">
                                <div class="col-md-9 mb-3">
                                        <div class="card ms-2 me-1 shadow p-3 mb-5 bg-body rounded" style="border: none;">
                                            <div class="card-body justify-content-center">
                                                <c:forEach var="rvo" items="${requestScope.ar }" varStatus="st">
                                                    <!-- <input type="hidden" value="1" name="p_idx"/>  ${pvo.p_idx} -->
                                                    <div class = "row justify-content-around align-items-center">
                                                        <div class="col-md-3 mb-3 .square-div">
                                                            <img style="object-fit: cover; width: 100%; height:auto;" class="rounded img-fluid" src="../editor_upload/${rvo.r_file}"/>
                                                        </div>
                                                    
                                                        <div class="col-md-7 mx-2">
                                                            <div class ="row ">
                                                                <div class="d-flex justify-content-between align-items-center" >
                                                                    <span style="font-size: larger; font-weight: bold;">${rvo.r_restNm}</span>
                                                                    <em><p style="font-size: medium; font-family: 'suite';" class="text-muted">${rvo.r_writedate}</p></em>
                                                                </div>
                                                                    <div class="col-md-4 my-2 me-5 justify-content-center">
                                                                        <c:forEach begin="1" end="${rvo.r_score}">
                                                                            <i class="fa fa-star" style="color: #FBB202;"></i>
                                                                        </c:forEach>
                                                                        <c:forEach begin="1" end="${5 - rvo.r_score}">
                                                                            <i class="fa fa-star-o" style="color: #FBB202;"></i>
                                                                        </c:forEach>
                                                                    </div>
                                                                <div class="card mb-3" style="border: none; background-color: rgb(247, 245, 238);">
                                                                    <div class="card-body">
                                                                        <div class="my-3">${rvo.r_content}</div>
                                                                    </div>   
                                                                </div>
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
                                            </div> 
                                                 
                                        <div class="row">
                                            <div class="col-md-1"></div>
                                            <div class="col-md-9">
                                                <table class="table table-hover">
                                                    <thead>
                                                        <tr style="background:'#353535'">
                                                            <th colspan="5">리뷰관리</th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        <c:forEach var="rvo" items="${requestScope.ar }" varStatus="st">
                                                            <tr>
                                        
                                                                <td style="width: 200px;">휴게소이미지</td>
                                                                <td colspan="4">
                                                                    <div>
                                                                        <p style="font-size: 15px; font-weight: bold;">${rvo.r_restNm}</p>
                                                                    </div>
                                                                    <div>
                                                                        <p style="font-size: 12px; ">${rvo.r_writedate}</p>
                                                                    </div>
                                                                    <div>${rvo.r_content}</div>
                                                                    <div style="text-align: right;">
                                                                        <button class="btn btn-outline-success me-2 mycustom-mem-btn" type="button"
                                                                            onclick="del('${rvo.r_idx}')">삭제</button>
                                                                    </div>
                                                                </td>
                                                            </tr>
                                        
                                        
                                                        </c:forEach>
                                                    </tbody>
                                                </table>
                                                </form>
                                            </div>
                                        </div>
                                            
                                                <tr>
                                                    <td colspan="4">
                                                
                                                        <ol class="pagination">
                                                            <c:if test="${page.startPage < page.pagePerBlock}">
                                                                <li class="page-item disabled"><a class="page-link">&lt;</a></li>
                                                            </c:if>
                                                            <c:if test="${page.startPage >= page.pagePerBlock}">
                                                                <li class="page-item"><a class="page-link"
                                                                        href="ReviewController?type=reviewlist&cPage=${page.startPage-page.pagePerBlock }">&lt;</a></li>
                                                            </c:if>
                                                            <c:forEach begin="${page.startPage }" end="${page.endPage }" varStatus="st">
                                                                <c:if test="${page.nowPage eq st.index}">
                                                                    <li class="page-item active"><a class="page-link">${st.index}</a></li>
                                                                </c:if>
                                                                <c:if test="${page.nowPage ne st.index }">
                                                                    <li class="page-item"><a class="page-link" href="ReviewController?type=reviewlist&cPage=${st.index}">${st.index }</a>
                                                                    </li>
                                                                </c:if>
                                                            </c:forEach>
                                                            <c:if test="${page.endPage<page.totalPage}">
                                                                <li class="page-item"><a class="page-link"
                                                                        href="ReviewController?type=reviewlist&cPage=${page.startPage+page.pagePerBlock }">&gt;</a></li>
                                                            </c:if>
                                                            <c:if test="${page.endPage == page.totalPage}">
                                                                <li class="page-item disabled"><a class="page-link">&gt;</a></li>
                                                            </c:if>
                                                        </ol>
                                                
                                                    </td>
                                                </tr>
                                            <c:if test="${ar eq null }">
                                                <tr>
                                                    <td colspan="5" class="empty">현재 등록된 게시물이 없습니다.</td>
                                                </tr>
                                                    </tr>
                                                    </c:if>
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