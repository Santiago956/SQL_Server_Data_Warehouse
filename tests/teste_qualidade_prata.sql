
/*
===============================================================================
Verificações de qualidade na camada Prata
===============================================================================
Propósito do Script:
    Este script executa várias verificações de qualidade para consistência de dados, precisão,
    e padronização na camada 'prata'. Inclui verificações para:
    - Chaves primárias nulas ou duplicadas.
    - Espaços indesejados em campos de string.
    - Padronização e consistência de dados.
    - Intervalos de datas inválidos e ordens.
    - Consistência de dados entre campos relacionados.
===============================================================================
*/


-- Verificar NULLs ou Duplicatas na Chave Primária
-- Expectativa: Nenhum Resultado
SELECT 
    cst_id,
    COUNT(*) 
FROM prata.crm_cust_info
GROUP BY cst_id
HAVING COUNT(*) > 1 OR cst_id IS NULL;

-- Verificar Espaços Indesejados
-- Expectativa: Nenhum Resultado
SELECT 
    cst_key 
FROM prata.crm_cust_info
WHERE cst_key != TRIM(cst_key);

-- Padronização e Consistência de Dados
SELECT DISTINCT 
    cst_marital_status 
FROM prata.crm_cust_info;


-- Verificar NULLs ou Duplicatas na Chave Primária
-- Expectativa: Nenhum Resultado
SELECT 
    prd_id,
    COUNT(*) 
FROM prata.crm_prd_info
GROUP BY prd_id
HAVING COUNT(*) > 1 OR prd_id IS NULL;

-- Verificar Espaços Indesejados
-- Expectativa: Nenhum Resultado
SELECT 
    prd_nm 
FROM prata.crm_prd_info
WHERE prd_nm != TRIM(prd_nm);

-- Verificar NULLs ou Valores Negativos no Custo
-- Expectativa: Nenhum Resultado
SELECT 
    prd_cost 
FROM prata.crm_prd_info
WHERE prd_cost < 0 OR prd_cost IS NULL;

-- Padronização e Consistência de Dados
SELECT DISTINCT 
    prd_line 
FROM prata.crm_prd_info;

-- Verificar Ordens de Datas Inválidas (Data de Início > Data de Fim)
-- Expectativa: Nenhum Resultado
SELECT 
    * 
FROM prata.crm_prd_info
WHERE prd_end_dt < prd_start_dt;


-- Verificar Datas Inválidas
-- Expectativa: Nenhuma Data Inválida
SELECT 
    NULLIF(sls_due_dt, 0) AS sls_due_dt 
FROM bronze.crm_sales_details
WHERE sls_due_dt <= 0 
    OR LEN(sls_due_dt) != 8 
    OR sls_due_dt > 20500101 
    OR sls_due_dt < 19000101;

-- Verificar Ordens de Datas Inválidas (Data do Pedido > Datas de Envio/Vencimento)
-- Expectativa: Nenhum Resultado
SELECT 
    * 
FROM prata.crm_sales_details
WHERE sls_order_dt > sls_ship_dt 
   OR sls_order_dt > sls_due_dt;

-- Verificar Consistência de Dados: Vendas = Quantidade * Preço
-- Expectativa: Nenhum Resultado
SELECT DISTINCT 
    sls_sales,
    sls_quantity,
    sls_price 
FROM prata.crm_sales_details
WHERE sls_sales != sls_quantity * sls_price
   OR sls_sales IS NULL 
   OR sls_quantity IS NULL 
   OR sls_price IS NULL
   OR sls_sales <= 0 
   OR sls_quantity <= 0 
   OR sls_price <= 0
ORDER BY sls_sales, sls_quantity, sls_price;


-- Identificar Datas Fora do Intervalo
-- Expectativa: Datas de Nascimento entre 1924-01-01 e Hoje
SELECT DISTINCT 
    bdate 
FROM prata.erp_cust_az12
WHERE bdate < '1924-01-01' 
   OR bdate > GETDATE();

-- Padronização e Consistência de Dados
SELECT DISTINCT 
    gen 
FROM prata.erp_cust_az12;


-- Padronização e Consistência de Dados
SELECT DISTINCT 
    cntry 
FROM prata.erp_loc_a101
ORDER BY cntry;


-- Verificar Espaços Indesejados
-- Expectativa: Nenhum Resultado
SELECT 
    * 
FROM prata.erp_px_cat_g1v2
WHERE cat != TRIM(cat) 
   OR subcat != TRIM(subcat) 
   OR maintenance != TRIM(maintenance);

-- Padronização e Consistência de Dados
SELECT DISTINCT 
    maintenance 
FROM prata.erp_px_cat_g1v2;
