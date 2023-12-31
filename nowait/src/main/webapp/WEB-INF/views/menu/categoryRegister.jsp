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
			  <section class="food_section layout_padding-bottom">
			    <div class="container">
		            <form id="frm1" action="/menu/categoryRegister" method="post" style="padding: 100px;">
				        <h2 align="center">카테고리 등록 페이지</h2>
				         
				        <table>
				            <tr style="display: none;">
								<td>
									<input type="text" name="crNum" id="crNum" value="${crNum}">
									<input type="text" name="id" id="id" value="menu_category">
								</td>
							</tr>
				            <tr>
				               <th>카테고리 번호</th>
				               <td><input type="text" name="name" id="name" placeholder="중복불가"></td>
				            </tr>
				            <tr>
								<th>카테고리 이름</th>
								<td><input type="text" name="value" id="value"></td>
							</tr>
				            <tr>
				            	<td colspan="2" align="center">
				                   <div class="btn-box">
				                      <a href="#" onclick="category_move()" style="background-color: blue;">카테고리관리</a>
				                      <a href="#" onclick="return register_chk()" id="btn_register" style="margin-left: 30px; background-color: green;">등록하기</a>
				                      <!-- <button type="button" class="btn btn-success" onclick="return register_chk()" id="btn_register" style="margin: 30px;">등록하기</button> -->
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
    	
    	var num_pattern = /\d/;
    	
	      if ($("#name").val() == "") {
	          alert("카테고리 번호를 입려해주세요!");
	          $("#name").focus();
	          return false;
	      } else if (!num_pattern.test($("#name").val())) {
	          alert("카테고리 번호에는 숫자만 들어갈 수 있습니다!");
	          $("#name").focus();
	          return false;
	          
	      } else if ($("#name").val() <= 0) {
	          alert("카테고리 번호는 1부터 설정할 수 있습니다!");
	          $("#name").focus();
	          return false;
	          
	      }  else if ($("#value").val() == "") {
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
	function store_move() {
	    document.getElementById('frm').action="/store/storeOwnerGet";
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