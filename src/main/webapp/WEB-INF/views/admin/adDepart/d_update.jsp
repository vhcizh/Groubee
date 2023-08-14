<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/setting.jsp" %>   
 
<!DOCTYPE html>
<html dir="ltr" lang="en">
<head>
</head>
<body>
	 <tbody>
        <tr>
            <td >
           	<input type="text" name="id" value="${dto.id}" readonly> 
            </td>
            <td style="width:100px;">
            <input type="text" name="depart_name" value="${dto.depart_name}" > 
            </td>
            <td style="width:100px;">
             <input type="text" name="team_name" value="${dto.team_name}" > 
            </td>
            <td>
            	 <input type="text" name="name" value="${dto.name}" readonly> 
            </td>
            <td>
           	<input type="button" name="" id="" value="수정" onclick="" >
            </td>
             <td>
           	<input type="button" name="btnUpdate" id="btnUpdate" value="삭제" onclick="d_delete()">
            </td>
        </tr>
      </tbody>
</body>

</html>