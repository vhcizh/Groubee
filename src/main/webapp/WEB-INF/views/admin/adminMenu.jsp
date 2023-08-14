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
    <!-- Favicon icon -->
    <link rel="icon" type="image/png" sizes="16x16" href="${path}/resources/assets/images/favicon.png">
    <title>Severny admin Template - The Ultimate Multipurpose admin template</title>	
	<link rel="canonical" href="https://www.wrappixel.com/templates/severny-admin-template/" />
    <!-- Custom CSS -->
    <link href="${path}/resources/assets/libs/chartist/dist/chartist.min.css" rel="stylesheet">
    <link href="${path}/resources/assets/extra-libs/c3/c3.min.css" rel="stylesheet">
    <!-- Custom CSS -->
    <link href="${path}/resources/dist/css/style.min.css" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="${path}/resources/assets/extra-libs/prism/prism.css">
    <link href="${path}/resources/commonCSS/leftMenu.css" rel="stylesheet">
    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
<![endif]-->
</head>
<body>
	<aside class="left-sidebar" style="padding-top:0;">
	 	<!-- ============================================================== -->
		<div class="user-profile text-center pt-2">
			<!-- ============================================================== -->
	        <!-- Logo -->
	        <!-- ============================================================== -->
	        <div class="navbar-brand">
	        	<!-- Logo icon -->	        	
	            <a href="${path}/adminMain.ad">
	            	<b class="logo-icon">
	            		<img src="${path}/resources/images/groubee_logo3.png" alt="homepage" class="logo" />
	            	</b>	            	
	            </a>
	        </div>
			<!-- ============================================================== -->
			<!-- End Logo -->
			<!-- ============================================================== -->
			<div class="profile-section">
				<p class="font-weight-bold mb-0 font-18">ADMIN</p>
			</div>
			<button type="button" id="btnLogout" class="btn waves-effect waves-light btn-rounded btn-outline-light" onClick="location.href='${path}/logout.co'">logout</button>
		</div>
		<!-- Sidebar scroll-->
		<div class="scroll-sidebar">
			<div class="side-attendance">
               	<nav class="sidebar-nav">
                   	<ul id="sidebarnav">
                        <li class="sidebar-item"> <a class="sidebar-link sidebar-link" href="${path}/adminMain.ad"
                                aria-expanded="false"><i data-feather="grid" class="feather-icon"></i><span
                                    class="hide-menu">홈</span></a></li>
						<c:if test="${sessionScope.authority == 'ROLE_APPROVAL' || sessionScope.authority == 'ROLE_ADMIN'}">                                     
                        <li class="sidebar-item"> <a class="sidebar-link sidebar-link" href="${path}/approvalad.apad?stateid=com"
                                aria-expanded="false"><i data-feather="edit-3" class="feather-icon"></i><span
                                    class="hide-menu">결재문서관리</span></a></li></c:if>
						<c:if test="${sessionScope.authority == 'ROLE_ATTEND' || sessionScope.authority == 'ROLE_ADMIN'}">                                    
                        <li class="sidebar-item"> <a class="sidebar-link sidebar-link" href="${path}/adAttend.ad"
                                aria-expanded="false"><i data-feather="users" class="feather-icon"></i><span
                                    class="hide-menu">근태관리</span></a></li></c:if>
                         <c:if test="${sessionScope.authority == 'ROLE_SECURE' || sessionScope.authority == 'ROLE_ADMIN'}">           
                        <li class="sidebar-item"> <a class="sidebar-link sidebar-link" href="${path}/adSecure.ad"
                                aria-expanded="false"><i data-feather="clipboard" class="feather-icon"></i><span
                                    class="hide-menu">보안관리</span></a></li></c:if>
                          <c:if test="${sessionScope.authority == 'ROLE_DEPARTMENT' || sessionScope.authority == 'ROLE_ADMIN'}">           
                        <li class="sidebar-item"> <a class="sidebar-link sidebar-link" href="${path}/adDepart.ad"
                                aria-expanded="false"><i data-feather="calendar" class="feather-icon"></i><span
                                    class="hide-menu">부서관리</span></a></li></c:if>
                          <c:if test="${sessionScope.authority == 'ROLE_SERVICE' || sessionScope.authority == 'ROLE_ADMIN'}">
                           </c:if>
                          <c:if test="${sessionScope.authority == 'ROLE_HUMAN' || sessionScope.authority == 'ROLE_ADMIN'}"> 
                         <li class="sidebar-item"> <a class="sidebar-link sidebar-link" href="${path}/adHr.ad"
                                aria-expanded="false"><i data-feather="users" class="feather-icon"></i><span
                                    class="hide-menu">인사관리</span></a></li></c:if>
                          <c:if test="${sessionScope.authority == 'ROLE_BOARD' || sessionScope.authority == 'ROLE_ADMIN'}">          
                         <li class="sidebar-item"> <a class="sidebar-link sidebar-link" href="${path}/adBoard.ad"
                             aria-expanded="false"><i data-feather="layout" class="feather-icon"></i><span
                                 class="hide-menu">게시판관리</span></a></li></c:if>
                           <c:if test="${sessionScope.authority == 'ROLE_NOTEBOX' || sessionScope.authority =='ROLE_ADMIN'}">
                         <li class="sidebar-item"> <a class="sidebar-link sidebar-link" href="${path}/adMessage.ad"
                                aria-expanded="false"><i data-feather="message-circle" class="feather-icon"></i><span
                                class="hide-menu">쪽지함관리</span></a></li></c:if>
                                <br><hr>
							<iframe src="https://console.dialogflow.com/api-client/demo/embedded/9b467837-d488-4afc-b2ce-9eab8138809d " scrolling="no" style="height: 400px; border: 0px none; width: 200px; margin-bottom: 0px; margin-left: 24px;">
							</iframe>
                         <li class="alert alert-warning" role="alert" id="pushAlarm" style="position: fixed; bottom: 0;left: 0; width:18%; display:none;">
                   	</ul>
               	</nav>
          	</div>
		</div>
	</aside>
	<!-- ============================================================== -->
	<!-- End Left Sidebar - style you can find in sidebar.scss  -->
	<!-- ============================================================== -->
</body>
</html>