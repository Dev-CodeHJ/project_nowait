<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@include file="includes/header.jsp" %>
<!DOCTYPE html>
<html lang="en">

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
			                  <c:choose>
			                  	<c:when test="${store.storeInfo eq ''}">(가게정보 없음)</c:when>
			                  	<c:when test="${store.storeInfo eq null}">(가게정보 없음)</c:when>
			                    <c:otherwise>${store.storeInfo}</c:otherwise>
			                  </c:choose>
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
  <%@include file="includes/footer.jsp" %>
</body>
</html>