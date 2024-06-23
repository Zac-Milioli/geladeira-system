-- Stored procedure para adicionar um produto ao Freezer
CREATE PROCEDURE AddProductToFreezer
    @name NVARCHAR(255),
    @description NVARCHAR(MAX),
    @validity DATE
AS
BEGIN
    -- Iniciando uma transa��o
    BEGIN TRANSACTION;

    BEGIN TRY
        -- Inserindo o produto na tabela products
        INSERT INTO products (name, description, validity)
        VALUES (@name, @description, @validity);

        -- Obtendo o id do produto rec�m-inserido
        DECLARE @product_id INT;
        SET @product_id = SCOPE_IDENTITY();

        -- Inserindo o produto na tabela on_freezer
        INSERT INTO on_freezer (product_id)
        VALUES (@product_id);

        -- Confirmando a transa��o
        COMMIT TRANSACTION;
    END TRY
    BEGIN CATCH
        -- Em caso de erro, desfazendo a transa��o
        ROLLBACK TRANSACTION;

        -- Lan�ando o erro
        THROW;
    END CATCH
END;
GO