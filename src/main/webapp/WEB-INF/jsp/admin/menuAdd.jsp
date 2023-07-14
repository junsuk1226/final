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
   .form-check-input:checked {
     background-color: #00A674;
     border-color: #00A674;
   }
   .form-check-input:not(:checked) {
     background-color: #fff;
     border-color: #ddd;
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
    <div class="d-flex flex-row flex-shrink-0 p-3 admin-main_area">
      <div class="container-fluid">
        <div class="row justify-content-center mt-5">
          <div class="col-md-10 mb-3 text-start">
            <h2 class=" lh-base mt-5 ms-1" style="font-family: 'jamsil'">
                <span class="text-muted"> 메뉴 추가 신청 </span>
            </h2>
          </div>
        </div>
        <div class="row justify-content-center">
          <div class="col-md-10 mt-5 mb-2">
            <a class="arrow" style="text-decoration: none; font-family: jamsil; font-size: large; color: #00A674;" href="javascript:history.go(-1);"><i class="fa fa-arrow-left me-2" aria-hidden="true"></i>목록으로 돌아가기</a>
          </div>
        </div>

        <form action="/admin/menuAdd" method="post" id="frm">
          <div class="row justify-content-center mb-5 " >
            <div class="card col-md-10 shadow" style="border: none;">
              <div class="card-body row d-flex justify-content-around">
                <div class="col-md-6 mt-5">
                  
                  <div  class="text-end">
                    <a style="text-decoration: none; font-family: jamsil; color: #00A674;" ><i class="fa fa-info-circle me-2" aria-hidden="true"></i>대표 이미지는 이메일로 보내주세요.</a>
                  </div>

                    <div class = "input-group mb-3" >
                      <span class="input-group-text" style="font-family: jamsil;">메뉴명</span>
                      <input type="text" size= "80" name="foodNm" id="foodNm" value="" class="form-control" style="font-family:suite"/>
                    </div>
                    <div class = "input-group my-3" >
                      <span class="input-group-text ps-3 pe-4" style="font-family: jamsil">재료</span>
                      <input type="text" size= "80" name="foodMaterial" id="foodMaterial"class="form-control"style="font-family:suite" value="" />
                    </div>
                    <div class = "input-group mb-3">
                      <span class="input-group-text  ps-3 pe-4" style="font-family: jamsil;">가격</span>
                      <input type="text" size= "80" name="foodCost" id="foodCost" value="" class="form-control"style="font-family:suite; text-align: end"/>
                      <span class="input-group-text" style="font-family: jamsil">&#8361;</span>
                    </div>
      
                    
                    <div class="mt-3">
                      <div class="input-group">
                        <span class="input-group-text  ps-3 pe-4" style="font-family: jamsil;">내용</span>
                      <textarea name="etc" id="etc" cols="80" name="etc" class="form-control"  rows="9"></textarea>
                      </div>
                    </div>

                    <hr/>
                    <div class="card-title my-4" style="font-family: jamsil; font-size: large;">
                      추천 메뉴 관리
                    </div>
                    <div class="d-flex justify-content-end" style="font-family: suite;">
                      <div class="form-check-inline form-switch">
                        <input class="form-check-input" type="checkbox" role="switch" name="bestfoodyn" onchange="updateValue(this, 'bestfoodyn')" value="Y">
                        <label class="form-check-label" for="bestfoodyn" style="width: 80px;">베스트 메뉴</label>
                      </div>
                      <div class="form-check-inline form-switch">
                        <input class="form-check-input" type="checkbox" role="switch" name="premiumyn" onchange="updateValue(this, 'premiumyn')" value="Y">
                        <label class="form-check-label" for="premiumyn" style="width: 90px;">프리미엄 메뉴</label>
                      </div>
                      <div class="form-check-inline form-switch">
                        <input class="form-check-input" type="checkbox" role="switch" name="recommendyn" onchange="updateValue(this, 'recommendyn')" value="Y">
                        <label class="form-check-label" for="recommendyn" style="width: 60px;">추천 메뉴</label>
                      </div>
                    </div>

                    <hr/>
                    <div class="card-title my-4" style="font-family: jamsil; font-size: large;">
                      계절 메뉴 선택

                    <div class="d-flex  justify-content-end" style="font-family: suite; font-size: medium;">
                      <div class="form-check form-check-inline">
                        <input class="form-check-input" type="radio" name="seasonMenu"  value="S">
                        <label class="form-check-label" for="inlineRadio1">여름</label>
                      </div>
                      <div class="form-check form-check-inline">
                        <input class="form-check-input" type="radio" name="seasonMenu"  value="W">
                        <label class="form-check-label" for="inlineRadio2">겨울</label>
                      </div>
                      <div class="form-check form-check-inline">
                        <input class="form-check-input" type="radio" name="seasonMenu"  value="4">
                        <label class="form-check-label" for="inlineRadio3">사계절</label>
                      </div>
                    </div>
                    </div>

                    <div class="d-flex justify-content-end my-5">
                      <button type="button" class="btn btn-success btn-lg mt-4" style="font-family: jamsil;" onclick="exe(this.form)">신청하기<i class="fa fa-share-square ms-2" aria-hidden="true"></i></button>
                    </div>
                  
                </div>
              </div>
            </div>
          </div>
        </form>
      </div>
    </div>
    <!-- 메인 컨텐츠 끝 -->
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"
    integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>

    
<script>
  function updateValue(checkbox, name) {
    if (checkbox.checked) {
      checkbox.value = 'Y';
    } else {
      checkbox.value = 'N';
    }
    // 값이 변경되었을 때 추가로 수행할 로직을 여기에 작성합니다.
    console.log(name + ' 값 변경:', checkbox.value);
  }


    function exe(frm){
      let foodNm = document.getElementById("foodNm").value;
      let foodMaterial = document.getElementById("foodMaterial").value;
      let foodCost = document.getElementById("foodCost").value;
      let etc = document.getElementById("etc").value;

      if(foodNm.trim() < 1){
        alert("음식이름을 입력해주세요.");
        foodNm.clear();
        foodNm.focus();
        return;
      }else if(foodMaterial.trim() < 1){
        alert("음식 재료를 입력해주세요.");
        foodMaterial.clear();
        foodMaterial.focus();
        return;
      }else if(foodCost.trim() < 1){
        alert("음식 가격을 입력해주세요.");
        foodCost.clear();
        foodCost.focus();
        return;
      }else if(etc.trim() < 1){
        alert("음식 상세설명을 입력해주세요.");
        etc.clear();
        etc.focus();
        return; 
      }


      frm.submit();
    }

</script>

</body>
</html>