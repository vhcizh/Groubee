<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/setting.jsp" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link rel="canonical" href="https://www.wrappixel.com/templates/severny-admin-template/" />
<link href="${path}/resources/dist/css/style.min.css" rel="stylesheet">

<script type="text/javascript">

function comment_delete(comment_num) {
	$.ajax({
		url: "${path}/commentDelete.bo?comment_num="+comment_num+"&${_csrf.parameterName}=${_csrf.token}",
		type:"post",
		success: function(result){
			comment_list();
		},
		error: function(){
			alert('comment_delete() 오류');
		}
	});
}

</script>

</head>
<body>

	<c:forEach var="dto" items="${comment}">
		<div class="card-body border-bottom">
			<div>
				<strong class="pb-3" style="float:left">${dto.name} / <small>${dto.writer}</small></strong>
				<ul style="list-style:none; float:right">
					<li><small style="padding-left:10px;">${dto.reg_date}</small>
					<c:if test="${sessionScope.memberID == dto.writer || sessionScope.authority == 'ROLE_BOARD' || sessionScope.authority == 'ROLE_ADMIN'}">
						<button type="submit" class="btn waves-effect waves-light btn-outline-secondary"
						 onclick="comment_delete(${dto.comment_num})"><i class="fas fa-times"></i></button>
					 </c:if>
					</li>
				</ul>
	  		</div>
			<div style="clear:both">
				<p>${dto.content}</p>
			</div>
		</div>
	</c:forEach>                        
                        
</body>
</html>