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
	
	  
	<div style="margin-bottom:200px; margin-left:100px; width:40%; float:left;">
	<br>
	<h2 style="text-align: center">내가 쓴 리뷰</h2>
		<table class="table table-striped table-bordered table-hover" id="dataTables-example">

    			
    				<form id="frm2" action="/board/readReview" method="post">
	    				<div class="form-group">
	    				
	    				<input type="hidden" name="reviewNum" value="${review.reviewNum}">
	    				<label>리뷰쓴날짜</label> 
	    					<input type="text" class="form-control" readonly="readonly" value=<fmt:formatDate pattern="yyyy-MM-dd" value="${review.reviewRegdate}"/>>
	    				</div>
	    				
	    				<div class="form-group">
	    					<label>가게이름</label> <input class="form-control" name='storeName' value='<c:out value="${store.storeName }"/>' readonly="readonly">
	    				</div>
	    				
	    				<div class="form-group">
	    					<label>리뷰작성자</label> <input class="form-control" name='userId' value='<c:out value="${review.userId }"/>' readonly="readonly">
	    				</div>
	    				
	    				<div class="form-group">
	    					<label>리뷰내용</label> <textarea class="form-control" rows="3" name='reviewContent' readonly="readonly"><c:out value="${review.reviewContent }"/>
	    				</textarea></div>
	    				
	    				<div class="form-group">
	    					<label>리뷰사진</label> <input class="form-control" name='reviewImg' value='<c:out value="${review.reviewImg }" />' readonly="readonly">
	    				</div>
	    				
	    				<div class="form-group">
	    					<label>사장님 댓글</label> <textarea class="form-control" rows="3" name='replyContent' readonly="readonly"><c:out value="${review.replyContent }"/>
	    				</textarea></div>
	   		   		<div style="margin-left:440px">
	    				<button style="margin:5px;" type="button" class="btn btn-info" onclick="location.href='/board/updateReview?reviewNum=<c:out value="${review.reviewNum }"/>'">
	    				리뷰수정</button>
	    				<button style="margin:5px;" type="submit" class="btn btn-info" onclick="return delete_chk()">
	    				삭제하기</button>
	    				<button style="margin:5px;" type="button" class="btn btn-info" onclick="location.href='/board/userReview'">리뷰목록</button>
	    			</div>
	    				</form>    				
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
	function delete_chk(){
		
		if(confirm("리뷰를 삭제하시겠습니까?")){			
			document.getElementById('frm2').submit();	
		}else{			
			return false;
		}
	}
	</script>

</body>
</html>