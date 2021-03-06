<!-- sử dụng tiếng việt, tàu,... -->
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>

<!-- TagLibs -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html lang="en">

<head>
<!-- Required meta tags-->
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="au theme template">
<meta name="author" content="Hau Nguyen">
<meta name="keywords" content="au theme template">
<jsp:include page="/WEB-INF/views/admin/layout/variables.jsp"></jsp:include>

<!-- Title Page-->
<title>Dashboard</title>

<!-- Fontfaces CSS-->
<jsp:include page="/WEB-INF/views/admin/layout/css.jsp"></jsp:include>
</head>

<body class="animsition">
	<div class="page-wrapper">
		<!-- HEADER MOBILE-->
		<!-- MENU SIDEBAR-->
		<jsp:include page="/WEB-INF/views/admin/layout/header-and-menu.jsp"></jsp:include>

		<!-- MAIN CONTENT -->

		<div class="page-container">
			<!-- HEADER DESKTOP-->
			<jsp:include page="/WEB-INF/views/admin/layout/page-content.jsp"></jsp:include>
			<!-- END HEADER DESKTOP-->

			<!-- MAIN CONTENT-->
			<div class="main-content">
				<div class="section__content section__content--p30">
					<div class="container-fluid">

						<div class="row">
							<div class="col-md-12">
								<!-- DATA TABLE -->
								<h3 class="title-5 m-b-35">Manage Cart</h3>
								<h4 class="title-5 m-b-35">
									<span></span>
								</h4>
								<div class="table-responsive table-responsive-data2">
									<table class="table table-data2">
										<thead>
											<tr>
												<th>id</th>
												<th>name customer</th>
												<th>email</th>
												<th>address</th>
												<th>phone</th>

												<th>total</th>
												<th>status</th>
												<th></th>
											</tr>
										</thead>
										<tbody>
											<c:forEach items="${saleorders }" var="s">
												<tr class="tr-shadow">
													<td>${s.id }</td>
													<td>${s.customerName}</td>
													<td><span class="block-email">${s.customerEmail }</span></td>
													<td class="desc">${s.customerAddress}</td>
													<td>${s.customerPhone }</td>
													<td>${s.total }</td>

													<td><span id="_saleorder_status_${s.id} }"> <c:choose>
																<c:when test="${s.status }">
																	<span class="badge badge-primary">Confirm</span>
																</c:when>
																<c:otherwise>
																	<span class="badge badge-warning">Delivered</span>
																</c:otherwise>
															</c:choose>
													</span></td>


													<td>
														<div class="table-data-feature">


															<button class="item" data-toggle="tooltip"
																data-placement="top" title="delivered"
																onclick="DeleteProduct(${s.id})">
																<i class="zmdi zmdi-delete"></i>
															</button>

															<button class="item" data-toggle="tooltip"
																data-placement="top" title="detail">
																<a href="${base}/admin/detail_cart?id=${s.id}"> <i
																	class="zmdi zmdi-more"></i>
																</a>
															</button>
														</div>
													</td>
												</tr>
												<tr class="spacer"></tr>
											</c:forEach>
										</tbody>
									</table>
								</div>
								<!-- END DATA TABLE -->
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- END MAIN CONTENT-->
		<!-- END PAGE CONTAINER-->
	</div>
	<!-- Jquery JS-->
	<jsp:include page="/WEB-INF/views/admin/layout/js.jsp"></jsp:include>


	<script type="text/javascript">
		function DeleteProduct(productId) {
			// javascript object.
			var data = {};

			// $ === jQuery
			$.ajax({
						url : "/admin/delivered_saleorder?SaleOrderId=" + productId,
						type : "post",
						contentType : "application/json",
						data : JSON.stringify(data),

						dataType : "json",
						success : function(jsonResult) {
							if (jsonResult.code == 200) {

								$("#_saleorder_status_" + productId)
										.html("<span class=\"badge badge-warning\">delivered</span>");
								
								alert("confirmed");

							} else {
								
								alert(jsonResult.message);
							}
						},
						error : function(jqXhr, textStatus, errorMessage) { // error callback 

						}
					});
		}
	</script>

</body>
</html>
<!-- end document-->
