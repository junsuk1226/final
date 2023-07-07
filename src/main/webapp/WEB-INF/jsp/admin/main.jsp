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

</head>
<body>

    <div class="d-flex flex-row flex-shrink-0">
        <!-- 사이드 바 -->
        <div class="d-flex flex-column flex-shrink-0 p-3 text-white bg-dark admin-sidebar" style="width: 280px;">
            <a href="/admin/main"><img style="max-width: 250px;" 
                src="../admin_images/admin_logo.png"></a>
            <hr> <!--구분선-->

            <ul class="nav nav-pills flex-column mb-auto">
            <li class="nav-item">
                <a href="/admin/main" class="nav-link text-white active">
                홈
                </a>
            </li>
            <li>
                <a href="/admin/menu" class="nav-link text-white">
                메뉴관리
                </a>
            </li>
            <li>
                <a href="/admin/sales" class="nav-link text-white">
                매출관리
                </a>
            </li>
            <li>
                <a href="/admin/review" class="nav-link text-white">
                리뷰관리
                </a>
            </li>
            </ul>

            <hr><!--구분선-->

            
            </div>
        </div>
        <!-- 사이드바 끝 -->

        <!-- 메인 컨텐츠 내용 -->
        <div class="d-flex flex-row flex-shrink-0 p-3 admin-main_area" style="width: calc(100% - 280px);">
            
            <div class="container-fluid">
                <div class="row justify-content-center mt-5">
                    <div class="col-md-11 mb-3 text-start">
                        <div class="">
                            <img src="" >   
                            
                        </div>
                        <h2 class=" lh-base mt-5 ms-1" style="font-family: 'suite'">
                                ${sessionScope.mvo.m_name}<span class="text-muted"></span>
                        </h2>
                    </div>
                </div>
                <div>
                    <c:forEach var="cnt" items="${foodOfMonth}">
                        <c:if test="${cnt ne null }" >   
                            ${cnt.foodNm} ${cnt.cnt}회 판매
                        </c:if>
                        <c:if test="${cnt eq null}">
                            값이 없음
                        </c:if>
                    </c:forEach>
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