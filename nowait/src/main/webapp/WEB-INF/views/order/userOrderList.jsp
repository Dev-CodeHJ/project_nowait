
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@include file="../includes/header.jsp" %>
<!DOCTYPE html>

<html>
<style>
@font-face {
   font-family: 'Tenada';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2210-2@1.0/Tenada.woff2') format('woff2');
    font-weight: normal;
    font-style: normal;
}

h1{
 font-family: 'Tenada';
}
button{
   margin:20px;
}

</style>

<body>
<div class="row">
        <div class="col-md-3" style="padding: 30px; float:left;">
         <!-- 사이드 바 메뉴-->
         <div class="panel panel-info">
           <div class="panel-heading">
             <!-- 패널 타이틀1 -->
              <h3 class="panel-title">
                 <span>나의관리 메뉴</span>
              </h3>
           </div>
            <!-- 사이드바 메뉴목록1 -->
         <form id="frm">
            <ul class="list-group">
               <li class="list-group-item"><a href="#" onclick="userGet_move()">회원정보</a></li>
              <li class="list-group-item"><a href="#" onclick="orderList_move()">주문내역</a></li>
              <li class="list-group-item"><a href="#" onclick="reviewList_move()">리뷰내역</a></li>
              <li class="list-group-item"><a href="#">장바구니</a></li>
              <li class="list-group-item"><a href="#" onclick="serviceCenter_move()">고객센터</a></li>
            </ul>
         </form>
         </div>
      </div> 
</div>

 <div style="float:right; margin-top:20px; margin-right:1000px; ">

 <h1>내 주문목록</h1>
</div>




                            <table width="100%" class="table table-striped table-bordered table-hover" id="dataTables-example">
                                <thead>
                                    <tr>
                                        <th>주문날짜</th>
                                        <th>가게이름</th>
                                        <th>주문메뉴</th>
                                        <th>주문유형</th>
                                        <th>주문금액</th>
                                    </tr>
                                </thead>                
                              <tbody>
                               <c:forEach items="${orderlist}" var="order">                                  
                                   <tr  style="cursor:pointer" onclick="location.href='/order/orderDetailList?orderNum=<c:out value="${order.orderNum}"/>'">
                                      <td><fmt:formatDate pattern="yyyy-MM-dd" value="${order.orderTime}"/></td>
                                      <td><c:out value="${store.storeName}"/></td>
                                      <td><c:out value="${menu.menuName}"/></td>                                      
                                      <td><c:out value="${order.reservCheck}"/></td>
                                      <td><c:out value="${order.totalPrice}"/></td>
                                   </tr>                                   
                                </c:forEach>
                             </tbody>
                            </table>              
  <!-- end food section -->
  <%@include file="../includes/footer.jsp" %>

</body>
</html>