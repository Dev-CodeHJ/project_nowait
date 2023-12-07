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
      <form id="frm" action="/user/userLogin" method="post" style="padding: 100px;">
         <h2 align="center">사용자 로그인</h2>
         <table style="margin: auto; border-collapse: separate; border-spacing: 20px 20px;">
            <tr>
               <th>아이디</th>
               <td><input type="text" name="userId" id="userId"></td>
            </tr>
            <tr>
               <th>비밀번호</th>
               <td><input type="password" name="userPw" id="userPw"></td>
            </tr>
            <tr>
               <td colspan="2" align="center">
                   <div class="btn-box">
                      <a href="#" onclick="return login_chk()">로그인</a>
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
		if(${result}==0){
			alert("비밀번호가 일치하지 않습니다!");
		} else if(${result}==-1){
			alert("아이디가 일치하지 않습니다!");
		}
	});
</script>
<script type="text/javascript">
      function login_chk() {
	      if(document.getElementById("userId").value==''){	    	 
	         alert("아이디를 입력해주세요!");
	         $("#userId").focus();
	         return false;
	      }
	      if(document.getElementById("userPw").value==''){
	         alert("비밀번호를 입력해주세요!");
	         $("#userPw").focus();
	         return false;
	      } else {
	      document.getElementById('frm').submit();
	      }
      }
</script>
</body>
</html>