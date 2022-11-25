---------------------------------------------------
-- ���̳� ������Ʈ : UFO (Ur Favorite OTT)
---------------------------------------------------
-- �����ڰ������� UFO ���� ���� �� ���� �ο�
-- CREATE USER UFO IDENTIFIED BY UFO;
-- GRANT CONNECT, RESOURCE TO UFO;
---------------------------------------------------


---------------------------------------------------
-- TABLE �� SEQUENCE �ʱ�ȭ

DROP TABLE REPORT;              -- �Ű� ���̺�
DROP TABLE NOTICE;              -- �������� ���̺�
DROP TABLE COMMUNITY_REPLY;     -- Ŀ�´�Ƽ ��� ���̺�
DROP TABLE COMMUNITY;           -- Ŀ�´�Ƽ �� ���̺�
DROP TABLE PAYMENT_REGULAR;     -- ���� ���� ���̺�
DROP TABLE PAYMENT;             -- �Ϲ� ���� ���̺�
DROP TABLE REVIEW;              -- �������ڸ�Ʈ ���̺�
DROP TABLE DIB;                 -- �� ���̺�
DROP TABLE RECORD;              -- ��û ���� ���̺�
DROP TABLE EPISODE;             -- TV ���Ǽҵ� ���̺�
DROP TABLE TV;                  -- TV ���α׷� ���̺�
DROP TABLE MOVIE;               -- ��ȭ ���̺�
DROP TABLE MEMBER;                -- ȸ�� ���̺�

DROP SEQUENCE SEQ_USER_NO;      -- ȸ�� ��ȣ ������
DROP SEQUENCE SEQ_RECORD_NO;    -- ��û ���� ������
DROP SEQUENCE SEQ_REVIEW_NO;    -- ���� ��� ��ȣ ������
DROP SEQUENCE SEQ_PAY_NO;       -- �Ϲ� ���� ��ȣ ������
DROP SEQUENCE SEQ_REG_NO;       -- ���� ���� ��ȣ ������
DROP SEQUENCE SEQ_COM_NO;       -- Ŀ�´�Ƽ �� ��ȣ ������
DROP SEQUENCE SEQ_COM_RPL_NO;   -- Ŀ�´�Ƽ ��� ��ȣ ������
DROP SEQUENCE SEQ_NOTICE_NO;    -- �������� ��ȣ ������
DROP SEQUENCE SEQ_REPORT_NO;    -- �Ű� ���� ��ȣ ������


---------------------------------------------------
-- TABLE �� SEQUENCE ���� | ���� ������ INSERT

--------------------------------------------------
------------------- ȸ�� (MEMBER) ------------------
--------------------------------------------------
CREATE TABLE MEMBER (    
    USER_NO NUMBER CONSTRAINT USER_NO_PK PRIMARY KEY, 
    USER_ID VARCHAR2(40) CONSTRAINT USER_ID_NN NOT NULL CONSTRAINT USER_ID_UQ UNIQUE,
    USER_PWD VARCHAR2(200) CONSTRAINT USER_PWD_NN NOT NULL,
    USER_NICKNAME VARCHAR2(50) CONSTRAINT USER_NICKNAME_NN NOT NULL CONSTRAINT USER_NICKNAME_UQ UNIQUE,
    USER_PROFILE NUMBER DEFAULT 1 CONSTRAINT USER_PROFILE_NN NOT NULL,
    USER_ENROLL_DATE DATE DEFAULT SYSDATE CONSTRAINT USER_ENROLL_DATE_NN NOT NULL,
    USER_STATUS CHAR(1) DEFAULT 'Y' CONSTRAINT USER_STATUS_NN NOT NULL CONSTRAINT USER_STATUS_CK CHECK(USER_STATUS IN ('Y', 'N'))
);

COMMENT ON COLUMN MEMBER.USER_NO IS 'ȸ����ȣ';
COMMENT ON COLUMN MEMBER.USER_ID IS 'ȸ�����̵�';
COMMENT ON COLUMN MEMBER.USER_PWD IS 'ȸ����й�ȣ';
COMMENT ON COLUMN MEMBER.USER_NICKNAME IS 'ȸ���г���';
COMMENT ON COLUMN MEMBER.USER_PROFILE IS 'ȸ�������ʻ���';
COMMENT ON COLUMN MEMBER.USER_ENROLL_DATE IS 'ȸ�������Ͻ�';
COMMENT ON COLUMN MEMBER.USER_STATUS IS 'ȸ������';
    
CREATE SEQUENCE SEQ_USER_NO NOCACHE;

INSERT INTO MEMBER    -- 0 (������) : kh3aliens
VALUES (0, 'urfavoriteott@gmail.com', '$2a$10$Q0nFH3v.9EuSDK5uyOz50eVHr4LfF223y3q2zIQfHIVj8uf70Mfmm', 'UrFavoriteOTT', 0, TO_DATE('2020/01/01 00:00:00', 'RRRR/MM/DD HH24:MI:SS'), 'Y');

INSERT INTO MEMBER    -- 1 (�Ѵ���) : doitdoit22
VALUES (SEQ_USER_NO.NEXTVAL, 'zkalkal27@gmail.com', '$2a$10$RUSc.NiEjWs1dK0E9oonheHgtG2prn3XGO.JOdJyiD4Ca2e6rF.gu', 'RayJun', 2, TO_DATE('2020/01/02 12:27:46', 'RRRR/MM/DD HH24:MI:SS'), 'Y');

INSERT INTO MEMBER    -- 2 (�����) : kingodpuppy
VALUES (SEQ_USER_NO.NEXTVAL, 'shallwetyping@gmail.com', '$2a$10$/Mp49QTJC/Br98BjR/QZze/RanZujr922A98NmiBz1MRZJoKL.k3e', 'õ�簭��', 7, TO_DATE('2020/01/02 16:45:02', 'RRRR/MM/DD HH24:MI:SS'), 'Y');

INSERT INTO MEMBER    -- 3 (�ڼ���) : backendgod
VALUES (SEQ_USER_NO.NEXTVAL, 'pshysd@kakao.com', '$2a$10$NDayBSUEdb5mHx/DgjiTJuw7zYfGv39TeVF9mxLI.XSnxn9i13vJG', 'pshysd', 4, TO_DATE('2020/01/03 02:19:33', 'RRRR/MM/DD HH24:MI:SS'), 'Y');

INSERT INTO MEMBER    -- 4 (�ŵ���) : yesman1838
VALUES (SEQ_USER_NO.NEXTVAL, 'dongmin1838@gmail.com', '$2a$10$o9nL0Jtnh0chohb0JwgeVetD0rxsUGYcsvlHVWfe9dBEWB/R8yI0a', 'dongmin38', 3, TO_DATE('2020/01/03 21:04:37', 'RRRR/MM/DD HH24:MI:SS'), 'Y');

INSERT INTO MEMBER    -- 5 (����) : frontendgod
VALUES (SEQ_USER_NO.NEXTVAL, 'loveve1993@gmail.com', '$2a$10$9b7ojHZGwaxSyl0neF2LceXH/bTqwREZhVt2zxYsJpmsqYkbhGAre', 'hyne993', 9, TO_DATE('2020/01/04 09:59:25', 'RRRR/MM/DD HH24:MI:SS'), 'Y');

INSERT INTO MEMBER    -- 6 (Ȳ����) : cheerleader
VALUES (SEQ_USER_NO.NEXTVAL, 'heajin0903@gmail.com', '$2a$10$3tZzygbS7UpvRhPWCf0Rn.3PxmtCp92/7ewlvbX1WgN39Idtd8yY.', 'Ardbeg22', 10, TO_DATE('2020/01/04 14:19:36', 'RRRR/MM/DD HH24:MI:SS'), 'Y');

INSERT INTO MEMBER    -- 7 [Ż��1] : xx4960ifg
VALUES (SEQ_USER_NO.NEXTVAL, 'saloy23651@hoxds.com', '$2a$10$HCoYXyfj60ozZzqusBsYt.Pt/PUlk0L.MWea6aaNWSzDCboGa224i', '����', 1, TO_DATE('2020/01/05 07:27:21', 'RRRR/MM/DD HH24:MI:SS'), 'N');

INSERT INTO MEMBER    -- 8 (�׽�Ʈ1) : doit44@
VALUES (SEQ_USER_NO.NEXTVAL, 'zjkalkal27@gmail.com', '$2a$10$jI5/ng9JRk0HqFeZZ31iCuTOo3.46dBNLzWU4GLzsCFZs9BstnNzm', '�ΰ���', 5, TO_DATE('2020/01/05 11:48:09', 'RRRR/MM/DD HH24:MI:SS'), 'Y');

INSERT INTO MEMBER    -- 9 [Ż��2] : SaveMe
VALUES (SEQ_USER_NO.NEXTVAL, 'mijix47104@hoxds.com', '$2a$10$.gnw/jk64.pvbBftvQbvnOIspCQI807gsIiYJrbYQF8dytOuEYN3i', '�����', 2, TO_DATE('2020/01/05 19:12:29', 'RRRR/MM/DD HH24:MI:SS'), 'N');

INSERT INTO MEMBER    -- 10 (�׽�Ʈ2) : doit77*
VALUES (SEQ_USER_NO.NEXTVAL, 'rayjun_ddubi@naver.com', '$2a$10$a00mc5arZmmEjD3rCDywreZcq6HiXE.Mtodp8mvqRcg78N8aB.woC', '�κΰ���', 6, TO_DATE('2020/01/07 15:34:38', 'RRRR/MM/DD HH24:MI:SS'), 'Y');

INSERT INTO MEMBER    -- 11 [Ȱ��1] : dsfjh38
VALUES (SEQ_USER_NO.NEXTVAL, 'daceciw345@ktasy.com', '$2a$10$S8lyAbVkz2rKh6c4nof75ewwNSWTNVFsbV6.UJmteJ7rCe7MsC0KG', '��ȭ����', 8, TO_DATE('2020/01/07 17:52:17', 'RRRR/MM/DD HH24:MI:SS'), 'Y');

INSERT INTO MEMBER    -- 12 [Ȱ��2] : KillMe
VALUES (SEQ_USER_NO.NEXTVAL, 'tagome6500@keshitv.com', '$2a$10$d.nbsbSgpT4c7ZYPxk5Wfeihaw5RkyqsZDC94oLSMWUBpPs4C.e/C', '������ĸƾ', 5, TO_DATE('2020/01/07 22:48:41', 'RRRR/MM/DD HH24:MI:SS'), 'Y');


--------------------------------------------------
------------------ ��ȭ (MOVIE) ------------------
--------------------------------------------------
CREATE TABLE MOVIE (
    MOVIE_ID NUMBER CONSTRAINT MOVIE_ID_PK PRIMARY KEY, 
    ORIGINAL_TITLE VARCHAR2(200) CONSTRAINT MOVIE_ORIGINAL_TITLE_NN NOT NULL,
    TITLE VARCHAR2(200) CONSTRAINT MOVIE_TITLE_NN NOT NULL,
    GENRES VARCHAR2(100) CONSTRAINT MOVIE_GENRES_NN NOT NULL,
    TAGLINE VARCHAR2(200) CONSTRAINT MOVIE_TAGLINE_NN NOT NULL,
    OVERVIEW VARCHAR2(4000) CONSTRAINT MOVIE_OVERVIEW_NN NOT NULL,
    RUNTIME NUMBER CONSTRAINT MOVIE_RUNTIME_NN NOT NULL,
    RELEASE_DATE DATE CONSTRAINT MOVIE_RELEASE_DATE_NN NOT NULL,
    DIRECTOR VARCHAR2(200) CONSTRAINT MOVIE_DIRECTOR_NN NOT NULL,
    CAST VARCHAR2(200) CONSTRAINT MOVIE_CAST_NN NOT NULL,
    CERTIFICATION NUMBER CONSTRAINT MOVIE_CERTIFICATION_NN NOT NULL,
    PRODUCTION_NAME VARCHAR2(100) CONSTRAINT MOVIE_PRODUCTION_NAME_NN NOT NULL,
    PRODUCTION_COUNTRY VARCHAR2(50) CONSTRAINT MOVIE_PRODUCTION_COUNTRY_NN NOT NULL,
    PRODUCTION_LOGO_PATH VARCHAR2(50) CONSTRAINT MOVIE_PRODUCTION_LOGO_PATH_NN NOT NULL,
    COLLECTION_ID NUMBER,
    COLLECTION_NAME VARCHAR2(100),
    BACKDROP_PATH VARCHAR2(50) CONSTRAINT MOVIE_BACKDROP_PATH_NN NOT NULL,
    POSTER_PATH VARCHAR2(50) CONSTRAINT MOVIE_POSTER_PATH_NN NOT NULL,
    VIDEO_KEY VARCHAR2(20) CONSTRAINT MOVIE_VIDEO_KEY_NN NOT NULL,
    VIEWS NUMBER DEFAULT 0 CONSTRAINT MOVIE_VIEWS_NN NOT NULL,
    REGISTER_DATE DATE DEFAULT SYSDATE CONSTRAINT MOVIE_REGISTER_DATE_NN NOT NULL,
    MOVIE_STATUS CHAR(1) DEFAULT 'Y' CONSTRAINT MOVIE_STATUS_NN NOT NULL CONSTRAINT MOVIE_STATUS_CK CHECK(MOVIE_STATUS IN ('Y', 'N')),
    DELETE_DATE DATE
);

COMMENT ON COLUMN MOVIE.MOVIE_ID IS '��ȭID';
COMMENT ON COLUMN MOVIE.ORIGINAL_TITLE IS '����';
COMMENT ON COLUMN MOVIE.TITLE IS '�ѱ�����';
COMMENT ON COLUMN MOVIE.GENRES IS '�帣';
COMMENT ON COLUMN MOVIE.TAGLINE IS '���';
COMMENT ON COLUMN MOVIE.OVERVIEW IS '����';
COMMENT ON COLUMN MOVIE.RUNTIME IS '����Ÿ��';
COMMENT ON COLUMN MOVIE.RELEASE_DATE IS '��������';
COMMENT ON COLUMN MOVIE.DIRECTOR IS '������';
COMMENT ON COLUMN MOVIE.CAST IS '�⿬��';
COMMENT ON COLUMN MOVIE.CERTIFICATION IS '��û���';
COMMENT ON COLUMN MOVIE.PRODUCTION_NAME IS '���ۻ��̸�';
COMMENT ON COLUMN MOVIE.PRODUCTION_COUNTRY IS '���۱����̸�';
COMMENT ON COLUMN MOVIE.PRODUCTION_LOGO_PATH IS '���ۻ�ΰ������ּ�';
COMMENT ON COLUMN MOVIE.COLLECTION_ID IS '�÷���ID';
COMMENT ON COLUMN MOVIE.COLLECTION_NAME IS '�÷����̸�';
COMMENT ON COLUMN MOVIE.BACKDROP_PATH IS '��ʻ����ּ�';
COMMENT ON COLUMN MOVIE.POSTER_PATH IS '�����ͻ����ּ�';
COMMENT ON COLUMN MOVIE.VIDEO_KEY IS '�����ּ�';
COMMENT ON COLUMN MOVIE.VIEWS IS '��ȸ��';
COMMENT ON COLUMN MOVIE.REGISTER_DATE IS '����Ͻ�';
COMMENT ON COLUMN MOVIE.MOVIE_STATUS IS '��������';
COMMENT ON COLUMN MOVIE.DELETE_DATE IS '�����Ͻ�';

INSERT INTO MOVIE
VALUES (1427, 'Perfume: The Story of a Murderer', '���: ��� �������� �̾߱�', '����,��Ÿ��,���', '�׿��� ���� ���ο���, ������ ����̾���',
'18���� ������, ���볪�� ���� ���忡�� �¾�ڸ��� ���ư� �� õ������ �İ��� ������ �� ��Ƽ��Ʈ �׸�����(�� ����). ���� ó�� �ĸ��� �湮�� ��, �׸����̴� ���ݲ� �������� ���ߴ� ������ ��Ȥ���� ��⿡ ������. �� ��⸦ �����ϰ� ���� ������ ����� ������� �״� ��������� �ּ��� �ߵ��(����ƾ ȣ����)�� ���� ��� ���� ����� ���������. �ĸ��� ���� ����� �����̶� �Ҹ��� ������ ��������  �׶󽺿��� ���������� ����� ����� ����� ���� �׸�����. ���� �׶󽺿����� �Ƹ��ٿ� ���ε��� �Ӹ�ī���� ��� �߸� ä ��ü�� �ý����� �߰ߵǴ� �ǹ��� ���� ��ǵ��� ���̾� �߻��ϴµ�...'
      , 147, '2006-09-13', 'Tom Tykwer', 'Ben Whishaw,Alan Rickman,Rachel Hurd-Wood,Dustin Hoffman,John Hurt', 15, 'DreamWorks Pictures', 'US', '/vru2SssLX3FPhnKZGtYw00pVIS9.png'
      , NULL, NULL, '/kgHYRHQ5BZM1mxsy1MSZepNjMiR.jpg', '/zHwYCk0YVFdTH0icIHsXGCV6Min.jpg', '-hr3ouA26nU', 4, TO_DATE('2020/01/01 00:00:00', 'RRRR/MM/DD HH24:MI:SS'), 'Y', NULL);


--------------------------------------------------
---------------- TV ���α׷� (TV) ----------------
--------------------------------------------------
CREATE TABLE TV (
    TV_ID NUMBER CONSTRAINT TV_ID_PK PRIMARY KEY, 
    ORIGINAL_NAME VARCHAR2(200) CONSTRAINT TV_ORIGINAL_NAME_NN NOT NULL,
    NAME VARCHAR2(200) CONSTRAINT TV_NAME_NN NOT NULL,
    GENRES VARCHAR2(100) CONSTRAINT TV_GENRES_NN NOT NULL,
    TAGLINE VARCHAR2(200) CONSTRAINT TV_TAGLINE_NN NOT NULL,
    OVERVIEW VARCHAR2(4000) CONSTRAINT TV_OVERVIEW_NN NOT NULL,
    EPISODE_COUNT NUMBER CONSTRAINT TV_EPISODE_COUNT_NN NOT NULL,
    AIR_DATE DATE CONSTRAINT TV_AIR_DATE_NN NOT NULL,
    CREATOR VARCHAR2(200) CONSTRAINT TV_CREATOR_NN NOT NULL,
    CAST VARCHAR2(200) CONSTRAINT TV_CAST_NN NOT NULL,
    RATING NUMBER CONSTRAINT TV_RATING_NN NOT NULL,
    NETWORKS_NAME VARCHAR2(100) CONSTRAINT TV_NETWORKS_NAME_NN NOT NULL,
    NETWORKS_COUNTRY VARCHAR2(50) CONSTRAINT TV_NETWORKS_COUNTRY_NN NOT NULL,
    NETWORKS_LOGO_PATH VARCHAR2(50) CONSTRAINT TV_NETWORKS_LOGO_PATH_NN NOT NULL,
    SEASON_NUMBER NUMBER CONSTRAINT TV_SEASON_NUMBER_NN NOT NULL,
    BACKDROP_PATH VARCHAR2(50) CONSTRAINT TV_BACKDROP_PATH_NN NOT NULL,
    POSTER_PATH VARCHAR2(50) CONSTRAINT TV_POSTER_PATH_NN NOT NULL,
    VIEWS NUMBER DEFAULT 0 CONSTRAINT TV_VIEWS_NN NOT NULL,
    REGISTER_DATE DATE DEFAULT SYSDATE CONSTRAINT TV_REGISTER_DATE_NN NOT NULL,
    TV_STATUS CHAR(1) DEFAULT 'Y' CONSTRAINT TV_STATUS_NN NOT NULL CONSTRAINT TV_STATUS_CK CHECK(TV_STATUS IN ('Y', 'N')),
    DELETE_DATE DATE
);

COMMENT ON COLUMN TV.TV_ID IS 'TV���α׷�ID';
COMMENT ON COLUMN TV.ORIGINAL_NAME IS '����';
COMMENT ON COLUMN TV.NAME IS '�ѱ�����';
COMMENT ON COLUMN TV.GENRES IS '�帣';
COMMENT ON COLUMN TV.TAGLINE IS '���';
COMMENT ON COLUMN TV.OVERVIEW IS '����';
COMMENT ON COLUMN TV.EPISODE_COUNT IS '��ȸ����';
COMMENT ON COLUMN TV.AIR_DATE IS '�濵��������';
COMMENT ON COLUMN TV.CREATOR IS '������';
COMMENT ON COLUMN TV.CAST IS '�⿬��';
COMMENT ON COLUMN TV.RATING IS '��û���';
COMMENT ON COLUMN TV.NETWORKS_NAME IS '��ۻ��̸�';
COMMENT ON COLUMN TV.NETWORKS_COUNTRY IS '��۱����̸�';
COMMENT ON COLUMN TV.NETWORKS_LOGO_PATH IS '��ۻ�ΰ������ּ�';
COMMENT ON COLUMN TV.SEASON_NUMBER IS '����';
COMMENT ON COLUMN TV.BACKDROP_PATH IS '��ʻ����ּ�';
COMMENT ON COLUMN TV.POSTER_PATH IS '�����ͻ����ּ�';
COMMENT ON COLUMN TV.VIEWS IS '��ȸ��';
COMMENT ON COLUMN TV.REGISTER_DATE IS '����Ͻ�';
COMMENT ON COLUMN TV.TV_STATUS IS '��������';
COMMENT ON COLUMN TV.DELETE_DATE IS '�����Ͻ�';


--------------------------------------------------
-------------- TV ���Ǽҵ� (EPISODE) -------------
--------------------------------------------------
CREATE TABLE EPISODE (
    EPISODE_ID NUMBER CONSTRAINT EPISODE_ID_PK PRIMARY KEY, 
    TV_ID NUMBER CONSTRAINT EPISODE_TV_ID_NN NOT NULL,
    SEASON_NUMBER NUMBER CONSTRAINT EPISODE_SEASON_NUMBER_NN NOT NULL,
    EPISODE_NUMBER NUMBER CONSTRAINT EPISODE_NUMBER_NN NOT NULL,
    NAME VARCHAR2(200) CONSTRAINT EPISODE_NAME_NN NOT NULL,
    OVERVIEW VARCHAR2(4000) CONSTRAINT EPISODE_OVERVIEW_NN NOT NULL,
    RUNTIME NUMBER CONSTRAINT EPISODE_RUNTIME_NN NOT NULL,
    AIR_DATE DATE CONSTRAINT EPISODE_AIR_DATE_NN NOT NULL,
    STILL_PATH VARCHAR2(50) CONSTRAINT EPISODE_STILL_PATH_NN NOT NULL,
    VIDEO_KEY VARCHAR2(20) CONSTRAINT EPISODE_VIDEO_KEY_NN NOT NULL,
    REGISTER_DATE DATE DEFAULT SYSDATE CONSTRAINT EPISODE_REGISTER_DATE_NN NOT NULL,
    EPISODE_STATUS CHAR(1) DEFAULT 'Y' CONSTRAINT EPISODE_STATUS_NN NOT NULL CONSTRAINT EPISODE_STATUS_CK CHECK(EPISODE_STATUS IN ('Y', 'N')),
    DELETE_DATE DATE, 
    CONSTRAINT EPISODE_TV_ID_FK FOREIGN KEY (TV_ID) REFERENCES TV(TV_ID)
);

COMMENT ON COLUMN EPISODE.EPISODE_ID IS 'TV���Ǽҵ�ID';
COMMENT ON COLUMN EPISODE.TV_ID IS 'TV���α׷�ID';
COMMENT ON COLUMN EPISODE.SEASON_NUMBER IS '����';
COMMENT ON COLUMN EPISODE.EPISODE_NUMBER IS 'ȸ��';
COMMENT ON COLUMN EPISODE.NAME IS '����';
COMMENT ON COLUMN EPISODE.OVERVIEW IS '����';
COMMENT ON COLUMN EPISODE.RUNTIME IS '����Ÿ��';
COMMENT ON COLUMN EPISODE.AIR_DATE IS '�濵����';
COMMENT ON COLUMN EPISODE.STILL_PATH IS '��ƿ�����ּ�';
COMMENT ON COLUMN EPISODE.VIDEO_KEY IS '�����ּ�';
COMMENT ON COLUMN EPISODE.REGISTER_DATE IS '����Ͻ�';
COMMENT ON COLUMN EPISODE.EPISODE_STATUS IS '��������';
COMMENT ON COLUMN EPISODE.DELETE_DATE IS '�����Ͻ�';


--------------------------------------------------
--------------- ��û ���� (RECORD) ---------------
--------------------------------------------------
CREATE TABLE RECORD (
    RECORD_NO NUMBER CONSTRAINT RECORD_NO_PK PRIMARY KEY,
    USER_NO NUMBER CONSTRAINT RECORD_USER_NO_NN NOT NULL,
    MOVIE_ID NUMBER,
    EPISODE_ID NUMBER,
    RECORD_TIME NUMBER CONSTRAINT RECORD_TIME_NN NOT NULL,
    RECORD_STATUS CHAR(1) DEFAULT 'Y' CONSTRAINT RECORD_STATUS_NN NOT NULL CONSTRAINT RECORD_STATUS_CK CHECK(RECORD_STATUS IN ('Y', 'N')),
    CONSTRAINT RECORD_USER_NO_FK FOREIGN KEY (USER_NO) REFERENCES MEMBER(USER_NO),
    CONSTRAINT RECORD_MOVIE_ID_FK FOREIGN KEY (MOVIE_ID) REFERENCES MOVIE(MOVIE_ID),
    CONSTRAINT RECORD_EPISODE_ID_FK FOREIGN KEY (EPISODE_ID) REFERENCES EPISODE(EPISODE_ID)
);
    
COMMENT ON COLUMN RECORD.RECORD_NO IS '��û������ȣ';
COMMENT ON COLUMN RECORD.USER_NO IS '��û��ȸ����ȣ';
COMMENT ON COLUMN RECORD.MOVIE_ID IS '��û�ѿ�ȭID';
COMMENT ON COLUMN RECORD.EPISODE_ID IS '��û��TV���Ǽҵ�ID';
COMMENT ON COLUMN RECORD.RECORD_TIME IS '��������û����';
COMMENT ON COLUMN RECORD.RECORD_STATUS IS '��������';
        
CREATE SEQUENCE SEQ_RECORD_NO NOCACHE;


--------------------------------------------------
-------------------- �� (DIB) --------------------
--------------------------------------------------
CREATE TABLE DIB (
    USER_NO NUMBER CONSTRAINT DIB_USER_NO_NN NOT NULL,
    MOVIE_ID NUMBER,
    TV_ID NUMBER,
    CONSTRAINT DIB_USER_NO_FK FOREIGN KEY (USER_NO) REFERENCES MEMBER(USER_NO),
    CONSTRAINT DIB_MOVIE_ID_FK FOREIGN KEY (MOVIE_ID) REFERENCES MOVIE(MOVIE_ID),
    CONSTRAINT DIB_TV_ID_FK FOREIGN KEY (TV_ID) REFERENCES TV(TV_ID)
);

COMMENT ON COLUMN DIB.USER_NO IS '����ȸ����ȣ';
COMMENT ON COLUMN DIB.MOVIE_ID IS '���ѿ�ȭID';
COMMENT ON COLUMN DIB.TV_ID IS '����TV���α׷�ID';


--------------------------------------------------
-------------- �������ڸ�Ʈ (REVIEW) -------------
--------------------------------------------------
CREATE TABLE REVIEW (
    REVIEW_NO NUMBER CONSTRAINT REVIEW_NO_PK PRIMARY KEY,
    USER_NO NUMBER CONSTRAINT REVIEW_USER_NO_NN NOT NULL,
    MOVIE_ID NUMBER,
    TV_ID NUMBER,
    REVIEW_STAR NUMBER CONSTRAINT REVIEW_STAR_NN NOT NULL,
    REVIEW_CONTENT VARCHAR2(4000),
    REVIEW_REGISTER_DATE DATE DEFAULT SYSDATE CONSTRAINT REVIEW_REGISTER_DATE_NN NOT NULL,
    REVIEW_STATUS CHAR(1) DEFAULT 'Y' CONSTRAINT REVIEW_STATUS_NN NOT NULL CONSTRAINT REVIEW_STATUS_CK CHECK(REVIEW_STATUS IN ('Y', 'N')),
    CONSTRAINT REVIEW_USER_NO_FK FOREIGN KEY (USER_NO) REFERENCES MEMBER(USER_NO),
    CONSTRAINT REVIEW_MOVIE_ID_FK FOREIGN KEY (MOVIE_ID) REFERENCES MOVIE(MOVIE_ID),
    CONSTRAINT REVIEW_TV_ID_FK FOREIGN KEY (TV_ID) REFERENCES TV(TV_ID) 
);

COMMENT ON COLUMN REVIEW.REVIEW_NO IS '�����ۼ���ȣ';
COMMENT ON COLUMN REVIEW.USER_NO IS '�ۼ���ȸ����ȣ';
COMMENT ON COLUMN REVIEW.MOVIE_ID IS '�ۼ��ѿ�ȭID';
COMMENT ON COLUMN REVIEW.TV_ID IS '�ۼ���TV���α׷�ID';
COMMENT ON COLUMN REVIEW.REVIEW_STAR IS '����';
COMMENT ON COLUMN REVIEW.REVIEW_CONTENT IS '�ڸ�Ʈ';
COMMENT ON COLUMN REVIEW.REVIEW_REGISTER_DATE IS '�����ۼ��Ͻ�';
COMMENT ON COLUMN REVIEW.REVIEW_STATUS IS '��������';

CREATE SEQUENCE SEQ_REVIEW_NO NOCACHE;

INSERT INTO REVIEW
VALUES (SEQ_REVIEW_NO.NEXTVAL, 2, 1427, NULL, 4.5,
'å�� �������� �� ��ȭ �߿� ž�� �� ���ΰ��� ������ �Ῡ ������ ���� �ź��ؼ� 0.5�� ������ �̰� ������ �Ѿ� �������� ����(?)�̰� ��ȭ ���弾�� �ʹ��ʹ� ���Ƽ� �� å �ٽ� �а� �ʹٴ� ������ ��'
      , TO_DATE('2020/01/02 20:08:45', 'RRRR/MM/DD HH24:MI:SS'), 'Y');
      
INSERT INTO REVIEW
VALUES (SEQ_REVIEW_NO.NEXTVAL, 1, 1427, NULL, 4.5,
'���̷����ϰԵ� ������ �츮�� ���ΰ��� �ٸ��پ���������

������ �ڽ��� ��, �ھƸ� �����⺸�� ������ �� ������ �α��� ���� �߱��ϴ� �������� ����̶�� ������ ���� �� �Ұ��̴�.'
      , TO_DATE('2020/01/06 21:45:38', 'RRRR/MM/DD HH24:MI:SS'), 'Y');
      
INSERT INTO REVIEW
VALUES (SEQ_REVIEW_NO.NEXTVAL, 6, 1427, NULL, 5.0,
'���� �ӿ��� �������� ���ߴ� �������
-
�̶� ������ �ڴʰ� ������ ���� ������ ������ ����� ������ ���� ���� ���.'
      , TO_DATE('2020/01/06 22:21:41', 'RRRR/MM/DD HH24:MI:SS'), 'Y');
      
INSERT INTO REVIEW
VALUES (SEQ_REVIEW_NO.NEXTVAL, 3, 1427, NULL, 0.5,
'�� �̰� �Ƹ����?'
      , TO_DATE('2020/01/21 01:05:19', 'RRRR/MM/DD HH24:MI:SS'), 'Y');


--------------------------------------------------
--------------- �Ϲ� ���� (PAYMENT) --------------	
--------------------------------------------------
CREATE TABLE PAYMENT (
    PAY_NO NUMBER CONSTRAINT PAY_NO_PK PRIMARY KEY,
    PAY_ORDER_NO NUMBER CONSTRAINT PAY_ORDER_NO_NN NOT NULL,
    USER_NO NUMBER CONSTRAINT PAY_USER_NO_NN NOT NULL,
    PAYMENT NUMBER CONSTRAINT PAYMENT_NN NOT NULL,
    PAY_DATE DATE DEFAULT SYSDATE CONSTRAINT PAY_DATE_NN NOT NULL,
    PAY_END_DATE DATE DEFAULT SYSDATE+30 CONSTRAINT PAY_END_DATE_NN NOT NULL,
    PAY_STATUS CHAR(1) DEFAULT 'Y' CONSTRAINT PAY_STATUS_NN NOT NULL CONSTRAINT PAY_STATUS_CK CHECK(PAY_STATUS IN ('Y', 'N')),
    PAY_URL VARCHAR2(100) CONSTRAINT PAY_URL_NN NOT NULL,
    CONSTRAINT PAY_USER_NO_FK FOREIGN KEY (USER_NO) REFERENCES MEMBER(USER_NO)
);

COMMENT ON COLUMN PAYMENT.PAY_NO IS '�Ϲݰ���������ȣ';
COMMENT ON COLUMN PAYMENT.PAY_ORDER_NO IS '�Ϲݰ�����ȣ';
COMMENT ON COLUMN PAYMENT.USER_NO IS '������ȸ����ȣ';
COMMENT ON COLUMN PAYMENT.PAYMENT IS '�Ϲݰ�����';
COMMENT ON COLUMN PAYMENT.PAY_DATE IS '�Ϲݰ����Ͻ�';
COMMENT ON COLUMN PAYMENT.PAY_END_DATE IS '�Ϲݱ������Ͻ�';
COMMENT ON COLUMN PAYMENT.PAY_STATUS IS '�Ϲݰ�������';
COMMENT ON COLUMN PAYMENT.PAY_URL IS '�Ϲݰ���������URL';

CREATE SEQUENCE SEQ_PAY_NO NOCACHE;


--------------------------------------------------
----------- ���� ���� (PAYMENT_REGULAR) ----------
--------------------------------------------------
CREATE TABLE PAYMENT_REGULAR (
    REG_NO NUMBER CONSTRAINT REG_NO_PK PRIMARY KEY,
    REG_ORDER_NO NUMBER CONSTRAINT REG_ORDER_NO_NN NOT NULL,
    USER_NO NUMBER CONSTRAINT REG_USER_NO_NN NOT NULL,
    REG_PAYMENT NUMBER CONSTRAINT REG_PAYMENT_NN NOT NULL,
    REG_START_DATE DATE DEFAULT SYSDATE CONSTRAINT REG_START_DATE_NN NOT NULL,
    REG_END_DATE DATE DEFAULT SYSDATE+30 CONSTRAINT REG_END_DATE_NN NOT NULL,
    REG_STATUS CHAR(1) DEFAULT 'Y' CONSTRAINT REG_STATUS_NN NOT NULL CONSTRAINT REG_STATUS_CK CHECK(REG_STATUS IN ('Y', 'N')),
    REG_URL VARCHAR2(100) CONSTRAINT REG_URL_NN NOT NULL,
    CONSTRAINT REG_USER_NO_FK FOREIGN KEY (USER_NO) REFERENCES MEMBER(USER_NO)
);

COMMENT ON COLUMN PAYMENT_REGULAR.REG_NO IS '�������������ȣ';
COMMENT ON COLUMN PAYMENT_REGULAR.REG_ORDER_NO IS '���������ȣ';
COMMENT ON COLUMN PAYMENT_REGULAR.USER_NO IS '������ȸ����ȣ';
COMMENT ON COLUMN PAYMENT_REGULAR.REG_PAYMENT IS '���������';
COMMENT ON COLUMN PAYMENT_REGULAR.REG_START_DATE IS '������������Ͻ�';
COMMENT ON COLUMN PAYMENT_REGULAR.REG_END_DATE IS '������������Ͻ�';
COMMENT ON COLUMN PAYMENT_REGULAR.REG_STATUS IS '�����������';
COMMENT ON COLUMN PAYMENT_REGULAR.REG_URL IS '�������������URL';

CREATE SEQUENCE SEQ_REG_NO NOCACHE;


--------------------------------------------------
------------- Ŀ�´�Ƽ �� (COMMUNITY) ------------
--------------------------------------------------
CREATE TABLE COMMUNITY (    
    COM_NO NUMBER CONSTRAINT COM_NO_PK PRIMARY KEY,
    MOVIE_ID NUMBER,
    TV_ID NUMBER,
    USER_NO NUMBER CONSTRAINT COM_USER_NO_NN NOT NULL,
    COM_TITLE VARCHAR2(100) CONSTRAINT COM_TITLE_NN NOT NULL,
    COM_CONTENT VARCHAR2(4000) CONSTRAINT COM_CONTENT_NN NOT NULL,
    COM_REGISTER_DATE DATE DEFAULT SYSDATE CONSTRAINT COM_REGISTER_DATE_NN NOT NULL,
    COM_HIT NUMBER DEFAULT 0 CONSTRAINT COM_HIT_NN NOT NULL,
    COM_STATUS CHAR(1) DEFAULT 'Y' CONSTRAINT COM_STATUS_NN NOT NULL CONSTRAINT COM_STATUS_CK CHECK(COM_STATUS IN ('Y', 'N')),
    CONSTRAINT COM_MOVIE_ID_FK FOREIGN KEY (MOVIE_ID) REFERENCES MOVIE(MOVIE_ID),
    CONSTRAINT COM_TV_ID_FK FOREIGN KEY (TV_ID) REFERENCES TV(TV_ID),
    CONSTRAINT COM_USER_NO_FK FOREIGN KEY (USER_NO) REFERENCES MEMBER(USER_NO)
);

COMMENT ON COLUMN COMMUNITY.COM_NO IS 'Ŀ�´�Ƽ�۹�ȣ';
COMMENT ON COLUMN COMMUNITY.MOVIE_ID IS '�±��ѿ�ȭID';
COMMENT ON COLUMN COMMUNITY.TV_ID IS '�±���TV���α׷�ID';
COMMENT ON COLUMN COMMUNITY.USER_NO IS '�ۼ���ȸ����ȣ';
COMMENT ON COLUMN COMMUNITY.COM_TITLE IS 'Ŀ�´�Ƽ������';
COMMENT ON COLUMN COMMUNITY.COM_CONTENT IS 'Ŀ�´�Ƽ�۳���';
COMMENT ON COLUMN COMMUNITY.COM_REGISTER_DATE IS 'Ŀ�´�Ƽ���ۼ��Ͻ�';
COMMENT ON COLUMN COMMUNITY.COM_HIT IS 'Ŀ�´�Ƽ����ȸ��';
COMMENT ON COLUMN COMMUNITY.COM_STATUS IS '��������';

CREATE SEQUENCE SEQ_COM_NO NOCACHE;


--------------------------------------------------
--------- Ŀ�´�Ƽ ��� (COMMUNITY_REPLY) --------
--------------------------------------------------
CREATE TABLE COMMUNITY_REPLY (
    COM_RPL_NO NUMBER CONSTRAINT COM_RPL_NO_PK PRIMARY KEY,
    COM_NO NUMBER CONSTRAINT COM_RPL_COM_NO_NN NOT NULL,
    USER_NO NUMBER CONSTRAINT COM_RPL_USER_NO_NN NOT NULL,
    COM_RPL_CONTENT VARCHAR2(4000) CONSTRAINT COM_RPL_CONTENT_NN NOT NULL,
    COM_RPL_REGISTER_DATE DATE DEFAULT SYSDATE CONSTRAINT COM_RPL_REGISTER_DATE_NN NOT NULL,
    COM_RPL_STATUS CHAR(1) DEFAULT 'Y' CONSTRAINT COM_RPL_STATUS_NN NOT NULL CONSTRAINT COM_RPL_STATUS_CK CHECK(COM_RPL_STATUS IN ('Y', 'N')),
    CONSTRAINT COM_RPL_COM_NO_FK FOREIGN KEY (COM_NO) REFERENCES COMMUNITY(COM_NO),
    CONSTRAINT COM_RPL_USER_NO_FK FOREIGN KEY (USER_NO) REFERENCES MEMBER(USER_NO)
);

COMMENT ON COLUMN COMMUNITY_REPLY.COM_RPL_NO IS 'Ŀ�´�Ƽ��۹�ȣ';
COMMENT ON COLUMN COMMUNITY_REPLY.COM_NO IS '�ۼ��ѱ۹�ȣ';
COMMENT ON COLUMN COMMUNITY_REPLY.USER_NO IS '�ۼ���ȸ����ȣ';
COMMENT ON COLUMN COMMUNITY_REPLY.COM_RPL_CONTENT IS 'Ŀ�´�Ƽ��۳���';
COMMENT ON COLUMN COMMUNITY_REPLY.COM_RPL_REGISTER_DATE IS 'Ŀ�´�Ƽ����ۼ��Ͻ�';
COMMENT ON COLUMN COMMUNITY_REPLY.COM_RPL_STATUS IS '��������';

CREATE SEQUENCE SEQ_COM_RPL_NO NOCACHE;


--------------------------------------------------
---------------- �������� (NOTICE) ---------------
--------------------------------------------------
CREATE TABLE NOTICE (
    NOTICE_NO NUMBER CONSTRAINT NOTICE_NO_PK PRIMARY KEY,
    NOTICE_TITLE VARCHAR2(100) CONSTRAINT NOTICE_TITLE_NN NOT NULL,
    NOTICE_CONTENT VARCHAR2(4000) CONSTRAINT NOTICE_CONTENT_NN NOT NULL,
    NOTICE_REGISTER_DATE DATE DEFAULT SYSDATE CONSTRAINT NOTICE_REGISTER_DATE_NN NOT NULL,
    NOTICE_HIT NUMBER DEFAULT 0 CONSTRAINT NOTICE_HIT_NN NOT NULL,
    NOTICE_STATUS CHAR(1) DEFAULT 'Y' CONSTRAINT NOTICE_STATUS_NN NOT NULL CONSTRAINT NOTICE_STATUS_CK CHECK(NOTICE_STATUS IN ('Y', 'N'))
);

COMMENT ON COLUMN NOTICE.NOTICE_NO IS '�������׹�ȣ';
COMMENT ON COLUMN NOTICE.NOTICE_TITLE IS '������������';
COMMENT ON COLUMN NOTICE.NOTICE_CONTENT IS '�������׳���';
COMMENT ON COLUMN NOTICE.NOTICE_REGISTER_DATE IS '���������ۼ��Ͻ�';
COMMENT ON COLUMN NOTICE.NOTICE_HIT IS '����������ȸ��';
COMMENT ON COLUMN NOTICE.NOTICE_STATUS IS '��������';

CREATE SEQUENCE SEQ_NOTICE_NO NOCACHE;


--------------------------------------------------
------------------ �Ű� (REPORT) -----------------
--------------------------------------------------
CREATE TABLE REPORT (
    REPORT_NO NUMBER CONSTRAINT REPORT_NO_PK PRIMARY KEY,
    REVIEW_NO NUMBER,
    COM_NO NUMBER,
    COM_RPL_NO NUMBER,
    USER_NO NUMBER CONSTRAINT REPORT_USER_NO_NN NOT NULL,
    REPORT_REASON VARCHAR2(100) CONSTRAINT REPORT_REASON_NN NOT NULL,
    REPORT_DATE DATE DEFAULT SYSDATE CONSTRAINT REPORT_DATE_NN NOT NULL,
    REPORT_STATUS CHAR(1) DEFAULT 'N' CONSTRAINT REPORT_STATUS_NN NOT NULL CONSTRAINT REPORT_STATUS_CK CHECK(REPORT_STATUS IN ('Y', 'N')),
    CONSTRAINT REPORT_REVIEW_NO_FK FOREIGN KEY (REVIEW_NO) REFERENCES REVIEW(REVIEW_NO),
    CONSTRAINT REPORT_COM_NO_FK FOREIGN KEY (COM_NO) REFERENCES COMMUNITY(COM_NO),
    CONSTRAINT REPORT_COM_RPL_NO_FK FOREIGN KEY (COM_RPL_NO) REFERENCES COMMUNITY_REPLY(COM_RPL_NO),
    CONSTRAINT REPORT_USER_NO_FK FOREIGN KEY (USER_NO) REFERENCES MEMBER(USER_NO)
);

COMMENT ON COLUMN REPORT.REPORT_NO IS '�Ű�������ȣ';
COMMENT ON COLUMN REPORT.REVIEW_NO IS '�Ű��Ѹ����ۼ���ȣ';
COMMENT ON COLUMN REPORT.COM_NO IS '�Ű���Ŀ�´�Ƽ�۹�ȣ';
COMMENT ON COLUMN REPORT.COM_RPL_NO IS '�Ű���Ŀ�´�Ƽ��۹�ȣ';
COMMENT ON COLUMN REPORT.USER_NO IS '�Ű���ȸ����ȣ';
COMMENT ON COLUMN REPORT.REPORT_REASON IS '�Ű�����';
COMMENT ON COLUMN REPORT.REPORT_DATE IS '�Ű��Ͻ�';
COMMENT ON COLUMN REPORT.REPORT_STATUS IS '�Ű�ó������';

CREATE SEQUENCE SEQ_REPORT_NO NOCACHE;


COMMIT;