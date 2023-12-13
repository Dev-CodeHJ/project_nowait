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
			      <form id="frm1" action="/store/storeUpdate" method="post" style="padding: 100px;">
			         <h2 align="center">가게정보 수정페이지</h2>
			         <p align="center" style="color: grey;">(*표시는 필수 입력사항)</p>
			         <table style="margin: auto; border-collapse: separate; border-spacing: 20px 20px;">
			            <tr style="display: none;">
							<td><input type="text" name="ownerId" id="ownerId" value="${member.ownerId}"></td>
						</tr>
			            <tr>
			               <th>*사업자 등록번호</th>
			               <td><input type="text" name="crNum" id="crNum" value="${store.crNum}" readonly="readonly"  style="text-align: center; background-color: silver;"></td>
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
							<td><input type="text" name="storeName" id="storeName" value="${store.storeName}"></td>
						</tr>
			            <tr>
							<th>*카테고리</th>
							<td>
								<select name="storeCategory">
									<c:forEach items="${categoryList}" var="category">
										<option value="${category.name}"
											<c:if test='${store.storeCategory eq category.name}'>
												selected="selected"
											</c:if>>
											${category.value}
										</option>
									</c:forEach>
								</select>
							</td>
						</tr>
						<tr>
							<th>*주소</th>
							<td><input type="text" name="storeAddr" id="storeAddr" value="${store.storeAddr}"></td>
						</tr>
						<tr>
							<td>전화번호</td>
							<td><input type="text" name="storeTel" id="storeTel" value="${store.storeTel}"></td>
						</tr>
						<tr>
							<td>이메일</td>
							<td><input type="text" name="storeEmail" id="storeEmail" value="${store.storeEmail}"></td>
						</tr>
						<tr>
							<td>영업시간</td>
							<td><input type="text" name="opentime" id="opentime" value="${store.opentime}"></td>
						</tr>
						<tr>
							<td>공지사항</td>
							<td><input type="text" name="storeInfo" id="storeInfo" value="${store.storeInfo}"></td>
						</tr>
			            <tr>
			            	<td align="center">
					       		<div class="btn-box">
					       			<a href="#" onclick="store_move()" style="background-color: green;">이전</a>
					       		</div>
						    </td>
			            	<td align="center">
			                   <div class="btn-box">
			                      <a href="#" onclick="return join_chk()" id="btn_join">수정완료</a>
			                   </div>
			            	</td>
			          	</tr>
			         </table>
			      </form>
		            <form id="frm" action="/store/storeOwnerGet">
           				<input type="hidden" name="crNum" value="${store.crNum}">
           			</form>
			    </div>
			  </section>
	      </div>
	  </div>
	</div>
  
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
	      document.getElementById('frm1').submit();
          return true;
	  });
    });
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