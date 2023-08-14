<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/setting.jsp" %>   
<!DOCTYPE html>
<html dir="ltr" lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <!-- Tell the browser to be responsive to screen width -->
    <meta name="viewport" content="width=device-width, initial-scale=1">
<title>메세지 읽음상태 변경</title>
</head>
<body>
	
	<!-- 컨텐츠 시작 -->
	<!-- insert 실패 -->
	<c:if test="${updateState == 0}">
		<script type="text/javascript">
			history.back();
			//window.location="${path}/msgIndex.me";
		</script>
	</c:if>
	
	<!-- insert 성공 -->
	<c:if test="${updateState == 1}">
		<script type="text/javascript">
			history.back();
			//window.location="${path}/msgIndex.me";
		</script>
	</c:if>
	
	<c:if test="${deleteState == 0}">
		<script type="text/javascript">
			history.back();
			//window.location="${path}/msgIndex.me";
		</script>
	</c:if>
	
	<!-- insert 성공 -->
	<c:if test="${deleteState == 1}">
		<script type="text/javascript">
			history.back();
			//window.location="${path}/msgIndex.me";
		</script>
	</c:if>
	
	
	<!-- 컨텐츠 종료 -->
	
</body>
</html>