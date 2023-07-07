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

        <hr><!--구분선-->

        
        </div>
    </div>
    <!-- 사이드바 끝 -->
  
    <!-- 메인 컨텐츠 내용 -->
    <div class="d-flex flex-row flex-shrink-0 p-3 admin-main_area" style="width: calc(100% - 280px);">
        <div class="container-fluid">
            <div class="row justify-content-center mt-5">
                <div class="col-md-11 mb-3 text-start">
                        <h2 class=" lh-base mt-5 ms-1" style="font-family: 'suite'">
                            ${sessionScope.mvo.m_name}<span class="text-muted"> 매출 관리</span>
                        </h2>
                </div>
            </div>
            <form action="/admin/sales" method="get">
                <div style="margin-left: 300px; margin-top: 10px">
                    <img src="../images/schedule.png" style="width: 33px;"/>
                    <input type="text" id="datepicker" name="date">
                    <button type="button" onclick="exe(this.form)">검색</button>
                </div>
                </form>

                <form action="/admin/sales" method="get">
                    <select class="form-select" aria-label="Default select example" name="getMonth" id="monthSelect"></select>
                    <input type="submit" value="검색">
                </form>
            <div class="row justify-content-center my-5">
                <div class="col-md-8">
                    <div class=" shadow rounded" style="border: none;">
                        <!--https://colorlib.com/etc/tb/Table_Fixed_Header/index.html css할때 참고할 것-->
                        
                            <div class="" >
                                <table class="table table-rounded">
                                    <thead>
                                      <tr style="background-color: #2a292c; color: white;">
                                        <th scope="col">주문번호</th>
                                        <th scope="col">주문한 음식</th>
                                        <th scope="col">총가격</th>
                                        <th scope="col">결제 날짜/시간</th>

                                      </tr>
                                    </thead>
                                    <tbody>
                                        <c:forEach var="vo" items="${pvo}">
                                      <tr>
                                        <th scope="row">${vo.p_oNum}</th>
                                        <td>${vo.foodNm}</td>
                                        <td>${vo.totalCost}</td>
                                        <td>${vo.p_date}/${vo.p_time}</td>
                                    
                                      </tr>
                                    </c:forEach>
                                    </tbody>
                                  </table>
                            
                            </div>
                       
                    </div>
                </div>
                <div class="card-body justify-content-center" style="margin-left: 1000px">
                    <c:if test="${date eq null}">                                       
                        <ol class="pagination">
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
        
                    <c:if test="${date ne null}">                                       
                        <ol class="pagination">
                            <c:if test="${page.startPage < page.pagePerBlock}">
                                <li class="page-item disabled"><a class="page-link">&lt;</a></li>
                            </c:if>
                            <c:if test="${page.startPage >= page.pagePerBlock}">
                                <li class="page-item"><a class="page-link"
                                        href="/admin/review?cPage=${page.startPage-page.pagePerBlock }&date=${date}">&lt;</a></li>
                            </c:if>
                            <c:forEach begin="${page.startPage }" end="${page.endPage }" varStatus="st">
                                <c:if test="${page.nowPage eq st.index}">
                                    <li class="page-item active"><a class="page-link">${st.index}</a></li>
                                </c:if>
                                <c:if test="${page.nowPage ne st.index }">
                                    <li class="page-item"><a class="page-link" href="/admin/review?cPage=${st.index}&date=${date}">${st.index }</a>
                                    </li>
                                </c:if>
                            </c:forEach>
                            <c:if test="${page.endPage<page.totalPage}">
                                <li class="page-item"><a class="page-link"
                                        href="/admin/review?cPage=${page.startPage+page.pagePerBlock }&date=${date}">&gt;</a></li>
                            </c:if>
                            <c:if test="${page.endPage == page.totalPage}">
                                <li class="page-item disabled"><a class="page-link">&gt;</a></li>
                            </c:if>
                        </ol>
                    </c:if>
        
                    </div>
                    <c:if test="${pvo eq null }">
                        <div class="card-body justify-content-center">
                            <div class="empty">현재 등록된 게시물이 없습니다.</div>
                        </div>
                    </c:if>
                    </div>

              
            </div>
        </div> 

    </div><!--본문 div의 끝-->
</div>

<<script type="text/javascript" src="js/bootstrap.js"></script>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"
    integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
    <script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>


    
<script>
    $(function() {
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
        var currentDate = $('#datepicker').val();
             console.log(currentDate);
        $('#datepicker').change(function() {
            var date = $(this).val();
            sessionStorage.setItem('selectedDate', date); // 선택한 날짜 저장
            }
        );
         // 페이지 로드 시 선택한 날짜 설정
        var selectedDate = sessionStorage.getItem('selectedDate');
        if (selectedDate) {
            $('#datepicker').val(selectedDate);
        }
    });
    
    function exe(frm){
        frm.submit();
    }

    var monthSelect = document.getElementById('monthSelect');
    var currentMonth = new Date().getMonth() + 1; // 현재 월 가져오기 (1부터 시작)

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
    var selectedMonth = sessionStorage.getItem('selectedMonth');
    if (selectedMonth) {
        monthSelect.value = selectedMonth;
    }
};

// 월 선택 시 선택한 월 저장
monthSelect.addEventListener('change', function() {
    var selectedMonth = monthSelect.value;
    sessionStorage.setItem('selectedMonth', selectedMonth);
});

</script>

</body>
</html>