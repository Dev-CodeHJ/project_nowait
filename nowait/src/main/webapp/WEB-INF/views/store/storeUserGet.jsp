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
.soldOut {
	color: gray;
	text-align: right;
}
.menuName {
	text-align: left;
	font-size: larger;
	row
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
	        <c:forEach items="${menuCategoryList}" var="menuCategory" varStatus="cnt">
		        <li data-filter=".${menuCategory.name}">
		        	${menuCategory.value}
		        </li>
	        </c:forEach>
	      </ul>

	      <div class="filters-content">
	        <div class="row grid">
		      <c:forEach items="${menuList}" var="menu" varStatus="cnt">
   				<c:choose>
	   				<c:when test="${menu.menuStatus eq true}">
			          <div class="col-sm-6 col-lg-4 all ${menu.menuCategory}">
			            <div class="box">
			              <div>
			                <div class="img-box">
		               		<c:choose>
		               			<c:when test="${menu.storeFileName ne null and store.storeFileName ne ''}">
				               		<img src="/resources/images/${menu.storeFileName}" alt="${menu.uploadFileName}">
		               			</c:when>
		               			<c:otherwise>
		               				<img src="/resources/images/defaultImg.png" alt="기본이미지" width="200" height="200">
		               			</c:otherwise>
		               		</c:choose>
			                </div>
			                <div class="menu-box">
			                	<table class="soldOut">
			                		<tr>
			                			<th rowspan="2" class="menuName">${menu.menuName}</th>
			                			<th>
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
		            					<th colspan="2" style="color: red;">
		            						<button type="button" class="btn btn-danger">품절</button>
		            					</th>
			                		</tr>
			                	</table>
			                </div>
			              </div>
			            </div>
			          </div>
	   				</c:when>
	   				<c:otherwise>
			          <div class="col-sm-6 col-lg-4 all ${menu.menuCategory}">
			            <div class="box">
			              <div>
			                <div class="img-box">
			                  <a href="#" onclick="store_move(${cnt.index})">
			               		<c:choose>
			               			<c:when test="${menu.storeFileName ne null and store.storeFileName ne ''}">
					               		<img src="/resources/images/${menu.storeFileName}" alt="${menu.uploadFileName}" width="200" height="200">
			               			</c:when>
			               			<c:otherwise>
			               				<img src="/resources/images/defaultImg.png" alt="기본이미지" width="200" height="200">
			               			</c:otherwise>
			               		</c:choose>
			                  </a>
			                </div>
			                <div class="detail-box">
			                	<table>
			                		<tr>
			                			<th>${menu.menuName}</th>
				            			<c:forEach items="${popularityList}" var="popular">
					            			<c:if test="${menu.popularity eq popular.name}">
						            			<c:choose>
						            				<c:when test="${popular.name eq 1}">
						            					<th style="color: orange; text-align: right;">${popular.value}</th>
						            				</c:when>
						            				<c:otherwise>
						            					<th></th>
						            				</c:otherwise>
						            			</c:choose>
					            			</c:if>
				            			</c:forEach>
			                		</tr>
			                		<tr align="right">
			                			<th colspan="2">가격 : ${menu.price}원</th>
			                		</tr>
			                		<tr align="right">
		            					<th colspan="2">
											<button type="submit" class="btn btn-success" onclick="menuGet_move(${cnt.count})">장바구니 담기</button>
		            					</th>
			                		</tr>
			                	</table>
			                </div>
			              </div>
			            </div>
			          </div>
		          	</c:otherwise>
		          </c:choose>
		        <form id="frm${cnt.count}" action="/order/choiceMenu">
	   				<input type="hidden" name="menuNum" value="${menu.menuNum}">
	   			</form>
		      </c:forEach>
	   		</div>
	      </div>
	    </div>
  	</section>

      <div class="container">
  
		<!-- body -->
		  <div class="col-md-9">
			  <section class="food_section layout_padding-bottom">
			    <div class="container">
					<h1>가게 주문 메뉴목록 페이지</h1>

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
                                 <!-- 
	      <table class="table table-striped table-bordered table-hover" >
                                 <c:forEach items="${menuList}" var="menu">
                                    <tr>
                                        <th>메뉴번호</th>
                                        <td><input type="text" readonly="readonly" value=<c:out value="${menu.menuNum}"/>></td>
                                        
                                    </tr>
                                    <tr>
                                        <th>메뉴이름</th>
                                       <a href='/order/choiceDetailMenu?menuNum=<c:out value="${menu.menuNum }"/>'>
                                	${menu.menuName}</a>
                        
                                    </tr>
                                    <tr>
                                        <th>메뉴가격</th>
                                          <input type="text" class="form-control" readonly="readonly" value=<c:out value="${menu.price }"/>>
									</tr>
									<tr>
                                        <th>인기여부</th>
                                         <input type="text" class="form-control" readonly="readonly" value=<c:out value="${menu.popularity}"/>>
                                    </tr>
                                    <tr>
                                        <th>품절여부</th>
                                         <input type="text" class="form-control" readonly="readonly" value=<c:out value="${menu.menuStatus}"/>>
                                    </tr>
                                    <tr>
                                        <th>메뉴사진</th>
                                         <input type="text" class="form-control" readonly="readonly" value=<c:out value="${menu.menuImg}"/>>
                                    </tr>
                                
                                
                                </c:forEach>
                             	 

                             	</table>
                             	 -->
							
	
	
	
	
	
	
	
	
	
	
	
		<%@include file="../includes/footer.jsp" %>	
</body>
</html>