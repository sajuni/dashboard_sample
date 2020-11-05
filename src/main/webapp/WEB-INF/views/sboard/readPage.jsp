<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>게시판 - 상세보기</title>

<!-- Custom fonts for this template -->
<link href="../../resources/vendor/fontawesome-free/css/all.min.css"
	rel="stylesheet" type="text/css">
<link
	href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
	rel="stylesheet">

<!-- Custom styles for this template -->
<link href="../../resources/css/sb-admin-2.min.css" rel="stylesheet">

<!-- Custom styles for this page -->
<link
	href="../../resources/vendor/datatables/dataTables.bootstrap4.min.css"
	rel="stylesheet">

</head>
<!-- Bootstrap core JavaScript-->
<script src="../../resources/vendor/jquery/jquery.min.js"></script>
<script
	src="../../resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

<!-- Core plugin JavaScript-->
<script src="../../resources/vendor/jquery-easing/jquery.easing.min.js"></script>

<!-- Custom scripts for all pages-->
<script src="../../resources/js/sb-admin-2.min.js"></script>

<!-- Page level plugins -->
<script src="../../resources/vendor/datatables/jquery.dataTables.min.js"></script>
<script
	src="../../resources/vendor/datatables/dataTables.bootstrap4.min.js"></script>

<!-- Page level custom scripts -->
<script src="../../resources/js/demo/datatables-demo.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
<style>
ul {
	
}
</style>
<body>

	<div id="wrapper">
		<!-- sidebar -->
		<c:import url="/WEB-INF/views/include/sidebar.jsp" />
		<div id="content-wrapper" class="d-flex flex-column">
			<div id="content">
				<c:import url="/WEB-INF/views/include/topbar.jsp" />

				<form method="post" name="form">
					<input type="hidden" name="bno" value="${board.bno}"> <input
						type="hidden" name='page' value='${cri.page}'> <input
						type='hidden' name='perPageNum' value='${cri.perPageNum}'>
					<input type='hidden' name='searchType' value='${cri.searchType}'>
					<input type='hidden' name='keyword' value='${cri.keyword}'>
				</form>


				<div class="box-body">

					<div class="form-group">
						<label for="exampleInputEamil">게시글 제목</label><input type="text"
							name="btitle" class="form-control" value="${board.btitle}"
							readonly="readonly">
					</div>
					<div class="form-group">
						<label for="exampleInputPassword1">게시글 내용</label>
						<textarea class="form-control" name="bcontent" rows="3"
							readonly="readonly">${board.bcontent}</textarea>
					</div>
					<div class="form-group">
						<label for="exampleInputEmail1">작성자</label><input type="text"
							name="bwriter" class="form-control" value="${board.bwriter}"
							readonly="readonly">
					</div>
				</div>

				<div class="box-footer text-center" style="width: 100%">
					<button type="submit" class="btn btn-warning" onclick="modify()">MODIFY</button>
					<button type="submit" class="btn btn-danger" onclick="remove()">REMOVE</button>
					<button type="submit" class="btn btn-primary" onclick="listAll()">LIST
						ALL</button>
				</div>

			</div>
			<!-- /.row -->


			<br>
			<br>
			<div class="row" style="justify-content: center;">
				<div class="col-md-10">

					<div class="box box-success" style="background-color: white;">
						<div class="box-header">
							<h3 class="box-title">ADD NEW REPLY</h3>
						</div>
						<div class="box-body">
							<label for="exampleInputEmail1">Writer</label> <input
								class="form-control" type="text" placeholder="USER ID"
								id="newReplyWriter"> <label for="exampleInputEmail1">Reply
								Text</label> <input class="form-control" type="text"
								placeholder="REPLY TEXT" id="newReplyText">

						</div>
						<!-- /.box-body -->
						<br> <br>
						<div class="box-footer">
							<button type="button" class="btn btn-primary" id="replyAddBtn">ADD
								REPLY</button>
						</div>
					</div>
					<br>
					<br>

					<!-- The time line -->
					<ul class="timeline">
						<!-- timeline time label -->
						<li class="time-label" id="repliesDiv"><span class="bg-green">
								<button type="button" class="btn btn-primary" id="replieslist">
									Replies List <small id="replycntSmall">[${board.replycnt}]</small>
								</button>
						</span></li>
					</ul>

					<div class='text-center'>
						<ul id="pagination" class="pagination pagination-sm no-margin ">

						</ul>
					</div>

				</div>
				<!-- /.col -->
			</div>
			<!-- /.row -->



			<!-- Modal -->
			<div id="modifyModal" class="modal modal-primary fade" role="dialog">
				<div class="modal-dialog">
					<!-- Modal content-->
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal">&times;</button>
							<h4 class="modal-title"></h4>
						</div>
						<div class="modal-body" data-rno>
							<p>
								<input type="text" id="replytext" class="form-control">
							</p>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-info" id="replyModBtn">Modify</button>
							<button type="button" class="btn btn-danger" id="replyDelBtn">DELETE</button>
							<button type="button" class="btn btn-default"
								data-dismiss="modal">Close</button>
						</div>
					</div>
				</div>
			</div>
		</div>

	</div>



	<script id="template" type="text/x-handlebars-template">
{{#each .}}
<li class="replyLi" data-rno={{rno}} style="background: white;>
<i class="fa fa-comments bg-blue"></i>
 <div class="timeline-item" >
  <span class="time">
    <i class="fa fa-clock-o"></i>{{prettifyDate regdate}}
  </span>
  <h3 class="timeline-header"><strong>{{rno}}</strong> - {{replyer}}</h3>
  <div class="timeline-body">{{replytext}} </div>
    <div class="timeline-footer">
     <a class="btn btn-primary btn-xs" 
	    data-toggle="modal" data-target="#modifyModal">Modify</a>
    </div>
  </div>			
</li>
<br>
{{/each}}
</script>

	<script>
		Handlebars.registerHelper("prettifyDate", function(timeValue) {
			var dateObj = new Date(timeValue);
			var year = dateObj.getFullYear();
			var month = dateObj.getMonth() + 1;
			var date = dateObj.getDate();
			return year + "/" + month + "/" + date;
		});

		var printData = function(replyArr, target, templateObject) {

			var template = Handlebars.compile(templateObject.html());

			var html = template(replyArr);
			$(".replyLi").remove();
			target.after(html);

		}

		var bno = ${board.bno};

		var replyPage = 1;

		function getPage(pageInfo) {

			$.getJSON(pageInfo, function(data) {
				printData(data.list, $("#repliesDiv"), $('#template'));
				printPaging(data.pageMaker, $(".pagination"));

				$("#modifyModal").modal('hide');
				$("#replycntSmall").html("[ " + data.pageMaker.totalCount + " ]");
			});
		}

		var printPaging = function(pageMaker, target) {

			var str = "";

			if (pageMaker.prev) {
				str += "<li><a href='" + (pageMaker.startPage - 1)
						+ "'> << </a></li>";
			}

			for (var i = pageMaker.startPage, len = pageMaker.endPage; i <= len; i++) {
				var strClass = pageMaker.cri.page == i ? 'class=active' : '';
				str += "<li "+strClass+"><a href='"+i+"'>" + i + "</a></li>";
			}

			if (pageMaker.next) {
				str += "<li><a href='" + (pageMaker.endPage + 1)
						+ "'> >> </a></li>";
			}

			target.html(str);
		};

		$("#repliesDiv").on("click", function() {

			if ($(".timeline li").size() > 1) {
				return;
			}
			getPage("/replies/" + bno + "/1");

		});

		$(".pagination").on("click", "li a", function(event) {

			event.preventDefault();

			replyPage = $(this).attr("href");

			getPage("/replies/" + bno + "/" + replyPage);

		});

		$("#replyAddBtn").on("click", function() {

			var replyerObj = $("#newReplyWriter");
			var replytextObj = $("#newReplyText");
			var replyer = replyerObj.val();
			var replytext = replytextObj.val();

			$.ajax({
				type : 'post',
				url : '/replies/',
				headers : {
					"Content-Type" : "application/json",
					"X-HTTP-Method-Override" : "POST"
				},
				dataType : 'text',
				data : JSON.stringify({
					bno : bno,
					replyer : replyer,
					replytext : replytext
				}),
				success : function(result) {
					console.log("result: " + result);
					if (result == 'SUCCESS') {
						alert("등록 되었습니다.");
						replyPage = 1;
						getPage("/replies/" + bno + "/" + replyPage);
						replyerObj.val("");
						replytextObj.val("");
					}
				}
			});
		});

		$(".timeline").on("click", ".replyLi", function(event) {

			var reply = $(this);

			$("#replytext").val(reply.find('.timeline-body').text());
			$(".modal-title").html(reply.attr("data-rno"));

		});

		$("#replyModBtn").on("click", function() {

			var rno = $(".modal-title").html();
			var replytext = $("#replytext").val();

			$.ajax({
				type : 'put',
				url : '/replies/' + rno,
				headers : {
					"Content-Type" : "application/json",
					"X-HTTP-Method-Override" : "PUT"
				},
				data : JSON.stringify({
					replytext : replytext
				}),
				dataType : 'text',
				success : function(result) {
					console.log("result: " + result);
					if (result == 'SUCCESS') {
						alert("수정 되었습니다.");
						getPage("/replies/" + bno + "/" + replyPage);
					}
				}
			});
		});

		$("#replyDelBtn").on("click", function() {

			var rno = $(".modal-title").html();
			var replytext = $("#replytext").val();

			$.ajax({
				type : 'delete',
				url : '/replies/' + rno,
				headers : {
					"Content-Type" : "application/json",
					"X-HTTP-Method-Override" : "DELETE"
				},
				dataType : 'text',
				success : function(result) {
					console.log("result: " + result);
					if (result == 'SUCCESS') {
						alert("삭제 되었습니다.");
						getPage("/replies/" + bno + "/" + replyPage);
					}
				}
			});
		});
	</script>

	<script>
		var formObj = document.form;

		function modify() {
			console.log(formObj);
			formObj.setAttribute('action', '/sboard/modifyPage');
			formObj.setAttribute('method', 'get');
			formObj.submit();

		}

		function remove() {

			formObj.setAttribute('action', '/sboard/removePage');
			formObj.submit();

		}

		function listAll() {

			var bno = formObj.bno;
			formObj.removeChild(bno);

			formObj.setAttribute('method', 'get');
			formObj.setAttribute('action', '/sboard/listPage');
			formObj.submit();

		}
	</script>



</body>
</html>