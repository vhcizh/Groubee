<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="/WEB-INF/views/setting.jsp" %>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- 업데이트 실패  -->
	<c:if test="${d_deleteCnt == 0}">
		<script type="text/javascript">
			alert(" 실패");
		</script>
	</c:if>
	
	<!-- 업데이트 성공  -->
	<c:if test="${d_deleteCnt ==1}">
		<script type="text/javascript">
			confirm("삭제하시겠습니까?")
			window.location="${path}/adDepart.ad";
		</script>
	</c:if>

</body>
</html>