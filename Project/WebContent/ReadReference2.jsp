<%@page import="java.util.Vector"%>
<%@page import="model.busi_tableDto"%>
<%@ page  contentType="text/html; charset=EUC-KR"%>

<!DOCTYPE html>
<html>

<head>
<title>Insert title here</title>

</head>





<body>

<form>
 <div class="container" id ="info">
   <div class="row">
      <div class="span9"> 
<jsp:useBean id="usedao" class="model.busi_tableDao"></jsp:useBean>

<%   Vector busi_list1 = usedao.getBusi_tableList(2);%>

         <div style="position:relative">
                <%
   for(int i=0; i<busi_list1.size(); i++){
      busi_tableDto bdto1 = (busi_tableDto)busi_list1.get(i);%>
      <%if((bdto1.getTable_use().equals("1"))&&(bdto1.getTable_number()==1)){ %>

        <div style = 'position:absolute;left:145px;top:122px;z-index: 3;display:"";'>
          <font color="yellow"><h3 style="color: yellow">1.���</h3></a></font></div>
       <%}else if((bdto1.getTable_use().equals("0"))&&(bdto1.getTable_number()==1)){ %>
       <div style = 'position:absolute;left:145px;top:122px;z-index: 3;display:"";'>
       <font color="white"><h3 style="color: white">1.����</h3></a></font></div>
       <%} %>
       
        <%if((bdto1.getTable_use().equals("1"))&&(bdto1.getTable_number()==2)){ %>
        <div style = 'position:absolute;left:145px;top:269px;z-index: 3;display:"";'>
          <font color="yellow"><h3>2.���</h3></font></div>
       <%}else if((bdto1.getTable_use().equals("0"))&&(bdto1.getTable_number()==2)){ %>
       <div style = 'position:absolute;left:145px;top:269px;z-index: 3;display:"";'>
       <font color="white"><a href=""><h3>2.����</h3></a></font></div>
       <%} %>
       
       <%if((bdto1.getTable_use().equals("1"))&&(bdto1.getTable_number()==3)){ %>
        <div style = 'position:absolute;left:145px;top:390px;z-index: 3;display:"";'>
          <font color="yellow"><h3>3.���</h3></font></div>
       <%}else if((bdto1.getTable_use().equals("0"))&&(bdto1.getTable_number()==3)){ %>
       <div style = 'position:absolute;left:145px;top:390px;z-index: 3;display:"";'>
       <font color="white"><h3>3.����</h3></font></div>
       <%} %>
       
       <%if((bdto1.getTable_use().equals("1"))&&(bdto1.getTable_number()==4)){ %>
        <div style = 'position:absolute;left:355px;top:140px;z-index: 3;display:"";'>
          <font color="yellow"><h4>4.���</h4></font></div>
       <%}else if((bdto1.getTable_use().equals("0"))&&(bdto1.getTable_number()==4)){ %>
       <div style = 'position:absolute;left:355px;top:140px;z-index: 3;display:"";'>
       <font color="white"><h4>4.����</h4></font></div>
       <%} %>
       
       <%if((bdto1.getTable_use().equals("1"))&&(bdto1.getTable_number()==5)){ %>
        <div style = 'position:absolute;left:465px;top:137px;z-index: 3;display:"";'>
          <font color="yellow"><h4>5.���</h4>></font></div>
       <%}else if((bdto1.getTable_use().equals("0"))&&(bdto1.getTable_number()==5)){ %>
       <div style = 'position:absolute;left:465px;top:137px;z-index: 3;display:"";'>
       <font color="white"><h4>5.����</h4></font></div>
       <%} %>
       
       <%if((bdto1.getTable_use().equals("1"))&&(bdto1.getTable_number()==6)){ %>
        <div style = 'position:absolute;left:578px;top:137px;z-index: 3;display:"";'>
          <font color="yellow"><h4>6.���</h4></font></div>
       <%}else if((bdto1.getTable_use().equals("0"))&&(bdto1.getTable_number()==6)){ %>
       <div style = 'position:absolute;left:578px;top:137px;z-index: 3;display:"";'>
       <font color="white"><h4>6.����</h4></font></div>
       <%} %>
       
       <%if((bdto1.getTable_use().equals("1"))&&(bdto1.getTable_number()==7)){ %>
        <div style = 'position:absolute;left:677px;top:131px;z-index: 3;display:"";'>
          <font color="yellow"><h3>7.���</h3></font></div>
       <%}else if((bdto1.getTable_use().equals("0"))&&(bdto1.getTable_number()==7)){ %>
       <div style = 'position:absolute;left:677px;top:131px;z-index: 3;display:"";'>
       <font color="white"><h3>7.����</h3>></font></div>
       <%} %>
       
       <%if((bdto1.getTable_use().equals("1"))&&(bdto1.getTable_number()==8)){ %>
        <div style = 'position:absolute;left:675px;top:283px;z-index: 3;display:"";'>
          <font color="yellow"><h3>8.���</h3></font></div>
       <%}else if((bdto1.getTable_use().equals("0"))&&(bdto1.getTable_number()==8)){ %>
       <div style = 'position:absolute;left:675px;top:283px;z-index: 3;display:"";'>
       <font color="white"><h3>8.����</h3></font></div>
       <%} %>
       
       <%if((bdto1.getTable_use().equals("1"))&&(bdto1.getTable_number()==9)){ %>
        <div style = 'position:absolute;left:567px;top:288px;z-index: 3;display:"";'>
          <font color="yellow"><h3>9.���</h3></font></div>
       <%}else if((bdto1.getTable_use().equals("0"))&&(bdto1.getTable_number()==9)){ %>
       <div style = 'position:absolute;left:567px;top:288px;z-index: 3;display:"";'>
       <font color="white"><h3>9.����</h3></font></div>
       <%} %>
       
       <%if((bdto1.getTable_use().equals("1"))&&(bdto1.getTable_number()==10)){ %>
        <div style = 'position:absolute;left:447px;top:288px;z-index: 3;display:"";'>
          <font color="yellow"><h3>10.���</h3></font></div>
       <%}else if((bdto1.getTable_use().equals("0"))&&(bdto1.getTable_number()==10)){ %>
       <div style = 'position:absolute;left:447px;top:288px;z-index: 3;display:"";'>
       <font color="white"><h3>10.����</h3></font></div>
       <%} %>
       
       <%if((bdto1.getTable_use().equals("1"))&&(bdto1.getTable_number()==11)){ %>
        <div style = 'position:absolute;left:324px;top:288px;z-index: 3;display:"";'>
          <font color="yellow"><h3>11.���</h3></font></div>
       <%}else if((bdto1.getTable_use().equals("0"))&&(bdto1.getTable_number()==11)){ %>
       <div style = 'position:absolute;left:324px;top:288px;z-index: 3;display:"";'>
       <font color="white"><h3>11.����</h3></font></div>
       <%} %>
       
       <%if((bdto1.getTable_use().equals("1"))&&(bdto1.getTable_number()==12)){ %>
        <div style = 'position:absolute;left:324px;top:413px;z-index: 3;display:"";'>
          <font color="yellow"><h3>12.���</h3></font></div>
       <%}else if((bdto1.getTable_use().equals("0"))&&(bdto1.getTable_number()==12)){ %>
       <div style = 'position:absolute;left:324px;top:413px;z-index: 3;display:"";'>
       <font color="white"><h3>12.����</h3></font></div>
       <%} %>
       
       <%if((bdto1.getTable_use().equals("1"))&&(bdto1.getTable_number()==13)){ %>
        <div style = 'position:absolute;left:454px;top:422px;z-index: 3;display:"";'>
          <font color="yellow"><h3>13.���</h3></font></div>
       <%}else if((bdto1.getTable_use().equals("0"))&&(bdto1.getTable_number()==13)){ %>
       <div style = 'position:absolute;left:454px;top:422px;z-index: 3;display:"";'>
       <font color="white"><h3>13.����</h3></font></div>
       <%} %>
       
       <%} %>
       </div>
<img src="img/cccccc.jpg">
      </div>
      </div>
      </div>
</form>
</body>
</html>