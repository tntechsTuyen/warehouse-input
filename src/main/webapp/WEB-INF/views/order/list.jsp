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
				<li class="breadcrumb-item"><a href="javascript:;">Quản lý đơn hàng</a></li>
				<li class="breadcrumb-item active">Danh sách</li>
			</ol>

			<h1 class="page-header d-flex align-items-center">
			  Quản lý đơn hàng
			</h1>


			<!-- Panel search -->
			<div class="panel panel-inverse">
				<div class="panel-heading">
			    	<h4 class="panel-title">Tìm kiếm</h4>
				    <div class="panel-heading-btn">
				    	<a href="javascript:;" class="btn btn-xs btn-icon btn-default" data-toggle="panel-expand" ><i class="fa fa-expand"></i></a>
				    	<a href="javascript:;" class="btn btn-xs btn-icon btn-warning" data-toggle="panel-collapse" ><i class="fa fa-minus"></i></a>
				    	<a href="javascript:;" class="btn btn-xs btn-icon btn-danger" data-toggle="panel-remove" ><i class="fa fa-times"></i></a>
				    </div>
				</div>
				<div class="panel-body">
					<form:form modelAttribute="search" method="GET">
						<div class="row">
							<div class="col-5">
								<button type="submit" class="btn btn-primary"><i class="fa fa-search me-2"></i>Tìm kiếm</button>
								<c:if test="${list.size() == 0}">
									<button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal"><i class="fa fa-plus me-2"></i>Thêm mới</button>
								</c:if>
							</div>
						</div>
					</form:form>
				</div>
			</div>
			<!-- * Panel search -->

			<div class="panel panel-inverse">
				<div class="panel-heading">
			    	<h4 class="panel-title">Danh sách</h4>
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
								<th>Số HD</th>
								<th>NCC</th>
								<th>Nhân viên</th>
								<th>Trạng thái</th>
								<th>Tổng tiền</th>
								<th>Ngày tạo</th>
								<th></th>
							</tr>
						</thead>
						<tbody>
							<c:if test="${list.size() > 0}">
								<c:forEach items="${list}" var="item" varStatus="loop">
	                            	<tr>
	                            		<td>${loop.index + 1}</td>
	                            		<td>${item.code}</td>
	                            		<td>${item.idSupplier}</td>
	                            		<td>${item.idUser}</td>
	                            		<td>${item.idStatus}</td>
	                            		<td>${item.totalPrice}</td>
	                            		<td>${item.createdDate}</td>
	                            		<td><a href="/supplier/${item.id}/order" class="btn btn-primary"><i class="fas fa-arrow-alt-circle-right"></i></a></td>
	                            	</tr>
	                            </c:forEach>
							</c:if>
                            <c:if test="${list.size() == 0}">
                            	<tr>
                            		<td class="text-center" colspan="8"><i class="fas fa-inbox"></i> Không có dữ liệu</td>
                            	</tr>
                            </c:if>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>

</body>
</html>
