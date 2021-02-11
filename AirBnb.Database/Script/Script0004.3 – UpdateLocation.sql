IF EXISTS(SELECT * FROM INFORMATION_SCHEMA.ROUTINES WHERE SPECIFIC_NAME = 'UpdateLocation')
DROP PROCEDURE [dbo].[UpdateLocation]
GO
CREATE PROCEDURE [dbo].[UpdateLocation]
    @locationId UNIQUEIDENTIFIER,
    @street VARCHAR(128),
    @city VARCHAR(32),
    @state VARCHAR(32),
    @zip VARCHAR(10),
    @isActive INT
AS
    UPDATE Location
    SET street = @street, city = @city, state = @state, zip = @zip
    WHERE id = @locationId;