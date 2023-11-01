# jspGameSite
- 게임 웹사이트 제작
- 개인 프로젝트
- 기존의 SpringBoot 기반으로 작업하던 gameSite 프로젝트를 jsp 버전으로 변경해서 작업하기

<br/>


# 프로젝트 개요
- **프로젝트명** : jspGameSite
- **프로젝트 소개** : 보편적인 게임 사이트의 메인페이지 구현을 목적으로 프로젝트 진행
- **프로젝트 주제 선별 이유** : 게시판 기반 웹사이트 중 게임의 웹사이트가 흥미가 생겨 주제 선정
- **개발 인원** : 1명.
- **개발 기간** : 미정
- **주요 기능** 
  - 개발 구상 단계
- **백엔드 개발 언어** 
  - `Java`
- **백엔드 개발 환경** 
  - `Windows 10`
  - `Eclipse`
  - `Gradle`
  - `JPA`
- **프론트 개발 환경 및 언어**
  - `jsp`
  - `Bootstrap`
  
- **데이터베이스**
  - `mySQL`
  
- **관리**
  - `Github`
  
  
# 개발 예정 항목

**주요 사항** - 완료여부 (o,x)로 표기
  - 회원가입 시 유효성 검사. (x)
  - 마이페이지 기능. (x)
  - 공지사항 게시물 CRUD, 커뮤니티 게시글에 이미지 등록 기능. (x)
  - 유튜브 영상을 링크 방식으로 업로드 시 영상의 썸네일을 이미지로 가져오는 기능(o)


# 개발 예정 포인트
- db설계시 FK 걸어서 join 이용하기
- 프론트 작업은 실제 게임사이트를 기반으로 비슷해 보이도록 가볍게 따라하는 것이 목표
- 프로젝트 진행 전 설계 체계화해서 최대한 중간에 설계가 바뀌는 일이 안생기도록 하기
  - 해당 블로그 참조(https://velog.io/@jyleedev/Helpring-%ED%94%84%EB%A1%9C%EC%A0%9D%ED%8A%B8-%EB%AA%85%EC%84%B8%EC%84%9C)
  ## db 설계 예시
![](https://velog.velcdn.com/images/jyleedev/post/6acdd68f-a8b4-4487-8115-1df94b4a3161/image.png)
  ## 클래스 설계 예시
![](https://velog.velcdn.com/images/jyleedev/post/10d74870-b757-4f2c-8fb4-de64dcea7b5e/image.png)

- n사의 게임과 s사의 게임 사이트를 참고하여 ui배치 설계
  - 피그마로 간단한 배치 구상(https://www.figma.com/file/qHkjVwE8y7lluQxgZZlKO0/%EA%B2%8C%EC%9E%84-%EC%9B%B9%EC%82%AC%EC%9D%B4%ED%8A%B8-%EA%B5%AC%EC%83%81%EB%8F%84?type=design&node-id=0%3A1&mode=design&t=dhAyEm2cgMa57XA4-1)
