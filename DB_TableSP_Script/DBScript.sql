USE [AccountERP]
GO
/****** Object:  UserDefinedFunction [dbo].[SplitString]    Script Date: 2/22/2023 4:57:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE FUNCTION [dbo].[SplitString]
(    
    @Input NVARCHAR(MAX),
    @Character CHAR(1)
)
RETURNS @Output TABLE (
    Item NVARCHAR(1000)
)
AS
BEGIN
    DECLARE @StartIndex INT, @EndIndex INT
 
    SET @StartIndex = 1
    IF SUBSTRING(@Input, LEN(@Input) - 1, LEN(@Input)) <> @Character
    BEGIN
        SET @Input = @Input + @Character
    END
 
    WHILE CHARINDEX(@Character, @Input) > 0
    BEGIN
        SET @EndIndex = CHARINDEX(@Character, @Input)
         
        INSERT INTO @Output(Item)
        SELECT SUBSTRING(@Input, @StartIndex, @EndIndex - 1)
         
        SET @Input = SUBSTRING(@Input, @EndIndex + 1, LEN(@Input))
    END
 
    RETURN
END
GO
/****** Object:  Table [dbo].[tbl_Accounts]    Script Date: 2/22/2023 4:57:59 PM ******/
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
/****** Object:  Table [dbo].[tbl_AssignedPermission]    Script Date: 2/22/2023 4:57:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_AssignedPermission](
	[AssignedPermissionID] [int] IDENTITY(1,1) NOT NULL,
	[RoleID] [int] NULL,
	[ModulePageActionID] [int] NULL,
	[CreatedBy] [int] NULL,
	[CreatedOn] [datetime] NULL,
	[CreatedByIP] [nvarchar](1) NULL,
	[ModifiedBy] [int] NULL,
	[ModifiedOn] [datetime] NULL,
	[ModifiedByIP] [nvarchar](1) NULL,
PRIMARY KEY CLUSTERED 
(
	[AssignedPermissionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_Branch]    Script Date: 2/22/2023 4:57:59 PM ******/
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
/****** Object:  Table [dbo].[tbl_BusinessType]    Script Date: 2/22/2023 4:57:59 PM ******/
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
/****** Object:  Table [dbo].[tbl_City]    Script Date: 2/22/2023 4:57:59 PM ******/
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
/****** Object:  Table [dbo].[tbl_Company]    Script Date: 2/22/2023 4:57:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_Company](
	[CompanyID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NULL,
	[PostalPhone] [nvarchar](100) NULL,
	[PostalAddress1] [nvarchar](100) NULL,
	[PostalAddress2] [nvarchar](100) NULL,
	[PostalCityID] [int] NULL,
	[PostalStateID] [int] NULL,
	[PostalZipCode] [nvarchar](100) NULL,
	[PostalCountryID] [int] NULL,
	[BillingPhone] [nvarchar](100) NULL,
	[BillingAddress1] [nvarchar](100) NULL,
	[BillingAddress2] [nvarchar](100) NULL,
	[BillingCityID] [int] NULL,
	[BillingStateID] [int] NULL,
	[BillingZipCode] [nvarchar](100) NULL,
	[BillingCountryID] [int] NULL,
	[CompanyLogo] [nvarchar](max) NULL,
	[NTN] [nvarchar](100) NULL,
	[STN] [nvarchar](100) NULL,
	[WebsiteURL] [nvarchar](200) NULL,
	[POSID] [nvarchar](100) NULL,
	[BusinessTypeID] [int] NULL,
	[TimeZoneID] [int] NULL,
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
/****** Object:  Table [dbo].[tbl_Configuration]    Script Date: 2/22/2023 4:57:59 PM ******/
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
/****** Object:  Table [dbo].[tbl_Country]    Script Date: 2/22/2023 4:57:59 PM ******/
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
/****** Object:  Table [dbo].[tbl_Customer]    Script Date: 2/22/2023 4:57:59 PM ******/
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
/****** Object:  Table [dbo].[tbl_ModulePageAction]    Script Date: 2/22/2023 4:57:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_ModulePageAction](
	[ModulePageActionID] [int] IDENTITY(1,1) NOT NULL,
	[ModulePageID] [int] NULL,
	[Name] [nvarchar](200) NULL,
	[CreatedBy] [int] NULL,
	[CreatedOn] [datetime] NULL,
	[CreatedByIP] [nvarchar](200) NULL,
	[ModifiedBy] [int] NULL,
	[ModifiedOn] [datetime] NULL,
	[ModifiedByIP] [nvarchar](200) NULL,
PRIMARY KEY CLUSTERED 
(
	[ModulePageActionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_ModulePages]    Script Date: 2/22/2023 4:57:59 PM ******/
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
/****** Object:  Table [dbo].[tbl_Modules]    Script Date: 2/22/2023 4:57:59 PM ******/
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
/****** Object:  Table [dbo].[tbl_Product]    Script Date: 2/22/2023 4:57:59 PM ******/
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
	[MinStock] [int] NULL,
	[MaxStock] [int] NULL,
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
	[CompanyID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[productID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_ProductAttributes]    Script Date: 2/22/2023 4:57:59 PM ******/
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
/****** Object:  Table [dbo].[tbl_ProductBrands]    Script Date: 2/22/2023 4:57:59 PM ******/
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
/****** Object:  Table [dbo].[tbl_ProductCategory]    Script Date: 2/22/2023 4:57:59 PM ******/
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
/****** Object:  Table [dbo].[tbl_ProductTypes]    Script Date: 2/22/2023 4:57:59 PM ******/
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
/****** Object:  Table [dbo].[tbl_Roles]    Script Date: 2/22/2023 4:57:59 PM ******/
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
/****** Object:  Table [dbo].[tbl_State]    Script Date: 2/22/2023 4:57:59 PM ******/
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
/****** Object:  Table [dbo].[tbl_TimeZones]    Script Date: 2/22/2023 4:57:59 PM ******/
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
/****** Object:  Table [dbo].[tbl_UserBranch]    Script Date: 2/22/2023 4:57:59 PM ******/
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
/****** Object:  Table [dbo].[tbl_UserCompany]    Script Date: 2/22/2023 4:57:59 PM ******/
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
/****** Object:  Table [dbo].[tbl_Users]    Script Date: 2/22/2023 4:57:59 PM ******/
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
	[CityID] [int] NULL,
	[StateID] [int] NULL,
	[ZipCode] [nvarchar](50) NULL,
	[CountryID] [int] NULL,
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
/****** Object:  Table [dbo].[tbl_Vender]    Script Date: 2/22/2023 4:57:59 PM ******/
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
	[PostalCityID] [int] NULL,
	[PostalStateID] [int] NULL,
	[PostalZipCode] [nvarchar](100) NULL,
	[PostalCountryID] [int] NULL,
	[BillingPhone] [nvarchar](100) NULL,
	[BillingAddress1] [nvarchar](100) NULL,
	[BillingAddress2] [nvarchar](100) NULL,
	[BillingCityID] [int] NULL,
	[BillingStateID] [int] NULL,
	[BillingZipCode] [nvarchar](100) NULL,
	[BillingCountryID] [int] NULL,
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
/****** Object:  Table [dbo].[tbl_WereHouses]    Script Date: 2/22/2023 4:57:59 PM ******/
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
/****** Object:  StoredProcedure [dbo].[usp_AssignedPermission_Add]    Script Date: 2/22/2023 4:57:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Aqib Ehsan>
-- Create date: <Feb 22,2023>
-- Description:	<Add Assigned Permission>
-- =============================================
CREATE PROCEDURE [dbo].[usp_AssignedPermission_Add] 
@RoleID	int,
@ModulePageActionIDs nvarchar(max),
@CreatedBy int,
@CreatedOn datetime,
@CreatedByIP nvarchar
AS
BEGIN
	
	SET NOCOUNT ON;

	delete from tbl_AssignedPermission where RoleID = @RoleID

	insert into tbl_AssignedPermission
	(
		RoleID,
		ModulePageActionID,
		CreatedBy,
		CreatedOn,
		CreatedByIP,
		ModifiedBy,
		ModifiedOn,
		ModifiedByIP
	)
	select 
		@RoleID,
		Item,
		@CreatedBy,
		@CreatedOn,
		@CreatedByIP,
		@CreatedBy,
		@CreatedOn,
		@CreatedByIP
	from SplitString(@ModulePageActionIDs,',')
    

	select top 1 
		ap.AssignedPermissionID,
		ap.RoleID,
		r.Name as RoleName,
		ap.ModulePageActionID,
		m.Name as ModuleName,
		mp.Name as ModulePageName,
		mpa.Name as ModulePageActionName,
		ap.CreatedBy,
		ap.CreatedOn,
		ap.CreatedByIP,
		ap.ModifiedBy,
		ap.ModifiedOn,
		cusr.FirstName+' '+cusr.LastName as CreatedByUserName,
		musr.FirstName+' '+musr.LastName as ModifiedByUserName
	from tbl_AssignedPermission ap
	inner join tbl_ModulePageAction mpa on mpa.ModulePageActionID = ap.ModulePageActionID
	inner join tbl_Roles r on r.RoleID = ap.RoleID
	inner join tbl_ModulePages mp on mp.ModulePageID = mpa.ModulePageID
	inner join tbl_Modules m on m.ModuleID = mp.ModuleID
	inner join tbl_Users as cusr on cusr.UserID = ap.CreatedBy
	inner join tbl_Users as musr on musr.UserID = ap.ModifiedBy
	where ap.RoleID = @RoleID


END

/*

usp_AssignedPermission_Add 
@RoleID = 2,
@ModulePageActionIDs = '5,6,7,8',
@CreatedBy = 1,
@CreatedOn = '2023-01-27 11:35:42.940',
@CreatedByIP = ''

*/
GO
/****** Object:  StoredProcedure [dbo].[usp_AssignedPermission_GetAll]    Script Date: 2/22/2023 4:57:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Aqib Ehsan>
-- Create date: <Feb 22,2023>
-- Description:	<Get All Assinged Permission>
-- =============================================
CREATE PROCEDURE [dbo].[usp_AssignedPermission_GetAll]
AS
BEGIN
	
	SET NOCOUNT ON;

	select 
		ap.AssignedPermissionID,
		ap.RoleID,
		r.Name as RoleName,
		ap.ModulePageActionID,
		m.Name as ModuleName,
		mp.Name as ModulePageName,
		mpa.Name as ModulePageActionName,
		ap.CreatedBy,
		ap.CreatedOn,
		ap.CreatedByIP,
		ap.ModifiedBy,
		ap.ModifiedOn,
		cusr.FirstName+' '+cusr.LastName as CreatedByUserName,
		musr.FirstName+' '+musr.LastName as ModifiedByUserName
	from tbl_AssignedPermission ap
	inner join tbl_ModulePageAction mpa on mpa.ModulePageActionID = ap.ModulePageActionID
	inner join tbl_Roles r on r.RoleID = ap.RoleID
	inner join tbl_ModulePages mp on mp.ModulePageID = mpa.ModulePageID
	inner join tbl_Modules m on m.ModuleID = mp.ModuleID
	inner join tbl_Users as cusr on cusr.UserID = ap.CreatedBy
	inner join tbl_Users as musr on musr.UserID = ap.ModifiedBy

END


/*

usp_AssignedPermission_GetAll

*/
GO
/****** Object:  StoredProcedure [dbo].[usp_AssignedPermission_Update]    Script Date: 2/22/2023 4:57:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Aqib Ehsan>
-- Create date: <Feb 22,2023>
-- Description:	<Update Assigned Permission>
-- =============================================
CREATE PROCEDURE [dbo].[usp_AssignedPermission_Update]
@RoleID	int,
@ModulePageActionIDs nvarchar(max),
@CreatedBy int,
@CreatedOn datetime,
@CreatedByIP nvarchar
AS
BEGIN
	
	SET NOCOUNT ON;

	delete from tbl_AssignedPermission where RoleID = @RoleID

	insert into tbl_AssignedPermission
	(
		RoleID,
		ModulePageActionID,
		CreatedBy,
		CreatedOn,
		CreatedByIP,
		ModifiedBy,
		ModifiedOn,
		ModifiedByIP
	)
	select 
		@RoleID,
		Item,
		@CreatedBy,
		@CreatedOn,
		@CreatedByIP,
		@CreatedBy,
		@CreatedOn,
		@CreatedByIP
	from SplitString(@ModulePageActionIDs,',')
    

	select top 1 
		ap.AssignedPermissionID,
		ap.RoleID,
		r.Name as RoleName,
		ap.ModulePageActionID,
		m.Name as ModuleName,
		mp.Name as ModulePageName,
		mpa.Name as ModulePageActionName,
		ap.CreatedBy,
		ap.CreatedOn,
		ap.CreatedByIP,
		ap.ModifiedBy,
		ap.ModifiedOn,
		cusr.FirstName+' '+cusr.LastName as CreatedByUserName,
		musr.FirstName+' '+musr.LastName as ModifiedByUserName
	from tbl_AssignedPermission ap
	inner join tbl_ModulePageAction mpa on mpa.ModulePageActionID = ap.ModulePageActionID
	inner join tbl_Roles r on r.RoleID = ap.RoleID
	inner join tbl_ModulePages mp on mp.ModulePageID = mpa.ModulePageID
	inner join tbl_Modules m on m.ModuleID = mp.ModuleID
	inner join tbl_Users as cusr on cusr.UserID = ap.CreatedBy
	inner join tbl_Users as musr on musr.UserID = ap.ModifiedBy
	where ap.RoleID = @RoleID


END

/*

usp_AssignedPermission_Update
@RoleID = 2,
@ModulePageIDs = '5,6,7,8',
@CreatedBy = 1,
@CreatedOn = '2023-01-27 11:35:42.940',
@CreatedByIP = ''

*/
GO
/****** Object:  StoredProcedure [dbo].[usp_Branch_Add]    Script Date: 2/22/2023 4:57:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Aqib Ehsan>
-- Create date: <Feb 22,2023>
-- Description:	<Add Branch>
-- =============================================
CREATE PROCEDURE [dbo].[usp_Branch_Add]
@CompanyID	int,
@BranchName	nvarchar(200),
@CreatedBy	int,
@CreatedOn	datetime,
@CreatedByIP	nvarchar(200)
AS
BEGIN
	
	SET NOCOUNT ON;

	declare @BranchID int;

	insert into tbl_Branch
	(
		CompanyID,
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
		@CompanyID,
		@BranchName,
		@CreatedBy,
		@CreatedOn,
		@CreatedByIP,
		@CreatedBy,
		@CreatedOn,
		@CreatedByIP
	)

	SET @BranchID = SCOPE_IDENTITY();
    
	select 
	Name as BranchName 
	from tbl_Branch where  BranchID = @BranchID

END

/*

usp_Branch_Add
@CompanyID = 1,
@BranchName = 'Karachi b',
@CreatedBy = 1,
@CreatedOn = '2023-01-12 11:06:22.620',
@CreatedByIP = ''

*/
GO
/****** Object:  StoredProcedure [dbo].[usp_Branch_GetAll]    Script Date: 2/22/2023 4:57:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Aqib Ehsan>
-- Create date: <Feb 22,2023>
-- Description:	<Get All Branches>
-- =============================================
CREATE PROCEDURE [dbo].[usp_Branch_GetAll] 
AS
BEGIN
	
	SET NOCOUNT ON;

    select
		b.BranchID,
		b.CompanyID,
		cmpy.Name as CompanyName,
		b.Name as BranchName,
		b.CreatedBy,
		b.CreatedOn,
		b.CreatedByIP,
		b.ModifiedBy,
		b.ModifiedOn,
		b.ModifiedByIP,
		cusr.FirstName+' '+cusr.LastName as CreatedByUserName,
		musr.FirstName+' '+musr.LastName as ModifiedByUserName
	from tbl_Branch b
	inner join tbl_Company cmpy on cmpy.CompanyID = b.CompanyID
	inner join tbl_Users as cusr on cusr.UserID = b.CreatedBy
	inner join tbl_Users as musr on musr.UserID = b.ModifiedBy
END


/*

usp_Branch_GetAll

*/
GO
/****** Object:  StoredProcedure [dbo].[usp_Branch_Update]    Script Date: 2/22/2023 4:57:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Aqib Ehsan>
-- Create date: <Feb 22,2023>
-- Description:	<Update Branch>
-- =============================================
CREATE PROCEDURE [dbo].[usp_Branch_Update]
@BranchID int,
@CompanyID	int,
@BranchName	nvarchar(200),
@ModifiedBy	int,
@ModifiedOn	datetime,
@ModifiedByIP	nvarchar(200)
AS
BEGIN
	
	SET NOCOUNT ON;

	update tbl_Branch
	set CompanyID = @CompanyID,
		Name = @BranchName,
		ModifiedBy = @ModifiedBy,
		ModifiedOn = @ModifiedOn,
		ModifiedByIP = @ModifiedByIP
	where BranchID = @BranchID

	if(@@ROWCOUNT > 0)
	begin
		select 
		Name as BranchName 
		from tbl_Branch where  BranchID = @BranchID
	end

END

/*

usp_Branch_Update
@CompanyID = 1,
@BranchName = 'fsa fsdf ',
@ModifiedBy = 1,
@ModifiedOn = '2023-01-12 11:06:22.620',
@ModifiedByIP = '',
@BranchID = 1

*/
GO
/****** Object:  StoredProcedure [dbo].[usp_BusinessType_Add]    Script Date: 2/22/2023 4:57:59 PM ******/
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
/****** Object:  StoredProcedure [dbo].[usp_BusinessType_GetAll]    Script Date: 2/22/2023 4:57:59 PM ******/
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
/****** Object:  StoredProcedure [dbo].[usp_BusinessType_GetAllActive]    Script Date: 2/22/2023 4:57:59 PM ******/
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
/****** Object:  StoredProcedure [dbo].[usp_BusinessType_GetBusinessTypeByID]    Script Date: 2/22/2023 4:57:59 PM ******/
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
/****** Object:  StoredProcedure [dbo].[usp_BusinessType_Update]    Script Date: 2/22/2023 4:57:59 PM ******/
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
/****** Object:  StoredProcedure [dbo].[usp_City_Add]    Script Date: 2/22/2023 4:57:59 PM ******/
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
/****** Object:  StoredProcedure [dbo].[usp_City_GetAll]    Script Date: 2/22/2023 4:57:59 PM ******/
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
/****** Object:  StoredProcedure [dbo].[usp_City_GetCityByID]    Script Date: 2/22/2023 4:57:59 PM ******/
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
/****** Object:  StoredProcedure [dbo].[usp_City_Update]    Script Date: 2/22/2023 4:57:59 PM ******/
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
/****** Object:  StoredProcedure [dbo].[usp_Company_Add]    Script Date: 2/22/2023 4:57:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Aqib Ehsan>
-- Create date: <Feb 22,2023>
-- Description:	<Add Company>
-- =============================================
CREATE PROCEDURE [dbo].[usp_Company_Add]
@CompanyName	nvarchar(200),
@PostalPhone	nvarchar(200),
@PostalAddress1	nvarchar(200),
@PostalAddress2	nvarchar(200),
@PostalCityID	int,
@PostalStateID	int,
@PostalZipCode	nvarchar(200),
@PostalCountryID	int,
@BillingPhone	nvarchar(200),
@BillingAddress1	nvarchar(200),
@BillingAddress2	nvarchar(200),
@BillingCityID	int,
@BillingStateID	int,
@BillingZipCode	nvarchar(200),
@BillingCountryID	int,
@CompanyLogo	nvarchar(max),
@NTN	nvarchar(200),
@STN	nvarchar(200),
@WebsiteURL	nvarchar(200),
@POSID	nvarchar(200),
@BusinessTypeID	int,
@TimeZoneID	int,
@NoOfUsers	int,
@IsAllowPowerBy	int,
@PoweredBy	nvarchar(200),
@CreatedBy	int,
@CreatedOn	datetime,
@CreatedByIP	nvarchar(200)
AS
BEGIN
	
	SET NOCOUNT ON;

	declare @CompanyID int;

	insert into tbl_Company
	(
			Name,
		PostalPhone,
		PostalAddress1,
		PostalAddress2,
		PostalCityID,
		PostalStateID,
		PostalZipCode,
		PostalCountryID,
		BillingPhone,
		BillingAddress1,
		BillingAddress2,
		BillingCityID,
		BillingStateID,
		BillingZipCode,
		BillingCountryID,
		CompanyLogo,
		NTN,
		STN,
		WebsiteURL,
		POSID,
		BusinessTypeID,
		TimeZoneID,
		NoOfUsers,
		IsAllowPowerBy,
		PoweredBy,
		CreatedBy,
		CreatedOn,
		CreatedByIP,
		ModifiedBy,
		ModifiedOn,
		ModifiedByIP
	)
	values
	(
		@CompanyName,
		@PostalPhone,
		@PostalAddress1,
		@PostalAddress2,
		@PostalCityID,
		@PostalStateID,
		@PostalZipCode,
		@PostalCountryID,
		@BillingPhone,
		@BillingAddress1,
		@BillingAddress2,
		@BillingCityID,
		@BillingStateID,
		@BillingZipCode,
		@BillingCountryID,
		@CompanyLogo,
		@NTN,
		@STN,
		@WebsiteURL,
		@POSID,
		@BusinessTypeID,
		@TimeZoneID,
		@NoOfUsers,
		@IsAllowPowerBy,
		@PoweredBy,
		@CreatedBy,
		@CreatedOn,
		@CreatedByIP,
		@CreatedBy,
		@CreatedOn,
		@CreatedByIP
	)

	SET @CompanyID = SCOPE_IDENTITY();

	select CompanyID,Name as CompanyName 
	from tbl_Company 
	where CompanyID = @CompanyID

END

/*

usp_Company_Add
@CompanyName = 'asdf',
@PostalPhone = 'asdf',
@PostalAddress1 = 'asdf',
@PostalAddress2 = 'asdf',
@PostalCityID = 1,
@PostalStateID = 1,
@PostalZipCode = 'asdf',
@PostalCountryID = 1,
@BillingPhone = 'asdf',
@BillingAddress1 = 'sdf',
@BillingAddress2 = 'rqw',
@BillingCityID = 1,
@BillingStateID = 1,
@BillingZipCode = 'wr',
@BillingCountryID = 1,
@CompanyLogo = 'wer',
@NTN = 'gdfrte',
@STN = 'gdfrte',
@WebsiteURL = 'vxcv',
@POSID = 'xvx',
@BusinessTypeID = 1,
@TimeZoneID = 1,
@NoOfUsers = 1,
@IsAllowPowerBy = 1,
@PoweredBy = 'kghjtyoy',
@CreatedBy = 1,
@CreatedOn = '2023-01-12 11:04:16.637',
@CreatedByIP = ''

*/
GO
/****** Object:  StoredProcedure [dbo].[usp_Company_GetAll]    Script Date: 2/22/2023 4:57:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Aqib Ehsan>
-- Create date: <Feb 22,2023>
-- Description:	<Get All Company>
-- =============================================
CREATE PROCEDURE [dbo].[usp_Company_GetAll]
AS
BEGIN

	SET NOCOUNT ON;

	select 
		c.CompanyID,
		c.Name as CompanyName,
		c.PostalPhone,
		c.PostalAddress1,
		c.POstalAddress2,
		c.PostalCityID,
		pc.Name as PostalCityName,
		c.PostalStateID,
		ps.Name as PostalStateName,
		c.PostalZipCode,
		c.PostalCountryID,
		pcon.Name as PostalCountryName,
		c.BillingPhone,
		c.BillingAddress1,
		c.BillingAddress2,
		c.BillingCityID,
		bc.Name as BillingCityName,
		c.BillingStateID,
		bs.Name as BillingStateName,
		c.BillingZipCode,
		c.BillingCountryID,
		bcon.Name as BillingCountryName,
		c.CompanyLogo,
		c.NTN,
		c.STN,
		c.WebsiteURL,
		c.POSID,
		c.BusinessTypeID,
		bt.Name as BusinessTypeName,
		c.TimeZoneID,
		tz.Name as TimeZoneName,
		c.NoOfUsers,
		c.IsAllowPowerBy,
		c.PoweredBy,
		c.CreatedBy,
		c.CreatedOn,
		c.CreatedByIP,
		c.ModifiedBy,
		c.ModifiedOn,
		c.ModifiedByIP,
		cusr.FirstName+' '+cusr.LastName as CreatedByUserName,
		musr.FirstName+' '+musr.LastName as ModifiedByUserName 
	from tbl_Company c
	inner join tbl_City pc on pc.CityID = c.PostalCityID
	inner join tbl_State ps on ps.StateID = c.PostalStateID
	inner join tbl_Country pcon on pcon.CountryID = c.PostalCountryID
	inner join tbl_City bc on pc.CityID = c.BillingCityID
	inner join tbl_State bs on ps.StateID = c.BillingStateID
	inner join tbl_Country bcon on pcon.CountryID = c.BillingCountryID
	inner join tbl_BusinessType bt on bt.BusinessTypeID = c.BusinessTypeID
	inner join tbl_TimeZones tz on tz.TimeZoneID = c.TimeZoneID
	inner join tbl_Users as cusr on cusr.UserID = c.CreatedBy
	inner join tbl_Users as musr on musr.UserID = c.ModifiedBy

END

/*

usp_Company_GetAll

*/
GO
/****** Object:  StoredProcedure [dbo].[usp_Company_Update]    Script Date: 2/22/2023 4:57:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Aqib Ehsan>
-- Create date: <Feb 22,2023>
-- Description:	<Update Company>
-- =============================================
CREATE PROCEDURE [dbo].[usp_Company_Update]
@CompanyID int,
@CompanyName	nvarchar(200),
@PostalPhone	nvarchar(200),
@PostalAddress1	nvarchar(200),
@PostalAddress2	nvarchar(200),
@PostalCityID	int,
@PostalStateID	int,
@PostalZipCode	nvarchar(200),
@PostalCountryID	int,
@BillingPhone	nvarchar(200),
@BillingAddress1	nvarchar(200),
@BillingAddress2	nvarchar(200),
@BillingCityID	int,
@BillingStateID	int,
@BillingZipCode	nvarchar(200),
@BillingCountryID	int,
@CompanyLogo	nvarchar(max),
@NTN	nvarchar(200),
@STN	nvarchar(200),
@WebsiteURL	nvarchar(200),
@POSID	nvarchar(200),
@BusinessTypeID	int,
@TimeZoneID	int,
@NoOfUsers	int,
@IsAllowPowerBy	int,
@PoweredBy	nvarchar(200),
@ModifiedBy	int,
@ModifiedOn	datetime,
@ModifiedByIP	nvarchar(200)
AS
BEGIN
	
	SET NOCOUNT ON;

	update tbl_Company
	set Name = @CompanyName,
		PostalPhone = PostalPhone,
		PostalAddress1 = @PostalAddress1,
		PostalAddress2 = @PostalAddress2,
		PostalCityID = @PostalCityID,
		PostalStateID = @PostalStateID,
		PostalZipCode = @PostalZipCode,
		PostalCountryID = @PostalCountryID,
		BillingPhone = @BillingPhone,
		BillingAddress1 = @BillingAddress1,
		BillingAddress2 = @BillingAddress2,
		BillingCityID = @BillingCityID,
		BillingStateID = @BillingStateID,
		BillingZipCode = @BillingZipCode,
		BillingCountryID = @BillingCountryID,
		CompanyLogo = @CompanyLogo,
		NTN = @NTN,
		STN = @STN,
		WebsiteURL = @WebsiteURL,
		POSID = @POSID,
		BusinessTypeID = @BusinessTypeID,
		TimeZoneID = @TimeZoneID,
		NoOfUsers = @NoOfUsers,
		IsAllowPowerBy = @IsAllowPowerBy,
		PoweredBy = @PoweredBy,
		ModifiedBy = @ModifiedBy,
		ModifiedOn = @ModifiedOn,
		ModifiedByIP = @ModifiedByIP
	where CompanyID = @CompanyID

	if(@@ROWCOUNT > 0)
	begin
		select CompanyID,Name as CompanyName 
		from tbl_Company 
		where CompanyID = @CompanyID
	end

END

/*

usp_Company_Update
@CompanyID = 1,
@CompanyName = 'ouoljkljk,n,nm,',
@PostalPhone = 'asdf',
@PostalAddress1 = 'asdf',
@PostalAddress2 = 'asdf',
@PostalCityID = 1,
@PostalStateID = 1,
@PostalZipCode = 'asdf',
@PostalCountryID = 1,
@BillingPhone = 'asdf',
@BillingAddress1 = 'sdf',
@BillingAddress2 = 'rqw',
@BillingCityID = 1,
@BillingStateID = 1,
@BillingZipCode = 'wr',
@BillingCountryID = 1,
@CompanyLogo = 'wer',
@NTN = 'gdfrte',
@STN = 'gdfrte',
@WebsiteURL = 'vxcv',
@POSID = 'xvx',
@BusinessTypeID = 1,
@TimeZoneID = 1,
@NoOfUsers = 1,
@IsAllowPowerBy = 1,
@PoweredBy = 'kghjtyoy',
@ModifiedBy = 1,
@ModifiedOn = '2023-01-12 11:04:16.637',
@ModifiedByIP = ''

*/
GO
/****** Object:  StoredProcedure [dbo].[usp_Country_Add]    Script Date: 2/22/2023 4:57:59 PM ******/
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
/****** Object:  StoredProcedure [dbo].[usp_Country_GetAll]    Script Date: 2/22/2023 4:57:59 PM ******/
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
/****** Object:  StoredProcedure [dbo].[usp_Country_GetCountryByID]    Script Date: 2/22/2023 4:57:59 PM ******/
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
/****** Object:  StoredProcedure [dbo].[usp_Country_Update]    Script Date: 2/22/2023 4:57:59 PM ******/
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
/****** Object:  StoredProcedure [dbo].[usp_Module_Add]    Script Date: 2/22/2023 4:57:59 PM ******/
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
/****** Object:  StoredProcedure [dbo].[usp_Module_GetAll]    Script Date: 2/22/2023 4:57:59 PM ******/
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
/****** Object:  StoredProcedure [dbo].[usp_Module_GetAllActive]    Script Date: 2/22/2023 4:57:59 PM ******/
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
/****** Object:  StoredProcedure [dbo].[usp_Module_GetModuleByID]    Script Date: 2/22/2023 4:57:59 PM ******/
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
/****** Object:  StoredProcedure [dbo].[usp_Module_Update]    Script Date: 2/22/2023 4:57:59 PM ******/
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
/****** Object:  StoredProcedure [dbo].[usp_ModulePage_Add]    Script Date: 2/22/2023 4:57:59 PM ******/
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
/****** Object:  StoredProcedure [dbo].[usp_ModulePage_Update]    Script Date: 2/22/2023 4:57:59 PM ******/
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
/****** Object:  StoredProcedure [dbo].[usp_ModulePageAction_Add]    Script Date: 2/22/2023 4:57:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Aqib Ehsan>
-- Create date: <Feb 22,2023>
-- Description:	<Add Module Page Actions>
-- =============================================
CREATE PROCEDURE [dbo].[usp_ModulePageAction_Add] 
@ModulePageID int,
@ModulePageActionNames nvarchar(200),
@CreatedBy int,
@CreatedOn datetime,
@CreatedByIP nvarchar(200)
AS
BEGIN
	
	SET NOCOUNT ON;

    insert into tbl_ModulePageAction
	(
		ModulePageID,
		Name,
		CreatedBy,
		CreatedOn,
		CreatedByIP,
		ModifiedBy,
		ModifiedOn,
		ModifiedByIP
	)
	select 
		@ModulePageID,
		Item,
		@CreatedBy,
		@CreatedOn,
		@CreatedByIP,
		@CreatedBy,
		@CreatedOn,
		@CreatedByIP
	from SplitString(@ModulePageActionNames,',')
END

/*

usp_ModulePageAction_Add
@ModulePageID = 0,
@ModulePageActionNames = '',
@CreatedBy = 0,
@CreatedOn = '',
@CreatedByIP = ''

*/
GO
/****** Object:  StoredProcedure [dbo].[usp_ModulePages_GetAll]    Script Date: 2/22/2023 4:57:59 PM ******/
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
/****** Object:  StoredProcedure [dbo].[usp_ModulePages_GetAllActive]    Script Date: 2/22/2023 4:57:59 PM ******/
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
/****** Object:  StoredProcedure [dbo].[usp_ModulePages_GetModulePageByID]    Script Date: 2/22/2023 4:57:59 PM ******/
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
/****** Object:  StoredProcedure [dbo].[usp_Product_Add]    Script Date: 2/22/2023 4:57:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Aqib Ehsan>
-- Create date: <Feb 15,2023>
-- Description:	<Add Product>
-- =============================================
CREATE PROCEDURE [dbo].[usp_Product_Add]
@ProductName nvarchar(200),
@Description nvarchar(200),
@ProductAttributeID int,
@ProductBrandID int,
@ProductTypeID int,
@ProductCategoryID int,
@ProductImage nvarchar(max),
@MinStock int,
@MaxStock int,
@ReOrderLevel int,
@ManageStock int,
@CostPrice decimal(18,2),
@UserDefinedCostPrice decimal(18,2),
@PurchasePrice decimal(18,2),
@RetailPrice decimal(18,2),
@ProfitMarginPercentage int,
@ProfitMarginAmount decimal(18,2),
@IsActive int,
@CreatedBy int,
@CreatedOn datetime,
@CreatedByIP nvarchar(200),
@CompanyID int
AS
BEGIN
	
	SET NOCOUNT ON;

	declare @ProductID int;

	insert into tbl_Product
	(
		Name,
		Description,
		ProductAttributeID,
		ProductBrandID,
		ProductTypeID,
		ProductCategoryID,
		ProductImage,
		MinStock,
		MaxStock,
		ReOrderLevel,
		ManageStock,
		CostPrice,
		UserDefinedCostPrice,
		PurchasePrice,
		RetailPrice,
		ProfitMarginPercentage,
		ProfitMarginAmount,
		IsActive,
		CreatedBy,
		CreatedOn,
		CreatedByIP,
		ModifiedBy,
		ModifiedOn,
		ModifiedByIP,
		CompanyID
	)
	values
	(
		@ProductName,
		@Description,
		@ProductAttributeID,
		@ProductBrandID,
		@ProductTypeID,
		@ProductCategoryID,
		@ProductImage,
		@MinStock,
		@MaxStock,
		@ReOrderLevel,
		@ManageStock,
		@CostPrice,
		@UserDefinedCostPrice,
		@PurchasePrice,
		@RetailPrice,
		@ProfitMarginPercentage,
		@ProfitMarginAmount,
		@IsActive,
		@CreatedBy,
		@CreatedOn,
		@CreatedByIP,
		@CreatedBy,
		@CreatedOn,
		@CreatedByIP,
		@CompanyID
	)

	set @ProductID = SCOPE_IDENTITY()

	select 
		p.productID,
		p.Name as ProductName,
		p.Description
	from tbl_Product p
	where p.productID = @ProductID
END


/*

usp_Product_Add
@ProductName = 'test',
@Description = 'testing',
@ProductAttributeID = 1,
@ProductBrandID = 2,
@ProductTypeID = 1,
@ProductCategoryID = 3,
@ProductImage = '',
@MinStock = 4,
@MaxStock = 6,
@ReOrderLevel = 2,
@ManageStock = 1,
@CostPrice = '2.00',
@UserDefinedCostPrice = '1.21',
@PurchasePrice = '2.54',
@RetailPrice = '2.89',
@ProfitMarginPercentage = 2,
@ProfitMarginAmount = '20.32',
@IsActive = 1,
@CreatedBy = 1,
@CreatedOn = '2023-01-12 13:06:24.380',
@CreatedByIP = '',
@CompanyID = 1

*/
GO
/****** Object:  StoredProcedure [dbo].[usp_Product_Attribute_Brand_Category_Type_GetAll]    Script Date: 2/22/2023 4:57:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Aqib Ehsan>
-- Create date: <Feb 20.2023>
-- Description:	<Get All Product Attribute, Brand, Category, Type>
-- =============================================
CREATE PROCEDURE [dbo].[usp_Product_Attribute_Brand_Category_Type_GetAll]
	
AS
BEGIN
	
	SET NOCOUNT ON;

    select  ProductAttributeID,name as ProductAttributeName 
	from tbl_ProductAttributes
	order by Name asc

	select ProductBrandID, Name as ProductBrandName 
	from tbl_ProductBrands
	order by Name asc

	select ProductCategoryID,Name as ProductCategoryName 
	from tbl_ProductCategory

	order by Name asc
	select ProductTypeID,Name as ProductTypeName 
	from tbl_ProductTypes
	order by Name asc
END

/*

exec usp_Product_Attribute_Brand_Category_Type_GetAll

*/
GO
/****** Object:  StoredProcedure [dbo].[usp_Product_GetAll]    Script Date: 2/22/2023 4:57:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Aqib Ehsan>
-- Create date: <Feb 15,2023>
-- Description:	<Get All Product>
-- =============================================
CREATE PROCEDURE [dbo].[usp_Product_GetAll]
AS
BEGIN
	
	SET NOCOUNT ON;


	select 
		p.productID,
		p.Name as ProductName,
		p.Description,
		p.ProductAttributeID,
		pa.Name as ProductAttributeName,
		p.ProductBrandID,
		pb.Name as ProductBrandName,
		p.ProductTypeID,
		pt.Name as ProductTypeName,
		p.ProductCategoryID,
		pc.Name as ProductCategoryName,
		p.ProductImage,
		p.MinStock,
		p.MaxStock,
		p.ReOrderLevel,
		p.ManageStock,
		p.CostPrice,
		p.UserDefinedCostPrice,
		p.PurchasePrice,
		p.RetailPrice,
		p.ProfitMarginPercentage,
		p.ProfitMarginAmount,
		p.IsActive,
		p.CreatedBy,
		p.CreatedOn,
		p.CreatedByIP,
		p.ModifiedBy,
		p.ModifiedOn,
		p.ModifiedByIP,
		p.CompanyID,
		c.Name as CompanyName,
		cusr.FirstName+' '+cusr.LastName as CreatedByUserName,
		musr.FirstName+' '+musr.LastName as ModifiedByUserName
	from tbl_Product p
	inner join tbl_ProductAttributes pa on pa.ProductAttributeID = p.ProductAttributeID
	inner join tbl_ProductBrands pb on pb.ProductBrandID = p.ProductBrandID
	inner join tbl_ProductTypes pt on pt.ProductTypeID = p.ProductTypeID
	inner join tbl_ProductCategory pc on pc.ProductCategoryID = p.ProductCategoryID
	inner join tbl_Company c on c.CompanyID = p.CompanyID
	inner join tbl_Users as cusr on cusr.UserID = p.CreatedBy
	inner join tbl_Users as musr on musr.UserID = p.ModifiedBy
END


/*

usp_Product_GetAll

*/
GO
/****** Object:  StoredProcedure [dbo].[usp_Product_GetAllActive]    Script Date: 2/22/2023 4:57:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Aqib Ehsan>
-- Create date: <Feb 15,2023>
-- Description:	<Get All Active Product>
-- =============================================
CREATE PROCEDURE [dbo].[usp_Product_GetAllActive]
AS
BEGIN
	
	SET NOCOUNT ON;


	select 
		p.productID,
		p.Name as ProductName,
		p.Description,
		p.ProductAttributeID,
		pa.Name as ProductAttributeName,
		p.ProductBrandID,
		pb.Name as ProductBrandName,
		p.ProductTypeID,
		pt.Name as ProductTypeName,
		p.ProductCategoryID,
		pc.Name as ProductCategoryName,
		p.ProductImage,
		p.MinStock,
		p.MaxStock,
		p.ReOrderLevel,
		p.ManageStock,
		p.CostPrice,
		p.UserDefinedCostPrice,
		p.PurchasePrice,
		p.RetailPrice,
		p.ProfitMarginPercentage,
		p.ProfitMarginAmount,
		p.IsActive,
		p.CreatedBy,
		p.CreatedOn,
		p.CreatedByIP,
		p.ModifiedBy,
		p.ModifiedOn,
		p.ModifiedByIP, 
		p.CompanyID,
		c.Name as CompanyName,
		cusr.FirstName+' '+cusr.LastName as CreatedByUserName,
		musr.FirstName+' '+musr.LastName as ModifiedByUserName
	from tbl_Product p
	inner join tbl_ProductAttributes pa on pa.ProductAttributeID = p.ProductAttributeID
	inner join tbl_ProductBrands pb on pb.ProductBrandID = p.ProductBrandID
	inner join tbl_ProductTypes pt on pt.ProductTypeID = p.ProductTypeID
	inner join tbl_ProductCategory pc on pc.ProductCategoryID = p.ProductCategoryID
	inner join tbl_Company c on c.CompanyID = p.CompanyID
	inner join tbl_Users as cusr on cusr.UserID = p.CreatedBy
	inner join tbl_Users as musr on musr.UserID = p.ModifiedBy
	where p.IsActive = 1
END


/*

usp_Product_GetAllActive

*/
GO
/****** Object:  StoredProcedure [dbo].[usp_Product_GetProductByID]    Script Date: 2/22/2023 4:57:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Aqib Ehsan>
-- Create date: <Feb 15,2023>
-- Description:	<Get Product By ID>
-- =============================================
CREATE PROCEDURE [dbo].[usp_Product_GetProductByID]
@ProductID int
AS
BEGIN
	
	SET NOCOUNT ON;


	select 
		p.productID,
		p.Name as ProductName,
		p.Description,
		p.ProductAttributeID,
		p.ProductBrandID,
		p.ProductTypeID,
		p.ProductCategoryID,
		p.ProductImage,
		p.MinStock,
		p.MaxStock,
		p.ReOrderLevel,
		p.ManageStock,
		p.CostPrice,
		p.UserDefinedCostPrice,
		p.PurchasePrice,
		p.RetailPrice,
		p.ProfitMarginPercentage,
		p.ProfitMarginAmount,
		p.IsActive,
		p.CreatedBy,
		p.CreatedOn,
		p.CreatedByIP,
		p.ModifiedBy,
		p.ModifiedOn,
		p.ModifiedByIP,
		p.CompanyID
	from tbl_Product p
	where p.productID = @ProductID
END


/*

usp_Product_GetProductByID @ProductID = 1

*/
GO
/****** Object:  StoredProcedure [dbo].[usp_Product_Update]    Script Date: 2/22/2023 4:57:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Aqib Ehsan>
-- Create date: <Feb 15,2023>
-- Description:	<Update Product>
-- =============================================
CREATE PROCEDURE [dbo].[usp_Product_Update]
@ProductID int,
@ProductName nvarchar(200),
@Description nvarchar(200),
@ProductAttributeID int,
@ProductBrandID int,
@ProductTypeID int,
@ProductCategoryID int,
@ProductImage nvarchar(max),
@MinStock int,
@MaxStock int,
@ReOrderLevel int,
@ManageStock int,
@CostPrice decimal(18,2),
@UserDefinedCostPrice decimal(18,2),
@PurchasePrice decimal(18,2),
@RetailPrice decimal(18,2),
@ProfitMarginPercentage int,
@ProfitMarginAmount decimal(18,2),
@IsActive int,
@ModifiedBy int,
@ModifiedOn datetime,
@ModifiedByIP nvarchar(200),
@CompanyID int
AS
BEGIN
	
	SET NOCOUNT ON;

	update tbl_Product
	set Name = @ProductName,
		Description = @Description,
		ProductAttributeID = @ProductAttributeID,
		ProductBrandID= @ProductBrandID,
		ProductTypeID = @ProductTypeID,
		ProductCategoryID = @ProductCategoryID,
		ProductImage = @ProductImage,
		MinStock = @MinStock,
		MaxStock = @MaxStock,
		ReOrderLevel = @ReOrderLevel,
		ManageStock = @ManageStock,
		CostPrice = @CostPrice,
		UserDefinedCostPrice = @UserDefinedCostPrice,
		PurchasePrice = @PurchasePrice,
		RetailPrice = @RetailPrice,
		ProfitMarginPercentage = @ProfitMarginPercentage,
		ProfitMarginAmount = @ProfitMarginAmount,
		IsActive = @IsActive,
		ModifiedBy = @ModifiedBy,
		ModifiedOn = @ModifiedOn,
		ModifiedByIP = @ModifiedByIP,
		CompanyID = @CompanyID
	where productID = @ProductID

	if(@@ROWCOUNT > 0)
	begin
		select 
			p.productID,
			p.Name as ProductName,
			p.Description
		from tbl_Product p
		where p.productID = @ProductID
	end
END


/*

usp_Product_Update
@ProductName = 'test asdf',
@Description = 'testing',
@ProductAttributeID = 1,
@ProductBrandID = 2,
@ProductTypeID = 1,
@ProductCategoryID = 3,
@ProductImage = '',
@MinStock = 4,
@MaxStock = 6,
@ReOrderLevel = 2,
@ManageStock = 1,
@CostPrice = '2.00',
@UserDefinedCostPrice = '1.21',
@PurchasePrice = '2.54',
@RetailPrice = '2.89',
@ProfitMarginPercentage = 2,
@ProfitMarginAmount = '20.32',
@IsActive = 1,
@CreatedBy = 1,
@CreatedOn = '2023-01-12 13:06:24.380',
@CreatedByIP = '',
@ProductID = 1,
@CompanyID = 1

*/
GO
/****** Object:  StoredProcedure [dbo].[usp_ProductAttribute_Add]    Script Date: 2/22/2023 4:57:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Aqib Ehsan>
-- Create date: <Feb 14,2023>
-- Description:	<Add Product Attribute>
-- =============================================
create PROCEDURE [dbo].[usp_ProductAttribute_Add]
@ProductAttributeName nvarchar(200),
@CreatedBy int,
@CreatedOn datetime,
@CreatedByIP nvarchar(200)
AS
BEGIN
	
	SET NOCOUNT ON;

	declare @ProductAttributeID int;

	insert into tbl_ProductAttributes
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
		@ProductAttributeName,
		@CreatedBy,
		@CreatedOn,
		@CreatedByIP,
		@CreatedBy,
		@CreatedOn,
		@CreatedByIP
	)

	SET @ProductAttributeID = SCOPE_IDENTITY();

	select 
		pa.ProductAttributeID,
		pa.Name as ProductAttributeName
	from tbl_ProductAttributes pa
	where pa.ProductAttributeID = @ProductAttributeID
END


/*

usp_ProductAttribute_Add @ProductAttributeName = 'asdfasf',@CreatedBy = 1,@CreatedOn = '2023-01-12 10:55:29.930',@CreatedByIP = ''

*/
GO
/****** Object:  StoredProcedure [dbo].[usp_ProductAttribute_GetAll]    Script Date: 2/22/2023 4:57:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Aqib Ehsan>
-- Create date: <Feb 14,2023>
-- Description:	<Get All Product Attribute>
-- =============================================
CREATE PROCEDURE [dbo].[usp_ProductAttribute_GetAll]
AS
BEGIN
	
	SET NOCOUNT ON;


	select 
		pa.ProductAttributeID,
		pa.Name as ProductAttributeName,
		pa.CreatedBy,
		pa.CreatedOn,
		pa.CreatedByIP,
		pa.ModifiedBy,
		pa.ModifiedOn,
		pa.ModifiedByIP,
		cusr.FirstName+' '+cusr.LastName as CreatedByUserName,
		musr.FirstName+' '+musr.LastName as ModifiedByUserName
	from tbl_ProductAttributes pa
	inner join tbl_Users as cusr on cusr.UserID = pa.CreatedBy
	inner join tbl_Users as musr on musr.UserID = pa.ModifiedBy
END


/*

usp_ProductAttribute_GetAll

*/
GO
/****** Object:  StoredProcedure [dbo].[usp_ProductAttribute_GetProductAttributeByID]    Script Date: 2/22/2023 4:57:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Aqib Ehsan>
-- Create date: <Feb 14,2023>
-- Description:	<Get Product Attribute By ID>
-- =============================================
create PROCEDURE [dbo].[usp_ProductAttribute_GetProductAttributeByID]
@ProductAttributeID int
AS
BEGIN
	
	SET NOCOUNT ON;


	select 
		pa.ProductAttributeID,
		pa.Name as ProductAttributeName,
		pa.CreatedBy,
		pa.CreatedOn,
		pa.CreatedByIP,
		pa.ModifiedBy,
		pa.ModifiedOn,
		pa.ModifiedByIP
	from tbl_ProductAttributes pa
	where pa.ProductAttributeID = @ProductAttributeID
END


/*

usp_ProductAttribute_GetProductAttributeByID @ProductAttributeID = 1

*/
GO
/****** Object:  StoredProcedure [dbo].[usp_ProductAttribute_Update]    Script Date: 2/22/2023 4:57:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Aqib Ehsan>
-- Create date: <Feb 14,2023>
-- Description:	<Add Product Attribute>
-- =============================================
CREATE PROCEDURE [dbo].[usp_ProductAttribute_Update]
@ProductAttributeID int,
@ProductAttributeName nvarchar(200),
@ModifiedBy int,
@ModifiedOn datetime,
@ModifiedByIP nvarchar(200)
AS
BEGIN
	
	SET NOCOUNT ON;

	update tbl_ProductAttributes
	set Name = @ProductAttributeName,
		ModifiedBy = @ModifiedBy,
		ModifiedOn = @ModifiedOn,
		ModifiedByIP = @ModifiedByIP
	where ProductAttributeID = @ProductAttributeID

	if(@@ROWCOUNT > 0)
	begin
		select 
		pa.ProductAttributeID,
		pa.Name as ProductAttributeName
		from tbl_ProductAttributes pa
		where pa.ProductAttributeID = @ProductAttributeID
	end
END


/*

usp_ProductAttribute_Update @ProductAttributeName = 'sdfsxvxvxcv',@ModifiedBy = 1,@ModifiedOn = '2023-01-12 10:55:29.930',@ModifiedByIP = '',@ProductAttributeID=1

*/
GO
/****** Object:  StoredProcedure [dbo].[usp_ProductBrand_Add]    Script Date: 2/22/2023 4:57:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Aqib Ehsan>
-- Create date: <Feb 14,2023>
-- Description:	<Add Product Brand>
-- =============================================
CREATE PROCEDURE [dbo].[usp_ProductBrand_Add]
@ProductBrandName nvarchar(200),
@CreatedBy int,
@CreatedOn datetime,
@CreatedByIP nvarchar(200)
AS
BEGIN
	
	SET NOCOUNT ON;

	declare @ProductBrandID int;

	insert into tbl_ProductBrands
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
		@ProductBrandName,
		@CreatedBy,
		@CreatedOn,
		@CreatedByIP,
		@CreatedBy,
		@CreatedOn,
		@CreatedByIP
	)

	SET @ProductBrandID = SCOPE_IDENTITY();

	select 
		pb.ProductBrandID,
		pb.Name as ProductBrandName
	from tbl_ProductBrands pb
	where pb.ProductBrandID = @ProductBrandID
END


/*

usp_ProductBrand_Add @ProductBrandName = 'xcfafa',@CreatedBy = 1,@CreatedOn = '2023-01-12 10:55:29.930',@CreatedByIP = ''

*/
GO
/****** Object:  StoredProcedure [dbo].[usp_ProductBrand_GetAll]    Script Date: 2/22/2023 4:57:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Aqib Ehsan>
-- Create date: <Feb 14,2023>
-- Description:	<Get All Product Brand>
-- =============================================
create PROCEDURE [dbo].[usp_ProductBrand_GetAll]
AS
BEGIN
	
	SET NOCOUNT ON;


	select 
		pb.ProductBrandID,
		pb.Name as ProductBrandName,
		pb.CreatedBy,
		pb.CreatedOn,
		pb.CreatedByIP,
		pb.ModifiedBy,
		pb.ModifiedOn,
		pb.ModifiedByIP,
		cusr.FirstName+' '+cusr.LastName as CreatedByUserName,
		musr.FirstName+' '+musr.LastName as ModifiedByUserName
	from tbl_ProductBrands pb
	inner join tbl_Users as cusr on cusr.UserID = pb.CreatedBy
	inner join tbl_Users as musr on musr.UserID = pb.ModifiedBy
END


/*

usp_ProductBrand_GetAll

*/
GO
/****** Object:  StoredProcedure [dbo].[usp_ProductBrand_GetProductBrandByID]    Script Date: 2/22/2023 4:57:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Aqib Ehsan>
-- Create date: <Feb 14,2023>
-- Description:	<Get Product Brand By ID>
-- =============================================
create PROCEDURE [dbo].[usp_ProductBrand_GetProductBrandByID]
@ProductBrandID int
AS
BEGIN
	
	SET NOCOUNT ON;


	select 
		pb.ProductBrandID,
		pb.Name as ProductBrandName,
		pb.CreatedBy,
		pb.CreatedOn,
		pb.CreatedByIP,
		pb.ModifiedBy,
		pb.ModifiedOn,
		pb.ModifiedByIP
	from tbl_ProductBrands pb
	where pb.ProductBrandID = @ProductBrandID
END


/*

usp_ProductBrand_GetProductBrandByID @ProductBrandID = 1

*/
GO
/****** Object:  StoredProcedure [dbo].[usp_ProductBrand_Update]    Script Date: 2/22/2023 4:57:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Aqib Ehsan>
-- Create date: <Feb 14,2023>
-- Description:	<Add Product Brand>
-- =============================================
create PROCEDURE [dbo].[usp_ProductBrand_Update]
@ProductBrandID int,
@ProductBrandName nvarchar(200),
@ModifiedBy int,
@ModifiedOn datetime,
@ModifiedByIP nvarchar(200)
AS
BEGIN
	
	SET NOCOUNT ON;

	update tbl_ProductBrands
	set Name = @ProductBrandName,
		ModifiedBy = @ModifiedBy,
		ModifiedOn = @ModifiedOn,
		ModifiedByIP = @ModifiedByIP
	where ProductBrandID = @ProductBrandID

	if(@@ROWCOUNT > 0)
	begin
		select 
		pb.ProductBrandID,
		pb.Name as ProductBrandName
		from tbl_ProductBrands pb
		where pb.ProductBrandID = @ProductBrandID
	end
END


/*

usp_ProductBrand_Update @ProductBrandName = 'sdfsxvxvxcv',@ModifiedBy = 1,@ModifiedOn = '2023-01-12 10:55:29.930',@ModifiedByIP = '',@ProductBrandID=1

*/
GO
/****** Object:  StoredProcedure [dbo].[usp_ProductCategory_Add]    Script Date: 2/22/2023 4:57:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Aqib Ehsan>
-- Create date: <Feb 14,2023>
-- Description:	<Add Product Category>
-- =============================================
create PROCEDURE [dbo].[usp_ProductCategory_Add]
@ProductCategoryName nvarchar(200),
@CreatedBy int,
@CreatedOn datetime,
@CreatedByIP nvarchar(200)
AS
BEGIN
	
	SET NOCOUNT ON;

	declare @ProductCategoryID int;

	insert into tbl_ProductCategory
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
		@ProductCategoryName,
		@CreatedBy,
		@CreatedOn,
		@CreatedByIP,
		@CreatedBy,
		@CreatedOn,
		@CreatedByIP
	)

	SET @ProductCategoryID = SCOPE_IDENTITY();

	select 
		pc.ProductCategoryID,
		pc.Name as ProductCategoryName
	from tbl_ProductCategory pc
	where pc.ProductCategoryID = @ProductCategoryID
END


/*

usp_ProductCategory_Add @ProductCategoryName = 'asdfasf',@CreatedBy = 1,@CreatedOn = '2023-01-12 10:55:29.930',@CreatedByIP = ''

*/
GO
/****** Object:  StoredProcedure [dbo].[usp_ProductCategory_GetAll]    Script Date: 2/22/2023 4:57:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Aqib Ehsan>
-- Create date: <Feb 14,2023>
-- Description:	<Get All Product Category>
-- =============================================
create PROCEDURE [dbo].[usp_ProductCategory_GetAll]
AS
BEGIN
	
	SET NOCOUNT ON;


	select 
		pc.ProductCategoryID,
		pc.Name as ProductCategoryName,
		pc.CreatedBy,
		pc.CreatedOn,
		pc.CreatedByIP,
		pc.ModifiedBy,
		pc.ModifiedOn,
		pc.ModifiedByIP,
		cusr.FirstName+' '+cusr.LastName as CreatedByUserName,
		musr.FirstName+' '+musr.LastName as ModifiedByUserName
	from tbl_ProductCategory pc
	inner join tbl_Users as cusr on cusr.UserID = pc.CreatedBy
	inner join tbl_Users as musr on musr.UserID = pc.ModifiedBy
END


/*

usp_ProductCategory_GetAll

*/
GO
/****** Object:  StoredProcedure [dbo].[usp_ProductCategory_GetProductCategoryByID]    Script Date: 2/22/2023 4:57:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Aqib Ehsan>
-- Create date: <Feb 14,2023>
-- Description:	<Get Product Category By ID>
-- =============================================
create PROCEDURE [dbo].[usp_ProductCategory_GetProductCategoryByID]
@ProductCategoryID int
AS
BEGIN
	
	SET NOCOUNT ON;


	select 
		pc.ProductCategoryID,
		pc.Name as ProductCategoryName,
		pc.CreatedBy,
		pc.CreatedOn,
		pc.CreatedByIP,
		pc.ModifiedBy,
		pc.ModifiedOn,
		pc.ModifiedByIP
	from tbl_ProductCategory pc
	where pc.ProductCategoryID = @ProductCategoryID
END


/*

usp_ProductCategory_GetProductCategoryByID @ProductCategoryID = 1

*/
GO
/****** Object:  StoredProcedure [dbo].[usp_ProductCategory_Update]    Script Date: 2/22/2023 4:57:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Aqib Ehsan>
-- Create date: <Feb 14,2023>
-- Description:	<Add Product Category>
-- =============================================
create PROCEDURE [dbo].[usp_ProductCategory_Update]
@ProductCategoryID int,
@ProductCategoryName nvarchar(200),
@ModifiedBy int,
@ModifiedOn datetime,
@ModifiedByIP nvarchar(200)
AS
BEGIN
	
	SET NOCOUNT ON;

	update tbl_ProductCategory
	set Name = @ProductCategoryName,
		ModifiedBy = @ModifiedBy,
		ModifiedOn = @ModifiedOn,
		ModifiedByIP = @ModifiedByIP
	where ProductCategoryID = @ProductCategoryID

	if(@@ROWCOUNT > 0)
	begin
		select 
		pc.ProductCategoryID,
		pc.Name as ProductCategoryName
		from tbl_ProductCategory pc
		where pc.ProductCategoryID = @ProductCategoryID
	end
END


/*

usp_ProductCategory_Update @ProductCategoryName = 'sdfsxvxvxcv',@ModifiedBy = 1,@ModifiedOn = '2023-01-12 10:55:29.930',@ModifiedByIP = '',@ProductCategoryID=1

*/
GO
/****** Object:  StoredProcedure [dbo].[usp_ProductType_Add]    Script Date: 2/22/2023 4:57:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Aqib Ehsan>
-- Create date: <Feb 14,2023>
-- Description:	<Add Product Type>
-- =============================================
create PROCEDURE [dbo].[usp_ProductType_Add]
@ProductTypeName nvarchar(200),
@CreatedBy int,
@CreatedOn datetime,
@CreatedByIP nvarchar(200)
AS
BEGIN
	
	SET NOCOUNT ON;

	declare @ProductTypeID int;

	insert into tbl_ProductTypes
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
		@ProductTypeName,
		@CreatedBy,
		@CreatedOn,
		@CreatedByIP,
		@CreatedBy,
		@CreatedOn,
		@CreatedByIP
	)

	SET @ProductTypeID = SCOPE_IDENTITY();

	select 
		pt.ProductTypeID,
		pt.Name as ProductTypeName
	from tbl_ProductTypes pt
	where pt.ProductTypeID = @ProductTypeID
END


/*

usp_ProductType_Add @ProductTypeName = 'asdfasf',@CreatedBy = 1,@CreatedOn = '2023-01-12 10:55:29.930',@CreatedByIP = ''

*/
GO
/****** Object:  StoredProcedure [dbo].[usp_ProductType_GetAll]    Script Date: 2/22/2023 4:57:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Aqib Ehsan>
-- Create date: <Feb 14,2023>
-- Description:	<Get All Product Type>
-- =============================================
create PROCEDURE [dbo].[usp_ProductType_GetAll]
AS
BEGIN
	
	SET NOCOUNT ON;


	select 
		pt.ProductTypeID,
		pt.Name as ProductTypeName,
		pt.CreatedBy,
		pt.CreatedOn,
		pt.CreatedByIP,
		pt.ModifiedBy,
		pt.ModifiedOn,
		pt.ModifiedByIP,
		cusr.FirstName+' '+cusr.LastName as CreatedByUserName,
		musr.FirstName+' '+musr.LastName as ModifiedByUserName
	from tbl_ProductTypes pt
	inner join tbl_Users as cusr on cusr.UserID = pt.CreatedBy
	inner join tbl_Users as musr on musr.UserID = pt.ModifiedBy
END


/*

usp_ProductType_GetAll

*/
GO
/****** Object:  StoredProcedure [dbo].[usp_ProductType_GetProductTypeByID]    Script Date: 2/22/2023 4:57:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Aqib Ehsan>
-- Create date: <Feb 14,2023>
-- Description:	<Get Product Type By ID>
-- =============================================
create PROCEDURE [dbo].[usp_ProductType_GetProductTypeByID]
@ProductTypeID int
AS
BEGIN
	
	SET NOCOUNT ON;


	select 
		pt.ProductTypeID,
		pt.Name as ProductTypeName,
		pt.CreatedBy,
		pt.CreatedOn,
		pt.CreatedByIP,
		pt.ModifiedBy,
		pt.ModifiedOn,
		pt.ModifiedByIP
	from tbl_ProductTypes pt
	where pt.ProductTypeID = @ProductTypeID
END


/*

usp_ProductType_GetProductTypeByID @ProductTypeID = 1

*/
GO
/****** Object:  StoredProcedure [dbo].[usp_ProductType_Update]    Script Date: 2/22/2023 4:57:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Aqib Ehsan>
-- Create date: <Feb 14,2023>
-- Description:	<Add Product Type>
-- =============================================
create PROCEDURE [dbo].[usp_ProductType_Update]
@ProductTypeID int,
@ProductTypeName nvarchar(200),
@ModifiedBy int,
@ModifiedOn datetime,
@ModifiedByIP nvarchar(200)
AS
BEGIN
	
	SET NOCOUNT ON;

	update tbl_ProductTypes
	set Name = @ProductTypeName,
		ModifiedBy = @ModifiedBy,
		ModifiedOn = @ModifiedOn,
		ModifiedByIP = @ModifiedByIP
	where ProductTypeID = @ProductTypeID

	if(@@ROWCOUNT > 0)
	begin
		select 
		pt.ProductTypeID,
		pt.Name as ProductTypeName
		from tbl_ProductTypes pt
		where pt.ProductTypeID = @ProductTypeID
	end
END


/*

usp_ProductType_Update @ProductTypeName = 'sdfsxvxvxcv',@ModifiedBy = 1,@ModifiedOn = '2023-01-12 10:55:29.930',@ModifiedByIP = '',@ProductTypeID=1

*/
GO
/****** Object:  StoredProcedure [dbo].[usp_Role_Add]    Script Date: 2/22/2023 4:57:59 PM ******/
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
/****** Object:  StoredProcedure [dbo].[usp_Role_GetAll]    Script Date: 2/22/2023 4:57:59 PM ******/
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
/****** Object:  StoredProcedure [dbo].[usp_Role_GetRoleByID]    Script Date: 2/22/2023 4:57:59 PM ******/
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
/****** Object:  StoredProcedure [dbo].[usp_Role_Update]    Script Date: 2/22/2023 4:57:59 PM ******/
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
/****** Object:  StoredProcedure [dbo].[usp_SiteConfig_Add]    Script Date: 2/22/2023 4:57:59 PM ******/
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
/****** Object:  StoredProcedure [dbo].[usp_SiteConfig_GetAll]    Script Date: 2/22/2023 4:57:59 PM ******/
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
/****** Object:  StoredProcedure [dbo].[usp_SiteConfig_GetAllActive]    Script Date: 2/22/2023 4:57:59 PM ******/
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
/****** Object:  StoredProcedure [dbo].[usp_SiteConfig_GetSiteConfigByID]    Script Date: 2/22/2023 4:57:59 PM ******/
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
/****** Object:  StoredProcedure [dbo].[usp_SiteConfig_Update]    Script Date: 2/22/2023 4:57:59 PM ******/
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
/****** Object:  StoredProcedure [dbo].[usp_State_Add]    Script Date: 2/22/2023 4:57:59 PM ******/
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
/****** Object:  StoredProcedure [dbo].[usp_State_GetAll]    Script Date: 2/22/2023 4:57:59 PM ******/
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
/****** Object:  StoredProcedure [dbo].[usp_State_GetStateByID]    Script Date: 2/22/2023 4:57:59 PM ******/
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
/****** Object:  StoredProcedure [dbo].[usp_State_Update]    Script Date: 2/22/2023 4:57:59 PM ******/
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
/****** Object:  StoredProcedure [dbo].[usp_TimeZone_Add]    Script Date: 2/22/2023 4:57:59 PM ******/
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
/****** Object:  StoredProcedure [dbo].[usp_TimeZone_GetAll]    Script Date: 2/22/2023 4:57:59 PM ******/
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
/****** Object:  StoredProcedure [dbo].[usp_TimeZone_GetTimeZoneByID]    Script Date: 2/22/2023 4:57:59 PM ******/
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
/****** Object:  StoredProcedure [dbo].[usp_TimeZone_Update]    Script Date: 2/22/2023 4:57:59 PM ******/
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
/****** Object:  StoredProcedure [dbo].[usp_User_Add]    Script Date: 2/22/2023 4:57:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Aqib Ehsan>
-- Create date: <Feb 22,2023>
-- Description:	<Add User>
-- =============================================
CREATE PROCEDURE [dbo].[usp_User_Add]
@RoleID	int,
@FirstName	nvarchar(200),
@LastName	nvarchar(200),
@Email	nvarchar(400),
@Password	nvarchar(200),
@Phone	nvarchar(200),
@Address1	nvarchar(200),
@Address2	nvarchar(200),
@CityID	int,
@StateID	int,
@ZipCode	nvarchar(200),
@CountryID	int,
@Gender	nvarchar(200),
@DOB	datetime,
@IsActive	int,
@CreatedBy	int,
@CreatedOn	datetime,
@CreatedByIP	nvarchar(200),
@CompanyIDs nvarchar(200),
@BranchIDs nvarchar(200)
AS
BEGIN
	
	SET NOCOUNT ON;

	declare @UserID int;

    insert into tbl_Users
	(
		RoleID,
		FirstName,
		LastName,
		Email,
		Password,
		Phone,
		Address1,
		Address2,
		CityID,
		StateID,
		ZipCode,
		CountryID,
		Gender,
		DOB,
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
		@RoleID,
		@FirstName,
		@LastName,
		@Email,
		@Password,
		@Phone,
		@Address1,
		@Address2,
		@CityID,
		@StateID,
		@ZipCode,
		@CountryID,
		@Gender,
		@DOB,
		@IsActive,
		@CreatedBy,
		@CreatedOn,
		@CreatedByIP,
		@CreatedBy,
		@CreatedOn,
		@CreatedByIP
	)

	SET @UserID = SCOPE_IDENTITY();


	insert into tbl_UserCompany
	(
		CompanyID,
		UserID,
		CreatedBy,
		CreatedOn,
		CreatedByIP,
		ModifiedBy,
		ModifiedOn,
		ModifiedByIP
	)
	select 
		Item,
		@UserID,
		@CreatedBy,
		@CreatedOn,
		@CreatedByIP,
		@CreatedBy,
		@CreatedOn,
		@CreatedByIP
	from SplitString(@CompanyIDs,',')

	insert into tbl_UserBranch
	(
		BranchID,
		UserID,
		CreatedBy,
		CreatedOn,
		CreatedByIP,
		ModifiedBy,
		ModifiedOn,
		ModifiedByIP
	)
	select 
		Item,
		@UserID,
		@CreatedBy,
		@CreatedOn,
		@CreatedByIP,
		@CreatedBy,
		@CreatedOn,
		@CreatedByIP
	from SplitString(@BranchIDs,',')

	select 
	FirstName+' '+LastName as UserName 
	from tbl_Users
	where UserID = @UserID

END

/*

usp_User_Add
@RoleID = 2,
@FirstName = 'fasfas f',
@LastName = 'sadf sadf',
@Email = 'sadf@yahoo.com',
@Password = 'asdf',
@Phone = 'asd sfasf',
@Address1 = 'as fsaf',
@Address2 = 'as df sa f',
@CityID = 1,
@StateID = 1,
@ZipCode = 'as fas f',
@CountryID = 1,
@Gender = 'male',
@DOB = '2023-01-13 13:08:15.117',
@IsActive = 1,
@CreatedBy = 1,
@CreatedOn = '2023-01-13 13:08:15.117',
@CreatedByIP = '',
@CompanyIDs = '1,2,3',
@BranchIDs = '1,2,3'

*/
GO
/****** Object:  StoredProcedure [dbo].[usp_User_GetAll]    Script Date: 2/22/2023 4:57:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Aqib Ehsan>
-- Create date: <Feb 22,2023>
-- Description:	<Get All Users>
-- =============================================
CREATE PROCEDURE [dbo].[usp_User_GetAll]
	
AS
BEGIN
	
	SET NOCOUNT ON;

    select 
		u.UserID,
		u.RoleID,
		r.Name as RoleName,
		u.FirstName,
		u.LastName,
		u.FirstName+' '+u.LastName as UserName,
		u.Email,
		u.Password,
		u.Phone,
		u.Address1,
		u.Address2,
		u.CityID,
		c.Name as CityName,
		u.StateID,
		s.Name as StateName,
		u.ZipCode,
		u.CountryID,
		ctry.Name as CountryName,
		u.Gender,
		u.DOB,
		u.IsActive,
		u.CreatedBy,
		u.CreatedOn,
		u.CreatedByIP,
		u.ModifiedBy,
		u.ModifiedOn,
		u.ModifiedByIP,
		cusr.FirstName+' '+cusr.LastName as CreatedByUserName,
		musr.FirstName+' '+musr.LastName as ModifiedByUserName
	from tbl_Users u
	inner join tbl_Roles r on r.RoleID = u.RoleID
	inner join tbl_City c on c.CityID = u.CityID
	inner join tbl_State s on s.StateID = u.StateID
	inner join tbl_Country ctry on ctry.CountryID = u.CountryID
	inner join tbl_Users as cusr on cusr.UserID = u.CreatedBy
	inner join tbl_Users as musr on musr.UserID = u.ModifiedBy
END

/*

usp_User_GetAll

*/
GO
/****** Object:  StoredProcedure [dbo].[usp_User_GetAllActive]    Script Date: 2/22/2023 4:57:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Aqib Ehsan>
-- Create date: <Feb 22,2023>
-- Description:	<Get All Active Users>
-- =============================================
create PROCEDURE [dbo].[usp_User_GetAllActive]
	
AS
BEGIN
	
	SET NOCOUNT ON;

    select 
		u.UserID,
		u.RoleID,
		r.Name as RoleName,
		u.FirstName,
		u.LastName,
		u.FirstName+' '+u.LastName as UserName,
		u.Email,
		u.Password,
		u.Phone,
		u.Address1,
		u.Address2,
		u.CityID,
		c.Name as CityName,
		u.StateID,
		s.Name as StateName,
		u.ZipCode,
		u.CountryID,
		ctry.Name as CountryName,
		u.Gender,
		u.DOB,
		u.IsActive,
		u.CreatedBy,
		u.CreatedOn,
		u.CreatedByIP,
		u.ModifiedBy,
		u.ModifiedOn,
		u.ModifiedByIP,
		cusr.FirstName+' '+cusr.LastName as CreatedByUserName,
		musr.FirstName+' '+musr.LastName as ModifiedByUserName
	from tbl_Users u
	inner join tbl_Roles r on r.RoleID = u.RoleID
	inner join tbl_City c on c.CityID = u.CityID
	inner join tbl_State s on s.StateID = u.StateID
	inner join tbl_Country ctry on ctry.CountryID = u.CountryID
	inner join tbl_Users as cusr on cusr.UserID = u.CreatedBy
	inner join tbl_Users as musr on musr.UserID = u.ModifiedBy
	where u.IsActive = 1
END

/*

usp_User_GetAllActive

*/
GO
/****** Object:  StoredProcedure [dbo].[usp_User_Update]    Script Date: 2/22/2023 4:57:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Aqib Ehsan>
-- Create date: <Feb 22,2023>
-- Description:	<Update User>
-- =============================================
CREATE PROCEDURE [dbo].[usp_User_Update]
@UserID int,
@RoleID	int,
@FirstName	nvarchar(200),
@LastName	nvarchar(200),
@Email	nvarchar(400),
@Password	nvarchar(200),
@Phone	nvarchar(200),
@Address1	nvarchar(200),
@Address2	nvarchar(200),
@CityID	int,
@StateID	int,
@ZipCode	nvarchar(200),
@CountryID	int,
@Gender	nvarchar(200),
@DOB	datetime,
@IsActive	int,
@ModifiedBy	int,
@ModifiedOn	datetime,
@ModifiedByIP	nvarchar(200),
@CompanyIDs nvarchar(200),
@BranchIDs nvarchar(200)
AS
BEGIN
	
	SET NOCOUNT ON;

	update tbl_Users
	set RoleID = @RoleID,
		FirstName = @FirstName,
		LastName = @LastName,
		Email = @Email,
		Password = @Password,
		Phone = @Phone,
		Address1 = @Address1,
		Address2 = @Address2,
		CityID = @CityID,
		StateID = @StateID,
		ZipCode = @ZipCode,
		CountryID = @CountryID,
		Gender = @Gender,
		DOB = @DOB,
		IsActive = @IsActive,
		ModifiedBy = @ModifiedBy,
		ModifiedOn =@ModifiedOn,
		ModifiedByIP = ModifiedByIP
	where UserID = @UserID


	delete from tbl_UserCompany where UserID = @UserID

	insert into tbl_UserCompany
	(
		CompanyID,
		UserID,
		CreatedBy,
		CreatedOn,
		CreatedByIP,
		ModifiedBy,
		ModifiedOn,
		ModifiedByIP
	)
	select 
		Item,
		@UserID,
		@ModifiedBy,
		@ModifiedOn,
		@ModifiedByIP,
		@ModifiedBy,
		@ModifiedOn,
		@ModifiedByIP
	from SplitString(@CompanyIDs,',')


	delete from tbl_UserBranch where UserID = @UserID

	insert into tbl_UserBranch
	(
		BranchID,
		UserID,
		CreatedBy,
		CreatedOn,
		CreatedByIP,
		ModifiedBy,
		ModifiedOn,
		ModifiedByIP
	)
	select 
		Item,
		@UserID,
		@ModifiedBy,
		@ModifiedOn,
		@ModifiedByIP,
		@ModifiedBy,
		@ModifiedOn,
		@ModifiedByIP
	from SplitString(@BranchIDs,',')


	if(@@ROWCOUNT > 0)
	begin
		select 
		FirstName+' '+LastName as UserName 
		from tbl_Users
		where UserID = @UserID
	end
END

/*

usp_User_Update
@UserID = 2,
@RoleID = 2,
@FirstName = 'uoiuouo',
@LastName = 'sadf sadf',
@Email = 'sadf@yahoo.com',
@Password = 'asdf',
@Phone = 'asd sfasf',
@Address1 = 'as fsaf',
@Address2 = 'as df sa f',
@CityID = 1,
@StateID = 1,
@ZipCode = 'as fas f',
@CountryID = 1,
@Gender = 'male',
@DOB = '2023-01-13 13:08:15.117',
@IsActive = 1,
@ModifiedBy = 1,
@ModifiedOn = '2023-01-13 13:08:15.117',
@ModifiedByIP = '',
@CompanyIDs = '1,2,3',
@BranchIDs = '1,2,3'

*/
GO
/****** Object:  StoredProcedure [dbo].[usp_ValidateLogin]    Script Date: 2/22/2023 4:57:59 PM ******/
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
/****** Object:  StoredProcedure [dbo].[usp_Vendor_Add]    Script Date: 2/22/2023 4:57:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Aqib Ehsan>
-- Create date: <Feb 22,2023>
-- Description:	<Add Vendor>
-- =============================================
CREATE PROCEDURE [dbo].[usp_Vendor_Add]
@VendorName	nvarchar(200),
@PostalPhone	nvarchar(200),
@PostalAddress1	nvarchar(200),
@PostalAddress2	nvarchar(200),
@PostalCityID	int,
@PostalStateID	int,
@PostalZipCode	nvarchar(200),
@PostalCountryID	int,
@BillingPhone	nvarchar(200),
@BillingAddress1	nvarchar(200),
@BillingAddress2	nvarchar(200),
@BillingCityID	int,
@BillingStateID	int,
@BillingZipCode	nvarchar(200),
@BillingCountryID	int,
@IsActive	int,
@CreatedBy	int,
@CreatedOn	datetime,
@CreatedByIP	nvarchar(200)	
AS
BEGIN
	
	SET NOCOUNT ON;

	declare @VendorID int;

    insert into tbl_Vender
	(
		Name,
		PostalPhone,
		PostalAddress1,
		PostalAddress2,
		PostalCityID,
		PostalStateID,
		PostalZipCode,
		PostalCountryID,
		BillingPhone,
		BillingAddress1,
		BillingAddress2,
		BillingCityID,
		BillingStateID,
		BillingZipCode,
		BillingCountryID,
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
		@VendorName,
		@PostalPhone,
		@PostalAddress1,
		@PostalAddress2,
		@PostalCityID,
		@PostalStateID,
		@PostalZipCode,
		@PostalCountryID,
		@BillingPhone,
		@BillingAddress1,
		@BillingAddress2,
		@BillingCityID,
		@BillingStateID,
		@BillingZipCode,
		@BillingCountryID,
		@IsActive,
		@CreatedBy,
		@CreatedOn,
		@CreatedByIP,
		@CreatedBy,
		@CreatedOn,
		@CreatedByIP
	)

	SET @VendorID = SCOPE_IDENTITY();

	select Name as VendorName 
	from tbl_Vender 
	where VenderID = @VendorID
END

/*

usp_Vendor_Add
@VendorName = 'fas fas ',
@PostalPhone = 'asd fsf ',
@PostalAddress1 = 'a sdfas ',
@PostalAddress2 = 'as dfas f',
@PostalCityID = 1,
@PostalStateID = 1,
@PostalZipCode = 'as fs f',
@PostalCountryID = 1,
@BillingPhone = ' asdfs a',
@BillingAddress1 = 'f asf as',
@BillingAddress2 = 'a sdfas f',
@BillingCityID = 1,
@BillingStateID = 1,
@BillingZipCode = 'as fs ',
@BillingCountryID = 1,
@IsActive = 1,
@CreatedBy = 1,
@CreatedOn = '2023-01-12 13:07:41.580',
@CreatedByIP = '',

*/
GO
/****** Object:  StoredProcedure [dbo].[usp_Vendor_GetAll]    Script Date: 2/22/2023 4:57:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Aqib Ehsan>
-- Create date: <Feb 22,2023>
-- Description:	<Get All Vendor>
-- =============================================
CREATE PROCEDURE [dbo].[usp_Vendor_GetAll]
	
AS
BEGIN
	
	SET NOCOUNT ON;

    select
		v.VenderID,
		v.Name AS VendorName ,
		v.PostalPhone,
		v.PostalAddress1,
		v.PostalAddress2,
		v.PostalCityID,
		pc.Name as PostalCityName,
		v.PostalStateID,
		ps.Name as PostalStateName,
		v.PostalZipCode,
		v.PostalCountryID,
		pcon.Name as PostalCountryName,
		v.BillingPhone,
		v.BillingAddress1,
		v.BillingAddress2,
		v.BillingCityID,
		bc.Name as BillingCityName,
		v.BillingStateID,
		bs.Name as BillingStateName,
		v.BillingZipCode,
		v.BillingCountryID,
		bcon.Name as BillingCountryName,
		v.IsActive,
		v.CreatedBy,
		v.CreatedOn,
		v.CreatedByIP,
		v.ModifiedBy,
		v.ModifiedOn,
		v.ModifiedByIP,
		cusr.FirstName+' '+cusr.LastName as CreatedByUserName,
		musr.FirstName+' '+musr.LastName as ModifiedByUserName
	from tbl_Vender v
	inner join tbl_City pc on pc.CityID = v.PostalCityID
	inner join tbl_State ps on ps.StateID = v.PostalStateID
	inner join tbl_Country pcon on pcon.CountryID = v.PostalCountryID
	inner join tbl_City bc on pc.CityID = v.BillingCityID
	inner join tbl_State bs on ps.StateID = v.BillingStateID
	inner join tbl_Country bcon on pcon.CountryID = v.BillingCountryID
	inner join tbl_Users as cusr on cusr.UserID = v.CreatedBy
	inner join tbl_Users as musr on musr.UserID = v.ModifiedBy
END

/*

usp_Vendor_GetAll

*/
GO
/****** Object:  StoredProcedure [dbo].[usp_Vendor_Update]    Script Date: 2/22/2023 4:57:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Aqib Ehsan>
-- Create date: <Feb 22,2023>
-- Description:	<Update Vendor>
-- =============================================
CREATE PROCEDURE [dbo].[usp_Vendor_Update]
@VendorID int,
@VendorName	nvarchar(200),
@PostalPhone	nvarchar(200),
@PostalAddress1	nvarchar(200),
@PostalAddress2	nvarchar(200),
@PostalCityID	int,
@PostalStateID	int,
@PostalZipCode	nvarchar(200),
@PostalCountryID	int,
@BillingPhone	nvarchar(200),
@BillingAddress1	nvarchar(200),
@BillingAddress2	nvarchar(200),
@BillingCityID	int,
@BillingStateID	int,
@BillingZipCode	nvarchar(200),
@BillingCountryID	int,
@IsActive	int,
@ModifiedBy	int,
@ModifiedOn	datetime,
@ModifiedByIP	nvarchar(200)	
AS
BEGIN
	
	SET NOCOUNT ON;

	update tbl_Vender
	set Name = @VendorName,
		PostalPhone = @PostalPhone,
		PostalAddress1 = @PostalAddress1,
		PostalAddress2 = @PostalAddress2,
		PostalCityID = @PostalCityID,
		PostalStateID = @PostalStateID,
		PostalZipCode = @PostalZipCode,
		PostalCountryID = @PostalCountryID,
		BillingPhone = @BillingPhone,
		BillingAddress1 = @BillingAddress1,
		BillingAddress2 = @BillingAddress2,
		BillingCityID = @BillingCityID,
		BillingStateID = @BillingStateID,
		BillingZipCode = @BillingZipCode,
		BillingCountryID = @BillingCountryID,
		IsActive = @IsActive,
		ModifiedBy = @ModifiedBy,
		ModifiedOn = @ModifiedOn,
		ModifiedByIP = @ModifiedByIP
	where VenderID = @VendorID

    if(@@ROWCOUNT > 0)
	begin
		select Name as VendorName 
		from tbl_Vender 
		where VenderID = @VendorID
	end
END

/*

usp_Vendor_Update
@VendorID = 1,
@VendorName = 'czxcasfjkljjoj af',
@PostalPhone = 'asd fsf ',
@PostalAddress1 = 'a sdfas ',
@PostalAddress2 = 'as dfas f',
@PostalCityID = 1,
@PostalStateID = 1,
@PostalZipCode = 'as fs f',
@PostalCountryID = 1,
@BillingPhone = ' asdfs a',
@BillingAddress1 = 'f asf as',
@BillingAddress2 = 'a sdfas f',
@BillingCityID = 1,
@BillingStateID = 1,
@BillingZipCode = 'as fs ',
@BillingCountryID = 1,
@IsActive = 1,
@ModifiedBy = 1,
@ModifiedOn = '2023-01-12 13:07:41.580',
@ModifiedByIP = ''

*/
GO
