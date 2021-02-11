IF EXISTS(SELECT * FROM INFORMATION_SCHEMA.ROUTINES WHERE SPECIFIC_NAME = 'GetAllRateSchedulesByRental')
DROP PROCEDURE [dbo].[GetAllRateSchedulesByRental]
GO
CREATE PROCEDURE [dbo].[GetAllRateSchedulesByRental]
    @rentalId UNIQUEIDENTIFIER
AS
    SELECT r.id as rentalId, nrp.rateScheduleId, r.hostId, nrp.rentalFee, nrp.additionalFee, nrp.startDate, nrp.endDate, r.addressId, r.isActive FROM Rental r LEFT OUTER JOIN (SELECT rp.rentalId, rp.rentalFee, rs.rateScheduleId, rs.startDate, rs.endDate, rs.additionalFee FROM  RentalPrice rp LEFT OUTER JOIN RateSchedule rs ON rs.rentalId = rp.rentalId WHERE rs.rentalId = @rentalId) as nrp ON r.id = nrp.rentalId WHERE id = @rentalId;