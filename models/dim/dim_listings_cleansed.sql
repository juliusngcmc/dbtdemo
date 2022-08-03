WITH src_listings AS (
    SELECT
    *
    FROM
    {{ ref('src_listings') }}
)
SELECT
    listing_id,
    listing_name,
    room_type,
    CASE
    WHEN minimum_nights = 0 THEN 1
    ELSE minimum_nights
    END AS minimum_nights,
    host_id,
    ROUND( REPLACE(price_str,'$') ,2) AS price,
    created_at,
    updated_at
FROM
    src_listings