-- JOIN 기초

-- 카티시안 프로덕트 (크로스 조인)

SELECT 
    emp_no, emp_nm, a.dept_cd, dept_nm
FROM tb_emp a, tb_dept b

-- 이큐 조인
WHERE a.dept_cd = b.dept_cd -- 조인 조건
;

SELECT 
    dept_cd, dept_nm
FROM tb_dept
;

-- 자격증 정보 테이블
SELECT
    *
FROM tb_certi
;

-- 회원이 취득한 자격증 정보 테이블
SELECT
    *
FROM tb_emp_certi;

-- 사원번호, 사원명, 취득일, 취득자격증 코드번호
SELECT
    *
FROM tb_emp_certi; -- 취득일, 취득자격증 코드번호

SELECT
    *
FROM tb_emp; -- 사원명, 사원번호

SELECT
    a.emp_no, a.emp_nm, b.certi_cd, b.acqu_de, c.certi_nm, d.dept_nm
FROM tb_emp a, tb_emp_certi b, tb_certi c, tb_dept d
WHERE a.emp_no = b.emp_no 
    AND b.certi_cd = c.certi_cd
    AND a.dept_cd = d.dept_cd;


-- INNER JOIN
-- 1. 2개 이상의 테이블이 공통된 컬럼에 의해 논리적으로 결합되는 조인기법입니다.
-- 2. WHERE절에 사용된 컬럼들이 동등연산자(=)에 의해 조인됩니다.
SELECT
    a.emp_nm, a.emp_no, a.addr, b.dept_nm, b.dept_cd
FROM tb_emp a, tb_dept b
WHERE a.dept_cd = b.dept_cd
AND a.addr LIKE '%용인%'
ORDER BY a.emp_nm
;

-- NATURAL JOIN
-- 1. NATURAL JOIN은 동일한 이름을 갖는 컬럼들에 대해 자동 조인하는 기법입니다.
-- 2. 즉, 자동으로 2개 이상의 테이블에서 같은 이름을 가진 컬럼을 찾아 INNER조인을 수행합니다.
-- 3. 이 때 조인되어 동일 이름의 컬럼을 데이터 타입이 같아야 하며 ALIAS나 테이블명을 붙일 수 없습니다.
-- 4. SELECT * 문법을 사용하면, 공통 컬럼으로 자동 조인하며 결과집합에서 한번만 표기됩니다.

SELECT
    a.emp_no, a.emp_nm, a.addr, dept_cd, b.dept_nm
FROM tb_emp a NATURAL JOIN tb_dept b
;

SELECT
    *
FROM tb_emp a NATURAL JOIN tb_dept b
;

-- USING절 조인
-- 1. NATURAL조인에서는 자동으로 이름이 일치하는 모든 컬럼에 대해 조인이
-- 일어나지만 USING을 사용하면 원하는 컬럼에 대해서만 선택적으로 조인이 가능합니다.
-- 2. USING절에서도 조인 컬럼에 대해 ALIAS나 테이블명을 붙일 수 없습니다

SELECT
    a.emp_no, a.emp_nm, a.addr, dept_cd, e.dept_nm
FROM tb_emp a JOIN tb_dept e USING (dept_cd);

-- JOIN ON절
-- 1. 조인 조건 서술부(ON절)와 일반 조건 서술부(WHERE절)를 분리해서 작성하는 방법입니다.
-- 2. ON절을 사용하면 JOIN이후에 논리 연산이나 서브쿼리와 같은 추가 서술을 할 수 있습니다.

SELECT
    a.emp_nm, a.emp_no, a.addr, b.dept_nm, b.dept_cd
FROM tb_emp a 
INNER JOIN tb_dept b
ON a.dept_cd = b.dept_cd
WHERE a.addr LIKE '%용인%'
ORDER BY a.emp_nm
;

-- SELECT [DISTINCT] { 열이름 .... } 
-- FROM  테이블 또는 뷰 이름
-- JOIN  테이블 또는 뷰 이름
-- ON    조인 조건
-- WHERE 조회 조건
-- GROUP BY  열을 그룹화
-- HAVING    그룹화 조건
-- ORDER BY  정렬할 열 [ASC | DESC];

