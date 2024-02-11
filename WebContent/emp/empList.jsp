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
	String sql = "SELECT empno, ename, job, hiredate, deptno FROM emp ORDER BY ename ASC ";
	ResultSet rs = stmt.executeQuery(sql);
%>

<!-- 출력 -->

<!-- 페이징처리 -->

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="../css/empMain.css">
</head>
<body>
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
				String deptno = rs.getString("deptno");	
		%>
			<tr align="center">
				<td><%=rownumber %></td>
				<td><%=ename %></td>
				<td><%=job %></td>
				<td><%=hiredate %></td>
				<td><%=deptno %></td>
			</tr>
		<%
				rownumber--;
			}
		%>
		
	</table>
	<div style="width:100%;">
		<div style="width:600px; text-align:left; ">
			전 직원 총 : <%=total %>명
		</div>
	</div>
</body>
</html>