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
		<h1>Danh sách đơn hàng</h1>
		<div>
			<table id="tbl-supplier" class="table table-bordered table-hover">
				<thead>
					<tr>
						<th>#</th>
						<th>Số HD</th>
						<th>NCC</th>
						<th>Trạng thái</th>
						<th>Tổng tiền</th>
						<th>Ngày tạo</th>
					</tr>
				</thead>
				<tbody>
					<c:if test="${list.size() > 0}">
						<c:forEach items="${list}" var="item" varStatus="loop">
	                    	<tr>
	                    		<td>${loop.index + 1}</td>
	                    		<td>${item.code}</td>
	                    		<td>${item.idSupplier}</td>
	                    		<td>${item.idStatus}</td>
	                    		<td>${item.totalPrice}</td>
	                    		<td>${item.createdDate}</td>
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
</body>
</html>
