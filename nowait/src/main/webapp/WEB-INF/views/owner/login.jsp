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
      	<h2>사장님 로그인페이지</h2>
      </div>
      <form id="frm" action="/owner/login" method="post" style="padding: 100px;">
      	<table style="margin: auto; border-collapse: separate; border-spacing: 20px 20px;">
      		<tr>
      			<th>아이디</th>
      			<td><input type="text" name="ownerId"></td>
      		</tr>
      		<tr>
      			<th>비밀번호</th>
      			<td><input type="password" name="ownerPw"></td>
      		</tr>
      		<tr>
      			<td colspan="2" align="center">
		       		<button type="button" class="btn-box" onclick="return login_chk()">로그인</button>
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
	$(document).ready(
		/*function(){
			var result = '<c:out value="${result}"/>';
 		
 		checkModal(result);
 		
 		function checkModal(result) {
 			if(result === '') {
 				return;
 			} else {
 				alert(result + "의 글이 등록되었습니다.")
 			}
 		}
		$("#regBtn").on("click",
				function() {
					self.location="/board/register";
				});
		}*/
		
		function login_chk() {
		if(document.getElementById("ownerId").value==''){
			alert("아이디를 입력해주십시오.");
			return false;
		}
		if(document.getElementById("ownerPw").value==''){
			alert("비밀번호를 입력해주십시오.");
			return false;
		}
		document.getElementById('frm').submit();
		}
	);
</script>
</body>
</html>