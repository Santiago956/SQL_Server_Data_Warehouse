CREATE OR ALTER PROCEDURE bronze.load_bronze AS
BEGIN
	DECLARE @start_time DATETIME, @end_time DATETIME, @total_start DATETIME, @total_end DATETIME;
	BEGIN TRY
		
		SET @total_start = GETDATE();
		PRINT '==========================';
		PRINT 'Carregando a camada Bronze';
		PRINT '==========================';


		PRINT '--------------------------';
		PRINT 'Carregando tabelas do CRM'
		PRINT '--------------------------';
		
		SET @start_time = GETDATE();
		TRUNCATE TABLE bronze.crm_cust_info;

		BULK INSERT bronze.crm_cust_info
		FROM 'E:\repo\SQL_Server_Data_Warehouse\datasets\source_crm\cust_info.csv'
		WITH (
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			TABLOCK
		);
		SET @end_time = GETDATE();
		PRINT '>> Tabela crm_cust_info carregada';
		PRINT '>> Duração da carga:' + CAST(DATEDIFF(second, @start_time, @end_time) AS NVARCHAR) + ' seconds';
		PRINT '>> --------------------';

		SET @start_time = GETDATE();
		TRUNCATE TABLE bronze.crm_prd_info;

		BULK INSERT bronze.crm_prd_info
		FROM 'E:\repo\SQL_Server_Data_Warehouse\datasets\source_crm\prd_info.csv'
		WITH (
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			TABLOCK
		);

		SET @end_time = GETDATE();
		PRINT '>> Tabela crm_prd_info carregada';
		PRINT '>> Duração da carga:' + CAST(DATEDIFF(second, @start_time, @end_time) AS NVARCHAR) + ' seconds';

		SET @start_time = GETDATE();
		TRUNCATE TABLE bronze.crm_sales_details;

		BULK INSERT bronze.crm_sales_details
		FROM 'E:\repo\SQL_Server_Data_Warehouse\datasets\source_crm\sales_details.csv'
		WITH (
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			TABLOCK
		);

		SET @end_time = GETDATE();
		PRINT '>> Tabela crm_sales_details carregada';
		PRINT '>> Duração da carga:' + CAST(DATEDIFF(second, @start_time, @end_time) AS NVARCHAR) + ' seconds';
		PRINT '>> --------------------
		';

		PRINT '--------------------------';
		PRINT 'Carregando tabelas do ERP'
		PRINT '--------------------------';

		SET @start_time = GETDATE();
		TRUNCATE TABLE bronze.erp_cust_az12;

		BULK INSERT bronze.erp_cust_az12
		FROM 'E:\repo\SQL_Server_Data_Warehouse\datasets\source_erp\CUST_AZ12.csv'
		WITH (
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			TABLOCK
		);

		SET @end_time = GETDATE();
		PRINT '>> Tabela erp_cust_az12 carregada';
		PRINT '>> Duração da carga:' + CAST(DATEDIFF(second, @start_time, @end_time) AS NVARCHAR) + ' seconds';
		PRINT '>> --------------------';


		SET @start_time = GETDATE();
		TRUNCATE TABLE bronze.erp_loc_a101;

		BULK INSERT bronze.erp_loc_a101
		FROM 'E:\repo\SQL_Server_Data_Warehouse\datasets\source_erp\LOC_A101.csv'
		WITH (
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			TABLOCK
		);

		SET @end_time = GETDATE();
		PRINT '>> Tabela erp_loc_a101 carregada';
		PRINT '>> Duração da carga:' + CAST(DATEDIFF(second, @start_time, @end_time) AS NVARCHAR) + ' seconds';
		PRINT '>> --------------------';


		SET @start_time = GETDATE();
		TRUNCATE TABLE bronze.erp_px_cat_g1v2;

		BULK INSERT bronze.erp_px_cat_g1v2
		FROM 'E:\repo\SQL_Server_Data_Warehouse\datasets\source_erp\PX_CAT_G1V2.csv'
		WITH (
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			TABLOCK
		);

		
		SET @end_time = GETDATE();
		PRINT '>> Tabela erp_px_cat_g1v2 carregada';
		PRINT '>> Duração da carga:' + CAST(DATEDIFF(second, @start_time, @end_time) AS NVARCHAR) + ' seconds';
		PRINT '>> --------------------';

		SET @total_end = GETDATE();
		PRINT '==========================';
		PRINT 'Camada Bronze carregada';
		PRINT '==========================';
		PRINT '>> Duração da carga:' + CAST(DATEDIFF(second, @total_start, @total_end) AS NVARCHAR) + ' seconds';
		PRINT '>> --------------------';

	END TRY
	BEGIN CATCH
		PRINT '============================================';
		PRINT 'ERRO DURANTE O CARREGAMENTO DA CAMADA BRONZE';
		PRINT 'Mensagem de erro:' + ERROR_MESSAGE();
		PRINT 'Mensagem de erro:' + CAST(ERROR_NUMBER() AS NVARCHAR);
		PRINT 'Mensagem de erro:' + CAST(ERROR_STATE() AS NVARCHAR);
		PRINT '============================================';
	END CATCH
END