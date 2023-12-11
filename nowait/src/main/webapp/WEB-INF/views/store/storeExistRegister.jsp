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
      <form id="frm" action="/store/storeExistRegister" method="post" style="padding: 100px;">
      	<h2 align="center">(기존)가게 등록 페이지</h2>
      	<table style="margin: auto; border-collapse: separate; border-spacing: 20px 20px;">
      		<tr>
      			<th>사업자 등록번호</th>
      			<td><input type="text" name="crNum" id="crNum"></td>
      		</tr>
      		<tr>
      			<th>가게 비밀번호</th>
      			<td><input type="password" name="secretCode" id="secretCode"></td>
      		</tr>
      		<tr>
      			<td align="center">
	            	<div class="btn-box">
				       	<a href="#" onclick="owner_move()" style="background-color: green;">이전</a>
	                </div>
            	</td>
      			<td align="center">
		       		<div class="btn-box">
		       			<a href="#" onclick="return login_chk()">등록하기</a>
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
		function login_chk() {
		if(document.getElementById("crNum").value==''){
			alert("사업자 등록번호를 입력해주세요!");
			$("#crNum").focus();
			return false;
		}
		if(document.getElementById("secretCode").value==''){
			alert("비밀번호를 입력해주세요!");
			$("#secretCode").focus();
			return false;
		}
		document.getElementById('frm').submit();
		}
</script>
<script type="text/javascript">
	function owner_move() {
		location.href="/owner/ownerHome";
	}
</script>
</body>
</html>