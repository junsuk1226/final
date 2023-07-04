<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>

        <html lang="en">

        <head>
            <meta charset="utf-8" />
            <meta http-equiv="X-UA-Compatible" content="IE=edge">

            <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
            <meta name="description" content="" />
            <meta name="author" content="" />
            <title>Simple Sidebar - Start Bootstrap Template</title>
            <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
            <!-- Core theme CSS (includes Bootstrap)-->
            <link href="css/styles.css" rel="stylesheet" />
            <link href="css/bootstrap.css" rel="stylesheet" />
            <!-- 새로추가 -->
            <link rel="stylesheet" href="//code.jquery.com/ui/1.13.0/themes/base/jquery-ui.css">
            <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css" />


            <link rel="stylesheet" href="../css/main_custom.css" />

            <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
            <script src="https://code.jquery.com/ui/1.13.0/jquery-ui.js"></script>
                
            <!--별 아이콘-->
            <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">
            <style media="screen">

                .rating {
                width: 240px;
                padding: 10px;
                margin:0 auto;
                position: relative;
                direction: rtl;
                }
            
                .rating input {
                position: absolute;
                width: 40px;
                height: 50px;
                cursor: pointer;
                transform: translateX(52px);
                opacity: 0;
                z-index: 5;
                }

                .rating input:nth-of-type(1) {
                right: 63px;
                }
                .rating input:nth-of-type(2) {
                right: 108px;
                }
                .rating input:nth-of-type(3) {
                right: 153.5px;
                }
                .rating input:nth-of-type(4) {
                right: 198px;
                }
                .rating input:nth-of-type(5) {
                right: 242px;
                }
                .rating input:nth-of-type(6) {
                right: 300px;
                }
                .rating input:checked ~ .star:after, .rating input:hover ~ .star:after {
                content: '\f005';
                }
                .rating .star {
                display: inline-block;
                font-family: FontAwesome;
                font-size: 42px;
                color: #FBB202;
                cursor: pointer;
                margin: 0px;
                
                }
                .rating .star:after {
                content: '\f006';
                }
                .rating .star:hover ~ .star:after, .rating .star:hover:after {
                content: '\f005';
                
                }

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
                    <!-- Favicon-->
                </head>

                <body>
                    <div class="d-flex" id="wrapper">
                        <!-- Sidebar-->
                    <div class="border-end bg-white" id="sidebar-wrapper">
                        <div class="sidebar-heading border-bottom bg-light"> <a href="/main"><img style="max-width: 200px;"
                                    src="../main_images/logo.png"></a></div>
                        <div class="list-group list-group-flush">
                            <a class="list-group-item list-group-item-action list-group-item-light p-3" href="/myPage">마이
                                페이지</a>
                            <a class="list-group-item list-group-item-action list-group-item-light p-3" href="/info">회원정보 수정</a> <a
                                class="list-group-item list-group-item-action list-group-item-light p-3" href="/order">주문
                                내역</a> <a class="list-group-item list-group-item-action list-group-item-light p-3" href="/review">리뷰 관리</a>
                            <a class="list-group-item list-group-item-action list-group-item-light p-3" href="/cart">내
                                장바구니</a>
                        </div>
                    </div>
                        <!-- Page content wrapper-->
                        <div id="page-content-wrapper">
                            <!-- Top navigation-->
                            <nav class="navbar navbar-expand-lg navbar-light bg-light border-bottom">
                                <div class="container-fluid">
                                    <button class="btn btn-outline-success me-2 mycustom-mem-btn" id="sidebarToggle">메뉴</button>
                                    <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
                                        data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent"
                                        aria-expanded="false" aria-label="Toggle navigation">
                                        <span class="navbar-toggler-icon"></span>
                                    </button>
                                    <div class="collapse navbar-collapse" id="navbarSupportedContent">
                                        <ul class="navbar-nav ms-auto mt-2 mt-lg-0">
                                            <li class="nav-item active"><a class="nav-link" href="/main">홈</a></li>
                                            <li class="nav-item"><a class="nav-link" href="/logout">로그아웃</a></li>
                                           
                                        </ul>
                                    </div>
                                </div>
                            </nav>
                            <!-- Page content-->
                            <div class="container-fluid">
                                <div class="row justify-content-center mt-5">
                                    <div class="col-md-9 mb-3 ">
                                        <div class="col-md-12 my-3 ms-2 justify-content-center">
                                            <h2 class="text-muted lh-base ms-1" style="font-family: 'suite'">
                                                <span style="color: black;">${sessionScope.mvo.m_name}</span>님,
                                                <br/><span style="color: black;">${param.r_restNm}</span>는 어떠셨나요? 
                                                <br/>리뷰와 별점을 남겨주세요!
                                            </h2>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="row justify-content-center">
                                <div class="col-md-9 ">
                                    <form action="/writeReview" name="frm" method="post">
                                        <!-- <input type="hidden" name="restCd"/>
                                        <input type="hidden" name="r_restNm"/> -->
                                        <input type="hidden" name="restCd" value="1"/>
                                        <input type="hidden" name="r_restNm" value="${rvo.r_restNm}" />
                                        <input type="hidden" name="m_idx" value="${sessionScope.mvo.m_idx}"/>
                                        <input type="hidden" name="m_name" value="${sessionScope.mvo.m_name}"/>
                                        <input type="hidden" name="r_file" />
                                        
                                        
                                            <div class="card shadow p-3 mb-5 bg-body rounded mx-1" style="border: none;">
                                                <div class="row card-body justify-content-around">
                                                    <div class="col-md-4 my-3  justify-content-center">
                                                        <div class="rating">
                                                            <input type="radio" name="r_score" id="r_score" value="5"/><span class="star"></span>
                                                            <input type="radio" name="r_score" id="r_score" value="4"/><span class="star"></span>
                                                            <input type="radio" name="r_score" id="r_score" value="3"/><span class="star"></span>
                                                            <input type="radio" name="r_score" id="r_score" value="2"/><span class="star"></span>
                                                            <input type="radio" name="r_score" id="r_score" value="1"/><span class="star"></span>
                                                        </div>
                                                    </div>
                                                
                                                    <div class ="row ms-1 mb-3">
                                                        <div class=" input-group">
                                                            <label for="file">
                                                                <div style="height: 100px; width: 150px; margin: 0 auto;" class="hover-fade">
                                                                    <img src="../main_images/addfile.png" style='object-fit:cover; width: 100%; height:100%; cursor: pointer;' class='rounded shadow mb-5' alt="inputFile"/>
                                                                </div>
                                                            </label>
                                                            <input type="file" class="form-control " id="file" name="file" style="display: none;">
                                                            <div class="ms-3">
                                                                <div style="background-color: rgb(241, 241, 241); border-radius: 6px; height: 100px; width: 150px; margin: 0 auto;" id="img_area"> </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="row ms-1 me-1">
                                                        <label for="content" class="form-label"></label>
                                                        <textarea class="form-control content" name="r_content" id="content" placeholder="리뷰를 작성해 주세요." rows="7" required></textarea>
                                                        <div class="invalid-feedback">
                                                        내용을 작성해 주세요.
                                                        </div>
                                                        <div class="valid-feedback">
                                                            리뷰 감사합니다!
                                                        </div>
                                                    </div>
                                                    <div style="text-align: right;" class="my-3">
                                                        <button class="btn btn-outline-success me-2 mycustom-mem-btn" onclick="sendData()" type="button">저장</button>
                                                    </div>  
                                                </div>
                                            </div>
                                         
                                    </form>
                                    
                                </div>
                            </div>


                            
                                <!-- footer 시작---------------------------------------------------------------------------------------------->
                                <!-- <body class="d-flex flex-column"> -->
                                <footer id="sticky-footer" class="flex-shrink-0 py-4 bg-dark text-white-50 mycustom-main_footer">
                                    <div class="container text-center">
                                        <small>Copyright &copy; 2023 쉬-잇 </small>
                                    </div>
                                </footer>
                            
                                <!-- </body>  -->
                                <!-- footer 끝---------------------------------------------------------------------------------------------->
                            
                            </div>
                        </div>
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


                    <script type="text/javascript" src="js/bootstrap.js"></script>

                    <!-- 제이쿼리 -->
                    <script src="https://code.jquery.com/jquery-3.7.0.min.js" integrity="sha256-2Pmvv0kuTBOenSvLm6bvfBSSHrUJ+3A7x6P5Ebd07/g=" crossorigin="anonymous"></script>


                    <!-- 합쳐지고 최소화된 최신 자바스크립트 -->
                    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
                    </script>



                    <!-- Bootstrap core JS-->
                    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
                    <!-- Core theme JS-->
                    <script src="js/scripts.js"></script>

                    <script>
                        var savedpath ="";
                        var savedfname =""

                        $(function(){
                            $("#file").bind("change", function(){
                                //console.log("DDDDDD");
                                let fileInput = document.getElementById('file');
                                
                                
                                var file = fileInput.files[0];
                                
                                var formData = new FormData();
                                formData.append('file', file);
                                
                                
                                $.ajax({
                                    url: "/saveImg",
                                    type: "post",
                                    data: formData,
                                    contentType:false, //파일 전송 시
                                    processData:false, //파일 전송 시
                                    cache: false,      //파일 전송 시
                                    dataType: "json"
                               }).done(function(data){
                                    //console.log(data.path+"/"+data.fname);
                                    savedpath=data.path;
                                    savedfname=data.fname;
                                    $("#img_area").html("<img src='"+data.path+"/"+data.fname+"' style='object-fit:cover; width: 100%; height:100%' class='rounded shadow mb-5' id='insertedImg'/><button type='button' onclick='delImg()' class='btn-del' id='insertedBtn'><i class='fa fa-times' style ='color: #fff'></i></button> ")
                                    document.frm.r_file.value=data.fname;
                               });
                            });
                        });

                     

                        function uploadFile() {
                            var fileInput = document.getElementById('file');
                          
                                var file = fileInput.files[0];
                                
                                var formData = new FormData();
                                formData.append('file', file);
                               $.ajax({
                                    url: "/saveImg",
                                    type: "post",
                                    data: formData,
                                    dataType: "json"
                               }).done(function(data){
                                    console.log(data.path+"/"+data.fname);
                                    
                                    document.frm.r_file.value=data.fname;
                               });
                        }

                        function delImg(){

                            $.ajax({
                                url:"/delImg",
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
                            if ($('input[name="r_score"]:checked').length <= 0 ){
                                $('#modal1').modal('show');
                                return;
                            }
                            
                           

                            if($('#content').val().trim().length <= 0){
                                $("#content").removeClass("is-valid");
                                $("#content").addClass("is-invalid");
                                $("#content").focus();
                                return;
                            }else{
                                $("#content").removeClass("is-invalid");
                                $("#content").addClass("is-valid"); 
                            }

                            document.frm.submit();
                        }

                        function writeReview() {

                            document.frm.action="/writeReview";
                            document.frm.submit();
                        }

                       
                        


                    </script>
                </body>

                </html>