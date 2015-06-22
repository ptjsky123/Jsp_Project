<%@ page contentType="text/html; charset=EUC-KR"%>
<% request.setCharacterEncoding("euc-kr"); %>
<% response.setCharacterEncoding("euc-kr"); %>
<!DOCTYPE html>

<html>
<head>
<title>회원가입</title>

<script>

   function RegisterChk(){
		var RegId = document.getElementById("member_id").value;
	   	var RegPass = document.getElementById("member_pass").value;
	   	var RegPassChk = document.getElementById("member_passChk").value;
	   	var RegName = document.getElementById("member_name").value;
	   	var RegPhone = document.getElementById("member_phone").value;
	   	var RegEmail = document.getElementById("member_email").value;
	   	
	   	
	   	
		if( RegId == ""){

         document.regi.member_id.placeholder = "아이디를 입력해 주세요.";
      }
		else if(RegId.length < 4){
		  document.regi.member_id.value = "";
          document.regi.member_id.placeholder = "아이디를 4자리 이상 입력해주세요."; 
       }
	   
		if(RegPass.length < 4){
		   document.regi.member_pass.value = "";
		   document.regi.member_passChk.value = "";
	       document.regi.member_pass.placeholder = "비밀번호를 4자리 이상 입력해주세요."; 
        }
		if(RegPass != RegPassChk){
			   document.regi.member_pass.value = "";
			   document.regi.member_passChk.value = "";
		       document.regi.member_pass.placeholder = "비밀번호 확인이 일치하지 않습니다."; 
	        }
		if( RegName == ""){

	         document.regi.member_name.placeholder = "이름을 입력해 주세요.";
	      }
		if( RegPhone == ""){

	         document.regi.member_phone.placeholder = "전화번호를 입력해 주세요.";
	      }
		if( RegEmail == ""){

	         document.regi.member_email.placeholder = "이메일을 입력해 주세요.";
	      }
	   
       if(! (RegId == ""|| RegId.length < 4|| RegPass.length < 4|| RegPass != RegPassChk|| RegName == ""||RegPhone == ""||RegEmail == "")){
    	   
      document.regi.submit();
       }
       }   
   
   function goback(){
	   location.href="Main.jsp";
   }

    
</script>
</head>
<body >
<div class="container" style="width: 250px; height: 100px;">
<div class="row" style="width: 250px; height: 100px;">
   
   <div class="span3" style="width: 250px; height: 50px;">      <!--  span12개 940 px -->
<!--    <h3 align="center">회원가입</h3> -->
      <div align="center" style="width: 250px; height: 50px;">
      <form method="post" action="project" name="regi" >
      <input type="hidden" name="cmd" value="REGISTER"/>
    
      <input type="text" placeholder="id" name="member_id"  id="member_id" />
     <br/>
      <input type="password" placeholder="password" name="member_pass" id="member_pass"/><br/>
      <input type="password" placeholder="password확인" id="member_passChk"/><br/>
      <input type="text" placeholder="이름" name="member_name" id="member_name"/><br/>
      
      <input type="text" placeholder="연락처" name="member_phone" id="member_phone"/><br/>
      <input type="email" placeholder="email" name="member_email" id="member_email"/><br/>
            
      <input type="radio" name="member_gender" id="man" value="남자" checked>남자
       <input type="radio" name="member_gender" id="woman" value="여자">여자<br/><br/>
       <button class="btn" type="button" style="width:230px; margin-bottom: 10px" onclick="RegisterChk()">
          <i class="icon-ok"></i>  가 입 하 기</button><br/>
   <button class="btn" type="reset" style="width:113px">
                <i class="icon-refresh"></i>다시작성</button>
         <button class="btn" type="button" style="width:113px" onclick="goback()">
               <i class="icon-circle-arrow-left"></i>메인으로</button>
      </form>   
      </div>
   </div>
   </div>
   </div>

</body>
</html>