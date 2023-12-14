<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@include file="../includes/header.jsp" %>
<!DOCTYPE html>
<html lang="en">

<body>

	<h1>가게 주문상세메뉴 페이지</h1>
	<form action="/choiceDetailMenu" method="post">
	      <div class="heading_container heading_center">
        <h2>
          가게이름
        </h2>
      </div>

      <ul class="filters_menu">
        <li class="active" data-filter="*">All</li>
        <li data-filter=".1">best</li>
        <li data-filter=".2">main</li>
        <li data-filter=".3">side</li>
        <li data-filter=".4">drinks</li>
        <li data-filter=".5">dessert</li>
      </ul>
	

	      <table class="table table-striped table-bordered table-hover" >
                                <thead>
                                    <tr>
                                        <th>메뉴번호</th>
                                        <th>메뉴이름</th>
                                        <th>메뉴가격</th>
                                        <th>인기여부</th>
                                        <th>품절여부</th>
                                        <th>메뉴사진</th>
                                        <th>메뉴옵션번호</th>
                                    	<th>메뉴옵션이름</th>
                                    	<th>메뉴추가금액</th>
                                    	<th>메뉴옵션품절여부</th>
                                    
                                    </tr>
                                </thead>
                                <tbody>
                                <c:forEach items="${menuList}" var="menu">
                                <tr>
                                	<td><c:out value="${menu.menuNum}"/></td>
                                	<c:out value="${menu.menuName}"/></a></td>
                                	<td><c:out value="${menu.price }"/></td>                           	
                                	<td><c:out value="${menu.popularity}"/></td>
                                	<td><c:out value="${menu.menuStatus}"/></td>
                                	<td><c:out value="${menu.menuImg}"/></td>
                                </tr>
                                </c:forEach>
                                <tr>
                                <c:forEach items="${menuOptionList}" var="menuOption">
                                	<td><c:out value="${menuOption.menuOptionNum}"/></td>
                             		<td><c:out value="${menuOption.option}"/></td>
                             		<td><c:out value="${menuOption.optionPrice}"/></td>
                             		<td><c:out value="${menuOption.optionStatus}"/></td>
                             	</tr>	
                             	</c:forEach>
                             	</tbody>
                             	</table>
	
	
	
		<button type="button" class='back'>가게메인으로</button>    	
		<button type="submit" class='add to cart'>장바구니에 담기</button>    	
			<form action="/order/orderCart" method="get" class="order_cart">
				<input type="hidden" name="orders[0].bookId" value="${menuList}">
				<input type="hidden" name="orders[0].bookCount" value="${menuOptionList}">
			</form>
	
	
	</form>
	
	
	
		<%@include file="../includes/footer.jsp" %>	
</body>
</html>