<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@include file="../includes/header.jsp" %>
<style>
table {
	width: 100%;
    border: 1px solid black;
    border-collapse: collapse;
    margin: auto;
}
th, td {
    text-align: center;
    border: 1px solid black;
    padding: 10px;
}
h1, h2 {
	text-align: center;
	padding: 10px;
}
div {
	text-align: center;
}
.soldOut {
	color: gray;
}
.topborder {
    width: 100%;
    border-top: 1px solid navy;
    border-bottom: none;
    border-left: none;
    border-right: none;
}
.noenborder {
    border: none;
}
</style>
<style>
 div.goods div.goodsInfo p span { display:inline-block; width:100px; margin-right:15px; }
 div.goods div.goodsInfo p.cartStock input { font-size:22px; width:50px; padding:5px; margin:5px; border:1px solid #eee; }
 div.goods div.goodsInfo p.cartStock button { font-size:30px; border:none; background:none; }
 div.goods div.goodsInfo p.cartStock { text-align:right; padding-right: 10px; margin-bottom: 0px;}
</style>

<section class="food_section layout_padding-bottom">
	<div class="container">
        <h1>장바구니 목록</h1>
    	<c:choose>
    		<c:when test="${cart eq null or cart.size() eq 0}">
    			<h2 style="color: gray;">장바구니에 담긴 상품이 존재하지 않습니다.</h2>
    		</c:when>
    		<c:otherwise>
		      <form id="frm" action="/order/orderCart" method="post" style="padding: 10px;">
    			<c:forEach items="${cart}" var="map" varStatus="cnt">
		        	<div style="padding: 5px;">
			        	<table>
			            	<tr>
			            		<th colspan="${map.optionList.size()}">
			            			${map.menu.menuName}&nbsp;
			            		[기본금액 : <fmt:formatNumber pattern="###,###,###" value="${map.menu.price}"/>원]
			            		<button type="button" class="btn btn-danger" onclick="cartMenu_delete(${cnt.index})" style="float: right;">X</button>
			            		</th>
			            	</tr>
							<tr>
								<c:forEach items="${map.optionList}" var="option" varStatus="optCnt">
									<c:choose>
										<c:when test="${option.optionStatus eq true}">
						            		<td class="soldOut">
												<label>
													<input type="radio" name="optionCnt${cnt.index}" id="optionCnt${cnt.index}" value="${optCnt.index}" disabled="disabled">
													${option.option} &nbsp; + <fmt:formatNumber pattern="###,###,###" value="${option.optionPrice}"/>원
												</label>
						            		</td>
										</c:when>
										<c:otherwise>
						            		<th>
												<label>
													<input type="radio" name="optionCnt${cnt.index}" id="optionCnt${cnt.index}" value="${optCnt.index}" onchange="registerchk()"
													<c:if test="${map.orderMenu.menuOptionNum eq option.menuOptionNum}">checked="checked"</c:if>
													>
													${option.option} &nbsp; + <fmt:formatNumber pattern="###,###,###" value="${option.optionPrice}"/>원
													<input type="hidden" name="optionNum${cnt.index}" id="optionNum${cnt.index}${optCnt.index}" value="${option.menuOptionNum}">
													<input type="hidden" name="orderMenuList[${cnt.index}].optPrice" id="optPrice${cnt.index}${optCnt.index}" value="${option.optionPrice}">
												</label>
						            		</th>
										</c:otherwise>
									</c:choose>
								</c:forEach>
							</tr>
			            	<tr>
			            		<th colspan="${map.optionList.size()}">
									<div class="goods">
									   <div class="goodsInfo">
									    <p class="cartStock">
									    	<span>구매수량 : </span>
											<button type="button" class="minus" onclick="orderCntMinus(${cnt.index})">-</button>
											<input type="text" name="orderMenuList[${cnt.index}].orderCnt" class="numBox" min="1" value="${map.orderMenu.orderCnt}" readonly="readonly"/>
											<button type="button" class="plus" onclick="orderCntPlus(${cnt.index})">+</button>
									    </p>
									   </div>
									</div>
			            		</th>
							</tr>
				          	<tr style="display: none;">
				          		<td>
			           				<input type="text" name="orderMenuList[${cnt.index}].menuNum" value="${map.menu.menuNum}">
			           				<input type="text" name="price" id="price${cnt.index}" value="${map.menu.price}">
			           				<input type="text" name="orderMenuList[${cnt.index}].menuOptionNum" id="menuOptionNum${cnt.index}">
			           				<input type="text" name="orderMenuList[${cnt.index}].orderMenuPrice" id="orderMenuPrice${cnt.index}">
				       			</td>
				   			</tr>
			        	</table>
		        	</div>
    			</c:forEach>
    			<table class="topborder">
    				<tr style="display: none;">
	   					<th>
	   						<input type="text" name="crNum" value="${cart.get(0).menu.crNum}">
   						</th>
    				</tr>
    				<tr>
	   					<th colspan="2" class="noenborder">결제 방식</th>
    				</tr>
    				<tr>
    					<td colspan="2" class="noenborder">
	    					<input type="radio" name="payMethod" value="1"> 카드 &nbsp;
	    					<input type="radio" name="payMethod" value="2"> 현금
    					</td>
    				</tr>
    			</table>
    			<table class="topborder">
    				<tr>
	   					<th colspan="2" class="noenborder">예약 방식</th>
    				</tr>
    				<tr>
    					<td colspan="2" class="noenborder">
	    					<input type="radio" name="reservCheck" value="1" onclick="handleRadioButtonChange()"> 포장 주문 &nbsp;
	    					<input type="radio" name="reservCheck" value="2" onclick="handleRadioButtonChange()"> 홀 방문 식사
    					</td>
    				</tr>
    			</table>
    			<table class="topborder">
    				<tr>
	   					<th colspan="2" class="noenborder">방문 예약 인원 <font style="color: grey;">(홀 방문 식사 선택시)</font></th>
    				</tr>
    				<tr>
    					<td colspan="2" class="noenborder">
	    					<input type="text" name="reservNum" id="reservNum" disabled="disabled">
    					</td>
    				</tr>
    			</table>
    			<table class="topborder">
    				<tr>
	   					<th colspan="2" class="noenborder">예약 시간</th>
    				</tr>
    				<tr>
    					<td colspan="2" class="noenborder">
	    					<input type="text" name="reservTime" id="reservTime">
    					</td>
    				</tr>
    			</table>
    			<table class="topborder">
    				<tr>
	   					<th colspan="2" class="noenborder">요청사항</th>
    				</tr>
    				<tr>
    					<td colspan="2" class="noenborder">
	    					<textarea rows="5" cols="50" name="requestMsg"></textarea>
    					</td>
    				</tr>
    			</table>
    			<table class="topborder">
    				<tr>
	   					<th colspan="2" class="noenborder">
			    			<div align="center">
								<button type="button" class="btn btn-success" style="float: left; padding: 15px;" onclick="storeUserGet_move()">메뉴 더 담으러가기</button>
								<h5>장바구니 총      액: 
								<span class="text-danger">
								<input type="number" style="border: none; text-align: right;" name="totalPrice" id="totalPrice" pattern="###,###,###" readonly="readonly">
								</span> 원</h5>
								<button type="button" class="btn btn-warning" style="margin: 30px;" id="btn_register">주문하기</button>
							</div>
	   					</th>
    				</tr>
    			</table>
		      </form>
    		</c:otherwise>
    	</c:choose>
      <form id="frm0" action="/store/storeUserGet">
	  	<input type="hidden" name="crNum" value="${cart.get(0).menu.crNum}">
	  </form>
      <form id="frm1" action="/order/cartMenuDelete">
      	<input type="hidden" name="deleteIndex" id="deleteIndex">
	  </form>
	</div>
</section>

<%@include file="../includes/footer.jsp" %>
<script type="text/javascript">
	$(document).ready(function() {
		if(${deleteOk}==1){
			alert("선택하신 메뉴가 장바구니에서 삭제되었습니다.");
		} else if(${deleteOk}==0) {
			alert("해당 메뉴 삭제 실패!");
		}
	});
</script>
<script type="text/javascript">
	$(document).ready(function() {
	    	registerchk();
	    $("#btn_register").click(function(){
	    	console.log("hi");
	    	submit();
	    })
    });
</script>
<script type="text/javascript">
function handleRadioButtonChange() {
    var selectedValue = document.querySelector('input[name="reservCheck"]:checked').value;

    // 여기에서 선택된 값에 따라 필요한 항목을 disabled 상태로 설정하거나 해제합니다.
    if (selectedValue === "1") {
        document.getElementById("reservNum").disabled = true;
    } else {
        document.getElementById("reservNum").disabled = false;
    }
}

function orderCntPlus(num){
	
	var orderCnt = Number(document.getElementsByName("orderMenuList["+num+"].orderCnt")[0].value);
	
	document.getElementsByName("orderMenuList["+num+"].orderCnt")[0].value = orderCnt + 1;
	registerchk();
}

function orderCntMinus(num){
	
	var orderCnt = Number(document.getElementsByName("orderMenuList["+num+"].orderCnt")[0].value); 
	
	if(orderCnt <= 1) {
		document.getElementsByName("orderMenuList["+num+"].orderCnt")[0].value = orderCnt;
	} else {
		document.getElementsByName("orderMenuList["+num+"].orderCnt")[0].value = orderCnt - 1;
	}
	registerchk();
}

function registerchk(){
	
	var totalPrice = 0;
	
    for(var i = 0; i < ${cart.size()}; i++) {
  	  
	      var optChkIndex = $("input[name='optionCnt"+i+"']:radio:checked").val();
	      console.log(optChkIndex);
	      
	      
	      //var x = Number(document.getElementsByName('orderMenuList['+i+'].optPrice')[optChkIndex].value);
	      var optionPrice = Number(document.getElementById('optPrice'+i+optChkIndex).value);
	      console.log(optionPrice);
	      //var y = Number(document.getElementsByName('optPrice'i)[optChkIndex].value);
	      //console.log(y);
	      
	      //var totalPrice = Number(document.getElementsByName('optPrice'+i)[optChkIndex].value) + Number(document.getElementsByName("price")[i].value);
	      var menu_option_totalPrice = Number(optionPrice) + Number(document.getElementsByName("price")[i].value);
	      console.log(menu_option_totalPrice);
	      
	      var menuToTalPrice = menu_option_totalPrice * Number(document.getElementsByName("orderMenuList["+i+"].orderCnt")[0].value);
	      console.log(menuToTalPrice);
	      
	      //document.getElementsByName("orderMenuList["+i+"].menuOptionNum")[0].value = document.getElementsByName("optionNum"+i)[optChkIndex].value;
	      document.getElementsByName("orderMenuList["+i+"].orderMenuPrice")[0].value = menuToTalPrice;
	      document.getElementsByName("orderMenuList["+i+"].menuOptionNum")[0].value = document.getElementById('optionNum'+i+optChkIndex).value;
	      
	      var a = document.getElementsByName("orderMenuList["+i+"].orderMenuPrice")[0].value;
	      var b = document.getElementsByName("orderMenuList["+i+"].menuOptionNum")[0].value;
	      
	      console.log(a);
	      console.log(b);
	      totalPrice += Number(document.getElementsByName("orderMenuList["+i+"].orderMenuPrice")[0].value);
    }
    console.log(totalPrice);
    document.getElementsByName("totalPrice")[0].value = totalPrice;
    //$("#totalPrice").val(Number(totalPrice));
    console.log(document.getElementsByName("totalPrice")[0].value)
    /*
    var optChk = Number($("input[name=optionCnt]:radio:checked").val());
    document.getElementById('menuOptionNum'+i).value = document.getElementById('optionNum'+i).value;
    $("#menuOptionNum").val(document.getElementById('optionNum'+optChk).value);
    
    var totalPrice = Number(document.getElementById('optPrice'+optChk).value) + Number(document.getElementById('price'+optChk).value);
    document.getElementById('orderMenuPrice'+optChk).value = document.getElementById('optionNum'+optChk).value;
    $("#orderMenuPrice").val(totalPrice);
    */
}

function submit() {
	
	if ($("input[name=payMethod]:radio:checked").length < 1) {
        alert("결제 방식을 선택해주세요!");
        $("#payMethod").focus();
        
    } else if ($("input[name=reservCheck]:radio:checked").length < 1) {
    	alert("예약 방식을 선택해주세요!");
        $("#reservCheck").focus();
    } else {
	    document.getElementById('frm').submit();
    }
}

function storeUserGet_move() {
  		
 	document.getElementById('frm0').action="/store/storeUserGet";
	document.getElementById('frm0').submit();
}

function cartMenu_delete(num) {
  	if(confirm("해당 메뉴를 장바구니에서 삭제하시겠습니까?")) {
  		
  		$("#deleteIndex").val(num);
  		document.getElementById('frm1').action="/order/cartMenuDelete";
		document.getElementById('frm1').submit();
  	}
}
</script>
</body>
</html>