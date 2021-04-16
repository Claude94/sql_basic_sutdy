-- 3개의 테이블 조인
SELECT
    a.emp_nm, a.emp_no, a.addr,
    b.dept_cd, b.dept_nm, c.certi_cd
FROM tb_emp a JOIN tb_dept b ON a.dept_cd = b.dept_cd 
JOIN tb_emp_certi c ON a.emp_no = c.emp_no;

-- 4개 테이블 조인

-- SELF JOIN
-- 1. SELF JOIN은 자기 자신 테이블을 조인하는 개념입니다.
-- 2. 자기 테이블의 컬럼들을 매칭하여 조회하는 기법입니다.

SELECT
    a.emp_nm, a.emp_no, a.direct_manager_emp_no,
    a.emp_nm AS 상사이름
FROM tb_emp a
JOIN tb_emp b
ON a.direct_manager_emp_no = b.emp_no
WHERE a.emp_nm = '김나라'
ORDER BY a.emp.nm;

-- OUTER JOIN 실습환경 세팅
INSERT INTO tb_dept VALUES ('100014', '4차산업혁명팀', '999999');
INSERT INTO tb_dept VALUES ('100015', '포스트코로나팀', '999999');
COMMIT;

SELECT * FROM tb_dept;

ALTER TABLE tb_emp DROP CONSTRAINT fk_tb_emp01;

INSERT INTO tb_emp (emp_no, emp_nm, birth_de, sex_cd, addr, tel_no, direct_manager_emp_no, 
                    final_edu_se_cd, sal_trans_bank_cd, sal_trans_accnt_no, dept_cd, lunar_yn)
VALUES ('1000000041', '이순신', '19811201', '1', '경기도 용인시 수지구 죽전1동 435', '010-5656-7878',
        NULL, '006', '003', '114-554-223433', '000000', 'N');

INSERT INTO tb_emp (emp_no, emp_nm, birth_de, sex_cd, addr, tel_no, direct_manager_emp_no, 
                    final_edu_se_cd, sal_trans_bank_cd, sal_trans_accnt_no, dept_cd, lunar_yn)
VALUES ('1000000042', '정약용', '19820402', '1', '경기도 고양시 덕양구 화정동 231', '010-4054-6547',
        NULL, '004', '001', '110-223-553453', '000000', 'Y');

INSERT INTO tb_emp (emp_no, emp_nm, birth_de, sex_cd, addr, tel_no, direct_manager_emp_no, 
                    final_edu_se_cd, sal_trans_bank_cd, sal_trans_accnt_no, dept_cd, lunar_yn)
VALUES ('1000000043', '박지원', '19850611', '1', '경기도 수원시 팔달구 매탄동 553', '010-1254-1116',
        NULL, '004', '001', '100-233-664234', '000000', 'N');
        
INSERT INTO tb_emp (emp_no, emp_nm, birth_de, sex_cd, addr, tel_no, direct_manager_emp_no, 
            final_edu_se_cd, sal_trans_bank_cd, sal_trans_accnt_no, dept_cd, lunar_yn)
VALUES ('1000000044', '장보고', '19870102', '1', '경기도 성남시 분당구 정자동 776', '010-1215-8784',
        NULL, '004', '002', '180-345-556634', '000000', 'Y');
        
INSERT INTO tb_emp (emp_no, emp_nm, birth_de, sex_cd, addr, tel_no, direct_manager_emp_no, 
            final_edu_se_cd, sal_trans_bank_cd, sal_trans_accnt_no, dept_cd, lunar_yn)
VALUES ('1000000045', '김종서', '19880824', '1', '경기도 고양시 일산서구 백석동 474', '010-3687-1245',
        NULL, '004', '002', '325-344-45345', '000000', 'Y');
        
COMMIT;
    
 
SELECT * FROM tb_emp ORDER BY emp_no DESC;

SELECT * FROM tb_dept;

-- OUTER JOIN
-- 1.조인 조건을 만족하지 않는 행들도 조회할 때 사용하는 조인기법입니다
-- 2. OUTER조인 연산자 기호는 (+)기호입니다
-- 3. INNER조인은 조인 조건을 만족하지 않으면 해당 행을 조회하지 않습니다
-- 그러나 OUTER조인은 방향 (LEFT, RIGHT, FULL)에 맞게 조건에 매칭되지
-- 않는 행들도 모두 NULL로 처리해서 조회합니다.

-- LEFT OUTER JOIN
-- 조인되는 왼쪽 테이블은 모두 조회하고 오른쪽 테이블은 조인조건에 매칭된 것만 조회합니다.

-- 사원정보는 일단 다 보고 싶고 혹시 부서테이블에서 부서코드가 매칭되면 부서이름 출력

SELECT
    a.emp_nm, a.emp_no, b.dept_cd, b.dept_nm
FROM tb_emp a, tb_dept b
WHERE a.dept_cd = b.dept_cd (+);

SELECT
    a.emp_nm, a.emp_no, b.dept_cd, b.dept_nm
FROM tb_emp a 
LEFT JOIN tb_dept b
ON a.dept_cd = b.dept_cd;

-- RIGHT OUTER JOIN
-- 조인되는 오른쪽 테이블은 모두 조회하고 왼쪽 테이블은 조인조건에 매칭된 것만 조회합니다
SELECT
    a.emp_nm, a.emp_no, b.dept_cd, b.dept_nm
FROM tb_emp a, tb_dept b
WHERE a.dept_cd (+) = b.dept_cd;

SELECT
    a.emp_nm, a.emp_no, b.dept_cd, b.dept_nm
FROM tb_emp a 
JOIN tb_dept b
ON a.dept_cd (+) = b.dept_cd;

SELECT
    a.emp_nm, a.emp_no, b.dept_cd, b.dept_nm
FROM tb_emp a 
RIGHT OUTER JOIN tb_dept b
ON a.dept_cd = b.dept_cd;

-- FULL OUTER JOIN


SELECT
    a.emp_nm, a.emp_no, b.dept_cd, b.dept_nm
FROM tb_emp a 
FULL OUTER JOIN tb_dept b
ON a.dept_cd = b.dept_cd;