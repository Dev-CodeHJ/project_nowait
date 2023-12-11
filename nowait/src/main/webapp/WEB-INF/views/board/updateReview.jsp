<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@include file="../includes/header.jsp" %>
<!DOCTYPE html>
<html lang="en">
       	<div class="col-lg-12">
				<div class="panel panel-default">
  
    			<h2>리뷰 수정 페이지</h2>
    			<div class="panel-body">
    				<form id="frm" action="/board/updateReview" method="post">
	    				<div class="form-group"></div>
	    				
	    				<input type="hidden" name="reviewNum" value="${review.reviewNum}">
   				
	    				<div class="form-group">
	    					<label>리뷰작성자</label> <input class="form-control" name='userId' readonly="readonly" value='<c:out value="${review.userId }"/>'>
	    				</div>
	    				
	    				<div class="form-group">
	    					<label>리뷰내용</label> <textarea class="form-control" rows="3" id="reviewContent" name='reviewContent'></textarea></div>
	    				
	    				<div class="form-group">
	    					<label>리뷰사진</label> <input class="form-control" name='reviewImg' value='<c:out value="${review.reviewImg }" />'>
	    				</div>	    				
	   		   
	    				<button type="submit" style="background-color:orange" class="btn btn-default" onclick="return update_chk()">
	    				수정하기</button>	    		
	    				<button type="button" class="btn btn-info" onclick="location.href='/board/userReview'">리뷰목록</button>
	    				</form>
	    				</div>    					
			</div>
		</div>  
  <!-- end food section -->
  <%@include file="../includes/footer.jsp" %>
	<script type="text/javascript">
	var str = "...";
	function update_chk() {
		if(document.getElementById("reviewContent").value==""){
			alert("리뷰내용이 없습니다");
			$("#reviewContent").focus();
			return false;
		}  else {
			alert("수정완료");
			document.getElementById('frm').submit();
		}				
	}
	</script>
</body>
</html>