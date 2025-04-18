--Estoque Vitrine
SELECT
	vpe.FILIAL,
	vpe.VITRINE_PRODUTO_ESTOQUE,
	vpe.TRANS_ID,
	vpe.PRODUTO AS PRODUTO_ID,
	p.COD_PRODUTO,
	p.DESCRICAO1,
	vpe.COR AS COR_ID,
	c.COD_COR,
	c.DESCRICAO AS COR_DESCRICAO,
	vpe.TAMANHO,
	p.COD_PRODUTO||'-'||c.COD_COR||'-' AS PRODUTO_SKU2,
	p.COD_PRODUTO||'-'||c.COD_COR||'-'||vpe.TAMANHO AS PRODUTO_SKU3,
	p.PRODUTO||'_'||c.COR||'_'||'0'||'_'||vpe.TAMANHO AS PRODUTO_ID_INTERNO
FROM VITRINE_PRODUTOS_ESTOQUE vpe 
JOIN PRODUTOS p ON p.PRODUTO = vpe.PRODUTO
JOIN COR_PROD cp ON cp.PRODUTO = vpe.PRODUTO AND cp.COR = vpe.COR
JOIN CORES c ON c.COR = cp.COR
