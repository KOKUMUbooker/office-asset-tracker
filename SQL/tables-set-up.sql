/* NOTE: Should be run on  AssetTrackerDB */

/* Create database tables in dbo schema with their relationships & constraints  */
IF OBJECT_ID('dbo.Category', 'U') IS NULL
BEGIN
    CREATE TABLE dbo.Category (
        Id INT IDENTITY PRIMARY KEY,
        Name NVARCHAR(100) NOT NULL
    );
END
GO

IF OBJECT_ID('dbo.Staff', 'U') IS NULL
BEGIN
    CREATE TABLE dbo.[Staff] (
    Id INT IDENTITY PRIMARY KEY,
    Name NVARCHAR(100) NOT NULL
    );
END
GO

IF OBJECT_ID('dbo.Asset', 'U') IS NULL
BEGIN
    CREATE TABLE dbo.Asset (
    Id INT IDENTITY PRIMARY KEY,
    Name NVARCHAR(100) NOT NULL,
    CategoryId INT NOT NULL,
    Status NVARCHAR(50) NOT NULL,
    AssignedToStaffId INT NULL,

    CONSTRAINT FK_Asset_Category
        FOREIGN KEY (CategoryId)
        REFERENCES dbo.Category(Id),

    CONSTRAINT FK_Asset_User
        FOREIGN KEY (AssignedToStaffId)
        REFERENCES dbo.[Staff](Id)
    );
END
GO
