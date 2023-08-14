<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<script src="http://code.jquery.com/jquery-3.6.0.min.js"></script>

<script type="text/javascript">
$(function(){
	 // 개설하기
     $("#createBtn").click(function(){
    	 
         var name = $("input[name='chatroom_name']").val();
		 var input_length = name.length;
         if(name == "") {
            alert("채팅방 이름을 입력해주세요.");
         	return false;
         }
         else if(input_length>16) {
        	 alert("16자 이하로 입력해주세요.");
        	 return false;
         }
         else{
             document.createRoom.submit();
         }
     });

});

</script>

</head>
<body>

<c:forEach var="room" items="${list}">
	<a href="javascript:void(0)" onclick="window.open('${path}/chat/room?chatroom_num=${room.chatroom_num}','${room.chatroom_name}', 'top=100, left=300, width=900, height=800, status=no, menubar=no, toolbar=no, resizable=no');"
		class="chat-user message-item align-items-center border-bottom px-3 py-2">
		<div class="mail-contnet w-75 d-inline-block v-middle pl-2">
		    <h6 class="message-title  mb-0 mt-1">${room.chatroom_name}</h6> 
		        <span class="font-12 text-nowrap d-block text-muted">(${room.chatmem_total})</span> 
		</div>
	</a>
</c:forEach>
<form name="createRoom" action="${path}/chat/create" method="post">
		<!-- 시큐리티 적용 -->
		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
		    <input type="text" name="chatroom_name" class="form-control" style="margin-top:5%" placeholder="개설할 채팅방 이름을 입력하세요">
            <a href="javascript:void(0)" class="nav-link btn-primary rounded-pill d-flex align-items-center px-3" id="createBtn" style="margin:2%; color:white;">
            <i class="fas fa-user-plus"></i><span class="d-md-block font-14" style="padding-left:30%">개설하기</span></a>
                            
	</form>
</body>
</html>
