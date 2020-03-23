<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>어울림</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="/css/main.css">
    <!--  jQuery CDN -->
    <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
    <!-- bootstrap 4.4 CDN -->

    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
    <!-- jQuery Redirect CDN     https://github.com/mgalante/jquery.redirect  -->
    <script src="https://cdn.rawgit.com/mgalante/jquery.redirect/master/jquery.redirect.js"></script>
    <!-- Modal Alert https://github.com/PureOpenSource/pureAlert  -->
    <script src="/javascript/jquery.bootstrap-pureAlert.js"></script>


    <script src="https://kit.fontawesome.com/6ffe1f5c93.js" crossorigin="anonymous"></script>
    <script src="/javascript/common.js"></script>





    


</head>

<body>
    <div class="wrap">
        <div class="left">
            <div class="leftHeader">
                <img src="/images/twitter_header_photo_1-removebg-preview.png" width="100px" alt="">
            </div>
            
            
            <!--jinLeft include-->
            
            <jsp:include page="/layout/left.jsp" />
            
            
        </div>
        <div class="main">
            <div class="mainHeader">
                <div class="left2">
                    홈
                </div>
                <div class="right2">
                    <a href="#"><i class="far fa-star"></i></a>
                </div>
            </div>
            <div class="mainTop">
                <ul>
                    <li><a href="#">조회수 <i class="fas fa-arrow-up"></i></a></li>
                    <li><a href="#">좋아요 <i class="fas fa-arrow-up"></i></a></li>
                    <li><a href="#">작성일 <i class="fas fa-arrow-up"></i></a></li>
                </ul>
                <div class="search">
                    <select name="" id="">
                        <option value="">내용</option>
                        <option value="">제목</option>
                        <option value="">제목 + 내용</option>
                        <option value="">작성자</option>
                    </select>
                    <input type="text" placeholder="내용을 입력해주세요">
                    <a href="#">검색</a>
                </div>
            </div>
            <div class="postList">
                <div class="post">
                    <a href="#">
                        <div class="uploadFile">
                            <img src="" alt="">
                        </div>
                        <div>
                            <div class="postTop">
                                <div class="postTitle">
                                    <p>제목제목제목</p>
                                    <p>주형진</p>
                                </div>
                                <div class="postCategory">
                                    <p>남자들끼리만</p>
                                    <p>3분전</p>
                                </div>
                            </div>
                            <div class="postContent">
                                Lorem ipsum dolor sit amet, consectetur adipisicing elit. Fugiat facilis doloremque, minima, adipisci eius perferendis alias ipsam commodi inventore quasi nemo corporis repellendus sequi officiis, excepturi rerum unde sapiente. Sequi.
                            </div>
                            <div>
                                <p><i class="far fa-comment"></i> 댓글수</p>
                                <p><i class="far fa-eye"></i> 조회수</p>
                                <p><i class="far fa-heart"></i> 좋아요수</p>
                            </div>
                        </div>
                    </a>
                </div>
                <div class="post">
                    <a href="#">
                        <div class="uploadFile">
                            <img src="/images/20191231507059.jpg" alt="">
                        </div>
                        <div>
                            <div class="postTop">
                                <div class="postTitle">
                                    <p>제목제목제목제목제목제목제목제목제목제목제목제목제목제목</p>
                                    <p>주형진</p>
                                </div>
                                <div class="postCategory">
                                    <p>남자들끼리만</p>
                                    <p>3분전</p>
                                </div>
                            </div>
                            <div class="postContent">
                                Lorem ipsum dolor sit amet, consectetur adipisicing elit. Fugiat facilis doloremque, minima, adipisci eius perferendis alias ipsam commodi inventore quasi nemo corporis repellendus sequi officiis, excepturi rerum unde sapiente. Sequi.
                            </div>
                            <div>
                                <p><i class="far fa-comment"></i> 댓글수</p>
                                <p><i class="far fa-eye"></i> 조회수</p>
                                <p><i class="far fa-heart"></i> 좋아요수</p>
                            </div>
                        </div>
                    </a>
                </div>
                <div class="post">
                    <a href="#">
                        <div class="uploadFile">
                            <img src="" alt="">
                        </div>
                        <div>
                            <div class="postTop">
                                <div class="postTitle">
                                    <p>제목제목제목</p>
                                    <p>주형진</p>
                                </div>
                                <div class="postCategory">
                                    <p>남자들끼리만</p>
                                    <p>3분전</p>
                                </div>
                            </div>
                            <div class="postContent">
                                Lorem ipsum dolor sit amet, consectetur adipisicing elit. Fugiat facilis doloremque, minima, adipisci eius perferendis alias ipsam commodi inventore quasi nemo corporis repellendus sequi officiis, excepturi rerum unde sapiente. Sequi.
                            </div>
                            <div>
                                <p><i class="far fa-comment"></i> 댓글수</p>
                                <p><i class="far fa-eye"></i> 조회수</p>
                                <p><i class="far fa-heart"></i> 좋아요수</p>
                            </div>
                        </div>
                    </a>
                </div>
                <div class="post">
                    <a href="#">
                        <div class="uploadFile">
                            <img src="" alt="">
                        </div>
                        <div>
                            <div class="postTop">
                                <div class="postTitle">
                                    <p>제목제목제목</p>
                                    <p>주형진</p>
                                </div>
                                <div class="postCategory">
                                    <p>남자들끼리만</p>
                                    <p>3분전</p>
                                </div>
                            </div>
                            <div class="postContent">
                                Lorem ipsum dolor sit amet, consectetur adipisicing elit. Fugiat facilis doloremque, minima, adipisci eius perferendis alias ipsam commodi inventore quasi nemo corporis repellendus sequi officiis, excepturi rerum unde sapiente. Sequi.
                            </div>
                            <div>
                                <p><i class="far fa-comment"></i> 댓글수</p>
                                <p><i class="far fa-eye"></i> 조회수</p>
                                <p><i class="far fa-heart"></i> 좋아요수</p>
                            </div>
                        </div>
                    </a>
                </div>
                <div class="post">
                    <a href="#">
                        <div class="uploadFile">
                            <img src="" alt="">
                        </div>
                        <div>
                            <div class="postTop">
                                <div class="postTitle">
                                    <p>제목제목제목</p>
                                    <p>주형진</p>
                                </div>
                                <div class="postCategory">
                                    <p>남자들끼리만</p>
                                    <p>3분전</p>
                                </div>
                            </div>
                            <div class="postContent">
                                Lorem ipsum dolor sit amet, consectetur adipisicing elit. Fugiat facilis doloremque, minima, adipisci eius perferendis alias ipsam commodi inventore quasi nemo corporis repellendus sequi officiis, excepturi rerum unde sapiente. Sequi.
                            </div>
                            <div>
                                <p><i class="far fa-comment"></i> 댓글수</p>
                                <p><i class="far fa-eye"></i> 조회수</p>
                                <p><i class="far fa-heart"></i> 좋아요수</p>
                            </div>
                        </div>
                    </a>
                </div>

            </div>
        </div>
        <div class="right">
            
            <!--duckRight include-->
            <jsp:include page="/layout/right.jsp" />
            
        </div>
    </div>
</body>

</html>
