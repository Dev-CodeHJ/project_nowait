<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@include file="../includes/header.jsp" %>
<!DOCTYPE html>
<html lang="en">

	<div class="container-fluid">
	  <div class="row">
	  	<div class="col-md-3" style="padding-top: 30px;">
			<!-- 사이드 바 메뉴-->
			<div class="panel panel-info">
			  <div class="panel-heading">
		    	<!-- 패널 타이틀1 -->
		  		<h3 class="panel-title">
	   			  <span>가게 관리 메뉴</span>
		  		</h3>
			  </div>
				<!-- 사이드바 메뉴목록1 -->
				<ul class="list-group">
				  <li class="list-group-item"><a href="#" onclick="store_move()">가게관리</a></li>
				  <li class="list-group-item"><a href="#" onclick="menu_move()">메뉴관리</a></li>
				  <li class="list-group-item"><a href="#">리뷰관리</a></li>
				  <li class="list-group-item"><a href="#">주문&예약관리</a></li>
				</ul>
			</div>
		</div> 
		
		<!-- body -->
		  <div class="col-md-9">
		  	<section class="food_section layout_padding-bottom">
			    <div class="container">
			      <form id="frm1" action="/store/storeDelete" method="post" style="padding: 100px;">
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
					       			<a href="#" onclick="store_move()" style="background-color: green;">이전</a>
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
		            <form id="frm" action="/store/storeOwnerGet">
           				<input type="hidden" name="crNum" value="${crNum}">
           			</form>
			    </div>
			  </section>
	      </div>
	  </div>
	</div>

  <section class="food_section layout_padding-bottom">
    <div class="container">
      <div class="heading_container heading_center">
      </div>

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
		document.getElementById('frm1').action="/store/storeDelete";
		document.getElementById('frm1').submit();
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
	    document.getElementById('frm1').action="/store/ownerStoreDelete";
		document.getElementById('frm1').submit();
	}
</script>
<script type="text/javascript">
	function store_move() {
	    document.getElementById('frm').action="/store/storeOwnerGet";
		document.getElementById('frm').submit();
	}
	
	function menu_move() {
	    document.getElementById('frm').action="/menu/menuList";
		document.getElementById('frm').submit();
	}
</script>
</body>
</html>