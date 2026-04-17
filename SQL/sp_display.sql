/* Get all assets including their Category name */
CREATE PROCEDURE sp_Asset_GetAllWithCategoryAndStaff
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
CREATE PROCEDURE sp_Asset_GetDetailsById
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