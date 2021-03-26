-- ## SELECT ��ɾ� ##
-- * ���� ���̺� ��� ������ ��ȸ�ϱ�
SELECT * 
FROM emp;

-- DESC : DESCribe�� ����
DESC dept;

-- * ���� ���̺� ���� ������ ��ȸ�ϱ�
SELECT empno, ename
FROM emp;

-- * ǥ������ ����Ͽ� ����ϱ�
SELECT dname, 'good morning~~!' "Good Morning"
FROM dept;

-- ����ǥ�� ����ϴ� �ΰ��� ���
-- 1. ����ǥ �ΰ� ���̱�
SELECT dname, ', it''s deptno : ', deptno "DNAME AND DEPTNO"
FROM dept;

-- 2. q�� '[ ]'�� ���� (�� ���� �ȿ����� ���������� ��밡��)
SELECT dname, q'[, it's deptno : ]' , deptno "DNAME AND DEPTNO"
FROM dept;

-- * �÷���Ī
SELECT dname "Department Name", deptno AS "Department Number"
FROM dept;

-- * DISTINCT ��ɾ�� �ߺ��� ���� �����ϰ� ���
SELECT DISTINCT deptno FROM dept;

-- 10g R2 ���� ���ʹ� DISTINCT ��ɾ�� 
-- HASH �˰����� ����ϱ� ������, �ӵ��鿡 ������ �ִ�.
-- ������ ������ �ʿ��� ��쿡�� ����߸� �Ѵ�.
SELECT DISTINCT job, ename
FROM emp
ORDER BY 1, 2;

-- * ���� �����ڷ� �÷��� �ٿ��� ����ϱ�
SELECT ename || job 
FROM emp;

SELECT ename || ' ''s job is ' || job "NAME AND JOB"
FROM emp;

SELECT  ename || '(' || job || ')' || ' , ' 
     || ename || '''' || job || '''' AS "NAME AND JOB"
FROM emp;

SELECT ename || '''s sal is $' || sal AS "NAME AND SAL"
FROM emp;


-- * ���ϴ� ���Ǹ� ��󳻱� - WHERE �� ���
SELECT empno, ename
FROM emp
WHERE empno = 7900;

SELECT ename, sal
FROM emp
WHERE sal < 1000;

-- ��¥�� ���ڸ� WHERE �������� ã�� ���ؼ��� �ݵ�� ��������ǥ�� �پ���� �Ѵ�.
-- ������ ��� �빮��, �ҹ��ڵ� �� üũ�ؾ� �Ѵ�.
SELECT empno, ename, sal
FROM emp
WHERE ename = 'SMITH';

SELECT empno, ename, sal
FROM emp
WHERE hiredate = '80/12/17';

-- * ��� �⺻ ������ ����ϱ�
SELECT ename, sal, sal + 100, sal * 1.1
FROM emp
WHERE deptno = 10;

-- * �پ��� �����ڸ� Ȱ���ϴ� ���
-- * �� ������ ����ϱ�
-- �� �����ڴ� ���ڿ��� ���ڿ��� ��� ����
SELECT empno, ename, sal
FROM emp
WHERE sal >= 4000;

SELECT empno, ename, sal
FROM emp
where ename >= 'W';

-- * BETWEEN �����ڷ� ���� ������ ��ȸ�ϱ�
-- �������� : BETWEEN �����ڴ� �տ� ������ �ڿ� ū���� �;��ϰ�
--            �� ������ ������ ������� ���´�.
SELECT ename 
FROM emp
WHERE ename BETWEEN 'JAMES' AND 'MARTIN'
ORDER BY ename;

SELECT empno, ename, sal
FROM emp
WHERE sal BETWEEN 2000 AND 3000;

-- BETWEEN���� �Ʒ��� �� �����ڰ� �� �����Ƿ�
-- �����Ͱ� ���ٸ� �Ʒ��� ����� �������
SELECT empno, ename, sal
FROM emp
WHERE sal >= 2000 
AND sal <= 3000;

-- * IN �����ڷ� ���� ������ �����ϰ� �˻��ϱ�
-- IN �����ڴ� �ӵ��� ���� ���� ���� ���ǰ� �ִ�.
-- ���ǿ��� ���ڻӸ� �ƴ϶� ���ڳ� ��¥�� �� �� �ִ�.
SELECT empno, ename, deptno
FROM emp
WHERE deptno IN (10, 20);

-- * LIKE �����ڷ� ����� �͵� ��� ã��
-- �Բ� ���Ǵ� ��ȣ�� % �� _ �� ������ ������ �ǹ̴� ������ ����.
-- % : ���� �� ������ ����(0�� ����) � ���ڰ� �͵� ��� ����
-- _ : ���� ���� �� ���ڸ� �� �� �ְ� � ���ڰ� �͵� ��� ����
-- �� : ����� %�� _�� ���� ���� ���� �ȵȴ�! �ӵ��� ������!! (�ε��� ����)
SELECT empno, ename, sal
FROM emp
WHERE sal LIKE '1%';

SELECT empno, ename, sal
FROM emp
WHERE ename LIKE 'A%';

SELECT empno, ename, hiredate
FROM emp
WHERE hiredate LIKE '___12%';

-- * ���� �������� �� ��� - IS NULL / IS NOT NULL ������ Ȱ���ϱ�
-- �𸣴� ���� ��� NULL�� ó���ȴ�.
-- ��� ���� ���Ҷ� NULL�� �ϳ��� ���� �� ���� NULL�� �ȴ�.
-- �׷��� ������ ������ ����Ѵ�.
SELECT empno, ename, comm
FROM emp
WHERE deptno IN (20, 30);

SELECT empno, ename, comm
FROM emp
WHERE comm IS NULL;

SELECT empno, ename, comm
FROM emp
WHERE comm IS NOT NULL;

-- * �˻� ������ �� �� �̻��� ��� ��ȸ�ϱ�
SELECT ename, hiredate, sal
FROM emp
WHERE hiredate > '82-01-01'
OR sal >= 1300;

SELECT ename, hiredate, sal
FROM emp
WHERE hiredate > '82-01-01'
AND sal >= 1300;

-- �˻� �켱������ ���� ��ȣ�� ������� �Ѵ�.
SELECT empno, ename, sal, comm
FROM emp
WHERE sal > 1000
AND (comm < 1000 OR comm IS NULL);

-- * ����ڿ��� ������ �Է¹޾Ƽ� ���ǿ� �´� �� ����ϱ�
SELECT empno, ename, sal
FROM emp
WHERE empno = &empno;

-- * ORDER BY ����
-- ORDER BY�� ������� �ʰ� SQL�� �ۼ��ؾ� ���� �ӵ��� ��������.
-- ��, �ִ��� ORDER BY�� ������� ����!
SELECT deptno, sal, ename
FROM emp
ORDER BY deptno ASC, sal DESC;

-- * ���� ������
-- ���� ���� �����͵�(����)�� �����ϴ� ��!
-- ���ǻ��� 
-- 1. �� ������ SELECT ���� ���� �÷��� ������ ����
-- 2. �� ������ SELECT ���� ���� �÷��� ������ Ÿ���� ����
-- 3. �� ������ �÷����� �޶� �������

-- * UNION / UNION ALL (�� ������ ������� ���Ѵ�)
-- ALL�� �ְ� ���� ���̴� �ߺ��� ���� �����ϰ� �����ϰ� ����
-- UNION���� �����Ҽ��� SQL ������ ���� ���� �������� �ȴ�.
-- ������ UNION�� ������� �ʴ� ������ ���̴°� ����.
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

-- * INTERSECT ������
-- �� ������ ������ �κ��� ã�Ƴ��� ���� ������
-- ������ ����ϱ� ������ ������.
SELECT stuno, name
FROM student
WHERE deptno1 = 101
INTERSECT 
SELECT studno, name
FROM student
WHERE ddeptno2 = 201;

-- * MINUS ������
-- ū ���տ��� ���� ������ ���� ���� ������
-- ū ����� ���� SQL���� ���� ���� 
-- ���� ����� ���� SQL�� MINUS �ؿ� ����.
-- ���� ������ ����ϱ� ������ ������.
SELECT empno, ename, sal
FROM emp
MINUS
SELECT empno, ename, sal
FROM emp
WHERE sal > 2500;