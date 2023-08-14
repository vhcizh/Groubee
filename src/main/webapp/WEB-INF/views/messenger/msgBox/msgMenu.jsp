<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="container-fluid note-has-grid">
		<ul class="nav nav-pills p-3 bg-white mb-3 rounded-pill align-items-center">
			<li class="nav-item" id="getMsg"> 
				<a href="${path}/msgIndex.me" class="nav-link rounded-pill note-link d-flex align-items-center px-2 px-md-3 mr-0 mr-md-2">
					<i class="icon-folder-alt mr-1"></i><span class="d-none d-md-block">받은쪽지함</span>
			  	</a> 
			</li>
			<li class="nav-item" id="sendMsg"> 
				<a href="${path}/msgSendbox.me" class="nav-link rounded-pill note-link d-flex align-items-center px-2 px-md-3 mr-0 mr-md-2">
			 		<i class="icon-folder mr-1"></i><span class="d-none d-md-block">보낸쪽지함</span>
			  	</a> 
			</li>
			<li class="nav-item" id="tempoMsg"> 
				<a href="${path}/msgTempbox.me" class="nav-link rounded-pill note-link d-flex align-items-center px-2 px-md-3 mr-0 mr-md-2">
			  		<i class="icon-drawar mr-1"></i><span class="d-none d-md-block">임시보관함</span>
			  	</a> 
			</li>
			<li class="nav-item" id="trashMsg"> 
				<a href="${path}/msgTrash.me" class="nav-link rounded-pill note-link d-flex align-items-center px-2 px-md-3 mr-0 mr-md-2">
			  		<i class="icon-trash mr-1"></i><span class="d-none d-md-block">휴지통</span>
			  	</a>
			</li>
			<li class="nav-item ml-auto"> 
				<a href="javascript:void(0)" class="btn-primary rounded-pill d-flex align-items-center px-3" id="writeMsg" style="height:37px;"
				onclick = "window.open('${path}/msgWrite.me','New Message','left=500, top=100, width=850, height=810, location=no, status=no, scrollbars=yes');">
			  		<i class="icon-note m-1"></i><span class="d-none d-md-block font-14">쪽지쓰기</span>
			  	</a> 
			</li>
		</ul>
	</div>
</body>
</html>