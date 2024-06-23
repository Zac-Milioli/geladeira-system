CREATE PROCEDURE AddProductToFreezer
    @name NVARCHAR(255),
    @description NVARCHAR(MAX),
    @validity DATE
AS
BEGIN
    BEGIN TRANSACTION;

    BEGIN TRY
        INSERT INTO products (name, description, validity)
        VALUES (@name, @description, @validity);

        DECLARE @product_id INT;
        SET @product_id = SCOPE_IDENTITY();

        INSERT INTO on_freezer (product_id)
        VALUES (@product_id);

        COMMIT TRANSACTION;
    END TRY
    BEGIN CATCH

        ROLLBACK TRANSACTION;

        THROW;
    END CATCH
END;
GO