{% snapshot customer_snapshot %}
{{
    config(
        target_schema='snapshot',
        unique_key='customer_id',

        strategy='check',

        check_cols=[
            'email',
            'city'
        ]
    )
}}

SELECT
*
FROM 
{{ref('customer_silver')}}

{% endsnapshot %}