<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <!--  ///////////////////////// Bootstrap 4.4, jQuery 3.1.1 CDN ////////////////////////// -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.2.1.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <script src="https://kit.fontawesome.com/4b823cf630.js" crossorigin="anonymous"></script>

    <style>
        .toggle {
            display: none;
            position: fixed;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            /*  	overflow: hidden;  */
            /*  	data-backdrop: static;  */
            /*  	data-keyboard: false;  */
        }

        .toggle.on {
            display: block;
        }
    </style>


    <script type="text/javascript">
        $(document).ready(function() {
            $("#fileInput").on('change', function() { // 값이 변경되면
                if (window.FileReader) { // modern browser
                    var filename = $(this)[0].files[0].name;
                } else { // old IE
                    var filename = $(this).val().split('/').pop().split('\\').pop(); // 파일명만 추출
                }

                // 추출한 파일명 삽입
                $("#userfile").val(filename);
            });
        });

        //============= "수정"  Event 연결 =============
        $(function() {
            //==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
            $('#updateUserButton').on("click", function() {
                fncUpdateUser();
            });
        });

        function fncUpdateUser() {
            // 		var password=$("input[name='password']").val();
            var password = $("input:password").val();
            if (password == null || password.length < 1) {
                $('#not').remove();
                var view = "<span id='not' style='color:red'> <br>비밀번호는 반드시 입력하셔야 합니다.</span>";
                $('#password').after(view);
                $('#password').focus();
                return;
            }

            $("#user").attr("method", "POST").attr("action", "/user/updateUser").submit();
        }
        ///////////////////////////////////////////////////////////////////////
    </script>
    <link href="https://fonts.googleapis.com/css?family=Nanum+Gothic|Roboto&display=swap" rel="stylesheet">
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

        a:hover,
        a:focus {
            text-decoration: none;
            color: inherit;
        }

        body {
            color: #333;
            font-size: 16px;
            font-family: 'Roboto', sans-serif;
            font-family: 'Nanum Gothic', sans-serif;


        }

        div.layoutWrap2 {
            width: 1500px;
            height: 100vh;


            overflow: hidden;
            margin: 0 auto;
        }

        div.leftToolbar2 {

            width: 300px;
            height: 100vh;
            float: left;
            background-color: #fff;
            border-right: 1px solid #eee;

        }

        div.work2 {

            width: 900px;
            height: 100vh;
            float: left;
            overflow: hidden;
            overflow-y: scroll;
            background-color: #eee;


        }

        div.rightToolbar2 {

            width: 300px;
            height: 100vh;
            float: left;
            background-color: #fff;
            border-left: 1px solid #eee;


        }
    </style>
</head>

<body>
    <div class="layoutWrap2">
        <div class="leftToolbar2">
            <jsp:include page="/layout/left.jsp" />
        </div>
        <div class="work2">
            <!-- ToolBar Start /////////////////////////////////////-->
            <div>
                <a>
                    <h2>회원정보수정</h2>
                </a>
            </div>
            <!-- ToolBar End /////////////////////////////////////-->

            <form id="user" enctype="multipart/form-data">
                <table class="table table-hover text-center" id="table">
                    <tr>
                        <td> 아 이 디 </td>
                        <td> <input type="hidden" name="userId" value="${user.userId}" readonly>${user.userId} </td>
                    </tr>
                    <tr>
                        <td> 이 름 </td>
                        <td> <input type="hidden" name="name" value="${user.name}" readonly>${user.name} </td>
                    </tr>
                    <tr>
                        <td> 비밀번호 </td>
                        <td> <input type="text"=name="password" value="${user.password}" id="password"> </td>
                    </tr>
                    <tr>
                        <td> 닉 네 임 </td>
                        <td> <input type="text" name="nickname" value="${user.nickname}"> </td>
                    </tr>
                    <tr>
                        <td> 학 교 </td>
                        <td> <input type="text" name="schoolNo" value="${user.schoolNo}"> </td>
                    </tr>
                    <tr>
                        <td> 전화번호 </td>
                        <td> <input type="text" name="phone" value="${user.phone}"> </td>
                    </tr>
                    <tr>
                        <td> 생 일 </td>
                        <td> <input type="hidden" name="birth" value="${user.birth}" readonly> ${user.birth} </td>
                    </tr>
                    <tr>
                        <td> 성 별 </td>
                        <td>
                            <c:if test="${user.gender == '1' }">
                                <input type="hidden" name="gender" value="${user.gender}" readonly> 여자
                            </c:if>
                            <c:if test="${user.gender == '2'}">
                                <input type="hidden" name="gender" value="${user.gender}" readonly> 남자
                            </c:if>
                        </td>
                    </tr>
                    <tr>
                        <td> 메 일 </td>
                        <td> <input type="text" name="mail" value="${user.mail}"> </td>
                    </tr>
                    <tr>
                        <td> 사 진 </td>
                        <td>
                            <!--<div class="form-group">
                                <input name="file" id="fileInput" type="file" data-class-button="btn btn-default" data-class-input="form-control" data-button-text="" data-icon-name="fa fa-upload" class="form-control" tabindex="-1" style="position: absolute; clip: rect(0px 0px 0px 0px);">
                                <div class="bootstrap-filestyle input-group">
                                    <input type="text" id="userfile" class="form-control" name="userfile" readonly="readonly" placeholder="${user.profileName}">
                                    <span class="group-span-filestyle input-group-btn" tabindex="0">
                                        <label for="fileInput" class="btn btn-default ">
                                            <span class="glyphicon fa fa-upload"></span>
                                        </label>
                                    </span>
                                </div>
                            </div>-->
                        </td>
                    </tr>
                    <tr>
                        <td> 공개설정 </td>
                        <td> <input type="radio" name="publicStatus" value="1" checked> 공개 &nbsp;
                            <input type="radio" name="publicStatus" value="2"> 비공개
                        </td>
                    </tr>
                </table>
                <br><br>
                <div class="text-center">
                    <button type="button" id="updateUserButton" class="btn btn-outline-info btn-lg">완료</button>
                </div>
            </form>
        </div>
        <div class="rightToolbar2">
            <jsp:include page="/layout/right.jsp" />
        </div>
    </div>
</body>

</html>