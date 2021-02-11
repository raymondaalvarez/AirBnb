﻿IF EXISTS(SELECT * FROM INFORMATION_SCHEMA.ROUTINES WHERE SPECIFIC_NAME = 'GetAccountDetailsById')
DROP PROCEDURE [dbo].[GetAccountDetailsById]
GO
CREATE PROCEDURE [dbo].[GetAccountDetailsById]
    @personId UNIQUEIDENTIFIER
AS
    SELECT * FROM Account WHERE personId = @personId;