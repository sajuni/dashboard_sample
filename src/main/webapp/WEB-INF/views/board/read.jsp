<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>

  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>SB Admin 2 - Tables</title>

  <!-- Custom fonts for this template -->
  <link href="../../resources/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
  <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">

  <!-- Custom styles for this template -->
  <link href="../../resources/css/sb-admin-2.min.css" rel="stylesheet">

  <!-- Custom styles for this page -->
  <link href="../../resources/vendor/datatables/dataTables.bootstrap4.min.css" rel="stylesheet">

</head>
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
<body>

	<div id="wrapper">
		<!-- sidebar -->
		<c:import url="/WEB-INF/views/include/sidebar.jsp" />
		<div id="content-wrapper" class="d-flex flex-column">
			<div id="content">
				<c:import url="/WEB-INF/views/include/topbar.jsp" />
				
				<form role="form" method="post">
					<input type="hidden" name="bno" value="${board.bno}">
				</form>
				
		
				<div class="box-body">
				
					<div class="form-group">
						<label for="exampleInputEamil">게시글 제목</label><input type="text" name="title" class="form-control" value="${board}" readonly="readonly">
					</div>
					<div class="form-group">
						<label for="exampleInputPassword1">게시글 내용</label><textarea class="form-control" name="content" rows="3" readonly="readonly" value="${board.content}"></textarea>
					</div>
					<div class="form-group">
						<label for="exampleInputEmail1">작성자</label><input type="text" name="title" class="form-control" value="${board.writer}" readonly="readonly">
					</div>
				</div>
			<%-- 	<form>
					<table class="table table-bordered"  width="100%" cellspacing="0">
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
							<tr class="board-list">
								<td><c:out value="${board.bno}"/></td>
								<td><c:out value="${board.title }"/></td>
								<td><c:out value="${board.content}"/></td>
								<td><c:out value="${board.writer}"/></td>
								<td><fmt:formatDate value="${board.regdate}"/></td>
								<td><c:out value="${board.viewcnt}"/></td>
							</tr>
						</tbody>				
					</table>
				</form> --%>
			</div>
		</div>
	</div>

</body>
</html>