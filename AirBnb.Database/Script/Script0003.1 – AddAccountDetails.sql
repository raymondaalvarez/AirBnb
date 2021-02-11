IF EXISTS(SELECT * FROM INFORMATION_SCHEMA.ROUTINES WHERE SPECIFIC_NAME = 'AddAccountDetails')
DROP PROCEDURE [dbo].[AddAccountDetails]
GO
CREATE PROCEDURE [dbo].[AddAccountDetails]
    @personId UNIQUEIDENTIFIER,
    @phoneNumber VARCHAR(10),
    @aboutMe VARCHAR(8000),
    @profilePathUrl VARCHAR(64),
    @profilePictureURL VARCHAR(64),
    @userName VARCHAR(64)
AS
    INSERT INTO Account(personId, phoneNumber, aboutMe, profilePathUrl, profilePictureURL, userName)
    VALUES (@personId, @phoneNumber, @aboutMe, CONCAT('/', @userName), @profilePictureURL, @userName);

