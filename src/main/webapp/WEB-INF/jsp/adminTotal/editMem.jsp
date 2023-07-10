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
                <a href="/adminTotal/main" class="nav-link text-white">
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
                <a href="/adminTotal/editMem" class="nav-link text-white active">
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
            </ul>

            <hr><!--구분선-->

            
            </div>
        </div>
        <!-- 사이드바 끝 -->

        <!-- 메인 컨텐츠 내용 -->
        <div class="d-flex flex-row flex-shrink-0 p-5 admin-main_area" style="width: calc(100% - 280px);">
            <div class="container adminTotal-tablearea" style="width:100%; margin: 0">
                <h1>회원정보수정(고객)</h1>
                <br/>
                
                <div class="container">
                    <table class="table mycustomtable" style="text-align: center;">
                        <form>
                            <input>
                            <button type="button">검색</button>
                        </form>
                        <thead>
                        <tr class="table_head">
                            <th scope="col" style="width: 10px;"></th>
                            <th scope="col" style="width: 150px;">닉네임</th>
                            <th scope="col" style="width: 200px;">아이디</th>
                            <th scope="col" style="width: 150px;">연락처</th>
                            <th scope="col" style="width: 100px;"></th>
                            
                            <th scope="col" style="width: 10px;"></th>
                        </tr>
                        </thead>
                        <tbody>

                        <c:forEach var="mvo" items="${ar}" varStatus="status">
                            
                            <tr class="mytr">
                                <th scope="row"></th>
                                <td>
                                    <input id="name_${status.index}" value="${mvo.m_name}" style="text-align: center;" disabled>
                                    <button class="ok_btn" type="button" onclick="toggleEditMode('name_${status.index}', this, '${mvo.m_idx}', 'name')">수정</button>
                                </td>
                                <td>${mvo.m_id}</td>
                                <td>
                                    <input id="phone_${status.index}" value="${mvo.m_phone}" style="text-align: center;" disabled>
                                    <button class="ok_btn" type="button" onclick="toggleEditMode('phone_${status.index}', this, '${mvo.m_idx}', 'phone')">수정</button>
                                </td>
                                <td>
                                    <button class="no_btn" type="button" onclick="showModal('${mvo.m_idx}')">회원탈퇴</button>
                                </td>

                                <td></td>
                            </tr>
                            
                        </c:forEach>                        
                        </tbody>
                        <tfoot>
                            <tr>
                                <td colspan="6">
                                    <!-- 페이징------------------------------------------------------------------------------------------------------------->
                                    <div class="card-body justify-content-center" style="margin:0 auto">
                                        <c:if test="${ar ne null }">
                                        <ol class="pagination">
                                            <c:if test="${page.startPage < page.pagePerBlock}">
                                                <li class="page-item disabled"><a class="page-link">&lt;</a></li>
                                            </c:if>
                                            <c:if test="${page.startPage >= page.pagePerBlock}">
                                                <li class="page-item"><a class="page-link"
                                                        href="/adminTotal/editMem?cPage=${page.startPage-page.pagePerBlock }<c:if test='${searchType != null}'>&searchType=${searchType}</c:if><c:if test='${searchValue != null}'>&searchValue=${searchValue}</c:if>">&lt;</a></li>
                                            </c:if>
                                            <c:forEach begin="${page.startPage }" end="${page.endPage }" varStatus="st">
                                                <c:if test="${page.nowPage eq st.index}">
                                                    <li class="page-item active"><a class="page-link">${st.index}</a></li>
                                                </c:if>
                                                <c:if test="${page.nowPage ne st.index }">
                                                    <li class="page-item"><a class="page-link" href="/adminTotal/editMem?cPage=${st.index}<c:if test='${searchType != null}'>&searchType=${searchType}</c:if><c:if test='${searchValue != null}'>&searchValue=${searchValue}</c:if>">${st.index }</a>
                                                    </li>
                                                </c:if>
                                            </c:forEach>
                                            <c:if test="${page.endPage<page.totalPage}">
                                                <li class="page-item"><a class="page-link"
                                                        href="/adminTotal/editMem?cPage=${page.startPage+page.pagePerBlock }<c:if test='${searchType != null}'>&searchType=${searchType}</c:if><c:if test='${searchValue != null}'>&searchValue=${searchValue}</c:if>">&gt;</a></li>
                                            </c:if>
                                            <c:if test="${page.endPage == page.totalPage}">
                                                <li class="page-item disabled"><a class="page-link">&gt;</a></li>
                                            </c:if>
                                        </ol>
                                        </c:if>
                                    </div>
                                    
                                    <!-- 페이징끝---------------------------------------------------------------------------------------------------------->
                                </td>
                            </tr>
                        </tfoot>

                    </table>
                </div>
            </div>
            
        </div>
        <!-- 메인 컨텐츠 끝 -->

        <!-- 모달 -->
        <div class="modal" id="modal1" tabindex="-1">
            <div class="modal-dialog">
              <div class="modal-content">
                <div class="modal-header">
                  <h5 class="modal-title">경고</h5>
                  <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                  <p>탈퇴시 계정 복구 불가합니다. 계속 하시겠습니까?</p>
                </div>
                <div class="modal-footer">
                  <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
                  <button type="button" class="btn btn-primary" onclick="withdraw('${mvo.m_idx}')">저장</button>
                </div>
              </div>
            </div>
        </div>
        
    </div>

    <input type="hidden" id="s_mIdx"/>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"
    integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>

    <script>
        function toggleEditMode(inputId, button, m_idx, type) {
            var input = document.getElementById(inputId);
            
            if (input.disabled) {
                input.disabled = false;
                button.textContent = '저장';
            } else {
                input.disabled = true;
                button.textContent = '수정';
    
                saveData(inputId, m_idx, type);
            }
        }

        function withdraw(m_idx){
            
            var inputId = null;

            var type="del";


            saveData(inputId, m_idx, type)
        }
        
        function saveData(inputId, m_idx, type) {

            let mIdx = $("#s_mIdx").val();

            if(type != "del"){
                var input =  document.getElementById(inputId);
                var value = input.value;
            } else {
                value = inputId
                m_idx = mIdx;
            }
    
            $.ajax({
                url: '/adminTotal/editMemSave',
                type: 'POST',
                data: {"type": type, "value": value, "m_idx": m_idx},
                success: function(response) {
                    // 요청이 성공적으로 완료됨
                    console.log("승인이 완료되었습니다.");
                    location.reload();
                },
                error: function(xhr, status, error) {
                    // 요청이 실패함
                    console.error("승인 요청에 실패했습니다.");
                }
            });
        }

        function showModal(m_idx){
            $('#modal1').modal('show');
            $("#s_mIdx").val(m_idx);
        }

    </script>

</body>
</html>