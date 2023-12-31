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
				  <li class="list-group-item"><a href="#" onclick="store_move()">가게관리</a></li>
				  <li class="list-group-item"><a href="#" onclick="menu_move()">메뉴관리</a></li>
				  <li class="list-group-item"><a href="#">리뷰관리</a></li>
				  <li class="list-group-item"><a href="#">주문&예약관리</a></li>
				</ul>
			</div>
		</div> 
		
		<!-- body -->
		  <div class="col-md-9">
         		<h2 style="padding: 10px; margin-left: 32%;">카테고리관리 페이지</h2>
				  <section class="food_section layout_padding-bottom">
				    <div class="container">
						<c:forEach items="${menuCategoryList}" var="menuCategory">
				        	<form id="frm${menuCategory.name}" action="/menu/categoryUpdate">
					        	<table>
					            	<tr style="display: none;">
						          		<td>
					           				<input type="text" name="crNum" value="${menuCategory.crNum}">
			    							<input type="text" name="name" value="${menuCategory.name}">
						       			</td>
						   			</tr>
					            	<tr>
					            		<td>카테고리 번호</td>
					            		<td>카테고리 이름</td>
					            	</tr>
					            	<tr>
					            		<th>${menuCategory.name}</th>
					            		<th>${menuCategory.value}</th>
					            	</tr>
						            <tr>
						            	<td colspan="2">
						       				<button type="submit" class="btn btn-info" style="margin: 30px;" onclick="categoryUpdate_move(${menuCategory.name})">카테고리 수정</button>
						           			<button type="button" class="btn btn-danger" style="margin: 30px;" onclick="categoryDelete_move(${menuCategory.name})">카테고리 삭제</button>
						            	</td>
						          	</tr>
					        	</table>
				        	</form>
			            </c:forEach>
			            <form id="frm" action="/menu/menuList">
	           				<input type="hidden" name="crNum" value="${crNum}">
	           			</form>
			            <div class="btn-box" style="margin-right: 20%;">
				    		<a href="#" onclick="menu_move()">메뉴 관리</a>
					    	<a href="#" onclick="categoryRegister_move()" style="margin-left: 20px; background-color: green;">카테고리 등록</a>
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
		if(${insertOk}==0){
			alert("이미 존재하는 카테고리 번호입니다!");
			categoryRegister_move();
		} else if(${insertOk}==1){
			alert("카테고리가 성공적으로 등록되었습니다.");
		}
    });
</script>
<script type="text/javascript">
	$(document).ready(function() {
		if(${deleteOk}==0){
			alert("카테고리 삭제에 실패하셨습니다!");
		} else if(${deleteOk}==1){
			alert("카테고리가 성공적으로 삭제되었습니다.");
		}
    });
</script>
<script type="text/javascript">
	$(document).ready(function() {
		if(${updateOk}==0){
			alert("이미 존재하는 카테고리 번호입니다!");
		} else if(${updateOk}==1){
			alert("카테고리가 성공적으로 수정되었습니다.");
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
	
	function categoryUpdate_move(num) {
		document.getElementById('frm'+num).action="/menu/categoryUpdate";
		document.getElementById('frm'+num).submit();
	}
	
	function categoryDelete_move(num) {
	    if(confirm("선택하신 카테고리를 정말 삭제하시겠습니까?")) {
			document.getElementById('frm'+num).action="/menu/categoryDelete";
			document.getElementById('frm'+num).submit();
	    }
	}
	
	function categoryRegister_move() {
		document.getElementById('frm').action="/menu/categoryRegister";
		document.getElementById('frm').submit();
	}
</script>
</body>
</html>