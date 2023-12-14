<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@include file="../includes/header.jsp" %>
<!DOCTYPE html>
<html lang="en">

<body>

	<h1>회원주문상세조회</h1>
	
    
			 <c:forEach items="${orderDetail}" var="orderDetail">
			 
		    		<table class="order_table">

                   <tr style="text-align: center; ">
				   <td style="vertical-align : middle;">
					<fmt:formatDate pattern="yy-MM-dd" value="${orderDetail.orderTime}"/>
                   </td>
                   </tr>
								    		
		            <tr>
					<th>주문번호</th>
                    <td><c:out value="${orderDetail.orderNum}" ></c:out><onclick="location.href='/order/orderListDetail'"></td>
	                </tr>
		            <tr>
					<th>가게이름</th>
					<td><c:out value="${store.storeName}"></c:out></td>
					</tr>
                    <tr>    
                    <th>주문메뉴</th>
                    <td><c:out value="${menu.menuName}"></c:out></td>
                    </tr>
                    <tr>   
                    <th>메뉴옵션</th>
                    <td><c:out value="${menuOption.option}"></c:out></td>
                    </tr>
                    <tr>    
                    <th>예약유형</th>
                    <td><c:out value="${orderDetail.reservCheck}"></c:out></td>
                    </tr>
                    <tr>    
                    <th>예약인원</th>
                    <td><c:out value="${orderDetail.reservNum}"></c:out></td>
                    <tr>
                    <th>예약시간</th>
                    <td><fmt:formatDate pattern="yyyy-MM-dd" value="${orderDetail.orderTime}"/></td>
                    </tr>
                    <tr>  
                    <th>요청사항</th>
                    <td><c:out value="${orderDetail.requestMsg}"></c:out></td>
                    </tr>
                    <tr>    
                    <th>결제방식</th>
                    <td><c:out value="${orderDetail.payMethod}"></c:out></td>
                    </tr>
                    <tr>    
                    <th>총금액</th>
                    <td><c:out value="${orderDetail.totalPrice}"></c:out></td>
                    </tr>
    	
        
     </table>
	
    		<button type="submit" data-oper='goreview' onclick="location.href='/board/insertReview?orderNum=<c:out value="${order.orderNum}"/>'">Go Review</button>    	
   
	</c:forEach>
		

		<%@include file="../includes/footer.jsp" %>	
</body>
</html>