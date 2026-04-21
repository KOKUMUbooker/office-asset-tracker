DELETE FROM dbo.Category WHERE Name IN ('IT Equipment', 'Furniture', 'Office Supplies','Electronics');
GO
/* =========================
   Seed Categories
========================= */
INSERT INTO dbo.Category (Name)
VALUES 
('IT Equipment'),
('Furniture'),
('Office Supplies'),
('Electronics');
GO

DELETE FROM dbo.Staff WHERE Name IN ('Alice Johnson','Bob Smith','Charlie Brown','Diana Prince')
GO
/* =========================
   Seed Staff
========================= */
INSERT INTO dbo.[Staff] (Name)
VALUES 
('Alice Johnson'),
('Bob Smith'),
('Charlie Brown'),
('Diana Prince');
GO

DELETE FROM dbo.Asset WHERE Name IN ('Dell Laptop','HP Desktop','Lenovo ThinkPad','Office Chair','Standing Desk','Printer Paper Box','Stapler','Projector','Conference Phone')
GO
/* =========================
   Seed Assets
========================= */
DECLARE @IT INT = (SELECT Id FROM dbo.Category WHERE Name = 'IT Equipment');
DECLARE @Furniture INT = (SELECT Id FROM dbo.Category WHERE Name = 'Furniture');
DECLARE @OfficeSupplies INT = (SELECT Id FROM dbo.Category WHERE Name = 'Office Supplies');
DECLARE @Electronics INT = (SELECT Id FROM dbo.Category WHERE Name = 'Electronics');

DECLARE @Alice INT = (SELECT Id FROM dbo.[Staff] WHERE Name = 'Alice Johnson');
DECLARE @Bob INT = (SELECT Id FROM dbo.[Staff] WHERE Name = 'Bob Smith');
DECLARE @Charlie INT = (SELECT Id FROM dbo.[Staff] WHERE Name = 'Charlie Brown');
DECLARE @Diana INT = (SELECT Id FROM dbo.[Staff] WHERE Name = 'Diana Prince');

INSERT INTO dbo.Asset (Name, CategoryId, Status, AssignedToStaffId)
VALUES
-- IT Equipment
('Dell Laptop', @IT, 'Available', NULL),
('HP Desktop', @IT, 'Assigned', @Alice),
('Lenovo ThinkPad', @IT, 'Assigned', @Bob),

-- Furniture
('Office Chair', @Furniture, 'Available', NULL),
('Standing Desk', @Furniture, 'Assigned', @Charlie),

-- Office Supplies
('Printer Paper Box', @OfficeSupplies, 'Available', NULL),
('Stapler', @OfficeSupplies, 'Available', NULL),

-- Electronics
('Projector', @Electronics, 'Assigned', @Diana),
('Conference Phone', @Electronics, 'Damaged', NULL);
GO