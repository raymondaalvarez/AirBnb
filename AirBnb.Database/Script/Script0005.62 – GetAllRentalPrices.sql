IF EXISTS(SELECT * FROM INFORMATION_SCHEMA.ROUTINES WHERE SPECIFIC_NAME = 'GetAllRentalPrices')
DROP PROCEDURE [dbo].[GetAllRentalPrices]
GO
CREATE PROCEDURE [dbo].[GetAllRentalPrices]
    @rentalId UNIQUEIDENTIFIER
AS
    SELECT r.id, r.hostId, r.bedrooms, r.bathrooms, r.description, r.rating, rp.rentalFee  FROM Rental r LEFT JOIN RentalPrice rp ON r.id = rp.rentalId;