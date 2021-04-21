-- 서브쿼리
-- 단일행 서브쿼리

-- 사원번호가 1000000005번인 사원이 속한 부서의 모든 사원정보

SELECT
    emp_nm, emp_no, dept_cd
FROM tb_emp
WHERE dept_cd = (
    SELECT
        dept_cd
    FROM tb_emp
    WHERE emp_no = '1000000005'
);

-- 20150525에 받은 급여가 회사 전체 평균급여보다 높은 사원들의 정보 조회

SELECT
    a.emp_no, a.emp_nm, b.pay_de, b.pay_amt
FROM tb_emp a
JOIN tb_sal_his b
ON a.emp_no = b.emp_no
WHERE b.pay_de = '20200525'
AND b.pay_amt >= (
    SELECT
        AVG(pay_amt)
    FROM tb_sal_his
    WHERE pay_de = '20200525'
);

-- 다중행 서브쿼리
-- 서브쿼리 조회 건수가 여려 행인 것
-- 다중행 연산자 : IN, ANY, EXISTS

-- 한국데이터베이스진흥원에서 발급한 자격증을 가지고 있는 사원번호와 보유 자격증 개수를 조회

SELECT
    a.emp_no, b.emp_nm, COUNT(a.certi_cd)
FROM tb_emp_certi a 
JOIN tb_emp b
ON a.emp_no = b.emp_no
WHERE a.certi_cd IN (
SELECT
    certi_cd
FROM tb_certi c
WHERE issue_insti_nm LIKE '한국데이터베이스진흥원'
)
GROUP BY a.emp_no, b.emp_nm
ORDER BY a.emp_no
;

-- 다중 컬럼 서브쿼리
-- 부서원이 2명 이상인 부서 중에서 각 부서의 가장 나이 많은 사람의 정보를 조회

SELECT
    a.emp_nm, a.emp_no, a.dept_cd, b.dept_nm, a.birth_de
FROM tb_emp a
JOIN tb_dept b
ON a.dept_cd = b.dept_cd
WHERE (a.dept_cd, a.birth_de) IN (
    SELECT
        c.dept_cd, MIN(c.birth_de)
    FROM tb_emp c
    GROUP BY c.dept_cd
    HAVING COUNT(*) >= 2
    )
ORDER BY a.emp_no
;

SELECT
    1
FROM tb_emp
WHERE addr LIKE '%용인%';

-- 주소가 강남인 직원들의 부서정보를 조회
SELECT
    a.dept_cd, a.dept_nm
FROM tb_dept a
WHERE EXISTS ( 
    SELECT 1
    FROM tb_emp b
    WHERE b.addr LIKE '%강남%'
        AND a.dept_cd = b.dept_cd
);

-- 스칼라 서브쿼리 (select절에 들어가는 서브쿼리)

SELECT
    a.emp_no, a.emp_nm, a.dept_cd,
    (SELECT b.dept_nm FROM tb_dept b WHERE a.dept_cd = b.dept_cd) as dept_nm
FROM tb_emp a;

-- 한국데이터베이스진흥원에서 발급한 자격증을 갖고 있는 사원의 정보를 조회
SELECT
    a.emp_no, (SELECT b.emp_nm FROM tb_emp b WHERE a.emp_no = b.emp_no) AS emp_nm,
    a.certi_cd, (SELECT c.certi_nm FROM tb_certi c WHERE a.certi_cd = c.certi_cd) AS certi_nm
FROM tb_emp_certi a
WHERE a.certi_cd IN (
    SELECT
        b.certi_cd
    FROM tb_certi b
    WHERE b.issue_insti_nm = '한국데이터베이스진흥원'
)
;

-- 인라인 뷰 (FROM절에 사용하는 서브쿼리)

SELECT
    *
FROM (
    SELECT
        ROWNUM rn, emp_nm, emp_no, addr
    FROM tb_emp
    WHERE ROWNUM <= 10
) a
WHERE a.addr LIKE '%용인%'
;

SELECT
    ROWNUM, emp_nm, emp_no, addr
FROM tb_emp
ORDER BY emp_no;

-- 다중행 서브쿼리 연산자
-- 1. IN: 목록의 어떤값과 같은지 확인
-- 2. ANY, SOME: 값을 서브쿼리에 의해 리턴된 값 목록과 비교하는데 하나라도 만족하면 됨.
-- 3. ALL: 값을 서브쿼리에 의해 리턴된 값 목록과 비교하는데 모든 값을 만족해야 함.
-- 4. EXISTS: 결과를 만족하는 값이 존재하는지의 여부를 확인

-- IN연산자와 = ANY는 동일하다

SELECT
    emp_nm, addr, dept_cd
FROM tb_emp
WHERE dept_cd = SOME (
    SELECT
        dept_cd
    FROM tb_emp
    WHERE emp_nm = '이나라'
);



