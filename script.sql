Create database [dbb]
USE [dbb]
GO
/****** Object:  Table [dbo].[Account]    Script Date: 3/04/2022 9:01:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Account](
	[uID] [nchar](20) NOT NULL,
	[password] [nchar](30) NULL,
	[name] [nvarchar](50) NULL,
	[type] [nchar](20) NULL,
 CONSTRAINT [PK_Account] PRIMARY KEY CLUSTERED 
(
	[uID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Cart]    Script Date: 3/04/2022 9:01:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cart](
	[uID] [nchar](20) NOT NULL,
	[pID] [nchar](20) NOT NULL,
	[Amount] [int] NULL,
 CONSTRAINT [PK_Cart] PRIMARY KEY CLUSTERED 
(
	[uID] ASC,
	[pID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 3/04/2022 9:01:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[cID] [nchar](20) NOT NULL,
	[name] [nvarchar](max) NULL,
	[required] [int] NULL,
 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
(
	[cID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Feedback]    Script Date: 3/04/2022 9:01:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Feedback](
	[pID] [nchar](20) NULL,
	[content] [nvarchar](max) NULL,
	[date] [date] NULL,
	[id] [int] IDENTITY(1,1) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order]    Script Date: 3/04/2022 9:01:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[uID] [nchar](20) NOT NULL,
	[pID] [nchar](20) NOT NULL,
	[amount] [int] NULL,
	[id] [int] IDENTITY(1,1) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 3/04/2022 9:01:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[pID] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](max) NULL,
	[image] [nvarchar](max) NULL,
	[price] [money] NULL,
	[description] [nvarchar](max) NULL,
	[cateID] [nchar](20) NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[pID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[Account] ([uID], [password], [name], [type]) VALUES (N'admin               ', N'1                             ', N'Admin', N'Admin               ')
INSERT [dbo].[Account] ([uID], [password], [name], [type]) VALUES (N'quyen                 ', N'1                             ', N'Quyên', N'admin               ')
INSERT [dbo].[Account] ([uID], [password], [name], [type]) VALUES (N'hoa                ', N'1                       ', N'Hòa', N'customer            ')
INSERT [dbo].[Account] ([uID], [password], [name], [type]) VALUES (N'myla               ', N'1                             ', N'My La', N'customer            ')
INSERT [dbo].[Account] ([uID], [password], [name], [type]) VALUES (N'ngoc       ', N'1                           ', N'Ngọc', N'customer            ')
INSERT [dbo].[Account] ([uID], [password], [name], [type]) VALUES (N'duyen                ', N'1                             ', N'Duyên', N'customer            ')

GO
INSERT [dbo].[Category] ([cID], [name], [required]) VALUES (N'1            ', N'Chăm sóc da', 10)
INSERT [dbo].[Category] ([cID], [name], [required]) VALUES (N'2             ', N'Chăm sóc tóc', 300)
INSERT [dbo].[Category] ([cID], [name], [required]) VALUES (N'3            ', N'Kem chống nắng', 150)
INSERT [dbo].[Category] ([cID], [name], [required]) VALUES (N'4            ', N'Mặt nạ', 10)
INSERT [dbo].[Category] ([cID], [name], [required]) VALUES (N'5              ', N'Sửa rửa mặt', 300)
INSERT [dbo].[Category] ([cID], [name], [required]) VALUES (N'6            ', N'Sữa tắm', 150)
INSERT [dbo].[Category] ([cID], [name], [required]) VALUES (N'7            ', N'Tẩy trang', 150)
INSERT [dbo].[Category] ([cID], [name], [required]) VALUES (N'8            ', N'Thực phẩm chức năng', 150)

SET IDENTITY_INSERT [dbo].[Order] OFF
GO
ALTER TABLE [dbo].[Cart]  WITH CHECK ADD  CONSTRAINT [fk_cart_acc] FOREIGN KEY([uID])
REFERENCES [dbo].[Account] ([uID])
GO
ALTER TABLE [dbo].[Cart] CHECK CONSTRAINT [fk_cart_acc]
GO
ALTER TABLE [dbo].[Cart]  WITH CHECK ADD  CONSTRAINT [fk_cart_product] FOREIGN KEY([pID])
REFERENCES [dbo].[Product] ([pID])
GO
ALTER TABLE [dbo].[Cart] CHECK CONSTRAINT [fk_cart_product]
GO
ALTER TABLE [dbo].[Feedback]  WITH CHECK ADD  CONSTRAINT [fk_Feedback_Product] FOREIGN KEY([pID])
REFERENCES [dbo].[Product] ([pID])
GO
ALTER TABLE [dbo].[Feedback] CHECK CONSTRAINT [fk_Feedback_Product]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [fk_order_acc] FOREIGN KEY([uID])
REFERENCES [dbo].[Account] ([uID])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [fk_order_acc]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [fk_order_product] FOREIGN KEY([pID])
REFERENCES [dbo].[Product] ([pID])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [fk_order_product]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [fk_Product_Cate] FOREIGN KEY([cateID])
REFERENCES [dbo].[Category] ([cID])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [fk_Product_Cate]
GO

Create trigger checkk
on [dbo].[Cart]
for insert,update, delete
as
	declare @soluong int
begin
	select @soluong = Amount from inserted
	if @soluong <1
	begin	
		rollback
	end
end