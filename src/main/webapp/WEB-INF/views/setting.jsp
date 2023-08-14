<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!-- jstl -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<c:set var="path" value="${pageContext.request.contextPath}"/>
<link rel="icon" type="image/png" sizes="20x20" href="${path}/resources/images/groubee_pavicon_black.png">
<title>그루비 그룹웨어</title>

<script src="http://code.jquery.com/jquery-3.6.0.min.js"></script>
<!-- CSS only -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<!-- JavaScript Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>

<!-- 웹소켓 -->
<script src="https://cdn.jsdelivr.net/npm/sockjs-client@1/dist/sockjs.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/stomp.js/2.3.3/stomp.min.js"></script>

<script>
var sessionID = ${sessionScope.memberID};
var stomp = null;
$(function() {
	// 웹소켓 연결
	var sockJs = new SockJS("${path}/stomp");
	stomp = Stomp.over(sockJs);
	
	stomp.connect({}, function (){
		
		// 해당 주소로 오는 메세지 받음
		stomp.subscribe("/sub/alarm/"+sessionID , function(message) {
			var content = JSON.parse(message.body);
			
			var roomId = content.roomId;
			var name = content.name;
	        var message = content.message;
	        
	        console.log("roomId : " + roomId + ", name : " + name + ", message : " + message);
	        var str = "<a href=\"${path}/chat/room?chatroom_num=" + roomId 
	        		+ "\" onclick=\"window.open(this.href,'_blank', 'width=20%'); return false;\" class='alert-link'>"
	        		+ name + " : " + message + "</a>";
	        $("#pushAlarm").html(str);
	        $("#pushAlarm").css('display', 'block');
	        
	        setTimeout(function() {
	        	$("#pushAlarm").css('display', 'none');
	        }, 3000);
			
		});
		
	});
});

</script>    