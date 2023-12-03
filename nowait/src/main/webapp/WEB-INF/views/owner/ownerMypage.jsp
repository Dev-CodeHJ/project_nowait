<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../includes/header.jsp" %>
<style>
	table {
	margin: auto;
    border: 1px solid black;
    border-collapse: collapse;
	}
	th, td {
    text-align: center;
    border: 1px solid black;
    padding: 10px;
    }
</style>
  <section class="food_section layout_padding-bottom">
    <div class="container">
         <h2 align="center" style="padding: 10px; margin: 10px;">내 정보</h2>
         <table>
            <tr>
               <th>아이디</th>
               <td>${member.ownerId}</td>
            </tr>
            <tr>
               <th>비밀번호</th>
               <td>${member.ownerPw}</td>
            </tr>
            <tr>
				<th>이름</th>
				<td>${member.ownerName}</td>
			</tr>
			<tr>
				<td>생일</td>
				<td>${member.ownerBirth}</td>
			</tr>
			<tr>
				<th>전화번호</th>
				<td>${member.ownerPhone}</td>
			</tr>
			<tr>
				<td>이메일</td>
				<td>${member.ownerEmail}</td>
			</tr>
            <tr>
            	<td colspan="2">
           			<button type="button" class="btn btn-primary" style="margin: 30px;" onclick="location.href='/owner/ownerUpdate'">회원정보 수정</button>
           			<button type="button" class="btn btn-danger" style="margin: 30px;" onclick="location.href='/owner/ownerDelete'">회원 탈퇴</button>
            	</td>
          	</tr>
         </table>
    </div>
  </section>
  
  
  <%@include file="../includes/footer.jsp" %>
</body>
</html>