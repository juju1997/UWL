# UWL project
#### UWL(어울림) : 10대 20대 학생들을 타겟으로한 소셜 네트워크 서비스
_* 기존 SNS의 기능에 "연애" 라는 요소를 추가한 종합 플랫폼_

- 개발기간 : 2020.01.01 ~ 2020.03.11 (총 2개월)
    + 분석 및 설계 : 2020.01.01 ~ 2020.01.24
    + 구현 : 2020.01.27 ~ 2020.03.07
    
- 참여인원 : 6명

- 아키텍처 : Model2 MVC Pattern

- 전체모듈 : 회원관리, 도전과제, 친구, 커뮤니티, 타임라인, 스케쥴러, 결제, 채팅, 신고관리

# 사용 기술
- Front-end : HTML5, JavaScript, CSS3, jQuery, Ajax, BootStrap, SummerNote, Google Fonts
- Back-end : Java, Spring, Apache Tomcat, Node.js, Mybatis, Express, Socket.io, Firebase, WebSocket
- DataBase : Oracle, MongoDB
- Open-API : NaverLogin, I'mport, danbee, careerNet
- Tool : Eclipse, VSCode, DBeaver, sqlDeveloper, Mongo3T

# 담당 모듈 : 커뮤니티 / 채팅 / 신고관리
### 1. 커뮤니티
 - 게시판CRUD 와 댓글CRUD 기능, 조회 수, 좋아요 수, 댓글 수 확인 가능
 - 게시글 작성의 경우 SummerNote 사용
 - 게시글 작성 이외의 모든 작업은 Ajax를 이용
 
### 2. 채팅
  - 친구가 되어있는 회원과의 채팅
  - 이전 채팅 확인 기능
  - 새로운 채팅 알림 기능
  - 채팅방 삭제 기능
  - Node.js (Socket.io) 이용
  - 채팅 내용은 MongoDB에 저장
### 3. 신고관리
  - 모든 유저는 부적절한 댓글, 게시글에 대해서 신고 가능
  - 관리자는 접수된 신고 처리 가능 (특정 일수 이용 제재)
  - 관리자의 부적절한 신고 처리에 대한 신고 철회 가능

# 참고
  - 전체 발표 영상 : https://www.youtube.com/watch?v=jza2T5Yfd8E&t=6s (32:25)
  - 담당 발표 영상 : https://www.youtube.com/watch?v=2h9cqB5FFnc (3:45)
  
