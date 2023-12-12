<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@include file="../includes/header.jsp" %>
<style>
	table {
    border: 1px solid black;
    border-collapse: collapse;
	}
	th {
    text-align: center;
    border: 1px solid black;
    padding: 10px;
    }
    td {
    color: orange;
    font-weight: bold;
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
         			<h2 style="padding: 10px; margin-left: 25%;">메뉴 상세정보</h2>
		        	<form id="frm0" action="/menu/menuUpdate">
			        	<table>
			            	<tr>
			            		<th>메뉴 이름</th><th>메뉴 카테고리</th><th>가격</th><th>인기메뉴 여부</th><th>품절 여부</th>
			            		<th rowspan="3">
			            			<!-- <img src="|/images/${imageFile.getStoreFileName()}|" width="300" height="300"/> -->
			            			<img src="/resources/images/${menu.storeFileName}" alt="${menu.uploadFileName}" width="200" height="200">
			            		</th>
			            	</tr>
			            	<tr>
			            		<td>${menu.menuName}</td>
			            		<td>
			            			<c:forEach items="${menuCategoryList}" var="menuCategory">
				            			<c:if test="${menu.menuCategory eq menuCategory.name}">
				            				${menuCategory.value}
				            			</c:if>
			            			</c:forEach>
			            		</td>
			            		<td>${menu.price}원</td>
			            		<td>
			            			<c:forEach items="${popularityList}" var="popular">
				            			<c:if test="${menu.popularity eq popular.name}">
				            				${popular.value}
				            			</c:if>
			            			</c:forEach>
			            		</td>
			            		<td>
			            			<c:choose>
			            				<c:when test="${menu.menuStatus eq false}">판매가능</c:when>
			            				<c:otherwise>품절</c:otherwise>
			            			</c:choose>
			            		</td>
		            		</tr>
				            <tr>
				            	<td colspan="5">
				       				<button type="button" class="btn btn-success" style="margin: 30px;" onclick="menu_move()">이전</button>
				       				<button type="submit" class="btn btn-info" style="margin: 30px;" onclick="menuUpdate_move()">수정</button>
				           			<button type="button" class="btn btn-danger" style="margin: 30px;" onclick="menuDelete_move()">삭제</button>
				            	</td>
				          	</tr>
				          	<tr style="display: none;">
				          		<td>
			           				<input type="text" name="menuNum" value="${menu.menuNum}">
				       			</td>
				   			</tr>
			        	</table>
		        	</form>
		            <form id="frm" action="/menu/menuList">
           				<input type="hidden" name="crNum" value="${menu.crNum}">
           			</form>
		            <div class="btn-box" style="margin-right: 30%;">
				    	<a href="#" onclick="optionRegister_move()" style="background-color: navy;">옵션 추가</a>
				    </div>
				    <c:forEach items="${optionList}" var="option">
			        	<form id="frm${option.menuOptionNum}" action="/option/menuOptionUpdate">
				        	<table>
				            	<tr>
				            		<th>옵션 이름</th><th>가격</th><th>품절 여부</th>
				            	</tr>
				            	<tr>
				            		<td>${option.option}</td>
				            		<td>${option.optionPrice}원</td>
				            		<td>
				            			<c:forEach items="${optionStatusList}" var="status">
					            			<c:if test="${option.optionStatus eq status.name}">
					            				${status.value}
					            			</c:if>
				            			</c:forEach>
				            		</td>
			            		</tr>
					            <tr>
					            	<td colspan="3">
					       				<button type="button" class="btn btn-info" style="margin: 30px;" onclick="optionUpdate_move(${option.menuOptionNum})">수정</button>
					           			<button type="button" class="btn btn-danger" style="margin: 30px;" onclick="optionDelete_move(${option.menuOptionNum})">삭제</button>
					            	</td>
					          	</tr>
					          	<tr style="display: none;">
					          		<td>
				           				<input type="text" name="menuOptionNum" value="${option.menuOptionNum}">
					       			</td>
					   			</tr>
				        	</table>
			        	</form>
				    </c:forEach>
			    </div>
			  </section>
	      </div>
	  </div>
	</div>

  <%@include file="../includes/footer.jsp" %>
<script type="text/javascript">
	$(document).ready(function() {
	  if(${deleteOk}==1){
			alert("메뉴가 성공적으로 삭제되었습니다.");
		} else if(${deleteOk}==1){
			alert("메뉴 삭제에 실패하셨습니다!");
		}
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
	
	function menuUpdate_move() {
		document.getElementById('frm0').action="/menu/menuUpdate";
		document.getElementById('frm0').submit();
	}
	
	function menuDelete_move() {
	    if(confirm("선택하신 메뉴를 정말 삭제하시겠습니까?")) {
			document.getElementById('frm0').action="/menu/menuDelete";
			document.getElementById('frm0').submit();
	    }
	}
	
	function optionRegister_move() {
		document.getElementById('frm0').action="/option/menuOptionRegister";
		document.getElementById('frm0').submit();
	}
	
	function optionUpdate_move(num) {
		document.getElementById('frm'+num).action="/option/menuOptionUpdate";
		document.getElementById('frm'+num).submit();
	}
	
	function optionDelete_move(num) {
		if(confirm("선택하신 옵션을 정말 삭제하시겠습니까?")) {
			document.getElementById('frm'+num).action="/option/menuOptionDelete";
			document.getElementById('frm'+num).submit();
		}
	}
</script>
</body>
</html>