/*
===============================================================================
Verificação de qualidade da camada Ouro
===============================================================================
    O propósito desse script é executar consultas que chequem a qualidade e
    integridade dos dados da camada ouro.

===============================================================================
*/

-- Duplicatas na dimensão customers

SELECT 
    customer_key,
    COUNT(*) AS duplicate_count
FROM ouro.dim_customers
GROUP BY customer_key
HAVING COUNT(*) > 1;

-- Duplicatas na dimensão products

SELECT 
    product_key,
    COUNT(*) AS duplicate_count
FROM ouro.dim_products
GROUP BY product_key
HAVING COUNT(*) > 1;

-- Verificando integridade e consistencia na junção das tabelas

SELECT * 
FROM ouro.fact_sales f
LEFT JOIN ouro.dim_customers c
ON c.customer_key = f.customer_key
LEFT JOIN ouro.dim_products p
ON p.product_key = f.product_key
WHERE p.product_key IS NULL OR c.customer_key IS NULL  