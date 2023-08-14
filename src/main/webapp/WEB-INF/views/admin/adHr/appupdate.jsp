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
	<c:if test="${a_selectCnt == 0}">
		<script type="text/javascript">
			alert("평가가 완료되었습니다");
			window.location="${path}/adHr2.ad";
		</script>
	</c:if>
	
	<!-- 업데이트 성공  -->
	<c:if test="${a_selectCnt != 0}">
		<script type="text/javascript">
			alert("평가가 완료되었습니다");
			window.location="${path}/adHr.ad";
		</script>
	</c:if>

</body>
</html>