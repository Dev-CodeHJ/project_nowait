<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@include file="../includes/header.jsp" %>
<!DOCTYPE html>
<html lang="en">

  <!-- food section -->

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
	      <c:forEach items="${list}" var="store" varStatus="cnt">
	          <div class="col-sm-6 col-lg-4 all ${store.storeCategory}">
	            <div class="box">
	              <div>
	                <div class="img-box">
	                  <a href="#" onclick="store_move(${cnt.index})">
	               		<c:choose>
	               			<c:when test="${store.storeFileName ne null and store.storeFileName ne ''}">
			               		<img src="/resources/images/${store.storeFileName}" alt="${store.uploadFileName}" width="200" height="200">
	               			</c:when>
	               			<c:otherwise>
	               				<img src="/resources/images/defaultImg.png" alt="기본이미지" width="200" height="200">
	               			</c:otherwise>
	               		</c:choose>
	                  </a>
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
	        <form id="frm${cnt.index}" action="/order/choiceMenu">
   				<input type="hidden" name="crNum" value="${store.crNum}">
   			</form>
	      </c:forEach>
   		</div>
      </div>
  </section>
  <!-- end food section -->
  <%@include file="../includes/footer.jsp" %>
<script type="text/javascript">
	function store_move(num) {
	    document.getElementById('frm'+num).action="/store/storeUserGet";
		document.getElementById('frm'+num).submit();
	}
</script>
</body>
</html>