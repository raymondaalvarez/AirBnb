IF EXISTS(SELECT * FROM INFORMATION_SCHEMA.ROUTINES WHERE SPECIFIC_NAME = 'UpdateAccountDetails')
DROP PROCEDURE [dbo].[UpdateAccountDetails]
GO
CREATE PROCEDURE [dbo].[UpdateAccountDetails]
    @personId UNIQUEIDENTIFIER,
    @phoneNumber VARCHAR(10),
    @aboutMe VARCHAR(8000),
    @profilePathUrl VARCHAR(64),
    @profilePictureURL VARCHAR(64),
    @userName VARCHAR(64)
AS
    UPDATE Account
    SET phoneNumber = @phoneNumber, aboutMe = @aboutMe, profilePathUrl = CONCAT('/', @userName), profilePictureUrl = @profilePictureURL, userName = @userName
    WHERE personId = @personId;