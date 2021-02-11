IF EXISTS(SELECT * FROM INFORMATION_SCHEMA.ROUTINES WHERE SPECIFIC_NAME = 'GetRentalPrice')
DROP PROCEDURE [dbo].[GetRentalPrice]
GO
CREATE PROCEDURE [dbo].[GetRentalPrice]
    @rentalId UNIQUEIDENTIFIER
AS
    SELECT r.id, r.hostId, r.bedrooms, r.bathrooms, r.description, r.rating, rp.rentalFee  FROM Rental r LEFT JOIN RentalPrice rp ON r.id = rp.rentalId WHERE id = @rentalId;