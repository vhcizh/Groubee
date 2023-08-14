<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/setting.jsp" %> 
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <link rel="icon" type="image/png" sizes="16x16" href="${path}/resources/assets/images/favicon.png">
    <title>Severny admin Template - The Ultimate Multipurpose admin template</title>	
	<link rel="canonical" href="https://www.wrappixel.com/templates/severny-admin-template/" />
	
	<link href="${path}/resources/dist/css/style.min.css" rel="stylesheet">

<script type="text/javascript">
var timestamp = '';
var roomName = '${room.chatroom_name}';
var roomId = '${room.chatroom_num}';
var userId = '${sessionScope.memberID}';
var name = null;

$(function(){
	
	$("#chatBox").animate({
	      scrollTop: $("#chatBox").get(0).scrollHeight
	    }, 100);
	
    stomp.connect({}, function (){
		
       // 소켓 연결시 "/sub/chat/room/" + roomId 구독, callback 함수 실행
       stomp.subscribe("/sub/chat/room/" + roomId, function (chat) {
           var content = JSON.parse(chat.body);

           var writer = content.writer;
           var message = content.message;
           var name = content.name;
           var invite = content.invite;
           
           var str = '';

           if(invite != null) {
        	   str = "<li class='middle'>";
               str += "<div class='chat-content'>";
               str += "<div class='box bg-light-success'>"+ message + "</div>";
               str += "</div>";
               str += "</li>";
               $("#msgArea").append(str);
               $("#chatBox").animate({
         	      scrollTop: $("#chatBox").get(0).scrollHeight
         	    }, 100);
               
           } 
           else if(writer === userId){ // 채팅한 사람과 로그인 세션 아이디가 같을 경우
        	   timestamp = new Date().getHours() + ":" + new Date().getMinutes();
               str = "<li class='odd chat-item'>";
               str += "<div class='chat-content'>";
               str += "<div class='box bg-light-success'>"+ message + "</div>";
               str += "<br></div>";
               str += "<div class='chat-time'>" + timestamp + "</div>";
               str += "</li>";
               $("#msgArea").append(str);
               $("#chatBox").animate({
          	      scrollTop: $("#chatBox").get(0).scrollHeight
          	    }, 100);
           }
           else{ // 채팅한 사람과 로그인 세션 아이디가 다를 경우
        	   timestamp = new Date().getHours() + ":" + new Date().getMinutes();
        	   str = "<li class='chat-item'>";
               str += "<div class='chat-content'>";
               str += "<h6 class='font-medium'>" + writer +"("+name+")" + "</h6>";
               str += "<div class='box bg-light-info'>"+ message + "</div>";
               str += "</div>";
               str += "<div class='chat-time'>" + timestamp + "</div>";
               str += "</li>";
               $("#msgArea").append(str);
               $("#chatBox").animate({
          	      scrollTop: $("#chatBox").get(0).scrollHeight
          	    }, 100);
           }
           
       });
       
    });
    
    // 엔터치면 메세지 전송
    $("#msg").keypress(function(e){
    	if(e.keyCode == 13) {
    		
            var msg = document.getElementById("msg");
            console.log(userId + ":" + msg.value);
            
	    	if (msg.value != '') {
	            stomp.send('/pub/chat/message', {}, JSON.stringify({"roomId": roomId, "message": msg.value, "writer": userId}));
		    	msg.value = '';
	            
	    	} else {
	    		alert('메세지를 입력하세요.');
	    	}
    	}
    });
    
    // 초대하기
    $("#inviteBtn").click(function(){
    	var id_arr = [];
    	// var name_arr = [];
		$(".chkList:checked").each(function(){
			id_arr.push($(this).val());
			// name_arr.push($(this).data("name"));
		});
		// name_str = JSON.stringify(name_arr);
		id_str = JSON.stringify(id_arr);
		
    	document.inviteForm.submit();
    	stomp.send('/pub/chat/invite', {}, JSON.stringify({"roomId": roomId, "writer": userId, "invite": id_str}));
    });
    
    // 나가기
    $("#exitBtn").click(function(){
    	if(confirm("나의 채팅방 목록에서 완전히 사라집니다. 정말로 나가시겠습니까?")) {
    		location.href = "${path}/chat/exit?chatroom_num=" + roomId + "&id=" + userId;
    		stomp.send('/pub/chat/close', {}, JSON.stringify({"roomId": roomId, "message": msg.value, "writer": userId}));
    		self.close();
    		opener.document.location.reload();
    	}
    });
    
});
</script>
</head>
<body>
               <div class="p-4 chat-box-inner-part">
               
                <div class="card chatting-box mb-0" style="display: block;">
                       <div class="card-body">
                       	<!-- 현재 채팅방 이름 -->
                           <div class="chat-meta-user pb-3 border-bottom">
                               <div class="current-chat-user-name">
                                   <span class="font-12 text-nowrap d-block text-muted text-truncate">
                                       <img src="${path}/resources/assets/images/users/1.jpg" alt="dynamic-image" class="rounded-circle" width="45">
                                       <span class="name font-weight-bold ml-2" style="padding-right:10px">${room.chatroom_name}</span>
                                       <c:forEach var="dto" items="${chatMemberList}">
                                       <span style="padding-left:10px">${dto.name}${dto.rank}</span>
                                       </c:forEach>
                                   </span>
                               </div>
                           </div>
                           
                           
                           <!-- 채팅내용 -->
                           <div class="chat-box scrollable" style="height:calc(100vh - 360px);" id="chatBox">
                            <ul class="chat-list active-chat" id="msgArea">
								<!-- 채팅방 대화창   --> 
								<c:forEach var="dto" items="${msgList}">
									<c:if test="${sessionScope.memberID == dto.writer}">
							               <li class='odd chat-item'>
								               <div class='chat-content'>
									               <div class='box bg-light-success'>${dto.message}</div>
									               <br>
									           </div>
								               <div class='chat-time'>${dto.regdate}</div>
							               </li>
							         </c:if>
							         <c:if test="${dto.invite != null}">
							         		<li class='middle'>
								               <div class='chat-content'>
									               <div class='box bg-light-success'>${dto.message}</div>
									               <br>
									           </div>
								               <div class='chat-time'>${dto.regdate}</div>
							               </li>
			   	   								 </c:if>
						        	 <c:if test="${sessionScope.memberID != dto.writer}">
						        	   <li class='chat-item'>
							               <div class='chat-content'>
							               <h6 class='font-medium'>${dto.writer}(${dto.name})</h6>
							               <div class='box bg-light-info'>${dto.message}</div>
							               </div>
							               <div class='chat-time'>${dto.regdate}</div>
						               </li>
						             </c:if>
								
								</c:forEach>
							</ul>
                           </div>
                       </div>
                       
                       <div class="card-body border-top border-bottom chat-send-message-footer">
                           <div class="row">
                               <div class="col-12">
                                   <div class="input-field mt-0 mb-0">
                                   	<input type="text" id="msg" class="form-control border-0" placeholder="Type and hit enter">
                                   </div>
                               </div>
                           </div>
                       </div>
                   </div>
                   
                   <div style="align:right;">
                       <a href="javascript:void(0)" class="nav-link btn-primary rounded-pill d-flex align-items-center px-3" id="exitBtn" style="width:150px;">
                   		<i class="fas fa-user-plus"></i><span class="d-none d-md-block font-14" style="padding-left:30%">나가기</span></a>
               	</div>
               </div>
   <!-- ============================================================== -->
   <!-- 멤버 초대 토글 -->
   <!-- ============================================================== -->
    <aside class="customizer">
    
    <div class="left-part bg-white user-chat-box show-panel">
        <a href="javascript:void(0)" class="service-panel-toggle"><i class="fa fa-spin fa-cog"></i></a>
		        <div class="scrollable position-relative" style="height:100%;">
                        <div class="px-3 py-2 border-bottom pb-3">
                            
                            <a href="javascript:void(0)" class="nav-link btn-primary rounded-pill d-flex align-items-center px-3" id="inviteBtn" style="margin:10%">
                        		<i class="fas fa-user-plus"></i><span class="d-none d-md-block font-14" style="padding-left:30%">초대하기</span></a>
                            
                            <div class="searchbar">
                                <input class="form-control" type="text" placeholder="이름 또는 부서명을 검색하세요">
                            </div>
                        </div>
                        <ul class="mailbox list-style-none app-chat">
                            <li>
                                <div class="message-center chat-scroll chat-users notifications position-relative">
                                
                                <form name="inviteForm" id="inviteForm" method="post" action="${path}/chat/invite">
                                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
                                <input type="hidden" name="chatroom_num" value="${room.chatroom_num}">
	                                <c:forEach var="dto" items="${workerList}"> 
	                                    <a href="javascript:void(0)" onclick="checked(${dto.id});"
	                                    class="chat-user message-item align-items-center border-bottom px-3 py-2">
	                                    <input type="checkbox" name="chkList" class="chkList chk" id="checkbox${dto.id}" value="${dto.id}" data-name="${dto.name}">
	                                        <div class="mail-contnet w-75 d-inline-block v-middle pl-2">
	                                            <h6 class="message-title  mb-0 mt-1" data-username="Pavan kumar">${dto.name}</h6>
	                                            <span class="font-12 text-nowrap d-block text-muted text-truncate">${dto.depart_name}</span>  
	                                            <span class="font-12 text-nowrap d-block text-muted">${dto.rank}</span>
	                                        </div>
	                                    </a>
	                                 </c:forEach>
	                            </form>
	                            
                                </div>
                            </li>
                        </ul>
                    </div>
                </div>
	</aside>
    <!-- ============================================================== -->
    <!-- All Jquery -->
    <!-- ============================================================== -->
    <!-- apps -->
    <script src="${path}/resources/dist/js/app.min.js"></script>
    <script src="${path}/resources/dist/js/app.init-menusidebar.js"></script>
    <script src="${path}/resources/dist/js/app-style-switcher.js"></script>
    <script src="${path}/resources/dist/js/feather.min.js"></script>
    <!--Custom JavaScript -->
    <script src="${path}/resources/dist/js/custom.min.js"></script>
    <script src="${path}/resources/dist/js/pages/chat/chat.js"></script>
    <!--This page JavaScript -->
    <script src="${path}/assets/libs/bootstrap-duallistbox/dist/jquery.bootstrap-duallistbox.min.js"></script>
    <script src="${path}/dist/js/pages/forms/dual-listbox/dual-listbox.js"></script>

    
    
</body>

</html>