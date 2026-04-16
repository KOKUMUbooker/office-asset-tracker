/* Create DB */
IF DB_ID('AssetTrackerDB') IS NULL
BEGIN
    CREATE DATABASE AssetTrackerDB;
END
GO

/* Switch context to the current DB */
USE AssetTrackerDB;
GO

/* Create database tables in dbo schema with their relationships & constraints  */
CREATE TABLE dbo.[Category] (
    Id INT IDENTITY PRIMARY KEY,
    Name NVARCHAR(100) NOT NULL
);
GO

CREATE TABLE dbo.[Staff] (
    Id INT IDENTITY PRIMARY KEY,
    Name NVARCHAR(100) NOT NULL
);
GO

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
GO
