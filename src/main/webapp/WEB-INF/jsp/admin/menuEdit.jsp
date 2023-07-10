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

        <hr><!--구분선-->

        
        </div>
    </div>
    <!-- 사이드바 끝 -->

    <!-- 메인 컨텐츠 내용 -->
    <div class="d-flex flex-row flex-shrink-0 p-3 admin-main_area" style="width: calc(100% - 280px);">
        <form action="/admin/editConfirm" method="post" id="frm">
        <table>
            <colgroup>
              <col width="20.4%">
              <col width="79.6%">
            </colgroup>
            <div class="u-container-layout u-container-layout-1"><span class="u-file-icon u-icon u-icon-1"><img src="/${fvo.f_image }" style="width:750px;"></span>
            <tbody class="u-table-body">
              <tr style="height: 68px;">
                <td>음식명</td>
                <td><input type="text" size= "80" name="foodNm" value="${fvo.foodNm }" /></td>
              </tr>
              <tr style="height: 66px;">
                <td>음식재료</td>
                <td><input type="text" size= "80" name="foodMaterial" value="${fvo.foodMaterial}" /></td>
              </tr>
              <tr style="height: 63px;">
                <td>가격</td>
                <td>
                
                       <input type="text" size= "80" name="foodCost" value="${fvo.foodCost}" />
                </td>
              </tr>
              <tr style="height: 69px;">
                <td>판매상태</td>
                <td>
                    <select class="form-select" aria-label="Default select example" name="f_status">
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
              </td>
              </tr>
              <tr style="height: 69px">
                <td>추천 메뉴관리</td>
                <td class="form-check-inline form-switch">
                  <input class="form-check-input" type="checkbox" role="switch" name="bestfoodyn" onchange="updateValue(this, 'bestfoodyn')" value="Y" <c:if test="${fvo.bestfoodyn eq 'Y'}">checked</c:if>>
                  <label class="form-check-label" for="bestfoodyn" style="width:100px">베스트 메뉴</label>
                </td>
                <td class="form-check-inline form-switch">
                  <input class="form-check-input" type="checkbox" role="switch" name="premiumyn" onchange="updateValue(this, 'premiumyn')" value="Y" <c:if test="${fvo.premiumyn eq 'Y'}">checked</c:if>>
                  <label class="form-check-label" for="premiumyn" style="width:120px">프리미엄 메뉴</label>
                </td>
                <td class="form-check-inline form-switch">
                  <input class="form-check-input" type="checkbox" role="switch" name="recommendyn" onchange="updateValue(this, 'recommendyn')" value="Y" <c:if test="${fvo.recommendyn eq 'Y'}">checked</c:if>>
                  <label class="form-check-label" for="recommendyn" style="width:100px">추천 메뉴</label>
                </td>
              </tr>
              <tr style="height: 259px;">
                <td class="u-border-2 u-border-palette-1-base u-first-column u-grey-5 u-table-cell u-table-cell-9">내용</td>
                <td class="u-border-2 u-border-palette-1-light-1 u-table-cell"><textarea name="etc" cols="80" rows="9">${fvo.etc}</textarea></td>
              </tr>
              <td style="width: 50px;"><button type="button" class="btn btn-dark" style="width:60px" onclick="exe(this.form)">수정</button></td>
              <td style="width: 50px;"><a class="btn btn-dark" style="width:60px" href="javascript:history.go(-1);">취소</a></td>
              <input type="hidden" name="f_idx" value="${fvo.f_idx}"/>
              <input type="hidden" name="seq" value="${fvo.seq}"/>
              <input type="hidden" name="stdRestNm" value="${fvo.stdRestNm}"/>
            </tbody>
          </table>
        </form>
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
      frm.submit();
    }

</script>

</body>
</html>