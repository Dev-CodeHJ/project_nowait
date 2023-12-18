<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@include file="../includes/header.jsp" %>
<!DOCTYPE html>
<html>
<head>

</head>
<body>

<form role="form" action="/order/oderBill" method="post">
<form role="form" action="/user/userHome">
	    <div class="form-group">
	   	<label>주문날짜</label>
	   	<fmt:formatDate pattern="yy-MM-dd" value="${orderDetail.orderTime}"/>
	   	<fmt:formatDate pattern="yy-MM-dd" value="${odVO.orderTime}"/>
	    </div>

	    <div class="form-group">
    	<label>주문번호</label>
        <c:out value="${orderDetail.orderNum}" ></c:out>
        <c:out value="${odVO.orderNum}" ></c:out>
    	</div>

    	<div class="form-group">
    	<label>가게이름</label>
		<c:out value="${store.storeName}"></c:out>
		<c:out value="${storeName}"></c:out>
    	</div>

    	<div class="form-group">
    	<label>주문메뉴이름</label>
        <c:out value="${menu.menuName}"></c:out>
	    	<c:forEach items="${menuList}" var="menu">
		        <c:out value="${menu.menuName}"></c:out>
	    	</c:forEach>
    	</div>

    	<div class="form-group">
    	<label>메뉴옵션이름</label>
    	<c:out value="${menuOption.option}"></c:out>
	    	<c:forEach items="${menuOptionList}" var="option">
		    	<c:out value="${option.option}"></c:out>
	    	</c:forEach>
    	</div>

    	<div class="form-group">
    	<label>예약유형(포장or방문)</label>
    	<c:out value="${orderDetail.reservCheck}"></c:out>
    	<c:out value="${odVO.reservCheck}"></c:out>
    	</div>

    	<div class="form-group">
    	<label>예약인원</label>
    	<c:out value="${orderDetail.reservNum}"></c:out>
    	<c:out value="${odVO.reservNum}"></c:out>
    	</div>

    	<div class="form-group">
    	<label>예약시간</label>
    	<fmt:formatDate pattern="yyyy-MM-dd" value="${orderDetail.orderTime}"/>
    	<c:out value="${odVO.orderTime}"></c:out>
    	</div>	

    	<div class="form-group">
    	<label>요청사항</label>
    	<c:out value="${orderDetail.requestMsg}"></c:out>
    	<c:out value="${odVO.requestMsg}"></c:out>
    	</div>	

    	<div class="form-group">
    	<label>결제방식</label>
    	<c:out value="${orderDetail.payMethod}"></c:out>
    	<c:out value="${odVO.payMethod}"></c:out>
    	</div>	

    	<div class="form-group">
    	<label>총주문금액</label>
    	<c:out value="${orderDetail.totalPrice}"></c:out>
    	<c:out value="${odVO.totalPrice}"></c:out>
    	</div>		

    	<button type="submit" class="btn btn-default">확인</button>    	
    	<button type="submit" class="btn btn-default">확인-홈으로</button>    	

 </form>


<%@include file="../includes/footer.jsp" %>s
<script type="text/javascript">
	$(document).ready(function() {
		if(${addOk}==1){
			alert("주문이 완료되었습니다.\n-예약취소는 가게전화로 문의 부탁드립니다.-");
		} else if(${addOk}==0) {
			alert("주문 실패");
			location.href='/user/userHome';
		}
	});
</script>
</body>
</html>