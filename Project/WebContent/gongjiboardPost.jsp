<%@ page contentType="text/html; charset=EUC-KR"%>
<html>
<head>
<title>�۾���</title>
<link href="style.css" rel="stylesheet" type="text/css">
<link href="bootstrap/css/bootstrap.min.css" rel="stylesheet"/>
<script>

</script>
</head>
<body>
<jsp:include page="Title.jsp">
<jsp:param value="a" name="a"/>
</jsp:include>
<br/><br/><br/>

<jsp:useBean id="dao" class="model.gongjiBoardDao"></jsp:useBean>
   
      <br>
      <br>
      <h2>���� ����</h2>
      <br>
      <table width=80%  cellspacing=0 cellpadding=3 >
         <form method=post action="project">
            <input type="hidden" name="cmd" value="GONGJIBOARDINSERT" />
            
            <tr>
               <td align=center>
                  <table border=0 width=100% align=center class="table table-striped">
                     <tr>
                        <td width=10%>�̸�</td>
                        <td width=90%> <%= dao.getMemberList(((String)session.getAttribute("member_id"))) %></td>
                     </tr>                                       
                     <tr>
                        <td width=10%>�� ��</td>
                        <td width=90%>
                        <input type="text" name="gongji_subject" size="50" maxlength="30"/></td>
                     </tr>
                     <tr>
                        <td width=10%>�� ��</td>
                        <td width=90%><textarea style="width:98%;" name="gongji_content" rows=10 cols=50></textarea></td>
                     </tr>
                     </table>
                     <tr>
                        <td colspan=2><hr size=1></td>
                        <td>
                        <input type=submit  class="btn" value="���">   <br/><br/>            
                      
                        <input type=reset class="btn" value="�ٽþ���">&nbsp;&nbsp;
                        </td>
                        
                     </tr>
                     
                     
                     
                  
               </td>
            </tr>
         </form>
      </table>
   
</body>
</html>