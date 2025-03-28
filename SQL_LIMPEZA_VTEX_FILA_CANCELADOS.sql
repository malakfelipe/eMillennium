SET TERM ^ ;

EXECUTE BLOCK
AS
DECLARE pb_vitrine_counter INT;
DECLARE pb_vitrine INT;
DECLARE pb_cod_pedidov VARCHAR(255);
DECLARE pb_pedido_externo VARCHAR(255);
DECLARE counter INT;
BEGIN
  -- Inicializando o contador
  counter = 1;

  -- Obter o maior valor atual de vitrine_pedidos_bloqueado
  SELECT MAX(vitrine_pedidos_bloqueado) FROM vitrine_pedidos_bloqueados INTO :pb_vitrine_counter;

   -- Verificar se vitrine_pedidos_bloqueado IS NULL e inicializa-lo com 0 se for o caso
  IF (pb_vitrine_counter IS NULL) THEN
    pb_vitrine_counter = 0;
 
  FOR SELECT 
        VITRINE, 
        COD_PEDIDOV, 
        PEDIDO_EXTERNO
      FROM VITRINE_PEDIDOS
      WHERE COD_PEDIDOV IN (
            'VT-XYZXYZ' -- lista de pedidos
        )
  INTO 
        :pb_vitrine, 
        :pb_cod_pedidov, 
        :pb_pedido_externo
  DO
  BEGIN

    -- Calculando o novo vitrine_pedidos_bloqueados
    pb_vitrine_counter = :pb_vitrine_counter + :counter;

    -- Inserindo na tabela vitrine_pedidos_bloqueados
    INSERT INTO VITRINE_PEDIDOS_BLOQUEADOS(VITRINE_PEDIDOS_BLOQUEADO,VITRINE,COD_PEDIDOV,PEDIDO_EXTERNO,DATA_INCLUSAO)
    VALUES (
      :pb_vitrine_counter,
      :pb_vitrine,
      :pb_cod_pedidov,
      :pb_pedido_externo,
      CURRENT_TIMESTAMP
    );
  END
END^

SET TERM ; ^
