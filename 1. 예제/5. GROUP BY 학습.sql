-- Grop, by ,Having절
-- 1. 집계 함수

SELECT
    COUNT(emp_no) AS "사원수",
    MAX(birth_de) AS "가장 어린 사람",
    MIN(birth_de) AS "가장 나이 많은 사람"
FROM tb_emp;

SELECT
    *
FROM tb_emp;

SELECT 
    COUNT(*),
    COUNT(direct_manager_emp_no)
FROM tb_emp;

SELECT 
*
FROM tb_sal_his;

-- Group by

-- 부서별로 가장 어린 사람 생녀월일, 가장 연장자의 생년월일, 부서별 총 직원수를 알고 싶다.
SELECT birth_de, dept_cd FROM tb_emp;

SELECT
    A.dept_cd,
    (SELECT B.dept_nm FROM tb_dept B WHERE a.dept_cd = b.dept_cd) AS dep_mn,
    COUNT(*) AS "부서별 직원수",
    MAX(A.birth_de) AS "가장 어린 사람",
    MIN(A.birth_de) AS "부서의 연장자"
FROM tb_emp A
GROUP BY dept_cd
HAVING COUNT(*) > 1
ORDER BY dept_cd;

-- 사원별로 급여를 제일 많은 액수, 제일 적게 받은 액수, 평균액수를 조회
SELECT
    emp_no, pay_de, pay_amt
FROM tb_sal_his
ORDER BY emp_no, pay_de;

SELECT
    A.emp_no,
    (SELECT B.emp_nm FROM tb_emp B WHERE A.emp_no = B.emp_no) AS emp_mn, 
    ROUND(AVG(A.pay_amt), 2) AS "평균 급여",
    MAX(A.pay_amt)AS "최고 수령액",
    MIN(A.pay_amt)AS "최저 수령액"
FROM tb_sal_his A
WHERE a.pay_de BETWEEN '20190101' and '20191231'
GROUP BY A.emp_no
HAVING AVG(A.pay_amt) >= 4700000
ORDER BY A.emp_no;

-- HAVING절 : 그룹화 된 결과에서 조건을 걸어서 행 수 제한

-- 사원별 2019년 사원번호와, 사원이름, 연봉을 조회

SELECT
    A.emp_no,
    (SELECT B.emp_nm FROM tb_emp B WHERE A.emp_no = B.emp_no) AS emp_mn,
    to_char(SUM(A.pay_amt), '999,999,999L') AS "연봉"
FROM tb_sal_his A
WHERE A.pay_de BETWEEN '20190101' and '20191231'
GROUP BY A.emp_no
HAVING SUM(A.pay_amt) >= 50000000
ORDER BY A.emp_no;

-- 정렬 ORDER BY
-- ASC : 오름차(기본값), DESC 내림차
SELECT
    emp_no, emp_nm, addr
FROM tb_emp
ORDER BY emp_no ASC;

SELECT
    emp_no, emp_nm, addr
FROM tb_emp
ORDER BY emp_nm DESC;

SELECT
    emp_no, emp_nm, addr
FROM tb_emp
ORDER BY 2;

SELECT
    emp_no, emp_nm, addr
FROM tb_emp
ORDER BY emp_nm DESC, emp_no;

SELECT
    emp_no AS en, emp_nm AS em, addr
FROM tb_emp
ORDER BY em DESC;
