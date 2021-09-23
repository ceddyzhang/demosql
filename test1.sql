SELECT 
    *, DATEDIFF(t1.order_date, t2.order_date) AS duration
FROM
    (SELECT 
        *, a.order_id - 1 as prev_id
    FROM
        sql_store.orders AS a) AS t1
        LEFT JOIN
    sql_store.orders t2 ON t1.prev_id = t2.order_id

