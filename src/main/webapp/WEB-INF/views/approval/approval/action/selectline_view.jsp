<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/setting.jsp"%>
<!DOCTYPE html>
<html dir="ltr" lang="en">

<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<!-- Tell the browser to be responsive to screen width -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">
<!-- Favicon icon -->
<link rel="icon" type="image/png" sizes="16x16"
	href="${path}/resources/assets/images/favicon.png">
<title>Severny admin Template - The Ultimate Multipurpose admin
	template</title>
<link rel="canonical"
	href="https://www.wrappixel.com/templates/severny-admin-template/" />
<!-- Custom CSS -->
<link rel="stylesheet" type="text/css"
	href="${path}/resources/assets/libs/quill/dist/quill.snow.css">
<!-- Custom CSS -->
<link href="${path}/resources/dist/css/style.min.css" rel="stylesheet">
<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
	<script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
	<script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
<![endif]-->
	
</head>
<body>
<script type="text/javascript">
$(function(){
	$(".co_approve").change(function(){
		var co_approve = $(this).val();
		var getter_id = $(this).data("num");
		var load_id = $(this).data("num2")
		location.href = "${path}/changeco_approve.ap?co_approve="+ co_approve + "&getter_id="+ getter_id + "&load_id="+ load_id + "&${_csrf.parameterName}=${_csrf.token}";
		alert("결재정보가 변경되었습니다");
	});
	
	$(".delete_one").click(function(){
		var getter_id = $(this).data("num");
		var load_id = $(this).data("num2")
		location.href = "${path}/deleteco_approve.ap?getter_id="+ getter_id + "&load_id="+ load_id + "&${_csrf.parameterName}=${_csrf.token}";
		alert("결재정보가 삭제되었습니다");
	});
});
</script>

  	<hr>
  	<form name = "loadlineForm" method = "post">
	<table  style="width:100%; text-align:center;">
		<tr>
			<th weight = "10%">
			결재순번
			</th>
			<th weight = "20%">
			부서
			</th>
			<th weight = "20%">
			이름
			</th>
			<th weight = "20%">
			직위
			</th>
			<th weight = "10%">
			결재/협조
			</th>
			<th weight = "10%">
			삭제
			</th>
		</tr>
		
	<c:set var="cnt" value="1"/>
	<c:forEach var="dto" items="${list}" varStatus = "status">
	 	<c:set var="sum" value="${sum+1}"/>
		<tr>
			<td>
				<%-- ${sum} --%>
				<!-- 역순 -->
				<%-- ${fn:length(list) - status.index} --%>
				${status.count}
			</td>
			<td>
				${dto.depart_name} 
			</td>
			<td>
				${dto.name}
			</td>
			<td>
				${dto.rank} 
			</td>
			<td>
			   <select class="co_approve" name = "co_approve" data-num="${dto.getter_id}" data-num2="${dto.load_id}">
                     <option <c:if test="${dto.co_approve == '결재'}">selected</c:if> value="결재">결재</option>
                     <option <c:if test="${dto.co_approve == '협조'}">selected</c:if> value="협조">협조</option>
               </select>
			</td>
			<td>
				<button type="button" name="delete_one" class="delete_one" value="삭제" data-num="${dto.getter_id}" data-num2="${dto.load_id}">
					<span class="mr-1"><i class="far fa-trash-alt remove-note"></i></span>
				</button>
			</td>
		</tr>
	  </c:forEach>
	  <tr>
	  <td colspan = "6">
	  <hr>
	  </td>
	  </tr>
	  <c:forEach var="dto2" items="${list2}" varStatus = "status" begin = "0" end = "0">
		<tr>
			<td weight = "10%">
			기안자 :
			</td>
			<td weight = "20%">
			${dto2.depart_name}
			</td>
			<td weight = "20%">
			${dto2.name}
			</td>
			<td weight = "20%">
			${dto2.rank}
			</td>
			<td weight = "10%">
			기안
			</td>
			<td weight = "10%">
			-
			</td>
		</tr>
	   </c:forEach>
	</table>
	</form>
	<hr>

</body>
</html>