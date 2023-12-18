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
		                  <h5>${store.crNum}</h5>
		                  <p>${store.storeName}</p>
		                </div>
		              </div>
		            </div>
		            </div>
		            <form id="frm${cnt.index}" action="/store/storeOwnerGet">
           				<input type="hidden" name="crNum" value="${store.crNum}">
           			</form>
			      </c:forEach>
			    </div>
	    	</div>
	    </div>
  	</section>
  <%@include file="../includes/footer.jsp" %>
<script type="text/javascript">
	$(document).ready(function() {
		if(${insertOk}==0){
			alert("이미 존재하는 사업자등록번호입니다!");
			location.href="/store/storeNewRegister";
		} else if(${insertOk}==1){
			alert("가게가 성공적으로 등록되셨습니다.");
		}
	});
</script>
<script type="text/javascript">
	$(document).ready(function() {
		if(${loadOk}==0){
			alert("비밀번호가 일치하지 않습니다!");
			location.href="/store/storeExistRegister";
		} else if(${loadOk}==-1){
			alert("존재하지 않는 사업자 등록번호입니다!");
			location.href="/store/storeExistRegister";
		} else if(${loadOk}==1){
			alert("가게정보를 불러오는데 성공하셨습니다.");
		}
	});
</script>
<script type="text/javascript">
	function store_move(num) {
	    document.getElementById('frm'+num).action="/store/storeOwnerGet";
		document.getElementById('frm'+num).submit();
	}
</script>
</body>
</html>