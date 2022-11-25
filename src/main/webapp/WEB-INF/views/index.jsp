<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page isELIgnored="false"%>
<html>
<%@ include file="/WEB-INF/common/css.jsp"%>
<%@ include file="/WEB-INF/common/js.jsp"%>
<body class="pace-top">

	<%@ include file="/WEB-INF/common/header.jsp"%>
	<%@ include file="/WEB-INF/common/sidebar.jsp"%>

	<div id="loader" class="app-loader">
		<span class="spinner"></span>
	</div>
	<div id="app" class="app">
		<a href="/supplier" class="btn btn-primary">Create new</a href="/supplier">
	</div>
</body>
</html>
