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

	<div id="app" class="app app-header-fixed app-sidebar-fixed">
		<%@ include file="/WEB-INF/common/header.jsp"%>
		<%@ include file="/WEB-INF/common/sidebar.jsp"%>
		
		<div id="content" class="app-content">
			<ol class="breadcrumb float-xl-end">
				<li class="breadcrumb-item"><a href="javascript:;">Trang chủ</a></li>
				<li class="breadcrumb-item"><a href="javascript:;">Quản lý nhà cung ứng</a></li>
				<li class="breadcrumb-item active">Danh sách</li>
			</ol>

			<h1 class="page-header d-flex align-items-center">
			  Quản lý nhà cung ứng <small class="ms-2"><a href="/admin/user/add" class="btn btn-success btn-sm"><i class="fa fa-plus-circle me-2"></i> Thêm mới</a></small>
			</h1>

			<div class="panel panel-inverse">
				<div class="panel-heading">
			    	<h4 class="panel-title">Danh sách <input type="text" name="" placeholder="Tìm kiếm"></h4>
				    <div class="panel-heading-btn">
				    	<a href="javascript:;" class="btn btn-xs btn-icon btn-default" data-toggle="panel-expand"><i class="fa fa-expand"></i></a>
				    	<a href="javascript:;" class="btn btn-xs btn-icon btn-warning" data-toggle="panel-collapse"><i class="fa fa-minus"></i></a>
				    	<a href="javascript:;" class="btn btn-xs btn-icon btn-danger" data-toggle="panel-remove"><i class="fa fa-times"></i></a>
				    </div>
				</div>
				<div class="panel-body">
					<table class="table table-bordered table-hover">
						<thead>
							<tr>
								<th>#</th>
								<th>Tài khoản</th>
								<th>Tên</th>
								<th>Số ĐT</th>
								<th>Email</th>
								<th>Ngày sinh</th>
								<th>Giới tính</th>
								<th>Quyền hạn</th>
								<th>Ngày tạo</th>
								<th></th>
							</tr>
						</thead>
						<tbody>
							
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
</body>
<script>
	$("#ip-customer-phone").keyup(delay(async function(e){
        
    }, 1500))
</script>
</html>
