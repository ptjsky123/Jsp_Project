<%@ page contentType="text/html; charset=EUC-KR"%>
<% request.setCharacterEncoding("euc-kr"); %>
<% response.setCharacterEncoding("euc-kr"); %>
<!DOCTYPE html>

<html>
<head>
<title>ȸ������</title>

<script>

   function RegiEditChk(){
	   
	   var RegPass = document.getElementById("member_edit_pass").value;
	   var RegPassChk = document.getElementById("member_edit_passChk").value;	   
	   	var RegName = document.getElementById("member_edit_name").value;	  
	   	var RegPhone = document.getElementById("member_edit_phone").value;
	   	var RegEmail = document.getElementById("member_edit_email").value;
	 	
	 	
	   	
		if(RegPass.length < 4){
		   document.regiEdit.member_edit_pass.value = "";
		   document.regiEdit.member_edit_passChk.value = "";
	       document.regiEdit.member_edit_pass.placeholder = "��й�ȣ�� 4�ڸ� �̻� �Է����ּ���."; 
        }
		if(RegPass != RegPassChk){
			   document.regiEdit.member_edit_pass.value = "";
			   document.regiEdit.member_edit_passChk.value = "";
		       document.regiEdit.member_edit_pass.placeholder = "��й�ȣ Ȯ���� ��ġ���� �ʽ��ϴ�."; 
	        }
		if( RegName == ""){

	         document.regiEdit.member_edit_name.placeholder = "�̸��� �Է��� �ּ���.";
	      }
		if( RegPhone == ""){

	         document.regiEdit.member_edit_phone.placeholder = "��ȭ��ȣ�� �Է��� �ּ���.";
	      }
		if( RegEmail == ""){

	         document.regiEdit.member_edit_email.placeholder = "�̸����� �Է��� �ּ���.";
	      }
	   
       if(! (RegPass.length < 4|| RegPass != RegPassChk|| RegName == ""||RegPhone == ""||RegEmail == "")){
    	   
      document.regiEdit.submit();
       }
       }   
   
 
    
</script>
</head>
<body >
<jsp:useBean id="dao" class="model.memberDao"></jsp:useBean>
<jsp:useBean id="dto" class="model.memberDto"></jsp:useBean>
<%  
dto = dao.getRegister((String)session.getAttribute("member_id"));
%>



 
<div class="container" style="width: 250px; height: 100px;">
<div class="row" style="width: 250px; height: 100px;">
   
   <div class="span3" style="width: 250px; height: 50px;">      <!--  span12�� 940 px -->
<!--    <h3 align="center">ȸ������</h3> -->
      <div align="center" style="width: 250px; height: 50px;">
      <form method="post" action="project" name="regiEdit" >
      <input type="hidden" name="cmd" value="REGISTEREDIT"/>
   
     <br/>
        <input type="text" placeholder="�̸�" name="member_edit_name" id="member_edit_name" value="<%= dto.getMember_name()%>"/><br/>
      <input type="password" placeholder="password" name="member_edit_pass" id="member_edit_pass" value="<%= dto.getMember_pass()%>"/><br/>
      <input type="password" placeholder="passwordȮ��" id="member_edit_passChk" value="<%= dto.getMember_pass()%>"/><br/>
   
      
      <input type="text" placeholder="����ó" name="member_edit_phone" id="member_edit_phone" value="<%= dto.getMember_phone()%>"/><br/>
      <input type="email" placeholder="email" name="member_edit_email" id="member_edit_email" value="<%= dto.getMember_email()%>"/><br/>
            
      <input type="radio" name="member_edit_gender" id="man" value="����" checked>����
       <input type="radio" name="member_edit_gender" id="woman" value="����">����<br/><br/>
       <button class="btn" type="button" style="width:230px; margin-bottom: 10px" onclick="RegiEditChk()">
          <i class="icon-ok"></i>  �� �� �� ��</button><br/>

         <button class="btn" type="button" style="width:230px" onclick="goback()">
               <i class="icon-circle-arrow-left"></i>��������</button>
      </form>   
      </div>
   </div>
   </div>
   </div>

</body>
</html>