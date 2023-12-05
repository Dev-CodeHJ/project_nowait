<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../includes/header.jsp" %>
<style>
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
  <section class="food_section layout_padding-bottom">
    <div class="container">
         <h2 align="center" style="padding: 10px; margin: 10px;">가게 정보</h2>
         <table>
            <tr>
               <th>사업자 등록번호</th>
               <td>${store.crNum}</td>
            </tr>
            <tr>
				<th>가게 이름</th>
				<td>${store.storeName}</td>
			</tr>
			<tr>
				<td>카테고리</td>
				<td>${store.storeCategory}</td>
			</tr>
			<tr>
				<th>주소</th>
				<td>${store.storeAddr}</td>
			</tr>
			<tr>
				<th>전화번호</th>
				<td>${store.storeTel}</td>
			</tr>
			<tr>
				<td>이메일</td>
				<td>${store.storeEmail}</td>
			</tr>
			<tr>
				<th>영업시간</th>
				<td>${store.opentime}</td>
			</tr>
			<tr>
				<td>공지사항</td>
				<td>${store.storeInfo}</td>
			</tr>
            <tr>
            	<td colspan="2">
           			<button type="button" class="btn btn-primary" style="margin: 30px;" onclick="location.href='/store/storeUpdate'">가게정보 수정</button>
           			<button type="button" class="btn btn-danger" style="margin: 30px;" onclick="location.href='/store/storeDelete'">가게정보 삭제</button>
            	</td>
          	</tr>
         </table>
    </div>
  </section>
  
  
  <%@include file="../includes/footer.jsp" %>
  <link rel="stylesheet" href="//code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
  <link rel="stylesheet" href="/resources/demos/style.css">
  <script src="https://code.jquery.com/jquery.js"></script>
  <script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
  <script type="text/javascript" src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
</body>
</html>