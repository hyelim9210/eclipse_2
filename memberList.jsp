<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>memberList</title>
<%@ include file = "../common/jEasyUICommon.jsp" %>

</head>
<body>
	회원 목록 보기
	<table id="dg_member" class = "easyui-datagrid">
		<thead>
			<tr>
				<th data-options="field:'mem_id'">아이디</th>
				<th data-options="field:'mem_name'">이름</th>
			</tr>
		</thead>
		<tbody>
    <%
    	List<Map<String, Object>> memList = (List<Map<String, Object>>)request.getAttribute("memList");
    %>
		<%
			if(memList!=null&&memList.size()>0){//검색 결과가 있을 때
				for(Map<String, Object> member : memList){
		%>
			<tr>
				<td data-options="width:100">&nbsp;<%=member.get("MEM_ID")%>&nbsp;</td>
				<td data-options="width:100">&nbsp;<%=member.get("MEM_NAME")%>&nbsp;</td>
			</tr>
		<%
				}
			}			
			else {//검색 결과가 없을 때
		%>
			<tr>
				<td data-options="field:'mem_list'width:500, colspan:3">목록이 없습니다.</td>
				<td></td>
				<td></td>
			</tr>
		<%
			}
		%>				
		</tbody>	
	</table>
<!-- 	<script type="text/javascript">
		$(document).ready(function(){
			$('#dg_member').datagrid('mergeCells', {
				index: 1,
				field: 'mem_list',
				colspan: 3,
				type: 'footer'
			});
		});
	</script> -->
</body>
</html>