IF EXISTS(SELECT * FROM INFORMATION_SCHEMA.ROUTINES WHERE SPECIFIC_NAME = 'DeleteLocation')
DROP PROCEDURE [dbo].[DeleteLocation]
GO
CREATE PROCEDURE [dbo].[DeleteLocation]
    @locationId UNIQUEIDENTIFIER
AS
    UPDATE Location set isActive = 0 WHERE id = @locationId;
    SELECT * FROM Location WHERE id = @locationId;