<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
    
<!DOCTYPE html>
<html>


 <%@include file="../includes/header.jsp" %>

<body>
	<h1>탈퇴확인</h1>
    <input type="hidden" name="userId" value="${uVO.userId }" readonly>
    <form method="post" action="/user/userRemove" name="delete" >

	  <table class="table table-bordered table-hover" style="text-align: center; border: 1px solid #ddddddd">
	   <thead>
	    <tr>
	     <th colspan="3"><h4>회원탈퇴</h4></th>
	    </tr>
	   </thead>
	    <tbody>
	    <tr>
	      <td style="width:110px;"><h5>아이디</h5></td>
	      <td><h5>${uVO.userId }</h5>
	      <input type="hidden" name="id" value="${uVO.userId }"></td>
	     </tr>
		 <tr>
	      <td style="width:150px;"><h5>비밀번호입력 : </h5></td>
	      <td colspan="3"><input class="form-control" id="userPw" type="password" name="userPw" maxlength="20" value="" placeholder="비밀번호를 입력하세요."></td>
	     </tr>
	   	<tr>
			<td colspan="2" align="center">
			<input class="btn btn-primary" type="submit" value="회원탈퇴" onClick="removeCheck()"/>&nbsp;&nbsp;
			<input class="btn btn-primary" type="button" value="취소" onclick="location.href='/user/userGet?userId=<c:out value="${uVO.userId}"/>'">
			</td>
			<td style="text-align: left;" colspan="3"><h5 style="color: red;" id="passwordCheckMessage"></h5>   
		</tr>				
  			</tbody>
  		</table>
	</form>
<script>
function removeCheck() {
	if(userPw.value.trim().length == 0){
        alert("비밀번호를 입력해주세요.");
        userPw.focus();
        return false;
    }


	if(window.confirm("정말탈퇴하시겠습니까?")== true){
		alert("탈퇴가 완료되었습니다. 그동안 서비스를 이용해 주셔서 감사합니다");
		return ;
	}else{
		alert("탈퇴취소.");
		return false;
	}
}

</script>

<%@include file="../includes/footer.jsp" %>
</body>
</html>
