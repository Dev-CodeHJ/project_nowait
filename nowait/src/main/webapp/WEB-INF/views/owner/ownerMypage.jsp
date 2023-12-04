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
         <h2 align="center" style="padding: 10px; margin: 10px;">내 정보</h2>
         <table>
            <tr>
               <th>아이디</th>
               <td>${member.ownerId}</td>
            </tr>
            <tr>
				<th>이름</th>
				<td>${member.ownerName}</td>
			</tr>
			<tr>
				<td>생일</td>
				<td>${member.ownerBirth}</td>
			</tr>
			<tr>
				<th>전화번호</th>
				<td>${member.ownerPhone}</td>
			</tr>
			<tr>
				<td>이메일</td>
				<td>${member.ownerEmail}</td>
			</tr>
            <tr>
            	<td colspan="2">
           			<button type="button" class="btn btn-primary" style="margin: 30px;" onclick="location.href='/owner/ownerUpdate'">회원정보 수정</button>
           			<button type="button" class="btn btn-danger" style="margin: 30px;" onclick="location.href='/owner/ownerDelete'">회원 탈퇴</button>
            	</td>
          	</tr>
         </table>
         
         <!-- 비밀번호 확인 -->
         <div id="dialog" title="회원 탈퇴" style="display:none;">
         	<input type="hidden" name="id" id="id" value="${member.ownerId}">
         	<div class="detail-box" align="center" style="padding-top: 50px; padding-bottom: 20px;">
         		<input type=text name="pw" class="input-sm" id="pw" placeholder="비밀번호를 입력해주세요">
         	</div>
         	<div class="user_option" style="padding: 10px; margin: auto;">
         		<a class="order_online" href="/owner/ownerDelete" id="okBtn" onclick="return delete_chk()">비밀번호 입력</a>
         	</div>
         	<!--<table>
	         	<tr style="display: none;">
					<td><input type="text" name="id" id="id" value="${member.ownerId}"></td>
				</tr>
				<tr>
					<td>
						<input type=text name="pw" size=15 class="input-sm" id="pw" placeholder="password">
					</td>
				</tr>
				<tr align="center">
					<td id="result" colspan="2"></td>
				</tr>
				<tr id="okpw" align="center">
					<td colspan="2">
						<input type=button class="btn btn-sm btn-info" id="okBtn" value="비밀번호 입력">
					</td>
				</tr>
			</table>-->
	    </div>
    </div>
  </section>
  
  
  <%@include file="../includes/footer.jsp" %>
  <link rel="stylesheet" href="//code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
  <link rel="stylesheet" href="/resources/demos/style.css">
  <script src="https://code.jquery.com/jquery.js"></script>
  <script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
  <script type="text/javascript" src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript">
  $(function(){
	  
	    $('#pwcheck').click(function(){
	    	$('#pw').val('');
	    	$("#dialog").dialog({
	    		autoOpen:false,
	    		width:450,
	    		height:250,
	    		modal:true
	    	}).dialog("open");
	    })
	    /*
	    $('#okBtn').click(function(){
	    	if(res==='YES') {
		    	$('#dialog').dialog("close");
	    	} else {
	    		alert('비밀번호가 일치하지 않습니다!');
	    	}
	    })
	    */
	    $('#dialog').on('hide', function () {
	    	$(this).removeData();
		});
	    function delete_chk() {
	    //$('#okBtn').on("click",function(){
	    	let pw=$('#pw').val();
	    	if(pw.trim()==="") {
	    		alert('비밀번호를 입력해주세요!');
	    		$('#pw').focus(); // 태그 $('.클래스'), $('#아이디') , $('태그명')
	    		return false;
	    	}
	    	
	    	// 스프링서버로 전송 
	    	/*
	    	    axios.get(url,{params:{}}).then()
	    	    axios.post(url,)
	    	*/
	    	$.ajax({
	    		type:'post',
	    		url:'/owner/ownerPwCheck',
	    		data: {"id":id,
	    			"pw":pw},
	    		success:function(result)
	    		{
	    			res=result.trim();
	    			if(res==='YES') {
	    				if(confirm("정말로 탈퇴하시겠습니까?"<br>"(*탈퇴 후에는 회원정보는 복구되지 않습니다.)")){
	    					
	    					$.ajax({
	    			    		type:'get',
	    			    		url:'/owner/ownerDelete',
	    			    		data: {"id":id,
	    			    			"pw":pw},
	    			    		success:function(result)
	    			    		{
	    			    			//res=result.trim();
	    			    			if(result===1) {
    			    					$('#dialog').dialog("close");
    			    					alert('회원 탈퇴가 완료되었습니다.');
    			    					return true;
	    			    			}
	    			    		}
	    			    	});
	    				}
	    			} else {
	    				alert('비밀번호가 일치하지 않습니다!');
	    				return false;
	    			}
	    		}
	    	});
	    }
	    //);
	    
	  });
</script>
</body>
</html>