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
                <a href="/adminTotal/joinList" class="nav-link text-white active">
                가입신청 목록
                </a>
            </li>
            <li>
                <a href="/adminTotal/menuList" class="nav-link text-white">
                메뉴 관리
                </a>
            </li>
            </ul>

            <hr><!--구분선-->

            
            </div>
        </div>
        <!-- 사이드바 끝 -->

        <!-- 메인 컨텐츠 내용 -->
        <div class="d-flex flex-row flex-shrink-0 p-3 admin-main_area" style="width: calc(100% - 280px);">
            <div class="container" style="width:100%; margin: 0">
                <h1>가입신청 목록</h1>
                <br/>
                <form style="text-align: right;">
                    <input/>
                    <button>검색</button>
                </form>
                <div class="container">
                    <table class="table" style="text-align: center;">
                        
                        <thead>
                        <tr>
                            <th scope="col" style="width: 10px;"></th>
                            <th scope="col" style="width: 150px;">휴게소명</th>
                            <th scope="col" style="width: 200px;">요청아이디</th>
                            <th scope="col" style="width: 150px;">담당자 연락처</th>
                            <th scope="col" style="width: 150px;">가입신청일 <button class="arrow_btn"><i class="bi bi-arrow-down-up"></i></button></th>
                            <th scope="col" style="width: 60px;"></th>
                            <th scope="col" style="width: 60px;"></th>
                            <th scope="col" style="width: 10px;"></th>
                        </tr>
                        </thead>
                        <tbody>

                        <c:forEach var="mvo" items="${ar}">
                            <tr>
                                <th scope="row"></th>
                                <td>${mvo.m_name}</td>
                                <td>${mvo.m_id}</td>
                                <td>${mvo.m_phone}</td>
                                <td>${mvo.m_joinDate}</td>
                                <td ><button style="width: 100%;" onclick="approveUser('${mvo.m_id}')">승인</button></td>
                                <td><button style="width: 100%;">거절</button></td>
                                <td></td>
                            </tr>
                        </c:forEach>
                        
                        </tbody>

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
   function approveUser(m_id) {
  
    // Ajax 요청 보내기
    $.ajax({
        url: '/adminTotal/approval',
        type: 'POST',
        data: {"m_id": m_id},
        success: function(response) {
            // 요청이 성공적으로 완료됨
            console.log("승인이 완료되었습니다.");
            location.reload();
        },
        error: function(xhr, status, error) {
        // 요청이 실패함
        console.error("승인 요청에 실패했습니다.");
        }
    });
}
</script>

</body>
</html>