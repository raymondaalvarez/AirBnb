IF EXISTS(SELECT * FROM INFORMATION_SCHEMA.ROUTINES WHERE SPECIFIC_NAME = 'DeleteRental')
DROP PROCEDURE [dbo].[DeleteRental]
GO
CREATE PROCEDURE [dbo].[DeleteRental]
    @rentalId UNIQUEIDENTIFIER
AS
    UPDATE Rental SET isActive = 0 WHERE id = @rentalId;
    SELECT * FROM Rental WHERE id = @rentalId;