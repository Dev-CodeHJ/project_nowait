<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../includes/header.jsp" %>
<style>
	@font-face {
   font-family: 'Tenada';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2210-2@1.0/Tenada.woff2') format('woff2');
    font-weight: normal;
    font-style: normal;
	}
	h2, span{
	   font-family: 'Tenada';
	}
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
				  <li class="list-group-item"><a href="#" onclick="reply_move()">리뷰관리</a></li>
				  <li class="list-group-item"><a href="#">주문&예약관리</a></li>
				</ul>
			
			</div>
		</div> 
		
		<!-- body -->
	<div style="margin-bottom:500px; width:60%;">
	<br>
	<h2 style="text-align: center">내가게 리뷰</h2>
	<table class="table table-striped table-bordered table-hover" id="dataTables-example">
        <thead>
            <tr>
                <th>리뷰등록날짜</th>
                <th>작성자 아이디</th>
                <th>주문메뉴</th>
                <th>주문유형</th>
                <th>리뷰내용</th>
            </tr>
        </thead>                
   	<tbody>
   	<input type="hidden" name="crNum" value="${storeReview.crNum }">
   	<input type="hidden" name="replyNum" value="${storeReview.replyNum}">
   	
       <c:forEach items="${StoreReviewList}" var="storeReview">                                  
           <tr style="cursor:pointer" onclick="location.href='/reply/storeReadReview?reviewNum=<c:out value="${storeReview.reviewNum}"/>'">
              <td><fmt:formatDate pattern="yyyy-MM-dd" value="${storeReview.reviewRegdate}"/></td>
              <td><c:out value="${storeReview.userId}"/></td>
              <td><c:out value="${menu.menuName}"/></td>                                      
              <td><c:out value="${order.reservCheck}"/></td>
              
              <c:if test="${storeReview.replyNum eq 0}">
              	<td><c:out value="${storeReview.reviewContent}"/></td> 
              </c:if>
              
              <c:if test="${storeReview.replyNum != 0}">
              	<td><c:out value="${storeReview.reviewContent}"/></td> 
              </c:if> 
                          
           </tr>                                   
        </c:forEach>
     </tbody>
    </table> 
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
	
	function reply_move() {
	    document.getElementById('frm').action="/reply/storeReply";
		document.getElementById('frm').submit();
	}
</script>
</body>
</html>