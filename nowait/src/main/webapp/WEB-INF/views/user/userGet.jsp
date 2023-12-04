<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
    
<!DOCTYPE html>
<html>
 <%@include file="../includes/header.jsp" %>
<body>

	<h1>회원정보</h1>
   		<table >
	       
	        <tr>
	            <th>회원아이디</th>
	            <td><input type="text" name='userId' value="${member.userId }" readonly="readonly"></td>
	        </tr>
	        <tr>
	            <th>비밀번호</th>
	            <td><input type="password" name='userPw' value="${member.userPw }" readonly="readonly"></td>
	        </tr>
	        <tr>    
	            <th>이름</th>
	            <td><input type="text" name='userName' value="${member.userName }" readonly="readonly"></td>
	        </tr>
	        <tr>   
	            <th>생년월일</th>
	            <td><input type="text" name='userBirth' value="${member.userBirth }" readonly="readonly"></td>
	        </tr>
	        <tr>    
	            <th>전화번호</th>
	            <td><input type="number" name='userPhone' value="${member.userPhone }" readonly="readonly"></td>
	        </tr>
	        <tr>    
	            <th>이메일</th>
	            <td><input type="email" name='userEmail' value="${member.userEmail}" readonly="readonly"></td>
	        <tr>
	            <th>주소</th>
	            <td><input type="text" name='userAddr' value="${member.userAddr }" readonly="readonly"></td>
	        </tr>
	        <tr>  
	            <th>회원등급</th>
	            <td><input type="text" name='grade' value="${member.grade }" readonly="readonly"></td>
	        </tr>
	        <tr>    
	            <th>가입날짜</th>
	            <td><input type="text" name='userRegdate' value="${member.userRegdate}" readonly="readonly"></td>
                  </tr>
               </table>
                  
	<button type="button" onclick="location.href='/user/userModify'">회원수정</button>
	<!-- <button data-oper='modify' onclick="location.href='/user/userModify?userId=<c:out value="${uVO.userId}"/>'"> 회원수정 </button> -->
	<button type="button" onclick="location.href='/user/userRemove?userId=<c:out value="${member.userId}"/>'">회원탈퇴</button>

			 <%@include file="../includes/footer.jsp" %>
 <script type="text/javascript">
$(document.ready(function chk() {
	alert(${chk});
});
</script>
</body>
</html>
