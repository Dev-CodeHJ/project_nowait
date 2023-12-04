<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
    
<!DOCTYPE html>
<html>
 <%@include file="../includes/header.jsp" %>

<body>

	<h1>회원정보수정</h1>
    	<form action="/user/userModify" method="post">
    		<table >
	            <tr>
	                <th>회원아이디</th>
	                <td><input type="text" name='userId' value="${member.userId }" readonly="readonly"></td>
	            </tr>
	            <tr>
	                <th>비밀번호</th>
	                <td><input type="password" name='userPw' value="${member.userPw }"></td>
	            </tr>
	            <tr>    
	                <th>이름</th>
	                <td><input type="text" name='userName' value="${member.userName }"></td>
	            </tr>
	            <tr>   
	                <th>생년월일</th>
	                <td><input type="text" name='userBirth' value="${member.userBirth }"></td>
	            </tr>
	            <tr>    
	                <th>전화번호</th>
	                <td><input type="number" name='userPhone' value="${member.userPhone }"></td>
	            </tr>
	            <tr>    
	                <th>이메일</th>
	                <td><input type="email" name='userEmail'value="${member.userEmail}"></td>
	            <tr>
	                <th>주소</th>
	                <td><input type="text" name='userAddr'value="${member.userAddr }"></td>
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
       	 <button type="button" onclick ="location.href='userHome?userId=<c:out value="${member.userId}"/>'">home</button>
		 <button type="submit">수정확인</button>
		 <button type="reset">다시쓰기</button>

		</form>	 
			<%@include file="../includes/footer.jsp" %>
</body>
</html>
