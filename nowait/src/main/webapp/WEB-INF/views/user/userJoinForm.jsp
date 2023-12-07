<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@include file="../includes/header.jsp" %>
<!DOCTYPE html>
<html lang="en">

  <section class="food_section layout_padding-bottom">
    <div class="container">
      <div class="heading_container heading_center">
      </div>
      <form id="frm" action="/user/userJoinForm" method="post" style="padding: 100px;">
         <h2 align="center">손님 회원가입</h2>
         <p align="center" style="color: grey;">(*표시는 필수 입력사항)</p>
         <table style="margin: auto; border-collapse: separate; border-spacing: 20px 20px;">
            <tr>
               <th>*아이디</th>
               <td>
                  <input type="text" name="userId" id="userId" readonly="readonly" placeholder="4~15자 영문,숫자">${id}
                  <input type=button class="btn btn-sm btn-danger" value="아이디중복체크" id="idcheck">
               </td>
            </tr>
            <tr>
               <th>*비밀번호</th>
               <td><input type="password" name="userPw" id="userPw"></td>
            </tr>
            <tr>
               <th>*비밀번호 확인</th>
               <td><input type="password" name="userPw2" id="userPw2"></td>
            </tr>
            <tr>
            <th>*이름</th>
            <td>
               <input type="text" name="userName" id="userName">
            </td>
         </tr>
         <tr>
            <td>생일</td>
            <td>
               <input id="datepicker" type="text" name="userBirth" id="userBirth">
            </td>
         </tr>
         <tr style="display: none;">
            <td><input type="text" name="userPhone" id="userPhone"></td>
         </tr>
         <tr>
            <th>*전화번호</th>
            <td>
               <input type="text" name="tel1" id="tel1" size="10"> - <input type="text" name="tel2" id="tel2" size="10"> - <input type="text" name="tel3" id="tel3" size="10"><br>
               <p style="color: grey;">*앞자리는 010,011,017,018,019로 입력</p>
            </td>
         </tr>
         <tr>
            <td>이메일</td>
            <td>
               <input type="email" name="userEmail" id="userEmail"> 
            </td>
         </tr>
            <tr>
         <tr>
            <td>주소</td>
            <td>
               <input type="text" name="userAddr" id="userAddr"><br>         
            </td>
         </tr>
               <td colspan="2" align="center">
                   <div class="btn-box">
                      <a href="#" onclick="return join_chk()" id="btn_join">회원가입</a>
                   </div>
               </td>
             </tr>
         </table>
      </form>
      
     <!-- id중복체크 -->
     <div id="dialog" title="아이디 중복체크" style="display:none;">
      <table class="table">
         <tr>
            <th>아이디</th>
            <td>
               <input type=text name="id" size=15 class="input-sm" id="id" placeholder="4~15자 영문,숫자">
               <input type=button class="btn btn-sm btn-success" id="idBtn" value="아이디체크">
            </td>
         </tr>
         <tr align="center">
            <td id="result" colspan="2"></td>
         </tr>
         <tr id="okid" align="center">
            <td colspan="2">
               <input type=button class="btn btn-sm btn-info" id="okBtn" value="아이디 사용">
            </td>
         </tr>
      </table>
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
   $(document).ready(function() {
    $("#btn_join").click(function join_chk() {
      
         var tel1_pattern = /(^01[01789]$)/;
         var tel2_pattern = /^[0-9+]{3,4}$/;
         var tel3_pattern = /^[0-9+]{4,4}$/;
         
         if ($("#userId").val() == "") {
             alert("아이디 중복체크를 통해 아이디를 입력해주세요!");
             $("#idcheck").focus();
             return false;
             
         } else if ($("#userPw").val() == "") {
             alert("비밀번호를 입력해주세요!");
             $("#userPw").focus();
             return false;
         } else if ($("#userPw2").val() == "") {
             alert("비밀번호확인을 입력해주세요!");
             $("#userPw2").focus();
             return false;
         } else if ($("#userPw").val() != $("#userPw2").val()) {
             alert("비밀번호와 비밀번호 확인이 일치하지않습니다.");
             $("#userPw2").focus();
             return false;
             
         } else if ($("#userName").val() == "") {
             alert("이름을 입력해주세요!");
             $("#userName").focus();
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
          } else if (!tel2_pattern.test($("#tel2").val())) {
              alert("전화번호 입력 형식이 올바르지 않습니다!(3~4자리숫자)");
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
          } else if (!tel3_pattern.test($("#tel3").val())) {
             alert("전화번호 입력 형식이 올바르지 않습니다!(4자리숫자)");
              $("#tel3").focus();
              return false;
   
         } else {
            $('#userPhone').val($('#tel1').val() + '-' + $('#tel2').val() + '-' + $('#tel3').val());
             alert("회원가입이 완료되었습니다!!");
         }
        $("#userBirth").datepicker();
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
       
       //초기값을 오늘 날짜로 설정해줘야 합니다.
       $('#datepicker').datepicker('setDate', ''); //(-1D:하루전, -1M:한달전, -1Y:일년전), (+1D:하루후, -1M:한달후, -1Y:일년후)            
   });
</script>
<script type="text/javascript">
  $(function(){
     
     var regex = /^[A-Za-z0-9+]{4,15}$/;
     
      $('#okid').hide();
       $('#idcheck').click(function(){
          $('#id').val('');
          $('#result').empty();
          $('#okid').hide();
          $("#dialog").dialog({
             autoOpen:false,
             width:450,
             height:250,
             modal:true
          }).dialog("open");
       })
       
       $('#okBtn').click(function(){
          if(res==='YES') {
             $('#userId').val($('#id').val());
             $('#dialog').dialog("close");
          } else {
             alert('사용중인 아이디는 사용할 수 없습니다!');
          }
       })
       
       $('#dialog').on('hide', function () {
          $(this).removeData();
      });
       
       $('#postBtn').click(function(){
          new daum.Postcode({
            oncomplete:function(data)
            {
               $('#post').val(data.zonecode)
               $('#addr1').val(data.address)
            }
         }).open()
       })
       
       $('#idBtn').on("click",function(){
          let id=$('#id').val();
          if(id.trim()==="") {
             let msg='<span style="color:red">4자~15자 사이의 영문 대소문자와 숫자로만 입력해주세요!</span>';
             //let msg='<span style="color:orange">아이디를 입력해주세요!!</span>';
            $('#result').html(msg);
            $('#okid').hide();
             $('#id').focus(); // 태그 $('.클래스'), $('#아이디') , $('태그명')
             //  $refs.ref명 ==> vuejs,react
             // node => 서버측 사이드 (Spring)
             // app.get('../a.do',function(request,response){처리})
             return;
          } else if (!regex.test($("#id").val())) {
             let msg='<span style="color:red">4자~15자 사이의 영문 대소문자와 숫자로만 입력해주세요!</span>';
             $('#result').html(msg);
             $('#okid').hide();
              $("#id").focus();
             return;
          }
          
          // 스프링서버로 전송 
          /*
              axios.get(url,{params:{}}).then()
              axios.post(url,)
          */
          $.ajax({
             type:'post',
             url:'/user/userIdCheck',
             data: {"id":id},
             success:function(result)
             {
                res=result.trim();
                if(res==='YES') {
                   /*
                   if(confirm('(' + id + ") 이 아이디를 사용하시겠습니까?")){
                      $('#ownerId').val($('#id').val())
                       $('#dialog').dialog("close");
                   }
                   */
                   let msg='<span style="color:blue">'+id+'는(은) 사용 가능한 아이디입니다.</span>';
                   $('#result').html(msg);
                   $('#okid').show();
                } else {
                   let msg='<span style="color:red">'+id+'는(은) 사용중인 아이디입니다</span>';
                   $('#result').html(msg)
                   $('#okid').hide();
                }
             }
          });
       });
     });
  </script>
</body>
</html>