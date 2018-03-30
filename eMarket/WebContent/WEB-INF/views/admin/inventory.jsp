<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="f"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<div class="row">
	<!-- page header-->
	<div class="col-lg-12">
		<h1 class="page-header">INVENTORY BY ${fn:toUpperCase(group)}</h1>
	</div>
	<!-- end page header-->
</div>



<script type="text/javascript">
	google.charts.load("current", {
		packages : [ "corechart" ]
	});
	google.charts.setOnLoadCallback(drawChart);
	function drawChart() {
		var data = google.visualization.arrayToDataTable([
	          ['Nhom', 'SoLuong'],
	          <c:forEach var="item" items="${items}">
	          ["${item[0]}", ${item[1]}],
	          </c:forEach>
	    ]);

		var options = {
			title : 'Hàng tồn kho',
			is3D : true,
		};

		var chart = new google.visualization.PieChart(document
				.getElementById('piechart_3d'));
		chart.draw(data, options);
	}
</script>



<div id="piechart_3d" style="height: 500px;"></div>

<div class="row">
	<div class="col-lg-12">
		<!-- Advanced Tables -->
		<div class="panel panel-default">
			<div class="panel-heading">List</div>
			<div class="panel-body">
				<div class="table-responsive">
					<table class="table table-striped table-bordered table-hover"
						id="dataTables-example">
						<thead>
							<tr>
								<th>${group}</th>
								<th>Count</th>
								<th>Value</th>
								<th>Min</th>
								<th>Max</th>
								<th>Average</th>
								<th></th>
							</tr>
						</thead>

						<tbody>
							<c:forEach var="item" items="${items}">
								<tr>
									<td>${item[0]}</td>
									<td>${item[1]}</td>
									<td><f:formatNumber value="${item[2]}" type="currency"></f:formatNumber></td>
									<td><f:formatNumber value="${item[3]}" type="currency"></f:formatNumber></td>
									<td><f:formatNumber value="${item[4]}" type="currency"></f:formatNumber></td>
									<td><f:formatNumber value="${item[5]}" type="currency"></f:formatNumber></td>
									<td></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>

			</div>
		</div>
		<!--End Advanced Tables -->
	</div>
</div>