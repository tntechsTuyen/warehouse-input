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
		<h1>Tạo đơn hàng</h1>
		<div class="row">
			<div class="col-4">
		    	<h4 class="panel-title">Danh sách sản phẩm</h4>
				<div class="input-group mb-3">
	                <span class="input-group-text">Tìm kiếm</span>
	                <input id="ip-search" class="form-control"/>
	                <button class="btn btn-primary btn-create-product d-none" data-bs-toggle="modal" data-bs-target="#modalAddNew"><i class="fas fa-plus-circle me-1"></i>Create</button>
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
	                        		<td><button class="btn btn-info btn-add-product" data-id="${item.id}" data-code="${item.code}" data-name="${item.name}" data-price="${item.price}">+</button></td>
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

			<div class="col-8">
		    	<h4 class="panel-title">Thông tin đơn hàng</h4>
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
	                            		<td><a href="/order/detail/remove?id=${item.oidId}&idOrderIn=${idOrder}" class="btn btn-danger">x</a></td>
	                            	</tr>
	                            </c:forEach>
							</c:if>
	                        <c:if test="${orderDetails.size() == 0}">
	                        	<tr>
	                        		<td data-type="null" class="text-center" colspan="6"><i class="fas fa-inbox"></i> Không có dữ liệu</td>
	                        	</tr>
	                        </c:if>
	                  	</tbody>

	                    <c:if test="${orderDetails.size() > 0}">
						<tfoot>
							<tr>
								<td colspan="6">
									<c:if test="${orderInfo.orderIdStatus == 1}">
										<a href="/order/save?id=${idOrder}" class="btn btn-primary"><i class="fas fa-save"></i> Lưu</a>
									</c:if>
									<a href="#" class="ms-1 btn btn-info" data-bs-toggle="modal" data-bs-target="#modalPrint"><i class="fas fa-print"></i> In</a>
								</td>
							</tr>
						</tfoot>
						</c:if>								
	                </table>
	        	</form>
		            	
			</div>
		</div>
	</div>

	<!-- Modal -->
    <form:form modelAttribute="productForm" method="POST" action="/product/add">
	<div class="modal fade" id="modalAddNew" tabindex="-1" aria-labelledby="modalAddNewLabel" aria-hidden="true">
	  <div class="modal-dialog">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h5 class="modal-title" id="modalAddNewLabel">Thông tin sản phẩm</h5>
	        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
	      </div>
	      <div class="modal-body">
        	<div class="form-floating">
			  <form:hidden path="idSupplier" />
			  <form:input path="code" type="text" cssClass="form-control fs-15px" />
			  <label for="code" class="d-flex align-items-center fs-13px">
			    Mã SP
			  </label>
			</div>
        	<div class="form-floating mt-2">
			  <form:input path="name" type="text" cssClass="form-control fs-15px" />
			  <label for="name" class="d-flex align-items-center fs-13px">
			    Tên SP
			  </label>
			</div>
        	<div class="form-floating mt-2">
			  <form:input path="price" type="number" cssClass="form-control fs-15px" />
			  <label for="price" class="d-flex align-items-center fs-13px">
			    Giá
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

	<div class="modal fade" id="modalPrint" tabindex="-1" aria-labelledby="modalPrintLabel" aria-hidden="true">
	  <div class="modal-dialog modal-xl">
	    <div class="modal-content">
	      	<div class="modal-header">
	        	<h5 class="modal-title" id="modalPrintLabel">Thông tin đơn hàng</h5>
	        	<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
	      	</div>
	      	<div class="modal-body">
        		<table class="table table-bordered m-0">
		            <tr>
		              <th class="w-50">I. Thông tin nhân viên</th>
		              <th class="w-50">II. Thông tin NCC</th>
		            </tr>
		            <tr>
		              <td class="p-0">
		                <ul class="list-group">
		                  <li class="list-group-item p-0">
		                    <div class="form-floating">
		                      <div class="form-control border-0"><em>0123456789</em></div>
		                      <label class="d-flex align-items-center fs-13px">
		                        Số ĐT
		                      </label>
		                    </div>
		                  </li>
		                  <li class="list-group-item p-0">
		                    <div class="form-floating">
		                      <div class="form-control border-0"><em>Admin</em></div>
		                      <label class="d-flex align-items-center fs-13px">
		                        Họ tên
		                      </label>
		                    </div>
		                  </li>
		                  <li class="list-group-item p-0">
		                    <div class="form-floating">
		                      <div class="form-control border-0"><em>HN</em></div>
		                      <label class="d-flex align-items-center fs-13px">
		                        Địa chỉ
		                      </label>
		                    </div>
		                  </li>
		                </ul>
		              </td>
		              <td class="p-0">
		                <ul class="list-group">
		                  <li class="list-group-item p-0">
		                    <div class="form-floating">
		                      <div class="form-control border-0"><em>${orderInfo.supplierPhone}</em></div>
		                      <label for="ip-customer-phone" class="d-flex align-items-center fs-13px">
		                        Số ĐT
		                      </label>
		                    </div>
		                  </li>
		                  <li class="list-group-item p-0">
		                    <div class="form-floating">
		                      <div class="form-control border-0"><em>${orderInfo.supplierName}</em></div>
		                      <label for="ip-customer-name" class="d-flex align-items-center fs-13px">
		                        Họ tên
		                      </label>
		                    </div>
		                  </li>
		                  <li class="list-group-item p-0">
		                    <div class="form-floating">
		                      <div class="form-control border-0"><em>${orderInfo.supplierAddress}</em></div>
		                      <label for="ip-customer-address" class="d-flex align-items-center fs-13px">
		                        Địa chỉ
		                      </label>
		                    </div>
		                  </li>
		                </ul>
		              </td>
		            </tr>
		            <tr>
		              <td colspan="2">
		                <table id="tbl-cart-modal" class="table table-bordered m-0">
		                  <thead>
		                    <tr class="bg-info">
		                      	<th>Số seri</th>
		                      	<th>Tên SP</th>
		                      	<th>Giá(đ)</th>
		                      	<th>Số lượng</th>
		                      	<th>Thành tiền(đ)</th>
		                    </tr>
		                  </thead>
		                  <tbody>
		                  	<c:forEach items="${orderDetails}" var="item" varStatus="loop">
                            	<tr data-id-product="${item.id}">
                            		<td>${item.code}</td>
                            		<td>${item.name}</td>
                            		<td>${item.price}</td>
                            		<td>${item.qty}</td>
                            		<td>${item.price * item.qty}</td>
                            	</tr>
                            </c:forEach>
		                  </tbody>
		                </table>
		              </td>
		            </tr>
	          	</table>
        	</div>
	    </div>
	  </div>
	</div>

	<!-- * Modal -->
</body>
<script>
	$("#ip-search").keyup(function(){
		const text = $(this).val().toLowerCase()
		var total = 0
		$("#tbl-product>tbody tr").each(function(){
			console.log($(this))
			if($(this).text().toLowerCase().includes(text)) {
				total++
				$(this).removeClass("d-none");
			}else{
				$(this).addClass("d-none");
			}
		})
		if(total==0){
			$(".btn-create-product").removeClass("d-none")
			$(`[name="name"]`).val(text)
		}else{
			$(".btn-create-product").addClass("d-none")
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
      			<td><input type="number" name="qty" data-price="`+data.price+`" min="1" value="1" onchange="changeQty(this)" onkeyup="changeQty(this)"></td>
      			<td id="total_price">`+data.price+`</td>
      			<td>
      				<button type="button" class="btn btn-danger">Hủy</button>
      				<button type="submit" class="ms-1 btn btn-primary">Lưu</button>
  				</td>
      		</tr>`
	}

	function changeQty(obj){
		var total = obj.dataset.price * obj.value
		$("#total_price").html(total)
	}
</script>
</html>
