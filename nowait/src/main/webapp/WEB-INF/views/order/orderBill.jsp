<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>

<html>
<meta charset="UTF-8">
 <%@include file="../includes/header.jsp" %>
<style>
@font-face {
   font-family: 'Tenada';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2210-2@1.0/Tenada.woff2') format('woff2');
    font-weight: normal;
    font-style: normal;
}

h1{
 font-family: 'Tenada';
}
button{
   margin:20px;
}

</style>

<body>
 <div class="row">
        <div class="col-md-3" style="padding: 30px; float:left;">
         <!-- 사이드 바 메뉴-->
         <div class="panel panel-info">
           <div class="panel-heading">
             <!-- 패널 타이틀1 -->
              <h3 class="panel-title">
                 <span>나의관리 메뉴</span>
              </h3>
           </div>
            <!-- 사이드바 메뉴목록1 -->
         <form id="frm">
            <ul class="list-group">
               <li class="list-group-item"><a href="#" onclick="userGet_move()">회원정보</a></li>
              <li class="list-group-item"><a href="#" onclick="orderList_move()">주문내역</a></li>
              <li class="list-group-item"><a href="#" onclick="reviewList_move()">리뷰내역</a></li>
              <li class="list-group-item"><a href="#">장바구니</a></li>
              <li class="list-group-item"><a href="#" onclick="serviceCenter_move()">고객센터</a></li>
            </ul>
         </form>
         </div>
      </div> 
</div>

  <div style="margin-left:400px;margin-top:20px ">

<title>해당주문 영수증 페이지</title>
</div>
<body>

<form role="form" action="/user/userHome">
	    <div class="form-group">
	   	<label>주문날짜</label>
	   	<fmt:formatDate pattern="yy-MM-dd" value="${odVO.orderTime}"/>
	    </div>

	    <div class="form-group">
    	<label>주문번호</label>
        <c:out value="${odVO.orderNum}" ></c:out>
    	</div>

    	<div class="form-group">
    	<label>가게이름</label>
		<c:out value="${storeName}"></c:out>
    	</div>

    	<div class="form-group">
    	<label>주문메뉴이름</label>
	    	<c:forEach items="${menuList}" var="menu">
		        <c:out value="${menu.menuName}"></c:out>
	    	</c:forEach>
    	</div>

    	<div class="form-group">
    	<label>메뉴옵션이름</label>
	    	<c:forEach items="${menuOptionList}" var="option">
		    	<c:out value="${option.option}"></c:out>
	    	</c:forEach>
    	</div>

    	<div class="form-group">
    	<label>예약유형(포장or방문)</label>
    	<c:out value="${odVO.reservCheck}"></c:out>
    	</div>

    	<div class="form-group">
    	<label>예약인원</label>
    	<c:out value="${odVO.reservNum}"></c:out>
    	</div>

    	<div class="form-group">
    	<label>예약시간</label>
    	<c:out value="${odVO.orderTime}"></c:out>
    	</div>	

    	<div class="form-group">
    	<label>요청사항</label>
    	<c:out value="${odVO.requestMsg}"></c:out>
    	</div>	

    	<div class="form-group">
    	<label>결제방식</label>
    	<c:out value="${odVO.payMethod}"></c:out>
    	</div>	

    	<div class="form-group">
    	<label>총주문금액</label>
    	<c:out value="${odVO.totalPrice}"></c:out>
    	</div>		

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