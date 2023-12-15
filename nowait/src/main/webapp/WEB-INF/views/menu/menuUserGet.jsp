<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@include file="../includes/header.jsp" %>
<style>
table {
    border: 1px solid black;
    border-collapse: collapse;
    margin: auto;
	}
th, td {
    text-align: center;
    border: 1px solid black;
    padding: 10px;
}
.soldOut {
	color: gray;
}
</style>
<style>
 div.goods div.goodsImg { float:left; width:350px; }
 div.goods div.goodsImg img { width:350px; height:auto; }
 
 div.goods div.goodsInfo { float:right; width:330px; font-size:22px; }
 div.goods div.goodsInfo p { margin:0 0 20px 0; }
 div.goods div.goodsInfo p span { display:inline-block; width:100px; margin-right:15px; }
 
 div.goods div.goodsInfo p.cartStock input { font-size:22px; width:50px; padding:5px; margin:0; border:1px solid #eee; }
 div.goods div.goodsInfo p.cartStock button { font-size:26px; border:none; background:none; }
 div.goods div.goodsInfo p.addToCart { text-align:right; }
 div.goods div.gdsDes { font-size:18px; clear:both; padding-top:30px; }
</style>

  <section class="food_section layout_padding-bottom">
    <div class="container">
      <form id="frm0" action="/menu/menuUserGet" method="post" style="padding: 50px;">
         <h2 align="center" style="padding-bottom: 20px;">장바구니 담기 페이지</h2>
        	<table>
            	<tr>
            		<th rowspan="2">
            			<span>${menu.menuName}</span>
            		</th>
            		<th rowspan="2">
            			<span>가격 : </span><fmt:formatNumber pattern="###,###,###" value="${menu.price}" />원
           			</th>
            		<th colspan="2">구입 수량</th>
            	</tr>
            	<tr>
            		<th colspan="2">
						<div class="goods">
						   <div class="goodsInfo">
						    <p class="cartStock">
								<button type="button" class="minus">-</button>
								<input type="text" name="orderCnt" class="numBox" min="1" value="1" readonly="readonly"/>
								<button type="button" class="plus">+</button>  
						    </p>
						   </div>
						</div>
            		</th>
				</tr>
            	<tr>
            		<td colspan="3">옵션 선택</td>
           		</tr>
				<c:forEach items="${optionList}" var="option">
					<c:choose>
						<c:when test="${option.optionStatus eq true}">
		           			<tr class="soldOut">
			            		<td colspan="3">
									<label>
										<input type="radio" name="menuOptionNum" id="menuOptionNum" value="${option.menuOptionNum}" disabled="disabled">
										${option.option} &nbsp; +${option.optionPrice}원
									</label>
			            		</td>
			            	</tr>
						</c:when>
						<c:otherwise>
		           			<tr>
			            		<th colspan="3">
									<label>
										<input type="radio" name="menuOptionNum" id="menuOptionNum" value="${option.menuOptionNum}">
										${option.option} &nbsp; +${option.optionPrice}원
									</label>
			            		</th>
			            	</tr>
							<tr style="display: none;">
								<td>
									<input type="text" name="optionPrice" id="optionPrice" value="${option.optionPrice}">
								</td>
							</tr>
						</c:otherwise>
					</c:choose>
				</c:forEach>
	            <tr>
	            	<td colspan="3">
	       				<button type="button" class="btn btn-success" style="margin: 30px;" onclick="storeUserGet_move()">이전</button>
	       				<button type="submit" class="btn btn-info" style="margin: 30px;" onclick="return register_chk()" id="btn_register">장바구니 담기</button>
	            	</td>
	          	</tr>
	          	<tr style="display: none;">
	          		<td>
           				<input type="text" name="menuNum" value="${menu.menuNum}">
           				<input type="text" name="price" id="price" value="${menu.price}">
           				<input type="text" name="orderMenuPrice" id="orderMenuPrice">
	       			</td>
	   			</tr>
        	</table>
      </form>
      <form id="frm" action="/store/storeUserGet">
	  	<input type="hidden" name="crNum" value="${menu.crNum}">
	  </form>
    </div>
  </section>

  <%@include file="../includes/footer.jsp" %>
<script type="text/javascript">
  $(".plus").click(function(){
   $(".numBox").val(Number($(".numBox").val())+ 1);
  });
  
  $(".minus").click(function(){
	  
   if($(".numBox").val() <= 1) {
	    $(".numBox").val();
	   } else {
	  $(".numBox").val(Number($(".numBox").val())- 1);
   }
  });
</script>
<script type="text/javascript">
	$(document).ready(function() {
    $("#btn_register").click(function register_chk() {
    	  
	      if ($("input[name=menuOptionNum]:radio:checked").length < 1) {
	          alert("옵션을 선택해주세요!");
	          $("#menuOptionNum").focus();
	          return false;
	      }
	      
	      Number($("#orderMenuPrice").val(Number($("#optionPrice").val()) + Number($("#price").val())));
	      
	      document.getElementById('frm0').submit();
          return true;
	  });
    });
</script>
<script type="text/javascript">
	function storeUserGet_move() {
	    document.getElementById('frm').action="/store/storeUserGet";
		document.getElementById('frm').submit();
	}
</script>
</body>
</html>