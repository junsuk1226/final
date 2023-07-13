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
                <a href="/adminTotal/main" class="nav-link text-white active">
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
                <a href="/adminTotal/review" class="nav-link text-white">
                리뷰 관리
                </a>
            </li>
            </ul>

            <hr><!--구분선-->

            
            </div>
        </div>
        <!-- 사이드바 끝 -->

        <!-- 메인 컨텐츠 내용 -->
        <div class="d-flex flex-row flex-shrink-0 p-3 admin-main_area" style="width: calc(100% - 280px);">
            <div class="container adminTotal-grapharea" style="width:100%; margin: 10">
                <div class="container" style="margin: 0 10px;">

                    <div class="row my-3">
                        <div class="col-12">
                            <h1>휴게소 현황</h1>
                        </div>
                    </div>
                    <div class="row my-2">
                        <div class="col-lg-6">
                            <div class="card">
                                <div class="card-body">
                                    <canvas id="myChart1"></canvas>
                                </div>
                                <div class="card-footer text-center text-dark">
                                <h4 style="margin: 0;">가입 휴게소 현황</h4>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-6">
                            <div class="card">
                                <div class="card-body">
                                    <canvas id="myChart2"></canvas>
                                </div>
                                <div class="card-footer text-center text-dark">
                                    <h4 style="margin: 0;">월별 회원 가입 수</h4>
                                </div>
                            </div>
                        </div>
                    </div>

                </div>
            </div>  
        </div>
        <!-- 메인 컨텐츠 끝 -->
    </div>

    <input id="all" type="hidden" value="${all}">
    <input id="reg_cnt" type="hidden" value="${reg_cnt}">
    <input id="wait_cnt" type="hidden" value="${wait_cnt}">

    <c:forEach var="mjs" items="${monthly}" varStatus="loop">
        <input id="month${loop.index}" type="hidden" value="${mjs.joinCount}">
    </c:forEach>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"
    integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/chart.js@2.8.0"></script>
<script>

    var reg_cnt = $('#reg_cnt').val();
    var wait_cnt = $('#wait_cnt').val();
    var all = $('#all').val() - reg_cnt - wait_cnt;

    data = {
            datasets: [{
                backgroundColor: ['#aaaaaa','#6495ED','#F4A460'],
                data: [all, reg_cnt, wait_cnt]
            }],       
            // 라벨의 이름이 툴팁처럼 마우스가 근처에 오면 나타남
            labels: ['비가입','운영중','가입대기'] 
        };

    // 가운데 구멍이 없는 파이형 차트
    var ctx1 = document.getElementById("myChart1");
    var myPieChart = new Chart(ctx1, {
        type: 'pie',
        data: data,
        options: {}
    });


    var monthly = [];  // 빈 배열 생성

    for (var i = 0; i < 12; i++) {
        var value = $('#month' + i).val();
        monthly.push(value);  // 배열에 값 추가
        console.log($('#month'+i).val());
    }

    var ctx = document.getElementById('myChart2').getContext('2d');
    var chart = new Chart(ctx, {
      // 챠트 종류를 선택
      type: 'line',

      // 챠트를 그릴 데이타
      data: {
        labels: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
        datasets: [{
            label: '',
            backgroundColor: 'transparent',
            borderColor: 'red',
            data: monthly
        }]
      },
      // 옵션
      options: {
        legend: {
        	display: false
        },
        scales: {
            yAxes: [{
                ticks: {
                    beginAtZero: true,
                }
            }]
            
        }
      }
    });

  </script>

</body>
</html>