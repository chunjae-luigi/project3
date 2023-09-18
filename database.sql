USE team43;

-- member
CREATE TABLE MEMBER(
	id VARCHAR(20) PRIMARY KEY,   -- (아이디)
	pw VARCHAR(300) NOT NULL,   -- (비밀번호)
	NAME VARCHAR(100) NOT NULL,   -- (이름)
	email VARCHAR(100) NOT NULL,   -- (이메일)
	tel VARCHAR(13),   -- (전화번호)
	addr1 VARCHAR(200),
	addr2 VARCHAR(100),
	postcode VARCHAR(10),
	regdate TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,   -- (가입일)
	birth DATE, -- 생일
	POINT INT DEFAULT 0,   -- (포인트)
	grade INT DEFAULT 1-- 등급: 0 관리자, 1 학부모, 2 학생
);

INSERT INTO MEMBER VALUES('admin', '$2a$10$oS1.3wpbnpIanIW4RoXxSOea/vGIijBMpLUBxZqurQqNjjMiJHgGa', '관리자', 'admin@tspoon.co.kr', '010-1234-5678', '', '', '', DEFAULT, NULL, DEFAULT, 0);

-- board
CREATE TABLE board(
	bno INT PRIMARY KEY AUTO_INCREMENT,   -- (게시글 번호) 자동 발생
	boardType varchar(15) NOT NULL,   -- 게시글 타입: notice, faq, forum, fileboard
	title VARCHAR(200) NOT NULL,   -- (게시글 제목)
	content VARCHAR(1000),   -- (게시글 내용)
	author VARCHAR(16) NOT NULL,   -- (작성자)
	relations VARCHAR(20) DEFAULT 'no', -- 관련 테이블. forum - dat 테이블, fileboard - file 테이블
	regdate TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,   -- (등록일)
	visited INT DEFAULT 0   -- (조회수)
);



-- free
CREATE TABLE free(
	fno INT PRIMARY KEY AUTO_INCREMENT,   -- (게시글 번호) 자동 발생
	title VARCHAR(200) NOT NULL,   -- (게시글 제목)
	content VARCHAR(1000),   -- (게시글 내용)
	author VARCHAR(16) NOT NULL,   -- (작성자)
	regdate TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,   -- (등록일)
	visited INT DEFAULT 0   -- (조회수)
);

-- datgeul
CREATE TABLE dat(
	dno INT PRIMARY KEY AUTO_INCREMENT,   -- (댓글번호) 자동발생
	author VARCHAR(16) NOT NULL,   -- (댓글 작성자)
	content VARCHAR(1000) NOT NULL,   -- (댓글 내용)
	regdate TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,   -- (댓글 등록일)
	par INT(11) NOT NULL   -- (해당 게시글 번호)
);

-- notice
CREATE TABLE notice(
      no INT PRIMARY KEY AUTO_INCREMENT,   -- (게시글 번호) 자동 발생
      title VARCHAR(200) NOT NULL,   -- (게시글 제목)
      content VARCHAR(1000),   -- (게시글 내용)
      regdate TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,   -- (등록일)
      visited INT DEFAULT 0   -- (조회수)
);

-- qna
CREATE TABLE qna(
	qno INT PRIMARY KEY AUTO_INCREMENT,   -- (문의번호) 자동발생
	title VARCHAR(100) NOT NULL,   -- (문의 제목)
	content VARCHAR(1000) NOT NULL,   -- (문의 내용)
	author VARCHAR(16),   -- (문의 작성자)
	regdate TIMESTAMP DEFAULT CURRENT_TIMESTAMP(),   -- (문의 등록)
	cnt INT DEFAULT 0,   -- (조회수)
	lev INT DEFAULT 0, -- 질문(0), 답변(1)
	par INT DEFAULT 0	-- 부모 글번호 -> 질문(자신 레코드의 qno), 답변(질문의 글번호)
);

-- 학습 자료실
CREATE TABLE dataBoard(
	bno INT PRIMARY KEY AUTO_INCREMENT,   -- (게시글 번호) 자동 발생
	title VARCHAR(200) NOT NULL,   -- (게시글 제목)
	content VARCHAR(1000),   -- (게시글 내용)
	author VARCHAR(16) NOT NULL,   -- (작성자)
	relations VARCHAR(20) DEFAULT 'no', -- dataFile table에 관련 자료가 있는지 여부.
	regdate TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,   -- (등록일)
	visited INT DEFAULT 0   -- (조회수)
);

CREATE TABLE vote(
    vno INT AUTO_INCREMENT PRIMARY KEY,								    -- 투표번호 : 자동증가
    title VARCHAR(200) NOT NULL,										-- 투표제목
    content VARCHAR(1000) NOT NULL,									    -- 투표내용
    regDate TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,		        -- 투표등록일
    visited INT DEFAULT 0,												-- 조회수
    startDate DATE,														-- 투표 시작일
    finishDate DATE,													-- 투표 종료일
    useYn BOOLEAN DEFAULT FALSE,										-- 투표 사용여부 - 사용자 화면에 띄울지 말지 선택
    stateYn BOOLEAN DEFAULT TRUE,										-- 투표 상태여부 - 종료, 진행 상태
    answer INT,															-- 투표 결과 lno
    addPt INT NOT NULL 													-- 완료후 등록될 포인트
);

CREATE TABLE voteAnswerList(
   lno INT AUTO_INCREMENT PRIMARY KEY,								-- 질문지 내역 번호 : 자동증가
   vno INT NOT NULL,												-- 질문지 해당 투표번호
   title VARCHAR(200) NOT NULL										-- 질문지 제목
);

CREATE TABLE voteAnswerUser(
   uno INT AUTO_INCREMENT PRIMARY KEY,								-- 질문자 번호 : 자동증가
   vno INT NOT NULL,												-- 질문지 해당 투표번호
   lno INT NOT NULL,												-- 질문지 해당 번호
   author VARCHAR(20) NOT NULL										-- 질문자 아이디
);

CREATE VIEW voteCount AS (SELECT l.lno AS lno, l.vno AS vno, l.title AS title, COUNT(u.uno) AS cnt FROM voteanswerlist l LEFT JOIN voteansweruser u ON l.lno = u.lno GROUP BY l.lno);
