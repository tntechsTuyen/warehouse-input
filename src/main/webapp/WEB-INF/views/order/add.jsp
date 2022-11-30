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
				<li class="breadcrumb-item active">Tạo đơn hàng</li>
			</ol>

			<h1 class="page-header d-flex align-items-center">
			  Tạo đơn hàng
			</h1>
			<div class="row">
				<div class="col-4">
					<div class="panel panel-inverse">
						<div class="panel-heading">
					    	<h4 class="panel-title">Danh sách sản phẩm</h4>
						    <div class="panel-heading-btn">
						    	<a href="javascript:;" class="btn btn-xs btn-icon btn-default" data-toggle="panel-expand"><i class="fa fa-expand"></i></a>
						    	<a href="javascript:;" class="btn btn-xs btn-icon btn-warning" data-toggle="panel-collapse"><i class="fa fa-minus"></i></a>
						    	<a href="javascript:;" class="btn btn-xs btn-icon btn-danger" data-toggle="panel-remove"><i class="fa fa-times"></i></a>
						    </div>
						</div>
						<div class="panel-body">
							<div class="input-group mb-3">
                                <span class="input-group-text">Tìm kiếm</span>
                                <input id="ip-search" class="form-control"/>
                                <button class="btn btn-primary btn-add-product d-none"><i class="fas fa-plus-circle me-1"></i>Add</button>
                            </div>
							<table id="tbl-product" class="table table-bordered">
								<thead>
									<tr>
										<th>#</th>
										<th>Mã</th>
										<th>Tên</th>
										<th>Giá</th>
										<th></th>
									</tr>
								</thead>
								<tbody>
									<c:if test="${products.size() > 0}">
										<c:forEach items="${products}" var="item" varStatus="loop">
			                            	<tr>
			                            		<td>${loop.index + 1}</td>
			                            		<td>${item.code}</td>
			                            		<td>${item.name}</td>
			                            		<td>${item.price}</td>
			                            		<td><button class="btn btn-info btn-add-product" data-id="${item.id}" data-code="${item.code}" data-name="${item.name}" data-price="${item.price}"><i class="fas fa-plus-circle"></i></button></td>
			                            	</tr>
			                            </c:forEach>
									</c:if>
		                            <c:if test="${products.size() == 0}">
		                            	<tr>
		                            		<td class="text-center" colspan="5"><i class="fas fa-inbox"></i> Không có dữ liệu</td>
		                            	</tr>
		                            </c:if>
								</tbody>
							</table>
						</div>
					</div>
				</div>
				<div class="col-8">
					<div class="panel panel-inverse">
						<div class="panel-heading">
					    	<h4 class="panel-title">Thông tin đơn hàng</h4>
						    <div class="panel-heading-btn">
						    	<a href="javascript:;" class="btn btn-xs btn-icon btn-default" data-toggle="panel-expand"><i class="fa fa-expand"></i></a>
						    	<a href="javascript:;" class="btn btn-xs btn-icon btn-warning" data-toggle="panel-collapse"><i class="fa fa-minus"></i></a>
						    	<a href="javascript:;" class="btn btn-xs btn-icon btn-danger" data-toggle="panel-remove"><i class="fa fa-times"></i></a>
						    </div>
						</div>
						<div class="panel-body">
							<form method="POST">
							<table id="tbl-product-selected" class="table table-bordered m-0">
			                  	<thead>
				                    <tr class="bg-info">
				                      	<th>Số seri</th>
				                      	<th>Tên SP</th>
				                      	<th>Giá(đ)</th>
				                      	<th>Số lượng</th>
				                      	<th>Thành tiền(đ)</th>
				                      	<th></th>
				                    </tr>
			                  	</thead>
			                  	<tbody>
									<c:if test="${orderDetails.size() > 0}">
										<c:forEach items="${orderDetails}" var="item" varStatus="loop">
			                            	<tr data-id-product="${item.id}">
			                            		<td>${item.code}</td>
			                            		<td>${item.name}</td>
			                            		<td>${item.price}</td>
			                            		<td>${item.qty}</td>
			                            		<td>${item.price * item.qty}</td>
			                            		<td><button class="btn btn-danger"><i class="fas fa-times-circle"></i></button></td>
			                            	</tr>
			                            </c:forEach>
									</c:if>
		                            <c:if test="${orderDetails.size() == 0}">
		                            	<tr>
		                            		<td data-type="null" class="text-center" colspan="6"><i class="fas fa-inbox"></i> Không có dữ liệu</td>
		                            	</tr>
		                            </c:if>
			                  	</tbody>
			                </table>
			            	</form>
						</div>
					</div>
				</div>
			</div>
			
		</div>
	</div>

	<!-- Modal -->
    <form:form modelAttribute="productForm" method="POST">
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
<script>
	$("#ip-search").keyup(function(){
		const text = $(this).val()
		var total = 0
		$("#tbl-product>tbody tr").each(function(){
			console.log($(this))
			if($(this).text().includes(text)) {
				total++
				$(this).removeClass("d-none");
			}else{
				$(this).addClass("d-none");
			}
		})
		if(total==0){
			$(".btn-add-product").removeClass("d-none")
		}else{
			$(".btn-add-product").addClass("d-none")
		}

	})
	$(".btn-add-product").click(function(){
		const data = {
			id: $(this).data("id"),
			code: $(this).data("code"),
			name: $(this).data("name"),
			price: $(this).data("price")
		}
		if($(`[name="qty"]`).length > 0) {
			alert("Bạn chưa lưu dữ liệu")
			return
		}
		if($("#tbl-product-selected").find(`[data-type="null"]`).length > 0){
			$("#tbl-product-selected tbody").html("")
		}
		if($("#tbl-product-selected").find(`[data-id-product="`+data.id+`"]`).length == 0){
			$("#tbl-product-selected tbody").append(itemDetailOrder(data))
		}else{
			alert("Sản phẩm đã tồn tại")
		}
	})

	function itemDetailOrder(data){
		return `
      		<tr data-id-product="`+data.id+`">
      			<input type="hidden" name="idOrderIn" value="${idOrder}">
      			<input type="hidden" name="idSupplier" value="${idSupplier}">
      			<input type="hidden" name="idProduct" value="`+data.id+`">
      			<input type="hidden" name="price" value="`+data.price+`">
      			<td>`+data.code+`</td>
      			<td>`+data.name+`</td>
      			<td>`+data.price+`</td>
      			<td><input type="number" name="qty" data-price="`+data.price+`" value="1" ></td>
      			<td id="price-qty">`+data.price+`</td>
      			<td>
      				<button type="button" class="btn btn-danger">Hủy</button>
      				<button type="submit" class="ms-1 btn btn-primary">Lưu</button>
  				</td>
      		</tr>`
	}
</script>
</html>
