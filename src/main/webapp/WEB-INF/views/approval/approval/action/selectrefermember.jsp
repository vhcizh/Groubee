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
    <link href="${path}/resources/dist/css/style.min.css" rel="stylesheet">
    <!-- This Page CSS -->
    <link rel="stylesheet" type="text/css"
        href="${path}/resources/assets/libs/bootstrap-duallistbox/dist/bootstrap-duallistbox.min.css">
    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
<![endif]-->

 
</head>		
	<script>
	$(function(){
		$("#refermemberSelect").click(function(){
			if(confirm("회람하시겠습니까?")){
			document.referlistForm.action = "${path}/referlineAction.ap?${_csrf.parameterName}=${_csrf.token}";
			document.referlistForm.submit();
			} 
		});
	});
		
	
	</script>		
              <div class="card" onload = "loadline();">
                 <div class="card-body">
                    <form name = "referlistForm" method = "post"> 
                    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
                    <input type="hidden" name="load_id" value="${load_id}">
		                <div class="row">
		                    <div class="col-12">
		                        <div class="card">
		                            <div class="card-body">
		                                <h4 class="card-title">회람직원 선택</h4>
		                                <select multiple="multiple" size="10" class="duallistbox" name = "id">
		                                 <c:forEach var="dto" items="${list}" varStatus = "status">
		                                    <option value="${dto.id}">${dto.id} ${dto.depart_name} ${dto.name} ${dto.rank} </option>
		                                </c:forEach>   
		                                </select>
		                                <br>
		                            </div>
		                        </div>
		                    </div>
		                 </div>
		                 <div>
                      	<button type = "button" id = "refermemberSelect" class ="btn btn-secondary btn-sm">회람하기</button>  
                      <button type = "button" class ="btn btn-secondary btn-sm" onclick="self.close();">창닫기</button>
                      </div> 
             		  </form>
                       </div>
                   </div>
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
    <!--Wave Effects -->
    <!-- themejs -->
    <!--Menu sidebar -->
    <script src="${path}/resources/dist/js/sidebarmenu.js"></script>
    <!--Custom JavaScript -->
    <script src="${path}/resources/dist/js/custom.min.js"></script>
    <!-- This Page JS -->
    <script src="${path}/resources/assets/libs/bootstrap-duallistbox/dist/jquery.bootstrap-duallistbox.min.js"></script>
    <script src="${path}/resources/dist/js/pages/forms/dual-listbox/dual-listbox.js"></script>
</body>

</html>