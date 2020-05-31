<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file = "../common/jEasyUICommon.jsp" %>

<script>
		function save(){
            $('#f_insert').form('submit');
			$(opener.location).attr("href", "javascript:fun()");
			self.close();
		}
        function submitForm(){
            $('#f_insert').form('submit');
        }
        function clearForm(){
            $('#f_insert').form('clear');
        }
        function exitForm(){
			self.close();
        }
    </script>
</head>
<body>
 <div class="easyui-panel" style="width:100%;max-width:400px;padding:30px 60px;">
        <form id="f_insert" method="post">
            <div style="margin-bottom:20px">
                <input class="easyui-textbox" name="mem_id" style="width:100%" data-options="label:'아이디:',required:true">
            </div>
            <div style="margin-bottom:20px">
                <input class="easyui-passwordbox" name="mem_pw" style="width:100%" data-options="label:'비밀번호:',required:true">
            </div>
            <div style="margin-bottom:20px">
                <input class="easyui-textbox" name="mem_name" style="width:100%" data-options="label:'이름:',required:true">
            </div>
        </form>
         <div style="text-align:center;padding:5px 0">
            <a href="javascript:void(0)" class="easyui-linkbutton" onclick="save()" style="width:80px">등록</a>
            <a href="javascript:void(0)" class="easyui-linkbutton" onclick="clearForm()" style="width:80px">지우기</a>
            <a href="javascript:void(0)" class="easyui-linkbutton" onclick="exitForm()" style="width:80px">취소</a>
        </div>
        
<script type="text/javascript">
	$(document).ready(function(){
		$('#f_insert').form({
		    url:"memberInsert.mvc3?crud=memberInsert"
		});
	})
</script>
</body>
</html>