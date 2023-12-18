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
	  	<div class="col-md-3" style="padding-top: 30px;" float:left;">
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
                 <div class="panel-body" style="margin-bottom:200px; padding-top:30px; width:40%; float:left; margin-left:100px;">
					 <h2 style="text-align: center">리뷰작성</h2>
    				<form id="frm2" role="form" action="/board/insertReview" method="post" >    							
    					<!-- <input type="hidden" name="reviewNum" value="0"> -->
    					<input type="hidden" name="userId" value="${order.userId}">
    					<input type="hidden" name="crNum" value="${order.crNum}">
    					<input type="hidden" name="orderNum" value="${order.orderNum}">
    					<div class="form-group">
    						<label>가게이름</label> 
    						<input class="form-control" name="storeName" readonly="readonly" value="${store.storeName}">
    					</div>
    					<div class="form-group">
    						<label>주문메뉴</label>
    						<input class="form-control" name="orderMenu" readonly="readonly" value="${menu.menuName}">
    					</div>
    					<div class="form-group">
    						<label>메뉴사진</label> 
    						<!-- <input class="form-control" name="reviewImg" id="reviewImg" value="${review.reviewImg}"> -->
    						<input type="file" name="reviewImg" id="reviewImg" />
    					</div>
    					<div class="form-group">
    						<label>리뷰내용</label>
    						<textarea class="form-control" rows="3" name="reviewContent" id="reviewContent"></textarea>
    					</div>   					
    					<button style="margin-left:700px" type="submit" class="btn btn-info"  onclick="return register_chk()" id="btn_register">등록</button>   					
    				</form>
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
	function userUpdate_move() {
		document.getElementById('frm').action="/user/userModify";
		document.getElementById('frm').submit();
	}
	
	function userDelete_move() {
	    document.getElementById('frm').action="/user/userRemove";
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
    $("#btn_register").click(function register_chk() {
    	  
	      if ($("#reviewContent").val() == "") {
	    	  alert("리뷰내용이 없습니다");
	          $("#reviewContent").focus();
	          return false;
	          
	      }
	      document.getElementById('frm2').submit();
          return true;
	  });
    });
</script>
</body>
</html>
