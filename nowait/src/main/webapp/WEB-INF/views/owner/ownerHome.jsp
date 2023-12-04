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
  <%@include file="../includes/footer.jsp" %>
</body>
</html>