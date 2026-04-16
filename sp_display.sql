/* Get all assets including their Category name */
CREATE PROCEDURE sp_Asset_GetAllWithCategoryAndStaff
AS
BEGIN
	SET NOCOUNT ON;
	SELECT 
		a.Id,
		a.Name,
		a.CategoryId,
		a.Status,
		a.AssignedToStaffId,
		c.Name AS CategoryName
	FROM dbo.Asset a
	LEFT JOIN Category c 
		ON a.CategoryId = c.Id;
END
GO;

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
		a.Status,
		a.AssignedToStaffId,
		c.Name AS CategoryName
    FROM dbo.Asset a
    LEFT JOIN dbo.Category c 
        ON a.CategoryId = c.Id
    WHERE a.Id = @Id;
END
GO