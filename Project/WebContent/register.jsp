<%@ page contentType="text/html; charset=EUC-KR"%>
<% request.setCharacterEncoding("euc-kr"); %>
<% response.setCharacterEncoding("euc-kr"); %>
<!DOCTYPE html>

<html>
<head>
<title>ȸ������</title>

<script>

   function RegisterChk(){
		var RegId = document.getElementById("member_id").value;
	   	var RegPass = document.getElementById("member_pass").value;
	   	var RegPassChk = document.getElementById("member_passChk").value;
	   	var RegName = document.getElementById("member_name").value;
	   	var RegPhone = document.getElementById("member_phone").value;
	   	var RegEmail = document.getElementById("member_email").value;
	   	
	   	
	   	
		if( RegId == ""){

         document.regi.member_id.placeholder = "���̵� �Է��� �ּ���.";
      }
		else if(RegId.length < 4){
		  document.regi.member_id.value = "";
          document.regi.member_id.placeholder = "���̵� 4�ڸ� �̻� �Է����ּ���."; 
       }
	   
		if(RegPass.length < 4){
		   document.regi.member_pass.value = "";
		   document.regi.member_passChk.value = "";
	       document.regi.member_pass.placeholder = "��й�ȣ�� 4�ڸ� �̻� �Է����ּ���."; 
        }
		if(RegPass != RegPassChk){
			   document.regi.member_pass.value = "";
			   document.regi.member_passChk.value = "";
		       document.regi.member_pass.placeholder = "��й�ȣ Ȯ���� ��ġ���� �ʽ��ϴ�."; 
	        }
		if( RegName == ""){

	         document.regi.member_name.placeholder = "�̸��� �Է��� �ּ���.";
	      }
		if( RegPhone == ""){

	         document.regi.member_phone.placeholder = "��ȭ��ȣ�� �Է��� �ּ���.";
	      }
		if( RegEmail == ""){

	         document.regi.member_email.placeholder = "�̸����� �Է��� �ּ���.";
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
   
   <div class="span3" style="width: 250px; height: 50px;">      <!--  span12�� 940 px -->
<!--    <h3 align="center">ȸ������</h3> -->
      <div align="center" style="width: 250px; height: 50px;">
      <form method="post" action="project" name="regi" >
      <input type="hidden" name="cmd" value="REGISTER"/>
    
      <input type="text" placeholder="id" name="member_id"  id="member_id" />
     <br/>
      <input type="password" placeholder="password" name="member_pass" id="member_pass"/><br/>
      <input type="password" placeholder="passwordȮ��" id="member_passChk"/><br/>
      <input type="text" placeholder="�̸�" name="member_name" id="member_name"/><br/>
      
      <input type="text" placeholder="����ó" name="member_phone" id="member_phone"/><br/>
      <input type="email" placeholder="email" name="member_email" id="member_email"/><br/>
            
      <input type="radio" name="member_gender" id="man" value="����" checked>����
       <input type="radio" name="member_gender" id="woman" value="����">����<br/><br/>
       <button class="btn" type="button" style="width:230px; margin-bottom: 10px" onclick="RegisterChk()">
          <i class="icon-ok"></i>  �� �� �� ��</button><br/>
   <button class="btn" type="reset" style="width:113px">
                <i class="icon-refresh"></i>�ٽ��ۼ�</button>
         <button class="btn" type="button" style="width:113px" onclick="goback()">
               <i class="icon-circle-arrow-left"></i>��������</button>
      </form>   
      </div>
   </div>
   </div>
   </div>

</body>
</html>