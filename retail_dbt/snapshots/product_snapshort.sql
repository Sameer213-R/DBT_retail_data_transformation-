 {% snapshot product_snapshort %}

{{
   config(
       target_schema='snapshot',
       unique_key='product_id',

       strategy='check',
       check_cols=[
            'product_name',
            'price'
        ],
   )
}}

select *
from 
{{ ref('products_silver') }}

{% endsnapshot %}