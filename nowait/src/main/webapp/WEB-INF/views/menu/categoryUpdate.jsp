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
		            <form id="frm1" action="/menu/categoryUpdate" method="post" style="padding: 100px;">
				        <h2 align="center">메뉴 수정 페이지</h2>
				         
				        <table>
				            <tr style="display: none;">
								<td>
									<input type="text" name="crNum" id="crNum" value="${category.crNum}">
									<input type="text" name="getName" id="getName" value="${category.name}">
								</td>
							</tr>
				            <tr>
				               <th>카테고리 번호</th>
				               <td><input type="text" name="name" id="name" value="${category.name}"></td>
				            </tr>
				            <tr>
								<th>카테고리 이름</th>
								<td><input type="text" name="value" id="value" value="${category.value}"></td>
							</tr>
				            <tr>
				            	<td colspan="2" align="center">
				                   <div class="btn-box">
				                      <a href="#" onclick="category_move()" style="background-color: blue;">카테고리관리</a>
				                      <a href="#" onclick="return register_chk()" id="btn_register" style="margin-left: 30px; background-color: green;">수정완료</a>
				                   </div>
				            	</td>
				          	</tr>
				  	  	</table>
					</form>
			      	<form id="frm" action="/menu/menuList">
	          			<input type="hidden" name="crNum" value="${category.crNum}">
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
    	
    	var num_pattern = /\d/;
    	
	      if ($("#name").val() == "") {
	          alert("카테고리 번호를 입려해주세요!");
	          $("#name").focus();
	          return false;
	      } else if (!num_pattern.test($("#name").val())) {
	          alert("카테고리 번호에는 숫자만 들어갈 수 있습니다!");
	          $("#name").focus();
	          return false;
	          
	      } else if ($("#value").val() == "") {
	          alert("카테고리 이름을 입려해주세요!");
	          $("#value").focus();
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