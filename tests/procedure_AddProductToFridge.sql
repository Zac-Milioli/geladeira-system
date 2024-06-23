-- Stored procedure para adicionar um produto ao Fridge
CREATE PROCEDURE AddProductToFridge
    @name NVARCHAR(255),
    @description NVARCHAR(MAX),
    @validity DATE
AS
BEGIN
    -- Iniciando uma transacao
    BEGIN TRANSACTION;

    BEGIN TRY
        -- Inserindo o produto na tabela products
        INSERT INTO products (name, description, validity)
        VALUES (@name, @description, @validity);

        -- Obtendo o id do produto recem-inserido
        DECLARE @product_id INT;
        SET @product_id = SCOPE_IDENTITY();

        -- Inserindo o produto na tabela on_fridge
        INSERT INTO on_fridge (product_id)
        VALUES (@product_id);

        -- Confirmando a transacao
        COMMIT TRANSACTION;
    END TRY
    BEGIN CATCH
        -- Em caso de erro, desfazendo a transacao
        ROLLBACK TRANSACTION;

        -- Lancando o erro
        THROW;
    END CATCH
END;
GO