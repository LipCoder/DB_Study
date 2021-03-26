-- ## SELECT 명령어 ##
-- * 일정 테이블에 모든 정보를 조회하기
SELECT * 
FROM emp;

-- DESC : DESCribe의 약자
DESC dept;

-- * 일정 테이블에 일정 정보만 조회하기
SELECT empno, ename
FROM emp;

-- * 표현식을 사용하여 출력하기
SELECT dname, 'good morning~~!' "Good Morning"
FROM dept;

-- 따옴표를 출력하는 두가지 방법
-- 1. 따옴표 두개 붙이기
SELECT dname, ', it''s deptno : ', deptno "DNAME AND DEPTNO"
FROM dept;

-- 2. q와 '[ ]'로 묶기 (이 영역 안에서는 자유자제로 사용가능)
SELECT dname, q'[, it's deptno : ]' , deptno "DNAME AND DEPTNO"
FROM dept;

-- * 컬럼별칭
SELECT dname "Department Name", deptno AS "Department Number"
FROM dept;

-- * DISTINCT 명령어로 중복된 값을 제거하고 출력
SELECT DISTINCT deptno FROM dept;

-- 10g R2 버전 부터는 DISTINCT 명령어는 
-- HASH 알고리즘을 사용하기 때문에, 속도면에 이점이 있다.
-- 때문에 정렬이 필요할 경우에는 해줘야만 한다.
SELECT DISTINCT job, ename
FROM emp
ORDER BY 1, 2;

-- * 연결 연산자로 컬럼을 붙여서 출력하기
SELECT ename || job 
FROM emp;

SELECT ename || ' ''s job is ' || job "NAME AND JOB"
FROM emp;

SELECT  ename || '(' || job || ')' || ' , ' 
     || ename || '''' || job || '''' AS "NAME AND JOB"
FROM emp;

SELECT ename || '''s sal is $' || sal AS "NAME AND SAL"
FROM emp;


-- * 원하는 조건만 골라내기 - WHERE 절 사용
SELECT empno, ename
FROM emp
WHERE empno = 7900;

SELECT ename, sal
FROM emp
WHERE sal < 1000;

-- 날짜나 문자를 WHERE 조건절로 찾기 위해서는 반드시 작은따옴표를 붙어줘야 한다.
-- 문자의 경우 대문자, 소문자도 꼭 체크해야 한다.
SELECT empno, ename, sal
FROM emp
WHERE ename = 'SMITH';

SELECT empno, ename, sal
FROM emp
WHERE hiredate = '80/12/17';

-- * 산술 기본 연산자 사용하기
SELECT ename, sal, sal + 100, sal * 1.1
FROM emp
WHERE deptno = 10;

-- * 다양한 연산자를 활용하는 방법
-- * 비교 연산자 사용하기
-- 비교 연산자는 숫자에도 문자에도 사용 가능
SELECT empno, ename, sal
FROM emp
WHERE sal >= 4000;

SELECT empno, ename, sal
FROM emp
where ename >= 'W';

-- * BETWEEN 연산자로 구간 데이터 조회하기
-- 주의할점 : BETWEEN 연산자는 앞에 작은값 뒤에 큰값이 와야하고
--            두 값들을 포함한 결과값이 나온다.
SELECT ename 
FROM emp
WHERE ename BETWEEN 'JAMES' AND 'MARTIN'
ORDER BY ename;

SELECT empno, ename, sal
FROM emp
WHERE sal BETWEEN 2000 AND 3000;

-- BETWEEN보다 아래의 비교 연산자가 더 빠르므로
-- 데이터가 많다면 아래의 방법을 사용하자
SELECT empno, ename, sal
FROM emp
WHERE sal >= 2000 
AND sal <= 3000;

-- * IN 연산자로 여러 조건을 간편하게 검색하기
-- IN 연산자는 속도가 빨라서 아주 많이 사용되고 있다.
-- 조건에는 숫자뿐만 아니라 문자나 날짜도 올 수 있다.
SELECT empno, ename, deptno
FROM emp
WHERE deptno IN (10, 20);

-- * LIKE 연산자로 비슷한 것들 모두 찾기
-- 함께 사용되는 기호는 % 와 _ 두 가지가 있으며 의미는 다음과 같다.
-- % : 글자 수 제한이 없고(0개 포함) 어떤 글자가 와도 상관 없음
-- _ : 글자 수는 한 글자만 올 수 있고 어떤 글자가 와도 상관 없음
-- 팁 : 절대로 %나 _를 가장 먼저 쓰면 안된다! 속도가 느리다!! (인덱스 때문)
SELECT empno, ename, sal
FROM emp
WHERE sal LIKE '1%';

SELECT empno, ename, sal
FROM emp
WHERE ename LIKE 'A%';

SELECT empno, ename, hiredate
FROM emp
WHERE hiredate LIKE '___12%';

-- * 값이 무엇인지 모를 경우 - IS NULL / IS NOT NULL 연산자 활용하기
-- 모르는 것은 모두 NULL로 처리된다.
-- 모든 값을 더할때 NULL이 하나라도 들어가면 그 값은 NULL이 된다.
-- 그렇기 때문에 조심히 써야한다.
SELECT empno, ename, comm
FROM emp
WHERE deptno IN (20, 30);

SELECT empno, ename, comm
FROM emp
WHERE comm IS NULL;

SELECT empno, ename, comm
FROM emp
WHERE comm IS NOT NULL;

-- * 검색 조건이 두 개 이상일 경우 조회하기
SELECT ename, hiredate, sal
FROM emp
WHERE hiredate > '82-01-01'
OR sal >= 1300;

SELECT ename, hiredate, sal
FROM emp
WHERE hiredate > '82-01-01'
AND sal >= 1300;

-- 검색 우선순위에 따라 괄호로 묶어줘야 한다.
SELECT empno, ename, sal, comm
FROM emp
WHERE sal > 1000
AND (comm < 1000 OR comm IS NULL);

-- * 사용자에게 조건을 입력받아서 조건에 맞는 값 출력하기
SELECT empno, ename, sal
FROM emp
WHERE empno = &empno;

-- * ORDER BY 정렬
-- ORDER BY를 사용하지 않고 SQL을 작성해야 수행 속도가 빨라진다.
-- 즉, 최대한 ORDER BY는 사용하지 말자!
SELECT deptno, sal, ename
FROM emp
ORDER BY deptno ASC, sal DESC;

-- * 집합 연산자
-- 여러 건의 데이터들(집합)을 연산하는 것!
-- 주의사항 
-- 1. 두 집합의 SELECT 절에 오는 컬럼의 개수가 동일
-- 2. 두 집합의 SELECT 절에 오는 컬럼의 데이터 타입이 동일
-- 3. 두 집합의 컬럼명은 달라도 상관없음

-- * UNION / UNION ALL (두 집합의 결과들을 더한다)
-- ALL이 있고 없고 차이는 중복된 값을 포함하고 제거하고 차이
-- UNION으로 연결할수로 SQL 성능은 아주 많이 떨어지게 된다.
-- 가급적 UNION은 사용하지 않는 습관을 들이는게 좋다.
SELECT studno, name
FROM student
WHERE deptno1 = 101
UNION
SELECT studno, name
FROM student
WHERE deptno2 = 201;

SELECT studno, name
FROM student
WHERE deptno1 = 101
UNION ALL
SELECT studno, name
FROM student
WHERE deptno2 = 201;

-- * INTERSECT 연산자
-- 두 집합의 교집합 부분을 찾아내는 집합 연산자
-- 정렬을 사용하기 때문에 느리다.
SELECT stuno, name
FROM student
WHERE deptno1 = 101
INTERSECT 
SELECT studno, name
FROM student
WHERE ddeptno2 = 201;

-- * MINUS 연산자
-- 큰 집합에서 작은 집합을 빼는 집합 연산자
-- 큰 결과를 가진 SQL문을 먼저 쓰고 
-- 작은 결과를 가진 SQL을 MINUS 밑에 쓴다.
-- 역시 정렬을 사용하기 때문에 느리다.
SELECT empno, ename, sal
FROM emp
MINUS
SELECT empno, ename, sal
FROM emp
WHERE sal > 2500;