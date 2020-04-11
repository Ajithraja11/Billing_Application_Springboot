<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>

<!doctype html>
<html lang="en">

<head>

<title>Login Page</title>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<!-- Reference Bootstrap files -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>

<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

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
	width: 25%;
}

.submit {
	width: 50%;
	text-align: center;
}

.image {
	float: right;
	width: 30%;
}

.clearfix {
	overflow: auto;
}

hr.new4 {
	border: 1px solid lightgrey;
	margin-top: 0px
}
</style>
</head>

<body>
	<div class="jumbotron">
		<div class="container text-center">
			<h1>Hariharan Traders</h1>
			<p>Cement | Sand | Cement Bricks | Interiors | Paint</p>
		</div>
	</div>

	<div class="container">
		<ul class="nav nav-pills nav-justified">
			<li><a href="/">Home</a></li>
			<li><a href="/public/construction">Construction</a></li>
			<li><a href="/public/interior">Interior</a></li>
			<li><a href="/public/paint">Paint</a></li>
			<li><a href="/public/contactPage">Contact</a></li>
			<sec:authorize access="!isAuthenticated()">
				<li class="active"><a
					href="${pageContext.request.contextPath}/public/login">Login</a></li>
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
	<br>

	<div class="">

		<div id="loginbox" style="margin-top: 50px;"
			class="mainbox col-md-5 col-md-offset-3 col-sm-6 col-sm-offset-2 ">

			<div class="panel panel-info">

				<div class="panel-heading">
					<div class="panel-title">Sign In</div>
				</div>

				<div style="padding-top: 30px" class="panel-body">

					<!-- Login Form -->
					<form:form
						action="${pageContext.request.contextPath}/authenticateTheUser"
						method="POST" class="form-horizontal">

						<!-- Place for messages: error, alert etc ... -->
						<div class="form-group">
							<div class="col-xs-15">
								<div>

									<c:if test="${param.error!=null }">
										<div class="alert alert-danger col-xs-offset-1 col-xs-10">
											Invalid username and password.</div>
									</c:if>

									<c:if test="${param.logout!=null }">
										<div class="alert alert-success col-xs-offset-1 col-xs-10">
											You have been logged out.</div>
									</c:if>

								</div>
							</div>
						</div>

						<!-- User name -->
						<div style="margin-bottom: 25px" class="input-group">
							<span class="input-group-addon"><i
								class="glyphicon glyphicon-user"></i></span> <input type="text"
								name="username" placeholder="username" class="form-control">
						</div>

						<!-- Password -->
						<div style="margin-bottom: 25px" class="input-group">
							<span class="input-group-addon"><i
								class="glyphicon glyphicon-lock"></i></span> <input type="password"
								name="password" placeholder="password" class="form-control">
						</div>

						<!-- Login/Submit Button -->
						<div style="margin-top: 10px" class="form-group">
							<div class="col-sm-6 controls">
								<button type="submit" class="btn btn-success">Login</button>
							</div>
						</div>

					</form:form>

				</div>

			</div>

		</div>

	</div>

</body>
</html>