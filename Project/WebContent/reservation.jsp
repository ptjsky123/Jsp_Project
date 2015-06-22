<%@ page contentType="text/html; charset=EUC-KR"%>
<% request.setCharacterEncoding("euc-kr"); %>
<% response.setCharacterEncoding("euc-kr"); %>
<!DOCTYPE html>

<html>
<head>
<title>예약확인</title>
<script>
$(document).ready(function() { 
	var f = document.reser_chk;
 	if(f.member_name.value == "null"){
		f.reser_name.value = "";
		f.reser_name.placeholder = "등록된 예약이 없습니다.";
		f.reser_businame.value = "";
		f.reser_content.value = "";
		f.reser_count.value = "";
		f.reser_date.value = "";

 	}  
});

</script>
</head>
<body >
<jsp:useBean id="dao" class="model.reservationDao"></jsp:useBean>
<jsp:useBean id="dto" class="model.reservationDto"></jsp:useBean>
<%  
dto = dao.reservationChk((String)session.getAttribute("member_id"));
%>



 
<div class="container" style="width: 250px; height: 100px;">
<div class="row" style="width: 250px; height: 100px;">
   
   <div class="span3" style="width: 250px; height: 50px;">      <!--  span12개 940 px -->
<!--    <h3 align="center">회원가입</h3> -->
      <div align="center" style="width: 250px; height: 50px;">
		<form name="reser_chk">
        <input type="text" placeholder="" name="reser_name" id="reser_name" value="<%= dto.getMember_name()%>" readonly="readonly"/><br/>
    	<input type="text" placeholder="" name="reser_businame" id="reser_businame" value="<%= dto.getBusiness_name()%>" readonly="readonly"/><br/>
    	<textarea style="width:210px; height: 60px" name="reser_content" id="reser_content" readonly="readonly"><%= dto.getReser_content() %></textarea><br/>
    	<input type="text" placeholder="" name="reser_count" id="reser_count" value="<%= dto.getReser_count()%>" readonly="readonly"/><br/>
    	<input type="text" placeholder="" name="reser_date" id="reser_date" value="<%= dto.getReser_date()%>" readonly="readonly"/><br/>
         <input type="hidden" name="member_name" value="<%= dto.getMember_name()%>" />
         <button class="btn" type="button" style="width:230px" onclick="goback()">
               <i class="icon-circle-arrow-left"></i>메인으로</button>
    </form>
      </div>
   </div>
   </div>
   </div>

</body>
</html>