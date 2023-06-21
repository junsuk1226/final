<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html class="no-js" lang="zxx">

<head>
    
</head>

<body>
    <select onchange="lineSea(this.value)" name="getrouteCd" id="getrouteCd">
        <option value="">노선명</option>
        <option value="0010">경부선</option>
        <option value="1200">경인선</option>
        <option value="0140">고창담양선</option>
        <option value="0120">광주대구선</option>
        <option value="5000">광주외곽순환선</option>
        <option value="0520">광주원주선</option>
        <option value="0290">구리포천선</option>
        <option value="4002">구리포천지선</option>
        <option value="1020">남해1지선</option>
        <option value="1040">남해2지선</option>
        <option value="0100">남해선(순천-부산)</option>
        <option value="0101">남해선(영암-순천)</option>
        <option value="0252">논산천안선</option>
        <option value="0301">당진대전선</option>
        <option value="0552">대구부산선</option>
        <option value="0700">대구외곽순환선</option>
        <option value="0200">대구포항선</option>
        <option value="3000">대전남부선</option>
        <option value="0652">동해선(부산-포항)</option>
        <option value="0650">동해선(삼척-속초)</option>
        <option value="0652">동해선(부산-포항)</option>
        <option value="0121">무안광주선</option>
        <option value="4000">봉담동탄선</option>
        <option value="4003">봉담송산선</option>
        <option value="0105">부산신항선</option>
        <option value="6000">부산외곽선</option>
        <option value="0651">부산울산선</option>
        <option value="3010">상주영천선</option>
        <option value="0172">서울문산선</option>
        <option value="0173">서울문산지선</option>
        <option value="0600">서울양양선</option>
        <option value="1201">서울제물포선</option>
        <option value="1510">서천공주선</option>
        <option value="0150">서해안선</option>
        <option value="1000">수도권제1순환선</option>
        <option value="4005">수도권제2순환선(화도-양평)</option>
        <option value="0174">수원광명선</option>
        <option value="0270">순천완주선</option>
        <option value="0500">영동선</option>
        <option value="0171">오산화성선</option>
        <option value="0320">옥산오창선</option>
        <option value="1710">용인서울선</option>
        <option value="0160">울산선</option>
        <option value="0201">익산장수선</option>
        <option value="1300">인천공항선</option>
        <option value="4001">인천김포선</option>
        <option value="1102">인천대교선</option>
        <option value="1103">인천대교지선</option>
        <option value="1100">제2경인선</option>
        <option value="370">제2중부선</option>
        <option value="3300">제3경인선</option>
        <option value="0450">중부내륙선</option>
        <option value="4510">중부내륙지선</option>
        <option value="0352">중부선</option>
        <option value="0550">중앙선</option>
        <option value="5510">중앙선지선</option>
        <option value="0300">청주영덕선</option>
        <option value="0351">통영대전선</option>
        <option value="0153">평택시흥선</option>
        <option value="0400">평택제천선</option>
        <option value="0170">평택화성선</option>
        <option value="0141">함양울산선</option>
        <option value="0251">호남선</option>
        <option value="2510">호남지선</option>
        <option value="4004">화성광주선</option>
    </select>

    
    <c:if test="${sessionScope.linelist ne null}">
        <c:forEach var="vo" items="${linelist}">
            <h1>이름: ${vo.svarNm}/ 상하행: ${vo.gudClssNm}/ 주소: ${vo.svarAddr}/ 전화번호: ${vo.rprsTelNo}
                소형차주차대수: ${vo.cocrPrkgTrcn}/ 대형차주차대수: ${vo.fscarPrkgTrcn}/ 장애인주차대수: ${vo.dspnPrkgTrcn}
            </h1>
        </c:forEach>
    </c:if>

    <c:if test="${sessionScope.linelist eq null}">
        <h1>휴게소가 없습니다.</h1>
    </c:if>

    <script>
        function lineSea(value){
            document.location.href="/lineSearchList?getrouteCd="+value;
        }

   </script>
</body>
</html>