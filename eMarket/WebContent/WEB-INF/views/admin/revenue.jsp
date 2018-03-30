<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="f"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<div class="row">
	<!-- page header-->
	<div class="col-lg-12">
		<h1 class="page-header">REVENUE BY ${fn:toUpperCase(group)}</h1>
	</div>
	<!-- end page header-->
</div>

<script type="text/javascript" src="js/loader.js"></script>
<script type="text/javascript">
	google.charts.load('current', {
		'packages' : [ 'corechart' ]
	});
	google.charts.setOnLoadCallback(drawChart);

	function drawChart() {
		var data = google.visualization.arrayToDataTable([
				[ 'Hàng hóa', 'Doanh số'], 
				<c:forEach var="item" items="${items}">
		          ["${item[0]}",    ${item[1]}],
		         </c:forEach>
			]);

		var options = {
			title : 'Doanh số bán hàng từng sản phẩm',
			curveType : 'function',
			legend : {
				position : 'bottom'
			}
		};

		var chart = new google.visualization.LineChart(document
				.getElementById('curve_chart'));

		chart.draw(data, options);
	}
</script>



<div id="curve_chart" style="width: 900px; height: 500px"></div>
<div class="row">
	<div class="col-lg-12">
		<!-- Advanced Tables -->
		<div class="panel panel-default">
			<div class="panel-heading">List</div>
			<div class="panel-body">
				<div class="table-responsive">
					<table class="table table-striped table-bordered table-hover"
						id="dataTables-example">
						<span>${message} </span>
						<thead>
							<tr>
								<th>${group}</th>
								<th>Count</th>
								<th>Revenue</th>
								<th>Min</th>
								<th>Max</th>
								<th>Average</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="item" items="${items}">
								<tr>
									<td>${item[0]}</td>
									<td>${item[1]}</td>
									<td><f:formatNumber value="${item[2]}" type="currency" /></td>
									<td><f:formatNumber value="${item[3]}" type="currency" /></td>
									<td><f:formatNumber value="${item[4]}" type="currency" /></td>
									<td><f:formatNumber value="${item[5]}" type="currency" /></td>
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