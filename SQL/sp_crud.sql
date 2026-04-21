/* ==================== CATEGORIES ==============================*/
/* 1. Get all categories */
IF OBJECT_ID('dbo.sp_Category_GetAll', 'P') IS NOT NULL
    DROP PROCEDURE dbo.sp_Category_GetAll;
GO
CREATE PROCEDURE dbo.sp_Category_GetAll
AS
BEGIN
	SET NOCOUNT ON;
	SELECT * FROM dbo.Category;
END;
GO

/*2.  Get category by Id */
IF OBJECT_ID('dbo.sp_Category_GetById', 'P') IS NOT NULL
    DROP PROCEDURE dbo.sp_Category_GetById;
GO
CREATE PROCEDURE dbo.sp_Category_GetById 
( @Id INT)
AS
BEGIN
	SET NOCOUNT ON;
	SELECT * FROM dbo.Category WHERE Id=@Id;
END;
GO

/* 3. Create category */
IF OBJECT_ID('dbo.sp_Category_Insert', 'P') IS NOT NULL
    DROP PROCEDURE dbo.sp_Category_Insert;
GO
CREATE PROCEDURE dbo.sp_Category_Insert
( @CategoryName NVARCHAR(100) )
AS
BEGIN
	SET NOCOUNT ON;
	INSERT INTO dbo.Category (Name)
	VALUES (@CategoryName)

	SELECT SCOPE_IDENTITY() /* Return ID of created item */
END;
GO

/* 4. Update category */
IF OBJECT_ID('dbo.sp_Category_Update', 'P') IS NOT NULL
    DROP PROCEDURE dbo.sp_Category_Update;
GO
CREATE PROCEDURE dbo.sp_Category_Update 
( 
	@Id INTEGER, 
	@NewCategoryName NVARCHAR(100)
)
AS
BEGIN
	SET NOCOUNT ON;
	UPDATE dbo.Category 
	SET Name=@NewCategoryName
	WHERE Id=@Id
END;
GO

/* 5. Delete category */
IF OBJECT_ID('dbo.sp_Category_Delete', 'P') IS NOT NULL
    DROP PROCEDURE dbo.sp_Category_Delete;
GO
CREATE PROCEDURE dbo.sp_Category_Delete 
( @Id INTEGER )
AS
BEGIN
	SET NOCOUNT ON;
	DELETE FROM dbo.Category WHERE Id=@Id
END;
GO

/* ==================== STAFF ==============================*/
/* 1. Get all staff members */
IF OBJECT_ID('dbo.sp_Staff_GetAll', 'P') IS NOT NULL
    DROP PROCEDURE dbo.sp_Staff_GetAll;
GO
CREATE PROCEDURE dbo.sp_Staff_GetAll
AS
BEGIN
	SET NOCOUNT ON;
	SELECT * FROM dbo.Staff;
END;
GO

/* 2.  Get staff by Id */
IF OBJECT_ID('dbo.sp_Staff_GetById', 'P') IS NOT NULL
    DROP PROCEDURE dbo.sp_Staff_GetById;
GO
CREATE PROCEDURE dbo.sp_Staff_GetById 
( @Id INT)
AS
BEGIN
	SET NOCOUNT ON;
	SELECT * FROM dbo.Staff WHERE Id=@Id;
END;
GO

/* 3. Create staff */
IF OBJECT_ID('dbo.sp_Staff_Insert', 'P') IS NOT NULL
    DROP PROCEDURE dbo.sp_Staff_Insert;
GO
CREATE PROCEDURE dbo.sp_Staff_Insert
( @StaffName NVARCHAR(100) )
AS
BEGIN
	SET NOCOUNT ON;
	INSERT INTO dbo.Staff (Name)
	VALUES (@StaffName)

	SELECT SCOPE_IDENTITY() /* Return ID of created item */
END;
GO

/* 4. Update staff */
IF OBJECT_ID('dbo.sp_Staff_Update', 'P') IS NOT NULL
    DROP PROCEDURE dbo.sp_Staff_Update;
GO
CREATE PROCEDURE dbo.sp_Staff_Update 
(
	@Id INTEGER, 
	@NewStaffName NVARCHAR(100)
)
AS
BEGIN
	SET NOCOUNT ON;
	UPDATE dbo.Staff
	SET Name=@NewStaffName
	WHERE Id=@Id
END;
GO

/* 5. Delete staff */
IF OBJECT_ID('dbo.sp_Staff_Delete', 'P') IS NOT NULL
    DROP PROCEDURE dbo.sp_Staff_Delete;
GO
CREATE PROCEDURE dbo.sp_Staff_Delete 
( @Id INTEGER )
AS
BEGIN
	SET NOCOUNT ON;
	DELETE FROM dbo.Staff WHERE Id=@Id
END;
GO

/* ==================== ASSET ==============================*/
/* 1. Get all assets */
IF OBJECT_ID('dbo.sp_Asset_GetAll', 'P') IS NOT NULL
    DROP PROCEDURE dbo.sp_Asset_GetAll;
GO
CREATE PROCEDURE dbo.sp_Asset_GetAll
AS
BEGIN
	SET NOCOUNT ON;
	SELECT * FROM dbo.Asset;
END;
GO

/* 2. Get asset by Id */
IF OBJECT_ID('dbo.sp_Asset_GetById', 'P') IS NOT NULL
    DROP PROCEDURE dbo.sp_Asset_GetById;
GO
CREATE PROCEDURE dbo.sp_Asset_GetById 
( @Id INT)
AS
BEGIN
	SET NOCOUNT ON;
	SELECT * FROM dbo.Asset WHERE Id=@Id;
END;
GO

/* 3. Create asset */
IF OBJECT_ID('dbo.sp_Asset_Insert', 'P') IS NOT NULL
    DROP PROCEDURE dbo.sp_Asset_Insert;
GO
CREATE PROCEDURE dbo.sp_Asset_Insert
(
 @Name NVARCHAR(100),
 @CategoryId INTEGER,
 @Status NVARCHAR(50),
 @NewAssignedToStaffId INT = NULL
)
AS
BEGIN
	SET NOCOUNT ON;
	INSERT INTO dbo.Asset (Name, CategoryId, Status, AssignedToStaffId)
	VALUES (
		@Name,
		@CategoryId, 
		@Status, 
		CASE 
			WHEN @Status = 'Assigned' THEN @NewAssignedToStaffId
			ELSE NULL
    	END
	)

	SELECT SCOPE_IDENTITY() /* Return ID of created item */
END;
GO

/* 4. Update asset */
IF OBJECT_ID('dbo.sp_Asset_Update', 'P') IS NOT NULL
    DROP PROCEDURE dbo.sp_Asset_Update;
GO
CREATE PROCEDURE dbo.sp_Asset_Update 
( 
    @Id INT, 
    @NewName NVARCHAR(100),
    @NewCategoryId INT,
    @NewStatus NVARCHAR(50),
    @NewAssignedToStaffId INT = NULL
)
AS
BEGIN
    SET NOCOUNT ON;

    UPDATE dbo.Asset
    SET Name = @NewName,
        CategoryId = @NewCategoryId,
        Status = @NewStatus,
        AssignedToStaffId = 
            CASE 
                WHEN @NewStatus = 'Assigned' THEN @NewAssignedToStaffId
                ELSE NULL
            END
    WHERE Id = @Id;
END;
GO

/* 5. Delete asset */
IF OBJECT_ID('dbo.sp_Asset_Delete', 'P') IS NOT NULL
    DROP PROCEDURE dbo.sp_Asset_Delete;
GO
CREATE PROCEDURE dbo.sp_Asset_Delete 
( @Id INTEGER )
AS
BEGIN
	SET NOCOUNT ON;
	DELETE FROM dbo.Asset WHERE Id=@Id
END;