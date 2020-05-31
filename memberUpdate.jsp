<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file = "../common/jEasyUICommon.jsp" %>
</head>
<body>
<!--====================== 사원등록 시작 =======================-->
	<div id="dlg_ins" data-options="closed:true, title:'사원정보 등록',footer:'#d_ins', modal:'true'" class="easyui-panel" style="width:100%;max-width:600px;padding:30px 60px">
		<form id="f_ins">
			<div style="margin-bottom:10px">
			<input class="easyui-textbox" id="mem_id" name="mem_id" label="아이디" data-options="prompt:'아이디 입력'" style="width:250px">
			</div>
			<div style="margin-bottom:10px">
			<input class="easyui-textbox" id="mem_pw" name="mem_pw" label="비밀번호" data-options="prompt:'비밀번호 입력'" style="width:250px">
			</div>
			<div style="margin-bottom:10px">
			<input class="easyui-textbox" id="mem_name" name="mem_name" label="회원명" data-options="prompt:'이름입력'" style="width:250px">
			</div>
		</form>
		<div id="d_ins" style="margin-bottom:10px">
			<a id="btn_save" href="javascript:emp_ins()" class="easyui-linkbutton" data-options="iconCls:'icon-save'">저장</a> 
			<a id="btn_close" href="javascript:$('#dlg_ins').dialog('close')" class="easyui-linkbutton" data-options="iconCls:'icon-cancel'">닫기</a> 
		</div>
	</div>
</body>
</html>