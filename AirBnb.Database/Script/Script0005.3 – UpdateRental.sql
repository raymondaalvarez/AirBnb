IF EXISTS(SELECT * FROM INFORMATION_SCHEMA.ROUTINES WHERE SPECIFIC_NAME = 'UpdateRental')
DROP PROCEDURE [dbo].[UpdateRental]
GO
CREATE PROCEDURE [dbo].[UpdateRental]
    @rentalId UNIQUEIDENTIFIER,
    @title VARCHAR(128),
    @hostId UNIQUEIDENTIFIER,
    @bedrooms FLOAT,
    @bathrooms FLOAT,
    @description VARCHAR(8000),
    @rating FLOAT,
    @locationId UNIQUEIDENTIFIER
AS
    UPDATE Rental
    SET title = @title, bedrooms = @bedrooms, bathrooms = @bathrooms, description = @description, rating = @rating
    WHERE id = @rentalId;
    SELECT * FROM Rental WHERE id = @rentalId;