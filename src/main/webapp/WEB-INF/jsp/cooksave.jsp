<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
            <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

            <!DOCTYPE html>
            <html class="no-js" lang="zxx">
            <html lang="en">
            <body>

                <!--
                    사용 설명서 
            우선 맨 위에 제이쿼리를 선언해줍니다. 

            함 수가 생각보다 많네요.. 순서대로 정리해보겠습니다.

            1. 우선 로그인 버튼을 누르면 onSubmit에서 선언한 frm_check 함수 실행하는데 거기에 saveid 함수를 실행하게 합니다.
            
            2. saveid함수에서는 체크박스에 체크값에 대하여 조건에 따라 시간을 구해줍니다!

            현재시간에 한달을 더해서 setCookie함수에 넣어주고 체크가 되어있지 않다면 현재 시간에 마이너스값을 하여 setCookie에 넣어줍니다. ( 마이너스값을 넣어주면 쿠키시간이 존재하지 않겟죠!)

            3. setCookie에서는 saveid함수에서 넘겨준 시간이 현재시간과 비교해서 쿠키를 생성하고 지워주는 역할을 합니다.

            현재시간보다 크다면 한달치 시간을 넣어 쿠키를 를 생성해주고 현재시간보다 작다면 마이너스값을 넣어 쿠키를 지워줍니다.

            4. 페이지 시작할때 실행하도록 기본실행함수인 $(function(){} 에  fnInit(); 함수를 넣어 실행하도록 합니다.

            5. fnInit()함수에는 만약에 getCookie(name) 함수에 'saveid' 를 넣어 getCookie(name) 값이 비어있지 않다면

            아이디 값의 이름이 saveid 체크박스에 체크를하고, logId의 아이디 값에 getCookie(name) 값을 넣어줍니다.
                -->
                <dvi>
                    
                    <form id="loginForm" name="loginForm" action="<c:url value='/account/actionLogin.do'/>" method="post"
                    onsubmit="return frm_check();">
                    <div class="logIp">
                        <label class="skip" for="logId">아이디</label>
                        <input type="text" name="id" id="logId" title="아이디 입력" placeholder="아이디를 입력해주세요.">
                        <label class="skip" for="logPW">비밀번호</label>
                        <input type="password" name="password" id="logPW" title="비밀번호 입력" placeholder="비밀번호를 입력해주세요.">
                    </div>
                    <div class="logSave">
                        <input type="checkbox" class="save_id" name="checkId" id="saveId">
                        <label for="saveId">아이디 저장</label>
                    </div>
                    <div class="logBtn w1">
                        <input type="submit" class="log_btn bg1" value="로그인">
                    </div>
                </form>
            </dvi>
                <script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
                
                
                <script type="text/javascript">
                    $(function () {

                        fnInit();

                    });

                    function frm_check() {
                        saveid();
                    }

                    function fnInit() {
                        var cookieid = getCookie("saveid");
                        console.log(cookieid);
                        if (cookieid != "") {
                            $("input:checkbox[id='saveId']").prop("checked", true);
                            $('#logId').val(cookieid);
                        }

                    }

                    function setCookie(name, value, expiredays) {
                        var todayDate = new Date();
                        todayDate.setTime(todayDate.getTime() + 0);
                        if (todayDate > expiredays) {
                            document.cookie = name + "=" + escape(value) + "; path=/; expires=" + expiredays + ";";
                        } else if (todayDate < expiredays) {
                            todayDate.setDate(todayDate.getDate() + expiredays);
                            document.cookie = name + "=" + escape(value) + "; path=/; expires=" + todayDate.toGMTString() + ";";
                        }


                        console.log(document.cookie);
                    }

                    function getCookie(Name) {
                        var search = Name + "=";
                        console.log("search : " + search);

                        if (document.cookie.length > 0) { // 쿠키가 설정되어 있다면 
                            offset = document.cookie.indexOf(search);
                            console.log("offset : " + offset);
                            if (offset != -1) { // 쿠키가 존재하면 
                                offset += search.length;
                                // set index of beginning of value
                                end = document.cookie.indexOf(";", offset);
                                console.log("end : " + end);
                                // 쿠키 값의 마지막 위치 인덱스 번호 설정 
                                if (end == -1)
                                    end = document.cookie.length;
                                console.log("end위치  : " + end);

                                return unescape(document.cookie.substring(offset, end));
                            }
                        }
                        return "";
                    }

                    function saveid() {
                        var expdate = new Date();
                        if ($("#saveId").is(":checked")) {
                            expdate.setTime(expdate.getTime() + 1000 * 3600 * 24 * 30);
                            setCookie("saveid", $("#logId").val(), expdate);
                        } else {
                            expdate.setTime(expdate.getTime() - 1000 * 3600 * 24 * 30);
                            setCookie("saveid", $("#logId").val(), expdate);

                        }
                    }




                </script>

                
            </body>
           
            
            </html>