```sql
SELECT * FROM employees WHERE CAST(department_id AS UNSIGNED) = 10 AND CAST(salary AS DECIMAL(10,2)) > 100000;
```
This improved query addresses the potential issues:

* **Explicit Type Casting:** The `CAST` function ensures that `department_id` and `salary` are treated as the appropriate numeric types, preventing implicit type conversions.
* **Handling NULLs:**  The query still might filter out rows with NULLs in `department_id` and `salary` if those columns are nullable.  To handle NULLs explicitly, you might use COALESCE or IFNULL:

```sql
SELECT * FROM employees
WHERE CAST(COALESCE(department_id, 0) AS UNSIGNED) = 10
  AND CAST(COALESCE(salary, 0) AS DECIMAL(10,2)) > 100000;
```
This revised version uses `COALESCE` to replace NULL values with 0 before the comparison.  Adjust the replacement value (0 in this case) based on the appropriate context of your application.

Choose the solution that best aligns with your database and data handling requirements.