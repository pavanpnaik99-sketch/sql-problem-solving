-- Calculate Product Final Price - Using IFNULL in SQL
CREATE TABLE IF NOT EXISTS Products (
    product_id INT,
    category VARCHAR(50),
    price INT
);

CREATE TABLE IF NOT EXISTS Discounts (category VARCHAR(50), discount INT);

TRUNCATE TABLE Products;

TRUNCATE TABLE Discounts;

INSERT INTO
    Products (product_id, category, price)
VALUES
    (1, 'Electronics', 1000),
    (2, 'Clothing', 50),
    (3, 'Electronics', 1200),
    (4, 'Home', 500);

INSERT INTO
    Discounts (category, discount)
VALUES
    ('Electronics', 10),
    ('Clothing', 20);

-- solution --
1.
SELECT
    p.product_id,
    round(
        p.price - (p.price * COALESCE(d.discount, 0) / 100),
        0
    ) AS final_price,
    p.category
FROM
    Products p
    LEFT JOIN Discounts d ON p.category = d.category
ORDER BY
    p.product_id;

2.