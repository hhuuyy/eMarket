<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="f"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>
<div class="row">
	<!-- page header-->
	<div class="col-lg-12">
		<h1 class="page-header">Phân quyền sử dụng</h1>
	</div>
	<!-- end page header-->
</div>
<div class="panel panel-default">
	<div class="panel-heading"></div>
	<div class="panel-body">
		<div class="row">
			<div class="col-lg-12">
				<h4>Cấp bậc</h4>
				<select id="role" class="form-group">
					<c:forEach var="r" items="${roles}">
						<option value="${r.id}">${r.name}</option>
					</c:forEach>
				</select> <br>
				<br />
				<br />
				<h4>Quyền sử dụng</h4>
				<br>
				<c:forEach var="a" items="${actions}">
					<p class="col-sm-3">
						<label> <input type="checkbox" value="${a.id}">
							${a.description}
						</label>
					</p>
				</c:forEach>
			</div>
		</div>
	</div>
</div>

<script>
	$(function() {
		$("#role").change(
				function() {
					rid = $(this).val();
					$.ajax({
						url : "admin/web-action-role/get-actions.php",
						data : {
							rid : rid
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
			aid = $(this).val();
			state = $(this).prop("checked");
			rid = $("#role").val();

			$.ajax({
				url : "admin/web-action-role/update.php",
				data : {
					aid : aid,
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
