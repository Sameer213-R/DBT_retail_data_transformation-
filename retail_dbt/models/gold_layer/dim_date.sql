WITH date_series AS (

    SELECT explode(
        sequence(
            to_date('2020-01-01'),
            to_date('2035-12-31'),
            interval 1 day
        )
    ) AS calendar_date

)

SELECT

    calendar_date AS date_key,

    year(calendar_date) AS year,

    quarter(calendar_date) AS quarter,

    month(calendar_date) AS month,

    monthname(calendar_date) AS month_name,

    day(calendar_date) AS day,

    dayofweek(calendar_date) AS day_of_week,

    date_format(calendar_date, 'EEEE') AS day_name,

    weekofyear(calendar_date) AS week_number,

    CASE
        WHEN dayofweek(calendar_date) IN (1, 7)
        THEN TRUE
        ELSE FALSE
    END AS is_weekend

FROM date_series