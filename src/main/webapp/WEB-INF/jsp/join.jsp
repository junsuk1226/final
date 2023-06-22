<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
            <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
                <!DOCTYPE html>
                <html class="no-js" lang="zxx">
                    <section class="container forms show-signup m_container">
                        <div class="form signup">
                            <div class="form-content">
                                <p class="m_header">회원가입</header>
                                <form action="/common/join" method="post">
                                    <div class="field input-field">
                                        <input type="text" placeholder="Email" class="input" name = "j_email" id = "j_email">
                                        <span id="j_box"></span> 
                                    </div>
        
                                    <div class="field input-field">
                                        <input type="password" placeholder="Create password" class="password" name = "j_password" id = "j_password">
                                    </div>
                                    
                                    <div class="field input-field">
                                        <input type="password" placeholder="Confirm password" class="password" name = "j_confirmpassword" id = "j_confirmpassword">
                                    </div>
        
                                    <div class="field input-field">
                                        <input type="text" placeholder="Nickname" class="input" name = "j_nickname" id = "j_nickname">
                                    </div>

                                    <div class="field input-field">
                                        <input type="text" placeholder="PhoneNumber" class="input" name = "m_phone" id = "m_phone">
                                    </div>
        
                                    <div class="field button-field">
                                        <button type="button" onclick="send(this.form)">일반 회원가입</button>
                                    </div>
                                </form>
        
                                <div class="form-link">
                                    <span>이미 계정을 갖고 계신가요? <a href="login" class="link login-link">Login</a></span>
                                </div>
                            </div>
        
                            <div class="line"></div>
        
                            <div class="media-options">
                                <a href="https://kauth.kakao.com/oauth/authorize?client_id=c691b066d7c57c4085e1fa5fc3e2c47b&redirect_uri=http://localhost:8080/kakao/join&response_type=code">
                                    <img src="images/kakao_login.png">
                                </a>
                            </br>
                            </div>
        
                            <div class="media-options">
                                <a href="https://nid.naver.com/oauth2.0/authorize?client_id=6BPvD8rTeGLnG7fdps1C&redirect_uri=http://localhost:8080/naver/join&response_type=code&state=test">
                                    <img src="images/naver_login.png">
                                </a>
                            </div>
        
                        </div>
                    </section>
                    
                    <body class="d-flex flex-column">
                        <footer id="sticky-footer" class="flex-shrink-0 py-4 bg-dark text-white-50">
                          <div class="container text-center">
                            <small>Copyright &copy; 2023 팀이름 </small>
                          </div>
                        </footer>
                    </body>
                    <!-- JavaScript -->
                    <script src="js/m_script.js"></script>
                    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
                        integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
                        crossorigin="anonymous"></script>
                    <script src="https://code.jquery.com/jquery-3.6.0.min.js"
                        integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
                    <script>
                        function send(form){
                            let check1 = /^[a-zA-Z0-9]+@[a-z]+\.[a-zA-Z]{2,3}$/i; // 아이디 이메일 형식 검사
                            let check2 = /^[a-zA-Z0-9]{8,}$/i;
                           

                            
                            let j_email = $("#j_email").val();
                            let j_password = $("#j_password").val();
                            let j_confirmpassword = $("#j_confirmpassword").val();
                            let j_nickname = $("#j_nickname").val();
                            let m_phone = $("#m_phone").val();
                            
                            if(j_email.trim().length < 1){
                                alert("이메일을 입력하세요");
                                $("#j_email").focus();
                                return;
                            }
        
                            if(!check1.test(j_email)){
                                alert("이메일 형식이 올바르지 않습니다.");
                                $("#j_email").focus();
                                return;
                            }
        
                            if(j_password.trim().length < 1){
                                alert("비밀번호를 입력하세요");
                                $("#j_password").focus();
                                return;
                            }
                            
                            if(!check2.test(j_password)){
                                alert("비밀번호는 8자 이상 입력해야 합니다.");
                                $("#j_password").focus();
                                return;
                            }
                            
                            if(j_confirmpassword.trim() != j_password.trim()){
                                alert("비밀번호가 다릅니다.");
                                $("#j_confirmpassword").focus();
                                return;
                            }
                            
                            if(m_phone.trim().length < 1){
                                alert("휴대폰 번호를 입력해주세요.")
                                $("#m_phone").focus();
                                return;
                            }

                            if(j_nickname.trim().length < 1){
                                alert("닉네임을 입력하세요");
                                $("#j_nickname").focus();
                                return;
                            }
                            form.submit();
                        }
                        
                        $(function(){
                            $("#j_email").bind("keyup", function(){
                                var str = $(this).val();
                                if(str.trim().length > 4){
                                    $.ajax({
                                        url: "/join/checkid",
                                        type: "post",
                                        data: {"email":str},
                                        dataType:"json"
                                    }).done(function(res){
                                        if(res.chk == true && check1.test(str)){
                                            $("#j_box").html("&nbsp;사용가능");
                                        }else{
                                            $("#j_box").html("&nbsp;사용불가능");
                                        }
                                    })
                                }else{
                                    $("#j_box").html("");
                                }
                            });
        
                            if("${commjoin_fail}" == "commjoin_fail"){
                                alert("이미 가입된 이메일입니다.");
                                return;
                            }
                        });
                        
                    </script>
                </html>