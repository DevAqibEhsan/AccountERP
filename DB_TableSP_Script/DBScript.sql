USE [AccountERP]
GO
/****** Object:  Table [dbo].[tbl_Accounts]    Script Date: 2/11/2023 9:46:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_Accounts](
	[AccountID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NULL,
	[IsSubAccountOf] [int] NULL,
	[Description] [nvarchar](100) NULL,
	[IsActive] [int] NULL,
	[CreatedBy] [int] NULL,
	[CreatedOn] [datetime] NULL,
	[CreatedByIP] [nvarchar](100) NULL,
	[ModifiedBy] [int] NULL,
	[ModifiedOn] [datetime] NULL,
	[ModifiedByIP] [nvarchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[AccountID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_Branch]    Script Date: 2/11/2023 9:46:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_Branch](
	[BranchID] [int] IDENTITY(1,1) NOT NULL,
	[CompanyID] [int] NULL,
	[Name] [nvarchar](100) NULL,
	[CreatedBy] [int] NULL,
	[CreatedOn] [datetime] NULL,
	[CreatedByIP] [nvarchar](100) NULL,
	[ModifiedBy] [int] NULL,
	[ModifiedOn] [datetime] NULL,
	[ModifiedByIP] [nvarchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[BranchID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_BusinessType]    Script Date: 2/11/2023 9:46:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_BusinessType](
	[BusinessTypeID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NULL,
	[CreatedBy] [int] NULL,
	[CreatedOn] [datetime] NULL,
	[CreatedByIP] [nvarchar](100) NULL,
	[ModifiedBy] [int] NULL,
	[ModifiedOn] [datetime] NULL,
	[ModifiedByIP] [nvarchar](100) NULL,
	[IsActive] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[BusinessTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_City]    Script Date: 2/11/2023 9:46:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_City](
	[CityID] [int] IDENTITY(1,1) NOT NULL,
	[StateID] [int] NULL,
	[Name] [nvarchar](100) NULL,
	[CreatedBy] [int] NULL,
	[CreatedOn] [datetime] NULL,
	[CreatedByIP] [nvarchar](100) NULL,
	[ModifiedBy] [int] NULL,
	[ModifiedOn] [datetime] NULL,
	[ModifiedByIP] [nvarchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[CityID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_Company]    Script Date: 2/11/2023 9:46:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_Company](
	[CompanyID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NULL,
	[PostalPhone] [nvarchar](100) NULL,
	[PostalAddress1] [nvarchar](100) NULL,
	[POstalAddress2] [nvarchar](100) NULL,
	[PostalCity] [int] NULL,
	[PostalState] [int] NULL,
	[PostalZipCode] [nvarchar](100) NULL,
	[PostalCountry] [int] NULL,
	[BillingPhone] [nvarchar](100) NULL,
	[BillingAddress1] [nvarchar](100) NULL,
	[BillingAddress2] [nvarchar](100) NULL,
	[BillingCity] [int] NULL,
	[BillingState] [int] NULL,
	[BillingZipCode] [nvarchar](100) NULL,
	[BillingCountry] [int] NULL,
	[CompanyLogo] [nvarchar](max) NULL,
	[NTN] [nvarchar](100) NULL,
	[STN] [nvarchar](100) NULL,
	[WebsiteURL] [nvarchar](200) NULL,
	[POSID] [nvarchar](100) NULL,
	[BusinessType] [int] NULL,
	[TimeZone] [nvarchar](100) NULL,
	[NoOfUsers] [int] NULL,
	[IsAllowPowerBy] [int] NULL,
	[PoweredBy] [nvarchar](100) NULL,
	[CreatedBy] [int] NULL,
	[CreatedOn] [datetime] NULL,
	[CreatedByIP] [nvarchar](100) NULL,
	[ModifiedBy] [int] NULL,
	[ModifiedOn] [datetime] NULL,
	[ModifiedByIP] [nvarchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[CompanyID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_Configuration]    Script Date: 2/11/2023 9:46:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_Configuration](
	[ConfigurationID] [int] IDENTITY(1,1) NOT NULL,
	[Logo] [nvarchar](max) NULL,
	[DefaultLogo] [nvarchar](max) NULL,
	[PoweredBy] [nvarchar](100) NULL,
	[CreatedBy] [int] NULL,
	[CreatedOn] [datetime] NULL,
	[CreatedByIP] [nvarchar](100) NULL,
	[ModifiedBy] [int] NULL,
	[ModifiedOn] [datetime] NULL,
	[ModifiedByIP] [nvarchar](100) NULL,
	[IsActive] [int] NULL,
 CONSTRAINT [PK_tbl_Configuration] PRIMARY KEY CLUSTERED 
(
	[ConfigurationID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_Country]    Script Date: 2/11/2023 9:46:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_Country](
	[CountryID] [int] IDENTITY(1,1) NOT NULL,
	[CountryCode] [nvarchar](50) NULL,
	[Name] [nvarchar](100) NULL,
	[CreatedBy] [int] NULL,
	[CreatedOn] [datetime] NULL,
	[CreatedByIP] [nvarchar](100) NULL,
	[ModifiedBy] [int] NULL,
	[ModifiedOn] [datetime] NULL,
	[ModifiedByIP] [nvarchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[CountryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_Customer]    Script Date: 2/11/2023 9:46:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_Customer](
	[CustomerID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NULL,
	[PostalPhone] [nvarchar](100) NULL,
	[PostalAddress1] [nvarchar](100) NULL,
	[PostalAddress2] [nvarchar](100) NULL,
	[PostalCity] [int] NULL,
	[PostalState] [int] NULL,
	[PostalZipCode] [nvarchar](100) NULL,
	[PostalCountry] [int] NULL,
	[BillingPhone] [nvarchar](100) NULL,
	[BillingAddress1] [nvarchar](100) NULL,
	[BillingAddress2] [nvarchar](100) NULL,
	[BillingCity] [int] NULL,
	[BillingState] [int] NULL,
	[BillingZipCode] [nvarchar](100) NULL,
	[BillingCountry] [int] NULL,
	[IsActive] [int] NULL,
	[CreatedBy] [int] NULL,
	[CreatedOn] [datetime] NULL,
	[CreatedByIP] [nvarchar](100) NULL,
	[ModifiedBy] [int] NULL,
	[ModifiedOn] [datetime] NULL,
	[ModifiedByIP] [nvarchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[CustomerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_ModulePages]    Script Date: 2/11/2023 9:46:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_ModulePages](
	[ModulePageID] [int] IDENTITY(1,1) NOT NULL,
	[ModuleID] [int] NULL,
	[Name] [nvarchar](100) NULL,
	[ControllerURL] [nvarchar](100) NULL,
	[ActionURL] [nvarchar](100) NULL,
	[Icon] [nvarchar](100) NULL,
	[CreatedBy] [int] NULL,
	[CreatedOn] [datetime] NULL,
	[CreatedByIP] [nvarchar](100) NULL,
	[ModifiedBy] [int] NULL,
	[ModifiedOn] [datetime] NULL,
	[ModifiedByIP] [nvarchar](100) NULL,
	[OrderN] [int] NULL,
	[IsActive] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ModulePageID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_Modules]    Script Date: 2/11/2023 9:46:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_Modules](
	[ModuleID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NULL,
	[Icon] [nvarchar](100) NULL,
	[CreatedBy] [int] NULL,
	[CreatedOn] [datetime] NULL,
	[CreatedByIP] [nvarchar](100) NULL,
	[ModifiedBy] [int] NULL,
	[ModifiedOn] [datetime] NULL,
	[ModifiedByIP] [nvarchar](100) NULL,
	[OrderN] [int] NULL,
	[IsActive] [int] NULL,
	[NameAsID] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[ModuleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_Product]    Script Date: 2/11/2023 9:46:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_Product](
	[productID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NULL,
	[Description] [nvarchar](100) NULL,
	[ProductAttributeID] [int] NULL,
	[ProductBrandID] [int] NULL,
	[ProductTypeID] [int] NULL,
	[ProductCategoryID] [int] NULL,
	[ProductImage] [nvarchar](max) NULL,
	[MinStock] [decimal](18, 2) NULL,
	[MaxStock] [decimal](18, 2) NULL,
	[ReOrderLevel] [int] NULL,
	[ManageStock] [int] NULL,
	[CostPrice] [decimal](18, 2) NULL,
	[UserDefinedCostPrice] [decimal](18, 2) NULL,
	[PurchasePrice] [decimal](18, 2) NULL,
	[RetailPrice] [decimal](18, 2) NULL,
	[ProfitMarginPercentage] [int] NULL,
	[ProfitMarginAmount] [decimal](18, 2) NULL,
	[IsActive] [int] NULL,
	[CreatedBy] [int] NULL,
	[CreatedOn] [datetime] NULL,
	[CreatedByIP] [nvarchar](100) NULL,
	[ModifiedBy] [int] NULL,
	[ModifiedOn] [datetime] NULL,
	[ModifiedByIP] [nvarchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[productID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_ProductAttributes]    Script Date: 2/11/2023 9:46:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_ProductAttributes](
	[ProductAttributeID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NULL,
	[CreatedBy] [int] NULL,
	[CreatedOn] [datetime] NULL,
	[CreatedByIP] [nvarchar](100) NULL,
	[ModifiedBy] [int] NULL,
	[ModifiedOn] [datetime] NULL,
	[ModifiedByIP] [nvarchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[ProductAttributeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_ProductBrands]    Script Date: 2/11/2023 9:46:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_ProductBrands](
	[ProductBrandID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NULL,
	[CreatedBy] [int] NULL,
	[CreatedOn] [datetime] NULL,
	[CreatedByIP] [nvarchar](100) NULL,
	[ModifiedBy] [int] NULL,
	[ModifiedOn] [datetime] NULL,
	[ModifiedByIP] [nvarchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[ProductBrandID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_ProductCategory]    Script Date: 2/11/2023 9:46:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_ProductCategory](
	[ProductCategoryID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NULL,
	[CreatedBy] [int] NULL,
	[CreatedOn] [datetime] NULL,
	[CreatedByIP] [nvarchar](100) NULL,
	[ModifiedBy] [int] NULL,
	[ModifiedOn] [datetime] NULL,
	[ModifiedByIP] [nvarchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[ProductCategoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_ProductTypes]    Script Date: 2/11/2023 9:46:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_ProductTypes](
	[ProductTypeID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NULL,
	[CreatedBy] [int] NULL,
	[CreatedOn] [datetime] NULL,
	[CreatedByIP] [nvarchar](100) NULL,
	[ModifiedBy] [int] NULL,
	[ModifiedOn] [datetime] NULL,
	[ModifiedByIP] [nvarchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[ProductTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_Roles]    Script Date: 2/11/2023 9:46:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_Roles](
	[RoleID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NULL,
	[CreatedBy] [int] NULL,
	[CreatedOn] [datetime] NULL,
	[CreatedByIP] [nvarchar](100) NULL,
	[ModifiedBy] [int] NULL,
	[ModifiedOn] [datetime] NULL,
	[ModifiedByIP] [nvarchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[RoleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_State]    Script Date: 2/11/2023 9:46:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_State](
	[StateID] [int] IDENTITY(1,1) NOT NULL,
	[CountryID] [int] NULL,
	[StateCode] [nvarchar](50) NULL,
	[Name] [nvarchar](100) NULL,
	[CreatedBy] [int] NULL,
	[CreatedOn] [datetime] NULL,
	[CreatedByIP] [nvarchar](100) NULL,
	[ModifiedBy] [int] NULL,
	[ModifiedOn] [datetime] NULL,
	[ModifiedByIP] [nvarchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[StateID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_TimeZones]    Script Date: 2/11/2023 9:46:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_TimeZones](
	[TimeZoneID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NULL,
	[Description] [nvarchar](200) NULL,
	[RelativeToGMT] [nvarchar](100) NULL,
	[CreatedBy] [int] NULL,
	[CreatedOn] [datetime] NULL,
	[CreatedByIP] [nvarchar](200) NULL,
	[ModifiedBy] [int] NULL,
	[ModifiedOn] [datetime] NULL,
	[ModifiedByIP] [nvarchar](200) NULL,
PRIMARY KEY CLUSTERED 
(
	[TimeZoneID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_UserBranch]    Script Date: 2/11/2023 9:46:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_UserBranch](
	[UserBranchID] [int] IDENTITY(1,1) NOT NULL,
	[BranchID] [int] NULL,
	[UserID] [int] NULL,
	[CreatedBy] [int] NULL,
	[CreatedOn] [datetime] NULL,
	[CreatedByIP] [nvarchar](100) NULL,
	[ModifiedBy] [int] NULL,
	[ModifiedOn] [datetime] NULL,
	[ModifiedByIP] [nvarchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[UserBranchID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_UserCompany]    Script Date: 2/11/2023 9:46:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_UserCompany](
	[UserCompanyID] [int] IDENTITY(1,1) NOT NULL,
	[CompanyID] [int] NULL,
	[UserID] [int] NULL,
	[CreatedBy] [int] NULL,
	[CreatedOn] [datetime] NULL,
	[CreatedByIP] [nvarchar](100) NULL,
	[ModifiedBy] [int] NULL,
	[ModifiedOn] [datetime] NULL,
	[ModifiedByIP] [nvarchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[UserCompanyID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_Users]    Script Date: 2/11/2023 9:46:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_Users](
	[UserID] [int] IDENTITY(1,1) NOT NULL,
	[RoleID] [int] NULL,
	[FirstName] [nvarchar](100) NULL,
	[LastName] [nvarchar](100) NULL,
	[Email] [nvarchar](200) NULL,
	[Password] [nvarchar](100) NULL,
	[Phone] [nvarchar](100) NULL,
	[Address1] [nvarchar](100) NULL,
	[Address2] [nvarchar](100) NULL,
	[City] [int] NULL,
	[State] [int] NULL,
	[ZipCode] [nvarchar](50) NULL,
	[Country] [int] NULL,
	[Gender] [nvarchar](50) NULL,
	[DOB] [datetime] NULL,
	[IsActive] [int] NULL,
	[CreatedBy] [int] NULL,
	[CreatedOn] [datetime] NULL,
	[CreatedByIP] [nvarchar](100) NULL,
	[ModifiedBy] [int] NULL,
	[ModifiedOn] [datetime] NULL,
	[ModifiedByIP] [nvarchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_Vender]    Script Date: 2/11/2023 9:46:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_Vender](
	[VenderID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NULL,
	[PostalPhone] [nvarchar](100) NULL,
	[PostalAddress1] [nvarchar](100) NULL,
	[PostalAddress2] [nvarchar](100) NULL,
	[PostalCity] [int] NULL,
	[PostalState] [int] NULL,
	[PostalZipCode] [nvarchar](100) NULL,
	[PostalCountry] [int] NULL,
	[BillingPhone] [nvarchar](100) NULL,
	[BillingAddress1] [nvarchar](100) NULL,
	[BillingAddress2] [nvarchar](100) NULL,
	[BillingCity] [int] NULL,
	[BillingState] [int] NULL,
	[BillingZipCode] [nvarchar](100) NULL,
	[BillingCountry] [int] NULL,
	[IsActive] [int] NULL,
	[CreatedBy] [int] NULL,
	[CreatedOn] [datetime] NULL,
	[CreatedByIP] [nvarchar](100) NULL,
	[ModifiedBy] [int] NULL,
	[ModifiedOn] [datetime] NULL,
	[ModifiedByIP] [nvarchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[VenderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_WereHouses]    Script Date: 2/11/2023 9:46:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_WereHouses](
	[WereHouseID] [int] IDENTITY(1,1) NOT NULL,
	[CompanyID] [int] NULL,
	[BranchID] [int] NULL,
	[Name] [nvarchar](100) NULL,
	[Phone] [nvarchar](100) NULL,
	[Address1] [nvarchar](100) NULL,
	[Address2] [nvarchar](100) NULL,
	[City] [int] NULL,
	[State] [int] NULL,
	[ZipCode] [int] NULL,
	[Country] [int] NULL,
	[CreatedBy] [int] NULL,
	[CreatedOn] [datetime] NULL,
	[CreatedByIP] [nvarchar](100) NULL,
	[ModifiedBy] [int] NULL,
	[ModifiedOn] [datetime] NULL,
	[ModifiedByIP] [nvarchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[WereHouseID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tbl_ModulePages] ADD  DEFAULT ((999)) FOR [OrderN]
GO
ALTER TABLE [dbo].[tbl_ModulePages] ADD  DEFAULT ((0)) FOR [IsActive]
GO
ALTER TABLE [dbo].[tbl_Modules] ADD  DEFAULT ((99)) FOR [OrderN]
GO
ALTER TABLE [dbo].[tbl_Modules] ADD  DEFAULT ((0)) FOR [IsActive]
GO
/****** Object:  StoredProcedure [dbo].[usp_BusinessType_Add]    Script Date: 2/11/2023 9:46:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Aqib Ehsan>
-- Create date: <Feb 10,2023>
-- Description:	<Add Business Type>
-- =============================================
create PROCEDURE [dbo].[usp_BusinessType_Add]
@BusinessTypeName nvarchar(200),
@IsActive int,
@CreatedBy int,
@CreatedOn datetime,
@CreatedByIP nvarchar(200)
AS
BEGIN

	SET NOCOUNT ON;

	declare @BusinessTypeID int

	insert into tbl_BusinessType
	(
		Name,
		IsActive,
		CreatedBy,
		CreatedOn,
		CreatedByIP,
		ModifiedBy,
		ModifiedOn,
		ModifiedByIP
	)
	values
	(
		@BusinessTypeName,
		@IsActive,
		@CreatedBy,
		@CreatedOn,
		@CreatedByIP,
		@CreatedBy,
		@CreatedOn,
		@CreatedByIP
	)

	SET @BusinessTypeID = SCOPE_IDENTITY();

	select 
		bs.BusinessTypeID,
		bs.Name as BusinessTypeName
	from tbl_BusinessType bs
	where bs.BusinessTypeID = @BusinessTypeID
END

/*

usp_BusinessType_Add @BusinessTypeName = 'abc',@IsActive = 1,@CreatedBy = 1,@CreatedOn = '2023-01-12 10:55:29.930',@CreatedByIP = ''

*/
GO
/****** Object:  StoredProcedure [dbo].[usp_BusinessType_GetAll]    Script Date: 2/11/2023 9:46:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Aqib Ehsan>
-- Create date: <Feb 10,2023>
-- Description:	<Get All Business Types>
-- =============================================
create PROCEDURE [dbo].[usp_BusinessType_GetAll]
AS
BEGIN
	
	SET NOCOUNT ON;

	select 
		bs.BusinessTypeID,
		bs.Name as BusinessTypeName,
		bs.IsActive,
		bs.CreatedBy,
		bs.CreatedOn,
		bs.CreatedByIP,
		bs.ModifiedBy,
		bs.ModifiedOn,
		bs.ModifiedByIP,
		cusr.FirstName+' '+cusr.LastName as CreatedByUserName,
		musr.FirstName+' '+musr.LastName as ModifiedByUserName
	from tbl_BusinessType bs
	inner join tbl_Users as cusr on cusr.UserID = bs.CreatedBy
	inner join tbl_Users as musr on musr.UserID = bs.ModifiedBy
END


/*

usp_BusinessType_GetAll

*/
GO
/****** Object:  StoredProcedure [dbo].[usp_BusinessType_GetAllActive]    Script Date: 2/11/2023 9:46:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Aqib Ehsan>
-- Create date: <Feb 10,2023>
-- Description:	<Get All Business Types>
-- =============================================
create PROCEDURE [dbo].[usp_BusinessType_GetAllActive]
AS
BEGIN
	
	SET NOCOUNT ON;

	select 
		bs.BusinessTypeID,
		bs.Name as BusinessTypeName,
		bs.IsActive,
		bs.CreatedBy,
		bs.CreatedOn,
		bs.CreatedByIP,
		bs.ModifiedBy,
		bs.ModifiedOn,
		bs.ModifiedByIP,
		cusr.FirstName+' '+cusr.LastName as CreatedByUserName,
		musr.FirstName+' '+musr.LastName as ModifiedByUserName
	from tbl_BusinessType bs
	inner join tbl_Users as cusr on cusr.UserID = bs.CreatedBy
	inner join tbl_Users as musr on musr.UserID = bs.ModifiedBy
	where bs.IsActive = 1
END


/*

usp_BusinessType_GetAllActive

*/
GO
/****** Object:  StoredProcedure [dbo].[usp_BusinessType_GetBusinessTypeByID]    Script Date: 2/11/2023 9:46:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Aqib Ehsan>
-- Create date: <Feb 10,2023>
-- Description:	<Get Business Type By ID>
-- =============================================
CREATE PROCEDURE [dbo].[usp_BusinessType_GetBusinessTypeByID]
@BusinessTypeID int
AS
BEGIN
	
	SET NOCOUNT ON;

	select 
		bs.BusinessTypeID,
		bs.Name as BusinessTypeName,
		bs.IsActive,
		bs.CreatedBy,
		bs.CreatedOn,
		bs.CreatedByIP,
		bs.ModifiedBy,
		bs.ModifiedOn,
		bs.ModifiedByIP
	from tbl_BusinessType bs
	where bs.BusinessTypeID = @BusinessTypeID
END


/*

usp_BusinessType_GetBusinessTypeByID @BusinessTypeID = 1

*/
GO
/****** Object:  StoredProcedure [dbo].[usp_BusinessType_Update]    Script Date: 2/11/2023 9:46:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Aqib Ehsan>
-- Create date: <Feb 10,2023>
-- Description:	<Update Business Type>
-- =============================================
CREATE PROCEDURE [dbo].[usp_BusinessType_Update]
@BusinessTypeID int,
@BusinessTypeName nvarchar(200),
@IsActive int,
@ModifiedBy int,
@ModifiedOn datetime,
@ModifiedByIP nvarchar(200)
AS
BEGIN

	SET NOCOUNT ON;

	update tbl_BusinessType
	set Name = @BusinessTypeName,
		IsActive = @IsActive,
		ModifiedBy = @ModifiedBy,
		ModifiedOn = @ModifiedOn,
		ModifiedByIP = @ModifiedByIP
		where BusinessTypeID = @BusinessTypeID

	if(@@ROWCOUNT > 0)
	begin
	select 
		bs.BusinessTypeID,
		bs.Name as BusinessTypeName
	from tbl_BusinessType bs
	where bs.BusinessTypeID = @BusinessTypeID
	end
END

/*

usp_BusinessType_Update @BusinessTypeName = 'abcd',@IsActive = 1,@ModifiedBy = 1,@ModifiedOn = '2023-01-12 10:55:29.930',@ModifiedByIP = '',@BusinessTypeID = 1

*/
GO
/****** Object:  StoredProcedure [dbo].[usp_City_Add]    Script Date: 2/11/2023 9:46:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Aqib Ehsan>
-- Create date: <Feb 07,2023>
-- Description:	<Add New City>
-- =============================================
CREATE PROCEDURE [dbo].[usp_City_Add]
@StateID int,
@CityName nvarchar(200),
@CreatedBy int,
@CreatedOn datetime,
@CreatedByIP nvarchar(200)
AS
BEGIN

	SET NOCOUNT ON;

	declare @CityID int

	insert into tbl_City
	(
		StateID,
		Name,
		CreatedBy,
		CreatedOn,
		CreatedByIP,
		ModifiedBy,
		ModifiedOn,
		ModifiedByIP
	)
	values
	(
		@StateID,
		@CityName,
		@CreatedBy,
		@CreatedOn,
		@CreatedByIP,
		@CreatedBy,
		@CreatedOn,
		@CreatedByIP
	)

	SET @CityID = SCOPE_IDENTITY();

	select 
		ct.Name as CityName,
		st.Name as StateName,
		ctry.Name as CountryName
	from tbl_City ct
	inner join tbl_State st on st.StateID = ct.StateID
	inner join tbl_Country ctry on ctry.CountryID = st.CountryID
	where ct.CityID = @CityID
END

/*

usp_City_Add @StateID = 2,@CityName = 'karachi',@CreatedBy = 1,@CreatedOn = '2023-01-12 10:55:29.930',@CreatedByIP = ''

*/
GO
/****** Object:  StoredProcedure [dbo].[usp_City_GetAll]    Script Date: 2/11/2023 9:46:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Aqib Ehsan>
-- Create date: <Feb 07,2023>
-- Description:	<Get All City Data>
-- =============================================
CREATE PROCEDURE [dbo].[usp_City_GetAll]
AS
BEGIN

	SET NOCOUNT ON;

	select 
		ct.CityID,
		ct.StateID,
		ct.Name as CityName,
		st.Name as StateName,
		ctry.Name as CountryName,
		ct.CreatedBy,
		ct.CreatedOn,
		ct.CreatedByIP,
		ct.ModifiedBy,
		ct.ModifiedOn,
		ct.ModifiedByIP,
		cusr.FirstName+' '+cusr.LastName as CreatedByUserName,
		musr.FirstName+' '+musr.LastName as ModifiedByUserName
	from tbl_City ct
	inner join tbl_State st on st.StateID = ct.StateID
	inner join tbl_Country ctry on ctry.CountryID = st.CountryID
	inner join tbl_Users as cusr on cusr.UserID = ct.CreatedBy
	inner join tbl_Users as musr on musr.UserID = ct.ModifiedBy
END

/*

usp_City_GetAll

*/
GO
/****** Object:  StoredProcedure [dbo].[usp_City_GetCityByID]    Script Date: 2/11/2023 9:46:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Aqib Ehsan>
-- Create date: <Feb 07,2023>
-- Description:	<Get City By ID>
-- =============================================
CREATE PROCEDURE [dbo].[usp_City_GetCityByID]
@CityID int
AS
BEGIN

	SET NOCOUNT ON;

	select 
		ct.CityID,
		ct.StateID,
		ct.Name as CityName,
		ct.CreatedBy,
		ct.CreatedOn,
		ct.CreatedByIP,
		ct.ModifiedBy,
		ct.ModifiedOn,
		ct.ModifiedByIP
	from tbl_City ct
	where ct.CityID = @CityID
END

/*

usp_City_GetCityByID @CityID = 1

*/
GO
/****** Object:  StoredProcedure [dbo].[usp_City_Update]    Script Date: 2/11/2023 9:46:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Aqib Ehsan>
-- Create date: <Feb 07,2023>
-- Description:	<Update City>
-- =============================================
CREATE PROCEDURE [dbo].[usp_City_Update]
@CityID int,
@StateID int,
@CityName nvarchar(200),
@ModifiedBy int,
@ModifiedOn datetime,
@ModifiedByIP nvarchar(200)
AS
BEGIN

	SET NOCOUNT ON;
	
	update tbl_City
	set StateID = @StateID,
		Name = @CityName,
		ModifiedBy = @ModifiedBy,
		ModifiedOn = @ModifiedOn,
		ModifiedByIP = @ModifiedByIP
		where CityID = @CityID
		
	if(@@ROWCOUNT > 0)
	begin
		select 
			ct.Name as CityName,
			st.Name as StateName,
			ctry.Name as CountryName
		from tbl_City ct
		inner join tbl_State st on st.StateID = ct.StateID
		inner join tbl_Country ctry on ctry.CountryID = st.CountryID
		where ct.CityID = @CityID
	end
END

/*

usp_City_Update @StateID = 2,@CityName = 'karachi',@ModifiedBy = 1,@ModifiedOn = '2023-01-12 10:45:29.930',@ModifiedByIP = '',@CityID = 1

*/
GO
/****** Object:  StoredProcedure [dbo].[usp_Country_Add]    Script Date: 2/11/2023 9:46:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Aqib Ehsan>
-- Create date: <Feb 06,2023>
-- Description:	<Add Country>
-- =============================================
create PROCEDURE [dbo].[usp_Country_Add]
@CountryCode nvarchar(100),
@CountryName nvarchar(200),
@CreatedBy int,
@CreatedOn datetime,
@CreatedByIP nvarchar(200)
AS
BEGIN
	
	SET NOCOUNT ON;

	declare @CountryID int;

	insert into tbl_Country
	(
		CountryCode,
		Name,
		CreatedBy,
		CreatedOn,
		CreatedByIP,
		ModifiedBy,
		ModifiedOn,
		ModifiedByIP
	)
	values
	(
		@CountryCode,
		@CountryName,
		@CreatedBy,
		@CreatedOn,
		@CreatedByIP,
		@CreatedBy,
		@CreatedOn,
		@CreatedByIP
	)

	SET @CountryID = SCOPE_IDENTITY();

	select 
		ctry.CountryID,
		ctry.CountryCode,
		ctry.Name as CountryName
	from tbl_Country ctry
	where CountryID = @CountryID

END


/*

usp_Country_Add @CountryCode = 'PK',@CountryName = 'Pakistan',@CreatedBy = 1,@CreatedOn = '2023-01-12 10:42:29.930',@CreatedByIP = ''

*/
GO
/****** Object:  StoredProcedure [dbo].[usp_Country_GetAll]    Script Date: 2/11/2023 9:46:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Aqib Ehsan>
-- Create date: <Feb 05,2023>
-- Description:	<Get All Country>
-- =============================================
create PROCEDURE [dbo].[usp_Country_GetAll]
AS
BEGIN
	
	SET NOCOUNT ON;

	select 
		ctry.CountryID,
		ctry.CountryCode,
		ctry.Name as CountryName,
		ctry.CreatedBy,
		ctry.CreatedOn,
		ctry.CreatedByIP,
		ctry.ModifiedBy,
		ctry.ModifiedOn,
		ctry.ModifiedByIP,
		cusr.FirstName+' '+cusr.LastName as CreatedByUserName,
		musr.FirstName+' '+musr.LastName as ModifiedByUserName
	from tbl_Country ctry
	inner join tbl_Users as cusr on cusr.UserID = ctry.CreatedBy
	inner join tbl_Users as musr on musr.UserID = ctry.ModifiedBy
END


/*

usp_Country_GetAll

*/
GO
/****** Object:  StoredProcedure [dbo].[usp_Country_GetCountryByID]    Script Date: 2/11/2023 9:46:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Aqib Ehsan>
-- Create date: <Feb 06,2023>
-- Description:	<Get Country By ID>
-- =============================================
CREATE PROCEDURE [dbo].[usp_Country_GetCountryByID]
@CountryID int
AS
BEGIN
	
	SET NOCOUNT ON;

	select 
		ctry.CountryID,
		ctry.CountryCode,
		ctry.Name as CountryName,
		ctry.CreatedBy,
		ctry.CreatedOn,
		ctry.CreatedByIP,
		ctry.ModifiedBy,
		ctry.ModifiedOn,
		ctry.ModifiedByIP
	from tbl_Country ctry
	where CountryID = @CountryID
END


/*

usp_Country_GetCountryByID @CountryID = 1

*/
GO
/****** Object:  StoredProcedure [dbo].[usp_Country_Update]    Script Date: 2/11/2023 9:46:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Aqib Ehsan>
-- Create date: <Feb 06,2023>
-- Description:	<Update Country>
-- =============================================
create PROCEDURE [dbo].[usp_Country_Update]
@CountryID int,
@CountryCode nvarchar(100),
@CountryName nvarchar(200),
@ModifiedBy int,
@ModifiedOn datetime,
@ModifiedByIP nvarchar(200)
AS
BEGIN
	
	SET NOCOUNT ON;

	update tbl_Country
	set CountryCode = @CountryCode,
		Name = @CountryName,
		ModifiedBy = @ModifiedBy,
		ModifiedOn = @ModifiedOn,
		ModifiedByIP = @ModifiedByIP
		where CountryID = @CountryID

	if(@@ROWCOUNT > 0)
	begin
		select 
			ctry.CountryID,
			ctry.CountryCode,
			ctry.Name as CountryName
		from tbl_Country ctry
		where CountryID = @CountryID
	end

END


/*

usp_Country_Update @CountryCode = 'PK1',@CountryName = 'Pakistan1',@ModifiedBy = 1,@ModifiedOn = '2023-01-12 10:42:29.930',@ModifiedByIP = '',@CountryID = 1

*/
GO
/****** Object:  StoredProcedure [dbo].[usp_Module_Add]    Script Date: 2/11/2023 9:46:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Aqib Ehsan>
-- Create date: <Jan 29, 2023>
-- Description:	<Add New Module>
-- =============================================
CREATE PROCEDURE [dbo].[usp_Module_Add] 
@ModuleName	nvarchar(200),
@Icon nvarchar(200),
@CreatedBy int,
@CreatedOn datetime,
@CreatedByIP nvarchar(200),
@OrderN int,
@IsActive int,
@NameAsModuleID nvarchar(max)
AS
BEGIN

declare @ModuleID int;

	SET NOCOUNT ON;

	insert into tbl_Modules
	(
		Name,
		Icon,
		CreatedBy,
		CreatedOn,
		CreatedByIP,
		ModifiedBy,
		ModifiedOn,
		ModifiedByIP,
		OrderN,
		IsActive,
		NameAsID
	)
	values
	(
	@ModuleName,
	@Icon,
	@CreatedBy,
	@CreatedOn,
	@CreatedByIP,
	@CreatedBy,
	@CreatedOn,
	@CreatedByIP,
	@OrderN,
	@IsActive,
	@NameAsModuleID
	);

	SET @ModuleID = SCOPE_IDENTITY();

	select 
	mdl.ModuleID,
	mdl.Name as ModuleName,
	mdl.NameAsID as NameAsModuleID 
	from tbl_Modules as mdl 
	where ModuleID = @ModuleID

END

/*

exec usp_Module_Add @ModuleName = 'asdfsadf',@Icon = '',@CreatedBy = 1,@CreatedOn = '2023-01-29 19:19:53.233',@CreatedByIP = '',@OrderN = 1,@IsActive = 0,@NameAsModuleID = 'sfsadf';

*/
GO
/****** Object:  StoredProcedure [dbo].[usp_Module_GetAll]    Script Date: 2/11/2023 9:46:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Aqib Ehsan>
-- Create date: <Jan 15,2023>
-- Description:	<Get All Modules / Main Menu List>
-- =============================================
CREATE PROCEDURE [dbo].[usp_Module_GetAll]
AS
BEGIN
	
	SET NOCOUNT ON;

	select 
		mdl.ModuleID,
		mdl.Name ModuleName,
		mdl.NameAsID as NameAsModuleID,
		mdl.Icon,
		mdl.OrderN,
		mdl.CreatedBy,
		mdl.CreatedOn,
		mdl.CreatedByIP,
		mdl.ModifiedBy,
		mdl.ModifiedOn,
		mdl.ModifiedByIP,
		mdl.IsActive,
		cusr.FirstName+' '+cusr.LastName as CreatedByUserName,
		musr.FirstName+' '+musr.LastName as ModifiedByUserName
	from tbl_Modules as mdl
	inner join tbl_Users as cusr on cusr.UserID = mdl.CreatedBy
	inner join tbl_Users as musr on musr.UserID = mdl.ModifiedBy
	order by mdl.OrderN asc
END


/*

usp_Module_GetAll

*/
GO
/****** Object:  StoredProcedure [dbo].[usp_Module_GetAllActive]    Script Date: 2/11/2023 9:46:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Aqib Ehsan>
-- Create date: <Feb 01,2023>
-- Description:	<Get All Active Modules / Main Menu List>
-- =============================================
CREATE PROCEDURE [dbo].[usp_Module_GetAllActive]
AS
BEGIN
	
	SET NOCOUNT ON;

	select 
		mdl.ModuleID,
		mdl.Name ModuleName,
		mdl.NameAsID as NameAsModuleID,
		mdl.Icon,
		mdl.OrderN,
		mdl.CreatedBy,
		mdl.CreatedOn,
		mdl.CreatedByIP,
		mdl.ModifiedBy,
		mdl.ModifiedOn,
		mdl.ModifiedByIP,
		mdl.IsActive,
		cusr.FirstName+' '+cusr.LastName as CreatedByUserName,
		musr.FirstName+' '+musr.LastName as ModifiedByUserName
	from tbl_Modules as mdl
	inner join tbl_Users as cusr on cusr.UserID = mdl.CreatedBy
	inner join tbl_Users as musr on musr.UserID = mdl.ModifiedBy
	where mdl.IsActive = 1 
	order by mdl.OrderN asc
END


/*

usp_Module_GetAllActive

*/
GO
/****** Object:  StoredProcedure [dbo].[usp_Module_GetModuleByID]    Script Date: 2/11/2023 9:46:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Aqib Ehsan>
-- Create date: <Feb 01,2023>
-- Description:	<Get Module By Module ID>
-- =============================================
CREATE PROCEDURE [dbo].[usp_Module_GetModuleByID]
@ModuleID as int
AS
BEGIN
	
	SET NOCOUNT ON;

	select 
		mdl.ModuleID,
		mdl.Name ModuleName,
		mdl.NameAsID as NameAsModuleID,
		mdl.Icon,
		mdl.OrderN,
		mdl.CreatedBy,
		mdl.CreatedOn,
		mdl.CreatedByIP,
		mdl.ModifiedBy,
		mdl.ModifiedOn,
		mdl.ModifiedByIP,
		mdl.IsActive
	from tbl_Modules as mdl
	where mdl.ModuleID = @ModuleID
END


/*

usp_Module_GetModuleByID @ModuleID = 15

*/
GO
/****** Object:  StoredProcedure [dbo].[usp_Module_Update]    Script Date: 2/11/2023 9:46:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Aqib Ehsan>
-- Create date: <Jan 31, 2023>
-- Description:	<Update Module>
-- =============================================
CREATE PROCEDURE [dbo].[usp_Module_Update] 
@ModuleID as int,
@ModuleName	nvarchar(200),
@Icon nvarchar(200),
@ModifiedBy int,
@ModifiedOn datetime,
@ModifiedByIP nvarchar(200),
@OrderN int,
@IsActive int,
@NameAsModuleID nvarchar(max)
AS
BEGIN

	SET NOCOUNT ON;

	update tbl_Modules
	set Name = @ModuleName,
		Icon = @Icon,
		ModifiedBy = @ModifiedBy,
		ModifiedOn = @ModifiedOn,
		ModifiedByIP = @ModifiedByIP,
		OrderN = @OrderN,
		IsActive = @IsActive,
		NameAsID = @NameAsModuleID
	where ModuleID = @ModuleID

	if(@@ROWCOUNT > 0)
	begin
		select 
		mdl.ModuleID,
		mdl.Name as ModuleName,
		mdl.NameAsID as NameAsModuleID 
		from tbl_Modules as mdl 
		where ModuleID = @ModuleID
	end
	
END

/*

exec usp_Module_Update @ModuleName = 'tretert',@Icon = '',@ModifiedBy = 1,@ModifiedOn = '2023-01-29 19:19:53.233',@ModifiedByIP = '',@OrderN = 1,@IsActive = 0,@NameAsModuleID = 'sfsadf',@ModuleID = 12;

*/
GO
/****** Object:  StoredProcedure [dbo].[usp_ModulePage_Add]    Script Date: 2/11/2023 9:46:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Aqib Ehsan>
-- Create date: <Feb 04,2023>
-- Description:	<Add New Module Page>
-- =============================================
CREATE PROCEDURE [dbo].[usp_ModulePage_Add] 
@ModuleID int,
@ModulePageName nvarchar(200),
@ControllerURL nvarchar(200),
@ActionURL nvarchar(200),
@CreatedBy int,
@CreatedOn datetime,
@CreatedByIP nvarchar(200),
@OrderN int,
@IsActive int
AS
BEGIN
	
	SET NOCOUNT ON;

	declare @ModulePageID int;

    insert into tbl_ModulePages
	(
		ModuleID,
		Name,
		ControllerURL,
		ActionURL,
		CreatedBy,
		CreatedOn,
		CreatedByIP,
		ModifiedBy,
		ModifiedOn,
		ModifiedByIP,
		OrderN,
		IsActive
	)
	values
	(
	@ModuleID,
	@ModulePageName,
	@ControllerURL,
	@ActionURL,
	@CreatedBy,
	@CreatedOn,
	@CreatedByIP,
	@CreatedBy,
	@CreatedOn,
	@CreatedByIP,
	@OrderN,
	@IsActive
	);

	SET @ModulePageID = SCOPE_IDENTITY();

	select 
		mdlp.ModulePageID,
		mdlp.ModuleID,
		mdl.Name as ModuleName,
		mdlp.Name as ModulePageName
	from tbl_ModulePages as mdlp 
	inner join tbl_Modules as mdl on mdl.ModuleID = mdlp.ModuleID
	where mdlp.ModulePageID = @ModulePageID
END

/*

exec usp_ModulePage_Add @ModuleID = 12,@ModulePageName = 'abc123',@ControllerURL = 'sadf',@ActionURL = 'jkljkl',@CreatedBy = 1,@CreatedOn = '2023-02-04 19:54:59.927',@CreatedByIP = '890',@OrderN = 423,@IsActive = 0

*/
GO
/****** Object:  StoredProcedure [dbo].[usp_ModulePage_Update]    Script Date: 2/11/2023 9:46:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Aqib Ehsan>
-- Create date: <Feb 04,2023>
-- Description:	<Update Module Page>
-- =============================================
CREATE PROCEDURE [dbo].[usp_ModulePage_Update]
@ModulePageID int,
@ModuleID int,
@ModulePageName nvarchar(200),
@ControllerURL nvarchar(200),
@ActionURL nvarchar(200),
@ModifiedBy int,
@ModifiedOn datetime,
@ModifiedByIP nvarchar(200),
@OrderN int,
@IsActive int
AS
BEGIN
	
	SET NOCOUNT ON;

	update tbl_ModulePages
	set ModuleID = @ModuleID,
		Name=@ModulePageName,
		ControllerURL = @ControllerURL,
		ActionURL = @ActionURL,
		ModifiedBy = @ModifiedBy,
		ModifiedOn = @ModifiedOn,
		ModifiedByIP = @ModifiedByIP,
		OrderN = @OrderN,
		IsActive = @IsActive
		where ModulePageID = @ModulePageID

		if(@@ROWCOUNT > 0)
		begin
			select 
				mdlp.ModulePageID,
				mdlp.ModuleID,
				mdl.Name as ModuleName,
				mdlp.Name as ModulePageName
			from tbl_ModulePages as mdlp 
			inner join tbl_Modules as mdl on mdl.ModuleID = mdlp.ModuleID
			where mdlp.ModulePageID = @ModulePageID
		end
END

/*

exec usp_ModulePage_Update @ModuleID = 12,@ModulePageName = 'abc123',@ControllerURL = 'sadf',@ActionURL = 'jkljkl',@CreatedBy = 1,@CreatedOn = '2023-02-04 19:54:59.927',@CreatedByIP = '890',@OrderN = 423,@IsActive = 0,@ModulePageID = 32

*/
GO
/****** Object:  StoredProcedure [dbo].[usp_ModulePages_GetAll]    Script Date: 2/11/2023 9:46:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Aqib Ehsan>
-- Create date: <Jan 15,2023>
-- Description:	<Get All Module Pages / Sub Menu>
-- =============================================
CREATE PROCEDURE [dbo].[usp_ModulePages_GetAll]
AS
BEGIN
	
	SET NOCOUNT ON;

	select 
		mdlp.ModulePageID,
		mdlp.ModuleID,
		mdl.Name as ModuleName,
		mdlp.Name as ModulePageName,
		mdlp.ControllerURL,
		mdlp.ActionURL,
		mdlp.Icon,
		mdlp.CreatedBy,
		mdlp.CreatedOn,
		mdlp.CreatedByIP,
		mdlp.ModifiedBy,
		mdlp.ModifiedOn,
		mdlp.ModifiedByIP,
		mdlp.OrderN,
		mdlp.IsActive,
		cusr.FirstName+' '+cusr.LastName as CreatedByUserName,
		musr.FirstName+' '+musr.LastName as ModifiedByUserName
	from tbl_ModulePages as mdlp 
	inner join tbl_Modules as mdl on mdl.ModuleID = mdlp.ModuleID
	inner join tbl_Users as cusr on cusr.UserID = mdlp.CreatedBy
	inner join tbl_Users as musr on musr.UserID = mdlp.ModifiedBy
END


/*

usp_ModulePages_GetAll

*/
GO
/****** Object:  StoredProcedure [dbo].[usp_ModulePages_GetAllActive]    Script Date: 2/11/2023 9:46:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Aqib Ehsan>
-- Create date: <Feb 03,2023>
-- Description:	<Get All Active Module Pages / Active Sub Menu>
-- =============================================
CREATE PROCEDURE [dbo].[usp_ModulePages_GetAllActive]
AS
BEGIN
	
	SET NOCOUNT ON;

	select 
		mdlp.ModulePageID,
		mdlp.ModuleID,
		mdl.Name as ModuleName,
		mdlp.Name as ModulePageName,
		mdlp.ControllerURL,
		mdlp.ActionURL,
		mdlp.Icon,
		mdlp.CreatedBy,
		mdlp.CreatedOn,
		mdlp.CreatedByIP,
		mdlp.ModifiedBy,
		mdlp.ModifiedOn,
		mdlp.ModifiedByIP,
		mdlp.OrderN,
		mdlp.IsActive,
		cusr.FirstName+' '+cusr.LastName as CreatedByUserName,
		musr.FirstName+' '+musr.LastName as ModifiedByUserName
	from tbl_ModulePages as mdlp 
	inner join tbl_Modules as mdl on mdl.ModuleID = mdlp.ModuleID
	inner join tbl_Users as cusr on cusr.UserID = mdlp.CreatedBy
	inner join tbl_Users as musr on musr.UserID = mdlp.ModifiedBy
	where mdlp.IsActive = 1
	order by ModulePageID asc
END


/*

usp_ModulePages_GetAllActive

*/
GO
/****** Object:  StoredProcedure [dbo].[usp_ModulePages_GetModulePageByID]    Script Date: 2/11/2023 9:46:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Aqib Ehsan>
-- Create date: <Jan 15,2023>
-- Description:	<Get Module Page by Module ID>
-- =============================================
create PROCEDURE [dbo].[usp_ModulePages_GetModulePageByID]
@ModulePageID int
AS
BEGIN
	
	SET NOCOUNT ON;

	select 
		mdlp.ModulePageID,
		mdlp.ModuleID,
		mdlp.Name as ModulePageName,
		mdlp.ControllerURL,
		mdlp.ActionURL,
		mdlp.Icon,
		mdlp.CreatedBy,
		mdlp.CreatedOn,
		mdlp.CreatedByIP,
		mdlp.ModifiedBy,
		mdlp.ModifiedOn,
		mdlp.ModifiedByIP,
		mdlp.OrderN,
		mdlp.IsActive
	from tbl_ModulePages as mdlp 
	where ModulePageID = @ModulePageID
END


/*

usp_ModulePages_GetModulePageByID @ModulePageID = 32

*/
GO
/****** Object:  StoredProcedure [dbo].[usp_Role_Add]    Script Date: 2/11/2023 9:46:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Aqib Ehsan>
-- Create date: <Feb 10,2023>
-- Description:	<Add Role>
-- =============================================
create PROCEDURE [dbo].[usp_Role_Add]
@RoleName nvarchar(200),
@CreatedBy int,
@CreatedOn datetime,
@CreatedByIP nvarchar(200)
AS
BEGIN

	SET NOCOUNT ON;

	declare @RoleID int

	insert into tbl_Roles
	(
		Name,
		CreatedBy,
		CreatedOn,
		CreatedByIP,
		ModifiedBy,
		ModifiedOn,
		ModifiedByIP
	)
	values
	(
		@RoleName,
		@CreatedBy,
		@CreatedOn,
		@CreatedByIP,
		@CreatedBy,
		@CreatedOn,
		@CreatedByIP
	)

	SET @RoleID = SCOPE_IDENTITY();

	select 
		rl.RoleID,
		rl.Name as RoleName
	from tbl_Roles rl
	where rl.RoleID = @RoleID
END

/*

usp_Role_Add @RoleName='abc',@CreatedBy = 1,@CreatedOn = '2023-01-12 10:55:29.930',@CreatedByIP = ''

*/
GO
/****** Object:  StoredProcedure [dbo].[usp_Role_GetAll]    Script Date: 2/11/2023 9:46:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Aqib Ehsan>
-- Create date: <Feb 10,2023>
-- Description:	<Get All Roles>
-- =============================================
create PROCEDURE [dbo].[usp_Role_GetAll]
AS
BEGIN
	
	SET NOCOUNT ON;

	select 
		rl.RoleID,
		rl.Name as RoleName,
		rl.CreatedBy,
		rl.CreatedOn,
		rl.CreatedByIP,
		rl.ModifiedBy,
		rl.ModifiedOn,
		rl.ModifiedByIP,
		cusr.FirstName+' '+cusr.LastName as CreatedByUserName,
		musr.FirstName+' '+musr.LastName as ModifiedByUserName
	from tbl_Roles rl
	inner join tbl_Users as cusr on cusr.UserID = rl.CreatedBy
	inner join tbl_Users as musr on musr.UserID = rl.ModifiedBy
END


/*

usp_Role_GetAll

*/
GO
/****** Object:  StoredProcedure [dbo].[usp_Role_GetRoleByID]    Script Date: 2/11/2023 9:46:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Aqib Ehsan>
-- Create date: <Feb 10,2023>
-- Description:	<Get Role By ID>
-- =============================================
create PROCEDURE [dbo].[usp_Role_GetRoleByID]
@RoleID int
AS
BEGIN
	
	SET NOCOUNT ON;

	select 
		rl.RoleID,
		rl.Name as RoleName,
		rl.CreatedBy,
		rl.CreatedOn,
		rl.CreatedByIP,
		rl.ModifiedBy,
		rl.ModifiedOn,
		rl.ModifiedByIP
	from tbl_Roles rl
	where rl.RoleID = @RoleID
END


/*

usp_Role_GetRoleByID @RoleID = 1

*/
GO
/****** Object:  StoredProcedure [dbo].[usp_Role_Update]    Script Date: 2/11/2023 9:46:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Aqib Ehsan>
-- Create date: <Feb 10,2023>
-- Description:	<Update Role>
-- =============================================
create PROCEDURE [dbo].[usp_Role_Update]
@RoleID int,
@RoleName nvarchar(200),
@ModifiedBy int,
@ModifiedOn datetime,
@ModifiedByIP nvarchar(200)
AS
BEGIN

	SET NOCOUNT ON;

	update tbl_Roles
	set Name = @RoleName,
		ModifiedBy = @ModifiedBy,
		ModifiedOn = @ModifiedOn,
		ModifiedByIP = @ModifiedByIP
		where RoleID = @RoleID
		
	if(@@ROWCOUNT > 0)
	begin
		select 
			rl.RoleID,
			rl.Name as RoleName
		from tbl_Roles rl
		where rl.RoleID = @RoleID
	end
END

/*

usp_Role_Update @RoleName='rwer',@ModifiedBy = 1,@ModifiedOn = '2023-01-12 10:55:29.930',@ModifiedByIP = '', @RoleID = 5

*/
GO
/****** Object:  StoredProcedure [dbo].[usp_SiteConfig_Add]    Script Date: 2/11/2023 9:46:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 -- =============================================
-- Author:		<Aqib Ehsan>
-- Create date: <Feb 10,2023>
-- Description:	<Add Site Config>
-- =============================================
CREATE PROCEDURE [dbo].[usp_SiteConfig_Add]
@Logo nvarchar(max),
@PoweredBy  nvarchar(200),
@IsActive int,
@CreatedBy int,
@CreatedOn datetime,
@CreatedByIP nvarchar(200)
AS
BEGIN

	SET NOCOUNT ON;

	declare @ConfigurationID int

	insert into tbl_Configuration
	(
		Logo,
		PoweredBy,
		IsActive,
		CreatedBy,
		CreatedOn,
		CreatedByIP,
		ModifiedBy,
		ModifiedOn,
		ModifiedByIP
	)
	values
	(
		@Logo,
		@PoweredBy,
		@IsActive,
		@CreatedBy,
		@CreatedOn,
		@CreatedByIP,
		@CreatedBy,
		@CreatedOn,
		@CreatedByIP
	)

	SET @ConfigurationID = SCOPE_IDENTITY();

	select
	config.ConfigurationID,
		config.Logo,
		config.DefaultLogo,
		config.PoweredBy
	from tbl_Configuration config
	where ConfigurationID = @ConfigurationID
END

/*

usp_SiteConfig_Add @Logo = '',@PoweredBy = 'I am Testing',@IsActive = 1,@CreatedBy = 1,@CreatedOn = '2023-01-12 10:55:29.930',@CreatedByIP = ''

*/
GO
/****** Object:  StoredProcedure [dbo].[usp_SiteConfig_GetAll]    Script Date: 2/11/2023 9:46:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Aqib Ehsan>
-- Create date: <Feb 10,2023>
-- Description:	<Get All Site Config>
-- =============================================
create PROCEDURE [dbo].[usp_SiteConfig_GetAll]
AS
BEGIN
	
	SET NOCOUNT ON;

	select 
		config.ConfigurationID,
		config.Logo,
		config.DefaultLogo,
		config.PoweredBy,
		config.IsActive,
		config.CreatedBy,
		config.CreatedOn,
		config.CreatedByIP,
		config.ModifiedBy,
		config.ModifiedOn,
		config.ModifiedByIP,
		cusr.FirstName+' '+cusr.LastName as CreatedByUserName,
		musr.FirstName+' '+musr.LastName as ModifiedByUserName
	from tbl_Configuration config
	inner join tbl_Users as cusr on cusr.UserID = config.CreatedBy
	inner join tbl_Users as musr on musr.UserID = config.ModifiedBy
END


/*

usp_SiteConfig_GetAll

*/
GO
/****** Object:  StoredProcedure [dbo].[usp_SiteConfig_GetAllActive]    Script Date: 2/11/2023 9:46:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Aqib Ehsan>
-- Create date: <Feb 10,2023>
-- Description:	<Get All Active Site Config>
-- =============================================
create PROCEDURE [dbo].[usp_SiteConfig_GetAllActive]
AS
BEGIN
	
	SET NOCOUNT ON;

	select 
		config.ConfigurationID,
		config.Logo,
		config.DefaultLogo,
		config.PoweredBy,
		config.IsActive,
		config.CreatedBy,
		config.CreatedOn,
		config.CreatedByIP,
		config.ModifiedBy,
		config.ModifiedOn,
		config.ModifiedByIP,
		cusr.FirstName+' '+cusr.LastName as CreatedByUserName,
		musr.FirstName+' '+musr.LastName as ModifiedByUserName
	from tbl_Configuration config
	inner join tbl_Users as cusr on cusr.UserID = config.CreatedBy
	inner join tbl_Users as musr on musr.UserID = config.ModifiedBy
	where config.IsActive = 1
END


/*

usp_SiteConfig_GetAllActive

*/
GO
/****** Object:  StoredProcedure [dbo].[usp_SiteConfig_GetSiteConfigByID]    Script Date: 2/11/2023 9:46:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Aqib Ehsan>
-- Create date: <Feb 10,2023>
-- Description:	<Get Site Config By ID>
-- =============================================
CREATE PROCEDURE [dbo].[usp_SiteConfig_GetSiteConfigByID]
@ConfigurationID int
AS
BEGIN
	
	SET NOCOUNT ON;

	select 
		config.ConfigurationID,
		config.Logo,
		config.DefaultLogo,
		config.PoweredBy,
		config.IsActive,
		config.CreatedBy,
		config.CreatedOn,
		config.CreatedByIP,
		config.ModifiedBy,
		config.ModifiedOn,
		config.ModifiedByIP
	from tbl_Configuration config
	where config.ConfigurationID = @ConfigurationID
END


/*

usp_SiteConfig_GetSiteCOnfigByID @ConfigurationID = 1

*/
GO
/****** Object:  StoredProcedure [dbo].[usp_SiteConfig_Update]    Script Date: 2/11/2023 9:46:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Aqib Ehsan>
-- Create date: <Feb 10,2023>
-- Description:	<Update Site Config>
-- =============================================
CREATE PROCEDURE [dbo].[usp_SiteConfig_Update]
@ConfigurationID int,
@Logo nvarchar(max),
@PoweredBy  nvarchar(200),
@IsActive int,
@ModifiedBy int,
@ModifiedOn datetime,
@ModifiedByIP nvarchar(200)
AS
BEGIN

	SET NOCOUNT ON;

	if(@Logo <> '')
	begin
		update tbl_Configuration
			set Logo = @Logo,
			PoweredBy = @PoweredBy,
			IsActive = @IsActive,
			ModifiedBy = @ModifiedBy,
			ModifiedOn = @ModifiedOn,
			ModifiedByIP = @ModifiedByIP
		where ConfigurationID = @ConfigurationID
	end

	else
	begin
		update tbl_Configuration
			set PoweredBy = @PoweredBy,
			IsActive = @IsActive,
			ModifiedBy = @ModifiedBy,
			ModifiedOn = @ModifiedOn,
			ModifiedByIP = @ModifiedByIP
		where ConfigurationID = @ConfigurationID
	end

	if(@@ROWCOUNT > 0)
	begin
		select 
		config.Logo,
		config.DefaultLogo,
		config.PoweredBy
		from tbl_Configuration config
		where ConfigurationID = @ConfigurationID
	end
END

/*

usp_SiteConfig_Update @Logo = '',@PoweredBy = 'I am Testing',@IsActive = 1,@ModifiedBy = 1,@ModifiedOn = '2023-01-12 10:55:29.930',@ModifiedByIP = '',@ConfigurationID = 1

*/
GO
/****** Object:  StoredProcedure [dbo].[usp_State_Add]    Script Date: 2/11/2023 9:46:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Aqib Ehsan>
-- Create date: <Feb 07,2023>
-- Description:	<Add New State>
-- =============================================
CREATE PROCEDURE [dbo].[usp_State_Add]
@CountryID int,
@StateCode nvarchar(100),
@StateName nvarchar(200),
@CreatedBy int,
@CreatedOn datetime,
@CreatedByIP nvarchar(100)
AS
BEGIN

	SET NOCOUNT ON;

declare @StateID int;

	insert into tbl_State
	(
		CountryID,
		StateCode,
		Name,
		CreatedBy,
		CreatedOn,
		CreatedByIP,
		ModifiedBy,
		ModifiedOn,
		ModifiedByIP
	)
	values
	(
		@CountryID,
		@StateCode,
		@StateName,
		@CreatedBy,
		@CreatedOn,
		@CreatedByIP,
		@CreatedBy,
		@CreatedOn,
		@CreatedByIP
	)

	SET @StateID = SCOPE_IDENTITY();

	select 
		st.Name as StateName,
		ctry.Name as CountryName
	from tbl_State st
	inner join tbl_Country ctry on ctry.CountryID = st.CountryID
	where st.StateID = @StateID
	
END

/*

usp_State_Add @CountryID = 1,@StateCode = 'SND',@StateName = 'Sindh',@CreatedBy = 1,@CreatedOn = '2023-01-12 10:42:29.930',@CreatedByIP = ''

*/
GO
/****** Object:  StoredProcedure [dbo].[usp_State_GetAll]    Script Date: 2/11/2023 9:46:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Aqib Ehsan>
-- Create date: <Feb 07,2023>
-- Description:	<Get All State>
-- =============================================
CREATE PROCEDURE [dbo].[usp_State_GetAll]
AS
BEGIN

	SET NOCOUNT ON;

	select 
		st.StateID,
		st.CountryID,
		st.StateCode,
		st.Name as StateName,
		ctry.Name as CountryName,
		st.CreatedBy,
		st.CreatedOn,
		st.CreatedByIP,
		st.ModifiedBy,
		st.ModifiedOn,
		st.ModifiedByIP,
		cusr.FirstName+' '+cusr.LastName as CreatedByUserName,
		musr.FirstName+' '+musr.LastName as ModifiedByUserName
	from tbl_State st
	inner join tbl_Country ctry on ctry.CountryID = st.CountryID
	inner join tbl_Users as cusr on cusr.UserID = st.CreatedBy
	inner join tbl_Users as musr on musr.UserID = st.ModifiedBy

END

/*

usp_State_GetAll

*/
GO
/****** Object:  StoredProcedure [dbo].[usp_State_GetStateByID]    Script Date: 2/11/2023 9:46:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Aqib Ehsan>
-- Create date: <Feb 07,2023>
-- Description:	<Get State By id>
-- =============================================
CREATE PROCEDURE [dbo].[usp_State_GetStateByID]
@StateID int
AS
BEGIN

	SET NOCOUNT ON;

	select 
		st.StateID,
		st.CountryID,
		st.StateCode,
		st.Name as StateName,
		st.CreatedBy,
		st.CreatedOn,
		st.CreatedByIP,
		st.ModifiedBy,
		st.ModifiedOn,
		st.ModifiedByIP
	from tbl_State st
	where StateID = @StateID

END

/*

usp_State_GetStateByID @StateID=1

*/
GO
/****** Object:  StoredProcedure [dbo].[usp_State_Update]    Script Date: 2/11/2023 9:46:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Aqib Ehsan>
-- Create date: <Feb 07,2023>
-- Description:	<Update State>
-- =============================================
CREATE PROCEDURE [dbo].[usp_State_Update]
@StateID int,
@CountryID int,
@StateCode nvarchar(100),
@StateName nvarchar(200),
@ModifiedBy int,
@ModifiedOn datetime,
@ModifiedByIP nvarchar(100)
AS
BEGIN

	SET NOCOUNT ON;

	update tbl_State
	set CountryID = @CountryID,
		StateCode = @StateCode,
		Name = @StateName,
		ModifiedBy = @ModifiedBy,
		ModifiedOn = @ModifiedOn,
		ModifiedByIP = @ModifiedByIP
	where StateID = @StateID

	if(@@ROWCOUNT > 0)
	begin
		select 
			st.Name as StateName,
			ctry.Name as CountryName
		from tbl_State st
		inner join tbl_Country ctry on ctry.CountryID = st.CountryID
		where st.StateID = @StateID
	end
	
END

/*

usp_State_Update @CountryID = 1,@StateCode = 'SND',@StateName = 'Sindh',@ModifiedBy = 1,@ModifiedOn = '2023-01-12 10:55:29.930',@ModifiedByIP = '',@StateID = 1

*/
GO
/****** Object:  StoredProcedure [dbo].[usp_TimeZone_Add]    Script Date: 2/11/2023 9:46:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Aqib Ehsan>
-- Create date: <Feb 10,2023>
-- Description:	<Add Time Zone>
-- =============================================
CREATE PROCEDURE [dbo].[usp_TimeZone_Add]
@TimeZoneName nvarchar(200),
@Description nvarchar(400),
@RelativeToGMT nvarchar(200),
@CreatedBy int,
@CreatedOn datetime,
@CreatedByIP nvarchar(200)
AS
BEGIN

	SET NOCOUNT ON;

	declare @TimeZoneID int

	insert into tbl_TimeZones
	(
		Name,
		Description,
		RelativeToGMT,
		CreatedBy,
		CreatedOn,
		CreatedByIP,
		ModifiedBy,
		ModifiedOn,
		ModifiedByIP
	)
	values
	(
	@TimeZoneName,
	@Description,
	@RelativeToGMT,
	@CreatedBy,
	@CreatedOn,
	@CreatedByIP,
	@CreatedBy,
	@CreatedOn,
	@CreatedByIP
	)
	
	SET @TimeZoneID = SCOPE_IDENTITY();

	select 
		tz.TimeZoneID,
		tz.Name TimeZoneName,
		tz.Description,
		tz.RelativeToGMT
	from tbl_TimeZones tz
	where tz.TimeZoneID = @TimeZoneID
END

/*

usp_TimeZone_Add @TimeZoneName = 'sdfasdf',@Description = 'adf',@RelativeToGMT = 'asdf',@CreatedBy = 1,@CreatedOn = '2023-01-12 10:55:29.930',@CreatedByIP = ''

*/
GO
/****** Object:  StoredProcedure [dbo].[usp_TimeZone_GetAll]    Script Date: 2/11/2023 9:46:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Aqib Ehsan>
-- Create date: <Feb 10,2023>
-- Description:	<Get All Time Zone>
-- =============================================
create PROCEDURE [dbo].[usp_TimeZone_GetAll]
AS
BEGIN
	
	SET NOCOUNT ON;

	select 
		tz.TimeZoneID,
		tz.Name TimeZoneName,
		tz.Description,
		tz.RelativeToGMT,
		tz.CreatedBy,
		tz.CreatedOn,
		tz.CreatedByIP,
		tz.ModifiedBy,
		tz.ModifiedOn,
		tz.ModifiedByIP,
		cusr.FirstName+' '+cusr.LastName as CreatedByUserName,
		musr.FirstName+' '+musr.LastName as ModifiedByUserName
	from tbl_TimeZones tz
	inner join tbl_Users as cusr on cusr.UserID = tz.CreatedBy
	inner join tbl_Users as musr on musr.UserID = tz.ModifiedBy
END


/*

usp_TimeZone_GetAll

*/
GO
/****** Object:  StoredProcedure [dbo].[usp_TimeZone_GetTimeZoneByID]    Script Date: 2/11/2023 9:46:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Aqib Ehsan>
-- Create date: <Feb 10,2023>
-- Description:	<Get Time Zone By ID>
-- =============================================
create PROCEDURE [dbo].[usp_TimeZone_GetTimeZoneByID]
@TimeZoneID int
AS
BEGIN
	
	SET NOCOUNT ON;

	select 
		tz.TimeZoneID,
		tz.Name TimeZoneName,
		tz.Description,
		tz.RelativeToGMT,
		tz.CreatedBy,
		tz.CreatedOn,
		tz.CreatedByIP,
		tz.ModifiedBy,
		tz.ModifiedOn,
		tz.ModifiedByIP
	from tbl_TimeZones tz
	where tz.TimeZoneID = @TimeZoneID
END


/*

usp_TimeZone_GetTimeZoneByID @TimeZoneID = 1

*/
GO
/****** Object:  StoredProcedure [dbo].[usp_TimeZone_Update]    Script Date: 2/11/2023 9:46:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Aqib Ehsan>
-- Create date: <Feb 10,2023>
-- Description:	<Update Time Zone>
-- =============================================
create PROCEDURE [dbo].[usp_TimeZone_Update]
@TimeZoneID int,
@TimeZoneName nvarchar(200),
@Description nvarchar(400),
@RelativeToGMT nvarchar(200),
@ModifiedBy int,
@ModifiedOn datetime,
@ModifiedByIP nvarchar(200)
AS
BEGIN

	SET NOCOUNT ON;

	update tbl_TimeZones
	set Name = @TimeZoneName,
		Description = @Description,
		RelativeToGMT = @RelativeToGMT,
		ModifiedBy = @ModifiedBy,
		ModifiedOn = @ModifiedOn,
		ModifiedByIP = @ModifiedByIP
	where TimeZoneID = @TimeZoneID


	if(@@ROWCOUNT > 0)
	begin
		select 
			tz.TimeZoneID,
			tz.Name TimeZoneName,
			tz.Description,
			tz.RelativeToGMT
		from tbl_TimeZones tz
		where tz.TimeZoneID = @TimeZoneID
	end
END

/*

usp_TimeZone_Update @TimeZoneName = 'ter',@Description = 'sdgf',@RelativeToGMT = 'jkljkl',@ModifiedBy = 1,@ModifiedOn = '2023-01-12 10:55:29.930',@ModifiedByIP = '',@TimeZoneID = 1

*/
GO
/****** Object:  StoredProcedure [dbo].[usp_ValidateLogin]    Script Date: 2/11/2023 9:46:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Aqib Ehsan>
-- Create date: <Jan 13,2023>
-- Description:	<Check User and Login to System>
-- =============================================
CREATE PROCEDURE [dbo].[usp_ValidateLogin] 
@Email as nvarchar(100),
@Password as nvarchar(100)
AS
BEGIN
	
	SET NOCOUNT ON;

    if exists(select UserID from tbl_Users with(nolock) where Email = @Email and Password = @Password and IsActive = 1)
	begin
	select Main.UserID,RoleID,FirstName,LastName,Email,CompanyIdsText,BranchIdsText 
	from 
	(
		select UserID,RoleID,FirstName,LastName,Email from tbl_Users with(nolock) 
		where Email = @Email and Password = @Password and IsActive = 1
	) as Main
	left join
	(
	select UserID,ISNULL(STRING_AGG( CAST(CompanyID AS nvarchar(10)) ,','), null) CompanyIdsText 
	from tbl_UserCompany with(nolock)
	group by UserID
	) as UserCompany on Main.UserID = UserCompany.UserID
	left join
	(
	select UserID,ISNULL(STRING_AGG( CAST(BranchID AS nvarchar(10)) ,','), null) BranchIdsText 
	from tbl_UserBranch with(nolock)
	group by UserID
	) as UserBranch on Main.UserID = UserBranch.UserID
	end
	else
	begin
	select 0 as UserID,0 as RoleID,'' as FirstName,'' as LastName,'' as Email,'' as CompanyIdsText,'' as BranchIdsText
	end
END

/*

exec usp_ValidateLogin @Email = 'superadmin@gmail.com',@Password = 'superadmin@1312023'

*/

GO
