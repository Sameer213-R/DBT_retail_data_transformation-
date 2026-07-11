{% test valid_email(model, column_name) %}

SELECT *
FROM {{ model }}
WHERE {{ column_name }} NOT LIKE '%@%.%'

{% endtest %}