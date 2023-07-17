<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" charset="UTF-8">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>내 손안에 휴게소, 마이휴 어드민</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.3/font/bootstrap-icons.css">
<link rel="stylesheet" href="../css/admin.css" />
<link rel="stylesheet" href="../css/adminTotal.css" />

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
                <a href="/adminTotal/menuList" class="nav-link text-white">
                메뉴 관리
                </a>
            </li>
            <li>
                <a href="/adminTotal/review" class="nav-link text-white ">
                리뷰 관리
                </a>
            </li>
            <li>
                <a href="/adminTotal/mail" class="nav-link text-white active">
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
                <h1>받은 수정요청</h1>
                <br/>
                
                <div class="container">
                    <table class="table mycustomtable" style="text-align: center;">
                        
                        <thead>
                        <tr class="table_head">
                            <th scope="col" style="width: 10px;"></th>
                            <th scope="col" style="width: 150px;">보낸사람</th>
                            <th scope="col" style="width: 200px;">메일제목</th>
                            <th scope="col" style="width: 150px;">보낸날짜</th>
                            <th scope="col" style="width: 10px;"></th>
                        </tr>
                        </thead>
                        <tbody>

                        <c:forEach var="mail" items="${m_list}" varStatus="status">
                            <c:set var="msg" value="${mail.textContent}" />
                            <tr class="mytr">
                                <th scope="row"></th>
                                <td>
                                    ${mail.from.substring(0, mail.from.indexOf("@"))}
                                </td>
                                <td>
                                    <input id="msg${status.index}" type="hidden" value="<c:out value='${msg}'/>" />
                                    <a style="cursor: pointer" onclick="showModal('${status.index}','${mail.subject}','${mail.downloadUrl}')">${mail.subject}</a>
                                </td>
                                <td>
                                    ${mail.sentDate}
                                </td>
                                <td></td>
                            </tr>
                        </c:forEach>

                        </tbody>

                    </table>
                </div>
            </div>
            
        </div>
        <!-- 메인 컨텐츠 끝 -->

        <!-- 모달 -->
        <div class="modal" id="modal1" tabindex="-1">
            <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                <h5 id="modal_title" class="modal-title"></h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <!-- 파일 미리보기 -->
                    <div id="file_preview"></div>
                    <!-- 파일 다운로드 링크 -->
                    <a id="download_link" href="" class="btn btn-primary" target="_blank" rel="noopener noreferrer">다운로드</a>
                    <div id="mail_content">

                    </div>
                </div>
                <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>

                </div>
            </div>
            </div>
        </div>
        
        
    </div>


    <input type="hidden" id="s_mIdx"/>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"
    integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>

    <script>
        function showModal(index, subject, downloadUrl) {
            let msg = $('#msg' + index).val();
            $('#modal1').modal('show');
            $('#modal_title').text(subject);
            $('#mail_content').html(msg);
    
            console.log(downloadUrl);
        
            var fileExtension = downloadUrl.split('.').pop().toLowerCase();
    
            // 파일 다운로드 설정
            $('#download_link').attr('href', downloadUrl);
    
            // 이미지 파일인 경우 미리보기 활성화
            if (fileExtension === 'png' || fileExtension === 'jpg' || fileExtension === 'jpeg' || fileExtension === 'gif') {
                $('#file_preview').html('<img src="' + downloadUrl + '" class="img-fluid" alt="File Preview">');
            } else {
                $('#file_preview').html('');
            }
        }
    
        // 다운로드 링크 클릭 이벤트 핸들러
        $('#download_link').on('click', function() {
            var downloadUrl = $(this).attr('href');
            var fileName = getFileNameFromUrl(downloadUrl);
            var decodedFileName = decodeURIComponent(fileName);
            downloadFile(downloadUrl, decodedFileName);
            return false; // 기본 동작(링크 이동)을 취소합니다.
        });
    
        // 파일 다운로드 함수
        function downloadFile(url, fileName) {
            var link = document.createElement('a');
            link.href = url;
            link.download = fileName;
            link.target = '_blank';
            link.style.display = 'none';
            document.body.appendChild(link);
            link.click();
            document.body.removeChild(link);
        }
    
        // URL에서 파일 이름을 추출하는 함수
        function getFileNameFromUrl(url) {
            var startIndex = url.lastIndexOf('/') + 1;
            return url.substr(startIndex);
        }
    </script>

</body>
</html>