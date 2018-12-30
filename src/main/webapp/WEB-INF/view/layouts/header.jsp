<div class="navbar-header">
	<button type="button" class="navbar-toggle" data-toggle="collapse"
		data-target="#navbar">
		<span class="icon-bar"></span><span class="icon-bar"></span><span class="icon-bar"></span>
	</button>
	<a class="navbar-brand" href="#">Logo</a>
</div>
<div class="collapse navbar-collapse" id="navbar">
	<ul class="nav navbar-nav">
		<li class="active"><a href="${pageContext.servletContext.contextPath}/homepage">Home</a></li>
		<li><a href="${pageContext.servletContext.contextPath}/userdetails">Users</a></li>
		<li><a href="#">Projects</a></li>
		<li><a href="#">Contact</a></li>
		<li><a href="${pageContext.servletContext.contextPath}/admin">Admin</a></li>
	</ul>
	<ul class="nav navbar-nav navbar-right">
		<li><a href="${pageContext.servletContext.contextPath}/userLogout"><span class="glyphicon glyphicon-log-out"></span>
				Logout</a></li>
	</ul>
</div>
<script>
	$("#navbar a").on("click", function() {
		$(".nav").find(".active").removeClass("active");
		$(this).parent().addClass("active");
	});
</script>