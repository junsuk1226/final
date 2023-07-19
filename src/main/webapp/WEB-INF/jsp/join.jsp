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
        <title>내 손안에 휴게소-마이휴 회원가입 페이지</title>
    
        <style>
            .form-floating{
                min-width: 282px;
            }
            li{
                text-align: left;
                font-weight: bold;
            }
            

        </style>
    
    </head>
    <!------------------상단----------------->
        <div class ="container-fluid text-center my-6">
            <div class="row justify-content-center ">

                <div class="col-md-12 my-3">
                    <a href="/main"><img style="max-width: 300px;" src="../main_images/logo.png"/></a>
                </div>

            </div>
        </div>
        <!--------------본문---------------->
                <div class="container-fluid text-center mb-4">
                    <div class="row justify-content-center col-md-12">
                        <div  class="col-md-6">
                        <div class="card shadow-lg p-3 mb-5 bg-body rounded" style="border: none;">
                            <div class="card-body text-start">
                                <form action="/common/join" method="post" class="needs-validation" novalidate>
                                    <ul class="list-unstyled">
                                        <li class="mb-3" >Enter Email</li>
                                        <div class="form-floating mb-4">
                                            <input type="text" placeholder="Email" class="form-control" name = "j_email" id = "j_email" required>
                                            <label for="floatingInput" class="text-secondary" >ex) example@email.com</label>
                                            <div class="valid-feedback">
                                            </div>
                                            <div class="invalid-feedback" >
                                                이메일 형식이 올바르지 않습니다.
                                            </div>
                                        </div>
                                        
                                        <li class="">Create Password</li>
                                        <a class="mb-5 text-muted " style="font-size: small; text-align: left; text-decoration: none;">&nbsp;*8자 이상 입력해 주세요.</a>
                                        <div class="form-floating mb-4 mt-1">
                                            <input type="password" placeholder="Create password" class="form-control password" name = "j_password" id = "j_password" required>
                                            <label class="text-secondary" for="floatingInput" >비밀번호</label>
                                            <div class="valid-feedback">
                                            </div>
                                            <div class="invalid-feedback">
                                                비밀번호는 8자 이상 입력해야 합니다.
                                            </div>
                                        </div>
                                        
                                        <li class="mb-3">Confirm Password</li>
                                        <div class="form-floating mb-4">
                                            <input type="password" placeholder="Confirm password" class="form-control password" name = "j_confirmpassword" id = "j_confirmpassword" required>
                                            <label class="text-secondary" for="floatingInput">비밀번호 확인</label>
                                            <div class="valid-feedback">
                                            </div>
                                            <div class="invalid-feedback">
                                                비밀번호가 다릅니다.
                                            </div>
                                        </div>
                                        
                                        <li class="mb-3">Nickname</li>
                                        <div class="form-floating mb-4">
                                            <input type="text" placeholder="Nickname" class="form-control input" name = "j_nickname" id = "j_nickname" required>
                                            <label class="text-secondary" for="floatingInput">ex) 홍길동</label>
                                            <div class="valid-feedback">
                                            </div>
                                            <div class="invalid-feedback">
                                                닉네임을 입력하세요.
                                            </div>
                                        </div>
                                        
                                        <li class="">PhoneNumber</li>
                                        <a class="mb-5 text-muted " style="font-size: small; text-align: left; text-decoration: none;">&nbsp;*기호 또는 공백을 제외하고 입력해 주세요.</a>
                                        <div class="form-floating mb-5 mt-1">
                                            <input type="text" placeholder="PhoneNumber" class="form-control input" name = "m_phone" id = "m_phone" required>
                                            <label class="text-secondary" for="floatingInput">ex) 01012345678</label>
                                            <div class="valid-feedback">
                                            </div>
                                            <div class="invalid-feedback">
                                                올바른 휴대폰 번호를 입력해주세요.
                                            </div>
                                        </div>
        
                                        <div class="col-6 d-grid gap-2  mx-auto">
                                            <button type="button" class="btn btn-dark " style="min-height: 50px;" onclick="send(this.form)">일반 회원가입</button>
                                        </div>
                                    </ul>
                                </form>
                            <hr>
                            <div class="form-link text-center">
                                <span>이미 계정을 가지고 계신가요? <a href="login" class="link-secondary">Login</a></span>
                            </div>
                        </div>
    
                        <div class="line"></div>
    
                        <div class="media-options mb-2">
                            <a href="https://kauth.kakao.com/oauth/authorize?client_id=c691b066d7c57c4085e1fa5fc3e2c47b&redirect_uri=https://rest.o-r.kr/kakao/login&response_type=code">
                                <img style="width: 282px;" src="images/kakao_login.png">
                            </a>
                        </br>
                        </div>
    
                        <div class="media-options mb-5">
                            <a href="https://nid.naver.com/oauth2.0/authorize?client_id=6BPvD8rTeGLnG7fdps1C&redirect_uri=https://rest.o-r.kr/naver/login&response_type=code&state=test">
                                <img style="width: 282px;" src="images/naver_login.png">
                            </a>
                        </div>
                    </div>
                    </div>
                </div>
            </div>
                <!---------------------------footer------------------------>
                <div class="d-flex flex-column">
                    <footer id="sticky-footer" class="flex-shrink-0 py-4 bg-dark text-white-50">
                      <div class="container text-center">
                        <small>Copyright &copy; 2023 마이휴 </small>
                      </div>
                    </footer>
                </div>

                <!---------------------------모달------------------------>
                <div class="modal" id="modal1" tabindex="-1" aria-labelledby="signupModalLabel" aria-hidden="true">
                    <div class="modal-dialog modal-dialog-centered">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title" id="signupModalLabel">가입 완료</h5>
                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                            </div>
                            <div class="modal-body">
                                가입이 완료되었습니다!
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-dark mo1btn" data-bs-dismiss="modal">확인</button>
                            </div>
                        </div>
                    </div>
                </div>
                <input type="hidden" id="email_chk" value="0"/>
                <!---------------------------이메일 검사 모달------------------------>
                <div class="modal" id="modal2" tabindex="-1" aria-labelledby="signupModalLabel" aria-hidden="true">
                    <div class="modal-dialog modal-dialog-centered">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title" id="signupModalLabel">가입 불가</h5>
                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                            </div>
                            <div class="modal-body">
                                이미 가입된 이메일입니다.
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-dark" data-bs-dismiss="modal">확인</button>
                            </div>
                        </div>
                    </div>
                </div>



                <!-- JavaScript -->
                <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
                        integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
                        crossorigin="anonymous"></script>
                    <script src="https://code.jquery.com/jquery-3.6.0.min.js"
                        integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
                        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
                    <script>
                        function send(form){
                            let check1 = /^[a-zA-Z0-9]+@[a-z]+\.[a-zA-Z]{2,3}$/i; // 아이디 이메일 형식 검사
                            let check2 = /^[a-zA-Z0-9]{8,}$/i;
                            let check3 = /^010[0-9]{8}$/; // 휴대폰 번호 형식 검사

                           

                            let j_email = $("#j_email").val();
                            let j_password = $("#j_password").val();
                            let j_confirmpassword = $("#j_confirmpassword").val();
                            let j_nickname = $("#j_nickname").val();
                            let m_phone = $("#m_phone").val();
                            
                            if(j_email.trim().length < 1){
                                $("#j_email").removeClass("is-valid");
                                $("#j_email").addClass("is-invalid");
                                $("#j_email").focus();
                                return;
                            }else{
                                $("#j_email").removeClass("is-invalid");
                                $("#j_email").addClass("is-valid"); 
                            }
        
                            if(!check1.test(j_email)){
                                $("#j_email").removeClass("is-valid");
                                $("#j_email").addClass("is-invalid");

                                $("#j_email").focus();
                                return;
                            }else{
                                $("#j_email").removeClass("is-invalid");
                                $("#j_email").addClass("is-valid"); 
                            }
        
                            if(j_password.trim().length < 1){
                                $("#j_password").removeClass("is-valid");
                                $("#j_password").addClass("is-invalid");

                                $("#j_password").focus();
                                return;
                            }else{
                                $("#j_password").removeClass("is-invalid");
                                $("#j_password").addClass("is-valid"); 
                            }
                            
                            if(!check2.test(j_password)){
                                $("#j_password").removeClass("is-valid");
                                $("#j_password").addClass("is-invalid");

                                $("#j_password").focus();
                                return;
                            }else{
                                $("#j_password").removeClass("is-invalid");
                                $("#j_password").addClass("is-valid"); 
                            }
                            
                            if(j_confirmpassword.trim() != j_password.trim()){
                                $("#j_confirmpassword").removeClass("is-valid");
                                $("#j_confirmpassword").addClass("is-invalid");

                                $("#j_confirmpassword").focus();
                                return;
                            }else{
                                $("#j_confirmpassword").removeClass("is-invalid");
                                $("#j_confirmpassword").addClass("is-valid"); 
                            }
                            
                            if(j_nickname.trim().length < 1){
                                $("#j_nickname").removeClass("is-valid");
                                $("#j_nickname").addClass("is-invalid");

                                $("#j_nickname").focus();
                                return;
                            }else{
                                $("#j_nickname").removeClass("is-invalid");
                                $("#j_nickname").addClass("is-valid"); 
                            }

                            if(!check3.test(m_phone)){
                                $("#m_phone").removeClass("is-valid");
                                $("#m_phone").addClass("is-invalid");

                                $("#m_phone").focus();
                                return;
                            }else{
                                $("#m_phone").removeClass("is-invalid");
                                $("#m_phone").addClass("is-valid"); 
                            }

                            let email_chk = $("#email_chk").val();
                            if(email_chk == '1'){
                                alert("이미 등록된 이메일입니다.");
                                $("#j_email").focus();
                                return;
                            }

                            // 비동기식통신
                            $.ajax({
                                url:"/common/join",
                                type: "post",
                                data:{"j_email":j_email, "j_password":j_password, "j_nickname":j_nickname, "m_phone":m_phone},
                                dataType:"json"
                            }).done(function(data){
                                if(data.commjoin_fail == "0")// 잘 저장된 경우
                                    $('#modal1').modal('show');
                                else{
                                    $("#j_email").val("");
                                    $('#modal2').modal('show');
                                }
                            })

                        }

                        // 모달 1 확인 버튼 클릭 이벤트 처리
                        $(document).ready(function() {
                            $('.mo1btn').on('click', function() {
                                window.location.href="/login"
                            });
                        });

                        

                        $(function(){

                            $("#j_email").on("keyup keypress",function(){
                                var str = $(this).val();
                                console.log(str+"::::::::::::::");
                                if(str.trim().length > 4){
                                    $.ajax({
                                        url: "/join/checkid",
                                        type: "post",
                                        data: {"email":str},
                                        dataType:"json"
                                    }).done(function(res){
                                        
                                        if(res.chk == true){
                                            $("#j_box").html("&nbsp;사용가능");
                                            $("#email_chk").val("0");
                                        }else{
                                            $("#j_box").html("&nbsp;사용불가능");
                                            $("#email_chk").val("1");
                                        }
                                    })
                                }else{
                                    $("#j_box").html("");
                                }
                            });
        
                            // if("${commjoin_fail}" == "commjoin_fail"){
                            //     alert("이미 가입된 이메일입니다.");
                            //     return;
                            // }
                        });
                        
                    </script>
                </html>