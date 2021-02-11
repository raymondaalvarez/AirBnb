IF EXISTS(SELECT * FROM INFORMATION_SCHEMA.ROUTINES WHERE SPECIFIC_NAME = 'UpdateRentalPrice')
DROP PROCEDURE [dbo].[UpdateRentalPrice]
GO
CREATE PROCEDURE [dbo].[UpdateRentalPrice]
    @id UNIQUEIDENTIFIER,
    @hostId UNIQUEIDENTIFIER,
    @bedrooms FLOAT,
    @bathrooms FLOAT,
    @description VARCHAR(8000),
    @rating FLOAT,
    @addressId UNIQUEIDENTIFIER,
    @isActive INT,
    @rentalFee FLOAT
AS
    UPDATE RentalPrice
    SET rentalFee = @rentalFee
    WHERE rentalId = @id;
    SELECT * FROM Rental r LEFT JOIN RentalPrice rp ON r.id = rp.rentalId WHERE r.id = @id and rp.rentalId = @id;