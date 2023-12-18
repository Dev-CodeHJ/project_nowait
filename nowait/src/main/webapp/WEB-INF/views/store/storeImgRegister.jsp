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
	th, td {
    text-align: center;
    border: 1px solid black;
    padding: 10px;
    }
	<%--
    td {
    color: orange;
    font-weight: bold;
    text-align: center;
    border: 1px solid black;
    padding: 10px;
    }
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
         			<h2 style="padding: 10px; margin-left: 25%;">가게 대표사진 등록 페이지</h2>

			      	<!-- menuList -->
			      	<div class="filters-content">
				        <div class="row grid">
						    <c:forEach items="${menuList}" var="menu" varStatus="cnt">
					        	<form id="frm${cnt.count}" action="/store/storeImgRegister" method="post">
							      <div class="col-sm-6 col-lg-4 all">
						        	<table style="margin: 10px;">
						            	<tr>
						            		<td>메뉴 이름</td>
						            		<td rowspan="3">
						            			<!-- <img src="|/images/${imageFile.getStoreFileName()}|" width="300" height="300"/> -->
						            			<img src="/resources/images/${menu.storeFileName}" alt="${menu.uploadFileName}" width="200" height="200">
						            		</td>
						            	</tr>
						            	<tr>
						            		<th>${menu.menuName}</th>
					            		</tr>
							            <tr>
							            	<td	>
							       				<button type="submit" class="btn btn-success" onclick="imgRegister_move(${cnt.count})">대표사진 등록</button>
							            	</td>
							          	</tr>
							          	<tr style="display: none;">
							          		<td>
						           				<input type="text" name="crNum" value="${crNum}">
						           				<input type="text" name="uploadFileName" value="${menu.uploadFileName}">
						           				<input type="text" name="storeFileName" value="${menu.storeFileName}">
							       			</td>
							   			</tr>
						        	</table>
						          </div>
					        	</form>
						    </c:forEach>
					    </div>
			    	</div>
			    	
		            <form id="frm" action="/menu/menuList">
           				<input type="hidden" name="crNum" value="${crNum}">
           			</form>
		            <div class="btn-box" style="margin-right: 30%;">
				    	<a href="#" onclick="store_move()">이전</a>
				    </div>
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
	
	function imgRegister_move(num) {
		document.getElementById('frm'+num).action="/store/storeImgRegister";
		document.getElementById('frm'+num).submit();
	}
</script>
</body>
</html>