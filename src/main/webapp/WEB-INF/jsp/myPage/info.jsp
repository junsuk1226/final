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
            <link rel="stylesheet" href="../css/main_custom.css" />
           
            <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
            <script src="https://code.jquery.com/ui/1.13.0/jquery-ui.js"></script>
              <!--아이콘 cdn-->
              <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">
            <style>
                table {
                    width: 800px;
                    border-collapse: collapse;
                }

                table th,
                table td {
                    /*border: 2px solid black;*/
                    padding: 4px;
                }

                table caption {
                    text-indent: -9999px;
                    height: 0;
                }

                .popup {
                    display: none;
                }

                .empty {
                    height: 50px;
                    color: #ababab;
                }

                /*아이콘 css*/
                .phone{
                        color: #6600db;
                    }
                .phone:hover {
                    color: #b699ee;
                    cursor: pointer;
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
                        <a class="list-group-item list-group-item-action list-group-item-light p-3"
                            href="/info">회원정보 수정</a> <a
                            class="list-group-item list-group-item-action list-group-item-light p-3" href="/order">주문
                            내역</a> <a class="list-group-item list-group-item-action list-group-item-light p-3"
                            href="/review">리뷰 관리</a> <a
                            class="list-group-item list-group-item-action list-group-item-light p-3" href="/cart">내
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
                            <div class="col-md-9 mb-3">
                                    <h2 class=" lh-base mt-5 ms-1" style="font-family: 'suite'">
                                        <span class="text-muted">회원정보 수정</span>
                                    </h2>
                            </div>
                        </div>
                    </div>

                    <div class="container-fluid mb-4">
                        <div class="row justify-content-center col-md-12 my-5">
                            <div  class="col-md-9">
                                 <div class="card shadow p-3 mb-5 bg-body rounded justify-content-center" style="border: none;">
                                    <div class="card-body">
                                        <div class="row justify-content-end ">
                                            <div class="col-6 mb-2 float-end text-end" href="/infopw">
                                                <a class=" arrow nav-link" href="/infopw" style="font-family: 'suite'; font-weight: bold; color: #887e94; font-size: large;" >비밀번호 변경<i class="fa fa-arrow-right ms-2" aria-hidden="true"></i></a>
                                            </div>
                                        </div>
                                        <hr/>
                                        <div class=" row ">
                                        <form action="/myPage/info" method="post" class="needs-validation" novalidate >
                                            <ul class="list-unstyled">
                                                <li class="mb-3 fw-bold">Your Email</li>
                                                <div class="input-group-lg mb-5">
                                                    <input type="text" placeholder="Email" class="text-muted form-control"  name="j_email" id="j_email" required value="${sessionScope.mvo.m_id}" disabled>
                                                </div>
                                                
                                                <li class="mb-3 fw-bold">New NickName</li>
                                                <div class="form-floating mb-5">
                                                    <input type="text" placeholder="Nickname" class="form-control input" name="j_nickname" id="j_nickname"
                                                    required value="${sessionScope.mvo.m_name}">
                                                    <label class="text-secondary" for="floatingInput">닉네임</label>
                                                    <div class="invalid-feedback">
                                                        닉네임을 입력하세요.
                                                    </div>
                                                </div>
                                                
                                                <li class=" fw-bold">New PhoneNumber</li>
                                                <a class="mb-5 text-muted " style="font-size: small; text-decoration: none;">*기호 또는 공백을 제외하고 입력해 주세요.</a>
                                                <div class="form-floating mb-5 mt-1">
                                                    <input type="text" placeholder="PhoneNumber" class="form-control input" name="m_phone" id="m_phone"
                                                    required value="${sessionScope.mvo.m_phone}">
                                                    <label class="text-secondary" for="floatingInput">휴대폰번호</label>
                                                    <div class="invalid-feedback">
                                                        휴대폰 번호를 입력해주세요.
                                                    </div>
                                                </div>

                                                <li class="mb-3 fw-bold">Password</li>
                                                <div class="form-floating mb-5">
                                                    <input type="password" placeholder="Confirm password" class="form-control password"
                                                        name="j_confirmpassword" id="j_confirmpassword" required>
                                                    <label class="text-secondary" for="floatingInput">현재 비밀번호를 입력해주세요.</label>
                                                    <div class="invalid-feedback">
                                                        비밀번호가 다릅니다.
                                                    </div>
                                                </div>

                                                
                                                <div class="col-6 d-grid gap-2 my-3 mx-auto">
                                                    <button type="button" class="btn btn-dark " style="min-height: 50px; " onclick="send(this.form)">회원정보 수정</button>
                                                </div>
                                                
                                            </ul>
                                        </form>
                                    </div>
                                    </div>
                                </div>

                                <p class="fw-bold text-muted ms-1" style="font-family: 'suite';">궁금하신 사항은! 고객센터&nbsp;<span class="me-2">https://rest.o-r.kr</span><a onclick=""><i class="fa fa-phone phone fa-lg" aria-hidden="true"></i></a> </p>

                            </div>
                        </div>
                    </div>

                    <div>
                        <!-- footer 시작---------------------------------------------------------------------------------------------->
                        <!-- <body class="d-flex flex-column"> -->
                        <footer id="sticky-footer"
                            class="flex-shrink-0 py-4 bg-dark text-white-50 mycustom-main_footer">
                            <div class="container text-center">
                                <small>Copyright &copy; 2023 마이휴 </small>
                            </div>
                        </footer>

                        <!-- </body>  -->
                        <!-- footer 끝---------------------------------------------------------------------------------------------->

                    </div>
                </div>

                <%-- 추가Popup --%>
                    <div id="add_popup" class="popup" title="내역 수정 ">
                        <div id="content">
                            <form action="Controller" method="post">
                                <input type="hidden" name="type" value="add" />
                                <label for="deptno">주문환불</label>
                                <input type="text" id="deptno" name="deptno" /><br />
                                <label for="dname">주문반품</label>
                                <input type="text" id="dname" name="dname" /><br />
                                <label for="location_id">주문상태확인</label>
                                <input type="text" id="location_id" name="location_id" /><br />

                                <input type="button" value="뒤로" onclick="add(this.form)" />

                            </form>
                        </div>
                    </div>

                    <div id="search_popup" class="popup" title="리모컨">
                        <div id="content">
                            <form action="Controller" method="post">
                                <input type="hidden" name="type" value="list" />
                                <select id="searchType" name="search1">
                                    <option value="0">뒤로</option>
                                    <option value="1">메인으로</option>
                                    <option value="2">상품창으로</option>
                                </select>
                                <input type="text" id="searchValue" name="search2" /><br />
                                <input type="button" value="이동" onclick="search(this.form)" />
                            </form>
                        </div>

                    </div>
            </div>
            </div>

            <!---------------------------모달------------------------>
            <div class="modal" id="modal1" tabindex="-1" aria-labelledby="signupModalLabel" aria-hidden="true">
                <div class="modal-dialog modal-dialog-centered">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="signupModalLabel">회원정보 수정 완료</h5>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <div class="modal-body">
                            회원정보 수정을 성공적으로 완료했습니다!
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn mycustom-mem-btn mo1btn" data-bs-dismiss="modal">확인</button>
                        </div>
                    </div>
                </div>
            </div>
            <!--------------------------- 모달------------------------>
            <div class="modal" id="modal2" tabindex="-1" aria-labelledby="signupModalLabel" aria-hidden="true">
                <div class="modal-dialog modal-dialog-centered">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="signupModalLabel">수정 실패</h5>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <div class="modal-body">
                            회원정보 수정을 실패했습니다.
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn mycustom-mem-btn " data-bs-dismiss="modal">확인</button>
                        </div>
                    </div>
                </div>
            </div>


            <script type="text/javascript" src="js/bootstrap.js"></script>

            <!-- 제이쿼리 -->
            <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js">
            </script>

            <!-- 합쳐지고 최소화된 최신 자바스크립트 -->
            <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
            </script>



            <!-- Bootstrap core JS-->
            <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
            <!-- Core theme JS-->
            <script src="js/scripts.js"></script>

            <script>
                

    function send(form) {
        let check1 = /^[a-zA-Z0-9]+@[a-z]+\.[a-zA-Z]{2,3}$/i; // 아이디 이메일 형식 검사
        let check2 = /^[a-zA-Z0-9]{8,}$/i;


        let j_email = $("#j_email").val();
        let j_confirmpassword = $("#j_confirmpassword").val();
        let j_nickname = $("#j_nickname").val();
        let m_phone = $("#m_phone").val();

                
        if (j_confirmpassword.trim().length < 1) {
            $("#j_confirmpassword").removeClass("is-valid");
            $("#j_confirmpassword").addClass("is-invalid");

            $("#j_confirmpassword").focus();
            return;
        } else {
            $("#j_confirmpassword").removeClass("is-invalid");
            $("#j_confirmpassword").addClass("is-valid");
        }

        if (j_nickname.trim().length < 1) {
            $("#j_nickname").removeClass("is-valid");
            $("#j_nickname").addClass("is-invalid");

            $("#j_nickname").focus();
            return;
        } else {
            $("#j_nickname").removeClass("is-invalid");
            $("#j_nickname").addClass("is-valid");
        }

        if (m_phone.trim().length < 1) {
            $("#m_phone").removeClass("is-valid");
            $("#m_phone").addClass("is-invalid");

            $("#m_phone").focus();
            return;
        } else {
            $("#m_phone").removeClass("is-invalid");
            $("#m_phone").addClass("is-valid");
        }

        // 비동기식통신
        $.ajax({
            url: "/myPage/changeInfo",
            type: "post",
            data: { "m_name": j_nickname, "m_phone": m_phone, "m_pw": j_confirmpassword  },
            dataType: "json"
        }).done(function (data) {
            if (data.updateMem_fail == "1")// 잘 저장된 경우
                $('#modal1').modal('show');
            else {
                //$("#j_email").val("");
                $('#modal2').modal('show');
            }
        })

    }

    // 모달 1 확인 버튼 클릭 이벤트 처리
    $(document).ready(function () {
        $('.mo1btn').on('click', function () {
            //window.location.href = "/login"
        });
    });



    $(function () {
        $("#j_email").bind("keyup", function () {
            var str = $(this).val();
            if (str.trim().length > 4) {
                $.ajax({
                    url: "/join/checkid",
                    type: "post",
                    data: { "email": str },
                    dataType: "json"
                }).done(function (res) {
                    if (res.chk == true && check1.test(str)) {
                        $("#j_box").html("&nbsp;사용가능");
                    } else {
                        $("#j_box").html("&nbsp;사용불가능");
                    }
                })
            } else {
                $("#j_box").html("");
            }
        });

        // if("${commjoin_fail}" == "commjoin_fail"){
        //     alert("이미 가입된 이메일입니다.");
        //     return;
        // }
    });

</script>
        </body>

        </html>