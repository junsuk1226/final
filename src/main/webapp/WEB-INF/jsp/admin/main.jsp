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
        <a href="/admin/main"><img style="max-width: 200px; margin-top: 20px; margin-bottom: 10px;" 
            src="../admin_images/myhyu_logo.png"></a>
        <hr> <!--구분선-->

        <ul class="nav nav-pills flex-column mb-auto">
        <li class="nav-item">
            <a href="#home" class="nav-link text-white active" data-bs-toggle="pill">
            홈
            </a>
        </li>
        <li>
            <a href="#menu" class="nav-link text-white" data-bs-toggle="pill">
            메뉴관리
            </a>
        </li>
        <li>
            <a href="#sales" class="nav-link text-white" data-bs-toggle="pill">
            매출관리
            </a>
        </li>
        </ul>

        <hr><!--구분선-->

        <div class="dropdown">
        <a href="#" class="d-flex align-items-center text-white text-decoration-none dropdown-toggle" id="dropdownUser1" data-bs-toggle="dropdown" aria-expanded="false">
            <img src="https://github.com/mdo.png" alt="" width="32" height="32" class="rounded-circle me-2">
            <strong>mdo</strong>
        </a>
        <ul class="dropdown-menu dropdown-menu-dark text-small shadow" aria-labelledby="dropdownUser1">
            <li><a class="dropdown-item" href="#">New project...</a></li>
            <li><a class="dropdown-item" href="#">Settings</a></li>
            <li><a class="dropdown-item" href="#">Profile</a></li>
            <li><hr class="dropdown-divider"></li>
            <li><a class="dropdown-item" href="#">Sign out</a></li>
        </ul>
        </div>
    </div>
    <!-- 사이드바 끝 -->

    <!-- 메인 컨텐츠 내용 -->
    <div class="d-flex flex-row flex-shrink-0 p-3 admin-main_area" style="width: calc(100% - 280px);">
        
        <div class="tab-content" style="width: 100%;">
            <div id="home" class="tab-pane fade show active">
                <h1>홈</h1>
            </div>
            <div id="menu" class="tab-pane fade">
                <div class="container">
                    <h1>휴게소명</h1>
                    <h4>메뉴수정</h4>
                </div>
            </div>
            <div id="sales" class="tab-pane fade">
                <h1>매출관리</h1>
            </div>
        </div>
        
    </div>
    <!-- 메인 컨텐츠 끝 -->
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"
    integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>

    <!-- 탭 클릭 시 선택된 탭을 저장하고 새로고침 시 해당 탭으로 이동하는 스크립트 -->
<script>
    $(document).ready(function(){
      // 선택된 탭의 인덱스를 localStorage에 저장
      $('.nav-link').on('click', function() {
        localStorage.setItem('selectedTab', $(this).attr('href'));
    
        // 선택된 탭의 부모 요소에 fade 클래스 제거
        $($(this).attr('href')).parent().removeClass('fade');
      });
    
      // 새로고침 시 localStorage에서 저장된 탭을 가져와 선택
      var selectedTab = localStorage.getItem('selectedTab');
      if (selectedTab) {
        $('a[href="' + selectedTab + '"]').tab('show');
      }
    });
    </script>

</body>
</html>