<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

	<script>
	$(function(){
		$.ajax({
			url: "${path}/checkoutBadgeAction.ap?${_csrf.parameterName}=${_csrf.token}",
			type: "post",
			success : function(result) {
				$("#checkoutbg").html(result);
			},
			error: function(){
				alert("checkoutBadgeAction 오류");
			}
		});
	});	
	</script>

</head>
<body>

   <a class="ti-menu ti-close btn btn-success show-left-part d-block d-md-none"
                        href="javascript:void(0)"></a>
                    <div class="scrollable" style="height:100%;">
                        <div class="p-3">
                            <button onClick = "window.open('${path}/selectform.ap','결재정보','width=800,height=600,location=no,status=no,scrollbars=yes');"
                               class="btn mt-3 btn-info btn-block waves-effect waves-light">
                               <i class="ti-plus"></i> 새 결재 진행 </button>
                        </div>
                        <div class="divider"></div>
                        <ul class="list-group">
                            <li>
                                <small class="p-3 grey-text text-lighten-1 db">개인문서함</small>
                            </li>
                            <li class="list-group-item p-0 border-0">
                                <a href="${path}/approvallist.ap?stateid=on" class="active list-group-item-action p-3 d-block"> 기안문서함 </a>
                            </li>
                            <li class="list-group-item p-0 border-0">
                                <a href="${path}/templist.ap?stateid=temp" class="list-group-item-action p-3 d-block">  임시저장함 </a>
                            </li>
                            <li class="list-group-item p-0 border-0">
                            </li>
                            <li class="list-group-item p-0 border-0">
                                <a href="${path}/departdoclist.ap?stateid=com" class="list-group-item-action p-3 d-block">  부서문서함 </a>
                            </li>
                            <li class="list-group-item p-0 border-0">
                                <a href="${path}/referlist.ap" class="list-group-item-action p-3 d-block">  회람문서함 </a>
                            </li>
                                <hr>
                            <li>
                                <small class="p-3 grey-text text-lighten-1 db">결재문서함</small>
                            </li>
                            <li class="list-group-item p-0 border-0">
                                <a href="${path}/checkoutlist.ap?stateid=on" class="list-group-item-action p-3 d-block">  결재대기문서함 
                                <span id = "badge"class="badge badge-success float-right"><div id = "checkoutbg"></div></span></a>                                      
                            </li>
                            <li class="list-group-item p-0 border-0">
                                <a href="${path}/comcheckoutlist.ap?stateid=on" class="list-group-item-action p-3 d-block">  결재완료문서함 </a>                                      
                            </li>
                            <li class="list-group-item p-0 border-0">
                                <a href="${path}/prechecklist.ap?stateid=on" class="list-group-item-action p-3 d-block">  결재예정문서함 </a>
                            </li>
                            <li class="list-group-item p-0 border-0">
                            	<hr>
                            </li>

                        </ul>
                    </div>
</body>
</html>