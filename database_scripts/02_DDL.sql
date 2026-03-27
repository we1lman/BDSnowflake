-- Таблица измерений: покупатели
CREATE TABLE dim_customer
(
    customer_id SERIAL PRIMARY KEY,
    first_name  VARCHAR(50),
    last_name   VARCHAR(50),
    age         INT,
    email       VARCHAR(255),
    country     VARCHAR(50),
    postal_code VARCHAR(20)
);

-- Таблица измерений: питомцы
CREATE TABLE dim_pet
(
    pet_id SERIAL PRIMARY KEY,
    type   VARCHAR(255),
    name   VARCHAR(255),
    breed  VARCHAR(255)
);

-- Таблица измерений: продавцы
CREATE TABLE dim_seller
(
    seller_id   SERIAL PRIMARY KEY,
    first_name  VARCHAR(50),
    last_name   VARCHAR(50),
    email       VARCHAR(255),
    country     VARCHAR(50),
    postal_code VARCHAR(20)
);

-- Таблица измерений: товары
CREATE TABLE dim_product
(
    product_id  SERIAL PRIMARY KEY,
    name        VARCHAR(255),
    category    VARCHAR(100),
    price       NUMERIC(10, 2),
    weight      NUMERIC(10, 2),
    color       VARCHAR(50),
    size        VARCHAR(50),
    brand       VARCHAR(100),
    description TEXT,
    rating      NUMERIC(3, 1),
    reviews     INT,
    release_date DATE,
    expiry_date DATE
);

-- Таблица измерений: магазины
CREATE TABLE dim_store
(
    store_id SERIAL PRIMARY KEY,
    name     VARCHAR(70),
    location VARCHAR(255),
    city     VARCHAR(50),
    state    VARCHAR(255),
    country  VARCHAR(50),
    phone    VARCHAR(20),
    email    VARCHAR(255)
);

-- Таблица измерений: поставщики
CREATE TABLE dim_supplier
(
    supplier_id SERIAL PRIMARY KEY,
    name        VARCHAR(50),
    contact     VARCHAR(255),
    email       VARCHAR(255),
    phone       VARCHAR(20),
    address     VARCHAR(255),
    city        VARCHAR(255),
    country     VARCHAR(50)
);

-- Таблица фактов: продажи
CREATE TABLE fact_sales
(
    sale_id          SERIAL PRIMARY KEY,
    customer_id      BIGINT,
    pet_id           BIGINT,
    seller_id        BIGINT,
    product_id       BIGINT,
    store_id         BIGINT,
    supplier_id      BIGINT,
    quantity         INT,
    sale_total_price NUMERIC(10, 2),
    sale_date        DATE,
    FOREIGN KEY (customer_id) REFERENCES dim_customer (customer_id),
    FOREIGN KEY (seller_id) REFERENCES dim_seller (seller_id),
    FOREIGN KEY (product_id) REFERENCES dim_product (product_id),
    FOREIGN KEY (store_id) REFERENCES dim_store (store_id),
    FOREIGN KEY (supplier_id) REFERENCES dim_supplier (supplier_id),
    FOREIGN KEY (pet_id) REFERENCES dim_pet (pet_id)
);
