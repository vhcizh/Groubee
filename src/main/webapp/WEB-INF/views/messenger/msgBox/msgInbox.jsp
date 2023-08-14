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
    <title>그루비 그룹웨어</title>	
	<link rel="canonical" href="https://www.wrappixel.com/templates/severny-admin-template/" />
	<!-- Custom CSS -->
	<link rel="stylesheet" type="text/css" href="${path}/resources/assets/libs/quill/dist/quill.snow.css">
    <!-- This Page CSS -->
    <link href="${path}/resources/assets/libs/summernote/dist/summernote-bs4.css" rel="stylesheet">
    <link href="${path}/resources/assets/libs/dropzone/dist/min/dropzone.min.css" rel="stylesheet">
    <!-- Custom CSS -->
    <link href="${path}/resources/dist/css/style.min.css" rel="stylesheet">
    <script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
<![endif]-->
</head>
<body>
	<!-- ============================================================== -->
	                <!-- Right Part -->
	                <!-- ============================================================== -->
	                <div class="right-part mail-list overflow-auto" style="width:100%; margin-left:0;">
	                    <div class="p-3 b-b">
	                        <div class="d-flex align-items-center">
	                            <!-- <div>
	                                <h4>Mailbox </h4>
	                                <span>Here is the list of mail</span>
	                            </div> -->
	                            <!-- <div class="ml-auto" style="width:30%;">
	                                <input placeholder="Search Mail" type="text" class="form-control">
	                            </div> -->
	                        </div>
	                    </div>
	                    <!-- Action part -->
	                    <!-- Button group part -->
	                    <div class="bg-light p-3 d-flex align-items-center do-block">
	                        <div class="btn-group mt-1 mb-1">
	                            <div class="custom-control custom-checkbox">
	                                <input type="checkbox" class="custom-control-input sl-all" id="cstall">
	                                <label class="custom-control-label" for="cstall">전체선택</label>
	                            </div>
	                        </div>
	                        <div class="ml-auto">
	                            <div class="btn-group mr-2" role="group" aria-label="Button group with nested dropdown">
	                                <button type="button" class="btn btn-outline-secondary font-18">읽음</button>
	                                <button type="button" class="btn btn-outline-secondary font-18">삭제</button>
	                            </div>
	                        </div>
	                    </div>
	                    <!-- Action part -->
	                    <!-- Mail list-->
	                    <div class="table-responsive">
	                        <table class="table email-table no-wrap table-hover v-middle">
	                            <tbody>
	                            <c:forEach var="dto" items="${list}">
	                                <!-- row -->
	                                <tr class="unread">
	                                    <!-- label -->
	                                    <td class="chb" style="padding-right:0;">
	                                        <div class="custom-control custom-checkbox" style="width:0.1px;">
	                                            <input type="checkbox" class="custom-control-input" id="cst1">
	                                            <label class="custom-control-label" for="cst1">&nbsp;</label>
	                                        </div>
	                                    </td>
	                                    <!-- User -->
	                                    <td class="user-name px-1 py-2" style="width:10%;">
	                                        <h6 class="mb-0 text-truncate font-weight-medium">${dto.depart_name} ${dto.name}</h6>
	                                    </td>
	                                    <!-- Message -->
	                                    <td class="py-2 px-3 no-wrap text-truncate"> <a class="link " href="javascript: void(0)"> 
	                                    												<!--  font-weight-medium : 글씨 굵게 -->
	                                            <span class="badge badge-danger mr-2">안읽음</span>
	                                            <span class="blue-grey-text text-darken-4">${dto.title}</span></a></td>
	                                    <!-- Attachment -->
	                                    <td class="clip px-1 py-2">
	                                    	<c:if test="${not empty dto.files}">
	                                    	<i class="fa fa-paperclip"></i>
	                                    	</c:if>
	                                    </td>
	                                    <!-- Time -->
	                                    <td class="time text-right">${dto.send_date}</td>
	                                </tr>
	                            </c:forEach>
	                    		</tbody>
	                        </table>
	                    </div>
	                    </div>
	                    <!-- <div class="tab-content">
	                    	<div id="note-full-container" class="note-has-grid row" style="width:100%;">
	                    	</div>
						</div> -->
						<!-- ============================================================== -->
						<!-- End Wrapper -->
						<!-- ============================================================== -->
    <!-- ============================================================== -->
    <!-- All Jquery -->
    <!-- ============================================================== -->
    <script src="${path}/resources/assets/libs/jquery/dist/jquery.min.js"></script>
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
    <!-- This Page JS -->
<%--     <script src="${path}/resources/dist/js/pages/email/email.min.js"></script> --%>
    <script src="${path}/resources/assets/libs/summernote/dist/summernote-bs4.min.js"></script>
    <script src="${path}/resources/assets/libs/dropzone/dist/min/dropzone.min.js"></script>
    <script>
        $('#summernote').summernote({
            placeholder: 'Type your email Here',
            tabsize: 2,
            height: 250
        });
        Dropzone.autoDiscover = false;
        $(document).ready(function () {
            var myDrop = new Dropzone("#dzid", {
                url: '/file/post'
            });
        });
    </script>

	
</body>

</html>