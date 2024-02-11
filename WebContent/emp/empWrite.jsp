<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>

<style>
	body {
		font-size: 12px;
		color: #555;
		font-family: 맑은 고딕;
	}
	
	button {
		font-size: 12px;
		color: #555;
		font-family: 맑은 고딕;
	}
	
	a {
		text-decoration: none;
	}
	
	table {
		width: 500px;
		border-collapse: collapse;
	}
	
	th,td {
		border:1px solid #ccc;
		/* text-align:center; */
		padding: 5px;
	}
</style>

<script>
	function fn_submit() {
		if(document.frm.empno.value == "") {
			alert("사원번호를 입력해주세요.");
			document.frm.empno.focus();
			return false;
		}
		
		if(document.frm.ename.value == "") {
			alert("사원이름를 입력해주세요.");
			document.frm.ename.focus();
			return false;
		}
		
		if(document.frm.job.value == "") {
			alert("업무를 입력해주세요.");
			document.frm.job.focus();
			return false;
		}
		
		if(document.frm.sal.value == "") {
			alert("급여를 입력해주세요.");
			document.frm.sal.focus();
			return false;
		}
		
		if(document.frm.hiredate.value == "") {
			alert("입사일을 입력해주세요.");
			document.frm.hiredate.focus();
			return false;
		}
		
		if(document.frm.depno.value == "") {
			alert("부서번호를 입력해주세요.");
			document.frm.depno.focus();
			return false;
		}
		document.frm.submit();
	}
</script>

<body>

	<form name="frm" method="post" action="empWriteSave.jsp">
		<table align="center">
			<caption style="font-size:15px;">사원정보등록</caption>
			<tr>
				<th width="20%">사원번호</th>
				<td width="80%"><input type="text" name="empno"></td>
			</tr>
			<tr>
				<th>사원이름</th>
				<td><input type="text" name="ename"></td>
			</tr>
			<tr>
				<th>업무</th>
				<td><input type="text" name="job"></td>
			</tr>
			<tr>
				<th>급여</th>
				<td><input type="text" name="sal"></td>
			</tr>
			<tr>
				<th>입사일</th>
				<td><input type="text" name="hiredate"></td>
			</tr>
			<tr>
				<th>부서번호</th>
				<td><input type="text" name="deptno"></td>
			</tr>
		</table>
		<div style="width:100%; text-align:center; margin-top:10px">
			<button type="submit" onclick="fn_submit();return false">저장</button>
			<button type="reset">취소</button>
			<button type="button" onclick="location='empList.jsp';">목록</button>
		</div>
	</form>
</body>
</html>