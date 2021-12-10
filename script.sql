

\c billy;

-- 2.El cliente usuario01 ha realizado la siguiente compra:
-- producto: producto9
-- ●cantidad: 5
-- ●fecha: fecha del sistema
-- Mediante el uso de transacciones,realiza las consultas correspondientes para este requerimiento y luego 
-- consulta la tabla producto para validar si fue efectivamente descontado en el stock.

BEGIN TRANSACTION;
    SELECT * FROM cliente WHERE nombre = 'usuario01';
    
    SELECT * FROM producto WHERE descripcion = 'producto9';

    INSERT INTO compra (cliente_id,fecha,id) VALUES (1,'2021-07-28',43);

    INSERT INTO detalle_compra (producto_id,compra_id,cantidad) VALUES (9,43,5);

    UPDATE producto SET stock = stock - 5 WHERE id = 9;

    SELECT * FROM producto WHERE descripcion = 'producto9' ;    
COMMIT;


BEGIN TRANSACTION;

    SELECT * FROM producto WHERE descripcion = 'producto1' OR descripcion = 'producto2' OR descripcion = 'producto8';

    INSERT INTO compra(id, cliente_id, fecha) VALUES (43, 2,'2021-07-28');

    INSERT INTO detalle_compra(producto_id, compra_id, cantidad) VALUES (1,43,3);

    INSERT INTO detalle_compra(producto_id, compra_id, cantidad) VALUES(2,43,3);

    INSERT INTO detalle_compra(producto_id, compra_id, cantidad) VALUES(8,43,3);

    UPDATE producto SET stock = stock - 3 WHERE descripcion ='producto1';

    UPDATE producto SET stock = stock - 3 WHERE descripcion ='producto2';

    UPDATE producto SET stock = stock + 4 WHERE descripcion ='producto8';

    UPDATE producto SET stock = stock - 3 WHERE descripcion ='producto8';

COMMIT; 
