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
                <a href="/adminTotal/menuList" class="nav-link text-white">
                메뉴 관리
                </a>
            </li>
            <li>
                <a href="/adminTotal/review" class="nav-link text-white active">
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
                <h1>리뷰 수정</h1>
                <hr>
                
                <div class="container" style="width:100%;">
                    <table class="table mycustomtable" style="text-align: center;">
                        
                        <thead>
                        <tr class="table_head" style="width: 100%;">
                            <th scope="col" style="width: 10px;"></th>
                            <th scope="col" style="width: 60px;">주문번호</th>
                            <th scope="col" style="width: 150px;">리뷰사진</th>
                            <th scope="col" style="width: 200px;">리뷰</th>
                            <th scope="col" style="width: 150px;">작성자</th>
                            <th scope="col" style="width: 60px;">리뷰점수</th>
                            <th scope="col" style="width: 150px;">등록일</th>
                            <th scope="col" style="width: 60px;"></th>
                            <th scope="col" style="width: 10px;"></th>
                        </tr>
                        </thead>
                        <tbody>

                        <c:forEach var="rvo" items="${ar}">
                            <tr class="mytr">
                                <th scope="row"></th>
                                <td class="align-middle">${rvo.p_oNum}</td>
                                <td class="align-middle"><img style="width: 100%;" src='../editor_upload/${rvo.r_file}'></td>
                                <td class="align-middle">${rvo.r_content}</td>
                                <td class="align-middle">${rvo.m_name}</td>
                                <td class="align-middle">${rvo.r_score}</td>
                                <td class="align-middle">${rvo.r_writedate}</td>
                                <td ><button class="no_btn" style="width: 100%;" onclick="">삭제</button></td>
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


    function refuseUser(m_id) {
        // Ajax 요청 보내기
        $.ajax({
            url: '/adminTotal/refuse',
            type: 'POST',
            data: {"m_id": m_id},
            success: function(response) {
                // 요청이 성공적으로 완료됨
                console.log("승인거절이 완료되었습니다.");
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