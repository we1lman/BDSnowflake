SELECT *
FROM mock_data
LIMIT 10;

DROP TABLE IF EXISTS dim_supplier CASCADE;

SELECT count(*) FROM mock_data;
SELECT count(*) FROM fact_sales;
-- Совпало (по 10 000 в каждой)

SELECT sum(sale_total_price) FROM mock_data;
SELECT sum(sale_total_price) FROM fact_sales;
-- Ураа, снова совпало, хах

DROP TABLE mock_data;

