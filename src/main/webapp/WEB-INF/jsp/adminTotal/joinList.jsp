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
<link rel="stylesheet" href="../css/adminTotal.css" />
<style>
    /*파일 첨부 버튼 fade*/              
    .hover-fade img {
        width: 100%;
        height: auto;
        -webkit-transition: all 0.5s ease-in-out;
        -moz-transition: all 0.5s ease-in-out;
        -o-transition: all 0.5s ease-in-out;
        -ms-transition: all 0.5s ease-in-out;
        transition: all 0.5s ease-in-out;
    }
    .hover-fade:hover img {
        -webkit-transform: scale(1.05);
        -moz-transform: scale(1.05);
        -o-transform: scale(1.05);
        -ms-transform: scale(1.05);
        transform: scale(1.05);
        -ms-filter: "progid: DXImageTransform.Microsoft.Alpha(Opacity=2)";
        filter: alpha(opacity=0.5);
        opacity: 0.5;
    }
    
    /*사진 삭제 버튼*/
    button.btn-del {
        position: absolute;
        top: -10px;
        left : 310px;
        border-radius: 15px;
        border: none;
        background-color: #6600db;
        width: 26px;

    }
</style>
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
                <a href="/adminTotal/joinList" class="nav-link text-white active">
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
        <div class="d-flex flex-row flex-shrink-0 p-5 admin-main_area" style="width: calc(100% - 280px);">
            <div class="container adminTotal-tablearea" style="width:100%; margin: 0">
                <h1>가입신청 현황</h1>
                <hr>
                
                <div class="container">
                    <table class="table mycustomtable" style="text-align: center;">
                        
                        <thead>
                        <tr class="table_head">
                            <th scope="col" style="width: 10px;"></th>
                            <th scope="col" style="width: 150px;">휴게소명</th>
                            <th scope="col" style="width: 200px;">요청아이디</th>
                            <th scope="col" style="width: 150px;">담당자 연락처</th>
                            <th scope="col" style="width: 150px;">가입신청일</th>
                            <th scope="col" style="width: 60px;"></th>
                            <th scope="col" style="width: 60px;"></th>
                            <th scope="col" style="width: 10px;"></th>
                        </tr>
                        </thead>
                        <tbody>

                        <c:forEach var="mvo" items="${ar}">
                            <tr class="mytr">
                                <th scope="row"></th>
                                <td class="align-middle">${mvo.m_name}</td>
                                <td class="align-middle">${mvo.m_id}</td>
                                <td class="align-middle">${mvo.m_phone}</td>
                                <td class="align-middle">${mvo.m_joinDate}</td>
                                <td ><button class="ok_btn" style="width: 100%;" onclick="showModal('${mvo.m_id}')">승인</button></td>
                                <td><button class="no_btn" style="width: 100%;" onclick="refuseUser('${mvo.m_id}')">거절</button></td>
                                <td></td>
                            </tr>
                        </c:forEach>
                        
                        </tbody>

                    </table>
                </div>
            </div>
            
        </div>
        <!-- 메인 컨텐츠 끝 -->
    </div>

    <!-- 모달 -->
    <div class="modal" id="modal1" tabindex="-1">
        <div class="modal-dialog">
          <div class="modal-content">
            <div class="modal-header">
              <h5 class="modal-title">경고</h5>
              <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
              <p>휴게소 사진 업로드</p>
              <div class="card shadow p-3 mb-5 bg-body rounded mx-1" style="border: none;">
                <div class="row card-body justify-content-around">
                                            
                    <div class ="row ms-1 mb-3">
                        <div class=" input-group">
                            <label for="file">
                                <div style="height: 100px; width: 150px; margin: 0 auto;" class="hover-fade">
                                    <img src="../main_images/addfile.png" style='object-fit:cover; width: 100%; height:100%; cursor: pointer;' class='rounded shadow mb-5' alt="inputFile"/>
                                </div>
                            </label>
                            <input type="file" class="form-control " id="file" name="file" style="display: none;">
                            <div class="ms-3">
                                <div style="background-color: rgb(241, 241, 241); border-radius: 6px; height: 100px; width: 150px; margin: 0 auto;" id="img_area">
                                    <c:if test="${fvo.f_image != null and fvo.f_image.trim().length() > 0}">
                                        <img src="${fvo.f_image}" style='object-fit:cover; width: 100%; height:100%' class='rounded shadow mb-5' id='insertedImg'/><button type='button' onclick='delImg()' class='btn-del' id='insertedBtn'><i class='fa fa-times' style ='color: #fff'></i></button>
                                    </c:if>
                                </div>
                            </div>
                        </div>
                    </div>

            </div>
            <div class="modal-footer">
              <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
              <button type="button" class="btn btn-primary" onclick="approveUser()">저장</button>
            </div>
          </div>
        </div>
    </div>

    <input type="hidden" id="s_mId"/>
    <input type="hidden" id="f_image"/>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"
    integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>

<script>
    function showModal(m_id){
        $('#modal1').modal('show');
        $("#s_mId").val(m_id);
    }

    var savedpath ="../images/";
    var savedfname ="${fn:substring(fvo.f_image, fvo.f_image.lastIndexOf('/')+1, fn:length(fvo.f_image))}";

    $(function(){
        $("#file").bind("change", function(){
            //console.log("DDDDDD");
            let fileInput = document.getElementById('file');
            
            
            var file = fileInput.files[0];
            
            var formData = new FormData();
            formData.append('file', file);
            
            
            $.ajax({
                url: "/adminTotal/saveImg",
                type: "post",
                data: formData,
                contentType:false, //파일 전송 시
                processData:false, //파일 전송 시
                cache: false,      //파일 전송 시
                dataType: "json"
           }).done(function(data){
                console.log(data.path+"/"+data.fname);
                savedpath=data.path;
                savedfname=data.fname;
                $("#img_area").html("<img src='"+data.path+"/"+data.fname+"' style='object-fit:cover; width: 100%; height:100%' class='rounded shadow mb-5' id='insertedImg'/><button type='button' onclick='delImg()' class='btn-del' id='insertedBtn'><i class='fa fa-times' style ='color: #fff'></i></button> ")
                $("#f_image").val(data.path+"/"+data.fname);
                // console.log($("#f_image").val())
           });
        });
    });

    function delImg(){

        $.ajax({
            url:"/adminTotal/delImg",
            type:"post",
            contentType: 'application/json',
            data: JSON.stringify({"path":savedpath, "fname":savedfname}),  //data: JSON.stringify(senddata),
            dataType: "json"

        }).done(function(data){
            if(data){
                $("img").remove("#insertedImg");
                $("button").remove("#insertedBtn");
                $("#file").val(""); //파일 선택기 초기화
                
            }else{
                console.log("삭제 실패");
            }
        });
    }

   function approveUser() {
        var m_id = $("#s_mId").val();
        var reg_image = $("#f_image").val();
        
        // Ajax 요청 보내기
        $.ajax({
            url: '/adminTotal/approval',
            type: 'POST',
            data: {"m_id": m_id, "reg_image": reg_image},
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


    function refuseUser(m_id) {
        // Ajax 요청 보내기
        $.ajax({
            url: '/adminTotal/refuse',
            type: 'POST',
            data: {"m_id": m_id},
            success: function(response) {
                // 요청이 성공적으로 완료됨
                console.log("승인거절이 완료되었습니다.");
                location.reload();
            },
            error: function(xhr, status, error) {
            // 요청이 실패함
            console.error("승인 요청에 실패했습니다.");
            }
        });
    }
</script>

</body>
</html>