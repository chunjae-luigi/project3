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
	INT grade DEFAULT 1,-- 등급: 0 관리자, 1 학부모, 2 학생
);

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

-- notice
CREATE TABLE notice(
      no INT PRIMARY KEY AUTO_INCREMENT,   -- (게시글 번호) 자동 발생
      title VARCHAR(200) NOT NULL,   -- (게시글 제목)
      content VARCHAR(1000),   -- (게시글 내용)
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

-- qna
CREATE TABLE qna(
	qno INT PRIMARY KEY AUTO_INCREMENT,   -- (문의번호) 자동발생
	title VARCHAR(100) NOT NULL,   -- (문의 제목)
	content VARCHAR(1000) NOT NULL,   -- (문의 내용)
	author VARCHAR(16),   -- (문의 작성자)
	regdate TIMESTAMP DEFAULT CURRENT_TIMESTAMP(),   -- (문의 등록)
	visited INT DEFAULT 0,   -- (조회수)
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

-- 학습 자료실 자료
CREATE TABLE dataFile(
	fno INT PRIMARY KEY AUTO_INCREMENT,
	fileName VARCHAR(100),
	fileType VARCHAR(100),
	relations VARCHAR(20) DEFAULT 'dataBoard', -- dataFile 테이블을 참조하는 테이블. dataBoard 이외에 다른 테이블에서 dataFile을 참조하는 경우를 대비함.
	bno INT NOT NULL
)