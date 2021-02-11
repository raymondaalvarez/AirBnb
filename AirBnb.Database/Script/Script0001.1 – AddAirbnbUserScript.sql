IF EXISTS(SELECT * FROM INFORMATION_SCHEMA.ROUTINES WHERE SPECIFIC_NAME = 'AddUser')
DROP PROCEDURE [dbo].[AddUser]
GO
CREATE PROCEDURE [dbo].[AddUser]
    @id UNIQUEIDENTIFIER,
    @email VARCHAR(50),
    @roleId INT,
    @salt VARCHAR(10),
    @pword VARCHAR(128)
AS
    INSERT INTO AirBnbUser(id, email, roleId, salt, pword)
    VALUES (@id, @email, @roleId, @salt, @pword);