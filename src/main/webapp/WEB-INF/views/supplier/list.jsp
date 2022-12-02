<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<title></title>
	<link rel="stylesheet" type="text/css" href="/resources/bootstrap/css/bootstrap.min.css">
	<script src="/resources/bootstrap/js/bootstrap.min.js"></script>
	<script src="/resources/jquery/jquery.min.js"></script>
</head>
<body>

	<div id="content" class="container">

		<ul class="list-group list-group-horizontal mt-2">
			<li class="list-group-item"><a href="/supplier">Nhà cung cấp</a></li>
			<li class="list-group-item"><a href="/order">Đơn hàng</a></li>
		</ul>

		<h1>Quản lý nhà cung ứng</h1>

		<!-- Panel search -->
		<div class="row">
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
							<button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#modalAdd"><i class="fa fa-plus me-2"></i>Thêm mới</button>
						</c:if>
					</div>
				</div>
			</form:form>
		</div>
		<!-- * Panel search -->

		<div class="row">
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
                        		<td><a href="/order/add?idSupplier=${item.id}" class="btn btn-primary">Tạo đơn</a></td>
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

	<!-- Modal -->
    <form:form modelAttribute="supplierForm" method="POST">
	<div class="modal fade" id="modalAdd" tabindex="-1" aria-labelledby="modalAddLabel" aria-hidden="true">
	  <div class="modal-dialog">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h5 class="modal-title" id="modalAddLabel">Modal title</h5>
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
