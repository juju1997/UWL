
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
    

    

    
</head>

<body>
    <br>
    <h4><a id="master" href="#">&nbsp;<i class="fas fa-crown"></i>&nbsp;&nbsp;관리자<i class="fas fa-caret-down"></i></a></h4>
    <div id="goMaster">
        <ul>
            <li>
                <h6><a href="#" id="userList">전체회원 목록</a></h6>
            </li>
            <li>
                <h6><a href="#" id="challengeControl">도전과제 관리</a></h6>
            </li>
            <li>
                <h6><a href="#" id="reportList">신고목록 확인</a></h6>
            </li>
        </ul>
    </div>

    <br><br>

    <h4><a id="home" href="#">&nbsp;<i class="fas fa-home"></i>&nbsp;&nbsp;홈</a></h4>

    <br><br>

    <h4 class="img"><a id="myProfile" href="#">&nbsp;
            <c:if test="${user.profileName eq null}">
                <img src='/images/defaultProfile.png' style='border-radius: 50%;' width='35px' height='35px' />
            </c:if>
            <c:if test="${user.profileName ne null}">
                <img src='/images/${user.profileName }' style='border-radius: 50%;' width='35px' height='35px' />
            </c:if>
            내 프로필
        </a></h4>


    <br><br>
    <h4><a id="community" href="#">&nbsp;<i class="far fa-list-alt"></i>&nbsp;&nbsp;커뮤니티<i class="fas fa-caret-down"></i></a></h4>
    <div id="goCommunity">
        <ul>
            <li>
                <h6><a href="#" id="201">진학상담</a></h6>
            </li>
            <li>
                <h6><a href="#" id="202">사랑과 이별</a></h6>
            </li>
            <li>
                <h6><a href="#" id="203">남자끼리</a></h6>
            </li>
            <li>
                <h6><a href="#" id="204">여자끼리</a></h6>
            </li>
            <li>
                <h6><a href="#" id="205">데이트자랑</a></h6>
            </li>
            <li>
                <h6><a href="#" id="206">대나무 숲</a></h6>
            </li>
        </ul>
    </div>

    <br><br>

    <h4><a id="challenge" href="#">&nbsp;<i class="fas fa-running"></i>&nbsp;&nbsp;도전과제<i class="fas fa-caret-down"></i></a></h4>
    <div id="goChallenge">
        <ul>
            <li>
                <h6><a href="#" id="doChallenge">진행중인 도전과제</a></h6>
            </li>
            <li>
                <h6><a href="#" id="completeChallenge">완료한 도전과제</a></h6>
            </li>
            <li>
                <h6><a href="#" id="checkSchoolRanking">학교별 랭킹</a></h6>
            </li>
        </ul>
    </div>

    <br><br>

    <h4><a id="more" href="#">&nbsp;<i class="fas fa-plus"></i>&nbsp;&nbsp;더보기<i class="fas fa-caret-down"></i></a></h4>
    <div id="goMore">
        <ul>
            <li>
                <h6><a href="#" id="notice">공지사항</a></h6>
            </li>
            <li>
                <h6><a href="#" id="question">문의사항</a></h6>
            </li>
        </ul>
    </div>

</body>

</html>
