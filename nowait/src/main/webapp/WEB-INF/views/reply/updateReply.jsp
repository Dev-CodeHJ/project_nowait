<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@include file="../includes/header.jsp" %>
<!DOCTYPE html>
<html lang="en">
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
	  	<div class="col-md-3" style="padding: 30px; float:left;">
			<!-- 사이드 바 메뉴-->
			<div class="panel panel-info">
			  <div class="panel-heading">
		    	<!-- 패널 타이틀1 -->
		  		<h3 class="panel-title">
	   			  <span>가게 관리 메뉴</span>
		  		</h3>
			  </div>
				<!-- 사이드바 메뉴목록1 -->
				<ul class="list-group">
				  <li class="list-group-item"><a href="#" onclick="storeUpdate_move()">가게정보 수정</a></li>
				  <li class="list-group-item"><a href="#" onclick="storeDelete_move()">가게정보 삭제</a></li>
				  <li class="list-group-item"><a href="#" onclick="menu_move()">메뉴관리</a></li>
				  <li class="list-group-item"><a href="#" onclick="reply_move()">리뷰관리</a></li>
				  <li class="list-group-item"><a href="#">주문&예약관리</a></li>
				</ul>
			</div>
		</div> 
			 	<form id="frm3" action="/reply/storeReply">
	   				<input type="hidden" name="crNum" value="${storeReview.crNum}">
				</form>
			<div style="margin-bottom:150px; width:40%; style=float:left; margin-left:100px;">
			<h2 style="text-align: center; padding-top:20px;">댓글 수정</h2>
				<form id="frm" action="/reply/updateReply" method="post">
					<div class="panel-body">
					<div class="form-group">
					
					<input type="hidden" name="reviewNum" value="${storeReview.reviewNum}">
					<input type="hidden" name="crNum" value="${storeReview.crNum}">
					<input type="hidden" name="replyNum" value="${storeReview.replyNum}">
				
					<label>리뷰쓴날짜</label> 
						<input type="text" class="form-control" readonly="readonly" value=<fmt:formatDate pattern="yyyy-MM-dd" value="${storeReview.reviewRegdate}"/>>
					</div>
					
					<div class="form-group">
						<label>주문메뉴</label> <input class="form-control" name='menuName' value='<c:out value="${store.menuName }"/>' readonly="readonly">
					</div>
					
					<div class="form-group">
						<label>리뷰작성자</label> <input class="form-control" name='userId' value='<c:out value="${storeReview.userId }"/>' readonly="readonly">
					</div>
					
					<div class="form-group">
						<label>리뷰내용</label> <textarea class="form-control" rows="3" name='reviewContent' readonly="readonly"><c:out value="${storeReview.reviewContent }"/>
					</textarea></div>
					
					<div class="form-group">
						<label>리뷰사진</label> <input class="form-control" name='reviewImg' value='<c:out value="${storeReview.reviewImg }" />' readonly="readonly">
					</div>	
					<div class="form-group">
						<label>사장님 댓글</label> 
						<textarea class="form-control" rows="3" name="replyContent" id="replyContent"></textarea>			
					</div> 		
		     			<button style="margin-left:470px" type="submit" class="btn btn-info" onclick="return update_chk()">수정하기</button>     			     		   
		     			<button type="button" class="btn btn-info" onclick="location.href='/reply/storeReadReview?reviewNum=<c:out value="${storeReview.reviewNum}"/>'">뒤로가기</button>
						<button type="button" class="btn btn-info" onclick="reply_move()">리뷰목록</button>
		     		</div>    
		     			
				</form>
			</div>	
			</div>    							

  <!-- end food section -->
  <%@include file="../includes/footer.jsp" %>
	<script type="text/javascript">
	var str = "...";
	function update_chk() {
		if(document.getElementById("replyContent").value==""){
			alert("리뷰내용이 없습니다");
			$("#replyContent").focus();
			return false;
		}  else {
			alert("수정완료");
			document.getElementById('frm').submit();
		}				
	}
	</script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
<link rel="stylesheet" href="/resources/demos/style.css">
<script src="https://code.jquery.com/jquery.js"></script>
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
<script type="text/javascript" src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript">
	function storeUpdate_move() {
		document.getElementById('frm').action="/store/storeUpdate";
		document.getElementById('frm').submit();
	}
	
	function storeDelete_move() {
	    document.getElementById('frm').action="/store/storeDelete";
		document.getElementById('frm').submit();
	}
	
	function menu_move() {
	    document.getElementById('frm').action="/menu/menuList";
		document.getElementById('frm').submit();
	}
	
	function reply_move() {
	    document.getElementById('frm3').action="/reply/storeReply";
		document.getElementById('frm3').submit();
	}
</script>
</body>
</html>