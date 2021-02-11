IF EXISTS(SELECT * FROM INFORMATION_SCHEMA.ROUTINES WHERE SPECIFIC_NAME = 'UpdateRateSchedule')
DROP PROCEDURE [dbo].[UpdateRateSchedule]
GO
CREATE PROCEDURE [dbo].[UpdateRateSchedule]
    @id UNIQUEIDENTIFIER,
    @hostId UNIQUEIDENTIFIER,
    @bedrooms FLOAT,
    @bathrooms FLOAT,
    @description VARCHAR(8000),
    @rating FLOAT,
    @addressId UNIQUEIDENTIFIER,
    @isActive INT,
    @rentalFee FLOAT,
    @rateScheduleId UNIQUEIDENTIFIER,
    @startDate DATETIME,
    @endDate DATETIME,
    @additionalFee FLOAT
AS
    UPDATE RateSchedule
    SET startDate = @startDate, endDate = @endDate, additionalFee = @additionalFee
    WHERE rateScheduleId = @rateScheduleId;
    SELECT nrp.rateScheduleId, r.id, r.hostId, r.bedrooms, r.bathrooms, r.description, r.rating, nrp.rentalFee, nrp.additionalFee, nrp.startDate, nrp.endDate, r.addressId, r.isActive FROM Rental r LEFT JOIN (SELECT rp.rentalId, rp.rentalFee, rs.rateScheduleId, rs.startDate, rs.endDate, rs.additionalFee FROM  RentalPrice rp LEFT OUTER JOIN RateSchedule rs ON rs.rentalId = rp.rentalId WHERE rs.rateScheduleId = @rateScheduleId) as nrp ON r.id = nrp.rentalId WHERE id = @id;