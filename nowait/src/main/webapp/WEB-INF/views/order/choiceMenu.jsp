<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@include file="../includes/header.jsp" %>
<!DOCTYPE html>
<html lang="en">

<body>
      <div class="container">
  
	<h1>가게 주문 메뉴목록 페이지</h1>
             
	      <table class="table table-striped table-bordered table-hover" >
                                 <c:forEach items="${menuList}" var="menu">
                                    <tr>
                                        <th>메뉴번호</th>
                                        <td><input type="text" readonly="readonly" value=<c:out value="${menu.menuNum}"/>></td>
                                        
                                    </tr>
                                    <tr>
                                        <th>메뉴이름</th>
                                       <a href='/order/choiceDetailMenu?menuNum=<c:out value="${menu.menuNum }"/>'>
                                	${menu.menuName}</a>
                        
                                    </tr>
                                    <tr>
                                        <th>메뉴가격</th>
                                          <input type="text" class="form-control" readonly="readonly" value=<c:out value="${menu.price }"/>>
									</tr>
									<tr>
                                        <th>인기여부</th>
                                         <input type="text" class="form-control" readonly="readonly" value=<c:out value="${menu.popularity}"/>>
                                    </tr>
                                    <tr>
                                        <th>품절여부</th>
                                         <input type="text" class="form-control" readonly="readonly" value=<c:out value="${menu.menuStatus}"/>>
                                    </tr>
                                    <tr>
                                        <th>메뉴사진</th>
                                         <input type="text" class="form-control" readonly="readonly" value=<c:out value="${menu.menuImg}"/>>
                                    </tr>
                                
                                </c:forEach>
                             	
                             	</table>
							
	
	
	
	
	
	
	
	
	
	
	
		<%@include file="../includes/footer.jsp" %>	
</body>
</html>