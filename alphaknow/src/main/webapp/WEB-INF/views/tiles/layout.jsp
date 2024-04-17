<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title><tiles:insertAttribute name="title" /></title>
</head>

<link rel="stylesheet" href="/alphaknow/resources/css/tiles/layout.css">

<body>
	<div class="wrap">

		<tiles:insertAttribute name="header" />


		<tiles:insertAttribute name="nav" />

		<div class="layout_content">
			<tiles:insertAttribute name="content" />
		</div>

		<tiles:insertAttribute name="footer" />

	</div>
</body>
</html>