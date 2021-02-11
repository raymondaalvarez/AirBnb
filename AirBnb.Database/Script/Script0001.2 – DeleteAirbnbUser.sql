﻿IF EXISTS(SELECT * FROM INFORMATION_SCHEMA.ROUTINES WHERE SPECIFIC_NAME = 'DeleteUser')
DROP PROCEDURE [dbo].[DeleteUser]
GO
CREATE PROCEDURE [dbo].[DeleteUser]
    @id UNIQUEIDENTIFIER
AS
    UPDATE AirBnbUser SET isActive = 0 WHERE id = @id;