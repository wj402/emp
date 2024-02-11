<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../include/dbCon.jsp" %>
  
<%
	String empno = request.getParameter("empno");
	
	if( empno == null || empno.equals("") ) {
%>
	<script>
		alert("다시 시도해 주세요.");
		location = "empList.jsp";
	</script>
<%	
	return; // JSP 종료
	}

	String sql = "SELECT ename, sal, hiredate, deptno, job FROM emp";
		  sql += " WHERE empno=' "+empno+"' ";
	ResultSet rs = stmt.executeQuery(sql);
	
	String ename = "";
	int sal = 0;
	String hiredate = "";
	int deptno = 0;
	String job = "";
	
	if( rs.next() ) { // 존재의 유무
		ename = rs.getString("ename");
		sal = rs.getInt("sal");
		hiredate =  rs.getString("hiredate");
		deptno = rs.getInt("deptno");
		job =  rs.getString("job");
	}
	
	// 부서목록
	String sql2 = "SELECT deptno,dname FROM dept ORDER BY dname ASC";
	ResultSet rs2 = stmt.executeQuery(sql2);
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사원입력화면</title>
<link rel="stylesheet" type="text/css" href="../css/empMain.css">

<link rel="stylesheet" href="//code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
<link rel="stylesheet" href="/resources/demos/style.css">
  <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
  <script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
  <script>
  $( function() {
    $( "#hiredate" ).datepicker({
    	changeMonth: true,
    	changeYear: true
    });
  } );
  </script>
</head>

<style>

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

	<form name="frm" method="post" action="empModifySave.jsp">
		<table align="center">
			<caption style="font-size:15px;">사원정보수정</caption>
			<tr>
				<th width="20%">사원번호</th>
				<td width="80%"><input type="text" name="empno" value="<%=empno %>" readonly></td>
			</tr>
			<tr>
				<th>사원이름</th>
				<td><input type="text" name="ename" value="<%=ename %>"></td>
			</tr>
			<tr>
				<th>업무</th>
				<td><input type="text" name="job" value="<%=job %>"></td>
			</tr>
			<tr>
				<th>급여</th>
				<td><input type="text" name="sal" value="<%=sal %>"></td>
			</tr>
			<tr>
				<th>입사일</th>
				<td><input type="text" name="hiredate" id="hiredate" value="<%=hiredate %>"></td>
			</tr>
			<tr>
				<th>부서</th>
				<td>
					<select name="deptno">
					<%
						while( rs2.next() ) {
							int no = rs2.getInt("deptno");
							String dname = rs2.getString("dname");
							String chk = "";
							if( no == deptno ) {
								chk = "selected";
							}
					%>
						<option value="<%=no %>" <%=chk %>><%=dname %></option>
					<%
						}
					%>
					</select>
				</td>
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