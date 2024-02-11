<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- DB연결 -->    
<%@ include file="../include/dbCon.jsp" %>

<!-- SQL작성/적용 -->
<%
	String sqlTot = "SELECT count(*) cnt FROM emp ";
	ResultSet rsTot = stmt.executeQuery(sqlTot);
	int total = 0;
	if( rsTot.next() ) {
		total = rsTot.getInt("cnt");
	}
	
	int rownumber = total;
%>

<!-- 사원이릅, 업무, 입사일, 부서명 -->
<%
	String sql = "SELECT empno,"; 
		  sql += "       ename,";
		  sql += "         job,"; 
		  sql += "    hiredate,";
		  sql += "    (select dname from dept where deptno=emp.deptno) dname";
		  sql += " FROM emp ORDER BY ename ASC ";
	ResultSet rs = stmt.executeQuery(sql);
%>

<!-- 출력 -->

<!-- 페이징처리 -->

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사원 목록화면</title>
<link rel="stylesheet" type="text/css" href="../css/empMain.css">
</head>
<body>
	<table align="center" style="border:0px;">
		<tr>
			<td align="right" style="border:0px;">
				<button type="button" onclick="location='empWrite.jsp'">사원등록</button>
			</td>
		</tr>
	</table>
	<table align="center">
		<caption>사원목록</caption>
		<colgroup>
			<col width="10%" />
			<col width="20%" />
			<col width="20%" />
			<col width="25%" />
			<col width="25%" />
		</colgroup>
		<tr>
			<th>번호</th>
			<th>사원명</th>
			<th>업무</th>
			<th>입사일</th>
			<th>부서</th>
		</tr>
		<%
			while( rs.next() ) {
				String empno = rs.getString("empno");
				String ename = rs.getString("ename");
				String job = rs.getString("job");
				String hiredate = rs.getString("hiredate");
				String dname = rs.getString("dname");	
		%>
			<tr align="center">
				<td><%=rownumber %></td>
				<!-- ? 파라미터값 -->
				<td><a href="empModify.jsp?empno=<%=empno %>"><%=ename %></a></td>
				<td><%=job %></td>
				<td><%=hiredate %></td>
				<td><%=dname %></td>
			</tr>
		<%
				rownumber--;
			}
		%>
		
	</table>
	<div style="width:100%;">
		<div style="width:500px; text-align:left; margin: 0 auto; margin-top:15px;">
			전 직원 총 : <%=total %>명
		</div>
	</div>
</body>
</html>