<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">
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

    /* td 정렬*/
    .txt_left {text-align: left !important;}
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
                <a href="/adminTotal/menuList" class="nav-link text-white active">
                메뉴 관리
                </a>
            </li>
            <li>
                <a href="/adminTotal/mail" class="nav-link text-white">
                받은 메일
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
                <h1>메뉴관리 상세보기</h1>
                <br/>
                
                <div class="container">
                <form action="/adminTotal/editMenu" method="post" name="frm">    
                    <input type="hidden" name="f_idx" value="${fvo.f_idx}"/>
                    <input type="hidden" name="f_image" id="f_image" value="${fvo.f_image}"/>
                    <input type="hidden" name="f_status" id="f_status" value="${fvo.f_status}"/>
                    <input type="hidden" name="seq" value="${fvo.seq}"/>
                    <input type="hidden" name="bestfoodyn" value="${fvo.bestfoodyn}"/>
                    <input type="hidden" name="premiumyn" value="${fvo.premiumyn}"/>
                    <input type="hidden" name="recommendyn" value="${fvo.recommendyn}"/>
                    <input type="hidden" name="cPage" value="${nowPage}"/>
                    <c:if test='${searchType != null}'>
                        <input type="hidden" name="searchType" value="${searchType}"/>
                    </c:if>
                    <c:if test='${searchValue != null}'>
                        <input type="hidden" name="searchValue" value="${searchValue}"/>
                    </c:if>
                    <table class="table mycustomtable" style="text-align: center;">
                        <tbody>
                            <tr>
                                <th>휴게소명</th>
                                <td class="txt_left"><input type="text" name="stdRestNm" id="stdRestNm" value="${fvo.stdRestNm}"/></td>
                            </tr>
                            <tr>
                                <th>메뉴명</th>
                                <td class="txt_left"><input type="text" name="foodNm" id="foodNm" value="${fvo.foodNm}"/></td>
                            </tr>
                            <tr>
                                <th>단가</th>
                                <td class="txt_left"><input type="text" name="foodCost" id="foodCost" value="${fvo.foodCost}"/></td>
                            </tr>
                            <tr>
                                <th>재료</th>
                                <td class="txt_left"><input type="text" name="foodMaterial" id="foodMaterial" value="${fvo.foodMaterial}" style="width:100%"/></td>
                            </tr>
                            <tr>
                                <th>상태</th>
                                <td class="txt_left">
                                    <div class="form-check form-switch">
                                        <input class="form-check-input" type="checkbox" id="f_stat" <c:if test="${fvo.f_status == '0'}">checked</c:if> onclick="changeStatus(this)">
                                        <label class="form-check-label" for="f_stat">
                                            <c:if test="${fvo.f_status == '3'}">
                                                대기
                                            </c:if>
                                            <c:if test="${fvo.f_status == '0'}">
                                                승인
                                            </c:if>
                                        </label>
                                    </div>
                                </td>
                            </tr>
                        </tbody>
                    </table>

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
                            <div class="row ms-1 me-1">
                                <label for="content" class="form-label"></label>
                                <textarea class="form-control content" name="etc" id="etc" placeholder="내용을 작성해 주세요." rows="7" required>${fvo.etc}</textarea>
                                <div class="invalid-feedback">
                                내용을 작성해 주세요.
                                </div>
                                <!-- <div class="valid-feedback">
                                    리뷰 감사합니다!
                                </div> -->
                            </div>
                            <div style="text-align: right;" class="my-3">
                                <button class="btn btn-outline-success me-2 mycustom-mem-btn" onclick="sendData()" type="button">저장</button>
                                <button class="btn btn-outline-success me-2 mycustom-mem-btn" onclick="viewList()" type="button">뒤로</button>
                            </div>  
                        </div>
                    </div>
                </form>    
                </div>
            </div>
            
        </div>
        <!-- 메인 컨텐츠 끝 -->
    </div>

    <form name="ff" action="/adminTotal/menuList" method="post">
        <input type="hidden" name="f_idx"/>
        <input type="hidden" name="cPage" value="${nowPage}"/>
        <c:if test='${searchType != null}'>
            <input type="hidden" name="searchType" value="${searchType}"/>
        </c:if>
        <c:if test='${searchValue != null}'>
            <input type="hidden" name="searchValue" value="${searchValue}"/>
        </c:if>
    </form>

    <!-----------경고창 모달---------------------->
    <div class="modal" id="modal1" tabindex="-1" aria-labelledby="signupModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered ">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="signupModalLabel">등록 실패</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    별점을 남겨주세요!
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn mycustom-mem-btn mo1btn" data-bs-dismiss="modal">확인</button>
                </div>
            </div>
        </div>
    </div>


<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"
    integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>

<script>
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
                console.log("삭제 완료");
                $("img").remove("#insertedImg");
                $("button").remove("#insertedBtn");
                $("#file").val(""); //파일 선택기 초기화
                
            }else{
                console.log("삭제 실패");
            }
        });
    }

    function sendData(){
        alert("메뉴가 추가되었습니다.");
        document.frm.submit();
    }

    function viewList(){
        document.ff.submit();
    }

    function changeStatus(obj){
        //console.log(obj.checked);
        if(obj.checked){
            $("#f_status").val("0");
            $(obj).next().text("승인");
        }else{
            $("#f_status").val("3");
            $(obj).next().text("대기");
        }
    }
</script>

</body>
</html>