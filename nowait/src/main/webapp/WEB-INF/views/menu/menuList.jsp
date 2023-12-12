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
         			<h2 style="padding: 10px; margin-left: 25%;">메뉴관리 페이지</h2>
		            <c:forEach items="${menuList}" var="menu">
			        	<form id="frm${menu.menuNum}" action="/menu/menuUpdate">
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
					       				<button type="submit" class="btn btn-primary" style="margin: 30px;" onclick="menuGet_move(${menu.menuNum})">상세정보</button>
					       				<button type="submit" class="btn btn-info" style="margin: 30px;" onclick="menuUpdate_move(${menu.menuNum})">수정</button>
					           			<button type="button" class="btn btn-danger" style="margin: 30px;" onclick="menuDelete_move(${menu.menuNum})">삭제</button>
					            	</td>
					          	</tr>
					          	<tr style="display: none;">
					          		<td>
				           				<input type="text" name="menuNum" value="${menu.menuNum}">
					       			</td>
					   			</tr>
				        	</table>
			        	</form>
		            </c:forEach>
		            <form id="frm" action="/menu/menuList">
           				<input type="hidden" name="crNum" value="${crNum}">
           			</form>
		            <div class="btn-box" style="margin-right: 30%;">
				    	<a href="#" onclick="category_move()">카테고리 관리</a>
				    	<a href="#" onclick="menuRegister_move()" style="margin-left: 20px; background-color: green;">메뉴 등록</a>
				    </div>
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
	$(document).ready(function() {
	  if(${insertOk}==1){
			alert("메뉴가 성공적으로 등록되었습니다.");
		} else if(${insertOk}==0){
			alert("메뉴 등록에 실패하셨습니다!");
		}
    });
</script>
<script type="text/javascript">
	$(document).ready(function() {
	  if(${updateOk}==1){
			alert("메뉴가 성공적으로 수정되었습니다.");
		} else if(${updateOk}==0){
			alert("메뉴 수정에 실패하셨습니다!");
		}
    });
</script>
<script type="text/javascript">
	$(document).ready(function() {
	  if(${deleteOk}==1){
			alert("메뉴가 성공적으로 삭제되었습니다.");
		} else if(${deleteOk}==0){
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
	
	function menuGet_move(menuNum) {
		document.getElementById('frm'+menuNum).action="/menu/menuGet";
		document.getElementById('frm'+menuNum).submit();
	}
	
	function menuUpdate_move(menuNum) {
		document.getElementById('frm'+menuNum).action="/menu/menuUpdate";
		document.getElementById('frm'+menuNum).submit();
	}
	
	function menuDelete_move(menuNum) {
	    if(confirm("선택하신 메뉴를 정말 삭제하시겠습니까?")) {
			document.getElementById('frm'+menuNum).action="/menu/menuDelete";
			document.getElementById('frm'+menuNum).submit();
	    }
	}
	
	function menuRegister_move() {
		document.getElementById('frm').action="/menu/menuRegister";
		document.getElementById('frm').submit();
	}
	
	function category_move() {
		document.getElementById('frm').action="/menu/menuCategory";
		document.getElementById('frm').submit();
	}
</script>
</body>
</html>