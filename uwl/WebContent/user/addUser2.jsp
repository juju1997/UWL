<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <!--  jQuery CDN -->
    <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
    <!-- bootstrap 4.4 CDN -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
    <!-- jQuery Redirect CDN     https://github.com/mgalante/jquery.redirect  -->
    <script src="https://cdn.rawgit.com/mgalante/jquery.redirect/master/jquery.redirect.js"></script>
    <!-- Modal Alert https://github.com/PureOpenSource/pureAlert  -->
    <script src="/javascript/jquery.bootstrap-pureAlert.js"></script>

    <link rel="stylesheet" href="/css/jaeiCommon.css">
    <script src="https://kit.fontawesome.com/6ffe1f5c93.js" crossorigin="anonymous"></script>
    <link href="https://fonts.googleapis.com/css?family=Nanum+Gothic|Roboto&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Nanum+Gothic|Roboto&display=swap" rel="stylesheet">
    <script type="text/javascript">

    </script>



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

        body {
            font-size: 16px;
            color: #333;
            font-family: 'Roboto', sans-serif;
            font-family: 'Nanum Gothic', sans-serif;
        }

        a:hover,
        a:focus {
            color: inherit;
            text-decoration: none;

        }

        input:focus {
            outline: none;
        }

        img,
        i,
        input {
            vertical-align: middle;
        }

        div.wrap {

            width: 540px;
            margin: 0 auto;
            text-align: center;
        }

        div.logo {

            padding: 20px 0;
        }


        div.logo img {
            width: 100px;
        }

        .wrap>div:nth-child(2) {

            font-size: 22px;
            font-weight: bold;
            padding: 5px 0 20px;
            text-align: left;
        }


        div.loginForm div.id p:nth-child(1),
        div.loginForm div.password p:nth-child(1) {
            text-indent: 8px;
            padding-top: 5px;
            text-align: left;
            background-color: #f8f8f8;
            font-size: 15px;
        }

        div.loginForm div.id:nth-child(11) p:nth-child(1) {
            background-color: #fff;
        }

        p.gender {
            text-align: left;
            margin-top: 5px;
            margin-bottom: 20px;
        }

        div.loginForm div.id p:nth-child(1) i,
        div.loginForm div.password p:nth-child(1) i {
            font-size: 10px;
            vertical-align: 2px;
            margin-right: 5px;
        }

        div.loginForm div.id input,
        div.loginForm div.password input {
            background-color: #f8f8f8;
            border: none;
            border-bottom: 2px solid;
            width: 100%;
            line-height: 30px;
            padding: 0 10px 2px;
            margin-bottom: 20px;





            font-size: 16px;

        }

        div.loginForm div.id:nth-child(6) p input {


            margin-bottom: 10px;
        }


        div.loginForm div.id:nth-child(9) p input {

            margin-bottom: 10px;
        }

        div.loginForm div.id:nth-child(13) p input {
            margin-bottom: 10px;
        }

        div.loginForm a {
            background-color: #EBAD7A;
            display: block;
            line-height: 45px;
            border-radius: 30px;
            text-align: center;
            font-weight: bold;
            margin-bottom: 30px;
            color: #fff;
            font-size: 14px;
        }

        div.loginForm>p>a {

            margin-top: 10px;
            margin-bottom: 20px;
        }

        div.loginForm div.id:nth-child(9) p a {
            margin-bottom: 20px;
        }

        div.loginForm div.id:nth-child(13) p a {
            margin-bottom: 20px;
        }

        div.loginForm div:last-child a {

            margin-bottom: 10px;
        }

        div.wrap>div:nth-child(4) {
            font-size: 14px;

        }

        div.wrap>div:nth-child(4) a {
            color: #EBAD7A;
        }

        p {
            margin-bottom: 0;
        }

        p.level {
            text-align: left;
        }
    </style>

    <script type="text/javascript">
        $(function() {
            // 네이버 아이디로 로그인 이미지 클릭 시 
            $("div[name='naverLogin']").on("click", function() {
                // 새로 팝업창에서 네이버 로그인을 진행하기 위해 아무 의미없는 jsp로 연결
                window.open("/naver/openWindow.jsp",
                    "popWin",
                    "left=700, top=90, width=537, height=750, marginwidth=0, marginheight=0, fullscreen=no, scrollbars=yes, scrolling=yes, menubar=no, resizable=no");
            })
        })
    </script>


    <script type="text/javascript">
        $(document).ready(function() {
            $('#login').on("click", function() {
                $("form").attr("method", "POST").attr("action", "/user/login").submit();
            });
        });
    </script>

    <title>어울림</title>
</head>

<body>
    <form>
        <div class="wrap">
            <div class="logo">
                <img src="img/twitter_header_photo_1-removebg-preview.png" alt="">
            </div>
            <div>계정을 생성하세요</div>
            <div class="loginForm">
                <div class="id">
                    <p><i class="fas fa-star-of-life"></i>아이디</p>
                    <p><input type="text" name="userId"></p>
                </div>
                <div class="password">
                    <p><i class="fas fa-star-of-life"></i>비밀번호</p>
                    <p><input type="password" name="password" placeholder="비밀번호"></p>
                </div>
                <div class="id">
                    <p><i class="fas fa-star-of-life"></i>비밀번호 확인</p>
                    <p><input type="password" name="userId" placeholder="비밀번호 확인"></p>
                </div>
                <div class="id">
                    <p><i class="fas fa-star-of-life"></i>이름</p>
                    <p><input type="text" name="userId" placeholder="회원 이름"></p>
                </div>
                <div class="id">
                    <p><i class="fas fa-star-of-life"></i>닉네임</p>
                    <p><input type="text" name="userId"></p>
                </div>
                <div class="id">
                    <p><i class="fas fa-star-of-life"></i>학교</p>
                    <p><input type="text" name="userId" placeholder="학교"></p>

                </div>
                <p class="level">
                    <input type="radio" name="level" value="element">초등학교
                    <input type="radio" name="level" value="middle">중학교
                    <input type="radio" name="level" value="high">고등학교
                    <input type="radio" name="level" value="college">대학교
                </p>
                <p><a href="#">주소찾기</a></p>

                <div class="id">
                    <p>휴대전화번호</p>
                    <p><input type="text" name="userId"></p>
                    <p><a href="#">본인인증</a></p>
                </div>
                <div class="id">
                    <p><i class="fas fa-star-of-life"></i>생일</p>
                    <p><input type="text" name="userId" placeholder=""></p>
                </div>
                <div class="id">
                    <p><i class="fas fa-star-of-life"></i>성별</p>

                </div>
                <p class="gender">
                    <input type="radio" name="gender" value="female">여자
                    <input type="radio" name="gender" value="male">남자
                </p>
                <div class="id">
                    <p><i class="fas fa-star-of-life"></i>이메일</p>
                    <p><input type="text" name="userId"></p>
                    <p><a href="#">메일전송</a></p>
                </div>
                <div class="id">
                    <p>사진</p>
                    <p><input type="text" name="userId"></p>
                </div>
                <div>
                    <a href="#" id="login">가입</a>
                    <a href="#" id="login">취소</a>
                </div>
            </div>


        </div>
        <div name="naverLogin" class="text-center">
            <!-- 네이버 아이디로 로그인 이미지 -->
            <img src="/images/naverImage.png" width="180" height="40" />
            <br />
        </div>
    </form>
</body></html>
