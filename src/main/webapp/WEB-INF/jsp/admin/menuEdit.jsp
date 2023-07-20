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
                <span class="text-muted"> 메뉴 수정 - </span>${fvo.foodNm }
            </h2>
          </div>
        </div>
        <div class="row justify-content-center">
          <div class="col-md-10 mt-5 mb-2">
            <a class="arrow" style="text-decoration: none; font-family: jamsil; font-size: large; color: #00A674;" href="/admin/menu"><i class="fa fa-arrow-left me-2" aria-hidden="true"></i>목록으로 돌아가기</a>
          </div>
        </div>
        <form action="/admin/editConfirm" method="post" id="frm">
          <input type="hidden" name="f_idx" value="${fvo.f_idx}"/>
          <input type="hidden" name="seq" value="${fvo.seq}"/>
          <input type="hidden" name="stdRestNm" value="${fvo.stdRestNm}"/>
          <div class="row justify-content-center mb-5 " >
            <div class="card col-md-10 shadow" style="border: none;">
              <div class="card-body row d-flex justify-content-around">
                  <div class="col-md-5 ">
                    <div class="my-5" style="width: 450px; height: 450px;">
                      <img class="rounded" src="/${fvo.f_image }" style="object-fit: cover; width: 100%; height: 100%;"/>
                    </div>
                    <div class = "input-group mb-4" style="width: 450px;">
                      <span class="input-group-text" style="font-family: jamsil;">메뉴명</span>
                      <input type="text" size= "80" name="foodNm" class="form-control"style="font-family:suite"  value="${fvo.foodNm }" />
                    </div>
                    <div class = "input-group my-3" style="width: 450px;">
                      <span class="input-group-text ps-3 pe-4" style="font-family: jamsil">재료</span>
                      <input type="text" size= "80" name="foodMaterial" class="form-control"style="font-family:suite"  value="${fvo.foodMaterial}" />
                    </div>
                  </div>
                  <div class="col-md-5 mx-3 my-5">
                    <div class="row d-flex">
                      <div class="col-md-6">
                        <div class="input-group">
                          <label class="input-group-text"  style="font-family: jamsil;" for="f_status">상태</label>
                          <select class="form-select" id="f_status" name="f_status" style="font-family: suite;">
                            <c:choose>
                                <c:when test="${fvo.f_status eq '0'}">
                                    <option value="0" selected>판매중</option>
                                    <option value="1">품절</option>
                                    <option value="2">삭제</option>
                                </c:when>
                                <c:when test="${fvo.f_status eq '1'}">
                                    <option value="0">판매중</option>
                                    <option value="1" selected>품절</option>
                                    <option value="2">삭제</option>
                                </c:when>
                                <c:when test="${fvo.f_status eq '2'}">
                                    <option value="0">판매중</option>
                                    <option value="1">품절</option>
                                    <option value="2" selected>삭제</option>
                                </c:when>
                            </c:choose>
                          </select>
                        </div>
                      </div>
                      <div class="col-md-6">
                        <div class = "input-group mb-3">
                          <span class="input-group-text " style="font-family: jamsil;">가격</span>
                          <input type="text" size= "40" name="foodCost" class="form-control"style="font-family:suite; text-align: end"  value="${fvo.foodCost}" />
                          <span class="input-group-text" style="font-family: jamsil">&#8361;</span>
                        </div>
                      </div>
                    </div>
                    <div class="mt-3">
                      <div class="input-group">
                        <span class="input-group-text " style="font-family: jamsil;">내용</span>
                        <textarea class="form-control" id="textAreaExample2"  name="etc" cols="80" rows="7" style="font-family: suite;">${fvo.etc}</textarea>
                      </div>
                    </div>
                    <hr/>
                    <div class="card-title my-4" style="font-family: jamsil; font-size: large;">
                      추천 메뉴 관리
                    </div>
                    <div class="d-flex justify-content-end" style="font-family: suite;">
                      <div class="form-check-inline form-switch">
                        <input class="form-check-input success" type="checkbox" role="switch" name="bestfoodyn" onchange="updateValue(this, 'bestfoodyn')" value="Y" <c:if test="${fvo.bestfoodyn eq 'Y'}">checked</c:if>>
                        <label class="form-check-label" for="bestfoodyn" style="width: 80px;">베스트 메뉴</label>
                      </div>
                      <div class="form-check-inline form-switch">
                        <input class="form-check-input success" type="checkbox" role="switch" name="premiumyn" onchange="updateValue(this, 'premiumyn')" value="Y" <c:if test="${fvo.premiumyn eq 'Y'}">checked</c:if>>
                        <label class="form-check-label" for="premiumyn"style="width: 90px;" >프리미엄 메뉴</label>
                      </div>
                      <div class="form-check-inline form-switch">
                        <input class="form-check-input success" type="checkbox" role="switch" name="recommendyn" onchange="updateValue(this, 'recommendyn')" value="Y" <c:if test="${fvo.recommendyn eq 'Y'}">checked</c:if>>
                        <label class="form-check-label" for="recommendyn"style="width: 60px;" >추천 메뉴</label>
                      </div>
                    </div>
                    <hr/>
                    <div class="card-title my-4" style="font-family: jamsil; font-size: large;">
                      계절 메뉴 선택
                    
                    <div class="d-flex  justify-content-end" style="font-family: suite; font-size: medium;">
                      <div class="form-check form-check-inline">
                        <input class="form-check-input" type="radio" name="seasonMenu" id="inlineRadio1" value="S" <c:if test="${fvo.seasonMenu eq 'S'}">checked</c:if>>
                        <label class="form-check-label" for="inlineRadio1">여름</label>
                      </div>
                      <div class="form-check form-check-inline">
                        <input class="form-check-input" type="radio" name="seasonMenu" id="inlineRadio2" value="W"<c:if test="${fvo.seasonMenu eq 'W'}">checked</c:if>>
                        <label class="form-check-label" for="inlineRadio2">겨울</label>
                      </div>
                      <div class="form-check form-check-inline">
                        <input class="form-check-input" type="radio" name="seasonMenu" id="inlineRadio3" value="4"<c:if test="${fvo.seasonMenu eq '4'}">checked</c:if>>
                        <label class="form-check-label" for="inlineRadio3">사계절</label>
                      </div>
                    </div>
                  </div>
                  <div class="d-flex justify-content-end mt-5">
                    <button type="button" class="btn btn-success btn-lg mt-4" style="font-family: jamsil;" onclick="exe(this.form)">수정<i class="fa fa-pencil ms-2" aria-hidden="true"></i></button>
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
      alert("수정이 완료 되었습니다.");
      frm.submit();
    }

</script>

</body>
</html>