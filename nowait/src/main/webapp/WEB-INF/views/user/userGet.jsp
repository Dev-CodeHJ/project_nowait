<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../includes/header.jsp" %>
<html>
<style>
	@font-face {
   font-family: 'Tenada';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2210-2@1.0/Tenada.woff2') format('woff2');
    font-weight: normal;
    font-style: normal;
	}
	h2, span{
	   font-family: 'Tenada';
	}
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
<div class="container-fluid">
	  <div class="row">
	  	<div class="col-md-3" style="padding-top: 30px; right-padding:100px; float:left;">
			<!-- 사이드 바 메뉴-->
			<div class="panel panel-info">
			  <div class="panel-heading">
		    	<!-- 패널 타이틀1 -->
		  		<h3 class="panel-title">
	   			  <span>주문,예약,리뷰 관리</span>
		  		</h3>
			  </div>
				<!-- 사이드바 메뉴목록1 -->
			<form id="frm">
				<ul class="list-group">
				  <li class="list-group-item"><a href="#" onclick="userGet_move()">회원정보</a></li>		
				  <li class="list-group-item"><a href="#" onclick="orderList_move()">주문내역</a></li>
				  <li class="list-group-item"><a href="#" onclick="reviewList_move()">리뷰내역</a></li>
				  <li class="list-group-item"><a href="#">장바구니</a></li>
				  <li class="list-group-item"><a href="#" onclick="serviceCenter_move()">고객센터</a></li>
				</ul>
			</form>
			</div>
		</div> 

  <section class="food_section layout_padding-bottom" style="margin-left:250px; float:left;">
    <div class="container" >
         <h2 align="center" style="padding: 20px;">내 정보</h2>
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
           		 <button type="button" class="btn btn-info" style="margin: 30px;" onclick="location.href='/user/userModify'">회원정보 수정</button>
           		 <button type="button" class="btn btn-info" style="margin: 30px;" onclick="location.href='/user/userRemove'">회원 탈퇴</button>
            	</td>
          	</tr>
         </table>
         

    </div>
  </section>
  </div>
  </div>
  
<%@include file="../includes/footer.jsp" %>
<link rel="stylesheet" href="//code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
<link rel="stylesheet" href="/resources/demos/style.css">
<script src="https://code.jquery.com/jquery.js"></script>
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
<script type="text/javascript" src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript">

	function userGet_move() {
	    document.getElementById('frm').action="/user/userGet";
		document.getElementById('frm').submit();
	}
	
	function orderList_move() {
	    document.getElementById('frm').action="/order/userOrderList";
		document.getElementById('frm').submit();
	}
	
	function reviewList_move() {
	    document.getElementById('frm').action="/board/userReview";
		document.getElementById('frm').submit();
	}
	
	function serviceCenter_move() {
	    document.getElementById('frm').action="/user/serviceCenter";
		document.getElementById('frm').submit();
	}
</script>
</body>
</html>