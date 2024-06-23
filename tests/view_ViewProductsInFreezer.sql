CREATE VIEW ViewProductsInFreezer
AS
SELECT 
    p.id,
    p.name,
    p.description,
    p.validity
FROM 
    products p
INNER JOIN 
    on_freezer f ON p.id = f.product_id;
GO