<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<style type="text/css">

.pagination {
	position: relative;
	display: flex;
	flex-direction: row;
	--ddim: 10px;
	--rd: 15px;
	--rdim: calc(var(--rd)*2);
	--pm: #ffff03;
}

label {
	content: '';
	margin: 0 10px;
	height: var(--ddim);
	width: var(--ddim);
	background: #f7b997;
	cursor: pointer;
}

label:first-child {margin-left: 0;}
label:last-child {margin-right: 0;}
input {display: none;}

.pacman {
	content: '';
	position: absolute;
	top: calc(-1*var(--ddim));
	left: calc(-1*var(--ddim)/2);
	height: var(--rdim);
	width: var(--rdim);
	transition: transform 250ms linear;
}

.pacman:before,
.pacman:after {
	content: '';
	position: absolute;
	height: var(--rd);
	width: var(--rdim);
	left: 0;
	background: var(--pm);
	transition: inherit;
}

.pacman:before {
	top: 0;
	border-top-left-radius: var(--rdim);
	border-top-right-radius: var(--rdim);
	transform-origin: bottom center;
	transform: rotate(-45deg);
}

.pacman:after {
	bottom: 0;
	border-bottom-left-radius: var(--rdim);
	border-bottom-right-radius: var(--rdim);
	transform-origin: top center;
	transform: rotate(45deg);
}

@keyframes waka {
	0% {}
	50% {transform: rotate(0);}
	100% {}
}

input[type="radio"]:hover ~ .pacman:before,
input[type="radio"]:hover ~ .pacman:after {
	animation: waka 500ms infinite;
}

input[id="dot-1"]:checked ~ .pacman {transform: translateX(var(--ddim));}
input[id="dot-2"]:checked ~ .pacman {transform: translateX(calc(var(--ddim) + var(--rdim)));}
input[id="dot-3"]:checked ~ .pacman {transform: translateX(calc(var(--ddim) + var(--rdim)*2));}
input[id="dot-4"]:checked ~ .pacman {transform: translateX(calc(var(--ddim) + var(--rdim)*3));}
input[id="dot-5"]:checked ~ .pacman {transform: translateX(calc(var(--ddim) + var(--rdim)*4));}
input[id="dot-6"]:checked ~ .pacman {transform: translateX(calc(var(--ddim) + var(--rdim)*5));}
input[id="dot-7"]:checked ~ .pacman {transform: translateX(calc(var(--ddim) + var(--rdim)*6));}
input[id="dot-8"]:checked ~ .pacman {transform: translateX(calc(var(--ddim) + var(--rdim)*7));}
</style>

<script type="text/javascript">
</script>
</head>
<body>
	<div class="pagination">	
	<input id="dot-1" type="radio" name="dots">	
	<label for="dot-1"></label>	
	<input id="dot-2" type="radio" name="dots">
	<label for="dot-2"></label>	
	<input id="dot-3" type="radio" name="dots" checked="checked">
	<label for="dot-3"></label>	
	<input id="dot-4" type="radio" name="dots">
	<label for="dot-4"></label>	
	<input id="dot-5" type="radio" name="dots">
	<label for="dot-5"></label>	
	<input id="dot-6" type="radio" name="dots">
	<label for="dot-6"></label>	
	<input id="dot-7" type="radio" name="dots">
	<label for="dot-7"></label>	
	<input id="dot-8" type="radio" name="dots">
	<label for="dot-8"></label>
	<div class="pacman"></div>
</div>

</body>
</html>