<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>내 손안에 휴게소, 마이휴 어드민</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.3/font/bootstrap-icons.css">
<link rel="stylesheet" href="../css/admin.css" />
<!--차트 js-->
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/3.5.1/chart.min.js"></script>
 <!--아이콘 cdn-->
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
                    <a href="/admin/main" class="nav-link text-white active">
                    홈
                    </a>
                </li>
                <li>
                    <a href="/admin/menu" class="nav-link text-white ">
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
                    <div class="col-md-9 mb-5 text-start d-flex align-items-center">
                        <div style="width: 120px; height: 120px;" class="me-4">
                            <c:if test="${rest.reg_image ne null}">
                                <img src="${rest.reg_image}" class="rounded-circle" style="object-fit: cover; width: 100%; height: 100%;">
                            </c:if>
                            <c:if test="${rest.reg_image eq null}">
                                <img src="../main_images/no_pic.png" class="rounded-circle" style="object-fit: cover; width: 100%; height: 100%;">
                            </c:if>
                        </div>
                        <div class="d-flex flex-column justify-content-center" style="width: auto;">
                          <h2 class="lh-base ms-1 text-center" style="font-family: 'jamsil'; font-size: xx-large;">${sessionScope.mvo.m_name}</h2>
                        </div>
                    </div>
                    <div class=" col-md-5 mt-5">  
                        <div class = "card shadow rounded p-2 me-4" style="border: none;">
                            <div class = "card-body d-flex justify-content-center">
                                <div class="col-md-5">
                                    <span style="font-family: suite; font-size: large;">${thisMonth}월 총 매출</span>
                                </div>
                                <div class="vr"></div>
                                <div class="col-md-6 me-4 text-end">
                                    <span style="font-family: suite; font-weight: bold; font-size: large;">
                                        <c:if test="${thisMonthTotal ne null}">
                                        <fmt:formatNumber value="${thisMonthTotal}" pattern="#,###,###"/>
                                        </c:if>    
                                        <c:if test="${thisMonthTotal eq null}">
                                        0
                                        </c:if>
                                        원</span>
                                </div>
                            </div> 
                        </div>
                        <div class="d-flex mt-4">
                            <div class = "card mt-3 me-4 col-md-3 shadow"  style="background-color: #3f3f3f;">
                                <div class="card-body  justify-content-center">
                                    <span class="ms-2" style="font-size: medium; color: #00A674; font-family: suite; font-weight: bold;">별점 평균<i class="fa fa-star ms-2" style="color: #FBB202;"></i></span>
                                    <hr/>
                                    <div class="mt-5">
                                        <span class="ms-2 " style="font-size: medium; color: #FBB202; font-family: suite; font-weight: bold; font-size: xx-large;">
                                            <c:if test="${scoreAvg ne null}">
                                            ${scoreAvg}
                                            </c:if>
                                            <c:if test="${scoreAvg eq null}">
                                            0
                                            </c:if>
                                        <span class="ms-2" style="font-size: medium;">점</span></span>
                                
                                    </div>
                                </div>
                            </div>
                            <div class="mt-3 me-3 shadow rounded col-md-8" style="background-color: #3f3f3f;">
                                <div class="py-2 ms-4">
                                    <span style="font-family: suite;color: aliceblue;" >${thisMonth}월 인기 메뉴</span>
                                </div>
                                <div class="card rounded" style="border: none;">
                                    <div class="card-body d-flex justify-content-between">
                                        <c:if test="${foodOfMonth ne null}">
                                        <div class="ms-2" style="width: 120px; height: 100px;">
                                            <img class="rounded" id="${foodOfMonth.seq}_img" style="object-fit: cover; width: 100%; height: 100%;" />
                                        </div>
                                        <div class="row col-md-9">
                                            <div class="col-md-12">
                                                <p class="ms-3" style="font-family: suite; font-size:larger;"> ${foodOfMonth.foodNm}</p>
                                            </div>
                                            <div class="text-end col-md-12">
                                                <span class="text-muted me-2" style="font-family: suite;">
                                                    총 <fmt:formatNumber value="${foodOfMonth.foodCost * foodOfMonth.cnt}" pattern="#,###,###"/>원 / ${foodOfMonth.cnt}회 주문
                                                </span>
                                            </div>
                                        </div>
                                        </c:if>
                                        <c:if test="${foodOfMonth eq null}">
                                            <span style="font-family: suite;" class=" p-5"><i class="fa fa-exclamation-circle me-2 fa-lg" aria-hidden="true"></i>주문 내역이 없습니다.</td></span>
                                        </c:if>
                                    </div>
                                </div>
                            </div>
                        </div>
                        
                    </div>
                    <div class = "card col-md-4 shadow rounded p-3 me-3 mt-5 " style="border: none; ">
                        <span class="ms-1" style="font-size: medium; color: #00A674; font-family: suite; font-weight: bold;">인기 메뉴 주문 비율</span>
                        <div class = "card-body d-flex justify-content-around">
                            <div>
                                <canvas style="width: 200px; height: 200px;" id="pieChart"></canvas>
                            </div>
                            <div class="me-2">
                                <canvas class="ms-1" style="width: 200px; height: 200px;" id="myChart"></canvas>
                            </div>
                        </div> 
                    </div>
                </div>
                <div class="row justify-content-center mt-5">
                    <div class="col-md-9 ms-2 ">
                        <h5 style="font-family: suite;">전년도 대비 월별 매출</h5>
                        
                    </div>
                    <div class="col-md-10">
                        <canvas class="mb-3" id="lineChart" style="object-fit: contain;"></canvas>
                        <hr/>
                    </div>
                </div>
                <div class="row justify-content-center mt-5">
                    <div class="mt-3 me-3 shadow rounded col-md-8" style="background-color: #3f3f3f;">
                        <div class="py-2 ms-4">
                            <span style="font-family: suite;color: aliceblue; font-size: x-large;" >최근 리뷰<span class="ms-2" style="font-size: medium; color: #00A674;">가장 최근 리뷰 5개가 표시됩니다.</span></span>
                        </div>
                        <c:if test="${empty recentReview}">
                                <div class="card rounded mb-2" style="border: none;">
                                    <div class="card-body d-flex justify-content-center">
                                        <span class="p-5" style="font-family: suite; font-size:large;"><i class="fa fa-exclamation-circle me-2 fa-lg" aria-hidden="true"></i>리뷰가 없습니다.</td></span>
                                    </div>
                                </div> 
                        </c:if>
                        <c:forEach var="re" items="${recentReview}">
                        <div class="card rounded mb-2" style="border: none;">
                            <div class="card-body d-flex justify-content-between">
                            <c:if test ="${re ne null}">
                                <div class="ms-2" style="width: 150px; height: 150px;">
                                    <c:if test="${re.r_file eq null || fn:length(re.r_file.trim()) eq 0}">                                   
                                        <img class="rounded" src="../main_images/no_image.png" id="${foodOfMonth.seq}_img" style="object-fit: cover; width: 100%; height: 100%;" />
                                    </c:if>
                                    <c:if test="${re.r_file ne null && fn:length(re.r_file.trim()) > 0 }">                                   
                                        <img class="rounded" src="../editor_upload/${re.r_file}" id="${foodOfMonth.seq}_img" style="object-fit: cover; width: 100%; height: 100%;" />
                                    </c:if>
                                </div>
                                <div class="row col-md-10">
                                    <div class="col-md-12 mt-3">
                                        <p class="ms-3" style="font-family: suite; font-size:larger;"> ${re.r_content}</p>
                                    </div>
                                    <div class="text-end col-md-12 justify-content-end">
                                        <span class="text-muted me-2 text-end justify-content-end" style="font-family: suite;">
                                            <div class="me-2 my-2">
                                                <c:forEach begin="1" end="${re.r_score}">
                                                    <i class="fa fa-star" style="color: #FBB202;"></i>
                                                </c:forEach>
                                                <c:forEach begin="1" end="${5 - re.r_score}">
                                                    <i class="fa fa-star-o" style="color: #FBB202;"></i>
                                                </c:forEach>
                                            </div>
                                            ${re.r_writedate}
                                        </span>
                                    </div>
                                </div>
                            </c:if>
                            
                            </div>
                        </div>

                        </c:forEach>
                    </div>
                </div>







            
        </div>
        <!-- 메인 컨텐츠 끝 -->
    </div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"
    integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>




<script>
    
     //파일이름을 비동기식으로 가져오기
     $(document).ready(function() {
        var seq = "${foodOfMonth.seq}";
        sendAjaxRequest(seq);
         
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

     document.addEventListener('DOMContentLoaded', function() {
        // Chart 객체를 사용하여 차트를 그리는 코드 작성
        var ctx = document.getElementById('lineChart').getContext('2d');

        var pointImages = [
            document.getElementById("point01"),
            document.getElementById("point02"),
            document.getElementById("point03"),
            document.getElementById("point04"),
        ];
        

        <c:set var="chk" value="0"/>

        var lineChart = new Chart(ctx, {
		// The type of chart we want to create
		type: 'line',

		data: {
			labels: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
			datasets: [{
                label: '${thisYear}',
				backgroundColor: 'rgba(0, 166, 116, .3)', 
				fill : "start",
				borderColor: 'rgb(0, 166, 116)', 
				borderWidth: 3, 
				lineTension: .5,
				pointBackgroundColor: "rgb(0, 166, 116)",
				pointBorderColor: "rgb(0, 166, 116)", 
				hitRadius: 25,
				pointBorderWidth: 2,
				pointStyle: pointImages,
				data: [
                <c:forEach var="total" items="${yearMonthTotal}">
                    <c:set var="year" value="${total.key}" />
                    <c:if test="${year == thisYear}">
                        <c:forEach begin="1" end="${thisMonth}" varStatus="st">
                        <c:set var="chk" value="0"/>
                            <c:forEach var="monthSale" items="${total.value}">
                                <c:if test="${st.index == monthSale.month}">
                                    <c:set var="chk" value="${monthSale.monthTotal}"/>
                                </c:if>
                            </c:forEach>                            
                            ${chk},
                        </c:forEach>
                    </c:if>
                </c:forEach>
                ],
			},{
                
                label: '${thisYear-1}',
				backgroundColor: 'rgba(249, 213, 71, .2)',
				fill : "start",
				borderColor: 'rgba(249, 213, 71, .3)', 
				borderWidth: 3,
				lineTension: .5, 
				pointBackgroundColor: "rgba(249, 213, 71, .3)",
				pointBorderColor: "rgba(249, 213, 71, .3)",
				hitRadius: 25, 
				pointBorderWidth: 2,
				pointStyle: pointImages, 
				data: [
                <c:forEach var="total" items="${yearMonthTotal}">
                    <c:if test="${total ne null}">
                    <c:set var="year" value="${total.key}" />
                    <c:if test="${year == thisYear-1}">
                        <c:forEach begin="1" end="12" varStatus="st">
                        <c:set var="chk" value="0"/>
                            <c:forEach var="monthSale" items="${total.value}">
                                <c:if test="${st.index == monthSale.month}">
                                    <c:set var="chk" value="${monthSale.monthTotal}"/>
                                </c:if>
                            </c:forEach>                            
                            ${chk},
                        </c:forEach>
                    </c:if>
                    </c:if>
                </c:forEach>
                ]

            }]
		},
		
		// Configuration options go here
		options: {
			layout: {
				padding: {  // 간격
					left:50,
					right:50,
					top:20,
					bottom:20
				}
			},
               scales: {
                xAxes: [{
                    gridLines: {
                        display:false
                    }
                }],
                yAxes: [{
                    gridLines: {
                        display:false
                    }
                }]
            }
		}
	});


    //pie
    var ctxP = document.getElementById("pieChart").getContext('2d');
    var myPieChart = new Chart(ctxP, {
            type: 'pie',
            data: {
            labels: ["${foodOfMonth.foodNm}", "기타 메뉴"],
            datasets: [{
                data: ['${foodOfMonth.cnt}', '${thisMonthCnt-foodOfMonth.cnt}'],
                backgroundColor: ["#00A674", "#cccccc"],
                hoverBackgroundColor: ["#3CE6B3", "#EEEEEE"]
            }]
            },
            options: {
                responsive: false,
                    plugins: {
                        legend: {
                        position: 'bottom'
                        }
                    }
                }
        });

        //bar
        var ctxB = document.getElementById("myChart").getContext('2d');
        var myBarChart = new Chart(ctxB, {
        type: 'bar',
        data: {
            labels: ["${foodOfMonth.foodNm}", "전체 매출"],
            datasets: [{
            label: '매출',
            data: ['${foodOfMonth.foodCost * foodOfMonth.cnt}', '${thisMonthTotal}'],
            backgroundColor: [
                'rgba(0, 166, 116, .8)',
                'rgba(249, 213, 71, .8)',
                
            ],
            hoverBackgroundColor: ['rgba(0, 166, 116, .2)',
            'rgba(249, 213, 71, .2)',],
            borderWidth: 1
            }]
        },
        options: {
            responsive: false,
            scales: {
            yAxes: [{
                ticks: {
                beginAtZero: true
                }
            }]
            }
        }
        });
    });
        
     


</script>

</body>
</html>