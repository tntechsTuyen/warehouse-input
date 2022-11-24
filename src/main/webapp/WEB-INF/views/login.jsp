<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page isELIgnored="false"%>
<html>
<%@ include file="/WEB-INF/common/css.jsp"%>
<%@ include file="/WEB-INF/common/js.jsp"%>
<body class="pace-top">
	<div id="loader" class="app-loader">
		<span class="spinner"></span>
	</div>
	<div id="app" class="app">
		<div class="login login-v1">
			<div class="login-container">
				<div class="login-header">
					<div class="brand">
						<div class="d-flex align-items-center">
							<span class="logo"></span> <b>Đăng nhập</b>
						</div>
						<small>Hệ thống quản lý kho</small>
					</div>
					<div class="icon">
						<i class="fa fa-lock"></i>
					</div>
				</div>

				<div class="login-body">
					<div class="login-content fs-13px">
						<form:form modelAttribute="loginForm" method="POST">
							<div class="form-floating mb-20px">
								<form:input path="username" type="text" cssClass="form-control fs-13px h-45px" placeholder="Username" />
								<label for="username" cssClass="d-flex align-items-center py-0">Username</label>
							</div>
							<div class="form-floating mb-20px">
								<form:input path="password" type="password" class="form-control fs-13px h-45px" placeholder="Password" />
								<label for="password" class="d-flex align-items-center py-0">Password</label>
							</div>
							<div class="login-buttons">
								<button type="submit" class="btn h-45px btn-success d-block w-100 btn-lg">Sign me in</button>
							</div>
						</form:form>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
