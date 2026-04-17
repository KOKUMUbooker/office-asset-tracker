/* Get assets by category id */
CREATE PROCEDURE sp_Asset_GetByCategory
( @CategoryId INT )
AS
BEGIN
	SET NOCOUNT ON;
	SELECT * FROM dbo.Asset
	WHERE CategoryId=@CategoryId
END
GO

/* Get assets by status */
CREATE PROCEDURE sp_Asset_GetByStatus
( @Status NVARCHAR(50) )
AS
BEGIN
	SET NOCOUNT ON;
	SELECT * FROM dbo.Asset
	WHERE Status=@Status
END
GO

/* Get assets by name */
CREATE PROCEDURE sp_Asset_SearchByName
( @Name NVARCHAR(50) )
AS
BEGIN
	SET NOCOUNT ON;
	SELECT * FROM dbo.Asset
	WHERE Name LIKE '%' + @Name + '%'
END
GO

/* Get assets by a combination of CategoryId, AssignedToStaffId and Status */
CREATE PROCEDURE sp_Asset_Filter
(
 @CategoryId INT = NULL,
 @AssignedToStaffId INT = NULL,
 @Status NVARCHAR(50) = NULL
)
AS
BEGIN
	SET NOCOUNT ON;
	SELECT * FROM dbo.Asset
	WHERE
		(CategoryId = @CategoryId OR @CategoryId IS NULL) AND
		(AssignedToStaffId = @AssignedToStaffId OR @AssignedToStaffId IS NULL) AND
		(Status = @Status OR @Status IS NULL)
END
GO