CREATE TABLE [dbo].[Product]
(
	[Id] INT NOT NULL PRIMARY KEY IDENTITY,
	[ProductName] NVARCHAR(100) NOT NULL,
    [RetailPrice] MONEY NOT NULL,
	[Description] NVARCHAR(MAX) NOT NULL,
	[CreatedData] DATETIME2 NOT NULL DEFAULT getutcdate(),
	[LastModified] DATETIME2 NOT NULL DEFAULT getutcdate()

)

GO

CREATE TRIGGER [dbo].[lastmodified_trigger]
    ON [dbo].[Product]
    FOR UPDATE
    AS
    BEGIN
        SET NoCount ON
        UPDATE Product
        SET LastModified = GETUTCDATE()
    END