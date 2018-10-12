CREATE TABLE [dbo].[Categories] (
	[Id] INT NOT NULL IDENTITY(1,1), 
	[Name] NVARCHAR(255) NOT NULL, 
	CONSTRAINT [PK_Categories] PRIMARY KEY ([Id])
)

INSERT INTO dbo.Categories SELECT DISTINCT Category FROM dbo.Products;

ALTER TABLE [dbo].[Products] ADD [CategoryId] INT

GO

UPDATE p SET p.CategoryId = (SELECT c.Id FROM dbo.Categories c WHERE c.Name = p.Category) FROM dbo.Products p;

ALTER TABLE [dbo].[Products] ALTER COLUMN [CategoryId] INT NOT NULL;

ALTER TABLE [dbo].[Products] ADD CONSTRAINT [FK_Products_CategoryId_Categories_Id] FOREIGN KEY ([CategoryId]) REFERENCES [dbo].[Categories] ([Id]);

CREATE INDEX [IX_Products_CategoryId] ON [dbo].[Products] ([CategoryId] ASC);

DECLARE @default sysname, @sql nvarchar(max);

SELECT @default = name
FROM sys.default_constraints
WHERE parent_object_id = object_id('[dbo].[Products]')
AND type = 'D'
AND parent_column_id = (
SELECT column_id
FROM sys.columns
WHERE object_id = object_id('[dbo].[Products]')
AND name = 'Category'
);

SET @sql = N'ALTER TABLE [dbo].[Products] DROP CONSTRAINT ' + QUOTENAME(@default);
EXEC sp_executesql @sql;

ALTER TABLE [dbo].[Products] DROP COLUMN [Category];