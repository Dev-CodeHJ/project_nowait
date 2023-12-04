<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
    
<!DOCTYPE html>
<html>
 <%@include file="../includes/header.jsp" %>

<body>

	<h1>회원주문내역</h1>
    			<form role="form" action="/user/userReview" method="get">
		    		<table >
                                     <c:forEach items="${list}" var="<!--가게-->">
                                    <tr>
                                        <th>주문승인상태</th>
                                        <td><input type="text" name='orderApprove' value='<!--가게-->' readonly="readonly"></td>
                                    </tr>
                                    <tr>
                                        <th>가게이름</th>
                                        <td><input type="text" name='storeName' value='<!--가게-->' readonly="readonly"></td>
                                    </tr>
                                    <tr>    
                                        <th>주문메뉴</th>
                                         <td><input type="text" name='menuName' value='<!--가게-->' readonly="readonly"></td>
                                    </tr>
                                    <tr>   
                                        <th>메뉴옵션</th>
                                         <td><input type="text" name='menuOption' value='<!--가게-->' readonly="readonly"></td>
                                    </tr>
                                    <tr>    
                                        <th>예약유형</th>
                                         <td><input type="text" name='reservCheck' value='<!--가게-->' readonly="readonly"></td>
                                    </tr>ㅈㄷ
                                    <tr>    
                                        <th>방문예약인원</th>
                                         <td><input type="text" name='reservNum' value='<!--가게-->' readonly="readonly"></td>
                                    <tr>
                                        <th>방문시간</th>
                                         <td><input type="text" name='reservTime' value='<!--가게-->' readonly="readonly"></td>
                                    </tr>
                                    <tr>  
                                        <th>요청사항</th>
                                         <td><input type="text" name='requestMeg' value='<!--가게-->' readonly="readonly"></td>
                                    </tr>
                                    <tr>    
                                        <th>결제방식</th>
                                         <td><input type="text" name='payMethod' value='<!--가게-->' readonly="readonly"></td>
                                    </tr>
                                    <tr>    
                                        <th>총금액</th>
                                         <td><input type="text" name='tatalPrice' value='<!--가게-->' readonly="readonly"></td>
                                    </tr>
				</c:forEach>
                  </table>

    				  <button type="submit" data-oper='goreview'>Go Review</button>
			</form>
			 <%@include file="../includes/footer.jsp" %>
			
			
</body>
</html>

 <script type="text/javascript">
$(document).ready(function() {
	var formaObj = $("form");
	
	$('button').on("click",function(e) {
		e.preventDefault();
		var operation = $(this).data("oper");
		console.log(operation);
		
		if(operation)=='goreview'){
		formObj.attr("action","/user/userReview");
		
	}
	formObj.submit();
	});
});
</script>