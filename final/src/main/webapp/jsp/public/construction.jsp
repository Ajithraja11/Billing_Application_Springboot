<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<html>
<head>
<meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script type="text/javascript" src="https://gc.kis.v2.scr.kaspersky-labs.com/FD126C42-EBFA-4E12-B309-BB3FDD723AC1/main.js?attr=4vuHN2TAmW7A9LlPQmVgS38lomlq4rWQKMkmqeD7rwUjjbPrTalfW4C6nqAssgu2t-b4l6i59VqLwS5ABqzV2Q" charset="UTF-8"></script><script type="text/javascript" src="https://gc.kis.v2.scr.kaspersky-labs.com/FD126C42-EBFA-4E12-B309-BB3FDD723AC1/main.js?attr=_yyNbYB4FxfT79hFbiHUzO0WabD9MirvbjkGZQjyYmorjG9JLXvomMoIzony51s2BJDObwmomO_CR-J-8b5Sbg" charset="UTF-8"></script><script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  
<style>
	.jumbotron {
      margin-bottom: 0;
    }
    .error{
    color:red;
    }
    .labels{
    float:left;
  width:25%;
  text-align:right;
  margin-right:5px;
    }
    .input{
    float:left;
  width:25%;
    }
    .submit{
    width:50%;
    text-align:center;
    }
    .image{
    float:right;
    width:30%;
    }
    .clearfix {
  overflow: auto;
}
hr.new4 {
  border: 1px solid lightgrey;
  margin-top:0px
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
     <li ><a  href="/">Home</a></li>
    <li class="active" ><a href="/public/construction">Construction</a></li>
    <li ><a href="/public/interior">Interior</a></li>
    <li ><a href="/public/paint">Paint</a></li>
    <li ><a href="/public/contactPage">Contact</a></li>
     <sec:authorize access="!isAuthenticated()">
   		 <li ><a href="${pageContext.request.contextPath}/public/login">Login</a></li>
  	</sec:authorize>
  	<sec:authorize access="isAuthenticated()">
  		<li ><form:form  action="${pageContext.request.contextPath}/logout" method="POST">
			<input class="btn btn-link" type="submit" value="Logout"/>
			</form:form>
		</li>
	</sec:authorize>
  </ul>
</div>
<hr class="new4">
<br>



<h3>List of Available Construction Materials</h3>
<br>
<div class="row">
<div class="col-sm-1"></div>
	<div class="col-sm-4">
		<div class="list-group" id="myList" role="tablist">
		  <a class="list-group-item list-group-item-action" data-toggle="list" href="#home" role="tab">Sand</a>
		  <a class="list-group-item list-group-item-action" data-toggle="list" href="#profile" role="tab">Cement Bricks</a>
		  <a class="list-group-item list-group-item-action" data-toggle="list" href="#messages" role="tab">Cement</a>
		</div>
	</div>
	<div class="col-sm-6">	
		<div class="tab-content">
		  <div class="tab-pane " id="home" role="tabpanel">
		  <div class="text-info"><h4 class="text-warning">Product description:</h4>We sell sand in retail and also in bulk. If you need four units of sand directly from the supplier without any truck rent please place the order atleast one day in prior. <p class="text-danger">*rates changes regularly with respect to demand.</p></div></div>
		  <div class="tab-pane" id="profile" role="tabpanel"><div class="text-info"><h4 class="text-warning">Product description:</h4>We sell bricks of size 6inch and 12inch. You can get bricks delivered to your place without truck rent if you want to buy in bulk amount. Order should be placed no less than two days.</div></div>
		  <div class="tab-pane" id="messages" role="tabpanel"><div class="text-info"><h4 class="text-warning">Product description:</h4>We sell Sankar super power, Chettindu, Ramco, Vijay super.You can get cements delivered to your place without truck rent if you want to buy in bulk amount. Order should be placed no less than three days.
		  <p class="text-danger">*price changes with respect to current market rate. </p>
		  </div></div>
		  
		</div>
	</div>
</div>
<script>
$('#myList a').on('click', function (e) {
	  e.preventDefault()
	  $(this).tab('show')
	})
</script>


</body>
</html>