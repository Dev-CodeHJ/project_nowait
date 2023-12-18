<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@include file="../includes/header.jsp" %>
<style>
	@font-face {
   font-family: 'Tenada';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2210-2@1.0/Tenada.woff2') format('woff2');
    font-weight: normal;
    font-style: normal;
	}
	h2, span{
	   font-family: 'Tenada';
	}
	
	table {
	margin: auto;
	   border: 1px solid black;
	   border-collapse: collapse;
	}
	th, td {
	   text-align: center;
	   border: 1px solid black;
	   padding: 10px;
	   }
	.btn-info {
    color: #fff;
    background-color: #17a2b8;
    border-color: #17a2b8;
}
</style>
	<div class="container-fluid">
	  <div class="row">
	  	<div class="col-md-3" style="padding-top: 30px; float:left;">
			<!-- 사이드 바 메뉴-->
			<div class="panel panel-info">
			  <div class="panel-heading">
		    	<!-- 패널 타이틀1 -->
		  		<h3 class="panel-title">
	   			  <span>주문,예약,리뷰 관리</span>
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
	<div style="margin-bottom:200px; width:40%;">
	<br>
	<h2 style="text-align: center; margin-left:100px; " >주문내역</h2>
	
	<table class="table table-striped table-bordered table-hover" id="dataTables-example">
	<div style="float:left; margin-left:250px; margin-right:30px;">
	<div class="form-group">	     
        <label>주문날짜</label>
  		<input type="text" class="form-control" readonly="readonly" value=<fmt:formatDate pattern="yy-MM-dd" value="${orderDetail.orderTime}"/>>
    </div>
             				    		
	<div class="form-group">    
		<label>주문번호</label>
		<input class="form-control" name='orderNum' value='<c:out value="${orderDetail.orderNum}"/>' readonly="readonly">
	</div>
    <div class="form-group">       
   		<label>가게이름</label>
		<input class="form-control" name='storeName' value='<c:out value="${orderDetail.storeName}"/>' readonly="readonly">
	</div>
    <div class="form-group">       
   		<label>주문메뉴</label>
		<input class="form-control" name='menuName' value='<c:out value="${orderDetail.menuName}"/>' readonly="readonly">
	</div>
    <div class="form-group">       
   	<label>메뉴옵션</label>
		<input class="form-control" name='option' value='<c:out value="${menuOption.option}"/>' readonly="readonly">
	</div>
	<div class="form-group">       
   	<label>예약유형</label>
		<input class="form-control" name='reservCheck' value='<c:out value="${orderDetail.reservCheck}"/>' readonly="readonly">
	</div>

</div>
<br><br><br><p></p><p></p><p></p><p></p>
<div style="float:left;">
	<div class="form-group">       
   	<label>예약인원</label>
		<input class="form-control" name='reservCheck' value='<c:out value="${orderDetail.reservNum}"/>' readonly="readonly">
	</div>
	<div class="form-group"> 
 	<label>예약시간</label>
		<input class="form-control" name='orderTime' value='<fmt:formatDate pattern="yyyy-MM-dd" value="${orderDetail.orderTime}"/>' readonly="readonly">
	</div>
	<div class="form-group"> 
 	<label>요청사항</label>
		<input class="form-control" name='requestMsg' value='<c:out value="${orderDetail.requestMsg}"/>' readonly="readonly">
	</div>
	<div class="form-group"> 
 	<label>결제방식</label>
		<input class="form-control" name='payMethod' value='<c:out value="${orderDetail.payMethod}"/>' readonly="readonly">
	</div>
   	<div class="form-group"> 
 	<label>총금액</label>
		<input class="form-control" name='payMethod' value='<c:out value="${orderDetail.totalPrice}"/>' readonly="readonly">
	</div> 
    </div>
	</table>
	<div style = "font-size:15px; color:red; width:100%; margin-left:520px">
	<c:if test="${orderDetail.reviewNum eq 0}">
  		<button style ="margin-left:10px" type="button" class="btn btn-info" data-oper='goreview' onclick="location.href='/board/insertReview?orderNum=<c:out value="${orderDetail.orderNum}"/>'">리뷰작성</button>
  		<button style ="margin-left:10px" type="button" class="btn btn-info" onclick="orderList_move()">목록</button>    
      </c:if>
     <c:if test="${orderDetail.reviewNum != 0}">
		<span style="padding:10px;">** 리뷰작성완료</span>
		<button type="button" class="btn btn-info" onclick="orderList_move()">목록</button>
      </c:if>
  	</div>    

</div>
</div>    
</div>

<%@include file="../includes/footer.jsp" %>	
   <link rel="stylesheet" href="//code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
  <link rel="stylesheet" href="/resources/demos/style.css">
  <script src="https://code.jquery.com/jquery.js"></script>
  <script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
  <script type="text/javascript" src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript">
	function userGet_move() {
	    document.getElementById('frm').action="/user/userGet";
		document.getElementById('frm').submit();
	}
	
	function orderList_move() {
	    document.getElementById('frm').action="/order/userOrderList";
		document.getElementById('frm').submit();
	}
	
	function reviewList_move() {
	    document.getElementById('frm').action="/board/userReview";
		document.getElementById('frm').submit();
	}
	
	function serviceCenter_move() {
	    document.getElementById('frm').action="/user/serviceCenter";
		document.getElementById('frm').submit();
	}
</script>
</body>
</html>
