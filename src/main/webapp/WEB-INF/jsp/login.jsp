<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
    <!DOCTYPE html>
    <html class="no-js" lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css" />
        
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css" />
        <link rel="stylesheet" href="../css/main_custom.css" />
        <!--애니메이션 cdn-->
        <title>내 손안에 휴게소-마이휴 로그인 페이지</title>
        <style>
            .input_area{
                width: 100%; /* 또는 필요한 크기로 조정 */
                margin: 0 auto; /* 가운데 정렬 */
                min-width: 370px;
                max-width: 370px;
            }
        </style>
    
    
    </head>
    
    <body onload="init()">


        <!------------------상단----------------->
        <div class ="container-fluid text-center my-5">
            <div class="row justify-content-center my-4 ">
                <div class="col-md-12">
                    <a href="/main"><img style="max-width: 300px;" src="../main_images/logo.png"></a>  
                </div>
            </div>
        </div>
        <!-----------------본문--------------------->
        <div class="container-fluid mb-5">
            <div class="row justify-content-center mb-5">
                <div class="col-md-12 mb-5">
                    <div class="input_area col-md-12 mx-auto card shadow-lg p-3 mb-5 bg-body rounded" style="margin: 0 auto; border:none; " >
                        <div class="card-body">
                        <form id="login" action="/reqLogin" class="input-group my-5" method="post" name="frm" novalidate>
                            <div class="row align-items-center">
                                <div class="col-md-12">
                                    <div class="login_search">
                                        <!--

                                            <div class="chk_group mb-2 d-flex justify-content-end">
                                                
                                                <input type="checkbox" name="chk" id="ch01" class="form-check-input" />
                                                <label for="ch01">&nbsp;ID 저장</label>
                                            </div>
                                        -->
                                    </div>
                                </div>
                                
                                <div class="col-md-12">
                                    <div class="form-floating mb-3">
                                        <input type="text" placeholder="아이디" class="form-control" id="m_id" name="m_id" required/>
                                        <label for="m_id">아이디</label>
                                        <div class="invalid-feedback">
                                            아이디를 입력하세요!
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-12">
                                    <div class="form-floating mb-3">
                                        <input type="password" placeholder="비밀번호" class="form-control" id="m_pw" name="m_pw" required/>
                                        <label for="m_pw">비밀번호</label>
                                        <div class="invalid-feedback">
                                            비밀번호를 입력하세요!
                                        </div>
                                    </div>
                                </div>
                            
                                <div class="col-md-12">
                                    <div class="d-grid ">
                                        <button type="button" class="btn btn-outline-success me-2 mycustom-mem-btn" style="height: 58px;" onclick="sendData()">로그인</button>
                                    </div>
                                </div>
                                <div class="form-link mb-3 mx-auto d-flex justify-content-center my-3">
                                    <span>마이휴 계정이 없으신가요? <a href="/join" class="link-secondary">Signup</a></span>
                                </div>
                            </div>
                        </form>

                        <div class="row align-items-center">
                            <div class="col-md-12">
                                <div class="d-flex justify-content-between align-items-center my-1">
                                    <hr style="width: 100%; border: 1px solid #000;">
                                </div>
                                <div class="d-flex justify-content-between align-items-center">
                                    <div class="media-options  mb-2 mx-auto">
                                        <a href="https://kauth.kakao.com/oauth/authorize?client_id=c691b066d7c57c4085e1fa5fc3e2c47b&redirect_uri=http://localhost:8080/kakao/login&response_type=code">
                                            <img style="width: 306px;" src="../images/kakao_login.png">
                                        </a>
                                    </div>
                                </div>
                                <div class="d-flex justify-content-between align-items-center ">
                                    <div class="media-options  mb-3 mx-auto">
                                        <a href="https://nid.naver.com/oauth2.0/authorize?client_id=py8uuUtaAKsCCxoOKiY3&redirect_uri=http://localhost:8080/naver/login&response_type=code&state=test">
                                            <img style="width: 306px;" src="../images/naver_login.png">
                                        </a>
                                    </div>
                                </div>
                                
                            </div>
                        </div>
                        </div>
                    </div>
                    </div>
                </div>
            </div>
              <!-- footer 시작---------------------------------------------------------------------------------------------->
            <div class="d-flex flex-column">
                <footer id="sticky-footer" class="flex-shrink-0 py-4 bg-dark text-white-50">
                  <div class="container text-center">
                    <small>Copyright &copy; 2023 팀이름 </small>
                  </div>
                </footer>
            </div> 
    <!-- footer 끝---------------------------------------------------------------------------------------------->
        <input type="hidden" id="flag" value="${alat}"/>  
        
        <!---------------------------모달------------------------>
        <div class="modal" id="modal1" tabindex="-1" aria-labelledby="signupModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered ">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="signupModalLabel">로그인 실패</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        아이디 또는 비밀번호를 잘못 입력했습니다.
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-dark mo1btn" data-bs-dismiss="modal">확인</button>
                    </div>
                </div>
            </div>
        </div>

        <!--부트스트랩 js cdn-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"
            integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
        
        <script>
            function sendData() {
                if ($("#m_id").val().trim().length <= 0) {
                    $("#m_id").removeClass("is-valid");
                    $("#m_id").addClass("is-invalid");
                    $("#m_id").focus();
                    return;
                }else{
                     $("#m_id").removeClass("is-invalid");
                     $("#m_id").addClass("is-valid"); 
                }

                if ($("#m_pw").val().trim().length <= 0) {
                    $("#m_pw").removeClass("is-valid");
                    $("#m_pw").addClass("is-invalid");
                    $("#m_pw").focus();
                    return;
                }else{
                     $("#m_pw").removeClass("is-invalid");
                     $("#m_pw").addClass("is-valid"); 
                }
                
                document.frm.submit();
            }

            function init(){
                let alat = $("#flag").val();
                if (alat == "alat") {
                    $('#modal1').modal('show');
                }
            }
        </script>
    </body>
    
    </html>