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
            <title>마이휴 마이페이지</title>
            <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
            <!-- Core theme CSS (includes Bootstrap)-->
            <link href="css/styles.css" rel="stylesheet" />
            <link href="css/bootstrap.css" rel="stylesheet" />
            <!-- 새로추가 -->
            <link rel="stylesheet" href="//code.jquery.com/ui/1.13.0/themes/base/jquery-ui.css">

             <!--아이콘 cdn-->
             <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">

            <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
            <script src="https://code.jquery.com/ui/1.13.0/jquery-ui.js"></script>
            <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css" />
            <link rel="stylesheet" href="../css/main_custom.css" />
            <style>
                .fa-credit-card:hover{
                    color: #b699ee;
                    transform: translateY(-4px);
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
                            href="/info">회원정보 수정</a> <a
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
                                   
                                </ul>
                            </div>
                        </div>
                    </nav>
                    <!-- Page content-->

                    <div class="container-fluid">
                        <div class="row justify-content-center mt-5">
                            <div class="col-md-6 mb-3">
                                <h2 class=" lh-base mt-5 ms-1" style="font-family: 'suite'">
                                    ${sessionScope.mvo.m_name}<span class="text-muted">님의 장바구니</span>
                                </h2>
                            </div>
                        </div>
                        
                        <c:choose>
                            <c:when test="${fn:length(cart.list) == 0 }">
                                <!-- when은 ~~일때 라는 뜻 그러니까 map의 count가 0일때... -->
                                <!-- xml파일에서 hashmap에 list를 넣어놓았기 때문에 현재 map에 자료가 들어있다.  -->
                                <!-- map에 자료가 아무것도 없다면 -->
                                
                                <div class="container-fluid mb-4">
                                    <div class="row justify-content-center col-md-12 my-5">
                                        <div  class="col-md-6 mb-5">
                                            <div class="mb-2 ms-2">
                                                <span style="font-family: 'suite'; font-size: large; font-weight: bold;">${RestNm}</span>
                                            </div>
                                            <div class="col-6 mb-2 float-start text-start">
                                                <a class=" arrow nav-link" onclick="sendKeyword(this.form)" style="font-family: 'suite'; font-weight: bold; color: #887e94; font-size: large; cursor: pointer;" ><i class="fa fa-arrow-left me-2" aria-hidden="true"></i>메뉴 추가하기</a>
                                            </div>    
                                            <img class="rounded" src="../main_images/cart_is_empty.png" style="object-fit: contain; width: 100%;" alt="장바구니가 비었습니다."/>
                                        </div>
                                    </div>
                                </div>
                            </c:when>

                            <c:otherwise>
                             <!-- map.count가 0이 아닐때, 즉 자료가 있을때 -->
                                <!-- form을 실행한다.  -->
                                <!-- form의 id를 form1로 하고, method 방식을 post로 한다. 그리고 update.do페이지로 이동시킨다. -->
                                <div class="container-fluid mb-4">
                                    <div class="row justify-content-center col-md-12 my-5">
                                        <div  class="col-md-6">
                                            <div class="mb-2 ms-2">
                                                <span style="font-family: 'suite'; font-size: large; font-weight: bold;">${RestNm}</span>
                                            </div>
                                            <div class="card shadow p-3 mb-5 bg-body rounded justify-content-between" style="border: none;">
                                                <div class="card-body">
                                            
                                                    <form name="frm" action="/orderpay" method="post">
                                                        <div class="row justify-content-start align-items-center">
                                                            <div class="col-6 mb-2 float-start text-start">
                                                                <a class=" arrow nav-link" onclick="sendKeyword(this.form)" style="font-family: 'suite'; font-weight: bold; color: #887e94; font-size: large; cursor: pointer;" ><i class="fa fa-arrow-left me-2" aria-hidden="true"></i>메뉴 추가하기</a>
                                                            </div>
                                                            <div class="col-6 text-end">
                                                                <button type="button" id="btnDelete" class="btn mb-3" onclick="senda(this.form)"><span class="me-2">비우기</span><i class="fa fa-undo fa-lg" aria-hidden="true"></i></button>
                                                            </div>
                                                        </div>
                                                        <div class=" row ">
                                                
                                                            <c:set var="sumPrice" value="0"/>
                                                            <c:set var="sumCount" value="0"/>
                                                            <c:set var="fee" value="0"/>
                                                            
                                                            <c:forEach var="pvo" items="${sessionScope.cart.list }" varStatus="st"> 
                                                                <input type="hidden" value="1" name="p_idx" />
                                                                <hr />
                                                                <div class="d-flex mb-3">
                                                                    <div class="d-flex col-md-12 align-items-center">    
                                                                        <div class="me-3 col-md-3" style ="min-width: 100px; height: 100px;">
                                                                            <img id="${pvo.seq}_img" style="object-fit: cover; width: 100%; height: 100%; background-color: rgb(240, 240, 240);" class="rounded "/> 
                                                                        </div>
                                                                        
                                                                        <div class="row col-md-9 ms-1">
                                                                            <div class="col-md-12 text-start">
                                                                                <span style="font-size: large; font-weight: bold;"> ${pvo.foodNm}</span>
                                                                                <br/>
                                                                                <span class="ps-2 text-muted">└ ${pvo.quantity}개</span>
                                                                            </div>
                                                                            <hr style="border: 1px dashed; color: #6600db;" class="my-3 px-3"/>
                                                                            <div class="text-end col-md-12 d-flex justify-content-end">
                                                                                <span class="me-2 text-muted" style="font-size: small; ">개당 <fmt:formatNumber value="${pvo.foodCost}" pattern="#,###,###" />원</span>
                                                                            </div>
                                                                            <div class="text-end col-md-12 d-flex justify-content-end">
                                                                                <span class="me-2 text-muted" style="font-size: large; font-weight: bold;"><fmt:formatNumber value="${pvo.totalPrice}" pattern="#,###,###" />원</span>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                
                                                                
                                                             <!-- <a href="${path}/shop/cart/delete.do?cart_id=${row.cart_id}">[삭제]</a>
                                                             삭제 버튼을 누르면 delete.do로 장바구니 개별 id (삭제하길원하는 장바구니 id)를 보내서 삭제한다. -->
                                                             <!--구현되어 있지 않음!-->
                                                            <c:set var="sumPrice" value="${sumPrice+pvo.totalPrice}"/>
                                                            <c:set var="sumCount" value="${sumCount+pvo.quantity}"/>
                                                            
                                                                
                                                            </c:forEach>
                                                        </div>
                                                        <div class="text-end">
                                                            <hr/>
                                                            
                                                            <span>총 <fmt:formatNumber value="${sumCount}" pattern="#,###,###" />개</span>
                                                            <br/>
                                                            <span style="font-weight: bold; font-size: large;"><span class="text-muted">합계</span> <fmt:formatNumber value="${sumPrice}" pattern="#,###,###" />원</span>
                                                            

                                                        </div>
                                                        <div class="justify-content-end text-end mt-5">
                                                            <!--btnUpdate와 btnDelete id는 위쪽에 있는 자바스크립트가 처리한다.-->
                                                            <a style="cursor: pointer; font-family: 'suite'; font-size: large; color: #6600db; font-weight: bold; " onclick="sendData(this.form)">결제하기 <i class="fa fa-credit-card fa-lg" aria-hidden="true"></i></a>    
                                                        </div>
                                                    </form>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </c:otherwise>
                        </c:choose>

                       </div>


                    
                        <!-- footer 시작---------------------------------------------------------------------------------------------->
                        <!-- <body class="d-flex flex-column"> -->
                        <footer id="sticky-footer"
                            class="flex-shrink-0 py-4 bg-dark text-white-50 mycustom-main_footer">
                            <div class="container text-center">
                                <small>Copyright &copy; 2023 마이휴 </small>
                            </div>
                        </footer>

                        
                        <form action="/orderpay" method="POST" name="frm2">
                            <input type="hidden" name="foodNm" value="${foodNm}">
                            <input type="hidden" name="foodCost" value="${foodCost}">
                            <input type="hidden" name="RestNm" value="${RestNm}">
                            <input type="hidden" name="totalPrice" value="${foodCost}">
                            <input type="hidden" name="quantity" value="1">
                            <input type="hidden" name="seq" value="${seq}">
                            
                        </form>
                        

                        <!-- </body>  -->
                        <!-- footer 끝---------------------------------------------------------------------------------------------->

                    
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
                $(document).ready(function() {
                    <c:forEach var="pvo" items="${sessionScope.cart.list }" varStatus="st"> 
                        var seq = "${pvo.seq}";
                        sendAjaxRequest(seq);
                        console.log(seq);
                    </c:forEach>  
                      

                    function sendAjaxRequest(seq){
                        $.ajax({
                            url:"/getFileName",
                            method: 'post',
                            data: {'seq': seq},
                            dataType: 'text'
                        }).done(function(data){
                            // var imageUrl = encodeURIComponent(data);
                            console.log(data+"/"+seq);
                            $("#" + seq + "_img").attr("src",data);
                        });

                    }

                
                })

                
                
                function sendData(frm) {
                   
                  
                        document.frm2.submit();
                    
               }


                function sendKeyword(form) {

                    var value = "${RestNm}";
                 

                    if (value != "") {
                        location.href = "/menu?RestNm=${RestNm}";
                    }else
                    location.href = "/lineSearchList";
                    
                }

            

           
               



                    $("#Lis").click(function () {
                        location.href = "${path}/shop/product/list.do";
                    });

                    $("#btnDelete").click(function () {
                        if (confirm("장바구니를 비우시겠습니까?")) {
                            location.href = "/cartout";
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