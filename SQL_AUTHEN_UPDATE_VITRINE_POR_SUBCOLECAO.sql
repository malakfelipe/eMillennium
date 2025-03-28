UPDATE VITRINE_PRODUTOS_SKU vps1 SET
	vps1.IMPORTADO='F',
	vps1.INCLUIR = 'T',
	vps1.BLOQUEADO = 'F',
	vps1.OBSERVACAO = NULL,
	vps1.INTEGRAR = 1,
	vps1.DATA_ENVIO = NULL,
	vps1.URL_IMAGENS = NULL,
	vps1.IMG_IMPORTADA = NULL,
	vps1.SKU_BASE = NULL,
	vps1.PERCENTUAL_DE_ENVIO = NULL,
	vps1.DATA_ALTERACAO = '2025-02-12 11:00:00.000' -- Atualizar com data do mesmo dia mas com horario inferior ao da publicacao da vitrine
WHERE 
	vps1.VITRINE = 201 -- Atualizar com id vitrine
	AND vps1.BLOQUEADO = 'T'
	AND vps1.ID_EXTERNO IS NULL
	AND vps1.VITRINE_PRODUTO_SKU IN 
		(
			SELECT
				vps2.VITRINE_PRODUTO_SKU
			FROM 
				VITRINE_PRODUTOS_SKU vps2
				LEFT JOIN PRODUTOS p ON vps2.PRODUTO = p.PRODUTO
				LEFT JOIN SUBCOLECOES s ON s.SUBCOLECAO = p.SUBCOLECAO
			WHERE 
				vps2.VITRINE = 201 -- Atualizar com id vitrine
				AND s.COD_SUBCOLECAO IN ('XYZ') -- Atualizar com cod subcolecao
		)
