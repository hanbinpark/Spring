<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<body>
	<div class="container">
	  <h2>Spring Book</h2>
	  <div class="panel panel-default">
	    <div class="panel-heading">Book</div>
	    <div class="panel-body">
			<table id="boardList" class="table table-bordered table-hover">
				<tr class="warning">
					<td>번호</td>
					<td>제목</td>
					<td>작가</td>
					<td>출판사</td>
					<td>isbn</td>
					<td>보유도서수</td>
					<td>삭제</td>
					<td>수정</td>
				</tr>
				
				<tbody id="view">
				<!-- 비동기 방식으로 가져온 게시글 나오게 할 부분  -->
				
				</tbody>
				
				<tr>
					<td colspan="5">
						<button onclick="goForm()" class="btn btn-primary btn-sm">도서등록</button>
					</td>
				</tr>
			</table>
		</div>
		
		<!-- 글쓰기 폼  -->
		<div class="panel-body" id="wform" style="display : none">
			<form id="frm" >
			<table class="table" >
				<tr>
					<td>제목</td>
					<td><input type="text" name="title" class="form-control"></td>
				</tr>
				<tr>
					<td>작가</td>
					<td><input  type="text" name="author" class="form-control"></td>
				</tr>
				<tr>
					<td>출판사</td>
					<td><input   type="text" name="company" class="form-control"></td>
				</tr>
				<tr>
					<td>isbn</td>
					<td><input   type="text" name="isbn" class="form-control"></td>
				</tr>
				<tr>
					<td>보유도서수</td>
					<td><input  type="text" name="count" class="form-control"></td>
				</tr>
				
				<tr>
					<td colspan="2" align="center">
						<button class="btn btn-success btn-sm" type="button" onclick="goInsert()">등록</button>
						<button class="btn btn-warning btn-sm" type="reset" id="fclear">취소</button>
						<button onclick="goList()" class="btn btn-info btn-sm">리스트로 가기</a>
					</td>
				</tr>
			</table>
			</form>
		
		</div>
		
		
		<!-- 수정 폼  -->
		<div class="panel-body" id="uform" style="display : none">
			<form id="frm" >
			<table class="table" >
				<tr>
					<td>번호</td>
					<td><input id="num" type="text" name="num" class="form-control"></td>
				</tr>
				<tr>
					<td>제목</td>
					<td><input id="title" type="text" name="title" class="form-control"></td>
				</tr>
				<tr>
					<td>작가</td>
					<td><input id="author" type="text" name="author" class="form-control"></td>
				</tr>
				<tr>
					<td>출판사</td>
					<td><input id="company" type="text" name="company" class="form-control"></td>
				</tr>
				<tr>
					<td>isbn</td>
					<td><input id="isbn" type="text" name="isbn" class="form-control"></td>
				</tr>
				<tr>
					<td>보유도서수</td>
					<td><input id="count" type="text" name="count" class="form-control"></td>
				</tr>
				
				<tr>
					<td colspan="2" align="center">
						<button class="btn btn-success btn-sm" type="button" onclick="goUpdate()">수정</button>
						<button class="btn btn-warning btn-sm" type="reset" id="fclear">취소</button>
						<button onclick="goList()" class="btn btn-info btn-sm">리스트로 가기</a>
					</td>
				</tr>
			</table>
			</form>
		
		</div>
		
		
	    <div class="panel-footer">스프링도서관 - 박한빈</div>
	  </div>
	</div>
	

		<script type="text/javascript">
		$(document).ready(function(){
			// HTML이 다 로딩되고나서 아래 코드 실행
			loadList();
		});
	
		function loadList(){
			
			
			
			// 비동기방식으로 게시글 리스트 가져오는 기능
			// ajax - 요청 url, 어떻게 데이터 받을지, 요청방식 등... -> 객체
			$.ajax({
				url : "book/all",
				type : "get",
				dataType : "json",
				success: makeView, // 콜백함수
				error : function() { alert("error");}
			});
			
		}
		
		function makeView(data){
			var listHtml = "";
			$.each(data, function(index, obj){
				
				listHtml += "<tr>";
				listHtml += "<td>" + (index+1) + "</td>";
				listHtml += "<td id='t"+ obj.num +"'>" ;
				listHtml += "<a href='javascript:goContent("+ obj.num +")'>";
				listHtml += obj.title;
				listHtml += "</a>";
				
				listHtml += "</td>";
				listHtml += "<td id='w"+ obj.idx +"'>" + obj.author + "</td>";
				listHtml += "<td>" + obj.company + "</td>";
				listHtml += "<td>" + obj.isbn + "</td>";
				listHtml += "<td>" + obj.count + "</td>";
				listHtml += "<td><button onclick='goDelete("+obj.num +")' class='btn btn-success btn-sm' type='button' >삭제</td>";
				listHtml += "<td><button onclick='goContent(" +obj.num +")' class='btn btn-warning btn-sm' type='button' >수정</td>";
				listHtml += "</tr>";
				
			
		
				
			});
			
			$("#view").html(listHtml);
			
			goList();
		}
		
		// goForm 함수를 만들어서 view는 감추고 wform은 보이게 하시오.
		function goForm(){
			//document.getElementById("view").style.display = "none";
			//$("#view").hide();
			//$("#wform").show();
			$("#boardList").css("display","none");
			$("#uform").css("display","none");
			$("#wform").css("display","block");
		}
		
		function goList(){
			$("#boardList").css("display","table");
			$("#wform").css("display","none");
			$("#uform").css("display","none");
		}
		
		function goInsert(){
			// 게시글 등록기능 - 비동기
			// title="안녕"&content="반가워"&writer="호두아빠"
			var fData = $("#frm").serialize();
			
			$.ajax({
				url : "book/new",
				type : "post",
				data : fData,
				success : loadList,
				error : function(){	alert("error")}
				
			});
			
			$("#fclear").trigger("click");
		}
		
		function goContent(idx){
			$("#boardList").css("display","none");
			$("#wform").css("display","none");
			$("#uform").css("display","block");
			
			$("#num").attr("readonly",true);
			$("#title").attr("readonly",true);
			$("#author").attr("readonly",true);
			$("#company").attr("readonly",true);
			$("#isbn").attr("readonly",true);
			
			
			$.ajax({
				url : "book/" + idx,
				type : "get",
				dataType : "json",
				success : function(data){
					$("#num").val(data.num);
					$("#title").val(data.title);
					$("#author").val(data.author);
					$("#company").val(data.company);
					$("#isbn").val(data.isbn);
					$("#count").val(data.count);
				},
				error : function(){alert("error");}
			});
				
// 				$("#c"+idx).css("display","table-row");
				
			
		}
	
		function goDelete(num){
			$.ajax({
				url : "book/" + num,
				type : "delete",
				data : {"num" : num},
				success : loadList,
				error : function(){alert("error");}
				
			});
		}
	

		
		 function goUpdate(){
// 	         var title = $("#title").val();
// 	         var company = $("#company").val();
// 	         var author = $("#author" ).val();
// 	         var isbn = $("#isbn").val();
	         var num = $("#num").val();
	         var count = $("#count").val();
	     
	         // console.log(title + "/" + content + "/" + writer);
	         // boardUpdate.do로 요청을 통해 게시글을 수정하고
	         // 수정된 게시글 다시 불러와서 적용시키시오 (숙제)
	         
	         $.ajax({
	        	url : "book/update",
	        	type : "put",
	        	contentType : "application/json;charset=utf-8", // put방식의 비동기통신일 경우 json타입 명시해줘야하고
	        	data : JSON.stringify({"num": num , "count":count}) , // 문자열로 바꿔서 보내줘야함
	        	success : loadList,
	        	error : function(){alert("error");}
	         });
	         
	        
	       
	      }

	</script>
	
</body>
</html>