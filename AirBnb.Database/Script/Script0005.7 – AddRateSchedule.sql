IF EXISTS(SELECT * FROM INFORMATION_SCHEMA.ROUTINES WHERE SPECIFIC_NAME = 'AddRateSchedule')
DROP PROCEDURE [dbo].[AddRateSchedule]
GO
CREATE PROCEDURE [dbo].[AddRateSchedule]
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
    INSERT INTO RateSchedule(rateScheduleId, rentalId, startDate, endDate, additionalFee)
    VALUES (@rateScheduleId, @id, @startDate, @endDate, @additionalFee);
    SELECT nrp.rateScheduleId, r.id, r.hostId, r.bedrooms, r.bathrooms, r.description, r.rating, nrp.rentalFee, nrp.additionalFee, nrp.startDate, nrp.endDate, r.addressId, r.isActive FROM Rental r LEFT JOIN (SELECT rp.rentalId, rp.rentalFee, rs.rateScheduleId, rs.startDate, rs.endDate, rs.additionalFee FROM  RentalPrice rp LEFT OUTER JOIN RateSchedule rs ON rs.rentalId = rp.rentalId WHERE rs.rateScheduleId = @rateScheduleId) as nrp ON r.id = nrp.rentalId WHERE id = @id;