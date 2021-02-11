IF EXISTS(SELECT * FROM INFORMATION_SCHEMA.ROUTINES WHERE SPECIFIC_NAME = 'AddPerson')
DROP PROCEDURE [dbo].[AddPerson]
GO
CREATE PROCEDURE [dbo].[AddPerson]
    @userId UNIQUEIDENTIFIER,
    @genderId INT,
    @firstName VARCHAR(32),
    @lastName VARCHAR(32),
    @rating FLOAT
AS
    INSERT INTO Person(userId, genderId, firstName, lastName)
    VALUES (@userId, @genderId, @firstName, @lastName);