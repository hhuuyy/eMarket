<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="f"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>
<div class="row">
	<!-- page header-->
	<div class="col-lg-12">
		<h1 class="page-header">PHÂN VAI TRÒ</h1>
	</div>
	<!-- end page header-->
</div>
<div class="panel panel-default">
	<div class="panel-heading">Edition</div>
	<div class="panel-body">
		<div class="row">
			<div class="col-lg-12">
				<h4>Tài khoản</h4>
				<select id="master">
					<c:forEach var="m" items="${masters}">
						<option value="${m.id}">${m.fullName}</option>
					</c:forEach>
				</select> <br />
				<h3>Chức vụ</h3>
				<c:forEach var="r" items="${roles}">
					<p>
						<label> <input type="checkbox" value="${r.id}">
							${r.name}
						</label>
					</p>
				</c:forEach>
			</div>
		</div>
	</div>
</div>


<script>
	$(function() {
		$("#master").change(
				function() {
					mid = $(this).val();
					$.ajax({
						url : "admin/master-role/get-roles.php",
						data : {
							masterId : mid
						},
						dataType : "json",
						success : function(response) {
							$(":checkbox").prop("checked", false);
							$(response).each(
									function(index, item) {
										$(":checkbox[value=" + item + "]")
												.prop("checked", true);
									});
						}
					});
				});

		// click checkbox
		$(":checkbox").click(function() {
			rid = $(this).val();
			state = $(this).prop("checked");
			mid = $("#master").val();

			$.ajax({
				url : "admin/master-role/update.php",
				data : {
					mid : mid,
					rid : rid,
					state : state
				},
				success : function(response) {
					//alert(response);
				}
			});
		});
	});
</script>
