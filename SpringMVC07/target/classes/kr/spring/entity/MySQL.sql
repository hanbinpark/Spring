CREATE TABLE TBLBOARD(
	IDX INT NOT NULL,
	MEMID VARCHAR(20) NOT NULL,
	TITLE VARCHAR(100) NOT NULL,
	CONTENT VARCHAR(2000) NOT NULL,
	WRITER VARCHAR(30) NOT NULL,
	INDATE DATETIME DEFAULT NOW(),
	COUNT INT DEFAULT 0,
	-- 댓글기능 추가 --
	BOARDGROUP INT, -- 부모댓글 하나의 그룹 --
	BOARDSEQUENCE INT, -- 같은 그룹안에서 댓글의 순서 --
	BOARDLEVEL INT, -- 1단계 댓글인지 2단계 댓글인지에 대한 정보 -- 
	BOARDAVAILABLE INT, -- 삭제된 글인지 여부 --
	PRIMARY KEY(IDX)
);

INSERT INTO TBLBOARD
SELECT IFNULL(MAX(IDX + 1),1),
'aischool','공지사항입니다.','다음주 월요일 정상 등원하겠습니다', '교육운영부',
NOW(), 0, IFNULL(MAX(BOARDGROUP + 1), 1), 0 , 0, 1 
FROM TBLBOARD;

INSERT INTO TBLBOARD
SELECT IFNULL(MAX(IDX + 1),1),
'pbk','Spring반 친구들~','맛있는 간식 사줄게요~', '병관쌤',
NOW(), 0, IFNULL(MAX(BOARDGROUP + 1), 1), 0 , 0, 1 
FROM TBLBOARD;

INSERT INTO TBLBOARD
SELECT IFNULL(MAX(IDX + 1),1),
'jjy','여러분 지각 ㄴㄴ','아침마다 연락 자주받는 친구들 알겠지?', '준용쌤',
NOW(), 0, IFNULL(MAX(BOARDGROUP + 1), 1), 0 , 0, 1 
FROM TBLBOARD;

SELECT * FROM TBLBOARD;

-- MEMBER --
CREATE TABLE TBLMEMBER(
	MEMID VARCHAR(50) NOT NULL,
	MEMPWD VARCHAR(50) NOT NULL,
	MEMNAME VARCHAR(50) NOT NULL,
	MEMPHONE VARCHAR(50) NOT NULL,
	MEMADDR VARCHAR(100),
	LATITUDE DECIMAL(13,10), -- 현재 위치 위도 --
	LONGITUDE DECIMAL(13,10), -- 현재 위치 경도 --
	PRIMARY KEY(MEMID)
);

INSERT INTO TBLMEMBER(MEMID, MEMPWD, MEMNAME, MEMPHONE)
VALUES(	'aischool', '1234', '교육운영부', '010-1111-1111');
INSERT INTO TBLMEMBER(MEMID, MEMPWD, MEMNAME, MEMPHONE)
VALUES(	'pbk', '1234', '병관쌤', '010-2222-2222');
INSERT INTO TBLMEMBER(MEMID, MEMPWD, MEMNAME, MEMPHONE)
VALUES(	'jjy', '1234', '준용쌤', '010-3333-3333');

SELECT * FROM TBLMEMBER;