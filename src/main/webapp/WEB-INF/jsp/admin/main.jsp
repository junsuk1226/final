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
                    <div class="col-md-10 mb-5 text-start d-flex align-items-center">
                        <div style="width: 100px; height: 100px;" class="me-4">
                          <img src="../images/경부선0010-19-000003.jpg" class="rounded-circle" style="object-fit: cover; width: 100%; height: 100%;">
                        </div>
                        <div class="d-flex flex-column justify-content-center" style="width: auto;">
                          <h2 class="lh-base ms-1 text-center" style="font-family: 'suite';">죽전(서울)휴게소${sessionScope.mvo.m_name}</h2>
                        </div>
                    </div>  
                    <div class = "card col-md-10 shadow rounded p-3 " style="border: none;">
                        <div class = "card-body">
                            <div>
                                <span>이번 달 매출</span>
                            </div>
                        </div> 
                    </div>
                </div>



                <!-- <div>
                    <c:forEach var="cnt" items="${foodOfMonth}">
                        <c:if test="${cnt ne null }" > 
                            <div class="" style="width: 100px; height: 100px;">
                                <img class="rounded" id="${cnt.seq}_img" style="object-fit: cover; width: 100%; height: 100%;"/>
                            </div>  
                            이번 달 ${cnt.foodNm} ${cnt.cnt}회 판매
                        </c:if>
                        <c:if test="${cnt eq null}">
                            값이 없음
                        </c:if>
                    </c:forEach>
                </div>
                <hr/>
                <div>
                    이번달매출 ${thisMonthTotal}
                    <br/>
                    <c:forEach var="total" items="${yearMonthTotal}">
                        <c:set var="year" value="${total.key}" />
                        <c:if test="${year == 2023}">
                            <h2>${year}년 매출 정보</h2>
                            <c:forEach var="monthSale" items="${total.value}">
                                ${monthSale.month}월
                                ${monthSale.monthTotal}
                            </c:forEach>
                        </c:if>
                    </c:forEach>
                </div>
                <div>
                    최근 리뷰
                        <c:forEach var="re" items="${recentReview}">
                            <img class="rounded" src="../editor_upload/${re.r_file}" style="object-fit: cover; width: 100%; height: 100%;">
                            ${re.r_writedate}/${re.r_content}
                        </c:forEach>
                </div>

 -->







            
        </div>
        <!-- 메인 컨텐츠 끝 -->
    </div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"
    integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>

<script>
    
     //파일이름을 비동기식으로 가져오기
     $(document).ready(function() {
         
         <c:forEach var="cnt" items="${foodOfMonth}">
             var seq = "${cnt.seq}";
             sendAjaxRequest(seq);
         </c:forEach>
         function sendAjaxRequest(seq){
             $.ajax({
                 url:"/getFileName",
                 method: 'post',
                 data: {'seq': seq},
                 dataType: 'text'
             }).done(function(data){
                 $("#" + seq + "_img").attr("src",data);
             });
         }
     
     })


</script>

</body>
</html>