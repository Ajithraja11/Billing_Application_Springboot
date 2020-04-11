<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
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
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<style>
.jumbotron {
	margin-bottom: 0;
}

.error {
	color: red;
}

.labels {
	float: left;
	width: 25%;
	text-align: right;
	margin-right: 5px;
}

.input {
	float: left;
	width: 65%;
}

.submit {
	width: 50%;
	text-align: center;
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
			<li><a href="/employee/construction">Construction</a></li>
			<li><a href="/employee/interior">Interior</a></li>
			<li class="active"><a href="/employee/paint">Paint</a></li>

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

	<h1>Paint Billing Section</h1>
	<br>
	<div class="container">
		<div class="row">
			<div class="col-sm-8 ">
				<form:form action="/employee/PaintprocessForm"
					modelAttribute="paint">

					<div class="labels">Name of the customer(*):</div>
					<div class="input">
						<form:input path="customer_name" />
						<form:errors path="customer_name" cssClass="error" />
					</div>
					<br>
					<br>
					<div class="labels">Number of 30ml paint box</div>
					<div class="input">
						<form:input path="size30ml" value="0" />
						<form:errors path="size30ml" cssClass="error" />
					</div>
					<br>
					<br>
					<div class="labels">Number of 100ml paint box</div>
					<div class="input">
						<form:input path="size100ml" value="0" />
						<form:errors path="size100ml" cssClass="error" />
					</div>
					<br>
					<br>
					<div class="labels">Number of 500ml paint box</div>
					<div class="input">
						<form:input path="size500ml" value="0" />
						<form:errors path="size500ml" cssClass="error" />
					</div>
					<br>
					<br>
					<div class="labels">Number of 1l paint box</div>
					<div class="input">
						<form:input path="size1l" value="0" />
						<form:errors path="size1l" cssClass="error" />
					</div>
					<br>
					<br>
					<div class="submit">
						<input type="submit" class="btn btn-primary" value="Place Order" />
					</div>
				</form:form>

			</div>

			<div class="col-sm-4">
				<div class="list-group" id="myList" role="tablist">
					<a class="list-group-item list-group-item-action"
						data-toggle="list" href="paintOldBill" role="tab"><div
							class="text-success">Get Old Bill</div></a> <a
						class="list-group-item list-group-item-action" data-toggle="list"
						href="updatepaintOldBill" role="tab"><div class="text-success">Update
							Old Bill</div></a>
				</div>
			</div>
		</div>
	</div>


</body>
</html>