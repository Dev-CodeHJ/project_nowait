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
    	<form id="frm" action="/owner/ownerUpdate" method="post" style="padding: 50px;">
         <h2 align="center" style="padding: 10px; margin: 10px;">내 정보</h2>
         <p align="center" style="color: grey;">(*표시는 필수 입력사항)</p>
         <table>
         	<tr>
               <th>*아이디</th>
               <td>
	               <input type="text" name="ownerId" id="ownerId" readonly="readonly" value="${member.ownerId}" style="text-align: center; background-color: silver;">
               </td>
            </tr>
            <tr>
               <th>*비밀번호</th>
               <td><input type="password" name="ownerPw" id="ownerPw"></td>
            </tr>
            <tr>
               <th>*비밀번호 확인</th>
               <td><input type="password" name="ownerPw2" id="ownerPw2"></td>
            </tr>
            <tr>
				<th>*이름</th>
				<td>
					<input type="text" name="ownerName" id="ownerName" value="${member.ownerName}">
				</td>
			</tr>
			<!-- <tr style="display: none;">
				<td>
					<input type="text" name="ownerBirth1" id="ownerBirth1" value="${member.ownerBirth}">
				</td>
			</tr> -->
			<tr>
				<td>생일</td>
				<td>
					<input id="datepicker" type="text" name="ownerBirth" value="${member.ownerBirth}">
				</td>
			</tr>
			<tr style="display: none;">
				<td><input type="text" name="ownerPhone" id="ownerPhone" value="${member.ownerPhone}"></td>
			</tr>
			<tr>
				<th>*전화번호</th>
				<td>
					<input type="text" name="tel1" id="tel1" size="10" value="${member.ownerPhone.substring(0,3)}"> - <input type="text" name="tel2" id="tel2" size="10" value="${member.ownerPhone.substring(4,8)}"> - <input type="text" name="tel3" id="tel3" size="10" value="${member.ownerPhone.substring(9,13)}"><br>
					<p style="color: grey; margin-bottom: 0;">*앞자리는 010,011,017,018,019로 입력</p>
				</td>
			</tr>
			<tr>
				<td>이메일</td>
				<td>
					<input type="email" name="ownerEmail" id="ownerEmail" value="${member.ownerEmail}"> 
				</td>
			</tr>
            <tr>
            	<td colspan="2">
           			<button type="button" class="btn btn-primary" style="margin: 20px;" onclick="location.href='/owner/ownerMypage'">돌아가기</button>
           			<button type="submit" class="btn btn-success" style="margin: 20px;" onclick="return update_chk()" id="btn_update">수정완료</button>
            	</td>
          	</tr>
         </table>
    	</form>
    </div>
  </section>
  <%@include file="../includes/footer.jsp" %>
  <link rel="stylesheet" href="//code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
  <link rel="stylesheet" href="/resources/demos/style.css">
  <script src="https://code.jquery.com/jquery.js"></script>
  <script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
  <script type="text/javascript" src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
    $("#btn_update").click(function update_chk() {
      
    	  var tel1_pattern = /(^01[01789]$)/;
    	  var tel_pattern = /^[0-9+]{4,4}$/;
    	  
	      if ($("#ownerPw").val() == "") {
	          alert("비밀번호를 입력해주세요!");
	          $("#ownerPw").focus();
	          return false;
	      } else if ($("#ownerPw2").val() == "") {
	          alert("비밀번호확인을 입력해주세요!");
	          $("#ownerPw2").focus();
	          return false;
	      } else if ($("#ownerPw").val() != $("#ownerPw2").val()) {
	          alert("비밀번호와 비밀번호 확인이 일치하지않습니다.");
	          $("#ownerPw2").focus();
	          return false;
	          
	      } else if ($("#ownerName").val() == "") {
	          alert("이름을 입력해주세요!");
	          $("#ownerName").focus();
	          return false;
	          
	      } else if ($("#tel1").val() == "") {
              alert("전화번호를 입력해주세요!");
              $("#tel1").focus();
              return false;
          } else if ($("#tel1").val().length != 3) {
          	alert("첫 번째 전화번호 입력란은 010,011,017,018,019로 시작해야합니다!!");
              $("#tel1").focus();
              return false;
          } else if (isNaN($("#tel1").val())) {
          	alert("첫 번째 전화번호 입력란은 010,011,017,018,019로 시작해야합니다!!");
              $("#tel1").focus();
              return false;
          } else if (!tel1_pattern.test($("#tel1").val())) {
              alert("첫 번째 전화번호 입력란은 010,011,017,018,019로 시작해야합니다!!");
              $("#tel1").focus();
              return false;
              
          } else if ($("#tel2").val() == "") {
              alert("전화번호를 입력해주세요!");
              $("#tel2").focus();
              return false;
          } else if (isNaN($("#tel2").val())) {
          	alert("전화번호를 입력해주세요!");
              $("#tel2").focus();
              return false;
          } else if (!tel_pattern.test($("#tel2").val())) {
              alert("전화번호 입력 형식이 올바르지 않습니다!(4자리숫자)");
              $("#tel2").focus();
              return false;
          
          } else if ($("#tel3").val() == "") {
              alert("전화번호를 입력해주세요!");
              $("#tel3").focus();
              return false;
          } else if (isNaN($("#tel3").val())) {
          	alert("전화번호를 입력해주세요!");
              $("#tel3").focus();
              return false;
          } else if (!tel_pattern.test($("#tel3").val())) {
        	  alert("전화번호 입력 형식이 올바르지 않습니다!(4자리숫자)");
              $("#tel3").focus();
              return false;
	
	      } else {
	    	  $('#ownerPhone').val($('#tel1').val() + '-' + $('#tel2').val() + '-' + $('#tel3').val());
	          alert("회원정보가 수정되었습니다, 다시 로그인해주세요!");
	      }
		  $("#ownerBirth").datepicker();
	      document.getElementById('frm').submit();
          return true;
	  });
    });
</script>
<script type="text/javascript">
   $(function() {
       //input을 datepicker로 선언
       $("#datepicker").datepicker({
           dateFormat: 'yy-mm-dd' //달력 날짜 형태
           ,showOtherMonths: true //빈 공간에 현재월의 앞뒤월의 날짜를 표시
           ,showMonthAfterYear:true // 월- 년 순서가아닌 년도 - 월 순서
           ,changeYear: true //option값 년 선택 가능
           ,changeMonth: true //option값  월 선택 가능                
           ,showOn: "both" //button:버튼을 표시하고,버튼을 눌러야만 달력 표시 ^ both:버튼을 표시하고,버튼을 누르거나 input을 클릭하면 달력 표시  
           ,buttonImage: "http://jqueryui.com/resources/demos/datepicker/images/calendar.gif" //버튼 이미지 경로
           ,buttonImageOnly: true //버튼 이미지만 깔끔하게 보이게함
           ,buttonText: "선택" //버튼 호버 텍스트              
           ,yearSuffix: "년" //달력의 년도 부분 뒤 텍스트
           ,monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'] //달력의 월 부분 텍스트
           ,monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'] //달력의 월 부분 Tooltip
           ,dayNamesMin: ['일','월','화','수','목','금','토'] //달력의 요일 텍스트
           ,dayNames: ['일요일','월요일','화요일','수요일','목요일','금요일','토요일'] //달력의 요일 Tooltip
           ,minDate: "-120Y" //최소 선택일자(-1D:하루전, -1M:한달전, -1Y:일년전)
           ,maxDate: "-3Y" //최대 선택일자(+1D:하루후, -1M:한달후, -1Y:일년후)
       	   ,yearRange: '1930:2020'  
       });                    
       //var ownerBirth = $('#ownerBirth1').val();
       //$('#datepicker').datepicker('setDate', ownerBirth); //(-1D:하루전, -1M:한달전, -1Y:일년전), (+1D:하루후, -1M:한달후, -1Y:일년후)            
   });
</script>
</body>
</html>