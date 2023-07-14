<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>내 손안에 휴게소, 마이휴 어드민</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.3/font/bootstrap-icons.css">
<link rel="stylesheet" href="../css/admin.css" />
<link rel="stylesheet" href="../css/adminTotal.css" />

</head>
<body>

    <div class="d-flex flex-row flex-shrink-0">
        <!-- 사이드 바 -->
        <div class="d-flex flex-column flex-shrink-0 p-3 text-white bg-dark admin-sidebar" style="width: 280px;">
            <a href="/adminTotal/main"><img style="max-width: 250px;" 
                src="../admin_images/admin_logo.png"></a>
            <hr> <!--구분선-->

            <ul class="nav nav-pills flex-column mb-auto">
            <li class="nav-item">
                <a href="/adminTotal/main" class="nav-link text-white">
                홈
                </a>
            </li>
            <li>
                <a href="/adminTotal/joinList" class="nav-link text-white">
                가입신청 목록
                </a>
            </li>
            <li>
                <a href="/adminTotal/adminEditLog" class="nav-link text-white">
                    가입 승인 내역
                </a>
            </li>
            <li>
                <a href="/adminTotal/editMem" class="nav-link text-white">
                회원정보 수정(고객)
                </a>
            </li>
            <li>
                <a href="/adminTotal/editMemLog" class="nav-link text-white">
                일반회원 수정내역
                </a>
            </li>
            <li>
                <a href="/adminTotal/menuList" class="nav-link text-white active">
                메뉴 관리
                </a>
            </li>
            <li>
                <a href="/adminTotal/review" class="nav-link text-white">
                리뷰 관리
                </a>
            </li>
            </ul>

            <hr><!--구분선-->

            
            </div>
        </div>
        <!-- 사이드바 끝 -->

        <!-- 메인 컨텐츠 내용 -->
        <div class="d-flex flex-row flex-shrink-0 p-5 admin-main_area" style="width: calc(100% - 280px);">
            <div class="container adminTotal-tablearea" style="width:100%; margin: 0">
                <h1>메뉴관리 수정내역</h1>
                <br/>
                
                <div class="container">
                    <table class="table mycustomtable" style="text-align: center;">
                        <form>
                            <select style="padding: 4px;">
                                <option value="0">메뉴명</option>
                                <option value="1">휴게소명</option>
                                <option value="2">재료</option>
                            </select>&nbsp;
                            <input>
                        </form>
                        <thead>
                        <tr class="table_head">
                            <th scope="col" style="width: 10px;"></th>
                            <th scope="col" style="width: 150px;">이미지</th>
                            <th scope="col" style="width: 100px;">메뉴명</th>
                            <th scope="col" style="width: 250px;">재료</th>
                            <th scope="col" style="width: 100px;">휴게소명</th>
                            <th scope="col" style="width: 100px;">상태</th>
                            <th scope="col" style="width: 100px;">비고</th>
                            
                            <th scope="col" style="width: 10px;"></th>
                        </tr>
                        </thead>
                        <tbody>

                        <c:forEach var="fvo" items="${ar}">
                            <tr class="mytr" onclick="viewMenu('${fvo.f_idx}')" style="cursor: pointer;">
                                <th scope="row"></th>
                                <td>
                                    <c:if test="${fvo.f_image != null}">
                                        <img src="${fvo.f_image}" width="100px" style="background-size: cover; height: 70px"/>
                                    </c:if>
                                </td>
                                <td>${fvo.foodNm}</td>
                                <td>${fvo.foodMaterial}</td>
                                <td>${fvo.stdRestNm}</td>
                                <td>
                                    <c:if test="${fvo.f_status == '3'}">
                                        대기
                                    </c:if>
                                    <c:if test="${fvo.f_status == '0'}">
                                        승인
                                    </c:if>
                                </td>
                                <td></td>
                                <td></td>
                            </tr>
                        </c:forEach>                        
                        </tbody>
                        <tfoot>
                            <tr>
                                <td colspan="8">
                                    <!-- 페이징------------------------------------------------------------------------------------------------------------->
                                    <div class="card-body justify-content-center" style="margin:0 auto">
                                        <c:if test="${ar ne null }">
                                        <ol class="pagination">
                                            <c:if test="${page.startPage < page.pagePerBlock}">
                                                <li class="page-item disabled"><a class="page-link">&lt;</a></li>
                                            </c:if>
                                            <c:if test="${page.startPage >= page.pagePerBlock}">
                                                <li class="page-item"><a class="page-link"
                                                        href="/adminTotal/menuList?cPage=${page.startPage-page.pagePerBlock }<c:if test='${searchType != null}'>&searchType=${searchType}</c:if><c:if test='${searchValue != null}'>&searchValue=${searchValue}</c:if>">&lt;</a></li>
                                            </c:if>
                                            <c:forEach begin="${page.startPage }" end="${page.endPage }" varStatus="st">
                                                <c:if test="${page.nowPage eq st.index}">
                                                    <li class="page-item active"><a class="page-link">${st.index}</a></li>
                                                </c:if>
                                                <c:if test="${page.nowPage ne st.index }">
                                                    <li class="page-item"><a class="page-link" href="/adminTotal/menuList?cPage=${st.index}<c:if test='${searchType != null}'>&searchType=${searchType}</c:if><c:if test='${searchValue != null}'>&searchValue=${searchValue}</c:if>">${st.index }</a>
                                                    </li>
                                                </c:if>
                                            </c:forEach>
                                            <c:if test="${page.endPage<page.totalPage}">
                                                <li class="page-item"><a class="page-link"
                                                        href="/adminTotal/menuList?cPage=${page.startPage+page.pagePerBlock }<c:if test='${searchType != null}'>&searchType=${searchType}</c:if><c:if test='${searchValue != null}'>&searchValue=${searchValue}</c:if>">&gt;</a></li>
                                            </c:if>
                                            <c:if test="${page.endPage == page.totalPage}">
                                                <li class="page-item disabled"><a class="page-link">&gt;</a></li>
                                            </c:if>
                                        </ol>
                                        </c:if>
                                    </div>
                                    
                                    <!-- 페이징끝---------------------------------------------------------------------------------------------------------->
                                </td>
                            </tr>
                        </tfoot>

                    </table>
                </div>
            </div>
            
        </div>
        <!-- 메인 컨텐츠 끝 -->
    </div>

    <form name="ff" action="/adminTotal/viewMenu" method="post">
        <input type="hidden" name="f_idx"/>
        <input type="hidden" name="cPage" value="${nowPage}"/>
        <c:if test='${searchType != null}'>
            <input type="hidden" name="searchType" value="${searchType}"/>
        </c:if>
        <c:if test='${searchValue != null}'>
            <input type="hidden" name="searchValue" value="${searchValue}"/>
        </c:if>
    </form>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"
    integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>

<script>
   function viewMenu(f_idx){
        document.ff.f_idx.value = f_idx;

        document.ff.submit();
   }
</script>

</body>
</html>