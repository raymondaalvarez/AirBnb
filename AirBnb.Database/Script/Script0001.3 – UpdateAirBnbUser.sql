IF EXISTS(SELECT * FROM INFORMATION_SCHEMA.ROUTINES WHERE SPECIFIC_NAME = 'UpdateUser')
DROP PROCEDURE [dbo].[UpdateUser]
GO
CREATE PROCEDURE [dbo].[UpdateUser]
    @id UNIQUEIDENTIFIER,
    @email VARCHAR(50),
    @roleId INT,
    @salt VARCHAR(10),
    @pword VARCHAR(128)
AS
    UPDATE AirBnbuser
    SET email = @email, roleId = @roleId, salt = @salt, pword = @pword
    WHERE id = @id;