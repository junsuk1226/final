<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html class="no-js" lang="zxx">

<head>
    
</head>

<body>
   <c:forEach var="vo" items="${ar}">
        <h1>${vo.m_idx}/ ${vo.m_id}/ ${vo.m_pw}</h1>
   </c:forEach>
</body>
</html>