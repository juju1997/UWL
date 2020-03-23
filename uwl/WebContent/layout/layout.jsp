<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <!--  CDN -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
	<script src="/javascript/jquery.bootstrap-pureAlert.js"></script>
	<script src="https://cdn.rawgit.com/mgalante/jquery.redirect/master/jquery.redirect.js"></script>    
    <link href="https://fonts.googleapis.com/css?family=Nanum+Gothic|Roboto&display=swap" rel="stylesheet">
	<script src="https://kit.fontawesome.com/6ffe1f5c93.js" crossorigin="anonymous"></script>
    <title>Document</title>
<style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        li {
            list-style: none;
        }

        a {
            text-decoration: none;
            color: inherit;
        }

        a:hover {
            text-decoration: none;
            color: inherit;
        }

        body {
            color: #333;
            font-size: 16px;
            font-family: 'Roboto', sans-serif;
            font-family: 'Nanum Gothic', sans-serif;

        }

        div#layout {
            width: 100%;
            
            min-height: 200vh;
            margin: 0 auto;
            position: relative;
            padding: 0 250px;
        }

        div#leftLayout {
            width: 250px;
            min-height: 100vh;
            
            position: fixed;
            left: 0;
            top: 0;
            bottom: 0;
            border-right: 1px solid #eee;
        }
        div#rightLayout {
            width: 300px;
            min-height: 100vh;
            
            position: fixed;
            right: 0;
            top: 0;
            bottom: 0;
            border-left: 1px solid #eee;
        }
        div#work > div {
        	width: 100%;
        }
    </style>
</head>
<body>
<div id="layout">
        <div id="leftLayout">
			<jsp:include page="/layout/left.jsp" />
        </div>
        <div id="work">

        </div>
        <div id="rightLayout">
			<jsp:include page="/layout/right.jsp" />
        </div>
    </div>
</body>
</html>