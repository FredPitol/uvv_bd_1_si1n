SELECT
'INSERT INTO empregados (id_empregado,
 nome, 
 email,
telefone,
 data_contratacao, 
 id_cargo, salario,
comissao, id_supervisor, 
id_departamento) 

VALUES

(' || id_empregado || ',
 ''' || first_name || ' ' || last_name || ''',
''' || email || ''',
''' || phone_number || ''',
''' || TO_CHAR(hire_date, 'YYYY-MM-DD') || ',
''' || job_id || ''', ' || salary || ',
  ' ||
NVL(TO_CHAR(commission_pct), 'null') || ', ' ||
NVL(TO_CHAR(manager_id), 'null') || ', ' ||
NVL(TO_CHAR(department_id), 'null') || ');'
FROM employees;