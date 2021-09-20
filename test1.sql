SELECT 
    *, DATEDIFF(t1.order_date, t2.order_date) AS diff
FROM
    (SELECT 
        *, a.order_id - 1 test
    FROM
        sql_store.orders AS a) AS t1
        LEFT JOIN
    sql_store.orders t2 ON t1.test = t2.order_id

