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
<!--아이콘 cdn-->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">
<style>

    .intro {
        height: 100%;
      }
      
     th{
        height: 50px;
        font-family: 'jamsil_bold';
        vertical-align: middle;
     }
     td{
        font-family: 'suite';
        vertical-align: middle;
     }

      tr {
        border: 1px solid #e4e4e4;
        z-index:7;
      }
      td {
        text-align:center;
        padding: 20px;
        transition: all 0.3s ease-in-out;
      }
      td.highlight {
        padding:0;
        width:4px;
      }
      td.highlight div {
        width:4px;
        height:60px;
        border-radius:4px;
        background-color: white;
        transition: all 0.3s ease-in-out;
      }

       tr:hover td{
         cursor:pointer;
         color:#00A674;
         font-weight: bolder;
       }
      
      table td,
      table th {
        text-overflow: ellipsis;
        white-space: nowrap;
        overflow: hidden;
      }

      
      thead {
        top: 0;
        position: sticky;
      }
</style>
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
            <a href="/admin/orderlist" class="nav-link text-white">
            주문내역 관리
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

        <div class="col-md-12 d-grid ">
            <button type="button " class="btn btn-success me-2 mycustom-mem-btn" onclick="location.href='/admin/logout'">로그 아웃<i class="fa fa-sign-out ms-2 fa-lg" aria-hidden="true"></i></button>
        </div>

        <hr><!--구분선-->

        
        </div>
    </div>
    <!-- 사이드바 끝 -->

    <!-- 메인 컨텐츠 내용 -->
    <div class="d-flex flex-row flex-shrink-0 p-3 admin-main_area" style="width: calc(100% - 280px);">
        <div class="container-fluid">
            <div class="row justify-content-center mt-5">
                <div class="col-md-10 mb-3 text-start">
                        <h2 class=" lh-base mt-5 ms-1" style="font-family: 'jamsil'">
                            ${sessionScope.mvo.m_name}<span class="text-muted"> 메뉴 관리</span>
                        </h2>
                </div>
            </div>

            <div class="row justify-content-center my-5 " >
                <div class="col-md-7">
                    <div class=" shadow rounded" style="border: none;">
                            <div class="" >
                                <table class="table table-rounded">
                                    <thead style=" border-top-left-radius: 10px;border-top-right-radius: 10px;">
                                      <tr style="background-color: #3f3f3f; color:white; text-align: center; ">
                                        <th scope="col" >번호</th>
                                        <th scope="col" style="width: 200px;">이미지</th>
                                        <th scope="col">메뉴</th>
                                        <th scope="col">가격</th>
                                        <th scope="col">등록상태</th>
                                        <th scope="col"></th>
                                      </tr>
                                    </thead>
                                    <tbody>
                                        <c:if test="${fvo eq null }">
                                            <tr class="justify-content-center" >
                                                <td colspan="5" class="p-5" style="font-size: large;"><i class="fa fa-exclamation-circle me-2 fa-lg" aria-hidden="true"></i>메뉴가 없습니다.</td>
                                            </tr>
                                        </c:if>
                                        <c:forEach var="vo" items="${fvo}">
                                      <tr>
                                        <td scope="row" style="vertical-align: top;"><span class="text-muted" style="font-family: suite;">${vo.f_idx}</span></td>
                                        <c:if test="${vo.f_image != null and not empty vo.f_image}">
                                            <td> <img src="${vo.f_image}" style="width:180px; height: 80px; object-fit: cover;"class="rounded"></td>
                                        </c:if>
                                        <c:if test="${vo.f_image == null and empty vo.f_image}">
                                            <td> <img src="../main_images/no_image.png" style="width:180px; height: 80px; object-fit: cover;"class="rounded"></td>
                                        </c:if>
                                        <td style="font-size: larger;">${vo.foodNm}</td>
                                        <fmt:formatNumber var="foodCost" type='number' maxFractionDigits='3' value='${vo.foodCost}' />
                                        <td >${foodCost}원</td>
                                        <c:if test="${vo.f_status == 0}">
                                            <td>판매중</td>
                                        </c:if>
                                        <c:if test="${vo.f_status == 1}">
                                            <td>품 절</td>
                                        </c:if>
                                        <td style="width: 50px;" class="button-cell">
                                            <a class="me-5 btn btn-success" style="display: none;  text-decoration: none; font-family: jamsil;" href="/admin/menuEdit?f_idx=${vo.f_idx}">
                                                <i class="fa fa-pencil me-2" aria-hidden="true"></i>수정
                                            </a>
                                        </td>
                                    
                                      </tr>
                                    </c:forEach>
                                    </tbody>
                                  </table>
                            
                            </div>
                       
                    </div>
                </div>
                <div class="col-md-3 banner" >
                    <div id="chase" style="min-width: 230px; max-width: 230px;">
                        <div class="bg-dark card mb-5 shadow" >
                            <div class="card-body justify-content-center text-center">
                                <a class="btn" style="font-family: jamsil; font-size: larger; color: #e4e4e4;" href="/admin/menuAdd" >메뉴 신청하기</a>
                            </div>
                        </div>
                        <div class="card shadow mb-3" style="border: none;">
                            <div class="card-body p-4">
                                <h6 class="card-title ms-2"style="font-family:jamsil;">판매중인 메뉴</h6>
                                <div class="text-end me-5">
                                    <h3 style="color: #00A674; font-weight: bold;">${zero}</h3>
                                </div>
                                <hr/>
                                <h6 class="card-title ms-2"style="font-family:jamsil;">품절 메뉴</h6>
                                <div class="text-end me-5">
                                    <h3 style="color: #00A674; font-weight: bold;">${one}</h3>
                                </div>

                            </div>
                        </div>
                        <div class="bg-success card mb-5 shadow" >
                            <div class="card-body justify-content-center text-center">
                                <a href="http://localhost:8080/menu?RestNm=${sessionScope.mvo.m_name}" style="text-decoration: none; font-family: jamsil; color: #fff;">휴게소 페이지로 이동<i class="ms-2 fa fa-external-link-square" aria-hidden="true"></i></a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div> 

    </div><!--본문 div의 끝-->



    <!-- 메인 컨텐츠 끝 -->

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"
    integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>

    
<script>
    $(window).scroll(function(event){
        if(jQuery(window).scrollTop() > jQuery(".banner").offset().top) { 
            jQuery("#chase").css("position", "fixed");
        }
        else if((jQuery(window).scrollTop() < jQuery(".banner").offset().top)) { 
            jQuery("#chase").css("position", "static");
        }
    });

    // 모든 버튼 요소를 가져옵니다.
    const buttons = document.querySelectorAll('.button-cell a');

    // 각 tr 요소에 호버 이벤트 리스너를 추가합니다.
    const tableRows = document.querySelectorAll('tbody tr');
    tableRows.forEach((row, index) => {
    row.addEventListener('mouseover', () => {
        // 해당하는 버튼을 보입니다.
        buttons[index].style.display = 'inline-block';
    });

    row.addEventListener('mouseout', () => {
        // 해당하는 버튼을 숨깁니다.
        buttons[index].style.display = 'none';
    });
});
</script>

</body>
</html>