<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="includes/header.jsp" %>
<style>
@font-face {
    font-family: 'HakgyoansimGaeulsopungB';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2307-2@1.0/HakgyoansimGaeulsopungB.woff2') format('woff2');
    font-weight: 700;
    font-style: normal;
}
h2{
	font-family:'HakgyoansimGaeulsopungB';
}

button{
	margin:20px;
}
</style>

<body>
	  
    <div class="heading_container heading_center" style="margin:50px">
    
    	<h2>기존 회원 로그인</h2>
    	<div class="user_option">
    		<button style="padding:20px" class="order_online" type="button" onclick="location.href='/user/userLogin'">손님으로 로그인</button>
    		<button style="padding:20px" class="order_online" type="button" onclick="location.href='/owner/ownerLogin'">사장님으로 로그인</button>
		</div>
	</div>
	
	<div class="heading_container heading_center" style="margin:50px">
		<h2>신규 회원가입</h2>
		<div class="user_option">
			<button style="padding:20px" class="order_online" type="button" onclick="location.href='/user/userJoinForm'">손님으로 회원가입</button>
			<button style="padding:20px" class="order_online" type="button" onclick="location.href='/owner/ownerJoin'">사장님으로 회원가입</button>
	 	</div>
	</div>
</body>

</html>
<%@include file="includes/footer.jsp" %>