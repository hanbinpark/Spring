-- SQL 문장 작성 --
CREATE TABLE BOARD(
	IDX INT NOT NULL AUTO_INCREMENT,
	TITLE VARCHAR(100) NOT NULL,
	CONTENT VARCHAR(2000) NOT NULL,
	WRITER VARCHAR(30) NOT NULL,
	INDATE DATETIME DEFAULT NOW(),
	COUNT INT DEFAULT 0,
	PRIMARY KEY(IDX)
);

INSERT INTO BOARD(TITLE, CONTENT, WRITER) 
VALUES ('안녕하세요!','MY SQL 화이팅','준용쌤');

INSERT INTO BOARD(TITLE, CONTENT, WRITER) 
VALUES ('담주 팀편성','팀장 지원하실 분~?','명훈쌤');

INSERT INTO BOARD(TITLE, CONTENT, WRITER) 
VALUES ('오늘의 간식은!','버터와플','준용쌤');

INSERT INTO BOARD(TITLE, CONTENT, WRITER) 
VALUES ('SQLD 언제야?','이번주 토요일ㅜ','박한빈');

INSERT INTO BOARD(TITLE, CONTENT, WRITER) 
VALUES ('노티드 맛있지','우유가 근본','노티드');

SELECT * FROM BOARD;