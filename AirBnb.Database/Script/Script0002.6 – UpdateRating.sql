IF EXISTS(SELECT * FROM INFORMATION_SCHEMA.ROUTINES WHERE SPECIFIC_NAME = 'UpdateRating')
DROP PROCEDURE [dbo].[UpdateRating]
GO
CREATE PROCEDURE [dbo].[UpdateRating]
    @id UNIQUEIDENTIFIER
AS
    UPDATE Person SET rating = (SELECT AVG(score) FROM Rating WHERE ratedId = @id) WHERE userId = @id;
    SELECT * FROM Person WHERE userId = @id;