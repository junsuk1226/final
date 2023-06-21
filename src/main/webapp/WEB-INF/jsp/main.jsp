<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<link rel="stylesheet" href="../css/main_custom.css" />
</head>
<body>
    <!-- 메뉴바 ----------------------------------------------------------------------------------------------------------->
    <div class="container main_custom_menubar">
        <header class="d-flex flex-wrap align-items-center justify-content-md-between py-3 mb-3">
            <a class="nav-link logo_custom">내 손안에 휴게소</a>
            <c:if test="${sessionScope.mvo == null}">
                <div class="col-md-3 text-end">
                    <button type="button" class="btn btn-outline-success me-2 mycustom-mem-btn" onclick="location.href='login'">로그인</button>
                    <button type="button" class="btn btn-outline-success mycustom-mem-btn" onclick="location.href='join'">회원가입</button>
                </div>
            </c:if>
        </header>
    </div>
    <!-- 메뉴바끝 ----------------------------------------------------------------------------------------------------------->

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
</body>
</html>
