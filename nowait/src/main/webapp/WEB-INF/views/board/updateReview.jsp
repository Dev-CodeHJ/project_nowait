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
		
	<div style="margin-bottom:200px; width:40%; style=float:left; margin-left:100px;">
	<br>
	<h2 style="text-align: center">리뷰 수정</h2>
		<table class="table table-striped table-bordered table-hover" id="dataTables-example">

    				<form id="frm2" action="/board/updateReview" method="post">
	    				<div class="form-group"></div>
	    				
	    				<input type="hidden" name="reviewNum" value="${review.reviewNum}">
	    				<input type="hidden" name="crNum" value="${review.crNum}">
	    				<input type="hidden" name="orderNum" value="${review.orderNum}">
   				
	    				<div class="form-group">
	    					<label>리뷰작성자</label> <input class="form-control" name='userId' readonly="readonly" value='<c:out value="${review.userId }"/>'>
	    				</div>
	    				
	    				<div class="form-group">
	    					<label>리뷰내용</label> <textarea class="form-control" rows="3" id="reviewContent" name='reviewContent'></textarea></div>
	    				
	    				<div class="form-group">
	    					<label>리뷰사진</label> <input class="form-control" name='reviewImg' value='<c:out value="${review.reviewImg }" />'>
	    				</div>	    				
	   		   		<div style="margin-left:560px;">
	    				<button type="submit" style="margin:10px;" class="btn btn-info" onclick="return update_chk()">
	    				수정하기</button>	    		
	    				<button type="button" class="btn btn-info" onclick="location.href='/board/userReview'">리뷰목록</button>
	    			</div>
	    				</form>
	    				</div> 
	    				</div>
	    				</table>   					
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
	var str = "...";
	function update_chk() {
		if(document.getElementById("reviewContent").value==""){
			alert("리뷰내용이 없습니다");
			$("#reviewContent").focus();
			return false;
		}  else {
			alert("수정완료");
			document.getElementById('frm2').submit();
		}				
	}
	</script>

