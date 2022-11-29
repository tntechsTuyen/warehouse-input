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
			  Quản lý nhà cung ứng
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
							<div class="col-3">
								<div class="input-group mb-3">
									<span class="input-group-text">Tên nhà cung ứng</span>
									<form:input path="name" cssClass="form-control"/>
								</div>
							</div>
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
								<th>Mã</th>
								<th>Tên</th>
								<th>Địa chỉ</th>
								<th>SĐT</th>
								<th></th>
							</tr>
						</thead>
						<tbody>
							<c:if test="${list.size() > 0}">
								<c:forEach items="${list}" var="item" varStatus="loop">
	                            	<tr>
	                            		<td>${loop.index + 1}</td>
	                            		<td>${item.code}</td>
	                            		<td>${item.name}</td>
	                            		<td>${item.address}</td>
	                            		<td>${item.phone}</td>
	                            		<td><a href="/order/add?idSupplier=${item.id}" class="btn btn-primary"><i class="fas fa-arrow-alt-circle-right"></i></a></td>
	                            	</tr>
	                            </c:forEach>
							</c:if>
                            <c:if test="${list.size() == 0}">
                            	<tr>
                            		<td class="text-center" colspan="6"><i class="fas fa-inbox"></i> Không có dữ liệu</td>
                            	</tr>
                            </c:if>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>

	<!-- Modal -->
    <form:form modelAttribute="supplierForm" method="POST">
	<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
	  <div class="modal-dialog">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h5 class="modal-title" id="exampleModalLabel">Modal title</h5>
	        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
	      </div>
	      <div class="modal-body">
        	<div class="form-floating">
			  <form:input path="code" type="text" cssClass="form-control fs-15px" />
			  <label for="code" class="d-flex align-items-center fs-13px">
			    Mã nhà cung ứng
			  </label>
			</div>
        	<div class="form-floating mt-2">
			  <form:input path="name" type="text" cssClass="form-control fs-15px" />
			  <label for="name" class="d-flex align-items-center fs-13px">
			    Tên nhà cung ứng
			  </label>
			</div>
        	<div class="form-floating mt-2">
			  <form:input path="address" type="text" cssClass="form-control fs-15px" />
			  <label for="address" class="d-flex align-items-center fs-13px">
			    Địa chỉ
			  </label>
			</div>
        	<div class="form-floating mt-2">
			  <form:input path="phone" type="number" cssClass="form-control fs-15px" />
			  <label for="phone" class="d-flex align-items-center fs-13px">
			    Số điện thoại
			  </label>
			</div>
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
	        <button type="submit" class="btn btn-primary">Save changes</button>
	      </div>
	    </div>
	  </div>
	</div>
    </form:form>
	<!-- * Modal -->
</body>
</html>
