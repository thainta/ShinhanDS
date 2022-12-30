----------------------------------------------------PHAN 1: CREATE PROCEDURE ------------------------------------------------------------------------
-- BAI 1
CREATE OR REPLACE PROCEDURE dept_info
    (
        dept_id IN NUMBER
        
    )
    AS
    dept DEPARTMENTS%ROWTYPE;
    BEGIN
        SELECT * INTO dept FROM DEPARTMENTS WHERE DEPARTMENT_ID = dept_id;
        DBMS_OUTPUT.put_line('DEPARTMENT ID = ' || dept.DEPARTMENT_ID);
        DBMS_OUTPUT.put_line('DEPARTMENT NAME = ' || dept.DEPARTMENT_NAME);
        DBMS_OUTPUT.put_line('MANAGER ID = ' || dept.MANAGER_ID);
        DBMS_OUTPUT.put_line('LOCATION ID = ' || dept.LOCATION_ID);
    END;
    

BEGIN
    dept_info(10);
END;

-- BAI2

CREATE OR REPLACE PROCEDURE add_job
    (
        id IN VARCHAR2,
        title IN VARCHAR2
    )
    AS
    BEGIN
        INSERT INTO JOBS(JOB_ID, JOB_TITLE) VALUES(id, title);
    END;

BEGIN
    add_job('JOBID-TEST', 'JOBTITLE-TEST');
END;

-- BAI 3

CREATE OR REPLACE PROCEDURE update_comm
    (
        EMP_ID IN NUMBER
    )
    AS
    BEGIN
        UPDATE EMPLOYEES SET COMMISSION_PCT = COMMISSION_PCT *1.05 
            WHERE EMPLOYEE_ID = EMP_ID AND COMMISSION_PCT != NULL;
    END;

BEGIN 
    update_comm(171);
END;

--BAI 4
CREATE OR REPLACE PROCEDURE add_emp
    (
        EMP_ID IN NUMBER,
        EMP_FIRST_NAME IN VARCHAR2,
        EMP_LAST_NAME  IN VARCHAR2,
        EMP_EMAIL IN VARCHAR2,
        EMP_PHONE_NUMBER IN VARCHAR2,
        EMP_HIRE_DATE IN DATE,
        EMP_JOB_ID IN VARCHAR2,
        EMP_SALARY IN NUMBER,
        EMP_COMMISSION_PCT IN NUMBER,
        EMP_MANAGER_ID IN NUMBER,
        EMP_DEPARTMENT_ID IN NUMBER
    )
    AS
    BEGIN
        INSERT INTO EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) 
            VALUES 
                (EMP_ID,EMP_FIRST_NAME,EMP_LAST_NAME,EMP_EMAIL,EMP_PHONE_NUMBER,EMP_HIRE_DATE,EMP_JOB_ID,EMP_SALARY,EMP_COMMISSION_PCT,EMP_MANAGER_ID,EMP_DEPARTMENT_ID);

    END;

BEGIN
    add_emp(999,'test','test','test','test',to_date('17-JUN-03','DD-MON-RR'),'AD_PRES',24000,null,null,90);
END;

--  BAI 5

CREATE OR REPLACE PROCEDURE delete_emp
    (
        EMP_ID IN NUMBER
    )
    AS
    BEGIN
        DELETE FROM EMPLOYEES WHERE EMPLOYEE_ID = EMP_ID;
    END;

BEGIN 
    delete_emp(999);
END;

-- BAI 6

CREATE OR REPLACE PROCEDURE find_emp
    (
        jobb_id VARCHAR
    )
    AS
        MAX_SAL NUMBER(10);
        MIN_SAL NUMBER(10);
    BEGIN
        SELECT MIN_SALARY, MAX_SALARY INTO MIN_SAL, MAX_SAL FROM JOBS WHERE JOB_ID = jobb_id;
        FOR EMP IN (SELECT * FROM EMPLOYEES WHERE (JOB_ID = jobb_id) AND  (SALARY BETWEEN MIN_SAL AND MAX_SAL))
        LOOP
            DBMS_OUTPUT.put_line(EMP.EMPLOYEE_ID || ', '|| EMP.FIRST_NAME || ', '|| EMP.LAST_NAME || ', '|| 
                                EMP.EMAIL || ', '|| EMP.PHONE_NUMBER || ', '|| EMP.HIRE_DATE || ', '|| EMP.SALARY || ', '|| 
                                EMP.COMMISSION_PCT || ', '|| EMP.MANAGER_ID || ', '|| EMP.DEPARTMENT_ID);
        END LOOP;
    END;

BEGIN
    find_emp('ST_CLERK');
END;

-- BAI 7
CREATE OR REPLACE PROCEDURE update_sal
    AS
        year_diff DECIMAL(7,2);
    BEGIN
    
    FOR EMP IN (SELECT * FROM EMPLOYEES)
        LOOP
            year_diff := (months_between(SYSDATE, EMP.HIRE_DATE) /12);
            IF(year_diff > 2) THEN
                UPDATE EMPLOYEES SET SALARY = SALARY + 200  WHERE EMPLOYEE_ID = EMP.EMPLOYEE_ID;
            ELSIF (year_diff > 1) THEN
                UPDATE EMPLOYEES SET SALARY = SALARY + 100  WHERE EMPLOYEE_ID = EMP.EMPLOYEE_ID;
            ELSIF (year_diff = 1) THEN
                UPDATE EMPLOYEES SET SALARY = SALARY + 50  WHERE EMPLOYEE_ID = EMP.EMPLOYEE_ID;
            END IF;
        END LOOP;
    END;

BEGIN 
    update_sal();
END;

-- BAI 8
CREATE OR REPLACE PROCEDURE job_his
    (
        emp_id IN NUMBER,
        emp_his OUT JOB_HISTORY%ROWTYPE
    )
    AS
    BEGIN
        SELECT * INTO emp_his FROM JOB_HISTORY WHERE EMPLOYEE_ID = emp_id;
    END;
    
DECLARE
    emp_his JOB_HISTORY%ROWTYPE;
BEGIN
    job_his(102, emp_his);
    DBMS_OUTPUT.put_line('EMPLOYEE ID = ' || emp_his.EMPLOYEE_ID);
    DBMS_OUTPUT.put_line('START_DATE = ' || emp_his.START_DATE);
    DBMS_OUTPUT.put_line('END_DATE = ' || emp_his.END_DATE);
    DBMS_OUTPUT.put_line('JOB_ID = ' || emp_his.JOB_ID);
    DBMS_OUTPUT.put_line('DEPARTMENT_ID = ' || emp_his.DEPARTMENT_ID);
END;
----------------------------------------------------PHAN 2: CREATE FUNCTION ------------------------------------------------------------------------
-- BAI 1
CREATE OR REPLACE FUNCTION sum_salary(dept_id IN NUMBER)
RETURN NUMBER 
IS
    SUM_SAL NUMBER(10);
BEGIN
    SELECT SUM(SALARY) INTO SUM_SAL FROM EMPLOYEES WHERE DEPARTMENT_ID = dept_id;
    RETURN SUM_SAL;
END;

SELECT sum_salary(90) from DUAL;

--BAI2

CREATE OR REPLACE FUNCTION name_con(cont_id IN VARCHAR2)
RETURN VARCHAR2 
IS
    cont_name VARCHAR2(20);
BEGIN
    SELECT COUNTRY_NAME INTO cont_name FROM COUNTRIES WHERE COUNTRY_ID = cont_id;
    RETURN cont_name;
END;

SELECT name_con('AR') from DUAL;

-- BAI 3
CREATE OR REPLACE FUNCTION annual(sal IN NUMBER, comm IN NUMBER)
RETURN NUMBER
IS
    RES NUMBER;
BEGIN
    RES := sal *(1+ comm) * 12;
    RETURN RES;
END;

SELECT annual(1000, 0.1)from DUAL;

-- BAI 4 
CREATE OR REPLACE FUNCTION avg_salary(dept_id IN NUMBER)
RETURN NUMBER 
IS
    AVG_SAL NUMBER(10);
BEGIN
    SELECT AVG(SALARY) INTO AVG_SAL FROM EMPLOYEES WHERE DEPARTMENT_ID = dept_id;
    RETURN AVG_SAL;
END;

SELECT avg_salary(90) from DUAL;

-- BAI 5
CREATE OR REPLACE FUNCTION time_work(emp_id IN NUMBER)
RETURN NUMBER 
IS
    time_worked NUMBER(10);
BEGIN
    SELECT (months_between(SYSDATE, HIRE_DATE)) INTO time_worked FROM EMPLOYEES WHERE EMPLOYEE_ID = emp_id;
    RETURN time_worked;
END;

SELECT time_work(100) FROM DUAL;
----------------------------------------------------PHAN 3: CREATE TRIGGER ------------------------------------------------------------------------
--BAI 1
CREATE OR REPLACE TRIGGER employees_before_insert_or_update
BEFORE INSERT OR UPDATE
ON EMPLOYEES FOR EACH ROW
BEGIN 
    IF (:new.HIRE_DATE > SYSDATE) THEN
        raise_application_error(-20000, 'NGAY THUE PHAI NHO HON NGAY HIEN TAI');
    END IF;
END;

Insert into HR.EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values (888,'Steven','King','TEST','515.123.4567',to_date('17-JUN-24','DD-MON-RR'),'AD_PRES',24000,null,null,90);
UPDATE EMPLOYEES SET HIRE_DATE = to_date('17-JUN-24','DD-MON-RR') WHERE EMPLOYEE_ID = 100;  
-- BAI 2
CREATE OR REPLACE TRIGGER jobs_before_insert_or_update
BEFORE INSERT OR UPDATE
ON JOBS FOR EACH ROW
BEGIN 
    IF (:new.MIN_SALARY > :new.MAX_SALARY) OR (:new.MIN_SALARY > :old.MAX_SALARY) OR (:old.MIN_SALARY > :new.MAX_SALARY)THEN
        raise_application_error(-20001, 'MIN_SALARY PHAI NHO HON MAX_SALARY');
    END IF;
END;

Insert into HR.JOBS (JOB_ID,JOB_TITLE,MIN_SALARY,MAX_SALARY) values ('TEST','TEST',41000,40000);
UPDATE JOBS SET MIN_SALARY = 41000 WHERE JOB_ID = 'AD_PRES';

-- BAI 3
DROP TRIGGER job_history_before_insert_or_update;
CREATE OR REPLACE TRIGGER job_history_before_insert_or_update
BEFORE INSERT OR UPDATE
ON JOB_HISTORY FOR EACH ROW
BEGIN 
    IF (:new.START_DATE <= :new.END_DATE) OR(:new.START_DATE <= :old.END_DATE) OR (:old.START_DATE <= :new.END_DATE)THEN
        raise_application_error(-20002, 'NGAY BAT DAU PHAI BE HON HOAC BANG NGAY KET THUC');
    END IF;
END;

--Insert into HR.JOB_HISTORY (EMPLOYEE_ID,START_DATE,END_DATE,JOB_ID,DEPARTMENT_ID) values (888,to_date('13-JAN-07','DD-MON-RR'),to_date('24-JUL-06','DD-MON-RR'),'IT_PROG',60);
UPDATE JOB_HISTORY SET START_DATE = to_date('25-JUL-06','DD-MON-RR') WHERE EMPLOYEE_ID = 102;
-- BAI 4
CREATE OR REPLACE TRIGGER employees_before_insert_or_update_salary_commission
BEFORE UPDATE
ON EMPLOYEES FOR EACH ROW
BEGIN 
    IF (:new.SALARY < :OLD.SALARY) OR (:new.COMMISSION_PCT < :old.COMMISSION_PCT) THEN
        raise_application_error(-20003, 'LUONG VA HOA HONG CUA NHAN VIEN PHAI TANG KHI CAP NHAT');
    END IF;
END;

UPDATE EMPLOYEES SET SALARY = 1000 WHERE EMPLOYEE_ID =100;
