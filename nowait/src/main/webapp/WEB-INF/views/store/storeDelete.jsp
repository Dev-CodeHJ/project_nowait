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
      <form id="frm" action="/store/storeDelete" method="post" style="padding: 100px;">
      	<h2 align="center">가게정보 삭제페이지</h2>
      	<table style="margin: auto; border-collapse: separate; border-spacing: 20px 20px;">
      		<tr style="display: none;">
				<td><input type="text" name="crNum" value="${crNum}"></td>
			</tr>
      		<tr>
      			<th>사업자 등록번호</th>
      			<td><input type="text" name="crNum2" id="crNum2"></td>
      		</tr>
      		<tr>
      			<th>가게 비밀번호</th>
      			<td><input type="password" name="secretCode" id="secretCode"></td>
      		</tr>
      		<tr>
      			<td align="center">
		       		<div class="btn-box">
		       			<a href="/store/storeOwnerGet/${crNum}" style="background-color: green;">가게정보페이지</a>
		       		</div>
			    </td>
      			<td align="center">
		       		<div class="btn-box">
		       			<a href="#" style="background-color: red;" onclick="return delete_chk()">가게정보 삭제</a>
		       		</div>
			    </td>
		    </tr>
		    <tr>
			    <td colspan="2" align="center">
		       		<div class="btn-box">
		       			<a href="#" onclick="return myStoreListDelete_chk()">내 가게 목록에서 삭제</a>
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
	function delete_chk() {
		if(document.getElementById("crNum2").value==''){
			alert("사업자 등록번호를 입력해주세요!");
			$("#crNum2").focus();
			return false;
		}
		if(document.getElementById("secretCode").value==''){
			alert("비밀번호를 입력해주세요!");
			$("#secretCode").focus();
			return false;
		}
		if(!confirm("해당 가게를 완전히 삭제하시겠습니까?\n*삭제 시 가게정보는 모든 회원들로부터 완전히 사라집니다.")) {
			return false;
		}
		document.getElementById('frm').submit();
	}
	
	function myStoreListDelete_chk() {
		if(document.getElementById("crNum2").value==''){
			alert("사업자 등록번호를 입력해주세요!");
			$("#crNum2").focus();
			return false;
		}
		if(document.getElementById("secretCode").value==''){
			alert("비밀번호를 입력해주세요!");
			$("#secretCode").focus();
			return false;
		}
		if(!confirm("해당 가게를 내 가게 목록에서 삭제하시겠습니까?\n*삭제 후 가게정보는 남아있지만 내 가게 목록에서는 사라집니다.")) {
			return false;
		}
	    document.getElementById('frm').action="/store/ownerStoreDelete";
		document.getElementById('frm').submit();
	}
</script>
</body>
</html>