CREATE PROCEDURE DeleteProductById
    @id INT
AS
BEGIN
    BEGIN TRANSACTION;

    BEGIN TRY
        DELETE FROM on_fridge
        WHERE product_id = @id;

        DELETE FROM on_freezer
        WHERE product_id = @id;

        DELETE FROM products
        WHERE id = @id;

        COMMIT TRANSACTION;
    END TRY
    BEGIN CATCH
        ROLLBACK TRANSACTION;

        THROW;
    END CATCH
END;
GO