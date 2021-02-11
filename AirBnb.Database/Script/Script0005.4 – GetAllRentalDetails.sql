IF EXISTS(SELECT * FROM INFORMATION_SCHEMA.ROUTINES WHERE SPECIFIC_NAME = 'GetAllRentalDetails')
DROP PROCEDURE [dbo].[GetAllRentalDetails]
GO
CREATE PROCEDURE [dbo].[GetAllRentalDetails]
AS
    SELECT id, hostid, title, bedrooms, bathrooms, description, rating, rentalFee, addressId, isActive FROM Rental r LEFT JOIN RentalPrice rp ON r.id = rp.rentalId;