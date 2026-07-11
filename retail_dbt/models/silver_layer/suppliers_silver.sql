select 
cast(supplier_id as int) as supplier_id,
initcap(trim(supplier_name)) as supplier_name,
current_timestamp() as load_date
from 
{{ source('retail_dbt', 'suppliers_bronze') }}
