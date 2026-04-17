/* Assign asset to staff */
CREATE PROCEDURE sp_Asset_AssignToStaff
(
 @AssetId INT,
 @StaffId INT
)
AS
BEGIN
	SET NOCOUNT ON;
	DECLARE @ExistingStaffId INT = (SELECT Id FROM dbo.Staff WHERE Id=@StaffId) 

	UPDATE dbo.Asset
	SET AssignedToStaffId = @ExistingStaffId
	WHERE Id=@AssetId
END
GO;

/* Unassign asset from staff */
CREATE PROCEDURE sp_Asset_UnassignFromStaff
(
 @AssetId INT,
 @StaffId INT
)
AS
BEGIN
	SET NOCOUNT ON;
	UPDATE dbo.Asset
	SET AssignedToStaffId = NULL
	WHERE Id=@AssetId
END
GO;

/* Mark asset as available */
CREATE PROCEDURE sp_Asset_MarkAsAvailable
( @AssetId INT )
AS
BEGIN
	SET NOCOUNT ON;
	UPDATE dbo.Asset
	SET Status = 'Available'
	WHERE Id=@AssetId
END
GO;

/* Mark asset as assigned */
CREATE PROCEDURE sp_Asset_MarkAsAssigned
( @AssetId INT )
AS
BEGIN
	SET NOCOUNT ON;
	UPDATE dbo.Asset
	SET Status = 'Assigned'
	WHERE Id=@AssetId
END
GO;

/* Mark asset as damaged */
CREATE PROCEDURE sp_Asset_MarkAsDamaged
( @AssetId INT )
AS
BEGIN
	SET NOCOUNT ON;
	UPDATE dbo.Asset
	SET Status = 'Damaged'
	WHERE Id=@AssetId
END
GO;