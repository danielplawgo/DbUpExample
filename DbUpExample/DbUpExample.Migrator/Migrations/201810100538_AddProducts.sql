CREATE TABLE [dbo].[Products] (
	[Id] INT NOT NULL IDENTITY(1,1), 
	[Name] NVARCHAR(255) NOT NULL, 
	[Category] NVARCHAR(255) NOT NULL, 
	CONSTRAINT [PK_Products] PRIMARY KEY ([Id])
)

INSERT INTO [dbo].[Products] ([Name], [Category]) VALUES (N'Product 1.1', N'Category 1')
INSERT INTO [dbo].[Products] ([Name], [Category]) VALUES (N'Product 1.2', N'Category 1')
INSERT INTO [dbo].[Products] ([Name], [Category]) VALUES (N'Product 1.3', N'Category 1')
INSERT INTO [dbo].[Products] ([Name], [Category]) VALUES (N'Product 2.1', N'Category 2')
INSERT INTO [dbo].[Products] ([Name], [Category]) VALUES (N'Product 2.2', N'Category 2')