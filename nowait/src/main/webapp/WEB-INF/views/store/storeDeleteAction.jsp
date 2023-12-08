<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@include file="../includes/header.jsp" %>
<!DOCTYPE html>
<html>
<body>
  	<table>
		<tr style="display: none;">
        	<td>
           		<form id="frm" action="/store/storeDelete">
           			<input type="text" name="crNum" value="${crNum}">
          		</form>
       		</td>
   		</tr>
    </table>
  <%@include file="../includes/footer.jsp" %>
<script type="text/javascript">
	$(document).ready(function() {
		if(${deleteOk} == 0){
			alert("${crNum} 비밀번호가 일치하지 않습니다!");
			document.getElementById('frm').submit();
		} else if(${deleteOk} == -1){
			alert("${crNum} 존재하지 않는 사업자 등록번호입니다!");
			document.getElementById('frm').submit();
		} else if(${deleteOk} == 1) {
			alert("가게정보가 성공적으로 삭제되었습니다.");
			location.href="/owner/ownerHome";
		}
	});
</script>
</body>
</html>