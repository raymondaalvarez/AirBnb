IF EXISTS(SELECT * FROM INFORMATION_SCHEMA.ROUTINES WHERE SPECIFIC_NAME = 'DeleteAccountDetailsById')
DROP PROCEDURE [dbo].[DeleteAccountDetailsById]
GO
CREATE PROCEDURE [dbo].[DeleteAccountDetailsById]
    @personId UNIQUEIDENTIFIER
AS
    DELETE FROM Account WHERE personId = @personId;
