<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
    
<!DOCTYPE html>
<html>
 <%@include file="../includes/header.jsp" %>
<body>

	<h1>고객센터</h1>
<ul>
<li>전화번호</li>
<li>본사주소</li>
<li>본사이메일</li>
<li>자주묻는 질문</li>
<li>고객등급 기준</li>
       <ul>
            <li>브론즈- 주문건수 0개~9개</li>
            <li>실버- 주문건수 10개~29개</li>
            <li>골드- 주문건수 30개~49개</li>
            <li>vip- 주문건수 50개~99개</li>
            <li>Vvip- 주문건수 100개~</li>
        </ul>

</ul>

    	<button onclick ="location.href='/'">home</button>
    	
    
<%@include file="../includes/footer.jsp" %>
</body>
</html>
