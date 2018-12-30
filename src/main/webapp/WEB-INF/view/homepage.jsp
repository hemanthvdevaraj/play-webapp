<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<div id="test">
	<h1>Welcome</h1>
	<p>Bootstrap is the most popular HTML, CSS, and JavaScript
		framework for developing responsive, mobile-first websites. Bootstrap
		is completely free to download and use!</p>
	<hr>
	<h3>Test</h3>

	<button onclick="move()">Click Me</button>

	<script>
		var id;
		var elem;
		function move() {
			elem = document.getElementById("myBar");
			var width = 1;
			id = setInterval(frame, 100);
			function frame() {
				if (width == 100) {
					stopMove();
				} else {
					width++;
					elem.style.width = width + '%';
					elem.innerHTML = width + '% Complete (success)';
				}
			}
		}
		function stopMove() {
			clearInterval(id);
			setTimeout(function() {
				elem.classList.remove("active");
			}, 500);

		}
	</script>

	<div class="progress">
		<div id='myBar'
			class="progress-bar progress-bar-success progress-bar-striped active"
			role="progressbar" aria-valuenow="40" aria-valuemin="0"
			aria-valuemax="100" style="width: 40%">40% Complete (success)</div>
	</div>

	<div class="progress">
		<div
			class="progress-bar progress-bar-info progress-bar-striped active"
			role="progressbar" aria-valuenow="50" aria-valuemin="0"
			aria-valuemax="100" style="width: 50%">50% Complete (info)</div>
	</div>

	<div class="progress">
		<div
			class="progress-bar progress-bar-warning progress-bar-striped active"
			role="progressbar" aria-valuenow="60" aria-valuemin="0"
			aria-valuemax="100" style="width: 60%">60% Complete (warning)</div>
	</div>

	<div class="progress">
		<div
			class="progress-bar progress-bar-danger progress-bar-striped active"
			role="progressbar" aria-valuenow="70" aria-valuemin="0"
			aria-valuemax="100" style="width: 70%">70% Complete (danger)</div>
	</div>
</div>