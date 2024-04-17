<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, java.util.ArrayList"%>
<%@ page import="java.util.List"%>
<%@ page import="board.BoardDTO"%>

<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Document</title>
<link rel="stylesheet" href="css/boardWrite.css">
<script src="js/script.js"></script>
</head>

<style>
#boardContent {
	width: 90%;
	height: 84vh;
	margin: 0 auto;
	box-sizing: border-box;
	position: relative;
}

#boardWrite {
	display: inline-block;
	position: relative;
	align-items: center;
	width: 20%;
	margin-top: 5%;
	margin-left: 3%;
}

#boardWrite span {
	position: absolute;
	margin-top: 11%;
	margin-left: 1%;
	font-weight: bold;
	cursor: pointer;
}

#boardWrite_btn {
	align-items: center;
	justify-content: center;
	width: 40px;
	height: 40px;
	padding: 0;
	cursor: pointer;
	background-color: white;
	border: none;
	margin-top: 5%;
	margin-left: 4%;
}

#boardWrite_btn img {
	max-width: 100%;
	max-height: 100%;
}

.boardSearch {
	display: inline-block;
	position: relative;
	align-items: center;
	width: 30%;
	margin-top: 5%;
	margin-left: 46%;
}

#searchOption {
	height: 25px;
	border: 1px solid rgba(0, 0, 0, 0.2);
	border-radius: 5px;
	outline: none;
}

#searchOption:hover {
	outline: none;
	border: 1px solid rgb(50, 50, 230);
	cursor: pointer;
}

#searchOption:focus {
	outline: none;
	border: 1px solid rgb(50, 50, 230);
}

#searchText {
	width: 50%;
	height: 25px;
	border: 1px solid rgba(0, 0, 0, 0.2);
	border-radius: 5px;
}

#searchText:hover {
	outline: none;
	border: 1px solid rgb(50, 50, 230);
}

#searchText:focus {
	outline: none;
	border: 1px solid rgb(50, 50, 230);
}

#searchBtn {
	width: 16%;
	height: 25px;
	background-color: #6495ED;
	border: none;
	color: #fff;
	border-radius: 5px;
	cursor: pointer;
	/* 배경 이미지 애니메이션*/
	transition: background-color 0.3s ease;
}

#searchBtn:hover {
	background-color: #4169E1;
}

#boardList {
	width: 100%;
	height: 30px;
	line-height: 30px;
	margin-top: 1%;
	border-top: 1px solid #999;
	border-bottom: 1px solid #999;
	text-align: center;
}

.page_wrap {
	position: absolute;
	text-align: center;
	font-size: 0;
	top: 88%;
	left: 40%;
}

.page_nation {
	display: inline-block;
}

.page_nation .none {
	display: none;
}

.page_nation a {
	display: block;
	margin: 0 3px;
	float: left;
	border: 1px solid #e6e6e6;
	width: 28px;
	height: 28px;
	line-height: 28px;
	text-align: center;
	background-color: #fff;
	font-size: 13px;
	color: #999999;
	text-decoration: none;
}

.page_nation a:hover {
	border: 1px solid #1f48d4;
}

.page_nation .arrow {
	border: 1px solid #ccc;
}

.page_nation .pprev {
	background: #f8f8f8 url('img/page_pprev.png') no-repeat center center;
	margin-left: 0;
}

.page_nation .prev {
	background: #f8f8f8 url('img/page_prev.png') no-repeat center center;
	margin-right: 7px;
}

.page_nation .next {
	background: #f8f8f8 url('img/page_next.png') no-repeat center center;
	margin-left: 7px;
}

.page_nation .nnext {
	background: #f8f8f8 url('img/page_nnext.png') no-repeat center center;
	margin-right: 0;
}

.page_nation a.active {
	background-color: #1f48d4;
	color: #fff;
	border: 1px solid #1f48d4;
}

#deleteBtn {
	position: absolute;
	height: 30px;
	top: 85%;
	left: 90%;
	background-color: #6495ED;
	border: none;
	color: #fff;
	border-radius: 5px;
	cursor: pointer;
	/* 배경 이미지 애니메이션*/
	transition: background-color 0.3s ease;
}

#deleteBtn:hover {
	background-color: #4169E1;
}
</style>

<script>
	window.addEventListener('load', function() {
		let pop_main = document.getElementById("pop_main");
		document.getElementById("boardWrite_btn").addEventListener("click",
				function() {
					pop_main.style.display = "block";
				});

		document.querySelector("#pop_main #close").addEventListener("click",
				function() {
					pop_main.style.display = "none";
				});
	});
		
		window.addEventListener('load', function () {
            document.querySelector('#selectAll').addEventListener('click', function () {
               console.log("click")
               let checkboxes = document.querySelectorAll(".checkbox");

               if (document.querySelector('#selectAll').checked == true) {
                  checkboxes.forEach(function (checkbox) {
                     checkbox.checked = true;
                  });
               } else {
                  checkboxes.forEach(function (checkbox) {
                     checkbox.checked = false;
                  });
               }
            });

         });
		
		window.addEventListener('load', function() {
		    document.getElementById('deleteBtn').addEventListener('click', function() {
		        const checkboxes = document.querySelectorAll('.checkbox');
		        const selectedBoards = [];
		        checkboxes.forEach(function(checkbox) {
		            if (checkbox.checked) {
		                selectedBoards.push(checkbox.value);
		            }
		        });
		        if (selectedBoards.length > 0) {
		            const form = document.createElement('form');
		            form.method = 'POST';
		            form.action = '/alphaknow/delete';
		            selectedBoards.forEach(function(boardId) {
		                const input = document.createElement('input');
		                input.type = 'hidden';
		                input.name = 'selectedBoard';
		                input.value = boardId;
		                form.appendChild(input);
		            });
		            document.body.appendChild(form);
		            form.submit();
		        } else {
		            alert('삭제할 게시글을 선택해주세요.');
		        }
		    });
		});

         //     document.getElementById('deleteBtn').addEventListener('click', function() {
         //         const selectedBoards = document.querySelectorAll('.checkbox:checked');
         //         const selectedBoardIds = Array.from(selectedBoards).map(function(checkbox) {
         //             return checkbox.value;
         //         });

         //         // 선택된 게시글의 ID를 DeleteBoardServlet으로 전달하여 삭제 요청을 보냄
         //         fetch('/alphaknow/delete', {
         //             method: 'POST',
         //             headers: {
         //                 'Content-Type': 'application/x-www-form-urlencoded'
         //             },
         //             body: 'boardNum=' + selectedBoardIds.join('&boardNum=')
         //         }).then(function(response) {
         //             // 응답 처리
         //             if (response.ok) {
         //                 // 삭제가 성공적으로 이루어진 경우, 페이지 리로드
         //                 window.location.reload();
         //             } else {
         //                 // 삭제가 실패한 경우, 사용자에게 알림을 보여줄 수 있음
         //                 alert('게시글 삭제 실패');
         //             }
         //         }).catch(function(error) {
         //             console.error('Error:', error);
         //         });
         //     });
         // });
	
</script>

<body>
	<form action="/alphaknow/board" method="post">

		<%@ include file="../mainheader.jsp"%>


		<div id="boardContent">

			<div class="main">

				<div id="boardWrite">
					<button type="button" id="boardWrite_btn">
						<img src="img/boardWrite_icon.png">
					</button>
					<label for="boardWrite_btn"><span>새글쓰기</span></label>
				</div>

				<div class="boardSearch">
					<select id="searchOption">
						<option value="title">제목</option>
						<option value="title">작성자</option>
					</select> <input type="text" id="searchText">
					<button id="searchBtn">검색</button>
				</div>

				<div>
					<table id="boardList">
						<thead>
							<tr height="40px"
								style="line-height: 40px; margin-top: 1%; border-top: 1px solid #999; border-bottom: 1px solid #999; background-color: #cecece; text-align: center;">
								<td align="center" width="5%"><input type="checkbox"
									id="selectAll"></td>
								<td width="10%">번호</td>
								<td>제목</td>
								<td width="10%">사원코드</td>
								<td width="10%">작성자</td>
								<td width="20%">작성일</td>
								<td width="10%">조회</td>
							</tr>
							<%
							List<BoardDTO> boardList = (List<BoardDTO>) request.getAttribute("boardList");
							if (boardList != null) {
								for (BoardDTO board : boardList) {
							%>
							<tr>
								<td align="center" width="5%"><input type="checkbox"
									class="checkbox" name="selectedBoards"
									value="<%=board.getBoardNum()%>"></td>
								<td><%=board.getBoardNum()%></td>
								<td><%=board.getBoardTitle()%></td>
								<td>1234</td>
								<td><%=board.getBoardWriter()%></td>
								<td>2024-03-06</td>
								<td><%=board.getBoardViews()%></td>
							</tr>
							<%
							}
							}
							%>
						
					</table>
				</div>

				<div class="page_wrap">
					<div class="page_nation">
						<a class="pprev" href="#"></a> <a class="prev" href="#"></a> <a
							href="#" class="active">1</a> <a href="#">2</a> <a href="#">3</a>
						<a class="next" href="#"></a> <a class="nnext" href="#"></a>
					</div>

				</div>

			</div>


			<div id="pop_main">

				<div id="pop_header">
					<span>게시글 작성</span>
				</div>

				<div id="pop_title">게시글 작성</div>

				<div id="pop_content">
					<div class="wrapper_ul">
						<ul class="wrapper_li">
							<li id="write_title" class="whole_row">
								<div class="title">제목</div>
								<div class="form">
									<div class="control_set">
										<input type="text" name="boardTitle">
									</div>
								</div>
							</li>
							<li id="write_writer" class="whole_row">
								<div class="title">작성자</div>
								<div class="form">
									<div class="control_set">
										<input type="text" name="boardWriter">
									</div>
								</div>
							</li>
							<li id="write_employee_code" class="whole_row">
								<div class="title">사원코드</div>
								<div class="form">
									<div class="control_set">
										<input type="text" name="employee_code">
									</div>
								</div>
							</li>
							<li id="write_content" class="whole_row">
								<div class="title">내용</div>
								<div class="form">
									<div class="control_set">
										<textarea name="boardContent"></textarea>
									</div>
								</div>
							</li>
						</ul>
					</div>
				</div>

				<div id="btns">
					<button type="submit" id="save">저장</button>
					<button type="reset" id="reset">다시쓰기</button>
					<button type="button" id="close">닫기</button>
				</div>

			</div>


		</div>
	</form>



</body>

</html>