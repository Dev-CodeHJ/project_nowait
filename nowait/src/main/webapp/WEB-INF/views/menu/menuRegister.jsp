<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@include file="../includes/header.jsp" %>
<style>
	table {
	margin-left: 15%;
	width: 550px;
    border: 1px solid black;
    border-collapse: collapse;
	}
	th, td {
    text-align: center;
    border: 1px solid black;
    padding: 10px;
    }
	<%--
    --%>
</style>

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
				  <li class="list-group-item"><a href="#" onclick="storeUpdate_move()">가게정보 수정</a></li>
				  <li class="list-group-item"><a href="#" onclick="storeDelete_move()">가게정보 삭제</a></li>
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
		            <form id="frm1" action="/menu/menuRegister" enctype="multipart/form-data" method="post" style="padding: 100px;">
				        <h2 align="center">메뉴 등록 페이지</h2>
				         
				        <table>
				            <tr style="display: none;">
								<td><input type="text" name="crNum" id="crNum" value="${crNum}"></td>
							</tr>
				            <tr>
				               <th>메뉴 이름</th>
				               <td><input type="text" name="menuName" id="menuName"></td>
				            </tr>
				            <tr>
								<th>메뉴 카테고리</th>
								<td>
									<select name="menuCategory" id="menuCategory">
										<option value="99" selected="selected">-선택-</option>
										<c:forEach items="${menuCategoryList}" var="menuCategory">
											<option value="${menuCategory.name}">
												${menuCategory.value}
											</option>
										</c:forEach>
									</select>
								</td>
							</tr>
							<tr>
								<td>메뉴 사진</td>
								<td><input type="file" name="menuImg" id="menuImg"></td>
							</tr>
							<tr>
								<th>가격</th>
								<td><input type="text" name="price" id="price"></td>
							</tr>
							<tr>
								<th>인기메뉴 여부</th>
								<td>
									<select name="popularity" id="popularity">
										<option value="99" selected="selected">-선택-</option>
										<c:forEach items="${popularityList}" var="popular">
											<option value="${popular.name}">
												${popular.value}
											</option>
										</c:forEach>
									</select>
								</td>
							</tr>
							<tr>
								<th>품절 여부</th>
								<td>
									<select name="menuStatus" id="menuStatus">
										<option value="99" selected="selected">-선택-</option>
										<c:forEach items="${menuStatusList}" var="status">
											<option value="${status.name}">
												${status.value}
											</option>
										</c:forEach>
									</select>
								</td>
							</tr>
				            <tr>
				            	<td colspan="2" align="center">
				                   <div class="btn-box">
				                      <a href="#" onclick="category_move()" style="background-color: blue;">카테고리관리</a>
				                      <a href="#" onclick="return register_chk()" id="btn_register" style="background-color: green; margin-left: 20px;">등록하기</a>
				                   </div>
				            	</td>
				          	</tr>
				  	  	</table>
					</form>
			      	<form id="frm" action="/menu/menuList">
	          			<input type="hidden" name="crNum" value="${crNum}">
	          		</form>
			    </div>
			  </section>
	      </div>
	  </div>
	</div>

  <%@include file="../includes/footer.jsp" %>
<script type="text/javascript">
	$(document).ready(function() {
    $("#btn_register").click(function register_chk() {
    	  
	      if ($("#menuName").val() == "") {
	          alert("메뉴 이름을 입려해주세요!");
	          $("#menuName").focus();
	          return false;
	          
	      } else if ($("#menuCategory").val() == "99") {
	          alert("메뉴 카테고리를 선택해주세요!");
	          $("#menuCategory").focus();
	          return false;
	          
	      } else if ($("#popularity").val() == "99") {
	          alert("인기메뉴 여부를 선택해주세요!");
	          $("#popularity").focus();
	          return false;
	          
	      } else if ($("#menuStatus").val() == "99") {
	          alert("품절 여부를 선택해주세요!");
	          $("#menuStatus").focus();
	          return false;
	      }
	      document.getElementById('frm1').submit();
          return true;
	  });
    });
</script>
<script type="text/javascript">
	function storeUpdate_move() {
		document.getElementById('frm').action="/store/storeUpdate";
		document.getElementById('frm').submit();
	}
	
	function storeDelete_move() {
	    document.getElementById('frm').action="/store/storeDelete";
		document.getElementById('frm').submit();
	}
	
	function menu_move() {
	    document.getElementById('frm').action="/menu/menuList";
		document.getElementById('frm').submit();
	}
	
	function category_move() {
		document.getElementById('frm').action="/menu/menuCategory";
		document.getElementById('frm').submit();
	}
</script>
</body>
</html>