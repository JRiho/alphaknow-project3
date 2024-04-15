
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
// 세션을 가져와서 무효화합니다.
session.invalidate();

// 로그아웃 후 로그인 페이지로 리디렉션합니다.
response.sendRedirect("project_login.jsp");
%>
