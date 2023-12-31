<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@include file="../includes/header.jsp" %>
<!DOCTYPE html>
<html lang="en">

  <c:choose>
  	<c:when test="${result eq 1}">
  	
  		<%-- food section --%>
	
		<section class="food_section layout_padding-bottom">
	    <div class="container">
	      <div class="heading_container heading_center" style="padding-top: 20px;">
	        <h2>
	          내 가게 리스트
	        </h2>
	      </div>
	
	      <div class="filters-content">
	        <div class="row grid">
		      <c:forEach items="${list}" var="store">
	            <div class="box">
	              <div>
	                <div class="img-box">
	                  <img src="/resources/images/f1.png" alt="">
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
		      </c:forEach>
		      </div>
	      </div>
	    </div>
	  </section>
	  <%-- end food section --%>
	  
  	</c:when>
  	
  	<c:otherwise>
  	
	  <%-- food section --%>
	
	  <section class="food_section layout_padding-bottom">
	    <div class="container">
	      <div class="heading_container heading_center">
	        <h2>
	          Food Category
	        </h2>
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
		                  <img src="/resources/images/f1.png" alt="">
		                </div>
		                <div class="detail-box">
		                  <h5>
		                    ${store.storeName}
		                  </h5>
		                  <p>
		                    ${store.storeInfo}
		                  </p>
		                  <div class="options">
		                    <h6>
		                      ${store.orderCnt}
		                    </h6>
		                    <h6>
		                      ${store.reviewCnt}
		                    </h6>
		                  </div>
		                </div>
		              </div>
		            </div>
		          </div>
		      </c:forEach>
		      </div>
	      </div>
	      <div class="btn-box">
	        <a href="">
	          View More
	        </a>
	      </div>
	    </div>
	  </section>
	  <%-- end food section --%>
	  
  	</c:otherwise>
  </c:choose>
  <%@include file="../includes/footer.jsp" %>
</body>
</html>