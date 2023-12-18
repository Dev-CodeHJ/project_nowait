
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
</style>

	<div class="container-fluid">
	  <div class="row">
	  	<div class="col-md-3" style="padding-top: 30px;">
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
	<input type="hidden" id="result_msg" name="result_msg" value="${message}">
	<div style="margin-bottom:500px; width:60%;"><br>
	<h2 style="text-align: center">주문내역</h2>
	   <table class="table table-striped table-bordered table-hover">
	       <thead>
	           <tr>
	               <th>주문날짜</th>
	               <th>가게이름</th>
	               <th>주문메뉴</th>
	               <th>주문유형</th>
	               <th>주문금액</th>
	           </tr>
	       </thead>                
	     <tbody>
	      <c:forEach items="${orderlist}" var="order">                                  
	          <tr style="cursor:pointer" onclick="location.href='/order/orderDetailList?orderNum=<c:out value="${order.orderNum}"/>'">
	             <td><fmt:formatDate pattern="yyyy-MM-dd" value="${order.orderTime}"/></td>
	             <td><c:out value="${store.storeName}"/></td>
	             <td><c:out value="${menu.menuName}"/></td>                                      
	             <td><c:out value="${order.reservCheck}"/></td>
	             <td><c:out value="${order.totalPrice}"/></td>
	          </tr>                                   
	       </c:forEach>
	    </tbody>
	   </table>       
	</div>       
</div>
</div>
 <!-- end food section -->
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

<script type="text/javascript">
	$(document).ready(function() {		
		var msg = document.getElementById("result_msg").value;
		// 리뷰등록되면 ~ 
		if(msg == "T"){
			alert("저장되었습니다.");
		}else if(msg == "F"){
			alert("잠시 후 다시 시도해주세요.");
		}
	});
</script>
</body>
</html>