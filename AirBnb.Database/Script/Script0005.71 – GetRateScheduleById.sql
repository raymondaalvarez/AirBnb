IF EXISTS(SELECT * FROM INFORMATION_SCHEMA.ROUTINES WHERE SPECIFIC_NAME = 'GetRateSchedule')
DROP PROCEDURE [dbo].[GetRateSchedule]
GO
CREATE PROCEDURE [dbo].[GetRateSchedule]
    @rentalId UNIQUEIDENTIFIER,
    @rateScheduleId UNIQUEIDENTIFIER
AS
    SELECT nrp.rateScheduleId, r.id, r.hostId, r.bedrooms, r.bathrooms, r.description, r.rating, nrp.rentalFee, nrp.additionalFee, nrp.startDate, nrp.endDate, r.addressId, r.isActive FROM Rental r LEFT JOIN (SELECT rp.rentalId, rp.rentalFee, rs.rateScheduleId, rs.startDate, rs.endDate, rs.additionalFee FROM  RentalPrice rp LEFT OUTER JOIN RateSchedule rs ON rs.rentalId = rp.rentalId WHERE rs.rateScheduleId = @rateScheduleId) as nrp ON r.id = nrp.rentalId WHERE id = @rentalId;