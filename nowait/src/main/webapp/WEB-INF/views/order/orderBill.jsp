<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>해당주문 영수증 페이지</title>
</head>
<body>

<form role="form" action="/order/oderBill" method="post">
	    <div class="form-group">
	   	<label>주문날짜</label>
	   	<fmt:formatDate pattern="yy-MM-dd" value="${orderDetail.orderTime}"/>
	    </div>
	    
	    <div class="form-group">
    	<label>주문번호</label>
        <c:out value="${orderDetail.orderNum}" ></c:out>
    	</div>
	                    
    	<div class="form-group">
    	<label>가게이름</label>
		<c:out value="${store.storeName}"></c:out>
    	</div>
    				
    	<div class="form-group">
    	<label>주문메뉴이름</label>
        <c:out value="${menu.menuName}"></c:out>
    	</div>
    				
    	<div class="form-group">
    	<label>메뉴옵션이름</label>
    	<c:out value="${menuOption.option}"></c:out>
    	</div>
    	
    	<div class="form-group">
    	<label>예약유형(포장or방문)</label>
    	<c:out value="${orderDetail.reservCheck}"></c:out>
    	</div>
   		
    	<div class="form-group">
    	<label>예약인원</label>
    	<c:out value="${orderDetail.reservNum}"></c:out>
    	</div>

    	<div class="form-group">
    	<label>예약시간</label>
    	<fmt:formatDate pattern="yyyy-MM-dd" value="${orderDetail.orderTime}"/>
    	</div>	
    	
    	<div class="form-group">
    	<label>요청사항</label>
    	<c:out value="${orderDetail.requestMsg}"></c:out>
    	</div>	
    	
    	<div class="form-group">
    	<label>결제방식</label>
    	<c:out value="${orderDetail.payMethod}"></c:out>
    	</div>	
    	
    	<div class="form-group">
    	<label>총주문금액</label>
    	<c:out value="${orderDetail.totalPrice}"></c:out>
    	</div>		

    	<button type="submit" class="btn btn-default">확인</button>    	
   		   
 </form>


</body>
</html>