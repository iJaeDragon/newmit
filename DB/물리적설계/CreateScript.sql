-- USE NEWMIT;

-- 공통코드 테이블
CREATE TABLE TB_COMMON_CODE (
    COMMON_CODE_GROUP_CD VARCHAR(6) COMMENT '공통 코드 그룹 코드',
    COMMON_CODE_GROUP_CD_NM VARCHAR(20) COMMENT '공통 코드 그룹 명',
    COMMON_CODE_CD VARCHAR(6) COMMENT '공통 코드',
    COMMON_CODE_NM VARCHAR(20) COMMENT '공통 코드 명',
    PRIMARY KEY (COMMON_CODE_GROUP_CD, COMMON_CODE_CD)
);
INSERT INTO TB_COMMON_CODE(COMMON_CODE_GROUP_CD, COMMON_CODE_GROUP_CD_NM, COMMON_CODE_CD, COMMON_CODE_NM)
VALUES  ('1', '성별 코드', '1', '남자'),
        ('1', '성별 코드', '2', '여자');
INSERT INTO TB_COMMON_CODE(COMMON_CODE_GROUP_CD, COMMON_CODE_GROUP_CD_NM, COMMON_CODE_CD, COMMON_CODE_NM)
VALUES  ('2', 'OAuth 인증기관', '1', 'google'),
        ('2', 'OAuth 인증기관', '2', 'kakao'),
        ('2', 'OAuth 인증기관', '3', 'naver');
INSERT INTO TB_COMMON_CODE(COMMON_CODE_GROUP_CD, COMMON_CODE_GROUP_CD_NM, COMMON_CODE_CD, COMMON_CODE_NM)
VALUES  ('3', '식자재 구분', '1', '곡물류'),
        ('3', '식자재 구분', '2', '채소류'),
        ('3', '식자재 구분', '3', '과일류'),
        ('3', '식자재 구분', '4', '육류'),
        ('3', '식자재 구분', '5', '수산류'),
        ('3', '식자재 구분', '6', '유제품류'),
        ('3', '식자재 구분', '7', '조미료류'),
        ('3', '식자재 구분', '8', '가공식품'),
        ('3', '식자재 구분', '9', '냉동식품'),
        ('3', '식자재 구분', '10', '건강식품'),
        ('3', '식자재 구분', '11', '디저트'),
        ('3', '식자재 구분', '12', '음료수'),
        ('3', '식자재 구분', '13', '조미식품'),
        ('3', '식자재 구분', '14', '자연식품'),
        ('3', '식자재 구분', '15', '빙과류');

-- 회원정보 테이블
CREATE TABLE TB_MEMBERS_INFO (
    MB_NO INT(10) COMMENT '회원 넘버' PRIMARY KEY,
    MB_EMAIL VARCHAR(30) COMMENT '회원 이메일' NOT NULL,
    MB_OAUTH_PROVIDER VARCHAR(20) COMMENT '회원 OAUTH 인증기관' NOT NULL,
    MB_NM VARCHAR(50) COMMENT '회원 이름',
    MB_BIRTH_DATE VARCHAR(8) COMMENT '회원 생년월일',
    MB_GENDER VARCHAR(1) COMMENT '회원 성별',
    MB_PHONE_NUMBER VARCHAR(11) COMMENT '회원 폰 번호',
    MB_REGISTER_DATE DATE COMMENT '회원 가입 일자' NOT NULL,
    MB_REGISTER_IP VARCHAR(15) COMMENT '회원 가입 아이피' NOT NULL,
    MB_UPDATE_DATE DATE COMMENT '회원 업데이트 일자' NOT NULL,
    MB_UPDATE_IP VARCHAR(15) COMMENT '회원 업데이트 아이피' NOT NULL
);
ALTER TABLE TB_MEMBERS_INFO MODIFY COLUMN MB_NO INT NOT NULL AUTO_INCREMENT;
ALTER TABLE TB_MEMBERS_INFO MODIFY COLUMN MB_REGISTER_DATE TIMESTAMP DEFAULT CURRENT_TIMESTAMP;
ALTER TABLE TB_MEMBERS_INFO MODIFY COLUMN MB_UPDATE_DATE TIMESTAMP DEFAULT CURRENT_TIMESTAMP;

-- 서비스 고객센터 테이블
CREATE TABLE TB_CUSTOMER_SERVICE_COMPLAINTS (
    MB_NO INT(10) NOT NULL COMMENT '등록자',
    CUSTOMER_SERVICE_COMPLAINT_NO INT(10) COMMENT '고객센터 문의 넘버',
    CUSTOMER_SERVICE_COMPLAINT_SUBJECT VARCHAR(50) COMMENT '고객센터 문의 제목' NOT NULL,
    CUSTOMER_SERVICE_COMPLAINT_CONTENTS VARCHAR(5000) COMMENT '고객센터 문의 내용' NOT NULL,
    CUSTOMER_SERVICE_COMPLAINT_REGISTER_DATE DATE COMMENT '고객센터 문의 등록 일자' NOT NULL,
    CUSTOMER_SERVICE_COMPLAINT_REGISTER_IP VARCHAR(15) COMMENT '고객센터 문의 등록 아이피' NOT NULL,
    CUSTOMER_SERVICE_COMPLAINT_UPDATE_DATE DATE COMMENT '고객센터 문의 업데이트 일자' NOT NULL,
    CUSTOMER_SERVICE_COMPLAINT_UPDATE_IP VARCHAR(15) COMMENT '고객센터 문의 업데이트 아이피' NOT NULL,
    PRIMARY KEY (MB_NO, CUSTOMER_SERVICE_COMPLAINT_NO)
);

-- 서비스 고객센터 첨부 이미지 테이블
CREATE TABLE TB_CUSTOMER_SERVICE_COMPLAINT_ATTACHED_IMAGES (
    CUSTOMER_SERVICE_COMPLAINT_NO INT(10) COMMENT '고객센터 문의 넘버' PRIMARY KEY,
    CUSTOMER_SERVICE_COMPLAINT_ATTACHED_IMAGE_NO INT(10) COMMENT '고객센터 문의 이미지 넘버' NOT NULL
);

-- 보유식자재 테이블
CREATE TABLE TB_INGREDIENTS_OWNED (
    MB_NO INT(10) COMMENT '회원 넘버',
    INGREDIENT_OWNED_NO INT(10) COMMENT '보유식자재넘버',
    INGREDIENT_OWNED_NM VARCHAR(20) COMMENT '보유 식자재 이름' NOT NULL,
    INGREDIENT_OWNED_TYPE VARCHAR(20) COMMENT '보유 식자재 구분' NOT NULL,
    INGREDIENT_OWNED_QOW VARCHAR(20) COMMENT '보유 식자재 수량혹은무게' NOT NULL,
    INGREDIENT_OWNED_BUY_DATE VARCHAR(8) COMMENT '보유 식자재 구입일자' NOT NULL,
    INGREDIENT_OWNED_EXPIRATION_DATE VARCHAR(8) COMMENT '보유 식자재 유통기한' NOT NULL,
    INGREDIENT_OWNED_IMAGE_ID VARCHAR(10) COMMENT '보유 식자재 이미지 아이디' NOT NULL,
    INGREDIENT_OWNED_REGISTER_DATE DATE COMMENT '보유 식자재 등록 일자' NOT NULL,
    INGREDIENT_OWNED_REGISTER_IP VARCHAR(15) COMMENT '보유 식자재 등록 아이피' NOT NULL,
    PRIMARY KEY(MB_NO, INGREDIENT_OWNED_NO)
);

-- 레시피 테이블
CREATE TABLE TB_RECIPE (
    MB_NO INT(10) COMMENT '등록자',
    RECIPE_NO INT(10) COMMENT '레시피 넘버',
    RECIPE_NM VARCHAR(25) COMMENT '레시피 명' NOT NULL,
    RECIPE_MAIN_IMAGE_ID VARCHAR(10) COMMENT '레시피 메인 이미지 아이디' NOT NULL,
    RECIPE_EXPLANATION VARCHAR(100) COMMENT '레시피 설명' NOT NULL,
    RECIPE_CRITERIA_BY_COOKING_TIME VARCHAR(6) COMMENT '레시피 요리기준_조리시간' NULL,
    RECIPE_CRITERIA_BY_COOKING_SERVING VARCHAR(6) COMMENT '레시피 요리기준_인분' NULL,
    RECIPE_CATEGORY_BY_OCCASION VARCHAR(6) COMMENT '레시피 카테고리_상황별' NULL,
    RECIPE_CRITERIA_BY_TYPE VARCHAR(6) COMMENT '레시피 카테고리_종류별' NULL,
    RECIPE_REGISTER_DATE DATE COMMENT '레시피 등록 일자' NOT NULL,
    RECIPE_REGISTER_IP VARCHAR(15) COMMENT '레시피 등록 아이피' NOT NULL,
    RECIPE_UPDATE_DATE DATE COMMENT '레시피 업데이트 일자' NOT NULL,
    RECIPE_UPDATE_IP VARCHAR(15) COMMENT '레시피 업데이트 아이피' NOT NULL,
    PRIMARY KEY(MB_NO, RECIPE_NO)
);

-- 레시피 평점 테이블
CREATE TABLE TB_RECIPE_RATING (
    RECIPE_NO INT(10) COMMENT '레시피 넘버',
    MB_NO INT(10) COMMENT '등록자 넘버',
    RECIPE_RATING_SCORE INT(1) COMMENT '레시피 평점' NOT NULL,
    RECIPE_RATING_REGISTER_DATE DATE COMMENT '레시피 평점 등록 일자' NOT NULL,
    RECIPE_RATING_REGISTER_IP VARCHAR(15) COMMENT '레시피 평점 등록 아이피' NOT NULL,
    RECIPE_RATING_UPDATE_DATE DATE COMMENT '레시피 평점 업데이트 일자' NOT NULL,
    RECIPE_RATING_UPDATE_IP VARCHAR(15) COMMENT '레시피 평점 업데이트 아이피' NOT NULL,
    PRIMARY KEY(RECIPE_NO, MB_NO)
);

-- 조리 과정 레시피 테이블
CREATE TABLE TB_COOKING_PROCESS (
    RECIPE_NO INT(10) COMMENT '레시피 넘버',
    RECIPE_STEP_NO INT(3) COMMENT '레시피 스텝 넘버' NOT NULL,
    RECIPE_STEP_IMAGE_ID VARCHAR(10) COMMENT '레시피 스텝 이미지 아이디' NOT NULL,
    RECIPE_STEP_EXPLANATION VARCHAR(100) COMMENT '레시피 스텝 설명' NOT NULL,
    RECIPE_STEP_INGREDIENTS VARCHAR(100) COMMENT '레시피 스텝 재료' NOT NULL,
    RECIPE_STEP_TOOLS VARCHAR(100) COMMENT '레시피 스텝 도구' NOT NULL,
    RECIPE_STEP_TIPS VARCHAR(100) COMMENT '레시피 스텝 팁' NOT NULL,
    RECIPE_STEP_TIMER VARCHAR(6) COMMENT '레시피 스텝 타이머' NOT NULL,
    RECIPE_STEP_REGISTER_DATE DATE COMMENT '레시피 스텝 등록 일자' NOT NULL,
    RECIPE_STEP_REGISTER_IP VARCHAR(15) COMMENT '레시피 스텝 등록 아이피' NOT NULL,
    RECIPE_STEP_UPDATE_DATE DATE COMMENT '레시피 스텝 변경 일자' NOT NULL,
    RECIPE_STEP_UPDATE_IP VARCHAR(15) COMMENT '레시피 스텝 변경 아이피' NOT NULL,
    PRIMARY KEY(RECIPE_NO, RECIPE_STEP_NO)
);

-- 레시피 기록 테이블
CREATE TABLE TB_RECIPE_HISTORY (
    MB_NO INT(10) COMMENT '조회자',
    RECIPE_NO INT(10) COMMENT '레시피 넘버',
    VIEW_DATE DATE COMMENT '조회 일자' NOT NULL,
    PRIMARY KEY(MB_NO, RECIPE_NO)
);

create table refresh_token (
    id int(10) primary key,
    refresh_token VARCHAR(500),
    user_id VARCHAR(500)
);
alter table refresh_token modify column id int NOT NULL AUTO_INCREMENT;
ALTER TABLE refresh_token CONVERT TO CHARSET utf8;

CREATE TABLE TB_FILE_INFO (
    FILE_INFO_NO INT AUTO_INCREMENT COMMENT '파일 정보 넘버' NOT NULL PRIMARY KEY ,
    FILE_INFO_ORG_NM VARCHAR(150) COMMENT '파일 정보 오리지널 파일명',
    FILE_INFO_CUR_NM VARCHAR(150) COMMENT '파일 정보 현재 파일명' NOT NULL,
    FILE_INFO_SIZE VARCHAR(150) COMMENT '파일 정보 파일 크기',
    FILE_INFO_DIR VARCHAR(250) COMMENT '파일 정보 파일 경로' NOT NULL,
    FILE_INFO_EXTENSION VARCHAR(250) COMMENT '파일 정보 확장자' NOT NULL,
    FILE_INFO_REGISTER_DATE DATE COMMENT '파일 정보 등록 일자' NOT NULL,
    FILE_INFO_REGISTER_IP VARCHAR(15) COMMENT '파일 정보 스텝 등록 아이피' NOT NULL,
    FILE_INFO_UPDATE_DATE DATE COMMENT '파일 정보 변경 일자' NOT NULL,
    FILE_INFO_UPDATE_IP VARCHAR(15) COMMENT '파일 정보 변경 아이피' NOT NULL
);
