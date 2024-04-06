SELECT
    r.Vehicle_id,
    o.Product_Name,
    SUM(o.Quantity) AS Total_quantity
FROM
    Routes r
JOIN
    Customers c ON r.Route_id = c.Route_id
JOIN
    Orders o ON c.Customer_id = o.Customer_id
WHERE
    o.Delivery_date BETWEEN :start_date AND :end_date
    AND o.Order_status = 'confirmed'
GROUP BY
    r.Vehicle_id,
    o.Product_Name;


--In the above query we have to specify the start_date and end_date
