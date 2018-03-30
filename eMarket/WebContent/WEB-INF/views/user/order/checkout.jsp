<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>


<div class="container offset-18">
	<h3 class="block-title large">Đặt hàng</h3>
		<div class="col-md-12">

			
					<form:form action="user/order/purchase.php" modelAttribute="order">
						<form:hidden path="id" />
						<div class="row">

							<div class="form-group col-sm-4">
								<label>Tổng tiền</label>
								<form:input path="amount" readonly="true"
									cssClass="form-control" />
							</div>
							<div class="form-group col-sm-4">
								<label>Ngày đặt</label>
								<form:input path="orderDate" cssClass="form-control" />
							</div>
							<div class="form-group col-sm-4">
								<label>Ngày nhận</label>
								<form:input path="requireDate" cssClass="form-control" />
							</div>
						</div>

						<div class="row">
							<div class="form-group col-sm-4">
								<label>Người nhận</label>
								<form:input path="receiver" cssClass="form-control" />
							</div>
							<div class="form-group col-sm-4">
								<label>Địa chỉ</label>
								<form:input path="address" cssClass="form-control" />
							</div>
							<div class="form-group col-sm-4">
								<form:hidden path="customer.id" value="${cookie.uidd.value}"
									name="idCus" />
							</div>
						</div>
						<div class="row">
							<div class="form-group col-sm-12">
								<label>Notes</label>
								<form:textarea path="description" cssClass="form-control"
									rows="5"></form:textarea>
							</div>
							<div class="col-lg-6 col-md-6 col-sm-6 align-right">
								<br> <input class="btn icon-btn-left" type="submit" class="orange" value="Đặt hàng">
							</div>
						</div>

					</form:form>



				</div>

			</div>









<script>
	$(function() {
		$("[data-add-id]").click(function() {
			var id = $(this).attr("data-add-id");
			$.ajax({
				url : "cart/add.php",
				data : {
					id : id
				},
				dataType : "json",
				success : function(response) {
					$("#cart-cnt").html(response.count + " items");
					$("#cart-amt").html("$" + response.amount);
				}
			});
		});
	});
</script>
