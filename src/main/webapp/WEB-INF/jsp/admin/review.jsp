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
<!--별 아이콘-->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">
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
            <a href="/admin/sales" class="nav-link text-white">
            매출관리
            </a>
        </li>
        <li>
            <a href="/admin/review" class="nav-link text-white active">
            리뷰관리
            </a>
        </li>
        </ul>

        <hr><!--구분선-->

        
        </div>
    </div>
    <form action="/admin/review" method="post">
    <div style="margin-left: 300px; margin-top: 10px">
        <img src="../images/schedule.png" style="width: 33px;"/>
        <input type="text" id="datepicker" name="date">
        <button type="button" onclick="exe(this.form)">검색</button>
    </div>
    </form>
    <!-- 사이드바 끝 -->

    <!-- 메인 컨텐츠 내용 -->
    <div class="d-flex flex-row flex-shrink-0 p-3 admin-main_area" style="width: calc(100% - 280px);">

        <table class="table table-striped">
            <thead>
              <tr>
                <th scope="col">번호</th>
                <th scope="col">리뷰사진</th>
                <th scope="col">리뷰</th>
                <th scope="col">작성자</th>
                <th scope="col">리뷰점수</th>
                <th scope="col">리뷰날짜</th>
              </tr>
            </thead>
            <tbody>
                <c:forEach var="vo" items="${rvo}">
              <tr>
                <th scope="row">${vo.r_idx}</th>
                <c:if test="${vo.r_file != null}">
                <td> <img src="../editor_upload/${vo.r_file}" style="width:80px; height: 60px;"></td>
                </c:if>
                <c:if test="${vo.r_file == null}">
                <td> <img src="../main_images/hand2.png" style="width:80px; height: 60px;"></td>
                </c:if>
                <td>${vo.r_content}</td>
                <td>${vo.m_name}</td>
                     <c:choose>
                        <c:when test="${vo.r_score eq '5'}">
                            <td><img src="../images/star.png" style="width:30px"><img src="../images/star.png" style="width:30px"><img src="../images/star.png" style="width:30px"><img src="../images/star.png" style="width:30px"><img src="../images/star.png" style="width:30px"></td>
                        </c:when>
                        <c:when test="${vo.r_score eq '4'}">
                            <td><img src="../images/star.png" style="width:30px"><img src="../images/star.png" style="width:30px"><img src="../images/star.png" style="width:30px"><img src="../images/star.png" style="width:30px"></td>
                        </c:when>
                        <c:when test="${vo.r_score eq '3'}">
                            <td><img src="../images/star.png" style="width:30px"><img src="../images/star.png" style="width:30px"></td>
                        </c:when>
                        <c:when test="${vo.r_score eq '2'}">
                            <td><img src="../images/star.png" style="width:30px"></td>
                        </c:when>
                        <c:when test="${vo.r_score eq '1'}">
                            <td><img src="../images/star.png" style="width:30px"></td>
                        </c:when>
                    </c:choose>
                
                <td>${vo.r_writedate}</td>
                              
              </tr>
            </c:forEach>
            
           
            </tbody>
          </table>
        </div>
        <div class="card-body justify-content-center" style="margin-left: 1000px">
            <c:if test="${date eq null}">                                       
                <ol class="pagination">
                    <c:if test="${page.startPage < page.pagePerBlock}">
                        <li class="page-item disabled"><a class="page-link">&lt;</a></li>
                    </c:if>
                    <c:if test="${page.startPage >= page.pagePerBlock}">
                        <li class="page-item"><a class="page-link"
                                href="/admin/review?cPage=${page.startPage-page.pagePerBlock }">&lt;</a></li>
                    </c:if>
                    <c:forEach begin="${page.startPage }" end="${page.endPage }" varStatus="st">
                        <c:if test="${page.nowPage eq st.index}">
                            <li class="page-item active"><a class="page-link">${st.index}</a></li>
                        </c:if>
                        <c:if test="${page.nowPage ne st.index }">
                            <li class="page-item"><a class="page-link" href="/admin/review?cPage=${st.index}">${st.index }</a>
                            </li>
                        </c:if>
                    </c:forEach>
                    <c:if test="${page.endPage<page.totalPage}">
                        <li class="page-item"><a class="page-link"
                                href="/admin/review?cPage=${page.startPage+page.pagePerBlock }">&gt;</a></li>
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
            <c:if test="${rvo eq null }">
                <div class="card-body justify-content-center">
                    <div class="empty">현재 등록된 게시물이 없습니다.</div>
                </div>
            </c:if>
            </div>
        <!-- 메인 컨텐츠 끝 -->
<script type="text/javascript" src="js/bootstrap.js"></script>

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
              
                
                }
            )
           
        });
        
        function exe(frm){
            frm.submit();
        }
</script>

</body>
</html>