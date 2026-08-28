-- Leetcode MEDIUM 3338 - Second Highest Salary II
DROP TABLE IF EXISTS Employees;

CREATE TABLE Employees (
    emp_id INT,
    salary INT,
    dept VARCHAR(50)
);

INSERT INTO
    Employees (emp_id, salary, dept)
VALUES
    (1, 70000, 'Sales'),
    (2, 80000, 'Sales'),
    (3, 80000, 'Sales'),
    (4, 90000, 'Sales'),
    (5, 55000, 'IT'),
    (6, 65000, 'IT'),
    (7, 65000, 'IT'),
    (8, 50000, 'Marketing'),
    (9, 55000, 'Marketing'),
    (10, 55000, 'HR');

-- ANS --
-- solution 1 with Common Table Expression.
with cte as(
    select
        *,
        dense_rank() over(
            partition by dept
            order by
                salary desc
        ) rnk
    from
        employees
)
select
    emp_id,
    dept
from
    cte
where
    rnk = 2
order by
    emp_id;