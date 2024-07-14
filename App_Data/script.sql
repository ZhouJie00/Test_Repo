-- Script to create the database tables
CREATE TABLE [dbo].[Accounts] (
    [Id]                   CHAR (36)     NOT NULL,
    [first_name]           VARCHAR (50)  NULL,
    [last_name]            VARCHAR (50)  NULL,
    [email]                VARCHAR (255) NOT NULL,
    [emailConfirmed]       BIT           NULL,
    [isAdmin]              BIT           NOT NULL,
    [password]             VARCHAR (128) NOT NULL,
    [mobile_number]        CHAR (8)      NULL,
    [multi_factor_enabled] BIT           NULL,
    [secret_key]           VARCHAR (255) NULL,
    [address1]             TEXT          NULL,
    [address2]             TEXT          NULL,
    [zipcode]              CHAR (6)      NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC)
);

CREATE TABLE [dbo].[Category] (
    [Id]    INT          NOT NULL,
    [Name]  VARCHAR (50) NOT NULL,
    [count] INT          NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC)
);

CREATE TABLE [dbo].[Clothes] (
    [Id]          CHAR (36)     NOT NULL,
    [name]        VARCHAR (100) NOT NULL,
    [quantity]    INT           NOT NULL,
    [price]       MONEY         NOT NULL,
    [overview]    TEXT          NOT NULL,
    [gender]      CHAR (1)      NOT NULL,
    [category_id] INT           NOT NULL,
    [link]        VARCHAR (225) NOT NULL,
    [DateAdded] DATE NOT NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_Clothes_ToTable] FOREIGN KEY ([category_id]) REFERENCES [dbo].[Category] ([Id])
);

CREATE TABLE [dbo].[Countries] (
    [Id]      CHAR (36)    NOT NULL,
    [country] VARCHAR (75) NOT NULL,
    [count]   INT          NOT NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC),
    UNIQUE NONCLUSTERED ([country] ASC)
);

CREATE TABLE [dbo].[Ratings] (
    [Id]         CHAR (36)  NOT NULL,
    [account_id] CHAR (36)  NOT NULL,
    [product_id] CHAR (36)  NOT NULL,
    [stars]      FLOAT (53) NOT NULL,
    [review]     TEXT       NOT NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_Ratings_Accounts] FOREIGN KEY ([account_id]) REFERENCES [dbo].[Accounts] ([Id]),
    CONSTRAINT [FK_Ratings_Clothes] FOREIGN KEY ([product_id]) REFERENCES [dbo].[Clothes] ([Id])
);

CREATE TABLE [dbo].[Sales] (
    [Id]          CHAR (36) NOT NULL,
    [paymentdate] DATE      NOT NULL,
    [amount]      MONEY     NOT NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC)
);

CREATE TABLE [dbo].[Orders] (
    [Id]             CHAR (36) NOT NULL,
    [total]          MONEY     NOT NULL,
    [date_purchased] DATE      NOT NULL,
    [account_id]     CHAR (36) NOT NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_Order_Accounts] FOREIGN KEY ([account_id]) REFERENCES [dbo].[Accounts] ([Id])
);

CREATE TABLE [dbo].[Purchase] (
    [Id]          CHAR (36) NOT NULL,
    [quantity]    INT       NOT NULL,
    [clothing_id] CHAR (36) NOT NULL,
    [order_id]    CHAR (36) NOT NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC),
	CONSTRAINT [FK_Order_Clothes] FOREIGN KEY ([clothing_id]) REFERENCES [dbo].[Clothes] ([Id]),
    CONSTRAINT [FK_Purchase_Order] FOREIGN KEY ([order_id]) REFERENCES [dbo].[Orders] ([Id])
);


-- Create Admin account
INSERT INTO accounts (Id, first_name, last_name, email, emailConfirmed, isAdmin, password, mobile_number, multi_factor_enabled, secret_key, address1, address2, zipcode)
VALUES ('00000000-0000-4000-A000-000000000000', 'Admin', '', 'admin@email.com', 1, 1, '+tXo6i44VgJBDPOoTxxb75gAzvfU+H49Ml1TCZe0uOySCaZQ3S1hR/5Dj86n/R5pjkSR/YbK9c8hds4eIKnQXF0x43bq', '', 0, null, null, null, null)

-- Create categories
INSERT INTO [dbo].[Category] ([Id], [Name], [count]) VALUES (1, N'Chino', 0)
INSERT INTO [dbo].[Category] ([Id], [Name], [count]) VALUES (2, N'Jeans', 0)
INSERT INTO [dbo].[Category] ([Id], [Name], [count]) VALUES (3, N'Pants', 0)
INSERT INTO [dbo].[Category] ([Id], [Name], [count]) VALUES (4, N'Shorts', 0)
INSERT INTO [dbo].[Category] ([Id], [Name], [count]) VALUES (5, N'Casual Shirts', 0)
INSERT INTO [dbo].[Category] ([Id], [Name], [count]) VALUES (6, N'Polo Shirts', 0)
INSERT INTO [dbo].[Category] ([Id], [Name], [count]) VALUES (7, N'T-Shirts', 0)
INSERT INTO [dbo].[Category] ([Id], [Name], [count]) VALUES (8, N'UT(Graphic T-Shirts)', 0)
INSERT INTO [dbo].[Category] ([Id], [Name], [count]) VALUES (9, N'Legging Pants', 0)
INSERT INTO [dbo].[Category] ([Id], [Name], [count]) VALUES (10, N'Skirts', 0)
INSERT INTO [dbo].[Category] ([Id], [Name], [count]) VALUES (11, N'Shirts & Blouses', 0)
INSERT INTO [dbo].[Category] ([Id], [Name], [count]) VALUES (12, N'Sweaters', 0)
INSERT INTO [dbo].[Category] ([Id], [Name], [count]) VALUES (13, N'Sweats', 0)

-- Create test product
INSERT INTO [dbo].[Clothes] ([Id], [name], [quantity], [price], [overview], [gender], [category_id], [link], [dateAdded]) 
VALUES (N'00000000-0000-4000-A000-111111111111', N'Test Product', 99, CAST(99.9000 AS Money), N'- Soft and comfortable clothing.
- This should not be with production.', N'M', 8, N'http://localhost.com/product?id=00000000-0000-4000-A000-111111111111', '2022/01/01')

-- Create First country
INSERT INTO [dbo].[Countries] ([Id], [country], [count]) VALUES (N'8930b50c-cf3c-4fa1-a765-1aac69d03c29', N'SG', 1)

-- Create Test sale
INSERT INTO [dbo].[Sales] ([Id], [paymentdate], [amount]) VALUES (N'22f5a331-97f7-4e8d-b12a-1dfd581ba16c', N'2022-02-01', CAST(94.7000 AS Money))
