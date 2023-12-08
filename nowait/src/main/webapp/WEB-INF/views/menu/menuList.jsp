<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@include file="../includes/header.jsp" %>
<style>
	table {
	margin: auto;
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
         		<h2 align="center" style="padding: 10px; margin: 10px;">메뉴관리 페이지</h2>
				  <section class="food_section layout_padding-bottom">
				    <div class="container">
			            <c:forEach items="${menuList}" var="menu">
				        	<table>
				            	<tr>
				            		<th rowspan="3">
				            			메뉴이름 : ${menu.menuName}
			            			</th>
				            		<td>가격 : ${menu.price}원</td>
				            		<th rowspan="3"><img src="/resources/images/f2.png" alt=""></th>
				            	</tr>
				            	<tr>
				            		<td>
				            			<c:choose>
					            			<c:when test="${menu.popularity eq 1}">
					            				인기메뉴
					            			</c:when>
					            			<c:otherwise>-</c:otherwise>
				            			</c:choose>
				            		</td>
			            		</tr>
			            		<tr>
				            		<td>
				            		<c:choose>
					            			<c:when test="${menu.menuStatus eq 1}">
					            				상태 : 품절
					            			</c:when>
					            			<c:otherwise>상태 : 판매가능</c:otherwise>
				            			</c:choose>
				            		
				            		</td>
			            		</tr>
					            <tr>
					            	<td colspan="3">
					       				<button type="submit" class="btn btn-primary" style="margin: 30px;" onclick="menuUpdate_move()">메뉴정보 수정</button>
					           			<button type="submit" class="btn btn-danger" style="margin: 30px;" onclick="menuDelete_move()">메뉴정보 삭제</button>
					            	</td>
					          	</tr>
					          	<tr style="display: none;">
					          		<td>
					           			<form id="frm" action="/menu/menuUpdate">
					           				<input type="text" name="crNum" value="${menu.crNum}">
					           				<input type="text" name="menuNum" value="${menu.menuNum}">
					           			</form>
					       			</td>
					   			</tr>
				        	</table>
			            </c:forEach>
			            <!-- 
			             style="cursor:pointer;color:#blue;" onClick="location.href='/menu/menuGet?menuNum=${menu.menuNum}'"
			             -->
				    </div>
				  </section>
	      </div>
	  </div>
	</div>

  <%@include file="../includes/footer.jsp" %>
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
	
	function menuUpdate_move() {
		document.getElementById('frm').action="/menu/menuUpdate";
		document.getElementById('frm').submit();
	}
	
	function menuDelete_move() {
	    if(confirm("[${menu.menuName}] 메뉴를 정말 삭제하시겠습니까?")) {
			document.getElementById('frm').action="/menu/menuDelete";
			document.getElementById('frm').submit();
	    }
	}
</script>
</body>
</html>