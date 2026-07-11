{% snapshot payment_sanpshort%}
{{config(
        target_schema='snapshot',
        unique_key='payment_id',

        strategy='check',

        check_cols=['payment_status']
    )
}}

select
* 
from
{{ ref('payments_silver') }}


{%endsnapshot%}