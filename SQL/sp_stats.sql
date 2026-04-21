/* Get asset counts based on status */
IF OBJECT_ID('dbo.sp_Asset_CountByStatus', 'P') IS NOT NULL
    DROP PROCEDURE dbo.sp_Asset_CountByStatus;
GO
CREATE PROCEDURE dbo.sp_Asset_CountByStatus
AS
BEGIN
	SELECT Status, COUNT(Id) AS Count
	FROM dbo.Asset
	GROUP BY Status
END
GO

/* Get asset counts based on category */
IF OBJECT_ID('dbo.sp_Asset_CountByCategory', 'P') IS NOT NULL
    DROP PROCEDURE dbo.sp_Asset_CountByCategory;
GO
CREATE PROCEDURE dbo.sp_Asset_CountByCategory
AS
BEGIN
	SELECT c.Name as Category, COUNT(a.Id) AS Count
	FROM dbo.Asset a
	LEFT JOIN dbo.Category c
		ON a.CategoryId = c.Id
	GROUP BY c.Name
END
GO

/* Get assets stats totalCount,AvailableCount,AssignedCount and DamagedCount */
IF OBJECT_ID('dbo.sp_Asset_ReportOverview', 'P') IS NOT NULL
    DROP PROCEDURE dbo.sp_Asset_ReportOverview;
GO
CREATE PROCEDURE dbo.sp_Asset_ReportOverview
AS
BEGIN
	SELECT 
    COUNT(*) AS TotalAssets,
    SUM(CASE WHEN Status = 'Available' THEN 1 ELSE 0 END) AS AvailableCount,
    SUM(CASE WHEN Status = 'Assigned' THEN 1 ELSE 0 END) AS AssignedCount,
    SUM(CASE WHEN Status = 'Damaged' THEN 1 ELSE 0 END) AS DamagedCount
	FROM dbo.Asset;
END
GO