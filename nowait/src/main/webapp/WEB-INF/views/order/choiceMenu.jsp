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
</style>
<body>
      <div class="container">
  
		<!-- body -->
		  <div class="col-md-9">
			  <section class="food_section layout_padding-bottom">
			    <div class="container">
					<h1>가게 주문 메뉴목록 페이지</h1>
		            <c:forEach items="${menuList}" var="menu" varStatus="cnt">
			        	<form id="frm${cnt.count}" action="/menu/menuUpdate">
				        	<table>
				            	<tr>
				            		<td>메뉴 이름</td><td>메뉴 카테고리</td><td>가격</td><td>인기메뉴 여부</td><td>품절 여부</td>
				            		<td rowspan="3">
				            			<!-- <img src="|/images/${imageFile.getStoreFileName()}|" width="300" height="300"/> -->
				            			<img src="/resources/images/${menu.storeFileName}" alt="${menu.uploadFileName}" width="200" height="200">
				            		</td>
				            	</tr>
				            	<tr>
				            		<th>${menu.menuName}</th>
				            		<th>
				            			<c:forEach items="${menuCategoryList}" var="menuCategory">
					            			<c:if test="${menu.menuCategory eq menuCategory.name}">
					            				${menuCategory.value}
					            			</c:if>
				            			</c:forEach>
				            		</th>
				            		<th>${menu.price}원</th>
			            			<c:forEach items="${popularityList}" var="popular">
				            			<c:if test="${menu.popularity eq popular.name}">
					            			<c:choose>
					            				<c:when test="${popular.value eq '인기메뉴'}">
					            					<th style="color: orange">${popular.value}</th>
					            				</c:when>
					            				<c:otherwise>
					            					<th>${popular.value}</th>
					            				</c:otherwise>
					            			</c:choose>
				            			</c:if>
			            			</c:forEach>
				            		<c:choose>
			            				<c:when test="${menu.menuStatus eq false}">
						            		<th style="color: green;">판매가능</th>
			            				</c:when>
			            				<c:otherwise>
			            					<th style="color: red;">품절</th>
			            				</c:otherwise>
			            			</c:choose>
			            		</tr>
					            <tr>
					            	<td colspan="5">
					       				<button type="submit" class="btn btn-primary" style="margin: 30px;" onclick="menuGet_move(${cnt.count})">상세정보</button>
					       				<button type="submit" class="btn btn-info" style="margin: 30px;" onclick="menuUpdate_move(${cnt.count})">수정</button>
					           			<button type="button" class="btn btn-danger" style="margin: 30px;" onclick="menuDelete_move(${cnt.count})">삭제</button>
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