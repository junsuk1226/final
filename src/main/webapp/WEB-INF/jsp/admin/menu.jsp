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
            <a href="/admin/main" class="nav-link text-white">
            홈
            </a>
        </li>
        <li>
            <a href="/admin/menu" class="nav-link text-white active">
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
        
        <table class="table table-striped">
            <thead>
              <tr>
                <th scope="col">번호</th>
                <th scope="col">음식사진</th>
                <th scope="col">음식명</th>
                <th scope="col">음식가격</th>
                <th scope="col">등록상태</th>
                <th scope="col"><a class="btn btn-dark" style="width:60px" href="/admin/menuAdd">신청</a></th>
              </tr>
            </thead>
            <tbody>
                <c:forEach var="vo" items="${fvo}">
              <tr>
                <th scope="row">${vo.f_idx}</th>
                <td> <img src="${vo.f_image}" style="width:80px; height: 60px;"></td>
                <td>${vo.foodNm}</td>
                <td>${vo.foodCost}</td>
                <c:if test="${vo.f_status == 0}">
                    <td>판매중</td>
                </c:if>
                <c:if test="${vo.f_status == 1}">
                    <td>품 절</td>
                </c:if>
                <td style="width: 50px;"><a class="btn btn-dark" style="width:60px" href="/admin/menuEdit?f_idx=${vo.f_idx}">수정</a></td>
              
              </tr>
            </c:forEach>
            </tbody>
          </table>
        
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