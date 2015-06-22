<%@page import="java.util.Vector"%>
<%@page import="model.busi_tableDto"%>
<%@ page  contentType="text/html; charset=EUC-KR"%>

<!DOCTYPE html>
<html>

<head>
<title>Insert title here</title>

</head>

<body >
<script src="js/jquery-2.1.4.js"></script>
<form>
 <div class="container" id ="info">
   <div class="row">
      <div class="span9"> 
<jsp:useBean id="usedao" class="model.busi_tableDao"></jsp:useBean>

<%  String num = request.getParameter("num"); 
	System.out.println(num+"numbufdfudbfudf");
	Vector busi_list1 = usedao.getBusi_tableList(1);%>

         <div style="position:relative">
                <%
   for(int i=0; i<busi_list1.size(); i++){
      busi_tableDto bdto1 = (busi_tableDto)busi_list1.get(i);%>
      <%if((bdto1.getTable_use().equals("1"))&&(bdto1.getTable_number()==1)){ %>
        <div style = 'position:absolute;left:100px;top:119px;z-index: 3;display:"";'>
          <font color="yellow"><a href="#ImgModal" target="_blank" style="text-decoration:none" data-toggle="modal" ><h4 style="color: yellow">1.사용</h4></a></font></div>
       <%}else if((bdto1.getTable_use().equals("0"))&&(bdto1.getTable_number()==1)){ %>
       <div style = 'position:absolute;left:100px;top:119px;z-index: 3;display:"";'>
       <font color="white"><a href="#ImgModal" target="_blank" style="text-decoration:none" data-toggle="modal" ><h4 style="color: white">1.공석</h4></a></font></div>
       <%} %>
       
        <%if((bdto1.getTable_use().equals("1"))&&(bdto1.getTable_number()==2)){ %>
        <div style = 'position:absolute;left:100px;top:269px;z-index: 3;display:"";'>
          <font color="yellow"><h4>2.사용</h4></font></div>
       <%}else if((bdto1.getTable_use().equals("0"))&&(bdto1.getTable_number()==2)){ %>
       <div style = 'position:absolute;left:100px;top:269px;z-index: 3;display:"";'>
       <font color="white"><h4>2.공석</h4></a></font></div>
       <%} %>
       
       <%if((bdto1.getTable_use().equals("1"))&&(bdto1.getTable_number()==3)){ %>
        <div style = 'position:absolute;left:100px;top:419px;z-index: 3;display:"";'>
          <font color="yellow"><h4>3.사용</h4></font></div>
       <%}else if((bdto1.getTable_use().equals("0"))&&(bdto1.getTable_number()==3)){ %>
       <div style = 'position:absolute;left:100px;top:419px;z-index: 3;display:"";'>
       <font color="white"><h4>3.공석</h4></font></div>
       <%} %>
       
       <%if((bdto1.getTable_use().equals("1"))&&(bdto1.getTable_number()==4)){ %>
        <div style = 'position:absolute;left:190px;top:110px;z-index: 3;display:"";'>
          <font color="yellow"><h3>4.사용</h3></font></div>
       <%}else if((bdto1.getTable_use().equals("0"))&&(bdto1.getTable_number()==4)){ %>
       <div style = 'position:absolute;left:190px;top:110px;z-index: 3;display:"";'>
       <font color="white"><h3>4.공석</h3></font></div>
       <%} %>
       
       <%if((bdto1.getTable_use().equals("1"))&&(bdto1.getTable_number()==5)){ %>
        <div style = 'position:absolute;left:190px;top:258px;z-index: 3;display:"";'>
          <font color="yellow"><h3>5.사용</h3>></font></div>
       <%}else if((bdto1.getTable_use().equals("0"))&&(bdto1.getTable_number()==5)){ %>
       <div style = 'position:absolute;left:190px;top:258px;z-index: 3;display:"";'>
       <font color="white"><h3>5.공석</h3></font></div>
       <%} %>
       
       <%if((bdto1.getTable_use().equals("1"))&&(bdto1.getTable_number()==6)){ %>
        <div style = 'position:absolute;left:190px;top:408px;z-index: 3;display:"";'>
          <font color="yellow"><h3>6.사용</h3></font></div>
       <%}else if((bdto1.getTable_use().equals("0"))&&(bdto1.getTable_number()==6)){ %>
       <div style = 'position:absolute;left:190px;top:408px;z-index: 3;display:"";'>
       <font color="white"><h3>6.공석</h3></font></div>
       <%} %>
       
       <%if((bdto1.getTable_use().equals("1"))&&(bdto1.getTable_number()==7)){ %>
        <div style = 'position:absolute;left:365px;top:220px;z-index: 3;display:"";'>
          <font color="yellow"><h3>7.사용</h3></font></div>
       <%}else if((bdto1.getTable_use().equals("0"))&&(bdto1.getTable_number()==7)){ %>
       <div style = 'position:absolute;left:365px;top:220px;z-index: 3;display:"";'>
       <font color="white"><h3>7.공석</h3>></font></div>
       <%} %>
       
       <%if((bdto1.getTable_use().equals("1"))&&(bdto1.getTable_number()==8)){ %>
        <div style = 'position:absolute;left:365px;top:310px;z-index: 3;display:"";'>
          <font color="yellow"><h3>8.사용</h3></font></div>
       <%}else if((bdto1.getTable_use().equals("0"))&&(bdto1.getTable_number()==8)){ %>
       <div style = 'position:absolute;left:365px;top:310px;z-index: 3;display:"";'>
       <font color="white"><h3>8.공석</h3></font></div>
       <%} %>
       
       <%if((bdto1.getTable_use().equals("1"))&&(bdto1.getTable_number()==9)){ %>
        <div style = 'position:absolute;left:450px;top:317px;z-index: 3;display:"";'>
          <font color="yellow"><h4>9.사용</h4></font></div>
       <%}else if((bdto1.getTable_use().equals("0"))&&(bdto1.getTable_number()==9)){ %>
       <div style = 'position:absolute;left:450px;top:317px;z-index: 3;display:"";'>
       <font color="white"><h4>9.공석</h4></font></div>
       <%} %>
       
       <%if((bdto1.getTable_use().equals("1"))&&(bdto1.getTable_number()==10)){ %>
        <div style = 'position:absolute;left:450px;top:227px;z-index: 3;display:"";'>
          <font color="yellow"><h4>10.사용</h4></font></div>
       <%}else if((bdto1.getTable_use().equals("0"))&&(bdto1.getTable_number()==10)){ %>
       <div style = 'position:absolute;left:450px;top:227px;z-index: 3;display:"";'>
       <font color="white"><h4>10.공석</h4></font></div>
       <%} %>
       
       <%if((bdto1.getTable_use().equals("1"))&&(bdto1.getTable_number()==11)){ %>
        <div style = 'position:absolute;left:619px;top:120px;z-index: 3;display:"";'>
          <font color="yellow"><h4>11.사용</h4></font></div>
       <%}else if((bdto1.getTable_use().equals("0"))&&(bdto1.getTable_number()==11)){ %>
       <div style = 'position:absolute;left:619px;top:120px;z-index: 3;display:"";'>
       <font color="white"><h4>11.공석</h4></font></div>
       <%} %>
       
       <%if((bdto1.getTable_use().equals("1"))&&(bdto1.getTable_number()==12)){ %>
        <div style = 'position:absolute;left:619px;top:230px;z-index: 3;display:"";'>
          <font color="yellow"><h4>12.사용</h4></font></div>
       <%}else if((bdto1.getTable_use().equals("0"))&&(bdto1.getTable_number()==12)){ %>
       <div style = 'position:absolute;left:619px;top:230px;z-index: 3;display:"";'>
       <font color="white"><h4>12.공석</h4></font></div>
       <%} %>
       
       <%if((bdto1.getTable_use().equals("1"))&&(bdto1.getTable_number()==13)){ %>
        <div style = 'position:absolute;left:619px;top:333px;z-index: 3;display:"";'>
          <font color="yellow"><h4>13.사용</h4></font></div>
       <%}else if((bdto1.getTable_use().equals("0"))&&(bdto1.getTable_number()==13)){ %>
       <div style = 'position:absolute;left:619px;top:333px;z-index: 3;display:"";'>
       <font color="white"><h4>13.공석</h4></font></div>
       <%} %>
       
       <%if((bdto1.getTable_use().equals("1"))&&(bdto1.getTable_number()==14)){ %>
        <div style = 'position:absolute;left:700px;top:110px;z-index: 3;display:"";'>
          <font color="yellow"><h3>14.사용</h3></font></div>
       <%}else if((bdto1.getTable_use().equals("0"))&&(bdto1.getTable_number()==14)){ %>
       <div style = 'position:absolute;left:700px;top:110px;z-index: 3;display:"";'>
       <font color="white"><h3>14.공석</h3></font></div>
       <%} %>
       
       <%if((bdto1.getTable_use().equals("1"))&&(bdto1.getTable_number()==15)){ %>
        <div style = 'position:absolute;left:700px;top:219px;z-index: 3;display:"";'>
          <font color="yellow"><h3>15.사용</h3></font></div>
       <%}else if((bdto1.getTable_use().equals("0"))&&(bdto1.getTable_number()==15)){ %>
       <div style = 'position:absolute;left:700px;top:219px;z-index: 3;display:"";'>
       <font color="white"><h3>15.공석</h3></font></div>
       <%} %>
       
       <%if((bdto1.getTable_use().equals("1"))&&(bdto1.getTable_number()==16)){ %>
        <div style = 'position:absolute;left:700px;top:325px;z-index: 3;display:"";'>
          <font color="yellow"><h3>16.사용중</h3></font></div>
       <%}else if((bdto1.getTable_use().equals("0"))&&(bdto1.getTable_number()==16)){ %>
       <div style = 'position:absolute;left:700px;top:325px;z-index: 3;display:"";'>
       <font color="white"><h3>16.공석</h3></font></div>
       <%} %>

       
       
       
       <%} %>
       </div>
<img src="img/dddddd.jpg">
      </div>
      </div>
      </div>
      <div class="modal hide fade" id="ImgModal" style="width: 1000px">
      <div class="modal-header">
         <a href="#" class="close" data-dismiss="modal">&times;</a>
         <img src="img/00<%=num %>.jpg" />
      </div>
   </div>
</form>


</body>
</html>