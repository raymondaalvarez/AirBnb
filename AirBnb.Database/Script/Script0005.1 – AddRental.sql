IF EXISTS(SELECT * FROM INFORMATION_SCHEMA.ROUTINES WHERE SPECIFIC_NAME = 'AddRental')
DROP PROCEDURE [dbo].[AddRental]
GO
CREATE PROCEDURE [dbo].[AddRental]
    @id UNIQUEIDENTIFIER,
    @title VARCHAR(128),
    @hostId UNIQUEIDENTIFIER,
    @bedrooms FLOAT,
    @bathrooms FLOAT,
    @description VARCHAR(8000),
    @rating FLOAT,
    @addressId UNIQUEIDENTIFIER
AS
    INSERT INTO Rental(id, hostId, bedrooms, bathrooms, description, rating, addressId, title)
    VALUES (@id, @hostId, @bedrooms, @bathrooms, @description, @rating, @addressId, @title);
    SELECT * FROM Rental r WHERE r.id = @id;