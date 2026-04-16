/* Category stored procedures */
/* ========================= A) CRUD ================================= */
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
