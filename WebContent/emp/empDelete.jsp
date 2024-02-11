<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- DB연결 -->
<%@ include file = "../include/dbCon.jsp" %>

<!-- Request 설정 -->
<%
	String empno = request.getParameter("empno");
%>

<!-- 사원번호의 유효성 체크 (Null,공백)  -->
<%
	if( empno == null || empno.equals("")) {
%>
	<script>
		<alert("다시 시도해 주세요.");
		location="empList.jsp"
	</script>
	
<%
	return;
}
%>

<!-- 삭제 SQL작성/적용/결과메세지 -->
<% 
	String sql = "DELETE FROM emp WHERE empno='"+empno+"' ";
	int result = stmt.executeUpdate(sql); // result = 1;
	if( result == 1) {
%>
	<script>
		alert("삭제완료");
		location="empList.jsp";
	</script>
<%		
	} else {
%>
	<script>
		alert("삭제실패! 관리자에게 연락해주세요.");
		location="empList.jsp";
	</script>
<%
	}
%>





