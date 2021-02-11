IF EXISTS(SELECT * FROM INFORMATION_SCHEMA.ROUTINES WHERE SPECIFIC_NAME = 'AddRentalPrice')
DROP PROCEDURE [dbo].[AddRentalPrice]
GO
CREATE PROCEDURE [dbo].[AddRentalPrice]
    @id UNIQUEIDENTIFIER,
    @rentalFee FLOAT
AS
    INSERT INTO RentalPrice(rentalId, rentalFee)
    VALUES (@id, @rentalFee);
    SELECT * FROM Rental r LEFT JOIN RentalPrice rp ON r.id = rp.rentalId WHERE r.id = @id and rp.rentalId = @id;