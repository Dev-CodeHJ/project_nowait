<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@include file="../includes/header.jsp" %>
<!DOCTYPE html>
<html lang="en">
       	<div class="col-lg-12">
				<div class="panel panel-default">
  
    			<h2>내가 쓴 리뷰</h2>
    			<div class="panel-body">
    				<form id="frm" action="/board/readReview" method="post">
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
	    					<label>사장님 댓글</label> <textarea class="form-control" rows="3" name='reviewContent' readonly="readonly"><c:out value="${reply.replyContent }"/>
	    				</textarea></div>
	   		   
	    				<button type="button" style="background-color:orange" class="btn btn-default" onclick="location.href='/board/updateReview?reviewNum=<c:out value="${review.reviewNum }"/>'">
	    				리뷰수정</button>
	    				<button type="submit" style="background-color:red" id="deleteReview" class="btn btn-info" onclick="return delete_chk()">
	    				삭제하기</button>
	    				<button type="button" class="btn btn-info" onclick="location.href='/board/userReview'">리뷰목록</button>
	    				</form>
	    				</div>    					
			</div>
		</div>  
  <!-- end food section -->
  <%@include file="../includes/footer.jsp" %>
	<script type="text/javascript">
	function delete_chk(){
		
		if(confirm("리뷰를 삭제하시겠습니까?")){
			alert("삭제되었습니다.");
			document.getElementById('frm').submit();	
		}else{			
			return false;
		}
	}
	</script>

</body>
</html>