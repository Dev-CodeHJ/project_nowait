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
      <form id="frm" action="/store/storeNewRegister" method="post" style="padding: 100px;">
         <h2 align="center">(신규)가게 등록 페이지</h2>
         <p align="center" style="color: grey;">(*표시는 필수 입력사항)</p>
         <table style="margin: auto; border-collapse: separate; border-spacing: 20px 20px;">
            <tr style="display: none;">
				<td><input type="text" name="ownerId" id="ownerId" value="${member.ownerId}"></td>
			</tr>
            <tr>
               <th>*사업자 등록번호</th>
               <td><input type="text" name="crNum" id="crNum"></td>
            </tr>
            <tr>
               <th>*가게 비밀번호</th>
               <td>
	               <input type="password" name="secretCode" id="secretCode">
               </td>
            </tr>
            <tr>
               <th>*비밀번호 확인</th>
               <td><input type="password" name="secretCode2" id="secretCode2"></td>
            </tr>
            <tr>
               <td colspan="2" align="right"><p style="color: grey;">*가게비밀번호는 가게정보 불러오기, 가게정보 삭제 시 사용됩니다.</p></td>
            </tr>
			<tr>
				<th>*가게 이름</th>
				<td><input type="text" name="storeName" id="storeName"></td>
			</tr>
            <tr>
				<th>*카테고리</th>
				<td>
					<select name="storeCategory">
						<option value="1" selected="selected">한식</option>
						<option value="2">일식</option>
						<option value="3">중식</option>
						<option value="4">양식</option>
						<option value="5">카페&디저트</option>
					</select>
				</td>
			</tr>
			<tr>
				<th>*주소</th>
				<td><input type="text" name="storeAddr" id="storeAddr"></td>
			</tr>
			<tr>
				<td>전화번호</td>
				<td><input type="text" name="storeTel" id="storeTel"></td>
			</tr>
			<tr>
				<td>이메일</td>
				<td><input type="text" name="storeEmail" id="storeEmail"></td>
			</tr>
			<tr>
				<td>영업시간</td>
				<td><input type="text" name="opentime" id="opentime"></td>
			</tr>
			<tr>
				<td>공지사항</td>
				<td><input type="text" name="storeInfo" id="storeInfo"></td>
			</tr>
            <tr>
            	<td colspan="2" align="center">
                   <div class="btn-box">
                      <a href="#" onclick="return join_chk()" id="btn_join">등록하기</a>
                   </div>
            	</td>
          	</tr>
         </table>
      </form>
      
    </div>
  </section>
  
  
  <%@include file="../includes/footer.jsp" %>
<script type="text/javascript">
	$(document).ready(function() {
    $("#btn_join").click(function join_chk() {
    	  
	      if ($("#crNum").val() == "") {
	          alert("사업자 등록번호를 입려해주세요!");
	          $("#crNum").focus();
	          return false;
	          
	      } else if ($("#secretCode").val() == "") {
	          alert("가게 비밀번호를 입력해주세요!");
	          $("#secretCode").focus();
	          return false;
	      } else if ($("#secretCode2").val() == "") {
	    	  alert("비밀번호확인을 입력해주세요!");
	          $("#secretCode2").focus();
	          return false;
	      } else if ($("#secretCode").val() != $("#secretCode2").val()) {
	          alert("비밀번호가 서로 일치하지않습니다.");
	          $("#secretCode2").focus();
	          return false;
	          
	      } else if ($("#storeAddr").val() == "") {
	          alert("가게 주소를 입력해주세요!");
	          $("#storeAddr").focus();
	          return false;
	      
	      }
	      document.getElementById('frm').submit();
          return true;
	  });
    });
</script>
</body>
</html>