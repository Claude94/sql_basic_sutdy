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


