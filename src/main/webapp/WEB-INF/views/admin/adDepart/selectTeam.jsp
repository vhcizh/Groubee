<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
                                         <select class="form-control custom-select" id="team_name" name="team_name" required>
											<option value="">팀 선택</option>
											<c:forEach var="dto" items="${list}">
											<option value="${dto.team_name}">${dto.team_name}</option>
											</c:forEach>												
										  </select>		
</body>
</html>