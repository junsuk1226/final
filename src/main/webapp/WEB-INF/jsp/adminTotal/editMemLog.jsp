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
                <a href="/adminTotal/editMemLog" class="nav-link text-white">
                가입 승인 내역
                </a>
            </li>
            <li>
                <a href="/adminTotal/editMem" class="nav-link text-white">
                회원정보 수정(고객)
                </a>
            </li>
            <li>
                <a href="/adminTotal/editMemLog" class="nav-link text-white active">
                일반회원 수정내역
                </a>
            </li>
            <li>
                <a href="/adminTotal/menuList" class="nav-link text-white">
                메뉴 관리
                </a>
            </li>
            <li>
                <a href="/adminTotal/review" class="nav-link text-white">
                리뷰 관리
                </a>
            </li>
            <li>
                <a href="/adminTotal/mail" class="nav-link text-white">
                받은 메일
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
                <h1>회원정보 수정내역</h1>
                <br/>
                
                <div class="container">
                    <table class="table mycustomtable" style="text-align: center;">
                        <form action="/adminTotal/editMemLog" method="post">
                            <select class="search_select" name="searchType">
                                <option value="0">닉네임</option>
                                <option value="1">아이디</option>
                            </select>&nbsp;
                            <input name="searchValue">&nbsp;
                            <button type="button" class="search_btn" onclick="sendData(this.form)">검색</button>
                        </form>
                        <thead>
                        <tr class="table_head">
                            <th scope="col" style="width: 10px;"></th>
                            <th scope="col" style="width: 150px;">닉네임</th>
                            <th scope="col" style="width: 200px;">아이디</th>
                            <th scope="col" style="width: 150px;">연락처</th>
                            <th scope="col" style="width: 100px;">가입상태</th>
                            <th scope="col" style="width: 100px;">수정일</th>
                            <th scope="col" style="width: 100px;">수정인</th>
                            
                            <th scope="col" style="width: 10px;"></th>
                        </tr>
                        </thead>
                        <tbody>

                        <c:forEach var="mvo" items="${ar}">
                            <tr class="mytr">
                                <th scope="row"></th>
                                <td>${mvo.m_name}</td>
                                <td>${mvo.m_id}</td>
                                <td>${mvo.m_phone}</td>

                                <c:if test="${mvo.m_status == 0}">
                                    <td>정회원</td>
                                </c:if>
                                <c:if test="${mvo.m_status == 4}">
                                    <td>탈퇴회원</td>
                                </c:if>

                                <td>${mvo.m_editDate}</td>

                                <c:if test="${mvo.editor == 'A'}">
                                    <td>관리자</td>
                                </c:if>
                                <c:if test="${mvo.editor == 'M'}">
                                    <td>회원</td>
                                </c:if>


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
                                                        href="/adminTotal/editMemLog?cPage=${page.startPage-page.pagePerBlock }<c:if test='${searchType != null}'>&searchType=${searchType}</c:if><c:if test='${searchValue != null}'>&searchValue=${searchValue}</c:if>">&lt;</a></li>
                                            </c:if>
                                            <c:forEach begin="${page.startPage }" end="${page.endPage }" varStatus="st">
                                                <c:if test="${page.nowPage eq st.index}">
                                                    <li class="page-item active"><a class="page-link">${st.index}</a></li>
                                                </c:if>
                                                <c:if test="${page.nowPage ne st.index }">
                                                    <li class="page-item"><a class="page-link" href="/adminTotal/editMemLog?cPage=${st.index}<c:if test='${searchType != null}'>&searchType=${searchType}</c:if><c:if test='${searchValue != null}'>&searchValue=${searchValue}</c:if>">${st.index }</a>
                                                    </li>
                                                </c:if>
                                            </c:forEach>
                                            <c:if test="${page.endPage<page.totalPage}">
                                                <li class="page-item"><a class="page-link"
                                                        href="/adminTotal/editMemLog?cPage=${page.startPage+page.pagePerBlock }<c:if test='${searchType != null}'>&searchType=${searchType}</c:if><c:if test='${searchValue != null}'>&searchValue=${searchValue}</c:if>">&gt;</a></li>
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

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"
    integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>

<script>
   
</script>

</body>
</html>