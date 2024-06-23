CREATE PROCEDURE UpdateProductById
    @id INT,
    @name NVARCHAR(255),
    @description NVARCHAR(MAX),
    @validity DATE
AS
BEGIN
    BEGIN TRANSACTION;

    BEGIN TRY
        UPDATE products
        SET name = @name,
            description = @description,
            validity = @validity
        WHERE id = @id;

        COMMIT TRANSACTION;
    END TRY
    BEGIN CATCH
        ROLLBACK TRANSACTION;

        THROW;
    END CATCH
END;
GO