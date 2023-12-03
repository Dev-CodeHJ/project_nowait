<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@include file="../includes/header.jsp" %>
<!DOCTYPE html>
<html lang="en">

  <section class="food_section layout_padding-bottom">
    <div class="container">
      <div class="heading_container heading_center">
      </div>
      <form id="frm" action="/owner/ownerDelete" method="post" style="padding: 100px;">
      	<h2 align="center">회원 탈퇴</h2>
      	<table style="margin: auto; border-collapse: separate; border-spacing: 20px 20px;">
      		<tr>
      			<th>아이디</th>
      			<td>
	               <input type="text" name="ownerId" id="ownerId" readonly="readonly" value="${member.ownerId}" style="text-align: center; background-color: silver;" >
               </td>
      		</tr>
      		<tr>
      			<th>비밀번호</th>
      			<td><input type="password" name="ownerPw" id="ownerPw"></td>
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
  <!-- end food section -->
  <%@include file="../includes/footer.jsp" %>
<script type="text/javascript">
	$(document).ready(function() {
		if(${deleteOk}==0){
			alert("비밀번호가 일치하지 않습니다!");
		} else if(${deleteOk}==1) {
			alert("회원정보가 성공적으로 탈퇴처리 되셨습니다.");
			location.replace("/owner/ownerLogout");
		}
	});
</script>
<script type="text/javascript">
	function delete_chk() {
		if(document.getElementById("ownerPw").value==''){
			alert("비밀번호를 입력해주세요!");
			$("#ownerPw").focus();
			return false;
		} else if(!confirm("정말로 탈퇴하시겠습니까?\n*탈퇴 후에는 회원정보는 복구되지 않습니다.")) {
			return false;
		}
		document.getElementById('frm').submit();
	}
</script>
</body>
</html>