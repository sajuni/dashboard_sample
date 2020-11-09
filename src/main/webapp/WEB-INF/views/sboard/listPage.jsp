<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<html>
<head>
<%@include file="/WEB-INF/views/include/header.jsp" %>
</head>

<body id="page-top">

  <!-- Page Wrapper -->
  <div id="wrapper">
	<!-- sidebar -->
	<c:import url="/WEB-INF/views/include/sidebar.jsp" />
    <!-- Content Wrapper -->
    <div id="content-wrapper" class="d-flex flex-column">

      <!-- Main Content -->
      <div id="content">
		<!-- topbar -->
		<c:import url="/WEB-INF/views/include/topbar.jsp" />
        <!-- Begin Page Content -->
        <div class="container-fluid">

          <!-- Page Heading -->
          <h1 class="h3 mb-2 text-gray-800">Tables</h1>
          <p class="mb-4">DataTables is a third party plugin that is used to generate the demo table below. For more information about DataTables, please visit the <a target="_blank" href="https://datatables.net">official DataTables documentation</a>.</p>

          <!-- DataTales Example -->
          <div class="card shadow mb-4">
            <div class="card-header py-3">
	              <select name="searchType">
	              	<option value = "n" <c:out value="${cri.searchType == null?'selected':''}" />>검색</option>
	              	<option value = "t" <c:out value="${cri.searchType eq 't'?'selected':''}" />>글제목</option>
	              	<option value = "c" <c:out value="${cri.searchType eq 'c'?'selected':''}" />>글내용</option> 
	              	<option value = "w" <c:out value="${cri.searchType eq 'w'?'selected':''}" />>작성자</option>
	              </select>
         		  <input type="text" name='keyword' id="keywordInput" value='${cri.keyword}'>
         		  <button id="searchBtn" type="button" class="btn btn-secondary mb-3" style="margin-bottom: 0 !important;">Search</button>
         		  <button id="newBtn" type="button" class="btn btn-secondary mb-3" style="margin-bottom: 0 !important;">New Board</button>
            </div>
            <div class="card-body">
              <div class="table-responsive">
                <table class="table table-bordered">
                  <thead>
                    <tr>
                      <th>글번호</th>
                      <th>글제목</th>
                      <th>글내용</th>
                      <th>작성자</th>
                      <th>작성일자</th>
                      <th>조회수</th>
                    </tr>
                  </thead>
                	<tbody>
		      		<c:forEach items="${blist}" var="boardVO">
		          		
		          		<tr>
		          			<td>${boardVO.bno}</td>
		          			<td>
		          				<a href="/sboard/readPage${pageMaker.makeSearch(pageMaker.cri.page)}&bno=${boardVO.bno}">${boardVO.btitle} <strong>[${boardVO.replycnt}]</strong></a>
		          			</td>
		          			<td>${boardVO.bcontent}</td>
		          			<td>${boardVO.bwriter}</td>
		          			<td><fmt:formatDate pattern="yyyy-MM-dd HH:mm" value="${boardVO.regdate}"/></td>
		          			<td><span class="badge bg-red">${boardVO.viewcnt}</span></td>
		          		</tr>
		          		
		          	</c:forEach>              		
                	</tbody>
                </table>
              </div>
            </div>
           
          	<nav aria-label="..." style="align-self: center;">
          		<ul class="pagination" >
          			
          			<c:if test="${pageMaker.prev}">
          				<li class="page-item"><a class="page-link" href="listPage${pageMaker.makeSearch(pageMaker.startPage - 1) }">&laquo;</a></li>
          			</c:if>
          			<c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage }" var="idx">
          				<li class="page-item<c:out value="${pageMaker.cri.page == idx?' active':''}" />">
          					<a class="page-link" href="listPage${pageMaker.makeSearch(idx) }">${idx}</a>
          				</li>
          			</c:forEach>
          			<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
          				<li class="page-item"><a class="page-link" href="listPage${pageMaker.makeSearch(pageMaker.endPage + 1) }">&raquo;</a></li>
          			</c:if>
          			
          		</ul>
          	</nav>
          	
          </div>
				<script>
					function registerBoard() {
						location.href="register"
					}
		
				</script>
        </div>
        <!-- /.container-fluid -->

      </div>
      <!-- End of Main Content -->

      <!-- Footer -->
      <footer class="sticky-footer bg-white">
        <div class="container my-auto">
          <div class="copyright text-center my-auto">
            <span>Copyright &copy; Your Website 2020</span>
          </div>
        </div>
      </footer>
      <!-- End of Footer -->

    </div>
    <!-- End of Content Wrapper -->

  </div>
  <!-- End of Page Wrapper -->

  <!-- Scroll to Top Button-->
  <a class="scroll-to-top rounded" href="#page-top">
    <i class="fas fa-angle-up"></i>
  </a>

  <!-- Logout Modal-->
  <div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title" id="exampleModalLabel">Ready to Leave?</h5>
          <button class="close" type="button" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">Ã</span>
          </button>
        </div>
        <div class="modal-body">Select "Logout" below if you are ready to end your current session.</div>
        <div class="modal-footer">
          <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
          <a class="btn btn-primary" href="login.html">Logout</a>
        </div>
      </div>
    </div>
  </div>

	<script>
			$(document).ready(() => {
				$('#searchBtn').on(
						"click",
						(event) => {
							self.location = "listPage"
								+ '${pageMaker.makeQuery(1)}'
								+ "&searchType="
								+ $("select option:selected").val()
								+ "&keyword=" + $('#keywordInput').val();

							});

				$('#newBtn').on("click", (evt) => {self.location = "register"; });
				});
	
			var result = '${msg}';

			if (result != "") {
				alert(result);
			}

			
	</script>

</body>

</html>
