SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

DROP DATABASE employee_db;
--

CREATE DATABASE employee_db WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'English_United States.1252' LC_CTYPE = 'English_United States.1252';


ALTER DATABASE employee_db OWNER TO postgres;

\connect employee_db

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--

CREATE TABLE public.department (
    dept_no character varying(4) NOT NULL,
    dept_name character varying
);


ALTER TABLE public.department OWNER TO postgres;

--

CREATE TABLE public.departmentemployee (
    emp_no integer NOT NULL,
    dept_no character varying(4) NOT NULL
);


ALTER TABLE public.departmentemployee OWNER TO postgres;

--

CREATE TABLE public.departmentmanager (
    dept_no character varying(4) NOT NULL,
    emp_no integer NOT NULL
);


ALTER TABLE public.departmentmanager OWNER TO postgres;

--

CREATE TABLE public.employee (
    emp_no integer NOT NULL,
    emp_title_id character varying(5),
    birth_date date,
    first_name character varying,
    last_name character varying,
    sex character varying(1),
    hire_date date
);


ALTER TABLE public.employee OWNER TO postgres;

--

CREATE TABLE public.salary (
    emp_no integer,
    salary integer
);


ALTER TABLE public.salary OWNER TO postgres;

--

CREATE TABLE public.title (
    title_id character varying(5) NOT NULL,
    title character varying
);


ALTER TABLE public.title OWNER TO postgres;

--

ALTER TABLE ONLY public.department
    ADD CONSTRAINT department_pkey PRIMARY KEY (dept_no);


--

ALTER TABLE ONLY public.departmentemployee
    ADD CONSTRAINT departmentemployee_pkey PRIMARY KEY (dept_no, emp_no);

--

ALTER TABLE ONLY public.departmentmanager
    ADD CONSTRAINT departmentmanager_pkey PRIMARY KEY (dept_no, emp_no);


--

ALTER TABLE ONLY public.employee
    ADD CONSTRAINT employee_pkey PRIMARY KEY (emp_no);


--

ALTER TABLE ONLY public.title
    ADD CONSTRAINT title_pkey PRIMARY KEY (title_id);



--

ALTER TABLE ONLY public.departmentemployee
    ADD CONSTRAINT departmentemployee_dept_no_fkey FOREIGN KEY (dept_no) REFERENCES public.department(dept_no);


--

ALTER TABLE ONLY public.departmentemployee
    ADD CONSTRAINT departmentemployee_emp_no_fkey FOREIGN KEY (emp_no) REFERENCES public.employee(emp_no);



--

ALTER TABLE ONLY public.departmentmanager
    ADD CONSTRAINT departmentmanager_dept_no_fkey FOREIGN KEY (dept_no) REFERENCES public.department(dept_no);



--

ALTER TABLE ONLY public.departmentmanager
    ADD CONSTRAINT departmentmanager_emp_no_fkey FOREIGN KEY (emp_no) REFERENCES public.employee(emp_no);




ALTER TABLE ONLY public.employee
    ADD CONSTRAINT employee_emp_title_id_fkey FOREIGN KEY (emp_title_id) REFERENCES public.title(title_id);




ALTER TABLE ONLY public.salary
    ADD CONSTRAINT salary_emp_no_fkey FOREIGN KEY (emp_no) REFERENCES public.employee(emp_no);


