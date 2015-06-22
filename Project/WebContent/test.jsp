<%@ page contentType="text/html; charset=EUC-KR"%>

<%@ page contentType="text/html; charset=EUC-KR"%>
<% request.setCharacterEncoding("euc-kr"); %>
<% response.setCharacterEncoding("euc-kr"); %>

<html>
<head>
<title>회원가입</title>
<link href="bootstrap/css/bootstrap.min.css" rel="stylesheet"/>
<script src="bootstrap/js/jquery-2.1.4.js" ></script>
<script src="bootstrap/js/bootstrap.min.js"></script>
<style>

   body{
      background-color: #EAEAEA;
   }
   
</style>

<script>
   function Check(){
      
       if( (document.getElementById("member_id").value) == ""){
         
         document.f1.member_id.placeholder = "아이디를 입력해 주세요.";
      } 
     
   }

   function Register(){
       if( (document.getElementById("member_id").value) == ""){
             
         document.f1.member_id.placeholder = "아이디를 입력해 주세요.";
      }
       else{
      document.f1.submit();
       }
       }   
   
   function goback(){
	   location.href="Main.jsp";
   }
   $(document).ready(
            function(){
       var check = <%=request.getAttribute("idCheck") %>
               // var check = ${idCheck}
      
         if(check != null){
            
           alert("아이디가 중복됩니다.");
      
       }
      });
    
</script>
</head>
<body >
<%-- <jsp:include page="/Title.jsp"> --%>
<%-- <jsp:param value="" name=""/> --%>
<%-- </jsp:include> --%>


<div class="container">
<div class="row">
   
   <div class="span3">      <!--  span12개 940 px -->
   <h3 align="center">회원가입</h3>
      <form method="post" action="project" name="f1">
      <input type="hidden" name="cmd" value="REGISTER"/>
      <div class="input-append">
      <input type="text" placeholder="id" name="member_id"  id="member_id" />
      <button type="button" class="btn" onclick="Check()"><i class="icon-search" ></i>중복확인</button></div><br/>
      <input type="password" placeholder="password" name="member_pass"/><br/>
      <input type="password" placeholder="password확인" /><br/>
      <input type="text" placeholder="이름" name="member_name"/><br/>
      
      <input type="text" placeholder="연락처" name="member_phone"/><br/>
      <input type="email" placeholder="email" name="member_email"/><br/>
            
      <input type="radio" name="member_gender" id="man" value="남자" checked>남자
       <input type="radio" name="member_gender" id="woman" value="여자">여자<br/><br/>
       <button class="btn" type="button" style="width:100%; margin-bottom: 10px" onclick="Register()">
          <i class="icon-ok"></i>  가 입 하 기</button><br/>
   <button class="btn" type="reset" style="width:49%">
                <i class="icon-refresh"></i>다시작성</button>
         <button class="btn" type="button" style="width:49%" onclick="goback()">
               <i class="icon-circle-arrow-left"></i>메인으로</button>
      </form>   
   </div>
   </div>
   </div>

</body>
</html>