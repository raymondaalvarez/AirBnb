IF EXISTS(SELECT * FROM INFORMATION_SCHEMA.ROUTINES WHERE SPECIFIC_NAME = 'UpdatePerson')
DROP PROCEDURE [dbo].[UpdatePerson]
GO
CREATE PROCEDURE [dbo].[UpdatePerson]
    @userId UNIQUEIDENTIFIER,
    @genderId INT,
    @firstName VARCHAR(32),
    @lastName VARCHAR(32),
    @rating FLOAT
AS
    UPDATE Person
    SET genderId = @genderId, firstName = @firstName, lastName = @lastName
    WHERE userId = @userId;