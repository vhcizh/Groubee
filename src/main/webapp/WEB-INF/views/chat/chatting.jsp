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
    <!-- This page css -->
    <!-- Custom CSS -->
    <link href="${path}/resources/dist/css/style.min.css" rel="stylesheet">
    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
<![endif]-->

<script type="text/javascript">
$(function(){
	// 채팅방 목록
	rooms();
	
});

function rooms(){
	$.ajax({
		url:"${path}/list.ch?${_csrf.parameterName}=${_csrf.token}",
		type:"post",
		//data:"",
		success: function(result){
			$("#chattingRoom_list").html(result);
		},
		error: function(){
			alert('rooms() - 채팅방 목록 불러오기 오류');
		}
	});
}

</script>

</head>

<body>
    <!-- ============================================================== -->
    <!-- Main wrapper - style you can find in pages.scss -->
    <!-- ============================================================== -->
    <div id="main-wrapper" style=" width:100%; " >
        <div class="app-container"></div>
        <!-- ============================================================== -->
        <!-- Page wrapper  -->
        <!-- ============================================================== -->
        <div class="page-wrapper" style="height:100%;" >
            <div class="chat-application">
                <!-- ============================================================== -->
                <!-- Left Part  -->
                <!-- ============================================================== -->
                <div class="left-part bg-white user-chat-box show-panel" style="width:100%; overflow:scroll-y;" >
                <!-- left-part bg-white user-chat-box -->
                <!-- class="left-part bg-white user-chat-box show-panel" -->
                    <!-- Mobile toggle button -->
                    <!-- <a class="" href="javascript:void(0)"></a> -->
                    <!-- ti-menu ti-close btn btn-success show-left-part d-block d-md-none -->
                    <!-- ti-close btn btn-success show-left-part d-block d-md-none -->
                    
                    <!-- Mobile toggle button -->
                    <div class="scrollable position-relative" style="overflow: scroll">
                    
                        <div class="px-3 py-2 border-bottom pb-3">
                            <h5 class="card-title">채팅 목록</h5>
                            <form>
                                <div class="searchbar">
                                    <input class="form-control" type="text" placeholder="채팅방 이름 검색">
                                </div>
                            </form>
                        </div>
                        
                        
                        
                        <!-- style="overflow: scroll"  -->
                        <ul class="mailbox list-style-none app-chat " >
                            <li>
                                <div class="message-center chat-scroll chat-users notifications position-relative" id="chattingRoom_list">
                                
			<!-- 채팅방 목록 -->
                                    
                                </div>
                            </li>
                        </ul>
                        
                        
                        
                        
                    </div>
                </div>
                <!-- ============================================================== -->
                <!-- End Left Part  -->
                <!-- ============================================================== -->
                <!-- ============================================================== -->
                <!-- Right Part  Mail Compose -->
                <!-- ============================================================== -->
            </div>
            
            
            
            <!-- ============================================================== -->
            <!-- footer -->
            <!-- ============================================================== -->
            <!-- ============================================================== -->
            <!-- End footer -->
            <!-- ============================================================== -->
        </div>
        <!-- ============================================================== -->
        <!-- End Page wrapper  -->
        <!-- ============================================================== -->
    </div>
    <!-- ============================================================== -->
    <!-- End Wrapper -->
    <!-- ============================================================== -->
    
    
    
    <!-- ============================================================== -->
    <!-- All Jquery -->
    <!-- ============================================================== -->
    <script src="${path}/resources/assets/libs/jquery/dist/jquery.min.js"></script>
    <script src="${path}/resources/assets/extra-libs/taskboard/js/jquery.ui.touch-punch-improved.js"></script>
    <script src="${path}/resources/assets/extra-libs/taskboard/js/jquery-ui.min.js"></script>
    <!-- Bootstrap tether Core JavaScript -->
    <script src="${path}/resources/assets/libs/popper.js/dist/umd/popper.min.js"></script>
    <script src="${path}/resources/assets/libs/bootstrap/dist/js/bootstrap.min.js"></script>
    <!-- apps -->
    <script src="${path}/resources/dist/js/app.min.js"></script>
    <script src="${path}/resources/dist/js/app.init-menusidebar.js"></script>
    <script src="${path}/resources/dist/js/app-style-switcher.js"></script>
    <script src="${path}/resources/dist/js/feather.min.js"></script>
    <!-- slimscrollbar scrollbar JavaScript -->
    <script src="${path}/resources/assets/libs/perfect-scrollbar/dist/perfect-scrollbar.jquery.min.js"></script>
    <script src="${path}/resources/assets/extra-libs/sparkline/sparkline.js"></script>
    <!--Menu sidebar -->
    <script src="${path}/resources/dist/js/sidebarmenu.js"></script>
    <!--Custom JavaScript -->
    <script src="${path}/resources/dist/js/custom.min.js"></script>
    <script src="${path}/resources/dist/js/pages/chat/chat.js"></script>
    <!--This page JavaScript -->
    <script src="${path}/assets/libs/bootstrap-duallistbox/dist/jquery.bootstrap-duallistbox.min.js"></script>
    <script src="${path}/dist/js/pages/forms/dual-listbox/dual-listbox.js"></script>
    
    
    <script src="https://cdn.jsdelivr.net/npm/sockjs-client@1/dist/sockjs.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/stomp.js/2.3.3/stomp.min.js"></script>
    
</body>

</html>