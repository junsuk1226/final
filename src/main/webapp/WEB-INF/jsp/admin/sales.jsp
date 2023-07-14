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
<link rel="stylesheet" href="//code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
<link rel="stylesheet" href="/resources/demos/style.css">
<!--아이콘 cdn-->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">
<style>
    th{
        height: 50px;
        font-family: 'jamsil_bold';
        vertical-align: middle;
     }
      td{
        font-family: 'suite';
        vertical-align: middle;
     }

     .pagination .page-item.active .page-link { 
        background-color: #00A674;
        color: white;
        border-color: #00A674;
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
            <a href="/admin/menu" class="nav-link text-white">
            메뉴관리
            </a>
        </li>
        <li>
            <a href="/admin/orderlist" class="nav-link text-white">
            주문내역 관리
            </a>
        </li>
        <li>
            <a href="/admin/sales" class="nav-link text-white active">
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
                            ${sessionScope.mvo.m_name}<span class="text-muted"> 매출 관리</span>
                        </h2>
                </div>
            </div>

    <div class="row justify-content-center mt-5 mb-3">
        <div class="col-md-10">
            <div class="row d-flex justify-content-between mb-3">
                <div class="col-md-4 d-flex">
                    <form action="/admin/sales" method="get">
                        <div class="d-flex input-group" style="font-family: suite;">
                            <i class="fa fa-calendar fa-lg me-2 pt-2" style="color: #00A674; font-size: xx-large; " aria-hidden="true"></i>
                            <input type="text" class="form-control" id="datepicker" name="date" >
                            <button type="button" class="btn btn-success" onclick="exe(this.form)" style="font-family: jamsil;">검색</button>
                        </div>
                    </form>
                </div>
                <div class="col-md-5 justify-content-end">
                    <div class="text-end">
                        <form action="/admin/sales" method="get">
                            <select class="form-select pt-1" aria-label="Default select example" name="getMonth" id="monthSelect" style="width:80px; display:inline"></select>
                            <input type="submit" class="btn btn-success" style="font-family: jamsil;" value="검색">
                        </form>
                    </div>
                </div>
            </div>

               
            
                    <div class=" shadow rounded" style="border: none;">
                            <div class="justify-content-center" >
                                <table class="table table-rounded">
                                    <thead>
                                      <tr style="background-color: #3f3f3f; color:white; text-align: center;">
                                        <th scope="col">주문번호</th>
                                        <th scope="col">메뉴</th>
                                        <th scope="col">결제 금액</th>
                                        <th scope="col">결제 날짜/시간</th>

                                      </tr>
                                    </thead>
                                    <tbody  style="text-align: center;">
                                        <c:if test="${pvo eq null }">
                                            <tr class=" justify-content-center" >
                                                <td colspan="5" class="p-5" style="font-size: large;"><i class="fa fa-exclamation-circle me-2 fa-lg" aria-hidden="true"></i>매출이 없습니다.</td>
                                            </tr>
                                        </c:if>
                                        <c:forEach var="vo" items="${pvo}">
                                      <tr>
                                        <th scope="row">${vo.p_oNum}</th>
                                        <td>${vo.foodNm}</td>
                                        <fmt:formatNumber var="totalCost" type='number' maxFractionDigits='3' value='${vo.totalCost}' />
                                        <td>${totalCost}원</td>
                                        <td>${vo.p_date}/${vo.p_time}</td>
                                    
                                      </tr>
                                      <c:set var="totalSales" value="${totalSales + vo.totalCost}" /> <!-- 총 매출 누적 계산 -->
                                    </c:forEach>
                                    </tbody>
                                  </table>
                            
                            </div>
                       
                    </div>
                </div>
                

                <div class="container-fluid">
                    <div class="row  justify-content-center">
                        <div class="col-md-10 d-flex">
                            <div class="col-md-4">
                                <div class="card shadow col-md-8" style="border: none;">
                                    <div class="card-body text-center">
                                        <fmt:formatNumber var="formattedTotalSales" type='number' maxFractionDigits='3' value='${searchTotal}' />
                                        <span style="font-family: jamsil;"><p class="text-muted">총 매출</p><hr/> ${formattedTotalSales} 원</span>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-4 mt-3">
                                <c:if test="${date eq null}">                                       
                                    <ol class="pagination justify-content-center">
                                    <c:if test="${page.startPage < page.pagePerBlock}">
                                        <li class="page-item disabled"><a class="page-link">&lt;</a></li>
                                    </c:if>
                                    <c:if test="${page.startPage >= page.pagePerBlock}">
                                        <li class="page-item"><a class="page-link"
                                                href="/admin/sales?cPage=${page.startPage-page.pagePerBlock} <c:if test='${getMonth != null}'>&getMonth=${getMonth}</c:if><c:if test='${date != null}'>&date=${date}</c:if>">&lt;</a></li>
                                    </c:if>
                                    <c:forEach begin="${page.startPage }" end="${page.endPage }" varStatus="st">
                                        <c:if test="${page.nowPage eq st.index}">
                                            <li class="page-item active"><a class="page-link">${st.index}</a></li>
                                        </c:if>
                                        <c:if test="${page.nowPage ne st.index }">
                                            <li class="page-item"><a class="page-link" href="/admin/sales?cPage=${st.index}<c:if test='${getMonth != null}'>&getMonth=${getMonth}</c:if><c:if test='${date != null}'>&date=${date}</c:if>">${st.index }</a>
                                            </li>
                                        </c:if>
                                    </c:forEach>
                                    <c:if test="${page.endPage<page.totalPage}">
                                        <li class="page-item"><a class="page-link"
                                                href="/admin/sales?cPage=${page.startPage+page.pagePerBlock }<c:if test='${getMonth != null}'>&getMonth=${getMonth}</c:if><c:if test='${date != null}'>&date=${date}</c:if>">&gt;</a></li>
                                    </c:if>
                                    <c:if test="${page.endPage == page.totalPage}">
                                        <li class="page-item disabled"><a class="page-link">&gt;</a></li>
                                    </c:if>
                                </ol>
                            </c:if>
                        </div>
                        </div>
                    </div>
                </div>

                    </div>
                    
                    </div>

    </div><!--본문 div의 끝-->


<<script type="text/javascript" src="js/bootstrap.js"></script>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"
    integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
    <script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>


    
<script>
    $(function() {
        let date = "${date}";

        //input을 datepicker로 선언
        $("#datepicker").datepicker({
            dateFormat: 'yy-mm-dd' //달력 날짜 형태
            ,showOtherMonths: true //빈 공간에 현재월의 앞뒤월의 날짜를 표시
            ,showMonthAfterYear:true // 월- 년 순서가아닌 년도 - 월 순서
            ,changeYear: true //option값 년 선택 가능
            ,changeMonth: true //option값  월 선택 가능      
            ,yearSuffix: "년" //달력의 년도 부분 뒤 텍스트
            ,monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'] //달력의 월 부분 텍스트
            ,monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'] //달력의 월 부분 Tooltip
            ,dayNamesMin: ['일','월','화','수','목','금','토'] //달력의 요일 텍스트
            ,dayNames: ['일요일','월요일','화요일','수요일','목요일','금요일','토요일'] //달력의 요일 Tooltip
            ,minDate: "-5Y" //최소 선택일자(-1D:하루전, -1M:한달전, -1Y:일년전)
            ,maxDate: "+5y" //최대 선택일자(+1D:하루후, -1M:한달후, -1Y:일년후)  
        });                    
        
        //초기값을 오늘 날짜로 설정해줘야 합니다.
        $('#datepicker').datepicker('setDate', 'today'); //(-1D:하루전, -1M:한달전, -1Y:일년전), (+1D:하루후, -1M:한달후, -1Y:일년후)            
     
       
         // 페이지 로드 시 선택한 날짜 설정
         if (date) {
            $('#datepicker').datepicker('setDate', date);

        }
    });
    
    function exe(frm){
        frm.submit();
    }

    var monthSelect = document.getElementById('monthSelect');
    var currentMonth = new Date().getMonth() + 1; // 현재 월 가져오기 (1부터 시작)
    var month = "${getMonth}";
    for (var i = 1; i <= 12; i++) {
        var option = document.createElement('option');
        option.value = i.toString().padStart(2, '0'); // 두 자리 숫자로 만들기 (01, 02, ..., 12)
        option.text = i + '월';

        if (i === currentMonth) {
            option.selected = true; // 현재 월 선택하기
        } 

        monthSelect.appendChild(option);
    }

    // 페이지 로드 시 선택한 월 설정
    window.onload = function() {
 
        if (month) {
            monthSelect.value = month;
        }
    };



</script>

</body>
</html>