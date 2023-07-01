<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <!DOCTYPE html>
        <html>

        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
            <title>Insert title here</title>
            <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet"
                integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
                crossorigin="anonymous">
            <link rel="stylesheet" href="../css/main_custom.css" />
        </head>

        <body>
            <!-- 메뉴바 ----------------------------------------------------------------------------------------------------------->
            <div class="container main_custom_menubar">
                <header class="d-flex justify-content-between py-3">
                    <div class="col-md-3">
                        <a href="/main"><img style="max-width: 180px;" class="pb-3" src="../main_images/logo.png"/></a>
                    </div>
                    <c:if test="${sessionScope.mvo == null}">
                        <div class="col-md-3 text-end d-flex align-items-center">
                            <button type="button" class="btn btn-outline-success me-2 mycustom-mem-btn" onclick="location.href='/login'">로그인</button>
                            <button type="button" class="btn btn-outline-success mycustom-mem-btn" onclick="location.href='/join'">회원가입</button>
                        </div>
                    </c:if>
                    <c:if test="${sessionScope.mvo != null}">
                    <div class="col-md-3 text-end d-flex align-items-center"> 
                        <button type="button" class="btn btn-outline-success me-2 mycustom-mem-btn" onclick="location.href='/logout'">로그 아웃</button>
                        <button type="button" class="btn btn-outline-success mycustom-mem-btn" onclick="location.href='/myPage'">마이페이지</button>
                    </div>
                    </c:if>
                </header>
            </div>
            <!-- 메뉴바끝 ----------------------------------------------------------------------------------------------------------->

            <!-- search_area----------------------------------------------------------------------------------------------->
            <div class="container-fluid row align-items-center justify-content-center mb-3 mycustom-search_area">
                <div class="container-fluid row  mycustom-search_group">
        
                    <div class="mycustom-search_group_inner"> 
                        <h1 class="mycustom-search_logo"></h1>
                        <form id="sform" name="search" method="post" action="/search">
                            <fieldset>
                                <input type="hidden">
                                <div class="mycustom-search_inputbox">
                                    <input class="mycustom-search_input" placeholder="휴게소명을 입력해 주세요." type="text" id="search1" name="sname" onkeyup="if(window.event.keyCode==13){sendData(this.form)}">
                                </div>
                                <button class="mycustom-search_btn" type="button" onclick="sendData(this.form)">검색</button>
                            </fieldset>
                        </form>
                    </div>
                    
                </div>
            </div>
            <!-- search_area 끝----------------------------------------------------------------------------------------------->


            <div class="container d-flex flex-wrap align-items-center justify-content-center mycustom-line_search_accordion_area">
                <ul class="list-group">
                    <c:if test="${linelist ne null}">
                        <c:forEach var="vo" items="${linelist}" varStatus="loop">
                            <li class="list-group-item mycustom-line_search_listgroup">
                                <form action="/menu" method="get">
                                    <input type="hidden" name="r_photo" value="${photolist[loop.index].r_photo}"/>
                                    <input type="hidden" name="svarCd" value="${vo.svarCd}"/>
                                    <input type="hidden" name="RestNm" value="${vo.svarNm}"/>
                                    <button class="accordion-button" type="submit">
                                        <img class="mycustom-line_search_img" src="${photolist[loop.index].r_photo}"/>
                                        <ul class="mycustom-line_search_ul">${vo.svarNm}(${vo.gudClssNm})
                                            <li>${vo.svarAddr} | 전화번호: ${vo.rprsTelNo}</li>
                                            <li>소형차주차대수: ${vo.cocrPrkgTrcn} | 대형차주차대수: ${vo.fscarPrkgTrcn} | 장애인주차대수: ${vo.dspnPrkgTrcn}</li>
                                        </ul>
                                    </button>
                                </form>
                            </li>
                        </c:forEach> 
                    </c:if>
                </ul>
                
                <c:if test="${linelist eq null}">
                    <h1>휴게소가 없습니다.</h1>
                </c:if>
            </div>


            <!-- footer 시작---------------------------------------------------------------------------------------------->

            <body class="d-flex flex-column">
                <footer id="sticky-footer" class="flex-shrink-0 py-4 bg-dark text-white-50">
                    <div class="container text-center">
                        <small>Copyright &copy; 2023 팀이름 </small>
                    </div>
                </footer>
            </body>
            <!-- footer 끝---------------------------------------------------------------------------------------------->

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
        crossorigin="anonymous"></script>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"
        integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
    <script>
        function sendData(frm) {
            let nm = $("#search1").val().trim();
            if (nm.length == 0) {
                alert("검색어를 입력하세요");
                return;
            }
            //$("#svarNm").val(nm);
            frm.submit();
        }
        
    </script>
    </body>
    
    </html>