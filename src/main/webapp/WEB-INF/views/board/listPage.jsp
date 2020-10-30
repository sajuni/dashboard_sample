<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<html>
<head>

  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>게시판 - 리스트</title>

  <!-- Custom fonts for this template -->
  <link href="../../resources/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
  <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">
 <!--  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css"> -->
  <!-- Custom styles for this template -->
  <link href="../../resources/css/sb-admin-2.min.css" rel="stylesheet">

  <!-- Custom styles for this page -->
  <link href="../../resources/vendor/datatables/dataTables.bootstrap4.min.css" rel="stylesheet">
  
  <!-- Bootstrap core JavaScript-->
  <script src="../../resources/vendor/jquery/jquery.min.js"></script>
  <script src="../../resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

  <!-- Core plugin JavaScript-->
  <script src="../../resources/vendor/jquery-easing/jquery.easing.min.js"></script>

  <!-- Custom scripts for all pages-->
  <script src="../../resources/js/sb-admin-2.min.js"></script>

  <!-- Page level plugins -->
  <script src="../../resources/vendor/datatables/jquery.dataTables.min.js"></script>
  <script src="../../resources/vendor/datatables/dataTables.bootstrap4.min.js"></script>

  <!-- Page level custom scripts -->
  <script src="../../resources/js/demo/datatables-demo.js"></script>
  
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
		          				<a href="/board/readPage${pageMaker.makeQuery(pageMaker.cri.page)}&bno=${boardVO.bno}">${boardVO.btitle}</a>
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
          				<li class="page-item"><a class="page-link" href="listPage${pageMaker.makeQuery(pageMaker.startPage - 1) }">&laquo;</a></li>
          			</c:if>
          			<c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage }" var="idx">
          				<li class="page-item<c:out value="${pageMaker.cri.page == idx?' active':''}" />">
          					<a class="page-link" href="listPage${pageMaker.makeQuery(idx) }">${idx}</a>
          				</li>
          			</c:forEach>
          			<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
          				<li class="page-item"><a class="page-link" href="listPage${pageMaker.makeQuery(pageMaker.endPage + 1) }">&raquo;</a></li>
          			</c:if>
          			
          		</ul>
          	</nav>
          	
          </div>
			<button type="button" class="btn btn-secondary mb-3" onclick="registerBoard();">글쓰기</button>
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
			
			var result = '${msg}';

			if (result != "") {
				alert(result);
			}
	</script>

</body>

</html>
