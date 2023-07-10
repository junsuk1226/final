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
                          <h2 class="lh-base ms-1 text-center" style="font-family: 'suite';">${sessionScope.mvo.m_name}</h2>
                        </div>
                    </div>
                    <div class=" col-md-5">  
                        <div class = "card shadow rounded p-2 me-4" style="border: none;">
                            <div class = "card-body d-flex justify-content-center">
                                <div class="col-md-5">
                                    <span style="font-family: suite; font-size: large;">${thisMonth}월 총 매출</span>
                                </div>
                                <div class="vr"></div>
                                <div class="col-md-6 me-4 text-end">
                                    <span style="font-family: suite; font-weight: bold; font-size: large;"><fmt:formatNumber value="${thisMonthTotal}" pattern="#,###,###"/>원</span>
                                </div>
                            </div> 
                        </div>
                        <div class="d-flex">
                            <div class = "card mt-3 me-4 col-md-3 shadow"  style="background-color: #3f3f3f;">
                                <div class="card-body">

                                </div>
                            </div>
                            <div class="mt-3 me-3 shadow rounded col-md-8" style="background-color: #3f3f3f;">
                                <div class="py-2 ms-4">
                                    <span style="font-family: suite;color: aliceblue;" >${thisMonth}월 최다 주문 메뉴</span>
                                </div>
                                <div class="card rounded" style="border: none;">
                                    <div class="card-body d-flex">
                                        <div class="ms-2" style="width: 100px; height: 100px;">
                                            <img class="rounded" id="${foodOfMonth.seq}_img" style="object-fit: cover; width: 100%; height: 100%;" />
                                        </div>
                                        <div class="row">
                                            <div class="col-md-12">
                                                <p class="ms-3" style="font-family: suite; font-size:larger;"> ${foodOfMonth.foodNm}</p>
                                            </div>
                                            <div class="text-end col-md-12">
                                                <span class="text-muted me-2" style="font-family: suite;">${foodOfMonth.cnt}회 주문</span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        
                    </div>
                    <div class = "card col-md-5 shadow rounded p-3 me-3 " style="border: none;">
                        <div class = "card-body d-flex">
                            <canvas style="width: 300px; height: 200px;" id="pieChart"></canvas>
                            <div class="vr"></div>
                        </div> 
                    </div>
                </div>
                <div class="row justify-content-center mt-5">
                    <div class="col-md-10 ms-5">
                        <h5 style="font-family: suite;">전년도 대비 월별 매출</h5>
                    </div>
                    <div class="col-md-10">
                        <canvas class="mb-3" id="lineChart" style="object-fit: contain;"></canvas>
                        <hr/>
                    </div>
                </div>
                <div class="row justify-content-center mt-5">

                    
                      
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
				data: [20, 18, 18, 17, 23, 14, 11],
			},{
                
                label: '${thisYear-1}',
				backgroundColor: 'rgba(249, 213, 71, .2)',
				fill : "start",
				borderColor: 'rgba(249, 213, 71, .3)', 
				borderWidth: 3,
				lineTension: .5, 
				pointBackgroundColor: "rgba(249, 213, 71, .2)",
				pointBorderColor: "rgba(249, 213, 71, .2)",
				hitRadius: 25, 
				pointBorderWidth: 2,
				pointStyle: pointImages, 
				data: [10, 20, 21, 15,20, 17, 18, 15, 23, 14, 18, 10]

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
    <c:set var="jsonData" value="[${foodOfMonth.cnt}, ${thisMonthCnt - foodOfMonth.cnt}]" />
    var myPieChart = new Chart(ctxP, {
            type: 'pie',
            data: {
            labels: ["${foodOfMonth.foodNm}", "기타 메뉴"],
            datasets: [{
                data: [20, 30],
                backgroundColor: ["#00A674", "#cccccc"],
                hoverBackgroundColor: ["#3CE6B3", "#EEEEEE"]
            }]
            },
            options: {
                responsive: false,
                    plugins: {
                        legend: {
                        position: 'right'
                        }
                    }
                }
        });
    });
        
     


</script>

</body>
</html>