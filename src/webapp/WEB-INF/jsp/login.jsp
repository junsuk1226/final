<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
    <!DOCTYPE html>
    <html class="no-js" lang="zxx">
    <html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
    </head>
    
    <body>
        <div class="content-fluid">
            <div class="row justify-content-center">
                <div class="col-md-6">
                    <form id="login" action="/login" class="input-group" method="post" name="frm">
                        <div class="input_area col-md-12">
                            <div>
                                <input type="text" placeholder="아이디" class="input" id="m_id" name="m_id" />
                            </div>
                            <div>
                                <input type="password" placeholder="비밀번호" class="password" id="m_pw" name="m_pw" />
                            </div>
                        </div>
                        <div class="btnArea_right col-md-12">
                            <button type="button" class="submit" onclick="sendData()">로그인</button>
                        </div>
                        <div class="fclear"></div>
                        <p class="login_search  col-md-12">
                            <span class="chk_group">
                                <input type="checkbox" name="chk" id="ch01" />
                                <label for="ch01">아이디저장</label>
                            </span>
                            <span class="btn b_search">
                                <a href="">아이디/비밀번호찾기</a>
                            </span>
                        </p>
                    </form>
                </div>
            </div>
        </div>
            <!--.container div 끝-->

            <div class="form-link">
                <span>회원가입 하시겠습니까? <a href="/join" class="link">Signup</a></span>
            </div>
            <div class="media-options">
                <a href="https://kauth.kakao.com/oauth/authorize?client_id=c691b066d7c57c4085e1fa5fc3e2c47b&redirect_uri=http://localhost:8080/kakao/join&response_type=code">
                    <img src="../images/kakao_login.png">
                </a>
                </br>
            </div>
            <div class="media-options">
                <a href="https://nid.naver.com/oauth2.0/authorize?client_id=6BPvD8rTeGLnG7fdps1C&redirect_uri=http://localhost:8080/naver/join&response_type=code&state=test">
                    <img src="../images/naver_login.png">
                </a>
            </div>
        <!--부트스트랩 js cdn-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"
            integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
        <script>
            function sendData() {
                if ($("#m_id").val().trim().length <= 0) {
                alert("아이디를 입력하세요!");
                ("#m_id").focus();
                return;
                }
                if ($("#m_pw").val().trim().length <= 0) {
                    alert("비밀번호를 입력하세요!");
                    $("#m_pw").focus();
                    return;
                }
                if ("${alat}" == "alat") {
                    alert("아이디 또는 비밀번호를 잘못 입력했습니다.");
                    return;
                }
                document.frm.submit();
            }
        </script>
    </body>
    
    </html>