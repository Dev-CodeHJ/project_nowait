<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@include file="../includes/header.jsp" %>
<!DOCTYPE html>
<html lang="en">
			 <h2>리뷰작성</h2>
                 <div class="panel-body">
    				<form role="form" action="/board/insertReview" method="post">
    					<div class="form-group">
    						<label>가게이름</label> <input class="form-control" name="storeName">
    					</div>
    					<div class="form-group">
    						<label>주문메뉴</label> <input class="form-control" name="orderMenu">
    					</div>
    					<div class="form-group">
    						<label>메뉴사진</label> <input class="form-control" name="menuImg">
    					</div>
    					<div class="form-group">
    						<label>리뷰내용</label>
    						<textarea class="form-control" rows="3" name='reviewContent'>
    						</textarea>
    					</div>   					
    					<button type="submit" class="btn btn-default">등록</button>
    					<button type="reset" class="btn btn-default">목록</button>
    				</form>
    			</div>
  <!-- end food section -->
  <%@include file="../includes/footer.jsp" %>

</body>
</html>