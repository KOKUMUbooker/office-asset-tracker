/* Category stored procedures */
/* ==================== CATEGORIES ==============================*/
/* 1. Get all categories */
CREATE PROCEDURE sp_Category_GetAll
AS
BEGIN
	SELECT * FROM dbo.Category;
END;
GO;

/*2.  Get category by Id */
CREATE PROCEDURE sp_Category_GetById 
( @Id INT)
AS
BEGIN
	SELECT * FROM dbo.Category WHERE Id=@Id;
END;
GO;

/* 3. Create category */
CREATE PROCEDURE sp_Category_Insert
( @CategoryName NVARCHAR(100) )
AS
BEGIN
	INSERT INTO dbo.Category (Name)
	VALUES (@CategoryName)
END;
GO;

/* 4. Update category */
CREATE PROCEDURE sp_Category_Update 
( 
	@Id INTEGER, 
	@NewCategoryName NVARCHAR(100)
)
AS
BEGIN
	UPDATE dbo.Category
	SET Name=@NewCategoryName
	WHERE Id=@Id
END;
GO;

/* 5. Delete category */
CREATE PROCEDURE sp_Category_Delete 
( @Id INTEGER )
AS
BEGIN
	DELETE 
	FROM dbo.Category
	WHERE Id=@Id
END;
GO;

/* ==================== STAFF ==============================*/
/* 1. Get all staff members */
CREATE PROCEDURE sp_Staff_GetAll
AS
BEGIN
	SELECT * FROM dbo.Staff;
END;
GO;

/* 2.  Get staff by Id */
CREATE PROCEDURE sp_Staff_GetById 
( @Id INT)
AS
BEGIN
	SELECT * FROM dbo.Staff WHERE Id=@Id;
END;
GO;

/* 3. Create staff */
CREATE PROCEDURE sp_Staff_Insert
( @StaffName NVARCHAR(100) )
AS
BEGIN
	INSERT INTO dbo.Staff (Name)
	VALUES (@StaffName)
END;
GO;

/* 4. Update staff */
CREATE PROCEDURE sp_Staff_Update 
( 
	@Id INTEGER, 
	@NewStaffName NVARCHAR(100)
)
AS
BEGIN
	UPDATE dbo.Staff
	SET Name=@NewStaffName
	WHERE Id=@Id
END;
GO;

/* 5. Delete staff */
CREATE PROCEDURE sp_Staff_Delete 
( @Id INTEGER )
AS
BEGIN
	DELETE 
	FROM dbo.Staff
	WHERE Id=@Id
END;
GO;

/* ==================== ASSET ==============================*/
/* 1. Get all assets */
CREATE PROCEDURE sp_Asset_GetAll
AS
BEGIN
	SELECT * FROM dbo.Asset;
END;
GO;

/* 2. Get asset by Id */
CREATE PROCEDURE sp_Asset_GetById 
( @Id INT)
AS
BEGIN
	SELECT * FROM dbo.Asset WHERE Id=@Id;
END;
GO;

/* 3. Create asset */
CREATE PROCEDURE sp_Asset_Insert
(
 @Name NVARCHAR(100),
 @CategoryId INTEGER,
 @Status NVARCHAR(50)
)
AS
BEGIN
	INSERT INTO dbo.Asset (Name, CategoryId, Status)
	VALUES (@StaffName, @CategoryId, @Status)
END;
GO;

/* 4. Update asset */
CREATE PROCEDURE sp_Asset_Update 
( 
	@Id INTEGER, 
	@NewName NVARCHAR(100)
)
AS
BEGIN
	UPDATE dbo.Asset
	SET Name=@NewName
	WHERE Id=@Id
END;
GO;

/* 5. Delete asset */
CREATE PROCEDURE sp_Asset_Delete 
( @Id INTEGER )
AS
BEGIN
	DELETE 
	FROM dbo.Asset
	WHERE Id=@Id
END;