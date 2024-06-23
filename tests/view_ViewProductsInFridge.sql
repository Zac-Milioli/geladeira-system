-- Criando a view para buscar produtos na geladeira
CREATE VIEW ViewProductsInFridge
AS
SELECT 
    p.id,
    p.name,
    p.description,
    p.validity
FROM 
    products p
INNER JOIN 
    on_fridge f ON p.id = f.product_id;
GO