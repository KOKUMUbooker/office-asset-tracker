/* Get all assets including their Category name */
IF OBJECT_ID('dbo.sp_Asset_GetAllWithCategoryAndStaff', 'P') IS NOT NULL
    DROP PROCEDURE dbo.sp_Asset_GetAllWithCategoryAndStaff;
GO
CREATE PROCEDURE dbo.sp_Asset_GetAllWithCategoryAndStaff
AS
BEGIN
	SET NOCOUNT ON;
	SELECT 
		a.Id,
		a.Name,
		a.CategoryId,
		c.Name AS CategoryName,
		a.Status,
		a.AssignedToStaffId,
		s.Name AS AssignedToStaffName 
	FROM dbo.Asset a
	LEFT JOIN dbo.Category c 
		ON a.dbo.CategoryId = c.Id
	LEFT JOIN Staff s
		ON a.AssignedToStaffId = s.Id
END
GO

/* Get asset details including Category name by their Id */
IF OBJECT_ID('dbo.sp_Asset_GetDetailsById', 'P') IS NOT NULL
    DROP PROCEDURE dbo.sp_Asset_GetDetailsById;
GO
CREATE PROCEDURE dbo.sp_Asset_GetDetailsById
( @Id INT )
AS
BEGIN
    SET NOCOUNT ON;
    SELECT 
        a.Id,
		a.Name,
		a.CategoryId,
		c.Name AS CategoryName,
		a.Status,
		a.AssignedToStaffId,
		s.Name AS AssignedToStaff 
    FROM dbo.Asset a
    LEFT JOIN dbo.Category c 
        ON a.CategoryId = c.Id
	LEFT JOIN dbo.Staff s
		ON a.AssignedToStaffId = s.Id
    WHERE a.Id = @Id;
END
GO