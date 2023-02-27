use hr;
select * from departments;
select location_id,street_address,city,state_province,country_name from locations
natural join countries;
select first_name,last_name,department_id from employees;
select e.first_name,e.last_name,e.job_id,e.department_id,d.department_name 
from employees e join departments d on(e.department_id = d.department_id)
join locations l on (d.location_id = l.location_id) where lower(l.city)="london";
select e.employee_id 'emp_id',e.last_name 'employee name',
 m.employee_id 'manager_id',m.last_name 'manager name'
from employees e
join employees m
on (e.manager_id=m.employee_id);
select e.first_name,e.last_name,e.hire_date
from employees e
join employees davies
on (davies.last_name ='jones')
where davies.hire_date < e.hire_date;
select department_name as 'Department name',
count(*) as 'no of employees'
from departments
inner join employees
on employees.department_id =departments.department_id
group by departments.department_id
order by department_name;
select first_name,last_name
from employees
natural join departments
where department_name ='IT';
select first_name,last_name from employees 
where manager_id in (select employee_id from employees
where department_id in (select department_id from departments
where location_id in (select location_id from locations 
where country_id = 'US')));
select first_name,last_name from employees
where department_id in( select department_id from departments
where department_name ='IT');
select first_name,last_name,salary from employees
where salary > (select salary from employees where last_name ='Bull');
select first_name,last_name,salary from employees
where salary > (select salary from employees where salary > avg(salary));
