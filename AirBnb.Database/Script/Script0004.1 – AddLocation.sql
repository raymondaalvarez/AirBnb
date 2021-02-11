IF EXISTS(SELECT * FROM INFORMATION_SCHEMA.ROUTINES WHERE SPECIFIC_NAME = 'AddLocation')
DROP PROCEDURE [dbo].[AddLocation]
GO
CREATE PROCEDURE [dbo].[AddLocation]
    @id UNIQUEIDENTIFIER,
    @street VARCHAR(128),
    @city VARCHAR(32),
    @state VARCHAR(32),
    @zip VARCHAR(10),
    @isActive INT
AS
    INSERT INTO Location (id, street, city, state, zip)
    values (@id, @street, @city, @state, @zip);