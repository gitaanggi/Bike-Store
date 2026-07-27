SELECT
	o.order_id,
	CONCAT(cu.first_name,' ',cu.last_name) AS 'customer',
	cu.city,
	cu.state,
	o.order_date,
	SUM(i.quantity) AS 'total_units',
	SUM(i.quantity*i.list_price) AS 'revenue',
	p.product_name,
	ca.category_name,
	b.brand_name,
	sto.store_name,
	CONCAT(sta.first_name,' ',sta.last_name) AS 'sales_rep'

FROM sales.orders o
JOIN sales.customers cu
ON o.customer_id = cu.customer_id
JOIN sales.order_items i
ON o.order_id = i.order_id
JOIN production.products p
ON i.product_id = p.product_id
JOIN production.categories ca
ON p.category_id = ca.category_id
JOIN production.brands b
ON b.brand_id = p.brand_id
JOIN sales.stores sto
ON sto.store_id = o.store_id
JOIN sales.staffs sta
ON o.staff_id = sta.staff_id

GROUP BY
	o.order_id,
	CONCAT(cu.first_name,' ', cu.last_name),
	cu.city,
	cu.state,
	o.order_date,
	p.product_name,
	ca.category_name,
	b.brand_name,
	sto.store_name,
	CONCAT(sta.first_name,' ', sta.last_name)
