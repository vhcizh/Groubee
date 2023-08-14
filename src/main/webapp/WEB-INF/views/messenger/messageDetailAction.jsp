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
    <meta name="description" content="">
    <meta name="author" content="">
   	<script>
   		$(function () {
   			reload();   			
   		});
   	
   		function reload() {
   			opener.location.reload();
   		}
   	</script>
</head>
<body>
	<div class="wrap"> 
	
		<!-- 컨텐츠 시작 -->
		<!-- insert 실패 -->
		<c:if test="${updateState == 0}">
			<script type="text/javascript">
				alert("안읽음 상태");
				window.location="${path}/msgIndex.me";
			</script>
		</c:if>
		
		<!-- insert 성공 -->
		<c:if test="${updateState == 1}">
			<script type="text/javascript">
				alert("읽음 상태");
				window.location="${path}/msgIndex.me";
				onclick="window.open('${path}/messageDetail.me?message_num=${dto.message_num}',
                    'Message Detail','left=500, top=100, width=600, height=600, location=no, status=no, scrollbars=yes');"
			</script>
		</c:if>
		<!-- 컨텐츠 종료 -->
		
	</div>
</body>
</html>