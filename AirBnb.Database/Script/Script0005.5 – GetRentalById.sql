IF EXISTS(SELECT * FROM INFORMATION_SCHEMA.ROUTINES WHERE SPECIFIC_NAME = 'GetRentalDetailsById')
DROP PROCEDURE [dbo].[GetRentalDetailsById]
GO
CREATE PROCEDURE [dbo].[GetRentalDetailsById]
    @rentalId UNIQUEIDENTIFIER
AS
    SELECT id, hostid, title, bedrooms, bathrooms, description, rating, rentalFee, addressId, isActive FROM Rental r LEFT JOIN RentalPrice rp ON r.id = rp.rentalId WHERE id = @rentalId;