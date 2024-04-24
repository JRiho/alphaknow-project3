<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, java.util.ArrayList"%>
<%@ page import="java.util.List"%>
<%@ page import="com.spring.alphaknow.dto.boardDTO.BoardDTO"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<script src="https://code.jquery.com/jquery-3.7.1.js" integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4=" crossorigin="anonymous"></script>
<link rel="stylesheet" href="/alphaknow/resources/css/boardWrite.css">
<script src="/alphaknow/resources/js/script.js"></script>
<script src="/alphaknow/resources/js/board.js"></script>

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
	top: 80%;
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
	background: #f8f8f8 url('/alphaknow/resources/img/page_pprev.png')
		no-repeat center center;
	margin-left: 0;
}

.page_nation .prev {
	background: #f8f8f8 url('/alphaknow/resources/img/page_prev.png')
		no-repeat center center;
	margin-right: 7px;
}

.page_nation .next {
	background: #f8f8f8 url('/alphaknow/resources/img/page_next.png')
		no-repeat center center;
	margin-left: 7px;
}

.page_nation .nnext {
	background: #f8f8f8 url('/alphaknow/resources/img/page_nnext.png')
		no-repeat center center;
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

a:hover {
	cursor: pointer;
}
</style>

<body>

	<div id="boardContent">

		<div class="main">

			<div id="boardWrite">
				<button type="button" id="boardWrite_btn">
					<img src="/alphaknow/resources/img/boardWrite_icon.png">
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
					</thead>
					<tbody>
						<c:if test="${ not empty list }">
							<c:forEach var="board" items="${list}" varStatus="num">
								<tr>
									<td align="center" width="5%"><input type="checkbox"
										class="checkbox" name="selectedBoards"></td>
									<td class="selBoardNum">${board.boardNum}</td>
									<td class="selBoardTitle"><a class="detail_btn">${board.boardTitle}</a><input type="hidden" class="selectBoardNum" value="${ board.boardNum }"></td>
									<td class="selEmployeeKey">${board.employeeKey}</td>
									<td class="selEmployeeName">${board.employeeName}</td>
									<td class="selCreatedDate">${board.createdDate}</td>
									<td class="selBoardViews">${board.boardViews}</td>
								</tr>
							</c:forEach>
						</c:if>
						<c:if test="${ empty list }">
							<tr>
								<th colspan=7>표시할 게시물이 없습니다.</th>
							</tr>
						</c:if>
					</tbody>
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
			<form action="/alphaknow/board/insert" method="post">
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
										<input type="text" name="employeeName">
									</div>
								</div>
							</li>
							<li id="write_employee_code" class="whole_row">
								<div class="title">사원코드</div>
								<div class="form">
									<div class="control_set">
										<input type="text" name="employeeKey">
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

			</form>
		</div>



		<div id="pop_detail">
			<form id="myForm" method="get">
			<input type="hidden" name="boardNum" id="selBoardNo">
				<div id="pop_header2">
					<span>게시글 상세</span>
				</div>

				<div id="pop_title2">게시글 상세</div>

				<div id="pop_content2">
					<div class="wrapper_ul">
						<ul class="wrapper_li">
							<li id="title_detail" class="whole_row">
								<div class="title">제목</div>
								<div class="form">
									<div class="titleDetail"></div>
								</div>
							</li>
							<li id="writer_detail" class="whole_row">
								<div class="title">작성자</div>
								<div class="form">
									<div class="writerDetail"></div>
								</div>
							</li>
							<li id="employeeCode_detail" class="whole_row">
								<div class="title">사원코드</div>
								<div class="form">
									<div class="employeeKey"></div>
								</div>
							</li>
							<li id="content_detail" class="whole_row">
								<div class="title">내용</div>
								<div class="form">
									<div class="contentDetail"></div>
								</div>
							</li>
						</ul>
					</div>
				</div>

				<div id="btns2">
					<button type="button" id="update">수정하기</button>
					<button type="button" id="updateComplete">수정완료</button>
					<button type="button" id="delete">삭제하기</button>
					<button type="button" id="close2">닫기</button>
				</div>
			</form>
		</div>
		
	</div>

</body>

</html>