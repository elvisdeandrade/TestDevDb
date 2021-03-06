--LISTAR TODOS OS CLIENTES DO ESTADO DE SP QUE TENHAM MAIS DE 60% DAS PARCELAS PAGAS.
SELECT	C.*, 
		F.TipoFinanciamento 
FROM tblCliente C
	INNER JOIN tblFinanciamento F ON F.IdCliente = C.IdCliente
WHERE C.UF = 'SP' AND
	(CAST((SELECT COUNT(*) FROM tblParcelas WHERE IdFinanciamento = F.IdFinanciamento AND DataPagamento IS NOT NULL) AS FLOAT) / CAST((SELECT COUNT(*) FROM tblParcelas WHERE IdFinanciamento = F.IdFinanciamento) AS FLOAT) * 100) >= 60.0

--- LISTAR OS PRIMEIROS 4 CLIENTES QUE TENHAM ALGUMA PARCELA COM MAIS DE 05 DIAS ATRASADAS (DATA VENCIMENTO MAIOR QUE DATA ATUAL E DATA PAGAMENTO NULA)
SELECT TOP 4 C.*, F.TipoFinanciamento FROM tblCliente C
	INNER JOIN tblFinanciamento F ON F.IdCliente = C.IdCliente
WHERE (SELECT COUNT(*) FROM tblParcelas WHERE IdFinanciamento = F.IdFinanciamento AND DataPagamento IS NULL AND DATEDIFF(DAY, DataVencimento, GETDATE()) > 5) > 0

--LISTAR TODOS OS CLIENTES QUE JÁ ATRASARAM EM ALGUM MOMENTO DUAS OU MAIS PARCELAS EM MAIS DE 10 DIAS
--E QUE O VALOR DO FINANCIAMENTO SEJA MAIOR QUE R$ 10.000,00.
SELECT	C.*, 
		F.TipoFinanciamento, 
		F.ValorTotal AS 'Valor Financiado'
FROM [tblCliente] C
	INNER JOIN [tblFinanciamento] F ON F.IdCliente = C.IdCliente
WHERE F.ValorTotal > 10000 AND
	(SELECT COUNT(*) FROM tblParcelas WHERE IdFinanciamento = F.IdFinanciamento AND DATEDIFF(DAY, DataVencimento, DataPagamento) > 10) > 1