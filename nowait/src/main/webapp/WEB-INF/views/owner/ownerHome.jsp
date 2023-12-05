<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@include file="../includes/header.jsp" %>
<!DOCTYPE html>
<html lang="en">

	<section class="food_section layout_padding-bottom">
	    <div class="container">
	    	<div class="heading_container heading_center" style="padding-top: 20px;">
	        	<h2>내 가게 관리</h2>
	      	</div>
	      	
	      <ul class="filters_menu">
	        <li class="active" data-filter="*">All</li>
	        <li data-filter=".1">한식</li>
	        <li data-filter=".2">일식</li>
	        <li data-filter=".3">중식</li>
	        <li data-filter=".4">양식</li>
	        <li data-filter=".5">카페&디저트</li>
	      </ul>
	
	      	<div class="filters-content">
		        <div class="row grid">
			      <c:forEach items="${list}" var="store">
			      <div class="col-sm-6 col-lg-4 all ${store.storeCategory}">
		            <div class="box">
		              <div>
		                <div class="img-box">
		                  <img src="/resources/images/f1.png" alt="" onclick="location.href='/store'">
		                </div>
		                <div class="detail-box">
		                  <h5>
		                    ${store.crNum}
		                  </h5>
		                  <p>
		                    ${store.storeName}
		                  </p>
		                </div>
		              </div>
		            </div>
		            </div>
			      </c:forEach>
			    </div>
	    	</div>
	    </div>
  	</section>
  <%@include file="../includes/footer.jsp" %>
</body>
</html>