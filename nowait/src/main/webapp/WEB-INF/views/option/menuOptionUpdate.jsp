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
		            <form id="frm1" action="/option/menuOptionUpdate" method="post" style="padding: 100px;">
				        <h2 align="center">옵션 수정 페이지</h2>

				        <table>
				            <tr style="display: none;">
								<td>
									<input type="text" name="menuOptionNum" id="menuOptionNum" value="${option.menuOptionNum}">
									<input type="text" name="menuNum" id="menuNum" value="${option.menuNum}">
								</td>
							</tr>
				            <tr>
				               <th>옵션 이름</th>
				               <td><input type="text" name="option" id="option" value="${option.option}"></td>
				            </tr>
							<tr>
								<th>추가금액</th>
								<td><input type="text" name="optionPrice" id="optionPrice" value="${option.optionPrice}"></td>
							</tr>
							<tr>
								<th>품절 여부</th>
								<td>
									<select name="optionStatus" id="optionStatus">
										<option value="0"
											<c:if test="${option.optionStatus eq false}">selected="selected"</c:if>
										>판매가능</option>
										<option value="1"
											<c:if test="${option.optionStatus eq true}">selected="selected"</c:if>
										>품절</option>
									</select>
								</td>
							</tr>
				            <tr>
				            	<td colspan="2" align="center">
				                   <div class="btn-box" style="margin-top: 10px;">
				                      <a href="#" onclick="menuGet_move()" style="background-color: blue;">이전</a>
				                      <a href="#" onclick="return register_chk()" id="btn_register" style="background-color: green; margin-left: 20px;">수정완료</a>
				                   </div>
				            	</td>
				          	</tr>
				  	  	</table>

					</form>
			      	<form id="frm" action="/menu/menuList">
	          			<input type="hidden" name="crNum" value="${crNum}">
	          		</form>
	          		<form id="frm0" action="/menu/menuGet">
	          			<input type="hidden" name="menuNum" value="${menu.menuNum}">
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
    	
	      if ($("#option").val() == "") {
	          alert("옵션 이름을 입려해주세요!");
	          $("#option").focus();
	          return false;
	          
	      } else if (!num_pattern.test($("#optionPrice").val())) {
	    	  alert("가격을 입력해주세요!(가격 형식이 올바르지 않습니다!)");
	          $("#optionPrice").focus();
	          return false;
	          
	      } else if ($("#optionStatus").val() == "99") {
	          alert("품절 여부를 선택해주세요!");
	          $("#optionStatus").focus();
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
	
	function menuGet_move() {
	    document.getElementById('frm0').action="/menu/menuGet";
		document.getElementById('frm0').submit();
	}
</script>
</body>
</html>