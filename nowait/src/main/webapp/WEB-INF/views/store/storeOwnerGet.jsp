<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
         		<h2 align="center" style="padding: 10px; margin: 10px;">가게 정보</h2>
				  <section class="food_section layout_padding-bottom">
				    <div class="container">
				         <table>
				            <tr>
				               <th>사업자 등록번호</th>
				               <td>${store.crNum}</td>
				            </tr>
				            <tr>
								<th>가게 이름</th>
								<td>${store.storeName}</td>
							</tr>
							<tr>
								<th>카테고리</th>
								<td>${storeCategory.value}</td>
							</tr>
							<tr>
								<th>주소</th>
								<td>${store.storeAddr}</td>
							</tr>
							<tr>
								<td>전화번호</td>
								<td>${store.storeTel}</td>
							</tr>
							<tr>
								<td>이메일</td>
								<td>${store.storeEmail}</td>
							</tr>
							<tr>
								<td>영업시간</td>
								<td>${store.opentime}</td>
							</tr>
							<tr>
								<td>공지사항</td>
								<td>${store.storeInfo}</td>
							</tr>
				            <tr>
				            	<td colspan="2">
				       				<button type="submit" class="btn btn-primary" style="margin: 30px;" onclick="update_move()">가게정보 수정</button>
				           			<button type="submit" class="btn btn-danger" style="margin: 30px;" onclick="delete_move()">가게정보 삭제</button>
				            	</td>
				          	</tr>
				          	<tr style="display: none;">
				          		<td>
				           			<form id="frm" action="/store/storeUpdate">
				           				<input type="text" name="crNum" value="${store.crNum}">
				           			</form>
				       			</td>
				   			</tr>
				         </table>
				    </div>
				  </section>
	      </div>
	  </div>
	</div>
  <%@include file="../includes/footer.jsp" %>
  <link rel="stylesheet" href="//code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
  <link rel="stylesheet" href="/resources/demos/style.css">
  <script src="https://code.jquery.com/jquery.js"></script>
  <script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
  <script type="text/javascript" src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
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
</script>
</body>
</html>