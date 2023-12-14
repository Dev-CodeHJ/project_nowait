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

  <section class="food_section layout_padding-bottom">
    <div class="container">
      <form id="frm0" action="/menu/menuUserGet" method="post" style="padding: 50px;">
         <h2 align="center" style="padding-bottom: 20px;">장바구니 담기 페이지</h2>
        	<table>
            	<tr>
            		<td>메뉴 이름</td>
            		<th><input type="text" name="menuName" value="${menu.menuName}"></th>
            	</tr>
            	<tr>
            		<td>가격</td>
            		<th>${menu.price}원</th>
           		</tr>
            	<tr>
            		<td colspan="2">옵션 선택</td>
           		</tr>
				<c:forEach items="${optionList}" var="option">
					<c:choose>
						<c:when test="${option.optionStatus eq true}">
		           			<tr class="soldOut">
			            		<td colspan="2">
									<label>
										<input type="radio" name="menuOptionNum" id="menuOptionNum" value="${option.menuOptionNum}" disabled="disabled">
										${option.option} &nbsp; +${option.optionPrice}원
									</label>
			            		</td>
			            	</tr>
						</c:when>
						<c:otherwise>
		           			<tr>
			            		<th colspan="2">
									<label>
										<input type="radio" name="menuOptionNum" id="menuOptionNum" value="${option.menuOptionNum}">
										${option.option} &nbsp; +${option.optionPrice}원
									</label>
			            		</th>
			            	</tr>
						</c:otherwise>
					</c:choose>
				</c:forEach>
	            <tr>
	            	<td colspan="2">
	       				<button type="button" class="btn btn-success" style="margin: 30px;" onclick="storeUserGet_move()">이전</button>
	       				<button type="submit" class="btn btn-info" style="margin: 30px;" onclick="register_chk()" id="btn_register">장바구니 담기</button>
	            	</td>
	          	</tr>
	          	<tr style="display: none;">
	          		<td>
           				<input type="text" name="menuNum" value="${menu.menuNum}">
	       			</td>
	   			</tr>
        	</table>
      </form>
      
    </div>
  </section>

  <%@include file="../includes/footer.jsp" %>
<script type="text/javascript">
	$(document).ready(function() {
	  if(${insertOk}==1){
			alert("옵션이 등록되었습니다.");
		} else if(${insertOk}==0){
			alert("옵션 등록이 실패하셨습니다!");
		}
    });
</script>
<script type="text/javascript">
	$(document).ready(function() {
	  if(${updateOk}==1){
			alert("옵션이 수정되었습니다.");
		} else if(${updateOk}==0){
			alert("옵션 수정이 실패하셨습니다!");
		}
    });
</script>
<script type="text/javascript">
	$(document).ready(function() {
	  if(${deleteOk}==1){
			alert("옵션이 삭제되었습니다.");
		} else if(${deleteOk}==0){
			alert("옵션 삭제에 실패하셨습니다!");
		}
    });
</script>
<script type="text/javascript">
	$(document).ready(function() {
    $("#btn_register").click(function register_chk() {
    	  
	      if ($("#menuOptionNum").val() == "") {
	          alert("옵션을 선택해주세요!");
	          $("#menuOptionNum").focus();
	          return false;
	          
	      }
	      document.getElementById('frm0').submit();
          return true;
	  });
    });
</script>
<script type="text/javascript">
	function store_move() {
	    document.getElementById('frm').action="/store/storeOwnerGet";
		document.getElementById('frm').submit();
	}
	
	function menu_move() {
	    document.getElementById('frm').action="/menu/menuList";
		document.getElementById('frm').submit();
	}
	
	function menuUpdate_move() {
		document.getElementById('frm0').action="/menu/menuUpdate";
		document.getElementById('frm0').submit();
	}
	
	function menuDelete_move() {
	    if(confirm("선택하신 메뉴를 정말 삭제하시겠습니까?")) {
			document.getElementById('frm0').action="/menu/menuDelete";
			document.getElementById('frm0').submit();
	    }
	}
</script>
</body>
</html>