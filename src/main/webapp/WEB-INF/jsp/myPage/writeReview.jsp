<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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

            <link rel="stylesheet" href="/css/summernote-lite.css">

            <link rel="stylesheet" href="../css/main_custom.css" />

            <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
            <script src="https://code.jquery.com/ui/1.13.0/jquery-ui.js"></script>
                
            <!--별 아이콘-->
            <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">
            <style media="screen">
            .note-editor.note-frame{
                border: none;
            }
            .note-toolbar{
                background-color: #ffffff;
            }
            .note-resizebar{
                background-color: #ffffff;
            }

              .rating {
              width: 240px;
              padding: 10px;
              margin:0 auto;
              position: relative;
              direction: rtl;
              }
        
              .rating input {
              position: absolute;
              width: 35px;
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
                            <a class="list-group-item list-group-item-action list-group-item-light p-3" href="/info">회원정보수정</a> <a
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
                                            <li class="nav-item dropdown"><a class="nav-link dropdown-toggle"
                                                    id="navbarDropdown" href="#" role="button" data-bs-toggle="dropdown"
                                                    aria-haspopup="true" aria-expanded="false">박스</a>
                                                <div class="dropdown-menu dropdown-menu-end"
                                                    aria-labelledby="navbarDropdown">
                                                    <a class="dropdown-item" href="#!">공지사항</a> <a
                                                        class="dropdown-item" href="#!">이벤트</a>
                                                        <a class="dropdown-item" href="#!">고객센터</a>
                                                    <div class="dropdown-divider"></div>
                                                    <a class="dropdown-item" href="#!">환경설정</a>
                                                </div>
                                            </li>
                                        </ul>
                                    </div>
                                </div>
                            </nav>
                            <!-- Page content-->

                            <div class="row justify-content-center">
                                <div class="col-md-9 ">
                                    <form action="/writeReview" name="frm" method="post">
                                        <!-- <input type="hidden" name="restCd"/>
                                        <input type="hidden" name="r_restNm"/> -->
                                        <input type="hidden" name="restCd" value="1"/>
                                        <input type="hidden" name="r_restNm" value="가평(춘천)휴게소" />
                                        <input type="hidden" name="m_idx" value="${sessionScope.mvo.m_idx}"/>
                                        <input type="hidden" name="m_name" value="${sessionScope.mvo.m_name}"/>
                                        <input type="hidden" name="r_file" />

                                        
                                        <div class = "col-md-10 ms-1 me-1">
                                            <div class="card" style="border: none;">
                                                <div class="row card-body justify-content-around">
                                                    <div class="col-md-12 my-3 ms-2 justify-content-center">
                                                        <h2 class="text-muted lh-base " style="font-family: 'suite'">
                                                            <span style="background-color: antiquewhite;">${sessionScope.mvo.m_name}</span>님,
                                                            <br/><span style="background-color: antiquewhite;">${param.r_restNm}</span>는 어떠셨나요? 
                                                            <br/>리뷰와 별점을 남겨주세요!
                                                        </h2>
                                                    </div>
                                                    <div class="col-md-3 my-3 me-5 justify-content-center">
                                                        <div class="rating">
                                                            <input type="radio" name="r_score" id="r_score" value="5"/><span class="star"></span>
                                                            <input type="radio" name="r_score" id="r_score" value="4"/><span class="star"></span>
                                                            <input type="radio" name="r_score" id="r_score" value="3"/><span class="star"></span>
                                                            <input type="radio" name="r_score" id="r_score" value="2"/><span class="star"></span>
                                                            <input type="radio" name="r_score" id="r_score" value="1"/><span class="star"></span>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class ="row">
                                                <div class="ms-1 me-2 input-group">
                                                    <input type="file" class="form-control " id="file" onchange="uploadFile()" name="file">
                                                </div>
                                            </div>
                                            <div class="row ms-1 me-1">
                                                <label for="content" class="form-label"></label>
                                                <textarea class="form-control content" name="r_content" id="content" placeholder="리뷰를 작성해 주세요." rows="10" required></textarea>
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
                                        <button type="button" class="btn btn-dark mo1btn" data-bs-dismiss="modal">확인</button>
                                    </div>
                                </div>
                            </div>
                        </div>


                    <script type="text/javascript" src="js/bootstrap.js"></script>

                    <!-- 제이쿼리 -->
                    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js">
                    </script>

                    <!-- summernote -->
                    <script src="/js/summernote-lite.js"></script>
	                <script src="/js/lang/summernote-ko-KR.js"></script>

                    <!-- 합쳐지고 최소화된 최신 자바스크립트 -->
                    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
                    </script>



                    <!-- Bootstrap core JS-->
                    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
                    <!-- Core theme JS-->
                    <script src="js/scripts.js"></script>

                    <script>

                        // $(function() {
                        //     $('#content').summernote({
                        //         height: 400,                 // 에디터 높이
                        //         minHeight: null,             // 최소 높이
                        //         maxHeight: null,             // 최대 높이
                        //         focus: true,                  // 에디터 로딩후 포커스를 맞출지 여부
                        //         lang: "ko-KR",					// 한글 설정
                        //         placeholder: '최대 2048자까지 쓸 수 있습니다.',	//placeholder 설정
                        //         callbacks:{
                        //             onImageUpload: function(files, editor){
                        //                 //이미지가 에디터에 들어오면 수행하는 곳-이미지는 배열로 저장된다.
                        //                 for(var i = 0; i<files.length; i++)
                        //                     sendImg(files[i], editor);//서버와 비동기식 통신을 하는 함수 호출
                                        
                        //             }
                        //         }
                        //     });
                        // });

                        // function sendImg(file, editor){
                        //     //이미지 파일을 첨부하여 서버로 보내야 하기 때문에 
                        //     //이미지가 아니면 {"type":1, "value":"TEST"} 이런 식으로 파라미터를 만들면 된다.
                        //     //하지만 파일을 보낼 때는 FormData를 활용해야 한다.
                        //     var frm = new FormData();
                            
                        //     //보내고자 하는 파일을 FormData에 저장!
                        //     frm.append("s_file", file); //나중에 서버에서 현재 파일을 받을 때는
                        //                                 //반드시 s_file이라는 파라미터 이름으로 받아야 한다.
                        //     $.ajax({
                        //         url:"/saveImg",
                        //         data: frm,
                        //         type: "post",
                        //         contentType:false,
                        //         processData:false,
                        //         cache: false,
                        //         dataType: "json"
                        //     }).done(function(data){
                        //         let path = data.path;
                        //         let fname = data.fname;
                                
                        //         $("#content").summernote("insertImage", path+"/"+fname); //editor.insertImage했더니 안됐음!!
                        //     });
                            
                        // }
                        function uploadFile() {
                            var fileInput = document.getElementById('file');
                          
                                var file = fileInput.files[0];
                                
                                var formData = new FormData();
                                formData.append('file', file);

                                var xhr = new XMLHttpRequest();
                                xhr.open('POST', '/saveImg', true);
                                xhr.setRequestHeader("X-Requested-With", "XMLHttpRequest");
                                xhr.onload = function () {
                                    if (xhr.status === 200) {
                                        console.log('파일 업로드 성공');
                                        var responseData = JSON.parse(xhr.responseText);
                                        var fileName = responseData.fname; // 저장된 파일명
                                        
                                        document.getElementsByName('r_file')[0].value=fileName;
                                        
                                    } else {
                                        console.log('파일 업로드 실패');
                                    }
                                };
                                xhr.send(formData);
                            
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