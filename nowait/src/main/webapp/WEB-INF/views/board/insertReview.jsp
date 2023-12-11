<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@include file="../includes/header.jsp" %>
<!DOCTYPE html>
<html lang="en">
			 <h2>리뷰작성</h2>
                 <div class="panel-body">
    				<form id="frm" role="form" action="/board/insertReview" method="post" >    							
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
    					<button type="submit" class="btn btn-default" onclick="return insert_Check()">등록</button>
    					<button type="reset" class="btn btn-default">목록</button>
    				</form>
    			</div>
  <!-- end food section -->
  <%@include file="../includes/footer.jsp" %>
    <%@include file="../includes/footer.jsp" %>
		<script type="text/javascript">
		var str = "...";
		function insert_Check() {
			if(document.getElementById("reviewContent").value==""){
				alert("리뷰내용이 없습니다");
				$("#reviewContent").focus();
				return false;
			}  else {			
				document.getElementById('frm').submit();
			}				
		}
		</script>
</body>
</html>
