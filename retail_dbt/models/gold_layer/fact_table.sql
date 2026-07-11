{{ config(
    materialized='incremental',
    unique_key='order_item_id',
    incremental_strategy='merge'
) }}

with orders as (
    select * from 
    {{ ref('orders_silver') }}
),
order_items as (
    select 
    * from 
    {{ ref('orders_item_silver') }}
),
payment as (
    select 
    * from 
    {{ ref('payments_silver') }}
)

select 
oi.order_item_id,
o.order_id,
o.customer_id,
oi.product_id,
p.payment_id,
o.order_date,
oi.quantity,
oi.unit_price,
oi.total_cost,
o.order_status,
p.payment_status
 from 
orders o join 
order_items oi
on 
o.order_id = oi.order_id
left join 
payment p
on 
o.order_id = p.order_id

