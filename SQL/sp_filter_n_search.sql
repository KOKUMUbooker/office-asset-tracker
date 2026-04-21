/* Get assets by category id */
IF OBJECT_ID('dbo.sp_Asset_GetByCategory', 'P') IS NOT NULL
    DROP PROCEDURE dbo.sp_Asset_GetByCategory;
GO
CREATE PROCEDURE dbo.sp_Asset_GetByCategory
( @CategoryId INT )
AS
BEGIN
	SET NOCOUNT ON;
	SELECT * FROM dbo.Asset
	WHERE CategoryId=@CategoryId
END
GO

/* Get assets by status */
IF OBJECT_ID('dbo.sp_Asset_GetByStatus', 'P') IS NOT NULL
    DROP PROCEDURE dbo.sp_Asset_GetByStatus;
GO
CREATE PROCEDURE dbo.sp_Asset_GetByStatus
( @Status NVARCHAR(50) )
AS
BEGIN
	SET NOCOUNT ON;
	SELECT * FROM dbo.Asset
	WHERE Status=@Status
END
GO

/* Get assets by name */
IF OBJECT_ID('dbo.sp_Asset_SearchByName', 'P') IS NOT NULL
    DROP PROCEDURE dbo.sp_Asset_SearchByName;
GO
CREATE PROCEDURE dbo.sp_Asset_SearchByName
( @Name NVARCHAR(50) )
AS
BEGIN
	SET NOCOUNT ON;
	SELECT * FROM dbo.Asset
	WHERE Name LIKE '%' + @Name + '%'
END
GO

/* Get assets by a combination of CategoryId, AssignedToStaffId and Status */
IF OBJECT_ID('dbo.sp_Asset_Filter', 'P') IS NOT NULL
    DROP PROCEDURE dbo.sp_Asset_Filter;
GO
CREATE PROCEDURE dbo.sp_Asset_Filter
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