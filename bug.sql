```sql
SELECT * FROM employees WHERE department_id = 10 AND salary > 100000;
```
This query might appear correct but could lead to unexpected results or errors in certain scenarios:

* **Implicit Type Conversion:** If the `salary` column is not explicitly defined as a numeric type (e.g., `INT`, `DECIMAL`), an implicit type conversion might occur if `100000` is stored as a string.  This can cause incorrect filtering and unexpected results.
* **Data Type Mismatch:**  If `department_id` is a different data type than the literal `10` (e.g., `department_id` is a string, but 10 is an integer),  this could lead to type-related errors. 
* **NULL Values:** If `department_id` or `salary` have NULL values, the WHERE clause might filter out rows unexpectedly. NULL values do not compare equal to any value, including NULL.
* **Index Usage:** Missing or poorly chosen indexes on the `department_id` and `salary` columns could lead to poor query performance, especially on large datasets.