<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@include file="../includes/header.jsp" %>
<style>
table {
    width: 100%;
    height: 100%;
    line-height: 2.5;
}
th, td {
	text-align: right;
}
.popular {
	color: orange;
}
.soldOut {
	color: gray;
}
.menuName {
	text-align: center;
	font-size: larger;
}
.menu-box {
	padding: 15px;
}
</style>
	<section class="food_section layout_padding-bottom">
	    <div class="container">
	    	<div class="heading_container heading_center" style="padding-top: 20px;">
	        	<h1>${store.storeName} 메뉴 목록</h1>
	      	</div>
	      	
	      <ul class="filters_menu">
	        <li class="active" data-filter="*">All</li>
	        <c:forEach items="${menuCategoryList}" var="menuCategory">
		        <li data-filter=".${menuCategory.name}">${menuCategory.value}</li>
	        </c:forEach>
	      </ul>

	      <div class="filters-content">
	        <div class="row grid">
		      <c:forEach items="${menuList}" var="menu" varStatus="cnt">
		          <div class="col-sm-6 col-lg-4 all ${menu.menuCategory}">
		            <div class="box">
		              <div>
		                <div class="img-box">
	               		<c:choose>
	               			<c:when test="${menu.storeFileName ne null and menu.storeFileName ne ''}">
			               		<img src="/resources/images/${menu.storeFileName}" alt="${menu.uploadFileName}">
	               			</c:when>
	               			<c:otherwise>
	               				<img src="/resources/images/defaultImg.png" alt="기본이미지" width="200" height="200">
	               			</c:otherwise>
	               		</c:choose>
		                </div>
			                <div class="menu-box">
			   				<c:choose>
				   				<c:when test="${menu.menuStatus eq true}">
				                	<table class="soldOut">
				                		<tr>
				                			<th rowspan="2" class="menuName">${menu.menuName}</th>
				                			<th>&nbsp;
						            			<c:forEach items="${popularityList}" var="popular">
							            			<c:if test="${menu.popularity eq popular.name and menu.popularity eq 1}">
						            					${popular.value}
							            			</c:if>
						            			</c:forEach>
					            			</th>
				                		</tr>
				                		<tr>
				                			<th colspan="2">가격 : ${menu.price}원</th>
				                		</tr>
				                		<tr>
			            					<th colspan="2">
			            						<button type="button" class="btn btn-danger" id="btn_register" onclick="soldout()">품절</button>
			            					</th>
				                		</tr>
				                	</table>
				   				</c:when>
				   				<c:otherwise>
				                	<table>
				                		<tr>
				                			<th rowspan="2" class="menuName">${menu.menuName}</th>
					            			<th class="popular">&nbsp;
						            			<c:forEach items="${popularityList}" var="popular">
							            			<c:if test="${menu.popularity eq popular.name and menu.popularity eq 1}">
						            					${popular.value}
							            			</c:if>
						            			</c:forEach>
					            			</th>
				                		</tr>
				                		<tr>
				                			<th colspan="2">가격 : ${menu.price}원</th>
				                		</tr>
				                		<tr>
			            					<th colspan="2">
												<button type="submit" class="btn btn-success" onclick="menuGet_move(${cnt.count})">장바구니 담기</button>
			            					</th>
				                		</tr>
				                	</table>
					          	</c:otherwise>
					          </c:choose>
			                </div>
			              </div>
			            </div>
			          </div>
		        <form id="frm${cnt.count}" action="/menu/menuUserGet">
	   				<input type="hidden" name="menuNum" value="${menu.menuNum}">
	   			</form>
		      </c:forEach>
	   		</div>
	      </div>
	    </div>
  	</section>
<%@include file="../includes/footer.jsp" %>
<script type="text/javascript">
	$(document).ready(function() {
		if(${addOk}==true){
			alert("선택하신 메뉴가 장바구니에 담겼습니다.");
		} else {
			alert("장바구니 담기 실패!");
		}
	});
</script>
<script type="text/javascript">
	function menuGet_move(num) {
	    document.getElementById('frm'+num).action="/menu/menuUserGet";
		document.getElementById('frm'+num).submit();
	}
</script>	
<script type="text/javascript">
	$(document).ready(function() {
    $("#btn_register").click(function soldout() {
    	  alert("해당 상품은 현재 품절입니다!");
	  });
    });
</script>
</body>
</html>