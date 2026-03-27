INSERT INTO dim_customer (first_name, last_name, age, email, country, postal_code)
SELECT DISTINCT
    d.customer_first_name,
    d.customer_last_name,
    d.customer_age,
    d.customer_email,
    d.customer_country,
    d.customer_postal_code
FROM mock_data d;

INSERT INTO dim_pet (type, name, breed)
SELECT DISTINCT
    customer_pet_type,
    customer_pet_name,
    customer_pet_breed
FROM mock_data;

INSERT INTO dim_seller (first_name, last_name, email, country, postal_code)
SELECT DISTINCT
    d.seller_first_name,
    d.seller_last_name,
    d.seller_email,
    d.seller_country,
    d.seller_postal_code
FROM mock_data d;

INSERT INTO dim_product (name, category, price, weight, color, size, brand, description, rating, reviews, release_date, expiry_date)
SELECT DISTINCT
    d.product_name,
    d.product_category,
    d.product_price,
    d.product_weight,
    d.product_color,
    d.product_size,
    d.product_brand,
    d.product_description,
    d.product_rating,
    d.product_reviews,
    TO_DATE(d.product_release_date, 'MM/DD/YYYY'),
    TO_DATE(d.product_expiry_date, 'MM/DD/YYYY')
FROM mock_data d;

INSERT INTO dim_store (name, location, city, state, country, phone, email)
SELECT DISTINCT
    d.store_name,
    d.store_location,
    d.store_city,
    d.store_state,
    d.store_country,
    d.store_phone,
    d.store_email
FROM mock_data d;

INSERT INTO dim_supplier (name, contact, email, phone, address, city, country)
SELECT DISTINCT
    d.supplier_name,
    d.supplier_contact,
    d.supplier_email,
    d.supplier_phone,
    d.supplier_address,
    d.supplier_city,
    d.supplier_country
FROM mock_data d;

INSERT INTO fact_sales (customer_id, pet_id, seller_id, product_id, store_id, supplier_id, sale_date, quantity, sale_total_price)
SELECT
    dc.customer_id,
    dp.pet_id,
    ds.seller_id,
    dprod.product_id,
    dst.store_id,
    dsup.supplier_id,
    TO_DATE(d.sale_date, 'MM/DD/YYYY'),
    d.sale_quantity,
    d.sale_total_price
FROM mock_data d
LEFT JOIN dim_customer dc
    ON dc.first_name = d.customer_first_name
   AND dc.last_name  = d.customer_last_name
   AND dc.email      = d.customer_email
LEFT JOIN dim_pet dp
    ON dp.type  = d.customer_pet_type
   AND dp.name  = d.customer_pet_name
   AND dp.breed = d.customer_pet_breed
LEFT JOIN dim_seller ds
    ON ds.first_name = d.seller_first_name
   AND ds.last_name  = d.seller_last_name
   AND ds.email      = d.seller_email
LEFT JOIN dim_product dprod
    ON dprod.name    = d.product_name
   AND dprod.price   = d.product_price
   AND dprod.color   = d.product_color
   AND dprod.size    = d.product_size
   AND dprod.rating  = d.product_rating
   AND dprod.reviews = d.product_reviews
LEFT JOIN dim_store dst
    ON dst.name   = d.store_name
   AND dst.phone  = d.store_phone
   AND dst.email  = d.store_email
LEFT JOIN dim_supplier dsup
    ON dsup.name  = d.supplier_name
   AND dsup.email = d.supplier_email
   AND dsup.phone = d.supplier_phone;
