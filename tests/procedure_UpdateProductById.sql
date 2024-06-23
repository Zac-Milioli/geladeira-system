-- Stored procedure para alterar um produto pelo ID
CREATE PROCEDURE UpdateProductById
    @id INT,
    @name NVARCHAR(255),
    @description NVARCHAR(MAX),
    @validity DATE
AS
BEGIN
    -- Iniciando uma transação
    BEGIN TRANSACTION;

    BEGIN TRY
        -- Atualizando o produto na tabela products
        UPDATE products
        SET name = @name,
            description = @description,
            validity = @validity
        WHERE id = @id;

        -- Confirmando a transação
        COMMIT TRANSACTION;
    END TRY
    BEGIN CATCH
        -- Em caso de erro, desfazendo a transação
        ROLLBACK TRANSACTION;

        -- Lançando o erro
        THROW;
    END CATCH
END;
GO