-- Stored procedure para excluir um produto pelo ID
CREATE PROCEDURE DeleteProductById
    @id INT
AS
BEGIN
    -- Iniciando uma transação
    BEGIN TRANSACTION;

    BEGIN TRY
        -- Excluindo as entradas associadas na tabela on_fridge
        DELETE FROM on_fridge
        WHERE product_id = @id;

        -- Excluindo as entradas associadas na tabela on_freezer
        DELETE FROM on_freezer
        WHERE product_id = @id;

        -- Excluindo o produto na tabela products
        DELETE FROM products
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