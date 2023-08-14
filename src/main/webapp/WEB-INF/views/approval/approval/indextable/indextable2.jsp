<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/setting.jsp" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<body>
   <h4 class="card-title mb-4">결재 대기 문서 </h4>
   <a href="${path}/checkoutlist.ap?stateid=on"><h6 class="card-title mb-4"> >> 전체 문서 확인하기</h6></a>
   <div class="table-responsive">
       <table class="table no-wrap v-middle mb-0">
           <thead>
               <tr class="border-0">
                   <th class="border-0 font-weight-medium text-muted">기안일</th>
                   <th class="border-0 font-weight-medium text-muted px-2">카테고리</th>
                   <th class="border-0 font-weight-medium text-muted">제목</th>
                   <th class="border-0 font-weight-medium text-muted last-collum">기안자</th>
               </tr>
           </thead>
           <tbody>
            <c:forEach var = "dto" items="${list}">  
                <tr>
                    <td class="p-2">
                        <div class="d-flex no-block align-items-center">
                        	<span class="text-muted">${dto.upday}</span>
                        </div>
                    </td>
                    <td class="text-muted p-2">${dto.category}</td>
                    <td>
                    	<a onclick="window.open('${path}/checkoutdocDetail.fo?doc_id=${dto.doc_id}','기안문서','width=850,height=1100,scrollbars=yes');" href="${path}/indextable.ap?stateid=on">${dto.title}</a>
                    </td>
                    </td>
                    <td class="text-center text-muted font-weight-medium">${dto.depart} ${dto.name} ${dto.rank}</td>
                </tr>
            </c:forEach>
           </tbody>
       </table>
        <!-- 페이징  -->                    
                    <div class="p-3 mt-4">
                        <nav aria-label="Page navigation example">
                            <ul class="pagination justify-content-center">
                            	<!-- 이전 버튼 -->
                            	<c:forEach var = "dto" items="${list2}" begin = "0" end = "0">
	                            	<c:if test="${paging.startPage > 10}">
	                            		<li class="page-item"><a class="page-link" href="${path}/checkoutlist.ap?stateid=${dto.stateid}&pageNum=${paging.prev}">Previous</a></li>
									</c:if>
									<!-- 페이지 -->
									<c:forEach var="num" begin="${paging.startPage}" end="${paging.endPage}">
										<li class="page-item"><a class="page-link" href="${path}/checkoutlist.ap?stateid=${dto.stateid}&pageNum=${num}">${num}</a></li>
									</c:forEach>
									<!-- 다음 버튼 -->
									<c:if test="${paging.endPage < paging.pageCount}">
										<li class="page-item"><a class="page-link" href="${path}/checkoutlist.ap?stateid=${dto.stateid}&pageNum=${paging.next}">Next</a></li>
									</c:if>
								</c:forEach>
                            </ul>
                        </nav>
                    </div>
    </div>
</body>
</html>