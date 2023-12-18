<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@include file="../includes/header.jsp" %>
<!DOCTYPE html>
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
	
	
</style>
 <div class="row">
	  	<div class="col-md-3" style="padding: 30px; float:left;">
			<!-- 사이드 바 메뉴-->
			<div class="panel panel-info">
			  <div class="panel-heading">
		    	<!-- 패널 타이틀1 -->
		  		<h3 class="panel-title">
	   			  <span>가게 관리 메뉴</span>
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
	
	 <section class="food_section layout_padding-bottom">
    <div class="container">
      <form id="frm2" action="/user/userRemove" method="post" style="padding: 100px;">
      	<h2 style="margin-left:300px">회원 탈퇴 &nbsp; &nbsp;<span style="font-size:15px; color:red;">*비밀번호를 입력하세요</span></h2>   
      	<table style="margin: auto; border-collapse: separate; border-spacing: 20px 20px;">
      		<tr>
      			<th>아이디</th>
      			<td>
	               <input type="text" name="userId" id="userId" readonly="readonly" value="${member.userId}" style="text-align: center; background-color: silver;" >
               </td>
      		</tr>
      		<tr>
      			<th>비밀번호</th>
      			<td><input type="password" name="userPw" id="userPw"></td>
      		</tr>
      		<tr>
      			<td colspan="2" align="center">
		       		<div class="btn-box">
		       			<a href="#" onclick="return delete_chk()">비밀번호 입력</a>
		       		</div>
			    </td>
		    </tr>
		    <tr>
		    	<td align="center" colspan="2">
	       		</td>
       		</tr>
      	</table>
      </form>
    </div>
  </section>
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
<script type="text/javascript">
	$(document).ready(function() {
		if(${deleteOk}==0){
			alert("비밀번호가 일치하지 않습니다!");
		} else if(${deleteOk}==1) {
			alert("회원정보가 성공적으로 탈퇴처리 되셨습니다.");
			location.replace("/user/userLogout");
		}
	});
</script>
<script type="text/javascript">
	function delete_chk() {
		if(document.getElementById("userPw").value==''){
			alert("비밀번호를 입력해주세요!");
			$("#userPw").focus();
			return false;
		} else if(!confirm("정말로 탈퇴하시겠습니까?\n*탈퇴 후에는 회원정보는 복구되지 않습니다.")) {
			return false;
		}
		document.getElementById('frm2').submit();
	}
</script>

</body>
</html>
