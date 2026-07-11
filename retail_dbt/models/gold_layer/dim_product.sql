with dim_product as (
select 
*
from 
{{ ref('products_silver') }}  p
join 
{{ ref('catogery_silver') }}  c
on
p.category_id = c.category_id
)
select 
product_id,
product_name,
category_name,
price
from dim_product

