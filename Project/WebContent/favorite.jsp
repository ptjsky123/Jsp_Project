<%@page import="java.util.Vector"%>
 <%@page import="model.favoriteDto"%>
<%@ page contentType="text/html; charset=EUC-KR"%>
<%
	request.setCharacterEncoding("euc-kr");
%>
<%
	response.setCharacterEncoding("euc-kr");
%>
<!DOCTYPE html>

<html>
<head>
<title>����Ȯ��</title>
<script>
	$(document).ready(function() {
		var ff = document.favorite_chk;
		if (ff.favorite_name.value == "null") {
			ff.favorite_name.value = "";
			ff.favorite_name.placeholder = "��ϵ� ���ã�Ⱑ �����ϴ�.";

		}
	});

	function favorite(num){
	      document.favorite.num.value = num;
	      document.favorite.submit();
	      
	   }
	//üũ�ڽ��� ���� üũ �ϱ� ���� �޼��� 
	function check() {
		for (var i = 0; i < 5; i++) {
			var t = "c" + i;
			var temp = document.getElementById(t);
			if (document.getElementById("allcheck").checked) {
				temp.checked = true;
			} else {
				temp.checked = false;
			}
		}
	}
	// üũ�� ��ȣ�� ��Ƽ� �����ϱ� ���� �޼���,    // submit���� hidden�� �־��� �� ��ȣ���� "Delete_list_proc.jsp"�� ���� 
	function deletePost() {
		for (var i = 0; i < 5; i++) {
			var t = "c" + i;
			var temp = document.getElementById(t);
			if (temp.checked) {  
				fnDeleteInput(temp.value);
			}
		}
	}
	// ������ �� ��ȣ�� ��Ƽ� "Delete_list_proc.jsp"�� ������ ���� hidden ���  
	function fnDeleteInput(num) {
		var target = document.getElementById("deleteInputDiv");  
		var str = "<input type='hidden' name='del' value='"+num+"'/>";
		target.innerHTML += str; 
		document.deleteForm.submit();
	}
</script>
</head>
<body>
	<jsp:useBean id="fdao" class="model.favoriteDao"/>
	<%
		int cnt = 0;
		Vector list = fdao.favoriteChk((String) session.getAttribute("member_id"));
	%>


	<div class="container" style="width: 250px; height: 100px;">
		<div class="row" style="width: 250px; height: 100px;">
			<div class="span3" style="width: 250px; height: 50px;">
				<div align="center" style="width: 250px; height: 50px;">
					<form name="favorite_chk">


						<div
							style="overflow: scroll; white-space: nowrap; width: 270px; height: 270px; padding: 10px; background-color: white;">
							<table>
								<tr>
									<td><input type="checkbox" name="allcheck" id="allcheck"
										onclick="check()" /></td>
									<td>��ũ</td>

								</tr>

								<%	int j = 0;
									for (int i = 0; i < list.size(); i++) {
										cnt++;
										if (i == list.size())
											break;
										favoriteDto fdto = (favoriteDto) list.get(i);%>
										<tr>
											<td><input type="checkbox" name="c<%=j%>" id="c<%=j%>"
												value="<%=fdto.getFavorite_no()%>" /></td>
											<td><a href="javascript:favorite('<%=fdto.getBusiness_no()%>')" style="color: black;"><%=fdto.getBusiness_name()%></a></td>
										</tr>
								<%	j++;
								}
								%>
							</table>
						</div>

						<button class="btn" type="button" style="width: 230px"
							onclick="goback()">
							<i class="icon-circle-arrow-left"></i>��������
						</button>
						<button class="btn" type="button" style="width: 230px"
							onclick="javascript:deletePost()">
							<i class="icon-circle-arrow-left"></i>�����ϱ�
						</button>
					
					</form>

				<form method="post" action="favorite_delete.jsp" name="deleteForm">
						<div id="deleteInputDiv"></div>
					</form>
<form method="post" name="favorite" action="Read.jsp">
   <input type="hidden" name="num" />


</form>
				</div>
			</div>
		</div>
	</div>

</body>
</html>