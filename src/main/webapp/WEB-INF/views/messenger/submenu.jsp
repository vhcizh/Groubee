<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<ul class="nav nav-pills p-3 bg-white mb-3 rounded-pill align-items-center">
		<li class="nav-item">
			<a href="${path}/msgInbox.me" class="nav-link rounded-pill note-link d-flex align-items-center active px-2 px-md-3 mr-0 mr-md-2" id="all-category">
				<i class="icon-layers mr-1"></i><span class="d-none d-md-block">받은쪽지함</span>
			</a> 
		</li>
		<li class="nav-item">
			<a href="${path}/msgSendbox.me" class="nav-link rounded-pill note-link d-flex align-items-center px-2 px-md-3 mr-0 mr-md-2" id="note-business">
				<i class="icon-layers mr-1"></i><span class="d-none d-md-block">보낸쪽지함</span>
			</a> 
		</li>
		<li class="nav-item">
			<a href="${path}/msgTrash.me" class="nav-link rounded-pill note-link d-flex align-items-center px-2 px-md-3 mr-0 mr-md-2" id="note-social">
		  		<span class="d-none d-md-block">휴지통</span>
		  	</a> 
		</li>
		<li class="nav-item">
			<a href="${path}/msgTempbox.me" class="nav-link rounded-pill note-link d-flex align-items-center px-2 px-md-3 mr-0 mr-md-2" id="note-important">
		  		<span class="d-none d-md-block">임시보관함</span>
		  	</a> 
		</li>
		<li class="nav-item ml-auto">
			<a href="javascript:void(0)" class="nav-link btn-primary rounded-pill d-flex align-items-center px-3" id="add-notes">
        		<i class="icon-note m-1"></i><span class="d-none d-md-block font-14">쪽지쓰기</span>
        	</a> 
        </li>
	</ul>
</body>
</html>