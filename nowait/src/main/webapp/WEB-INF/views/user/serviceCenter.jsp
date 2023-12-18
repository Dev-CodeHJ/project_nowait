<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
    
<!DOCTYPE html>
<html>

 <%@include file="../includes/header.jsp" %>
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
                 <span>나의 관리 메뉴</span>
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

  <div style="margin-left:400px;margin-top:20px ">
   <h1>고객센터</h1>

<ul>
<li style="list-style:none;"><i class="fa fa-phone" aria-hidden="true"> &nbsp;전화번호 &nbsp;
</i><br>
                  Call +01 1234567890
</li><br>

<li style="list-style:none;"> <i class="fa fa-map-marker" aria-hidden="true"></i> &nbsp;본사주소
                  Location<br>
                  경기도 수원시 매산로1가 11-9 KR
</li><br>
<li style="list-style:none; " > <i class="fa fa-envelope" aria-hidden="true"></i> &nbsp;본사이메일
                 <br> demo@gmail.com
</li><br>
<li style="margin-left:20px">자주묻는 질문</li>
Q&A<br><br>
<li style="margin-left:20px">고객등급 기준</li>
       <ul>
            <li>브론즈- 주문건수 0개~9개</li>
            <li>실버- 주문건수 10개~29개</li>
            <li>골드- 주문건수 30개~49개</li>
            <li>vip- 주문건수 50개~99개</li>
            <li>Vvip- 주문건수 100개~</li>
        </ul>

</ul>
<div>
     <button class="btn btn-info" onclick ="location.href='/'">home</button>
</div>
</div>
</div>
</body>
<%@include file="../includes/footer.jsp" %>
</html>