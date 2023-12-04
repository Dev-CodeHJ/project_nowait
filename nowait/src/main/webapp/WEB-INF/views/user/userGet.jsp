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
               <td>${member.userId}</td>
            </tr>
            <tr>
				<th>이름</th>
				<td>${member.userName}</td>
			</tr>
			<tr>
				<td>생일</td>
				<td>${member.userBirth}</td>
			</tr>
			<tr>
				<th>전화번호</th>
				<td>${member.userPhone}</td>
			</tr>
			<tr>
				<td>이메일</td>
				<td>${member.userEmail}</td>
			</tr>
			  <tr>
	            <th>주소</th>
	            <td>${member.userAddr }</td>
	        </tr>
	        <tr>  
	            <th>회원등급</th>
	            <td>${member.grade}</td>
	        </tr>
	        <tr>    
	            <th>가입날짜</th>
	            <td>${member.userRegdate}</td>
                  </tr>
            <tr>
            	<td colspan="2">
           		 <button type="button" class="btn btn-primary" style="margin: 30px;" onclick="location.href='/user/userModify'">회원정보 수정</button>
           		 <button type="button" class="btn btn-danger" style="margin: 30px;" onclick="location.href='/user/userRemove'">회원 탈퇴</button>
            	</td>
          	</tr>
         </table>
         

    </div>
  </section>
  
  
  <%@include file="../includes/footer.jsp" %>
  <link rel="stylesheet" href="//code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
  <link rel="stylesheet" href="/resources/demos/style.css">
  <script src="https://code.jquery.com/jquery.js"></script>
  <script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
  <script type="text/javascript" src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
   
</body>
</html>