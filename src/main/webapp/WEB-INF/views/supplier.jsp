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
			    	<h4 class="panel-title">Danh sách <input type="text" name="" placeholder="Tìm kiếm" id="ip-search"></h4>
				    <div class="panel-heading-btn">
				    	<a href="javascript:;" class="btn btn-xs btn-icon btn-default" data-toggle="panel-expand"><i class="fa fa-expand"></i></a>
				    	<a href="javascript:;" class="btn btn-xs btn-icon btn-warning" data-toggle="panel-collapse"><i class="fa fa-minus"></i></a>
				    	<a href="javascript:;" class="btn btn-xs btn-icon btn-danger" data-toggle="panel-remove"><i class="fa fa-times"></i></a>
				    </div>
				</div>
				<div class="panel-body">
					<table id="tbl-supplier" class="table table-bordered table-hover">
						<thead>
							<tr>
								<th>#</th>
								<th>Mã</th>
								<th>Tên</th>
								<th>Địa chỉ</th>
								<th>SĐT</th>
								<th></th>
							</tr>
						</thead>
						<tbody>
                            <c:forEach items="${list}" var="item" varStatus="loop">
                            	<tr>
                            		<td>${loop.index + 1}</td>
                            		<td>${item.code}</td>
                            		<td>${item.name}</td>
                            		<td>${item.address}</td>
                            		<td>${item.phone}</td>
                            		<td><a href="/supplier/${item.id}/order" class="btn btn-primary"><i class="fas fa-arrow-alt-circle-right"></i></a></td>
                            	</tr>
                            </c:forEach>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
</body>
<script>
	$("#ip-search").keyup(function(){
		const text = $(this).val()
	})

	$("#tbl-supplier>tbody tr").each(function(){
		console.log($(this).text().includes("NCCDDD"))
	})
</script>
</html>
