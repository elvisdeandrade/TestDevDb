USE [TestDevDB]
GO

Declare @ID int;
Declare @ID_FINANCIAMENTO int;
DECLARE @DT_FINANCIAMENTO DATETIME; 
DECLARE @DT_VENCTO DATETIME; 
DECLARE @DT_PAGTO DATETIME; 
Declare @NUM_PARCELA INT;

/********************************************************************* CLIENTE 1 *******************************************************************************/

INSERT INTO [dbo].[tblCliente]
           ([Nome]
           ,[UF]
           ,[Celular])
     VALUES
           ('Elvis de Andrade Santos','SP','11953795227')

SELECT @ID = SCOPE_IDENTITY ();
SET @DT_FINANCIAMENTO = '2020-01-01T12:00:00'; 

INSERT INTO [dbo].[tblFinanciamento]
           ([TipoFinanciamento]
           ,[ValorTotal]
           ,[DataVencimento]
           ,[IdCliente])
     VALUES
           ('Financiamento automotivo'
           ,10000.00
           ,@DT_FINANCIAMENTO
           ,@ID)

SELECT @ID_FINANCIAMENTO = SCOPE_IDENTITY ();
SET @DT_VENCTO =  DATEADD(MONTH, 1, @DT_FINANCIAMENTO);
SET @NUM_PARCELA = 0;

WHILE(@NUM_PARCELA < 6)
	BEGIN
		SET @DT_VENCTO =  DATEADD(month, 1, @DT_VENCTO);
		SET @NUM_PARCELA = @NUM_PARCELA + 1;

		INSERT INTO [dbo].[tblParcelas]
			   ([NumeroParcela]
			   ,[ValorParcela]
			   ,[DataVencimento]
			   ,[DataPagamento]
			   ,[IdFinanciamento])
		 VALUES
			   (@NUM_PARCELA, 678.20, @DT_VENCTO,null,@ID_FINANCIAMENTO)
	END

--PAGA ALGUMAS PARCELAS
UPDATE [tblParcelas] SET [DataPagamento] = [DataVencimento] WHERE [IdFinanciamento] = @ID_FINANCIAMENTO AND [NumeroParcela] < 4

/********************************************************************* CLIENTE 2 *******************************************************************************/

INSERT INTO [dbo].[tblCliente]
           ([Nome]
           ,[UF]
           ,[Celular])
     VALUES
           ('Carolina Silva de Andrade','SP','11923456789')

SELECT @ID = SCOPE_IDENTITY ();
SET @DT_FINANCIAMENTO = '2020-01-01T12:00:00'; 

INSERT INTO [dbo].[tblFinanciamento]
           ([TipoFinanciamento]
           ,[ValorTotal]
           ,[DataVencimento]
           ,[IdCliente])
     VALUES
           ('Financiamento imobiliario'
           ,10000.00
           ,@DT_FINANCIAMENTO
           ,@ID)

SELECT @ID_FINANCIAMENTO = SCOPE_IDENTITY ();
SET @DT_VENCTO =  DATEADD(MONTH, 1, @DT_FINANCIAMENTO);
SET @NUM_PARCELA = 0;

WHILE(@NUM_PARCELA < 6)
	BEGIN
		SET @DT_VENCTO =  DATEADD(month, 1, @DT_VENCTO);
		SET @NUM_PARCELA = @NUM_PARCELA + 1;

		INSERT INTO [dbo].[tblParcelas]
			   ([NumeroParcela]
			   ,[ValorParcela]
			   ,[DataVencimento]
			   ,[DataPagamento]
			   ,[IdFinanciamento])
		 VALUES
			   (@NUM_PARCELA, 678.20, @DT_VENCTO,null,@ID_FINANCIAMENTO)
	END

--PAGA ALGUMAS PARCELAS
UPDATE [tblParcelas] SET [DataPagamento] = [DataVencimento] WHERE [IdFinanciamento] = @ID_FINANCIAMENTO AND [NumeroParcela] < 5

/********************************************************************* CLIENTE 3 *******************************************************************************/

INSERT INTO [dbo].[tblCliente]
           ([Nome]
           ,[UF]
           ,[Celular])
     VALUES
           ('Maria Clara Soares','RJ','24990567123')

SELECT @ID = SCOPE_IDENTITY ();
SET @DT_FINANCIAMENTO = '2020-01-01T12:00:00'; 

INSERT INTO [dbo].[tblFinanciamento]
           ([TipoFinanciamento]
           ,[ValorTotal]
           ,[DataVencimento]
           ,[IdCliente])
     VALUES
           ('Financiamento automotivo'
           ,10000.00
           ,@DT_FINANCIAMENTO
           ,@ID)

SELECT @ID_FINANCIAMENTO = SCOPE_IDENTITY ();
SET @DT_VENCTO =  DATEADD(MONTH, 1, @DT_FINANCIAMENTO);
SET @NUM_PARCELA = 0;

WHILE(@NUM_PARCELA < 6)
	BEGIN
		SET @DT_VENCTO =  DATEADD(month, 1, @DT_VENCTO);
		SET @NUM_PARCELA = @NUM_PARCELA + 1;

		INSERT INTO [dbo].[tblParcelas]
			   ([NumeroParcela]
			   ,[ValorParcela]
			   ,[DataVencimento]
			   ,[DataPagamento]
			   ,[IdFinanciamento])
		 VALUES
			   (@NUM_PARCELA, 678.20, @DT_VENCTO,null,@ID_FINANCIAMENTO)
	END

--PAGA ALGUMAS PARCELAS
UPDATE [tblParcelas] SET [DataPagamento] = [DataVencimento] WHERE [IdFinanciamento] = @ID_FINANCIAMENTO AND [NumeroParcela] < 5

/********************************************************************* CLIENTE 4 *******************************************************************************/

INSERT INTO [dbo].[tblCliente]
           ([Nome]
           ,[UF]
           ,[Celular])
     VALUES
           ('José Antônio Valadares','SP','11912348765')

SELECT @ID = SCOPE_IDENTITY ();
SET @DT_FINANCIAMENTO = '2020-01-01T12:00:00'; 

INSERT INTO [dbo].[tblFinanciamento]
           ([TipoFinanciamento]
           ,[ValorTotal]
           ,[DataVencimento]
           ,[IdCliente])
     VALUES
           ('Financiamento imobiliario'
           ,23000.00
           ,@DT_FINANCIAMENTO
           ,@ID)

SELECT @ID_FINANCIAMENTO = SCOPE_IDENTITY ();
SET @DT_VENCTO =  DATEADD(MONTH, 1, @DT_FINANCIAMENTO);
SET @NUM_PARCELA = 0;

WHILE(@NUM_PARCELA < 6)
	BEGIN
		SET @DT_VENCTO =  DATEADD(month, 1, @DT_VENCTO);
		SET @NUM_PARCELA = @NUM_PARCELA + 1;

		INSERT INTO [dbo].[tblParcelas]
			   ([NumeroParcela]
			   ,[ValorParcela]
			   ,[DataVencimento]
			   ,[DataPagamento]
			   ,[IdFinanciamento])
		 VALUES
			   (@NUM_PARCELA, 678.20, @DT_VENCTO,null,@ID_FINANCIAMENTO)
	END

--PAGA ALGUMAS PARCELAS
UPDATE [tblParcelas] SET [DataPagamento] = [DataVencimento] WHERE [IdFinanciamento] = @ID_FINANCIAMENTO AND [NumeroParcela] < 5

/********************************************************************* CLIENTE 5 *******************************************************************************/

INSERT INTO [dbo].[tblCliente]
           ([Nome]
           ,[UF]
           ,[Celular])
     VALUES
           ('José Coelho Nunes','SP','11912348765')

SELECT @ID = SCOPE_IDENTITY ();
SET @DT_FINANCIAMENTO = '2020-01-01T12:00:00'; 

INSERT INTO [dbo].[tblFinanciamento]
           ([TipoFinanciamento]
           ,[ValorTotal]
           ,[DataVencimento]
           ,[IdCliente])
     VALUES
           ('Financiamento automotivo'
           ,15000.00
           ,@DT_FINANCIAMENTO
           ,@ID)

SELECT @ID_FINANCIAMENTO = SCOPE_IDENTITY ();
SET @DT_VENCTO =  DATEADD(MONTH, 1, @DT_FINANCIAMENTO);
SET @NUM_PARCELA = 0;

WHILE(@NUM_PARCELA < 6)
	BEGIN
		SET @DT_VENCTO =  DATEADD(month, 1, @DT_VENCTO);
		SET @NUM_PARCELA = @NUM_PARCELA + 1;

		INSERT INTO [dbo].[tblParcelas]
			   ([NumeroParcela]
			   ,[ValorParcela]
			   ,[DataVencimento]
			   ,[DataPagamento]
			   ,[IdFinanciamento])
		 VALUES
			   (@NUM_PARCELA, 678.20, @DT_VENCTO,null,@ID_FINANCIAMENTO)
	END

--PAGA ALGUMAS PARCELAS
UPDATE [tblParcelas] SET [DataPagamento] = DATEADD(DAY, 12, [DataVencimento]) WHERE [IdFinanciamento] = @ID_FINANCIAMENTO AND [NumeroParcela] < 4

/********************************************************************* CLIENTE 6 *******************************************************************************/

INSERT INTO [dbo].[tblCliente]
           ([Nome]
           ,[UF]
           ,[Celular])
     VALUES
           ('Sandra Rosa Madalena','SP','11912348765')

SELECT @ID = SCOPE_IDENTITY ();
SET @DT_FINANCIAMENTO = '2020-01-01T12:00:00'; 

INSERT INTO [dbo].[tblFinanciamento]
           ([TipoFinanciamento]
           ,[ValorTotal]
           ,[DataVencimento]
           ,[IdCliente])
     VALUES
           ('Financiamento Pessoal'
           ,11000.00
           ,@DT_FINANCIAMENTO
           ,@ID)

SELECT @ID_FINANCIAMENTO = SCOPE_IDENTITY ();
SET @DT_VENCTO =  DATEADD(MONTH, 1, @DT_FINANCIAMENTO);
SET @NUM_PARCELA = 0;

WHILE(@NUM_PARCELA < 6)
	BEGIN
		SET @DT_VENCTO =  DATEADD(month, 1, @DT_VENCTO);
		SET @NUM_PARCELA = @NUM_PARCELA + 1;

		INSERT INTO [dbo].[tblParcelas]
			   ([NumeroParcela]
			   ,[ValorParcela]
			   ,[DataVencimento]
			   ,[DataPagamento]
			   ,[IdFinanciamento])
		 VALUES
			   (@NUM_PARCELA, 678.20, @DT_VENCTO,null,@ID_FINANCIAMENTO)
	END

--PAGA ALGUMAS PARCELAS
UPDATE [tblParcelas] SET [DataPagamento] = DATEADD(DAY, 12, [DataVencimento]) WHERE [IdFinanciamento] = @ID_FINANCIAMENTO AND [NumeroParcela] < 4

