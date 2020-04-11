<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core'%>

<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script type="text/javascript"
	src="https://gc.kis.v2.scr.kaspersky-labs.com/FD126C42-EBFA-4E12-B309-BB3FDD723AC1/main.js?attr=4vuHN2TAmW7A9LlPQmVgS38lomlq4rWQKMkmqeD7rwUjjbPrTalfW4C6nqAssgu2t-b4l6i59VqLwS5ABqzV2Q"
	charset="UTF-8"></script>
<script type="text/javascript"
	src="https://gc.kis.v2.scr.kaspersky-labs.com/FD126C42-EBFA-4E12-B309-BB3FDD723AC1/main.js?attr=_yyNbYB4FxfT79hFbiHUzO0WabD9MirvbjkGZQjyYmorjG9JLXvomMoIzony51s2BJDObwmomO_CR-J-8b5Sbg"
	charset="UTF-8"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<style>
.jumbotron {
	margin-bottom: 0;
}

hr.new4 {
	border: 1px solid lightgrey;
	margin-top: 0px
}
</style>

</head>

<body>
	<jsp:include page="/jsp/employee/header.jsp"></jsp:include>
	<div class="container">
		<ul class="nav nav-pills nav-justified">
			<li><a href="/employee/index">Home</a></li>
			<li class="active"><a href="/employee/construction">Construction</a></li>
			<li><a href="/employee/interior">Interior</a></li>
			<li><a href="/employee/paint">Paint</a></li>

			<sec:authorize access="!isAuthenticated()">
				<li><a href="${pageContext.request.contextPath}/public/login">Login</a></li>
			</sec:authorize>
			<sec:authorize access="isAuthenticated()">
				<li><form:form
						action="${pageContext.request.contextPath}/logout" method="POST">
						<input class="btn btn-link" type="submit" value="Logout" />
					</form:form></li>
			</sec:authorize>
		</ul>
	</div>
	<hr class="new4">


	<div class="row">
		<div class="col-sm-3"></div>
		<div class="col-sm-6 well">
			<h4>
				<a href="constructionOldBill">Get another bill</a>
			</h4>
			<table class="table">
				<tr>
					<td class="text-left"><strong>Customer Name:</strong> ${name }</td>
					<td> </td>
					<td> </td>
					<td class="text-center"><strong>Order id:</strong>
						${receiptNumber}</td>
				</tr>
				<tr>
					<th><strong>Product</strong></th>
					<th><strong>#</strong></th>
					<th><strong>Price</strong></th>
					<th class="text-center"><strong>Total</strong></th>
				</tr>

				<c:if test="${construction.sand_unit>0}">
					<tr>
						<td>sand</td>
						<td>${construction.sand_unit}</td>
						<td>${construction.sand_perunit_price }</td>
						<td class="text-center">${construction.sand_price }</td>
					</tr>
				</c:if>
				<c:if test="${construction.bricks_6>0}">
					<tr>
						<td>6" Bricks</td>
						<td>${construction.bricks_6}</td>
						<td>${construction.bricks6_perunit_price }</td>
						<td class="text-center">${construction.bricks6_price }</td>
					</tr>
				</c:if>
				<c:if test="${construction.bricks_10>0}">
					<tr>
						<td>10" Bricks</td>
						<td>${construction.bricks_10}</td>
						<td>${construction.bricks10_perunit_price }</td>
						<td class="text-center">${construction.bricks10_price }</td>
					</tr>
				</c:if>
				<c:if test="${construction.cementBag>0}">
					<tr>
						<td>Cement</td>
						<td>${construction.cementBag}</td>
						<td>${construction.cement_perunit_price }</td>
						<td class="text-center">${construction.cement_price }</td>
					</tr>
				</c:if>
				<tr>
					<td> </td>
					<td> </td>
					<td class="text-right"><h4>
							<strong>Total: </strong>
						</h4></td>
					<td class="text-center text-danger"><h4>
							<strong>${construction.totalAmount} Rs</strong>
						</h4></td>
				</tr>
			</table>
		</div>
		<div class="col-sm-3"></div>
	</div>

</body>
</html>