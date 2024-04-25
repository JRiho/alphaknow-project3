<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<link rel="stylesheet" href="/alphaknow/resources/css/tiles/nav.css">
<script src="/alphaknow/resources/js/tiles/nav.js"></script>
	
<!-- 네비게이션 링크 따야함 -->
<nav>
	<ul>
		<li id="boardLi"><a href="/alphaknow/board">게시판</a></li>
		<li>공정기준정보
			<ul>
				<li><a href="/alphaknow/processcode">공정코드관리</a></li>
				<li><a href="/alphaknow/processproduce">작업표준서</a></li>
				<li><a href="/alphaknow/equipment">장비정보관리</a></li>
				<li><a href="/alphaknow/processproduct">제품정보관리</a></li>
			</ul>
		</li>
		<li>재고관리
			<ul>
				<li><a href="/alphaknow/receivingManagement/list">입고관리</a></li>
				<li><a href="/alphaknow/inventoryManagement/list">보유재고관리</a></li>
				<li><a href="/alphaknow/deliveringManagement/list">출고관리</a></li>
			</ul>
		</li>
		<li>생산관리
			<ul>
				<li><a href="/alphaknow/ppm/select">생산계획관리</a></li>
				<li><a href="/alphaknow/pom/select">생산지시관리</a></li>
			</ul>
		</li>
		<li id="chartLi"><a href="/alphaknow/chart/ppc">실적현황</a></li>
		<li id="employeeLi"><a href="/alphaknow/employee">사원관리/등록</a></li>
	</ul>
</nav>