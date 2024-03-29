USE [AccountERP]
GO
/****** Object:  UserDefinedFunction [dbo].[SplitString]    Script Date: 3/28/2023 12:15:30 PM ******/
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
/****** Object:  Table [dbo].[tbl_Accounts]    Script Date: 3/28/2023 12:15:30 PM ******/
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
	[AccountCode] [nvarchar](100) NULL,
	[IsSystemAccount] [bit] NULL,
	[AccountCodeID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[AccountID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_AccountsByCompanyBranch]    Script Date: 3/28/2023 12:15:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_AccountsByCompanyBranch](
	[AccountByCompanyBranchID] [int] IDENTITY(1,1) NOT NULL,
	[AccountID] [int] NULL,
	[AccountCode] [nvarchar](100) NULL,
	[Name] [nvarchar](200) NULL,
	[IsSubAccountOf] [int] NULL,
	[Description] [nvarchar](200) NULL,
	[IsActive] [int] NULL,
	[CompanyID] [int] NULL,
	[BranchID] [int] NULL,
	[CreatedBy] [int] NULL,
	[CreatedOn] [datetime] NULL,
	[CreatedByIP] [nvarchar](200) NULL,
	[ModifiedBy] [int] NULL,
	[ModifiedOn] [datetime] NULL,
	[ModifiedByIP] [nvarchar](200) NULL,
	[AccountCodeID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[AccountByCompanyBranchID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_AssignedPermission]    Script Date: 3/28/2023 12:15:30 PM ******/
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
/****** Object:  Table [dbo].[tbl_Branch]    Script Date: 3/28/2023 12:15:30 PM ******/
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
	[BranchCode] [nvarchar](100) NULL,
	[BranchCodeID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[BranchID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_BusinessType]    Script Date: 3/28/2023 12:15:30 PM ******/
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
	[BusinessTypeCode] [nvarchar](100) NULL,
	[BusinessTypeCodeID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[BusinessTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_City]    Script Date: 3/28/2023 12:15:30 PM ******/
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
	[CityCode] [nvarchar](100) NULL,
	[CityCodeID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[CityID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_CodePrefixes]    Script Date: 3/28/2023 12:15:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_CodePrefixes](
	[CodePrefixID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](100) NULL,
	[CreatedBy] [int] NULL,
	[CreatedOn] [datetime] NULL,
	[CreatedByIP] [nvarchar](200) NULL,
	[ModifiedBy] [int] NULL,
	[ModifiedOn] [datetime] NULL,
	[ModifiedByIP] [nvarchar](200) NULL,
	[CodePrefixKey] [nvarchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[CodePrefixID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_Company]    Script Date: 3/28/2023 12:15:30 PM ******/
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
	[CompanyCode] [nvarchar](100) NULL,
	[CompanyCodeID] [int] NULL,
	[SiteThemeSetting] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[CompanyID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_Configuration]    Script Date: 3/28/2023 12:15:30 PM ******/
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
	[SiteThemeSetting] [nvarchar](max) NULL,
 CONSTRAINT [PK_tbl_Configuration] PRIMARY KEY CLUSTERED 
(
	[ConfigurationID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_Country]    Script Date: 3/28/2023 12:15:30 PM ******/
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
	[Country_Code] [nvarchar](100) NULL,
	[Country_CodeID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[CountryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_Customer]    Script Date: 3/28/2023 12:15:30 PM ******/
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
	[CompanyID] [int] NULL,
	[BranchID] [int] NULL,
	[CustomerCode] [nvarchar](100) NULL,
	[CustomerCodeID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[CustomerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_ModulePageAction]    Script Date: 3/28/2023 12:15:30 PM ******/
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
/****** Object:  Table [dbo].[tbl_ModulePages]    Script Date: 3/28/2023 12:15:30 PM ******/
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
/****** Object:  Table [dbo].[tbl_Modules]    Script Date: 3/28/2023 12:15:30 PM ******/
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
/****** Object:  Table [dbo].[tbl_Product]    Script Date: 3/28/2023 12:15:30 PM ******/
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
	[ProductCode] [nvarchar](100) NULL,
	[ProductCodeID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[productID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_ProductAttributes]    Script Date: 3/28/2023 12:15:30 PM ******/
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
	[ProductAttributeCode] [nvarchar](100) NULL,
	[ProductAttributeCodeID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ProductAttributeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_ProductBrands]    Script Date: 3/28/2023 12:15:30 PM ******/
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
	[ProductBrandCode] [nvarchar](100) NULL,
	[ProductBrandCodeID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ProductBrandID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_ProductCategory]    Script Date: 3/28/2023 12:15:30 PM ******/
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
	[ProductCategoryCode] [nvarchar](100) NULL,
	[ProductCategoryCodeID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ProductCategoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_ProductTypes]    Script Date: 3/28/2023 12:15:30 PM ******/
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
	[ProductTypeCode] [nvarchar](100) NULL,
	[ProductTypeCodeID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ProductTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_ReportsType]    Script Date: 3/28/2023 12:15:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_ReportsType](
	[ReportsTypeID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](200) NULL,
	[IsActive] [int] NULL,
	[CreatedBy] [int] NULL,
	[CreatedOn] [datetime] NULL,
	[CreatedByIP] [nvarchar](1) NULL,
	[ModifiedBy] [int] NULL,
	[ModifiedOn] [datetime] NULL,
	[ModifiedByIP] [nvarchar](1) NULL,
PRIMARY KEY CLUSTERED 
(
	[ReportsTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_ReportsTypeTemplate]    Script Date: 3/28/2023 12:15:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_ReportsTypeTemplate](
	[ReportsTypeTemplateID] [int] IDENTITY(1,1) NOT NULL,
	[ReportsTypeID] [int] NULL,
	[Name] [nvarchar](200) NULL,
	[ReportsTypeTemplateKey] [nvarchar](200) NULL,
	[Body] [nvarchar](max) NULL,
	[CreatedBy] [int] NULL,
	[CreatedOn] [datetime] NULL,
	[CreatedByIP] [nvarchar](1) NULL,
	[ModifiedBy] [int] NULL,
	[ModifiedOn] [datetime] NULL,
	[ModifiedByIP] [nvarchar](1) NULL,
PRIMARY KEY CLUSTERED 
(
	[ReportsTypeTemplateID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_Roles]    Script Date: 3/28/2023 12:15:30 PM ******/
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
/****** Object:  Table [dbo].[tbl_State]    Script Date: 3/28/2023 12:15:30 PM ******/
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
	[State_Code] [nvarchar](100) NULL,
	[State_CodeID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[StateID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_TimeZones]    Script Date: 3/28/2023 12:15:30 PM ******/
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
	[TimeZoneCode] [nvarchar](100) NULL,
	[TimeZoneCodeID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[TimeZoneID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_UserBranch]    Script Date: 3/28/2023 12:15:30 PM ******/
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
/****** Object:  Table [dbo].[tbl_UserCompany]    Script Date: 3/28/2023 12:15:30 PM ******/
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
/****** Object:  Table [dbo].[tbl_Users]    Script Date: 3/28/2023 12:15:30 PM ******/
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
	[DOB] [date] NULL,
	[IsActive] [int] NULL,
	[CreatedBy] [int] NULL,
	[CreatedOn] [datetime] NULL,
	[CreatedByIP] [nvarchar](100) NULL,
	[ModifiedBy] [int] NULL,
	[ModifiedOn] [datetime] NULL,
	[ModifiedByIP] [nvarchar](100) NULL,
	[UserCode] [nvarchar](100) NULL,
	[UserCodeID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_Vendor]    Script Date: 3/28/2023 12:15:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_Vendor](
	[VendorID] [int] IDENTITY(1,1) NOT NULL,
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
	[CompanyID] [int] NULL,
	[BranchID] [int] NULL,
	[VendorCode] [nvarchar](100) NULL,
	[VendorCodeID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[VendorID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_WareHouses]    Script Date: 3/28/2023 12:15:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_WareHouses](
	[WareHouseID] [int] IDENTITY(1,1) NOT NULL,
	[CompanyID] [int] NULL,
	[BranchID] [int] NULL,
	[Name] [nvarchar](100) NULL,
	[Phone] [nvarchar](100) NULL,
	[Address1] [nvarchar](100) NULL,
	[Address2] [nvarchar](100) NULL,
	[CityID] [int] NULL,
	[StateID] [int] NULL,
	[ZipCode] [nvarchar](200) NULL,
	[CountryID] [int] NULL,
	[CreatedBy] [int] NULL,
	[CreatedOn] [datetime] NULL,
	[CreatedByIP] [nvarchar](100) NULL,
	[ModifiedBy] [int] NULL,
	[ModifiedOn] [datetime] NULL,
	[ModifiedByIP] [nvarchar](100) NULL,
	[WareHouseCode] [nvarchar](100) NULL,
	[WareHouseCodeID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[WareHouseID] ASC
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
/****** Object:  StoredProcedure [dbo].[usp_AccountCode_Generate]    Script Date: 3/28/2023 12:15:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Aqib Ehsan>
-- Create date: <Mar 13,2023>
-- Description:	<Generate Account Code>
-- =============================================
CREATE PROCEDURE [dbo].[usp_AccountCode_Generate]
@AccountID int,
@IsSubAccountOf int = null
AS
BEGIN
	SET NOCOUNT ON;

	declare @AccountCode nvarchar(100);
	declare @LastAccountCodeID int;
	declare @ParentAccountCode nvarchar(100);

	if(@IsSubAccountOf is null)
	begin
		select top 1 @LastAccountCodeID = AccountCodeID
		from tbl_Accounts
		where IsSubAccountOf = 0
		and AccountID <> @AccountID
		order by AccountID desc

		if(@LastAccountCodeID is null)
		begin
			set @LastAccountCodeID = 1;
			set @AccountCode = cast(@LastAccountCodeID AS VARCHAR(15)) + '001'

			update tbl_Accounts
			set AccountCodeID = @LastAccountCodeID,
			AccountCode = @AccountCode
			where AccountID = @AccountID
		end
		else
		begin
			set @LastAccountCodeID = @LastAccountCodeID + 1;
			set @AccountCode = cast(@LastAccountCodeID AS VARCHAR(15)) + '001'

			update tbl_Accounts
			set AccountCodeID = @LastAccountCodeID,
			AccountCode = @AccountCode
			where AccountID = @AccountID
		end

	end
	else
	begin
		select top 1 @LastAccountCodeID = AccountCodeID
		from tbl_Accounts
		where IsSubAccountOf = @IsSubAccountOf
		and AccountID <> @AccountID
		order by AccountID desc

		select @ParentAccountCode = AccountCode 
		from tbl_Accounts 
		where AccountID = @IsSubAccountOf

		if(@LastAccountCodeID is null)
		begin
			set @LastAccountCodeID = 1;
			set @AccountCode = @ParentAccountCode+'-0'+cast(@LastAccountCodeID AS VARCHAR(15));

			update tbl_Accounts
			set AccountCodeID = @LastAccountCodeID,
			AccountCode = @AccountCode
			where AccountID = @AccountID

		end
		else
		begin
			set @LastAccountCodeID = @LastAccountCodeID + 1;

			SET @AccountCode = @ParentAccountCode+'-0'+cast(@LastAccountCodeID AS VARCHAR(15));

			update tbl_Accounts
			set AccountCodeID = @LastAccountCodeID,
			AccountCode = @AccountCode
			where AccountID = @AccountID

		end

	end

	--select @LastAccountCodeID,@AccountCode

END

/*

exec usp_AccountCode_Generate @AccountID = 3

exec usp_AccountCode_Generate @AccountID = 6,@IsSubAccountOf = 3

exec usp_AccountCode_Generate @AccountID = 5,@IsSubAccountOf = 1

*/


GO
/****** Object:  StoredProcedure [dbo].[usp_AccountCode_GenerateV2]    Script Date: 3/28/2023 12:15:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Aqib Ehsan>
-- Create date: <Mar 13,2023>
-- Description:	<Generate Account Code V2>
-- =============================================
CREATE PROCEDURE [dbo].[usp_AccountCode_GenerateV2]
@AccountID int,
@IsSubAccountOf int = null
AS
BEGIN
	SET NOCOUNT ON;

	declare @AccountCode nvarchar(100);
	declare @LastAccountCodeID int;
	declare @ParentAccountCode nvarchar(100);
	 
	select top 1 @LastAccountCodeID = AccountCodeID
	from tbl_AccountsByCompanyBranch
	where IsSubAccountOf = @IsSubAccountOf
	and AccountID <> @AccountID
	order by AccountID desc

	select @ParentAccountCode = AccountCode 
	from tbl_AccountsByCompanyBranch 
	where AccountID = @IsSubAccountOf

	if(@LastAccountCodeID is null)
	begin
		set @LastAccountCodeID = 1;
		set @AccountCode = @ParentAccountCode+'-0'+cast(@LastAccountCodeID AS VARCHAR(15));

		update tbl_AccountsByCompanyBranch
		set AccountCodeID = @LastAccountCodeID,
		AccountCode = @AccountCode
		where AccountID = @AccountID

	end
	else
	begin
		set @LastAccountCodeID = @LastAccountCodeID + 1;

		SET @AccountCode = @ParentAccountCode+'-0'+cast(@LastAccountCodeID AS VARCHAR(15));

		update tbl_AccountsByCompanyBranch
		set AccountCodeID = @LastAccountCodeID,
		AccountCode = @AccountCode
		where AccountID = @AccountID

	end

	--select @LastAccountCodeID,@AccountCode

END

/*

exec usp_AccountCode_GenerateV2 @AccountID = 10,@IsSubAccountOf = 4

exec usp_AccountCode_GenerateV2 @AccountID = 4,@IsSubAccountOf = 1

*/


GO
/****** Object:  StoredProcedure [dbo].[usp_Accounts_Add]    Script Date: 3/28/2023 12:15:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Aqib Ehsan>
-- Create date: <Mar 11,2023>
-- Description:	<Add Accounts>
-- =============================================
CREATE PROCEDURE [dbo].[usp_Accounts_Add]
@AccountName	nvarchar(200),
@IsSubAccountOf	int,
@Description	nvarchar(200),
@IsActive	int,
@IsSystemAccount	bit,
@CreatedBy	int,
@CreatedOn	datetime,
@CreatedByIP	nvarchar(200)

AS
BEGIN
	
	SET NOCOUNT ON;

	declare @AccountID	int;

	insert into tbl_Accounts
	(
		Name,
		IsSubAccountOf,
		Description,
		IsActive,
		CreatedBy,
		CreatedOn,
		CreatedByIP,
		ModifiedBy,
		ModifiedOn,
		ModifiedByIP,
		IsSystemAccount
	)
	values
	(
		@AccountName,
		@IsSubAccountOf,
		@Description,
		@IsActive,
		@CreatedBy,
		@CreatedOn,
		@CreatedByIP,
		@CreatedBy,
		@CreatedOn,
		@CreatedByIP,
		@IsSystemAccount
	)

	SET @AccountID = SCOPE_IDENTITY();

	if(@IsSubAccountOf = 0)
	begin
		exec usp_AccountCode_Generate @AccountID = @AccountID;
	end
	else
	begin
		exec usp_AccountCode_Generate @AccountID = @AccountID,@IsSubAccountOf = @IsSubAccountOf
	end

	select 
		acc.AccountID,
		acc.Name as AccountName,
		acc.AccountCode
	from tbl_Accounts acc
	where acc.AccountID = @AccountID 
END

/*

exec usp_Accounts_Add
@AccountName = 'fasdfaf',
@IsSubAccountOf =3,
@Description = '',
@IsActive = 1,
@CreatedBy = 1,
@CreatedOn = '2023-01-12 13:10:19.933',
@CreatedByIP ='',
@IsSystemAccount = 1

*/
GO
/****** Object:  StoredProcedure [dbo].[usp_Accounts_GetAccountsByID]    Script Date: 3/28/2023 12:15:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Aqib Ehsan>
-- Create date: <Mar 11,2023>
-- Description:	<Get Accounts By ID>
-- =============================================
CREATE PROCEDURE [dbo].[usp_Accounts_GetAccountsByID]
@AccountID int	
AS
BEGIN
	
	SET NOCOUNT ON;

	select 
		acc.AccountID,
		acc.Name as AccountName,
		acc.IsSubAccountOf,
		acc.Description,
		acc.IsActive,
		acc.AccountCode,
		acc.IsSystemAccount
	from tbl_Accounts acc
	where acc.AccountID = @AccountID
END

/*

exec usp_Accounts_GetAccountsByID @AccountID = 1

*/
GO
/****** Object:  StoredProcedure [dbo].[usp_Accounts_GetAll]    Script Date: 3/28/2023 12:15:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Aqib Ehsan>
-- Create date: <Mar 11,2023>
-- Description:	<Get All Accounts>
-- =============================================
CREATE PROCEDURE [dbo].[usp_Accounts_GetAll]
	
AS
BEGIN
	
	SET NOCOUNT ON;

	select 
		acc.AccountID,
		acc.Name as AccountName,
		acc.IsSubAccountOf,
		isnull(acc2.Name,'-') as IsSubAccountOfName,
		acc.Description,
		acc.IsActive,
		acc.AccountCode,
		acc.IsSystemAccount,
		acc.CreatedBy,
		acc.CreatedOn,
		acc.CreatedByIP,
		acc.ModifiedBy,
		acc.ModifiedOn,
		acc.ModifiedByIP,
		cusr.FirstName+' '+cusr.LastName as CreatedByUserName,
		musr.FirstName+' '+musr.LastName as ModifiedByUserName
	from tbl_Accounts acc
	inner join tbl_Users as cusr on cusr.UserID = acc.CreatedBy
	inner join tbl_Users as musr on musr.UserID = acc.ModifiedBy
	left join tbl_Accounts acc2 on acc2.AccountID = acc.IsSubAccountOf
END

/*

exec usp_Accounts_GetAll

*/
GO
/****** Object:  StoredProcedure [dbo].[usp_Accounts_GetAllActive]    Script Date: 3/28/2023 12:15:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Aqib Ehsan>
-- Create date: <Mar 11,2023>
-- Description:	<Get All Active Accounts>
-- =============================================
CREATE PROCEDURE [dbo].[usp_Accounts_GetAllActive]
	
AS
BEGIN
	
	SET NOCOUNT ON;

	select 
		acc.AccountID,
		acc.Name as AccountName,
		acc.IsSubAccountOf,
		isnull(acc2.Name,'-') as IsSubAccountOfName,
		acc.Description,
		acc.IsActive,
		acc.AccountCode,
		acc.IsSystemAccount,
		acc.CreatedBy,
		acc.CreatedOn,
		acc.CreatedByIP,
		acc.ModifiedBy,
		acc.ModifiedOn,
		acc.ModifiedByIP,
		cusr.FirstName+' '+cusr.LastName as CreatedByUserName,
		musr.FirstName+' '+musr.LastName as ModifiedByUserName
	from tbl_Accounts acc
	inner join tbl_Users as cusr on cusr.UserID = acc.CreatedBy
	inner join tbl_Users as musr on musr.UserID = acc.ModifiedBy
	left join tbl_Accounts acc2 on acc2.AccountID = acc.IsSubAccountOf
	where acc.IsActive = 1
END

/*

exec usp_Accounts_GetAllActive

*/
GO
/****** Object:  StoredProcedure [dbo].[usp_Accounts_Update]    Script Date: 3/28/2023 12:15:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Aqib Ehsan>
-- Create date: <Mar 11,2023>
-- Description:	<Update Accounts>
-- =============================================
CREATE PROCEDURE [dbo].[usp_Accounts_Update]
@AccountID	int,
@AccountName	nvarchar(200),
@IsSubAccountOf	int,
@Description	nvarchar(200),
@IsActive	int,
@IsSystemAccount	bit,
@ModifiedBy	int,
@ModifiedOn	datetime,
@ModifiedByIP	nvarchar(200)

AS
BEGIN
	
	SET NOCOUNT ON;

	update tbl_Accounts
	set Name = @AccountName,
		IsSubAccountOf = @IsSubAccountOf,
		Description = @Description,
		IsActive = @IsActive,
		ModifiedBy=@ModifiedBy,
		ModifiedOn = @ModifiedOn,
		ModifiedByIP = @ModifiedByIP,
		IsSystemAccount = @IsSystemAccount
		where AccountID = @AccountID

	
	if(@@ROWCOUNT > 0)
	begin
		select 
			acc.AccountID,
			acc.Name as AccountName,
			acc.AccountCode
		from tbl_Accounts acc
		where acc.AccountID = @AccountID 
	end
	
END

/*

exec usp_Accounts_Update
@AccountID = 1,
@AccountName = 'fasdfaf',
@IsSubAccountOf = 0,
@Description = '',
@IsActive = 1,
@ModifiedBy = 1,
@ModifiedOn = '2023-01-12 13:10:19.933',
@ModifiedByIP ='',
@IsSystemAccount = 1

*/
GO
/****** Object:  StoredProcedure [dbo].[usp_AccountsByCompanyBranch_Add]    Script Date: 3/28/2023 12:15:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Aqib Ehsan>
-- Create date: <Mar 11,2023>
-- Description:	<Add AccountsByCompanyBranch>
-- =============================================
CREATE PROCEDURE [dbo].[usp_AccountsByCompanyBranch_Add]
@AccountByCompanyBranchName	nvarchar(400),
@IsSubAccountOf	int,
@Description	nvarchar(400),
@IsActive	int,
@CompanyID	int,
@BranchID	int,
@CreatedBy	int,
@CreatedOn	datetime,
@CreatedByIP	nvarchar(400)

AS
BEGIN
	
	SET NOCOUNT ON;

	declare @AccountByCompanyBranchID	int;

	insert into tbl_AccountsByCompanyBranch
	(
		Name,
		IsSubAccountOf,
		Description,
		IsActive,
		CompanyID,
		BranchID,
		CreatedBy,
		CreatedOn,
		CreatedByIP,
		ModifiedBy,
		ModifiedOn,
		ModifiedByIP
	)
	values
	(
		@AccountByCompanyBranchName,
		@IsSubAccountOf,
		@Description,
		@IsActive,
		@CompanyID,
		@BranchID,
		@CreatedBy,
		@CreatedOn,
		@CreatedByIP,
		@CreatedBy,
		@CreatedOn,
		@CreatedByIP
	)

	SET @AccountByCompanyBranchID = SCOPE_IDENTITY();

	update tbl_AccountsByCompanyBranch
	set AccountID = @AccountByCompanyBranchID
	where AccountByCompanyBranchID = @AccountByCompanyBranchID

	exec usp_AccountCode_GenerateV2 @AccountID = @AccountByCompanyBranchID,@IsSubAccountOf = @IsSubAccountOf

	select 
		acc.AccountByCompanyBranchID,
		acc.AccountCode,
		acc.Name as AccountByCompanyBranchName
	from tbl_AccountsByCompanyBranch acc
	where acc.AccountByCompanyBranchID = @AccountByCompanyBranchID
END

/*

exec usp_AccountsByCompanyBranch_Add
@AccountByCompanyBranchName = 'sdfasdfads',
@IsSubAccountOf = 4,
@Description = '',
@IsActive = 1,
@CompanyID = 1,
@BranchID = 1,
@CreatedBy = 1,
@CreatedOn = '2023-03-11 22:19:16.040',
@CreatedByIP = ''

*/
GO
/****** Object:  StoredProcedure [dbo].[usp_AccountsByCompanyBranch_GetAccountsOfCompanyBranchByID]    Script Date: 3/28/2023 12:15:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Aqib Ehsan>
-- Create date: <Mar 11,2023>
-- Description:	<Get Accounts Of Company Branch By ID>
-- =============================================
create PROCEDURE [dbo].[usp_AccountsByCompanyBranch_GetAccountsOfCompanyBranchByID]
@AccountByCompanyBranchID int	
AS
BEGIN
	
	SET NOCOUNT ON;

	select 
		acc.AccountByCompanyBranchID,
		acc.AccountID,
		acc.AccountCode,
		acc.Name as AccountByCompanyBranchName,
		acc.IsSubAccountOf,
		acc.Description,
		acc.IsActive,
		acc.CompanyID,
		acc.BranchID
	from tbl_AccountsByCompanyBranch acc
	where acc.AccountByCompanyBranchID = @AccountByCompanyBranchID
END

/*

exec usp_AccountsByCompanyBranch_GetAccountsOfCompanyBranchByID @AccountByCompanyBranchID = 1

*/
GO
/****** Object:  StoredProcedure [dbo].[usp_AccountsByCompanyBranch_GetAll]    Script Date: 3/28/2023 12:15:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Aqib Ehsan>
-- Create date: <Mar 11,2023>
-- Description:	<Get All Accounts By Company Branch>
-- =============================================
CREATE PROCEDURE [dbo].[usp_AccountsByCompanyBranch_GetAll]
	
AS
BEGIN
	
	SET NOCOUNT ON;

	select 
		acc.AccountByCompanyBranchID,
		acc.AccountID,
		acc.AccountCode,
		acc.Name as AccountByCompanyBranchName,
		acc.IsSubAccountOf,
		isnull(acc2.Name,'-') as IsSubAccountOfName,
		acc.Description,
		acc.IsActive,
		acc.CompanyID,
		c.Name as CompanyName,
		acc.BranchID,
		b.Name as BranchName,
		acc.CreatedBy,
		acc.CreatedOn,
		acc.CreatedByIP,
		acc.ModifiedBy,
		acc.ModifiedOn,
		acc.ModifiedByIP,
		cusr.FirstName+' '+cusr.LastName as CreatedByUserName,
		musr.FirstName+' '+musr.LastName as ModifiedByUserName
	from tbl_AccountsByCompanyBranch acc
	left join tbl_AccountsByCompanyBranch acc2 on acc2.AccountID = acc.IsSubAccountOf and acc2.CompanyID = acc.CompanyID and acc2.BranchID = acc.BranchID
	inner join tbl_Company c on c.CompanyID = acc.CompanyID
	inner join tbl_Branch b on b.BranchID = acc.BranchID
	inner join tbl_Users as cusr on cusr.UserID = acc.CreatedBy
	inner join tbl_Users as musr on musr.UserID = acc.ModifiedBy
END

/*

exec usp_AccountsByCompanyBranch_GetAll

*/
GO
/****** Object:  StoredProcedure [dbo].[usp_AccountsByCompanyBranch_GetAllActive]    Script Date: 3/28/2023 12:15:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Aqib Ehsan>
-- Create date: <Mar 11,2023>
-- Description:	<Get All Active Accounts By Company Branch>
-- =============================================
CREATE PROCEDURE [dbo].[usp_AccountsByCompanyBranch_GetAllActive]
	
AS
BEGIN
	
	SET NOCOUNT ON;

	select 
		acc.AccountByCompanyBranchID,
		acc.AccountID,
		acc.AccountCode,
		acc.Name as AccountByCompanyBranchName,
		acc.IsSubAccountOf,
		isnull(acc2.Name,'-') as IsSubAccountOfName,
		acc.Description,
		acc.IsActive,
		acc.CompanyID,
		c.Name as CompanyName,
		acc.BranchID,
		b.Name as BranchName,
		acc.CreatedBy,
		acc.CreatedOn,
		acc.CreatedByIP,
		acc.ModifiedBy,
		acc.ModifiedOn,
		acc.ModifiedByIP,
		cusr.FirstName+' '+cusr.LastName as CreatedByUserName,
		musr.FirstName+' '+musr.LastName as ModifiedByUserName
	from tbl_AccountsByCompanyBranch acc
	left join tbl_AccountsByCompanyBranch acc2 on acc2.AccountID = acc.IsSubAccountOf and acc2.CompanyID = acc.CompanyID and acc2.BranchID = acc.BranchID
	inner join tbl_Company c on c.CompanyID = acc.CompanyID
	inner join tbl_Branch b on b.BranchID = acc.BranchID
	inner join tbl_Users as cusr on cusr.UserID = acc.CreatedBy
	inner join tbl_Users as musr on musr.UserID = acc.ModifiedBy
	where acc.IsActive = 1
END

/*

exec usp_AccountsByCompanyBranch_GetAllActive

*/
GO
/****** Object:  StoredProcedure [dbo].[usp_AccountsByCompanyBranch_Update]    Script Date: 3/28/2023 12:15:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Aqib Ehsan>
-- Create date: <Mar 11,2023>
-- Description:	<Update AccountsByCompanyBranch>
-- =============================================
CREATE PROCEDURE [dbo].[usp_AccountsByCompanyBranch_Update]
@AccountByCompanyBranchID	int,
@AccountByCompanyBranchName	nvarchar(400),
@IsSubAccountOf	int,
@Description	nvarchar(400),
@IsActive	int,
@CompanyID	int,
@BranchID	int,
@ModifiedBy	int,
@ModifiedOn	datetime,
@ModifiedByIP	nvarchar(400)

AS
BEGIN
	
	SET NOCOUNT ON;

	update tbl_AccountsByCompanyBranch
	set Name = @AccountByCompanyBranchName,
		IsSubAccountOf = @IsSubAccountOf,
		Description = @Description,
		IsActive = @IsActive,
		CompanyID = @CompanyID,
		BranchID = @BranchID,
		ModifiedBy = @ModifiedBy,
		ModifiedOn = @ModifiedOn,
		ModifiedByIP = @ModifiedByIP
	where AccountByCompanyBranchID = @AccountByCompanyBranchID

	if(@@ROWCOUNT > 0)
	begin
	select 
		acc.AccountByCompanyBranchID,
		acc.AccountCode,
		acc.Name as AccountByCompanyBranchName
	from tbl_AccountsByCompanyBranch acc
	where acc.AccountByCompanyBranchID = @AccountByCompanyBranchID
	end
END

/*

exec usp_AccountsByCompanyBranch_Update
@AccountByCompanyBranchID = 1,
@AccountByCompanyBranchName = 'sdfasdfads',
@IsSubAccountOf = 4,
@Description = '',
@IsActive = 1,
@CompanyID = 1,
@BranchID = 2,
@MOdifiedBy = 1,
@MOdifiedOn = '2023-03-11 22:19:16.040',
@MOdifiedByIP = ''

*/
GO
/****** Object:  StoredProcedure [dbo].[usp_AssignedPermission_Add]    Script Date: 3/28/2023 12:15:30 PM ******/
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
/****** Object:  StoredProcedure [dbo].[usp_AssignedPermission_GetAll]    Script Date: 3/28/2023 12:15:30 PM ******/
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
/****** Object:  StoredProcedure [dbo].[usp_AssignedPermission_GetAllV2]    Script Date: 3/28/2023 12:15:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Aqib Ehsan>
-- Create date: <Feb 22,2023>
-- Description:	<Get All Assinged Permission>
-- =============================================
CREATE PROCEDURE [dbo].[usp_AssignedPermission_GetAllV2]
AS
BEGIN
	
	SET NOCOUNT ON;

	select 
	distinct
		m.ModuleID,
		mp.ModulePageID,
		ap.RoleID
	from tbl_AssignedPermission ap
	inner join tbl_ModulePageAction mpa on mpa.ModulePageActionID = ap.ModulePageActionID
	inner join tbl_ModulePages mp on mp.ModulePageID = mpa.ModulePageID
	inner join tbl_Modules m on m.ModuleID = mp.ModuleID

END


/*

usp_AssignedPermission_GetAllV2

*/
GO
/****** Object:  StoredProcedure [dbo].[usp_AssignedPermission_Update]    Script Date: 3/28/2023 12:15:30 PM ******/
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
/****** Object:  StoredProcedure [dbo].[usp_Branch_Add]    Script Date: 3/28/2023 12:15:30 PM ******/
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

	exec usp_BranchCode_Generate @BranchID = @BranchID,@CompanyID = @CompanyID

	if exists(select * from tbl_AccountsByCompanyBranch where CompanyID = @CompanyID and BranchID = 0)
	begin
		update tbl_AccountsByCompanyBranch set BranchID = @BranchID
		where CompanyID = @CompanyID and BranchID = 0
	end
	else
	begin
		exec usp_CompanyAccount_Open @CompanyID = @CompanyID,@BranchID = @BranchID
	end
    
	select 
	Name as BranchName,BranchCode 
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
/****** Object:  StoredProcedure [dbo].[usp_Branch_GetAll]    Script Date: 3/28/2023 12:15:30 PM ******/
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
		b.BranchCode,
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
/****** Object:  StoredProcedure [dbo].[usp_Branch_GetBranchByID]    Script Date: 3/28/2023 12:15:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Aqib Ehsan>
-- Create date: <Feb 22,2023>
-- Description:	<Get Branch By ID>
-- =============================================
CREATE PROCEDURE [dbo].[usp_Branch_GetBranchByID] 
@BranchID int
AS
BEGIN
	
	SET NOCOUNT ON;

    select
		b.BranchID,
		b.CompanyID,
		b.Name as BranchName,
		b.CreatedBy,
		b.CreatedOn,
		b.CreatedByIP,
		b.ModifiedBy,
		b.ModifiedOn,
		b.ModifiedByIP,
		b.BranchCode
	from tbl_Branch b
	where b.BranchID = @BranchID
END


/*

usp_Branch_GetBranchByID @BranchID = 2

*/
GO
/****** Object:  StoredProcedure [dbo].[usp_Branch_Update]    Script Date: 3/28/2023 12:15:30 PM ******/
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
/****** Object:  StoredProcedure [dbo].[usp_BranchCode_Generate]    Script Date: 3/28/2023 12:15:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Aqib Ehsan>
-- Create date: <Mar 14,2023>
-- Description:	<Generate Branch Code>
-- =============================================
CREATE PROCEDURE [dbo].[usp_BranchCode_Generate]
@BranchID int,
@CompanyID int
AS
BEGIN
	SET NOCOUNT ON;

	declare @BranchCode nvarchar(100);
	declare @LastBranchCodeID int;
	declare @CodePrefix varchar(100);
	 
	select top 1 @LastBranchCodeID = BranchCodeID
	from tbl_Branch
	where CompanyID = @CompanyID
	and BranchID <> @BranchID
	order by BranchID desc

	select @CodePrefix = Name 
	from tbl_CodePrefixes 
	where CodePrefixKey = 'branch-code'
	
	if(@LastBranchCodeID is null)
	begin
		set @LastBranchCodeID = 1;
		set @BranchCode = @CodePrefix+'-'+cast(@CompanyID AS VARCHAR(15))+'-00000'+cast(@LastBranchCodeID AS VARCHAR(15));

		update tbl_Branch
		set BranchCodeID = @LastBranchCodeID,
		BranchCode = @BranchCode
		where BranchID = @BranchID

	end
	else
	begin
		set @LastBranchCodeID = @LastBranchCodeID + 1;

		IF LEN(@LastBranchCodeID) = 1
			BEGIN
				set @BranchCode = @CodePrefix+'-'+cast(@CompanyID AS VARCHAR(15))+'-00000'+cast(@LastBranchCodeID AS VARCHAR(15));
			END
			ELSE IF LEN(@LastBranchCodeID + 1) = 2
			BEGIN
				set @BranchCode = @CodePrefix+'-'+cast(@CompanyID AS VARCHAR(15))+'-0000'+cast(@LastBranchCodeID AS VARCHAR(15));
			END
			ELSE IF LEN(@LastBranchCodeID + 1) = 3
			BEGIN
				set @BranchCode = @CodePrefix+'-'+cast(@CompanyID AS VARCHAR(15))+'-000'+cast(@LastBranchCodeID AS VARCHAR(15));
			END
			ELSE IF LEN(@LastBranchCodeID + 1) = 4
			BEGIN
				set @BranchCode = @CodePrefix+'-'+cast(@CompanyID AS VARCHAR(15))+'-00'+cast(@LastBranchCodeID AS VARCHAR(15));
			END
			ELSE IF LEN(@LastBranchCodeID + 1) = 5
			BEGIN
				set @BranchCode = @CodePrefix+'-'+cast(@CompanyID AS VARCHAR(15))+'-0'+cast(@LastBranchCodeID AS VARCHAR(15));
			END
			ELSE IF LEN(@LastBranchCodeID + 1) = 6
			BEGIN
				set @BranchCode = @CodePrefix+'-'+cast(@CompanyID AS VARCHAR(15))+'-'+cast(@LastBranchCodeID AS VARCHAR(15));
			END

		update tbl_Branch
		set BranchCodeID = @LastBranchCodeID,
		BranchCode = @BranchCode
		where BranchID = @BranchID

	end

	--select @LastBranchCodeID,@BranchCode

END

/*

exec usp_BranchCode_Generate @BranchID = 11,@CompanyID = 1

*/


GO
/****** Object:  StoredProcedure [dbo].[usp_BusinessType_Add]    Script Date: 3/28/2023 12:15:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Aqib Ehsan>
-- Create date: <Feb 10,2023>
-- Description:	<Add Business Type>
-- =============================================
CREATE PROCEDURE [dbo].[usp_BusinessType_Add]
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

	exec usp_BusinessTypeCode_Generate @BusinessTypeID = @BusinessTypeID,@CreatedOn = @CreatedOn

	select 
		bs.BusinessTypeID,
		bs.Name as BusinessTypeName
	from tbl_BusinessType bs
	where bs.BusinessTypeID = @BusinessTypeID
END

/*

usp_BusinessType_Add 
@BusinessTypeName = 'abc',
@IsActive = 1,
@CreatedBy = 1,
@CreatedOn = '2022-01-12 10:55:29.930',
@CreatedByIP = ''

*/
GO
/****** Object:  StoredProcedure [dbo].[usp_BusinessType_GetAll]    Script Date: 3/28/2023 12:15:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Aqib Ehsan>
-- Create date: <Feb 10,2023>
-- Description:	<Get All Business Types>
-- =============================================
CREATE PROCEDURE [dbo].[usp_BusinessType_GetAll]
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
		musr.FirstName+' '+musr.LastName as ModifiedByUserName,
		bs.BusinessTypeCode
	from tbl_BusinessType bs
	inner join tbl_Users as cusr on cusr.UserID = bs.CreatedBy
	inner join tbl_Users as musr on musr.UserID = bs.ModifiedBy
END


/*

usp_BusinessType_GetAll

*/
GO
/****** Object:  StoredProcedure [dbo].[usp_BusinessType_GetAllActive]    Script Date: 3/28/2023 12:15:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Aqib Ehsan>
-- Create date: <Feb 10,2023>
-- Description:	<Get All Business Types>
-- =============================================
CREATE PROCEDURE [dbo].[usp_BusinessType_GetAllActive]
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
		musr.FirstName+' '+musr.LastName as ModifiedByUserName,
		bs.BusinessTypeCode
	from tbl_BusinessType bs
	inner join tbl_Users as cusr on cusr.UserID = bs.CreatedBy
	inner join tbl_Users as musr on musr.UserID = bs.ModifiedBy
	where bs.IsActive = 1
END


/*

usp_BusinessType_GetAllActive

*/
GO
/****** Object:  StoredProcedure [dbo].[usp_BusinessType_GetBusinessTypeByID]    Script Date: 3/28/2023 12:15:30 PM ******/
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
		bs.ModifiedByIP,
		bs.BusinessTypeCode
	from tbl_BusinessType bs
	where bs.BusinessTypeID = @BusinessTypeID
END


/*

usp_BusinessType_GetBusinessTypeByID @BusinessTypeID = 1

*/
GO
/****** Object:  StoredProcedure [dbo].[usp_BusinessType_TimeZone_Country_State_City_GetAll]    Script Date: 3/28/2023 12:15:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Aqib Ehsan>
-- Create date: <Feb 28,2023>
-- Description:	<Ge All Business Type, TimeZone, Country, State, City Data>
-- =============================================
CREATE PROCEDURE [dbo].[usp_BusinessType_TimeZone_Country_State_City_GetAll] 

AS
BEGIN
	
	SET NOCOUNT ON;

    select 
	BusinessTypeID,
	Name as BusinessTypeName 
	from tbl_BusinessType
	where IsActive = 1


	select 
	TimeZoneID,
	Name as TimeZoneName 
	from tbl_TimeZones


	select 
	CountryID,
	Name as CountryName 
	from tbl_Country
	

	select 
	st.StateID,
	st.CountryID,
	st.Name as StateName 
	from tbl_State st
	inner join tbl_Country ctry on ctry.CountryID = st.CountryID
	

	select 
	ct.CityID,
	ct.StateID,
	ct.Name as CityName 
	from tbl_City ct
	inner join tbl_State st on st.StateID = ct.StateID
	inner join tbl_Country ctry on ctry.CountryID = st.CountryID
END


/*

usp_BusinessType_TimeZone_Country_State_City_GetAll

*/
GO
/****** Object:  StoredProcedure [dbo].[usp_BusinessType_Update]    Script Date: 3/28/2023 12:15:30 PM ******/
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
/****** Object:  StoredProcedure [dbo].[usp_BusinessTypeCode_Generate]    Script Date: 3/28/2023 12:15:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Aqib Ehsan>
-- Create date: <Mar 14,2023>
-- Description:	<Generate Business Type Code>
-- =============================================
CREATE PROCEDURE [dbo].[usp_BusinessTypeCode_Generate]
@BusinessTypeID int,
@CreatedOn datetime
AS
BEGIN
	SET NOCOUNT ON;

	declare @BusinessTypeCode nvarchar(100);
	declare @LastBusinessTypeCodeID int;
	declare @CodePrefix varchar(100);
	DECLARE @LastRecordYear NVARCHAR(15)
		DECLARE @CurrentRecordYear NVARCHAR(15)
	 
	select top 1 @LastBusinessTypeCodeID = ISNULL(BusinessTypeCodeID,0),
	@LastRecordYear = Format(CreatedOn, 'yy')
	from tbl_BusinessType
	where BusinessTypeID <> @BusinessTypeID
	order by BusinessTypeID desc

	select @CodePrefix = Name 
	from tbl_CodePrefixes 
	where CodePrefixKey = 'businesstype-code'

	if(@LastBusinessTypeCodeID is null)set @LastBusinessTypeCodeID = 0;

	SET @CurrentRecordYear = FORMAT(@CreatedOn, 'yy')
	
	if(@CurrentRecordYear <> @LastRecordYear)
	begin
		set @LastBusinessTypeCodeID = 1;
		set @BusinessTypeCode = @CodePrefix+'-'+@CurrentRecordYear+'-00000'+cast(@LastBusinessTypeCodeID AS VARCHAR(15));

		update tbl_BusinessType
		set BusinessTypeCodeID = @LastBusinessTypeCodeID,
		BusinessTypeCode = @BusinessTypeCode
		where BusinessTypeID = @BusinessTypeID

	end
	else
	begin

		set @LastBusinessTypeCodeID = @LastBusinessTypeCodeID + 1;
		
		IF LEN(@LastBusinessTypeCodeID) = 1
			BEGIN
				set @BusinessTypeCode = @CodePrefix+'-'+@CurrentRecordYear+'-00000'+cast(@LastBusinessTypeCodeID AS VARCHAR(15));
			END
			ELSE IF LEN(@LastBusinessTypeCodeID + 1) = 2
			BEGIN
				set @BusinessTypeCode = @CodePrefix+'-'+@CurrentRecordYear+'-0000'+cast(@LastBusinessTypeCodeID AS VARCHAR(15));
			END
			ELSE IF LEN(@LastBusinessTypeCodeID + 1) = 3
			BEGIN
				set @BusinessTypeCode = @CodePrefix+'-'+@CurrentRecordYear+'-000'+cast(@LastBusinessTypeCodeID AS VARCHAR(15));
			END
			ELSE IF LEN(@LastBusinessTypeCodeID + 1) = 4
			BEGIN
				set @BusinessTypeCode = @CodePrefix+'-'+@CurrentRecordYear+'-00'+cast(@LastBusinessTypeCodeID AS VARCHAR(15));
			END
			ELSE IF LEN(@LastBusinessTypeCodeID + 1) = 5
			BEGIN
				set @BusinessTypeCode = @CodePrefix+'-'+@CurrentRecordYear+'-0'+cast(@LastBusinessTypeCodeID AS VARCHAR(15));
			END
			ELSE IF LEN(@LastBusinessTypeCodeID + 1) = 6
			BEGIN
				set @BusinessTypeCode = @CodePrefix+'-'+@CurrentRecordYear+'-'+cast(@LastBusinessTypeCodeID AS VARCHAR(15));
			END

		update tbl_BusinessType
		set BusinessTypeCodeID = @LastBusinessTypeCodeID,
		BusinessTypeCode = @BusinessTypeCode
		where BusinessTypeID = @BusinessTypeID

	end

	--select @LastBusinessTypeCodeID,@BusinessTypeCode

END

/*

exec usp_BusinessTypeCode_Generate @BusinessTypeID = 2,@CreatedOn = '2022-01-12 10:55:29.930'

*/


GO
/****** Object:  StoredProcedure [dbo].[usp_City_Add]    Script Date: 3/28/2023 12:15:30 PM ******/
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

	exec usp_CityCode_Generate @CityID = @CityID,@StateID = @StateID

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

usp_City_Add 
@StateID = 1,
@CityName = 'karachi',
@CreatedBy = 1,
@CreatedOn = '2023-01-12 10:55:29.930',
@CreatedByIP = ''

*/
GO
/****** Object:  StoredProcedure [dbo].[usp_City_GetAll]    Script Date: 3/28/2023 12:15:30 PM ******/
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
		musr.FirstName+' '+musr.LastName as ModifiedByUserName,
		ct.CityCode
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
/****** Object:  StoredProcedure [dbo].[usp_City_GetCityByID]    Script Date: 3/28/2023 12:15:30 PM ******/
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
		ct.ModifiedByIP,
		ct.CityCode
	from tbl_City ct
	where ct.CityID = @CityID
END

/*

usp_City_GetCityByID @CityID = 1

*/
GO
/****** Object:  StoredProcedure [dbo].[usp_City_Update]    Script Date: 3/28/2023 12:15:30 PM ******/
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

usp_City_Update 
@StateID = 2,
@CityName = 'karachi',
@ModifiedBy = 1,
@ModifiedOn = '2023-01-12 10:45:29.930',
@ModifiedByIP = '',
@CityID = 1

*/
GO
/****** Object:  StoredProcedure [dbo].[usp_CityCode_Generate]    Script Date: 3/28/2023 12:15:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Aqib Ehsan>
-- Create date: <Mar 14,2023>
-- Description:	<Generate City Code>
-- =============================================
create PROCEDURE [dbo].[usp_CityCode_Generate]
@CityID int,
@StateID int
AS
BEGIN
	SET NOCOUNT ON;

	declare @CityCode nvarchar(100);
	declare @LastCityCodeID int;
	declare @CodePrefix varchar(100);
	 
	select top 1 @LastCityCodeID = CityCodeID
	from tbl_City
	where StateID = @StateID
	and CityID <> @CityID
	order by CityID desc

	select @CodePrefix = Name 
	from tbl_CodePrefixes 
	where CodePrefixKey = 'city-code'
	
	if(@LastCityCodeID is null)
	begin
		set @LastCityCodeID = 1;
		set @CityCode = @CodePrefix+'-'+cast(@StateID AS VARCHAR(15))+'-00000'+cast(@LastCityCodeID AS VARCHAR(15));

		update tbl_City
		set CityCodeID = @LastCityCodeID,
		CityCode = @CityCode
		where CityID = @CityID

	end
	else
	begin
		set @LastCityCodeID = @LastCityCodeID + 1;

		IF LEN(@LastCityCodeID) = 1
			BEGIN
				set @CityCode = @CodePrefix+'-'+cast(@StateID AS VARCHAR(15))+'-00000'+cast(@LastCityCodeID AS VARCHAR(15));
			END
			ELSE IF LEN(@LastCityCodeID + 1) = 2
			BEGIN
				set @CityCode = @CodePrefix+'-'+cast(@StateID AS VARCHAR(15))+'-0000'+cast(@LastCityCodeID AS VARCHAR(15));
			END
			ELSE IF LEN(@LastCityCodeID + 1) = 3
			BEGIN
				set @CityCode = @CodePrefix+'-'+cast(@StateID AS VARCHAR(15))+'-000'+cast(@LastCityCodeID AS VARCHAR(15));
			END
			ELSE IF LEN(@LastCityCodeID + 1) = 4
			BEGIN
				set @CityCode = @CodePrefix+'-'+cast(@StateID AS VARCHAR(15))+'-00'+cast(@LastCityCodeID AS VARCHAR(15));
			END
			ELSE IF LEN(@LastCityCodeID + 1) = 5
			BEGIN
				set @CityCode = @CodePrefix+'-'+cast(@StateID AS VARCHAR(15))+'-0'+cast(@LastCityCodeID AS VARCHAR(15));
			END
			ELSE IF LEN(@LastCityCodeID + 1) = 6
			BEGIN
				set @CityCode = @CodePrefix+'-'+cast(@StateID AS VARCHAR(15))+'-'+cast(@LastCityCodeID AS VARCHAR(15));
			END

		update tbl_City
		set CityCodeID = @LastCityCodeID,
		CityCode = @CityCode
		where CityID = @CityID

	end

	--select @LastCityCodeID,@CityCode

END

/*

exec usp_CityCode_Generate @CityID = 11,@StateID = 1

*/


GO
/****** Object:  StoredProcedure [dbo].[usp_CodePrefixes_Add]    Script Date: 3/28/2023 12:15:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Aqib Ehsan>
-- Create date: <Mar 11,2023>
-- Description:	<Add CodePrefix>
-- =============================================
CREATE PROCEDURE [dbo].[usp_CodePrefixes_Add]
@CodePrefixName	varchar(100),
@CodePrefixKey nvarchar(200),
@CreatedBy	int,
@CreatedOn	datetime,
@CreatedByIP	nvarchar(200)
AS
BEGIN
	
	SET NOCOUNT ON;

	declare @CodePrefixID	int;

	insert into tbl_CodePrefixes
	(
		Name,
		CodePrefixKey,
		CreatedBy,
		CreatedOn,
		CreatedByIP,
		ModifiedBy,
		ModifiedOn,
		ModifiedByIP
	)
	values
	(
		@CodePrefixName,
		@CodePrefixKey,
		@CreatedBy,
		@CreatedOn,
		@CreatedByIP,
		@CreatedBy,
		@CreatedOn,
		@CreatedByIP
	)

	SET @CodePrefixID = SCOPE_IDENTITY();

	select 
		cp.CodePrefixID,
		cp.Name as CodePrefixName
	from tbl_CodePrefixes cp
	where cp.CodePrefixID = @CodePrefixID
END

/*

exec usp_CodePrefixes_Add 
@CodePrefixName = 'fdfadf',
@CodePrefixKey = '',
@CreatedBy = 1,
@CreatedOn = '2023-03-11 23:52:32.403',
@CreatedByIP = '',

*/
GO
/****** Object:  StoredProcedure [dbo].[usp_CodePrefixes_GetAll]    Script Date: 3/28/2023 12:15:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Aqib Ehsan>
-- Create date: <Mar 11,2023>
-- Description:	<Get All Code Prefixes>
-- =============================================
CREATE PROCEDURE [dbo].[usp_CodePrefixes_GetAll] 
	
AS
BEGIN
	
	SET NOCOUNT ON;

	select 
		cp.CodePrefixID,
		cp.Name as CodePrefixName,
		cp.CodePrefixKey,
		cp.CreatedBy,
		cp.CreatedOn,
		cp.CreatedByIP,
		cp.ModifiedBy,
		cp.ModifiedOn,
		cp.ModifiedByIP,
		cusr.FirstName+' '+cusr.LastName as CreatedByUserName,
		musr.FirstName+' '+musr.LastName as ModifiedByUserName
	from tbl_CodePrefixes cp
	inner join tbl_Users as cusr on cusr.UserID = cp.CreatedBy
	inner join tbl_Users as musr on musr.UserID = cp.ModifiedBy
END

/*

exec usp_CodePrefixes_GetAll

*/
GO
/****** Object:  StoredProcedure [dbo].[usp_CodePrefixes_GetCodePrefixByID]    Script Date: 3/28/2023 12:15:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Aqib Ehsan>
-- Create date: <Mar 11,2023>
-- Description:	<Get Code Prefixes By ID>
-- =============================================
CREATE PROCEDURE [dbo].[usp_CodePrefixes_GetCodePrefixByID] 
@CodePrefixID  int
AS
BEGIN
	
	SET NOCOUNT ON;

	select 
		cp.CodePrefixID,
		cp.Name as CodePrefixName,
		CodePrefixKey
	from tbl_CodePrefixes cp
	where cp.CodePrefixID = @CodePrefixID
END

/*

exec usp_CodePrefixes_GetCodePrefixByID @CodePrefixID = 1

*/
GO
/****** Object:  StoredProcedure [dbo].[usp_CodePrefixes_Update]    Script Date: 3/28/2023 12:15:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Aqib Ehsan>
-- Create date: <Mar 11,2023>
-- Description:	<Update CodePrefix>
-- =============================================
CREATE PROCEDURE [dbo].[usp_CodePrefixes_Update]
@CodePrefixID	int,
@CodePrefixName	varchar(100),
@CodePrefixKey nvarchar(200),
@ModifiedBy	int,
@ModifiedOn	datetime,
@ModifiedByIP	nvarchar(200)
AS
BEGIN
	
	SET NOCOUNT ON;

	update tbl_CodePrefixes
	set Name = @CodePrefixName,
		CodePrefixKey = @CodePrefixKey,
		ModifiedBy = @ModifiedBy,
		ModifiedOn = @ModifiedOn,
		ModifiedByIP = @ModifiedByIP
		where CodePrefixID = @CodePrefixID

	if(@@ROWCOUNT > 0)
	begin
	select 
		cp.CodePrefixID,
		cp.Name as CodePrefixName
	from tbl_CodePrefixes cp
	where cp.CodePrefixID = @CodePrefixID
	end

END

/*

exec usp_CodePrefixes_Update 
@CodePrefixID = 1,
@CodePrefixName = 'fdfadf',
@CodePrefixKey = '',
@ModifiedBy = 1,
@ModifiedOn = '2023-03-11 23:52:32.403',
@ModifiedByIP = '',

*/
GO
/****** Object:  StoredProcedure [dbo].[usp_Company_Add]    Script Date: 3/28/2023 12:15:30 PM ******/
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
@CreatedByIP	nvarchar(200),
@SiteThemeSetting nvarchar(max)
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
		ModifiedByIP,
		SiteThemeSetting
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
		@CreatedByIP,
		@SiteThemeSetting
	)

	SET @CompanyID = SCOPE_IDENTITY();

	exec usp_CompanyCode_Generate @CompanyID = @CompanyID,@CreatedOn = @CreatedOn

	exec usp_CompanyAccount_Open @CompanyID = @CompanyID,@BranchID = 0;

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
@CreatedByIP = '',
@SiteThemeSetting = ''

*/
GO
/****** Object:  StoredProcedure [dbo].[usp_Company_Branch_GetAll]    Script Date: 3/28/2023 12:15:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Aqib Ehsan>
-- Create date: <Mar 1,2023>
-- Description:	<Get All Company, Branch Data>
-- =============================================
CREATE PROCEDURE [dbo].[usp_Company_Branch_GetAll]
	
AS
BEGIN
	
	SET NOCOUNT ON;

    select 
	CompanyID,
	Name as CompanyName 
	from tbl_Company


	select 
	b.CompanyID,
	b.BranchID,
	b.Name as BranchName 
	from tbl_Branch b
	inner join tbl_Company cmpy on cmpy.CompanyID = b.CompanyID
END

/*

usp_Company_Branch_GetAll

*/
GO
/****** Object:  StoredProcedure [dbo].[usp_Company_GetAll]    Script Date: 3/28/2023 12:15:30 PM ******/
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
		c.PostalAddress2,
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
		musr.FirstName+' '+musr.LastName as ModifiedByUserName ,
		c.CompanyCode
	from tbl_Company c
	inner join tbl_City pc on pc.CityID = c.PostalCityID
	inner join tbl_State ps on ps.StateID = c.PostalStateID
	inner join tbl_Country pcon on pcon.CountryID = c.PostalCountryID
	inner join tbl_City bc on bc.CityID = c.BillingCityID
	inner join tbl_State bs on bs.StateID = c.BillingStateID
	inner join tbl_Country bcon on bcon.CountryID = c.BillingCountryID
	inner join tbl_BusinessType bt on bt.BusinessTypeID = c.BusinessTypeID
	inner join tbl_TimeZones tz on tz.TimeZoneID = c.TimeZoneID
	inner join tbl_Users as cusr on cusr.UserID = c.CreatedBy
	inner join tbl_Users as musr on musr.UserID = c.ModifiedBy

END

/*

usp_Company_GetAll

*/
GO
/****** Object:  StoredProcedure [dbo].[usp_Company_GetCompanyByID]    Script Date: 3/28/2023 12:15:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Aqib Ehsan>
-- Create date: <Feb 22,2023>
-- Description:	<Get Company By ID>
-- =============================================
CREATE PROCEDURE [dbo].[usp_Company_GetCompanyByID]
@CompanyID int
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
		c.PostalStateID,
		c.PostalZipCode,
		c.PostalCountryID,
		c.BillingPhone,
		c.BillingAddress1,
		c.BillingAddress2,
		c.BillingCityID,
		c.BillingStateID,
		c.BillingZipCode,
		c.BillingCountryID,
		c.CompanyLogo,
		c.NTN,
		c.STN,
		c.WebsiteURL,
		c.POSID,
		c.BusinessTypeID,
		c.TimeZoneID,
		c.NoOfUsers,
		c.IsAllowPowerBy,
		c.PoweredBy,
		c.CreatedBy,
		c.CreatedOn,
		c.CreatedByIP,
		c.ModifiedBy,
		c.ModifiedOn,
		c.ModifiedByIP,
		c.CompanyCode,
		c.SiteThemeSetting
	from tbl_Company c
	where c.CompanyID = @CompanyID

END

/*

usp_Company_GetCompanyByID @CompanyID = 3

*/
GO
/****** Object:  StoredProcedure [dbo].[usp_Company_Update]    Script Date: 3/28/2023 12:15:30 PM ******/
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
@ModifiedByIP	nvarchar(200),
@SiteThemeSetting nvarchar(max)
AS
BEGIN
	
	SET NOCOUNT ON;

	declare @CompanyPre_Logo nvarchar(max);

	if(@CompanyLogo = '')
	begin
	select @CompanyPre_Logo = CompanyLogo 
	from tbl_Company 
	where CompanyID = @CompanyID
	   
	set @CompanyLogo = @CompanyPre_Logo;
	end

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
		ModifiedByIP = @ModifiedByIP,
		SiteThemeSetting = @SiteThemeSetting
	where CompanyID = @CompanyID

	if(@@ROWCOUNT > 0)
	begin
		select CompanyID,Name as CompanyName,
		CompanyLogo
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
@ModifiedByIP = '',
@SiteThemeSetting = ''
*/
GO
/****** Object:  StoredProcedure [dbo].[usp_CompanyAccount_Open]    Script Date: 3/28/2023 12:15:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Aqib Ehsan>
-- Create date: <Mar 15,2023>
-- Description:	<Open Company Account>
-- =============================================
CREATE PROCEDURE [dbo].[usp_CompanyAccount_Open]
@CompanyID int,
@BranchID int
AS
BEGIN
	
	SET NOCOUNT ON;

	insert into tbl_AccountsByCompanyBranch
	(
		AccountID,
		AccountCode,
		Name,
		IsSubAccountOf,
		Description,
		IsActive,
		CompanyID,
		BranchID,
		CreatedBy,
		CreatedOn,
		CreatedByIP,
		ModifiedBy,
		ModifiedOn,
		ModifiedByIP,
		AccountCodeID
	)
	select 
	AccountID,
	AccountCode,
	Name,
	IsSubAccountOf,
	Description,
	IsActive,
	@CompanyID,
	@BranchID,
	CreatedBy,
	CreatedOn,
	CreatedByIP,
	ModifiedBy,
	ModifiedOn,
	ModifiedByIP,
	AccountCodeID 
	from tbl_Accounts
	where IsSystemAccount = 1

END

/*

exec usp_CompanyAccount_Open 
@CompanyID = 1,
@BranchID = 1

*/
GO
/****** Object:  StoredProcedure [dbo].[usp_CompanyCode_Generate]    Script Date: 3/28/2023 12:15:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Aqib Ehsan>
-- Create date: <Mar 14,2023>
-- Description:	<Generate Company Code>
-- =============================================
CREATE PROCEDURE [dbo].[usp_CompanyCode_Generate]
@CompanyID int,
@CreatedOn datetime
AS
BEGIN
	SET NOCOUNT ON;

	declare @CompanyCode nvarchar(100);
	declare @LastCompanyCodeID int;
	declare @CodePrefix varchar(100);
	DECLARE @LastRecordYear NVARCHAR(15)
		DECLARE @CurrentRecordYear NVARCHAR(15)
	 
	select top 1 @LastCompanyCodeID = isnull(CompanyCodeID,0),
	@LastRecordYear = Format(CreatedOn, 'yy')
	from tbl_Company
	where CompanyID <> @CompanyID
	order by CompanyID desc

	select @CodePrefix = Name 
	from tbl_CodePrefixes 
	where CodePrefixKey = 'company-code'

	if(@LastCompanyCodeID is null) set @LastCompanyCodeID = 0;

	SET @CurrentRecordYear = FORMAT(@CreatedOn, 'yy')
	
	if(@CurrentRecordYear <> @LastRecordYear)
	begin
		set @LastCompanyCodeID = 1;
		set @CompanyCode = @CodePrefix+'-'+@CurrentRecordYear+'-00000'+cast(@LastCompanyCodeID AS VARCHAR(15));

		update tbl_Company
		set CompanyCodeID = @LastCompanyCodeID,
		CompanyCode = @CompanyCode
		where CompanyID = @CompanyID

	end
	else
	begin

		set @LastCompanyCodeID = @LastCompanyCodeID + 1;
		
		IF LEN(@LastCompanyCodeID) = 1
			BEGIN
				set @CompanyCode = @CodePrefix+'-'+@CurrentRecordYear+'-00000'+cast(@LastCompanyCodeID AS VARCHAR(15));
			END
			ELSE IF LEN(@LastCompanyCodeID + 1) = 2
			BEGIN
				set @CompanyCode = @CodePrefix+'-'+@CurrentRecordYear+'-0000'+cast(@LastCompanyCodeID AS VARCHAR(15));
			END
			ELSE IF LEN(@LastCompanyCodeID + 1) = 3
			BEGIN
				set @CompanyCode = @CodePrefix+'-'+@CurrentRecordYear+'-000'+cast(@LastCompanyCodeID AS VARCHAR(15));
			END
			ELSE IF LEN(@LastCompanyCodeID + 1) = 4
			BEGIN
				set @CompanyCode = @CodePrefix+'-'+@CurrentRecordYear+'-00'+cast(@LastCompanyCodeID AS VARCHAR(15));
			END
			ELSE IF LEN(@LastCompanyCodeID + 1) = 5
			BEGIN
				set @CompanyCode = @CodePrefix+'-'+@CurrentRecordYear+'-0'+cast(@LastCompanyCodeID AS VARCHAR(15));
			END
			ELSE IF LEN(@LastCompanyCodeID + 1) = 6
			BEGIN
				set @CompanyCode = @CodePrefix+'-'+@CurrentRecordYear+'-'+cast(@LastCompanyCodeID AS VARCHAR(15));
			END

		update tbl_Company
		set CompanyCodeID = @LastCompanyCodeID,
		CompanyCode = @CompanyCode
		where CompanyID = @CompanyID

	end

	--select @LastCompanyCodeID,@CompanyCode

END

/*

exec usp_CompanyCode_Generate @CompanyID = 1,@CreatedOn = '2022-01-12 10:55:29.930'

*/


GO
/****** Object:  StoredProcedure [dbo].[usp_Country_Add]    Script Date: 3/28/2023 12:15:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Aqib Ehsan>
-- Create date: <Feb 06,2023>
-- Description:	<Add Country>
-- =============================================
CREATE PROCEDURE [dbo].[usp_Country_Add]
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

	exec usp_Country_Code_Generate @CountryID = @CountryID,@CreatedOn = @CreatedOn

	select 
		ctry.CountryID,
		ctry.CountryCode,
		ctry.Name as CountryName
	from tbl_Country ctry
	where CountryID = @CountryID

END


/*

usp_Country_Add 
@CountryCode = 'PK',
@CountryName = 'Pakistan',
@CreatedBy = 1,
@CreatedOn = '2023-01-12 10:42:29.930',
@CreatedByIP = ''

*/
GO
/****** Object:  StoredProcedure [dbo].[usp_Country_Code_Generate]    Script Date: 3/28/2023 12:15:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Aqib Ehsan>
-- Create date: <Mar 14,2023>
-- Description:	<Generate Company Code>
-- =============================================
CREATE PROCEDURE [dbo].[usp_Country_Code_Generate]
@CountryID int,
@CreatedOn datetime
AS
BEGIN
	SET NOCOUNT ON;

	declare @Country_Code nvarchar(100);
	declare @LastCountry_CodeID int;
	declare @CodePrefix varchar(100);
	DECLARE @LastRecordYear NVARCHAR(15)
		DECLARE @CurrentRecordYear NVARCHAR(15)
	 
	select top 1 @LastCountry_CodeID = ISNULL(Country_CodeID,0),
	@LastRecordYear = Format(CreatedOn, 'yy')
	from tbl_Country
	where CountryID <> @CountryID
	order by CountryID desc

	select @CodePrefix = Name 
	from tbl_CodePrefixes 
	where CodePrefixKey = 'country-code'

	if(@LastCountry_CodeID is null)set @LastCountry_CodeID = 0;

	SET @CurrentRecordYear = FORMAT(@CreatedOn, 'yy')
	
	if(@CurrentRecordYear <> @LastRecordYear)
	begin
		set @LastCountry_CodeID = 1;
		set @Country_Code = @CodePrefix+'-'+@CurrentRecordYear+'-00000'+cast(@LastCountry_CodeID AS VARCHAR(15));

		update tbl_Country
		set Country_CodeID = @LastCountry_CodeID,
		Country_Code = @Country_Code
		where CountryID = @CountryID

	end
	else
	begin

		set @LastCountry_CodeID = @LastCountry_CodeID + 1;
		
		IF LEN(@LastCountry_CodeID) = 1
			BEGIN
				set @Country_Code = @CodePrefix+'-'+@CurrentRecordYear+'-00000'+cast(@LastCountry_CodeID AS VARCHAR(15));
			END
			ELSE IF LEN(@LastCountry_CodeID + 1) = 2
			BEGIN
				set @Country_Code = @CodePrefix+'-'+@CurrentRecordYear+'-0000'+cast(@LastCountry_CodeID AS VARCHAR(15));
			END
			ELSE IF LEN(@LastCountry_CodeID + 1) = 3
			BEGIN
				set @Country_Code = @CodePrefix+'-'+@CurrentRecordYear+'-000'+cast(@LastCountry_CodeID AS VARCHAR(15));
			END
			ELSE IF LEN(@LastCountry_CodeID + 1) = 4
			BEGIN
				set @Country_Code = @CodePrefix+'-'+@CurrentRecordYear+'-00'+cast(@LastCountry_CodeID AS VARCHAR(15));
			END
			ELSE IF LEN(@LastCountry_CodeID + 1) = 5
			BEGIN
				set @Country_Code = @CodePrefix+'-'+@CurrentRecordYear+'-0'+cast(@LastCountry_CodeID AS VARCHAR(15));
			END
			ELSE IF LEN(@LastCountry_CodeID + 1) = 6
			BEGIN
				set @Country_Code = @CodePrefix+'-'+@CurrentRecordYear+'-'+cast(@LastCountry_CodeID AS VARCHAR(15));
			END

		update tbl_Country
		set Country_CodeID = @LastCountry_CodeID,
		Country_Code = @Country_Code
		where CountryID = @CountryID

	end

	--select @LastCountry_CodeID,@Country_Code

END

/*

exec usp_Country_Code_Generate @CountryID = 2,@CreatedOn = '2022-01-12 10:55:29.930'

*/


GO
/****** Object:  StoredProcedure [dbo].[usp_Country_GetAll]    Script Date: 3/28/2023 12:15:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Aqib Ehsan>
-- Create date: <Feb 05,2023>
-- Description:	<Get All Country>
-- =============================================
CREATE PROCEDURE [dbo].[usp_Country_GetAll]
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
		musr.FirstName+' '+musr.LastName as ModifiedByUserName,
		ctry.Country_Code
	from tbl_Country ctry
	inner join tbl_Users as cusr on cusr.UserID = ctry.CreatedBy
	inner join tbl_Users as musr on musr.UserID = ctry.ModifiedBy
END


/*

usp_Country_GetAll

*/
GO
/****** Object:  StoredProcedure [dbo].[usp_Country_GetCountryByID]    Script Date: 3/28/2023 12:15:30 PM ******/
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
		ctry.ModifiedByIP,
		ctry.Country_Code
	from tbl_Country ctry
	where CountryID = @CountryID
END


/*

usp_Country_GetCountryByID @CountryID = 1

*/
GO
/****** Object:  StoredProcedure [dbo].[usp_Country_Update]    Script Date: 3/28/2023 12:15:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Aqib Ehsan>
-- Create date: <Feb 06,2023>
-- Description:	<Update Country>
-- =============================================
CREATE PROCEDURE [dbo].[usp_Country_Update]
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
/****** Object:  StoredProcedure [dbo].[usp_Customer_Add]    Script Date: 3/28/2023 12:15:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Aqib Ehsan>
-- Create date: <Feb 23,2023>
-- Description:	<Add Customer>
-- =============================================
CREATE PROCEDURE [dbo].[usp_Customer_Add]
@CustomerName	nvarchar(200),
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
@CreatedByIP	nvarchar(200),
@CompanyID	int,
@BranchID	int
AS
BEGIN
	
	SET NOCOUNT ON;

	declare @CustomerID int;

	insert into tbl_Customer
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
		ModifiedByIP,
		CompanyID,
		BranchID
	)
	values
	(
		@CustomerName,
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
		@CreatedByIP,
		@CompanyID,
		@BranchID
	)

	SET @CustomerID = SCOPE_IDENTITY();

	exec usp_CustomerCode_Generate @CustomerID = @CustomerID,@CompanyID =@CompanyID

	select
	Name as CustomerName
	from tbl_Customer 
	where CustomerID = @CustomerID
    
END

/*

usp_Customer_Add
@CustomerName = 'asd fsf',
@PostalPhone = 'asdf as',
@PostalAddress1 = 'asdfas ',
@PostalAddress2 = 'qwrwr',
@PostalCityID = 1,
@PostalStateID = 1,
@PostalZipCode = 'kjkltot',
@PostalCountryID = 1,
@BillingPhone = 'sdf saf ',
@BillingAddress1 = 'a sfas f',
@BillingAddress2 = 'qetert ',
@BillingCityID = 1,
@BillingStateID = 1,
@BillingZipCode = 'zcvaa fad',
@BillingCountryID = 1,
@IsActive = 1,
@CreatedBy = 1,
@CreatedOn = '2023-01-12 12:58:38.327',
@CreatedByIP = '',
@CompanyID = 1,
@BranchID = 1

*/
GO
/****** Object:  StoredProcedure [dbo].[usp_Customer_GetAll]    Script Date: 3/28/2023 12:15:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Aqib Ehsan>
-- Create date: <Feb 23,2023>
-- Description:	<Get All Customer>
-- =============================================
CREATE PROCEDURE [dbo].[usp_Customer_GetAll]
	
AS
BEGIN
	
	SET NOCOUNT ON;

    select
		cust.CustomerID,
		cust.Name as CustomerName,
		cust.PostalPhone,
		cust.PostalAddress1,
		cust.PostalAddress2,
		cust.PostalCityID,
		pc.Name as PostalCityName,
		cust.PostalStateID,
		ps.Name as PostalStateName,
		cust.PostalZipCode,
		cust.PostalCountryID,
		pcon.Name as PostalCountryName,
		cust.BillingPhone,
		cust.BillingAddress1,
		cust.BillingAddress2,
		cust.BillingCityID,
		bc.Name as BillingCityName,
		cust.BillingStateID,
		bs.Name as BillingStateName,
		cust.BillingZipCode,
		cust.BillingCountryID,
		bcon.Name as BillingCountryName,
		cust.IsActive,
		cust.CreatedBy,
		cust.CreatedOn,
		cust.CreatedByIP,
		cust.ModifiedBy,
		cust.ModifiedOn,
		cust.ModifiedByIP,
		cusr.FirstName+' '+cusr.LastName as CreatedByUserName,
		musr.FirstName+' '+musr.LastName as ModifiedByUserName,
		cust.CompanyID,
		cmpy.Name as CompanyName,
		cust.BranchID,
		b.Name as BranchName,
		cust.CustomerCode
	from tbl_Customer cust
	inner join tbl_City pc on pc.CityID = cust.PostalCityID
	inner join tbl_State ps on ps.StateID = cust.PostalStateID
	inner join tbl_Country pcon on pcon.CountryID = cust.PostalCountryID
	inner join tbl_City bc on bc.CityID = cust.BillingCityID
	inner join tbl_State bs on bs.StateID = cust.BillingStateID
	inner join tbl_Country bcon on bcon.CountryID = cust.BillingCountryID
	inner join tbl_Users as cusr on cusr.UserID = cust.CreatedBy
	inner join tbl_Users as musr on musr.UserID = cust.ModifiedBy
	inner join tbl_Company cmpy on cmpy.CompanyID = cust.CompanyID
	inner join  tbl_Branch b on b.BranchID = cust.BranchID
END

/*

usp_Customer_GetAll

*/

GO
/****** Object:  StoredProcedure [dbo].[usp_Customer_GetAllActive]    Script Date: 3/28/2023 12:15:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Aqib Ehsan>
-- Create date: <Feb 23,2023>
-- Description:	<Get All Active Customer>
-- =============================================
CREATE PROCEDURE [dbo].[usp_Customer_GetAllActive]
	
AS
BEGIN
	
	SET NOCOUNT ON;

    select
		cust.CustomerID,
		cust.Name as CustomerName,
		cust.PostalPhone,
		cust.PostalAddress1,
		cust.PostalAddress2,
		cust.PostalCityID,
		pc.Name as PostalCityName,
		cust.PostalStateID,
		ps.Name as PostalStateName,
		cust.PostalZipCode,
		cust.PostalCountryID,
		pcon.Name as PostalCountryName,
		cust.BillingPhone,
		cust.BillingAddress1,
		cust.BillingAddress2,
		cust.BillingCityID,
		bc.Name as BillingCityName,
		cust.BillingStateID,
		bs.Name as BillingStateName,
		cust.BillingZipCode,
		cust.BillingCountryID,
		bcon.Name as BillingCountryName,
		cust.IsActive,
		cust.CreatedBy,
		cust.CreatedOn,
		cust.CreatedByIP,
		cust.ModifiedBy,
		cust.ModifiedOn,
		cust.ModifiedByIP,
		cusr.FirstName+' '+cusr.LastName as CreatedByUserName,
		musr.FirstName+' '+musr.LastName as ModifiedByUserName,
		cust.CompanyID,
		cmpy.Name as CompanyName,
		cust.BranchID,
		b.Name as BranchName,
		cust.CustomerCode
	from tbl_Customer cust
	inner join tbl_City pc on pc.CityID = cust.PostalCityID
	inner join tbl_State ps on ps.StateID = cust.PostalStateID
	inner join tbl_Country pcon on pcon.CountryID = cust.PostalCountryID
	inner join tbl_City bc on bc.CityID = cust.BillingCityID
	inner join tbl_State bs on bs.StateID = cust.BillingStateID
	inner join tbl_Country bcon on bcon.CountryID = cust.BillingCountryID
	inner join tbl_Users as cusr on cusr.UserID = cust.CreatedBy
	inner join tbl_Users as musr on musr.UserID = cust.ModifiedBy
	inner join tbl_Company cmpy on cmpy.CompanyID = cust.CompanyID
	inner join  tbl_Branch b on b.BranchID = cust.BranchID
	where cust.IsActive = 1
END

/*

usp_Customer_GetAllActive

*/

GO
/****** Object:  StoredProcedure [dbo].[usp_Customer_GetCustomerByID]    Script Date: 3/28/2023 12:15:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Aqib Ehsan>
-- Create date: <Feb 23,2023>
-- Description:	<Get Customer By ID>
-- =============================================
CREATE PROCEDURE [dbo].[usp_Customer_GetCustomerByID]
@CustomerID int	
AS
BEGIN
	
	SET NOCOUNT ON;

    select
		cust.CustomerID,
		cust.Name as CustomerName,
		cust.PostalPhone,
		cust.PostalAddress1,
		cust.PostalAddress2,
		cust.PostalCityID,
		cust.PostalStateID,
		cust.PostalZipCode,
		cust.PostalCountryID,
		cust.BillingPhone,
		cust.BillingAddress1,
		cust.BillingAddress2,
		cust.BillingCityID,
		cust.BillingStateID,
		cust.BillingZipCode,
		cust.BillingCountryID,
		cust.IsActive,
		cust.CreatedBy,
		cust.CreatedOn,
		cust.CreatedByIP,
		cust.ModifiedBy,
		cust.ModifiedOn,
		cust.ModifiedByIP,
		cust.CompanyID,
		cust.BranchID,
		cust.CustomerCode
	from tbl_Customer cust
	where CustomerID = @CustomerID
END

/*

usp_Customer_GetCustomerByID @CustomerID = 3

*/

GO
/****** Object:  StoredProcedure [dbo].[usp_Customer_Update]    Script Date: 3/28/2023 12:15:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Aqib Ehsan>
-- Create date: <Feb 23,2023>
-- Description:	<Update Customer>
-- =============================================
CREATE PROCEDURE [dbo].[usp_Customer_Update]
@CustomerID int,
@CustomerName	nvarchar(200),
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
@ModifiedByIP	nvarchar(200),
@CompanyID	int,
@BranchID	int
AS
BEGIN
	
	SET NOCOUNT ON;

	update tbl_Customer
	set Name = @CustomerName,
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
		ModifiedByIP = @ModifiedByIP,
		CompanyID = @CompanyID,
		BranchID = @BranchID
	where CustomerID = @CustomerID

	if(@@ROWCOUNT > 0)
	begin
		select
		Name as CustomerName
		from tbl_Customer 
		where CustomerID = @CustomerID
    end
END

/*

usp_Customer_Update
@CustomerID = 1,
@CustomerName = 'asd fsf',
@PostalPhone = 'asdf as',
@PostalAddress1 = 'asdfas ',
@PostalAddress2 = 'qwrwr',
@PostalCityID = 1,
@PostalStateID = 1,
@PostalZipCode = 'kjkltot',
@PostalCountryID = 1,
@BillingPhone = 'sdf saf ',
@BillingAddress1 = 'a sfas f',
@BillingAddress2 = 'qetert ',
@BillingCityID = 1,
@BillingStateID = 1,
@BillingZipCode = 'zcvaa fad',
@BillingCountryID = 1,
@IsActive = 1,
@ModifiedBy = 1,
@ModifiedOn = '2023-01-12 12:58:38.327',
@ModifiedByIP = '',
@CompanyID = 1,
@BranchID = 1

*/
GO
/****** Object:  StoredProcedure [dbo].[usp_CustomerCode_Generate]    Script Date: 3/28/2023 12:15:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Aqib Ehsan>
-- Create date: <Mar 14,2023>
-- Description:	<Generate Customer Code>
-- =============================================
create PROCEDURE [dbo].[usp_CustomerCode_Generate]
@CustomerID int,
@CompanyID int
AS
BEGIN
	SET NOCOUNT ON;

	declare @CustomerCode nvarchar(100);
	declare @LastCustomerCodeID int;
	declare @CodePrefix varchar(100);
	 
	select top 1 @LastCustomerCodeID = CustomerCodeID
	from tbl_Customer
	where CompanyID = @CompanyID
	and CustomerID <> @CustomerID
	order by CustomerID desc

	select @CodePrefix = Name 
	from tbl_CodePrefixes 
	where CodePrefixKey = 'customer-code'
	
	if(@LastCustomerCodeID is null)
	begin
		set @LastCustomerCodeID = 1;
		set @CustomerCode = @CodePrefix+'-'+cast(@CompanyID AS VARCHAR(15))+'-00000'+cast(@LastCustomerCodeID AS VARCHAR(15));

		update tbl_Customer
		set CustomerCodeID = @LastCustomerCodeID,
		CustomerCode = @CustomerCode
		where CustomerID = @CustomerID

	end
	else
	begin
		set @LastCustomerCodeID = @LastCustomerCodeID + 1;

		IF LEN(@LastCustomerCodeID) = 1
			BEGIN
				set @CustomerCode = @CodePrefix+'-'+cast(@CompanyID AS VARCHAR(15))+'-00000'+cast(@LastCustomerCodeID AS VARCHAR(15));
			END
			ELSE IF LEN(@LastCustomerCodeID + 1) = 2
			BEGIN
				set @CustomerCode = @CodePrefix+'-'+cast(@CompanyID AS VARCHAR(15))+'-0000'+cast(@LastCustomerCodeID AS VARCHAR(15));
			END
			ELSE IF LEN(@LastCustomerCodeID + 1) = 3
			BEGIN
				set @CustomerCode = @CodePrefix+'-'+cast(@CompanyID AS VARCHAR(15))+'-000'+cast(@LastCustomerCodeID AS VARCHAR(15));
			END
			ELSE IF LEN(@LastCustomerCodeID + 1) = 4
			BEGIN
				set @CustomerCode = @CodePrefix+'-'+cast(@CompanyID AS VARCHAR(15))+'-00'+cast(@LastCustomerCodeID AS VARCHAR(15));
			END
			ELSE IF LEN(@LastCustomerCodeID + 1) = 5
			BEGIN
				set @CustomerCode = @CodePrefix+'-'+cast(@CompanyID AS VARCHAR(15))+'-0'+cast(@LastCustomerCodeID AS VARCHAR(15));
			END
			ELSE IF LEN(@LastCustomerCodeID + 1) = 6
			BEGIN
				set @CustomerCode = @CodePrefix+'-'+cast(@CompanyID AS VARCHAR(15))+'-'+cast(@LastCustomerCodeID AS VARCHAR(15));
			END

		update tbl_Customer
		set CustomerCodeID = @LastCustomerCodeID,
		CustomerCode = @CustomerCode
		where CustomerID = @CustomerID

	end

	--select @LastCustomerCodeID,@CustomerCode

END

/*

exec usp_CustomerCode_Generate @CustomerID = 11,@CompanyID = 1

*/


GO
/****** Object:  StoredProcedure [dbo].[usp_Module_Add]    Script Date: 3/28/2023 12:15:30 PM ******/
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
/****** Object:  StoredProcedure [dbo].[usp_Module_GetAll]    Script Date: 3/28/2023 12:15:30 PM ******/
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
/****** Object:  StoredProcedure [dbo].[usp_Module_GetAllActive]    Script Date: 3/28/2023 12:15:30 PM ******/
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
/****** Object:  StoredProcedure [dbo].[usp_Module_GetModuleByID]    Script Date: 3/28/2023 12:15:30 PM ******/
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
/****** Object:  StoredProcedure [dbo].[usp_Module_Update]    Script Date: 3/28/2023 12:15:30 PM ******/
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
/****** Object:  StoredProcedure [dbo].[usp_ModulePage_Add]    Script Date: 3/28/2023 12:15:30 PM ******/
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
/****** Object:  StoredProcedure [dbo].[usp_ModulePage_Update]    Script Date: 3/28/2023 12:15:30 PM ******/
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
/****** Object:  StoredProcedure [dbo].[usp_ModulePageAction_Add]    Script Date: 3/28/2023 12:15:30 PM ******/
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
/****** Object:  StoredProcedure [dbo].[usp_ModulePages_GetAll]    Script Date: 3/28/2023 12:15:30 PM ******/
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
/****** Object:  StoredProcedure [dbo].[usp_ModulePages_GetAllActive]    Script Date: 3/28/2023 12:15:30 PM ******/
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
/****** Object:  StoredProcedure [dbo].[usp_ModulePages_GetModulePageByID]    Script Date: 3/28/2023 12:15:30 PM ******/
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
/****** Object:  StoredProcedure [dbo].[usp_Modules_ModulePages_GetAll]    Script Date: 3/28/2023 12:15:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Aqib Ehsan>
-- Create date: <Mar 16,2023>
-- Description:	<Get All Modules and Module Pages>
-- =============================================
CREATE PROCEDURE [dbo].[usp_Modules_ModulePages_GetAll]
AS
BEGIN

	SET NOCOUNT ON;

	select 
		mdl.ModuleID,
		mdl.Name ModuleName
	from tbl_Modules as mdl
	where mdl.IsActive = 1 
	order by mdl.OrderN asc


	select distinct
		mdlp.ModuleID,
		mdlp.ControllerURL
	from tbl_ModulePages as mdlp

END

/*

exec usp_Modules_ModulePages_GetAll

*/

GO
/****** Object:  StoredProcedure [dbo].[usp_Product_Add]    Script Date: 3/28/2023 12:15:30 PM ******/
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

	exec usp_ProductCode_Generate @productID = @ProductID,@CompanyID = @CompanyID

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
/****** Object:  StoredProcedure [dbo].[usp_Product_Attribute_Brand_Category_Type_GetAll]    Script Date: 3/28/2023 12:15:30 PM ******/
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
/****** Object:  StoredProcedure [dbo].[usp_Product_GetAll]    Script Date: 3/28/2023 12:15:30 PM ******/
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
		musr.FirstName+' '+musr.LastName as ModifiedByUserName,
		p.ProductCode
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
/****** Object:  StoredProcedure [dbo].[usp_Product_GetAllActive]    Script Date: 3/28/2023 12:15:30 PM ******/
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
		musr.FirstName+' '+musr.LastName as ModifiedByUserName,
		p.ProductCode
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
/****** Object:  StoredProcedure [dbo].[usp_Product_GetProductByID]    Script Date: 3/28/2023 12:15:30 PM ******/
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
		p.CompanyID,
		p.ProductCode
	from tbl_Product p
	where p.productID = @ProductID
END


/*

usp_Product_GetProductByID @ProductID = 1

*/
GO
/****** Object:  StoredProcedure [dbo].[usp_Product_Update]    Script Date: 3/28/2023 12:15:30 PM ******/
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
/****** Object:  StoredProcedure [dbo].[usp_ProductAttribute_Add]    Script Date: 3/28/2023 12:15:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Aqib Ehsan>
-- Create date: <Feb 14,2023>
-- Description:	<Add Product Attribute>
-- =============================================
CREATE PROCEDURE [dbo].[usp_ProductAttribute_Add]
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

	exec usp_ProductAttributeCode_Generate @ProductAttributeID = @ProductAttributeID,@CreatedOn = @CreatedOn

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
/****** Object:  StoredProcedure [dbo].[usp_ProductAttribute_GetAll]    Script Date: 3/28/2023 12:15:30 PM ******/
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
		musr.FirstName+' '+musr.LastName as ModifiedByUserName,
		pa.ProductAttributeCode
	from tbl_ProductAttributes pa
	inner join tbl_Users as cusr on cusr.UserID = pa.CreatedBy
	inner join tbl_Users as musr on musr.UserID = pa.ModifiedBy
END


/*

usp_ProductAttribute_GetAll

*/
GO
/****** Object:  StoredProcedure [dbo].[usp_ProductAttribute_GetProductAttributeByID]    Script Date: 3/28/2023 12:15:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Aqib Ehsan>
-- Create date: <Feb 14,2023>
-- Description:	<Get Product Attribute By ID>
-- =============================================
CREATE PROCEDURE [dbo].[usp_ProductAttribute_GetProductAttributeByID]
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
		pa.ModifiedByIP,
		pa.ProductAttributeCode
	from tbl_ProductAttributes pa
	where pa.ProductAttributeID = @ProductAttributeID
END


/*

usp_ProductAttribute_GetProductAttributeByID @ProductAttributeID = 1

*/
GO
/****** Object:  StoredProcedure [dbo].[usp_ProductAttribute_Update]    Script Date: 3/28/2023 12:15:30 PM ******/
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
/****** Object:  StoredProcedure [dbo].[usp_ProductAttributeCode_Generate]    Script Date: 3/28/2023 12:15:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Aqib Ehsan>
-- Create date: <Mar 14,2023>
-- Description:	<Generate Product Attribute Code>
-- =============================================
CREATE PROCEDURE [dbo].[usp_ProductAttributeCode_Generate]
@ProductAttributeID int,
@CreatedOn datetime
AS
BEGIN
	SET NOCOUNT ON;

	declare @ProductAttributeCode nvarchar(100);
	declare @LastProductAttributeCodeID int;
	declare @CodePrefix varchar(100);
	DECLARE @LastRecordYear NVARCHAR(15)
		DECLARE @CurrentRecordYear NVARCHAR(15)
	 
	select top 1 @LastProductAttributeCodeID = ISNULL(ProductAttributeCodeID,0),
	@LastRecordYear = Format(CreatedOn, 'yy')
	from tbl_ProductAttributes
	where ProductAttributeID <> @ProductAttributeID
	order by ProductAttributeID desc

	select @CodePrefix = Name 
	from tbl_CodePrefixes 
	where CodePrefixKey = 'productattribute-code'

	if(@LastProductAttributeCodeID is null)set @LastProductAttributeCodeID = 0;

	SET @CurrentRecordYear = FORMAT(@CreatedOn, 'yy')
	
	if(@CurrentRecordYear <> @LastRecordYear)
	begin
		set @LastProductAttributeCodeID = 1;
		set @ProductAttributeCode = @CodePrefix+'-'+@CurrentRecordYear+'-00000'+cast(@LastProductAttributeCodeID AS VARCHAR(15));

		update tbl_ProductAttributes
		set ProductAttributeCodeID = @LastProductAttributeCodeID,
		ProductAttributeCode = @ProductAttributeCode
		where ProductAttributeID = @ProductAttributeID

	end
	else
	begin

		set @LastProductAttributeCodeID = @LastProductAttributeCodeID + 1;
		
		IF LEN(@LastProductAttributeCodeID) = 1
			BEGIN
				set @ProductAttributeCode = @CodePrefix+'-'+@CurrentRecordYear+'-00000'+cast(@LastProductAttributeCodeID AS VARCHAR(15));
			END
			ELSE IF LEN(@LastProductAttributeCodeID + 1) = 2
			BEGIN
				set @ProductAttributeCode = @CodePrefix+'-'+@CurrentRecordYear+'-0000'+cast(@LastProductAttributeCodeID AS VARCHAR(15));
			END
			ELSE IF LEN(@LastProductAttributeCodeID + 1) = 3
			BEGIN
				set @ProductAttributeCode = @CodePrefix+'-'+@CurrentRecordYear+'-000'+cast(@LastProductAttributeCodeID AS VARCHAR(15));
			END
			ELSE IF LEN(@LastProductAttributeCodeID + 1) = 4
			BEGIN
				set @ProductAttributeCode = @CodePrefix+'-'+@CurrentRecordYear+'-00'+cast(@LastProductAttributeCodeID AS VARCHAR(15));
			END
			ELSE IF LEN(@LastProductAttributeCodeID + 1) = 5
			BEGIN
				set @ProductAttributeCode = @CodePrefix+'-'+@CurrentRecordYear+'-0'+cast(@LastProductAttributeCodeID AS VARCHAR(15));
			END
			ELSE IF LEN(@LastProductAttributeCodeID + 1) = 6
			BEGIN
				set @ProductAttributeCode = @CodePrefix+'-'+@CurrentRecordYear+'-'+cast(@LastProductAttributeCodeID AS VARCHAR(15));
			END

		update tbl_ProductAttributes
		set ProductAttributeCodeID = @LastProductAttributeCodeID,
		ProductAttributeCode = @ProductAttributeCode
		where ProductAttributeID = @ProductAttributeID

	end

	--select @LastProductAttributeCodeID,@ProductAttributeCode

END

/*

exec usp_ProductAttributeCode_Generate @ProductAttributeID = 2,@CreatedOn = '2022-01-12 10:55:29.930'

*/


GO
/****** Object:  StoredProcedure [dbo].[usp_ProductBrand_Add]    Script Date: 3/28/2023 12:15:30 PM ******/
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

	exec usp_ProductBrandCode_Generate @ProductBrandID = @ProductBrandID,@CreatedOn = @CreatedOn

	select 
		pb.ProductBrandID,
		pb.Name as ProductBrandName
	from tbl_ProductBrands pb
	where pb.ProductBrandID = @ProductBrandID
END


/*

usp_ProductBrand_Add 
@ProductBrandName = 'xcfafa',
@CreatedBy = 1,
@CreatedOn = '2023-01-12 10:55:29.930',
@CreatedByIP = ''

*/
GO
/****** Object:  StoredProcedure [dbo].[usp_ProductBrand_GetAll]    Script Date: 3/28/2023 12:15:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Aqib Ehsan>
-- Create date: <Feb 14,2023>
-- Description:	<Get All Product Brand>
-- =============================================
CREATE PROCEDURE [dbo].[usp_ProductBrand_GetAll]
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
		musr.FirstName+' '+musr.LastName as ModifiedByUserName,
		pb.ProductBrandCode
	from tbl_ProductBrands pb
	inner join tbl_Users as cusr on cusr.UserID = pb.CreatedBy
	inner join tbl_Users as musr on musr.UserID = pb.ModifiedBy
END


/*

usp_ProductBrand_GetAll

*/
GO
/****** Object:  StoredProcedure [dbo].[usp_ProductBrand_GetProductBrandByID]    Script Date: 3/28/2023 12:15:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Aqib Ehsan>
-- Create date: <Feb 14,2023>
-- Description:	<Get Product Brand By ID>
-- =============================================
CREATE PROCEDURE [dbo].[usp_ProductBrand_GetProductBrandByID]
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
		pb.ModifiedByIP,
		pb.ProductBrandCode
	from tbl_ProductBrands pb
	where pb.ProductBrandID = @ProductBrandID
END


/*

usp_ProductBrand_GetProductBrandByID @ProductBrandID = 1

*/
GO
/****** Object:  StoredProcedure [dbo].[usp_ProductBrand_Update]    Script Date: 3/28/2023 12:15:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Aqib Ehsan>
-- Create date: <Feb 14,2023>
-- Description:	<Add Product Brand>
-- =============================================
CREATE PROCEDURE [dbo].[usp_ProductBrand_Update]
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
/****** Object:  StoredProcedure [dbo].[usp_ProductBrandCode_Generate]    Script Date: 3/28/2023 12:15:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Aqib Ehsan>
-- Create date: <Mar 14,2023>
-- Description:	<Generate Prodct Brand Code>
-- =============================================
create PROCEDURE [dbo].[usp_ProductBrandCode_Generate]
@ProductBrandID int,
@CreatedOn datetime
AS
BEGIN
	SET NOCOUNT ON;

	declare @ProductBrandCode nvarchar(100);
	declare @LastProductBrandCodeID int;
	declare @CodePrefix varchar(100);
	DECLARE @LastRecordYear NVARCHAR(15)
		DECLARE @CurrentRecordYear NVARCHAR(15)
	 
	select top 1 @LastProductBrandCodeID = ISNULL(ProductBrandCodeID,0),
	@LastRecordYear = Format(CreatedOn, 'yy')
	from tbl_ProductBrands
	where ProductBrandID <> @ProductBrandID
	order by ProductBrandID desc

	select @CodePrefix = Name 
	from tbl_CodePrefixes 
	where CodePrefixKey = 'productBrand-code'

	if(@LastProductBrandCodeID is null)set @LastProductBrandCodeID = 0;

	SET @CurrentRecordYear = FORMAT(@CreatedOn, 'yy')
	
	if(@CurrentRecordYear <> @LastRecordYear)
	begin
		set @LastProductBrandCodeID = 1;
		set @ProductBrandCode = @CodePrefix+'-'+@CurrentRecordYear+'-00000'+cast(@LastProductBrandCodeID AS VARCHAR(15));

		update tbl_ProductBrands
		set ProductBrandCodeID = @LastProductBrandCodeID,
		ProductBrandCode = @ProductBrandCode
		where ProductBrandID = @ProductBrandID

	end
	else
	begin

		set @LastProductBrandCodeID = @LastProductBrandCodeID + 1;
		
		IF LEN(@LastProductBrandCodeID) = 1
			BEGIN
				set @ProductBrandCode = @CodePrefix+'-'+@CurrentRecordYear+'-00000'+cast(@LastProductBrandCodeID AS VARCHAR(15));
			END
			ELSE IF LEN(@LastProductBrandCodeID + 1) = 2
			BEGIN
				set @ProductBrandCode = @CodePrefix+'-'+@CurrentRecordYear+'-0000'+cast(@LastProductBrandCodeID AS VARCHAR(15));
			END
			ELSE IF LEN(@LastProductBrandCodeID + 1) = 3
			BEGIN
				set @ProductBrandCode = @CodePrefix+'-'+@CurrentRecordYear+'-000'+cast(@LastProductBrandCodeID AS VARCHAR(15));
			END
			ELSE IF LEN(@LastProductBrandCodeID + 1) = 4
			BEGIN
				set @ProductBrandCode = @CodePrefix+'-'+@CurrentRecordYear+'-00'+cast(@LastProductBrandCodeID AS VARCHAR(15));
			END
			ELSE IF LEN(@LastProductBrandCodeID + 1) = 5
			BEGIN
				set @ProductBrandCode = @CodePrefix+'-'+@CurrentRecordYear+'-0'+cast(@LastProductBrandCodeID AS VARCHAR(15));
			END
			ELSE IF LEN(@LastProductBrandCodeID + 1) = 6
			BEGIN
				set @ProductBrandCode = @CodePrefix+'-'+@CurrentRecordYear+'-'+cast(@LastProductBrandCodeID AS VARCHAR(15));
			END

		update tbl_ProductBrands
		set ProductBrandCodeID = @LastProductBrandCodeID,
		ProductBrandCode = @ProductBrandCode
		where ProductBrandID = @ProductBrandID

	end

	--select @LastProductBrandCodeID,@ProductBrandCode

END

/*

exec usp_ProductBrandCode_Generate @ProductBrandID = 2,@CreatedOn = '2022-01-12 10:55:29.930'

*/


GO
/****** Object:  StoredProcedure [dbo].[usp_ProductCategory_Add]    Script Date: 3/28/2023 12:15:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Aqib Ehsan>
-- Create date: <Feb 14,2023>
-- Description:	<Add Product Category>
-- =============================================
CREATE PROCEDURE [dbo].[usp_ProductCategory_Add]
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

	exec usp_ProductCategoryCode_Generate @ProductCategoryID = @ProductCategoryID,@CreatedOn = @CreatedOn

	select 
		pc.ProductCategoryID,
		pc.Name as ProductCategoryName
	from tbl_ProductCategory pc
	where pc.ProductCategoryID = @ProductCategoryID
END


/*

usp_ProductCategory_Add 
@ProductCategoryName = 'asdfasf',
@CreatedBy = 1,
@CreatedOn = '2023-01-12 10:55:29.930',
@CreatedByIP = ''

*/
GO
/****** Object:  StoredProcedure [dbo].[usp_ProductCategory_GetAll]    Script Date: 3/28/2023 12:15:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Aqib Ehsan>
-- Create date: <Feb 14,2023>
-- Description:	<Get All Product Category>
-- =============================================
CREATE PROCEDURE [dbo].[usp_ProductCategory_GetAll]
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
		musr.FirstName+' '+musr.LastName as ModifiedByUserName,
		pc.ProductCategoryCode
	from tbl_ProductCategory pc
	inner join tbl_Users as cusr on cusr.UserID = pc.CreatedBy
	inner join tbl_Users as musr on musr.UserID = pc.ModifiedBy
END


/*

usp_ProductCategory_GetAll

*/
GO
/****** Object:  StoredProcedure [dbo].[usp_ProductCategory_GetProductCategoryByID]    Script Date: 3/28/2023 12:15:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Aqib Ehsan>
-- Create date: <Feb 14,2023>
-- Description:	<Get Product Category By ID>
-- =============================================
CREATE PROCEDURE [dbo].[usp_ProductCategory_GetProductCategoryByID]
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
		pc.ModifiedByIP,
		pc.ProductCategoryCode
	from tbl_ProductCategory pc
	where pc.ProductCategoryID = @ProductCategoryID
END


/*

usp_ProductCategory_GetProductCategoryByID @ProductCategoryID = 1

*/
GO
/****** Object:  StoredProcedure [dbo].[usp_ProductCategory_Update]    Script Date: 3/28/2023 12:15:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Aqib Ehsan>
-- Create date: <Feb 14,2023>
-- Description:	<Add Product Category>
-- =============================================
CREATE PROCEDURE [dbo].[usp_ProductCategory_Update]
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
/****** Object:  StoredProcedure [dbo].[usp_ProductCategoryCode_Generate]    Script Date: 3/28/2023 12:15:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Aqib Ehsan>
-- Create date: <Mar 14,2023>
-- Description:	<Generate Product Category Code>
-- =============================================
CREATE PROCEDURE [dbo].[usp_ProductCategoryCode_Generate]
@ProductCategoryID int,
@CreatedOn datetime
AS
BEGIN
	SET NOCOUNT ON;

	declare @ProductCategoryCode nvarchar(100);
	declare @LastProductCategoryCodeID int;
	declare @CodePrefix varchar(100);
	DECLARE @LastRecordYear NVARCHAR(15)
		DECLARE @CurrentRecordYear NVARCHAR(15)
	 
	select top 1 @LastProductCategoryCodeID = ISNULL(ProductCategoryCodeID,0),
	@LastRecordYear = Format(CreatedOn, 'yy')
	from tbl_ProductCategory
	where ProductCategoryID <> @ProductCategoryID
	order by ProductCategoryID desc

	select @CodePrefix = Name 
	from tbl_CodePrefixes 
	where CodePrefixKey = 'productcategory-code'

	if(@LastProductCategoryCodeID is null)set @LastProductCategoryCodeID = 0;

	SET @CurrentRecordYear = FORMAT(@CreatedOn, 'yy')
	
	if(@CurrentRecordYear <> @LastRecordYear)
	begin
		set @LastProductCategoryCodeID = 1;
		set @ProductCategoryCode = @CodePrefix+'-'+@CurrentRecordYear+'-00000'+cast(@LastProductCategoryCodeID AS VARCHAR(15));

		update tbl_ProductCategory
		set ProductCategoryCodeID = @LastProductCategoryCodeID,
		ProductCategoryCode = @ProductCategoryCode
		where ProductCategoryID = @ProductCategoryID

	end
	else
	begin

		set @LastProductCategoryCodeID = @LastProductCategoryCodeID + 1;
		
		IF LEN(@LastProductCategoryCodeID) = 1
			BEGIN
				set @ProductCategoryCode = @CodePrefix+'-'+@CurrentRecordYear+'-00000'+cast(@LastProductCategoryCodeID AS VARCHAR(15));
			END
			ELSE IF LEN(@LastProductCategoryCodeID + 1) = 2
			BEGIN
				set @ProductCategoryCode = @CodePrefix+'-'+@CurrentRecordYear+'-0000'+cast(@LastProductCategoryCodeID AS VARCHAR(15));
			END
			ELSE IF LEN(@LastProductCategoryCodeID + 1) = 3
			BEGIN
				set @ProductCategoryCode = @CodePrefix+'-'+@CurrentRecordYear+'-000'+cast(@LastProductCategoryCodeID AS VARCHAR(15));
			END
			ELSE IF LEN(@LastProductCategoryCodeID + 1) = 4
			BEGIN
				set @ProductCategoryCode = @CodePrefix+'-'+@CurrentRecordYear+'-00'+cast(@LastProductCategoryCodeID AS VARCHAR(15));
			END
			ELSE IF LEN(@LastProductCategoryCodeID + 1) = 5
			BEGIN
				set @ProductCategoryCode = @CodePrefix+'-'+@CurrentRecordYear+'-0'+cast(@LastProductCategoryCodeID AS VARCHAR(15));
			END
			ELSE IF LEN(@LastProductCategoryCodeID + 1) = 6
			BEGIN
				set @ProductCategoryCode = @CodePrefix+'-'+@CurrentRecordYear+'-'+cast(@LastProductCategoryCodeID AS VARCHAR(15));
			END

		update tbl_ProductCategory
		set ProductCategoryCodeID = @LastProductCategoryCodeID,
		ProductCategoryCode = @ProductCategoryCode
		where ProductCategoryID = @ProductCategoryID

	end

	--select @LastProductCategoryCodeID,@ProductCategoryCode

END

/*

exec usp_ProductCategoryCode_Generate @ProductCategoryID = 2,@CreatedOn = '2022-01-12 10:55:29.930'

*/


GO
/****** Object:  StoredProcedure [dbo].[usp_ProductCode_Generate]    Script Date: 3/28/2023 12:15:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Aqib Ehsan>
-- Create date: <Mar 14,2023>
-- Description:	<Generate Product Code>
-- =============================================
create PROCEDURE [dbo].[usp_ProductCode_Generate]
@productID int,
@CompanyID int
AS
BEGIN
	SET NOCOUNT ON;

	declare @ProductCode nvarchar(100);
	declare @LastProductCodeID int;
	declare @CodePrefix varchar(100);
	 
	select top 1 @LastProductCodeID = ProductCodeID
	from tbl_Product
	where CompanyID = @CompanyID
	and productID <> @productID
	order by productID desc

	select @CodePrefix = Name 
	from tbl_CodePrefixes 
	where CodePrefixKey = 'product-code'
	
	if(@LastProductCodeID is null)
	begin
		set @LastProductCodeID = 1;
		set @ProductCode = @CodePrefix+'-'+cast(@CompanyID AS VARCHAR(15))+'-00000'+cast(@LastProductCodeID AS VARCHAR(15));

		update tbl_Product
		set ProductCodeID = @LastProductCodeID,
		ProductCode = @ProductCode
		where productID = @productID

	end
	else
	begin
		set @LastProductCodeID = @LastProductCodeID + 1;

		IF LEN(@LastProductCodeID) = 1
			BEGIN
				set @ProductCode = @CodePrefix+'-'+cast(@CompanyID AS VARCHAR(15))+'-00000'+cast(@LastProductCodeID AS VARCHAR(15));
			END
			ELSE IF LEN(@LastProductCodeID + 1) = 2
			BEGIN
				set @ProductCode = @CodePrefix+'-'+cast(@CompanyID AS VARCHAR(15))+'-0000'+cast(@LastProductCodeID AS VARCHAR(15));
			END
			ELSE IF LEN(@LastProductCodeID + 1) = 3
			BEGIN
				set @ProductCode = @CodePrefix+'-'+cast(@CompanyID AS VARCHAR(15))+'-000'+cast(@LastProductCodeID AS VARCHAR(15));
			END
			ELSE IF LEN(@LastProductCodeID + 1) = 4
			BEGIN
				set @ProductCode = @CodePrefix+'-'+cast(@CompanyID AS VARCHAR(15))+'-00'+cast(@LastProductCodeID AS VARCHAR(15));
			END
			ELSE IF LEN(@LastProductCodeID + 1) = 5
			BEGIN
				set @ProductCode = @CodePrefix+'-'+cast(@CompanyID AS VARCHAR(15))+'-0'+cast(@LastProductCodeID AS VARCHAR(15));
			END
			ELSE IF LEN(@LastProductCodeID + 1) = 6
			BEGIN
				set @ProductCode = @CodePrefix+'-'+cast(@CompanyID AS VARCHAR(15))+'-'+cast(@LastProductCodeID AS VARCHAR(15));
			END

		update tbl_Product
		set ProductCodeID = @LastProductCodeID,
		ProductCode = @ProductCode
		where productID = @productID

	end

	--select @LastProductCodeID,@ProductCode

END

/*

exec usp_ProductCode_Generate @productID = 11,@CompanyID = 1

*/


GO
/****** Object:  StoredProcedure [dbo].[usp_ProductType_Add]    Script Date: 3/28/2023 12:15:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Aqib Ehsan>
-- Create date: <Feb 14,2023>
-- Description:	<Add Product Type>
-- =============================================
CREATE PROCEDURE [dbo].[usp_ProductType_Add]
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

	exec usp_ProductTypeCode_Generate @ProductTypeID = @ProductTypeID,@CreatedOn = @CreatedOn

	select 
		pt.ProductTypeID,
		pt.Name as ProductTypeName
	from tbl_ProductTypes pt
	where pt.ProductTypeID = @ProductTypeID
END


/*

usp_ProductType_Add 
@ProductTypeName = 'asdfasf',
@CreatedBy = 1,
@CreatedOn = '2023-01-12 10:55:29.930',
@CreatedByIP = ''

*/
GO
/****** Object:  StoredProcedure [dbo].[usp_ProductType_GetAll]    Script Date: 3/28/2023 12:15:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Aqib Ehsan>
-- Create date: <Feb 14,2023>
-- Description:	<Get All Product Type>
-- =============================================
CREATE PROCEDURE [dbo].[usp_ProductType_GetAll]
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
		musr.FirstName+' '+musr.LastName as ModifiedByUserName,
		pt.ProductTypeCode
	from tbl_ProductTypes pt
	inner join tbl_Users as cusr on cusr.UserID = pt.CreatedBy
	inner join tbl_Users as musr on musr.UserID = pt.ModifiedBy
END


/*

usp_ProductType_GetAll

*/
GO
/****** Object:  StoredProcedure [dbo].[usp_ProductType_GetProductTypeByID]    Script Date: 3/28/2023 12:15:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Aqib Ehsan>
-- Create date: <Feb 14,2023>
-- Description:	<Get Product Type By ID>
-- =============================================
CREATE PROCEDURE [dbo].[usp_ProductType_GetProductTypeByID]
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
		pt.ModifiedByIP,
		pt.ProductTypeCode
	from tbl_ProductTypes pt
	where pt.ProductTypeID = @ProductTypeID
END


/*

usp_ProductType_GetProductTypeByID @ProductTypeID = 1

*/
GO
/****** Object:  StoredProcedure [dbo].[usp_ProductType_Update]    Script Date: 3/28/2023 12:15:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Aqib Ehsan>
-- Create date: <Feb 14,2023>
-- Description:	<Add Product Type>
-- =============================================
CREATE PROCEDURE [dbo].[usp_ProductType_Update]
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
/****** Object:  StoredProcedure [dbo].[usp_ProductTypeCode_Generate]    Script Date: 3/28/2023 12:15:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Aqib Ehsan>
-- Create date: <Mar 14,2023>
-- Description:	<Generate Product Type Code>
-- =============================================
create PROCEDURE [dbo].[usp_ProductTypeCode_Generate]
@ProductTypeID int,
@CreatedOn datetime
AS
BEGIN
	SET NOCOUNT ON;

	declare @ProductTypeCode nvarchar(100);
	declare @LastProductTypeCodeID int;
	declare @CodePrefix varchar(100);
	DECLARE @LastRecordYear NVARCHAR(15)
		DECLARE @CurrentRecordYear NVARCHAR(15)
	 
	select top 1 @LastProductTypeCodeID = ISNULL(ProductTypeCodeID,0),
	@LastRecordYear = Format(CreatedOn, 'yy')
	from tbl_ProductTypes
	where ProductTypeID <> @ProductTypeID
	order by ProductTypeID desc

	select @CodePrefix = Name 
	from tbl_CodePrefixes 
	where CodePrefixKey = 'producttype-code'

	if(@LastProductTypeCodeID is null)set @LastProductTypeCodeID = 0;

	SET @CurrentRecordYear = FORMAT(@CreatedOn, 'yy')
	
	if(@CurrentRecordYear <> @LastRecordYear)
	begin
		set @LastProductTypeCodeID = 1;
		set @ProductTypeCode = @CodePrefix+'-'+@CurrentRecordYear+'-00000'+cast(@LastProductTypeCodeID AS VARCHAR(15));

		update tbl_ProductTypes
		set ProductTypeCodeID = @LastProductTypeCodeID,
		ProductTypeCode = @ProductTypeCode
		where ProductTypeID = @ProductTypeID

	end
	else
	begin

		set @LastProductTypeCodeID = @LastProductTypeCodeID + 1;
		
		IF LEN(@LastProductTypeCodeID) = 1
			BEGIN
				set @ProductTypeCode = @CodePrefix+'-'+@CurrentRecordYear+'-00000'+cast(@LastProductTypeCodeID AS VARCHAR(15));
			END
			ELSE IF LEN(@LastProductTypeCodeID + 1) = 2
			BEGIN
				set @ProductTypeCode = @CodePrefix+'-'+@CurrentRecordYear+'-0000'+cast(@LastProductTypeCodeID AS VARCHAR(15));
			END
			ELSE IF LEN(@LastProductTypeCodeID + 1) = 3
			BEGIN
				set @ProductTypeCode = @CodePrefix+'-'+@CurrentRecordYear+'-000'+cast(@LastProductTypeCodeID AS VARCHAR(15));
			END
			ELSE IF LEN(@LastProductTypeCodeID + 1) = 4
			BEGIN
				set @ProductTypeCode = @CodePrefix+'-'+@CurrentRecordYear+'-00'+cast(@LastProductTypeCodeID AS VARCHAR(15));
			END
			ELSE IF LEN(@LastProductTypeCodeID + 1) = 5
			BEGIN
				set @ProductTypeCode = @CodePrefix+'-'+@CurrentRecordYear+'-0'+cast(@LastProductTypeCodeID AS VARCHAR(15));
			END
			ELSE IF LEN(@LastProductTypeCodeID + 1) = 6
			BEGIN
				set @ProductTypeCode = @CodePrefix+'-'+@CurrentRecordYear+'-'+cast(@LastProductTypeCodeID AS VARCHAR(15));
			END

		update tbl_ProductTypes
		set ProductTypeCodeID = @LastProductTypeCodeID,
		ProductTypeCode = @ProductTypeCode
		where ProductTypeID = @ProductTypeID

	end

	--select @LastProductTypeCodeID,@ProductTypeCode

END

/*

exec usp_ProductTypeCode_Generate @ProductTypeID = 2,@CreatedOn = '2022-01-12 10:55:29.930'

*/


GO
/****** Object:  StoredProcedure [dbo].[usp_Register_User]    Script Date: 3/28/2023 12:15:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Aqib Ehsan>
-- Create date: <Mar 6,2023>
-- Description:	<Regiser User>
-- =============================================
CREATE PROCEDURE [dbo].[usp_Register_User]
@FirstName nvarchar(200),
@LastName nvarchar(200),
@CompanyName nvarchar(200),
@Email nvarchar(400),
@Password nvarchar(200),
@CreatedOn datetime,
@CreatedByIP nvarchar(200),
@UserCode nvarchar(100)
AS
BEGIN
	
	SET NOCOUNT ON;

	declare @UserID int;
	declare @CompanyID int;
	declare @BranchID int;

	-- User Record Adding
	insert into tbl_Users
	(
		RoleID,
		FirstName,
		LastName,
		Email,
		Password,
		IsActive,
		CreatedOn,
		CreatedByIP,
		ModifiedOn,
		ModifiedByIP,
		UserCode
	)
	values
	(
		2,
		@FirstName,
		@LastName,
		@Email,
		@Password,
		1,
		@CreatedOn,
		@CreatedByIP,
		@CreatedOn,
		@CreatedByIP,
		@UserCode
	)

	SET @UserID = SCOPE_IDENTITY();

	exec usp_UserCode_Generate @UserID = @UserID,@CreatedOn = @CreatedOn

	update tbl_Users 
	set CreatedBy = @UserID,
	ModifiedBy = @UserID
	where UserID = @UserID

	-- Company Record Adding
	insert into tbl_Company
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
		@CompanyName,
		@UserID,
		@CreatedOn,
		@CreatedByIP,
		@UserID,
		@CreatedOn,
		@CreatedByIP
	)

	SET @CompanyID = SCOPE_IDENTITY();

	exec usp_CompanyCode_Generate @CompanyID = @CompanyID,@CreatedOn = @CreatedOn

	-- Assign Company To User
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
	values
	(
		@CompanyID,
		@UserID,
		@UserID,
		@CreatedOn,
		@CreatedByIP,
		@UserID,
		@CreatedOn,
		@CreatedByIP
	)

	-- Branch Record Adding
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
		@CompanyName,
		@UserID,
		@CreatedOn,
		@CreatedByIP,
		@UserID,
		@CreatedOn,
		@CreatedByIP
	)

	SET @BranchID = SCOPE_IDENTITY();

	exec usp_BranchCode_Generate @BranchID = @BranchID,@CompanyID = @CompanyID

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
	values
	(
		@BranchID,
		@UserID,
		@UserID,
		@CreatedOn,
		@CreatedByIP,
		@UserID,
		@CreatedOn,
		@CreatedByIP
	)

	exec usp_CompanyAccount_Open @CompanyID = @CompanyID,@BranchID = @BranchID

	select @UserID as UserID
    
END

/*

exec usp_Register_User
@FirstName = 'asfs adf',
@LastName = 'sad fsd f',
@CompanyName = 'sd f',
@Email = 'asdf@yahoo.com',
@Password = 'asdf',
@CreatedOn = '2023-01-13 13:08:15.117',
@CreatedByIP = ''

*/
GO
/****** Object:  StoredProcedure [dbo].[usp_ReportsType_Add]    Script Date: 3/28/2023 12:15:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Aqib Ehsan>
-- Create date: <Mar 9,2023>
-- Description:	<Add Reports Type>
-- =============================================
CREATE PROCEDURE [dbo].[usp_ReportsType_Add]
@ReportsTypeName nvarchar,
@IsActive int,
@CreatedBy int,
@CreatedOn datetime,
@CreatedByIP nvarchar
	
AS
BEGIN
	
	SET NOCOUNT ON;

	declare @ReportsTypeID int;

	insert into tbl_ReportsType
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
		@ReportsTypeName,
		@IsActive,
		@CreatedBy,
		@CreatedOn,
		@CreatedByIP,
		@CreatedBy,
		@CreatedOn,
		@CreatedByIP
	)

	SET @ReportsTypeID = SCOPE_IDENTITY();

	select 
		ReportsTypeID,
		Name as ReportsTypeName
	from tbl_ReportsType
	where ReportsTypeID = @ReportsTypeID
	
END

/*

exec usp_ReportsType_Add
@ReportsTypeName = 'asdfasdf',
@IsActive = 1,
@CreatedBy = 1,
@CreatedOn = '2023-03-09 12:15:45.240',
@CreatedByIP = ''

*/
GO
/****** Object:  StoredProcedure [dbo].[usp_ReportsType_GetAll]    Script Date: 3/28/2023 12:15:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Aqib Ehsan>
-- Create date: <Mar 9,2023>
-- Description:	<Get All Reports Type>
-- =============================================
CREATE PROCEDURE [dbo].[usp_ReportsType_GetAll]
	
AS
BEGIN
	
	SET NOCOUNT ON;

	select 
		rt.ReportsTypeID,
		rt.Name as ReportsTypeName,
		rt.IsActive,
		rt.CreatedBy,
		rt.CreatedOn,
		rt.CreatedByIP,
		rt.ModifiedBy,
		rt.ModifiedOn,
		rt.ModifiedByIP,
		cusr.FirstName+' '+cusr.LastName as CreatedByUserName,
		musr.FirstName+' '+musr.LastName as ModifiedByUserName
	from tbl_ReportsType rt
	inner join tbl_Users as cusr on cusr.UserID = rt.CreatedBy
	inner join tbl_Users as musr on musr.UserID = rt.ModifiedBy
END

/*

exec usp_ReportsType_GetAll

*/
GO
/****** Object:  StoredProcedure [dbo].[usp_ReportsType_GetAllActive]    Script Date: 3/28/2023 12:15:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Aqib Ehsan>
-- Create date: <Mar 9,2023>
-- Description:	<Get All Active Reports Type>
-- =============================================
CREATE PROCEDURE [dbo].[usp_ReportsType_GetAllActive]
	
AS
BEGIN
	
	SET NOCOUNT ON;

	select 
		rt.ReportsTypeID,
		rt.Name as ReportsTypeName,
		rt.IsActive,
		rt.CreatedBy,
		rt.CreatedOn,
		rt.CreatedByIP,
		rt.ModifiedBy,
		rt.ModifiedOn,
		rt.ModifiedByIP,
		cusr.FirstName+' '+cusr.LastName as CreatedByUserName,
		musr.FirstName+' '+musr.LastName as ModifiedByUserName
	from tbl_ReportsType rt
	inner join tbl_Users as cusr on cusr.UserID = rt.CreatedBy
	inner join tbl_Users as musr on musr.UserID = rt.ModifiedBy
	where rt.IsActive = 1
END

/*

exec usp_ReportsType_GetAllActive

*/
GO
/****** Object:  StoredProcedure [dbo].[usp_ReportsType_GetReportsTypeByID]    Script Date: 3/28/2023 12:15:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Aqib Ehsan>
-- Create date: <Mar 9,2023>
-- Description:	<Get Reports Type By ID>
-- =============================================
CREATE PROCEDURE [dbo].[usp_ReportsType_GetReportsTypeByID]
@ReportsTypeID int
	
AS
BEGIN
	
	SET NOCOUNT ON;

	select 
		rt.ReportsTypeID,
		rt.Name as ReportsTypeName,
		rt.IsActive,
		rt.CreatedBy,
		rt.CreatedOn,
		rt.CreatedByIP,
		rt.ModifiedBy,
		rt.ModifiedOn,
		rt.ModifiedByIP
	from tbl_ReportsType rt
	where rt.ReportsTypeID = @ReportsTypeID
END

/*

exec usp_ReportsType_GetReportsTypeByID @ReportsTypeID = 1

*/
GO
/****** Object:  StoredProcedure [dbo].[usp_ReportsType_Update]    Script Date: 3/28/2023 12:15:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Aqib Ehsan>
-- Create date: <Mar 9,2023>
-- Description:	<Update Reports Type>
-- =============================================
CREATE PROCEDURE [dbo].[usp_ReportsType_Update]
@ReportsTypeID int,
@ReportsTypeName nvarchar,
@IsActive int,
@MOdifiedBy int,
@MOdifiedOn datetime,
@MOdifiedByIP nvarchar
	
AS
BEGIN
	
	SET NOCOUNT ON;

	update tbl_ReportsType
	set Name = @ReportsTypeName,
		IsActive = @IsActive,
		ModifiedBy = @MOdifiedBy,
		ModifiedOn = @MOdifiedOn,
		ModifiedByIP = @MOdifiedByIP
	where ReportsTypeID = @ReportsTypeID


	if(@@ROWCOUNT > 0)
	begin
	select 
		ReportsTypeID,
		Name as ReportsTypeName
	from tbl_ReportsType
	where ReportsTypeID = @ReportsTypeID
	end

END

/*

exec usp_ReportsType_Update
@ReportsTypeID = 1,
@ReportsTypeName = 'asdfasdf',
@IsActive = 1,
@ModifiedBy = 1,
@ModifiedOn = '2023-03-09 12:15:45.240',
@ModifiedByIP = ''

*/
GO
/****** Object:  StoredProcedure [dbo].[usp_ReportsTypeTemplate_Add]    Script Date: 3/28/2023 12:15:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Aqib Ehsan>
-- Create date: <Mar 9,2023>
-- Description:	<Add Reports Type Template>
-- =============================================
CREATE PROCEDURE [dbo].[usp_ReportsTypeTemplate_Add]
@ReportsTypeID int,
@ReportsTypeTemplateName nvarchar,
@ReportsTypeTemplateKey nvarchar,
@Body nvarchar,
@CreatedBy int,
@CreatedOn datetime,
@CreatedByIP nvarchar	
AS
BEGIN
	
	SET NOCOUNT ON;

	declare @ReportsTypeTemplateID	int;

	insert into tbl_ReportsTypeTemplate
	(
		ReportsTypeID,
		Name,
		ReportsTypeTemplateKey,
		Body,
		CreatedBy,
		CreatedOn,
		CreatedByIP,
		ModifiedBy,
		ModifiedOn,
		ModifiedByIP
	)
	values
	(
		@ReportsTypeID,
		@ReportsTypeTemplateName,
		@ReportsTypeTemplateKey,
		@Body,
		@CreatedBy,
		@CreatedOn,
		@CreatedByIP,
		@CreatedBy,
		@CreatedOn,
		@CreatedByIP
	)

	SET @ReportsTypeTemplateID = SCOPE_IDENTITY();

	select 
		rtt.ReportsTypeTemplateID,
		rtt.ReportsTypeID,
		rtt.Name as ReportsTypeTemplateName,
		rtt.ReportsTypeTemplateKey
	from tbl_ReportsTypeTemplate rtt
	where rtt.ReportsTypeTemplateID = @ReportsTypeTemplateID
END

/*

exec usp_ReportsTypeTemplate_Add
@ReportsTypeID = 1,
@ReportsTypeTemplateName = 'dfasfasdf',
@ReportsTypeTemplateKey = asdf-asdf-asdf-sadf,
@Body = 'sdfsad fsd fasfasdfasdf',
@CreatedBy = 1,
@CreatedOn = '2023-03-09 12:15:49.653',
@CreatedByIP = '',

*/
GO
/****** Object:  StoredProcedure [dbo].[usp_ReportsTypeTemplate_GetAll]    Script Date: 3/28/2023 12:15:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Aqib Ehsan>
-- Create date: <Mar 9,2023>
-- Description:	<Get All Reports Type Template>
-- =============================================
CREATE PROCEDURE [dbo].[usp_ReportsTypeTemplate_GetAll]
	
AS
BEGIN
	
	SET NOCOUNT ON;

	select 
		rtt.ReportsTypeTemplateID,
		rtt.ReportsTypeID,
		rt.Name as ReportsTypeName,
		rtt.Name as ReportsTypeTemplateName,
		rtt.ReportsTypeTemplateKey,
		rtt.Body,
		rtt.CreatedBy,
		rtt.CreatedOn,
		rtt.CreatedByIP,
		rtt.ModifiedBy,
		rtt.ModifiedOn,
		rtt.ModifiedByIP,
		cusr.FirstName+' '+cusr.LastName as CreatedByUserName,
		musr.FirstName+' '+musr.LastName as ModifiedByUserName
	from tbl_ReportsTypeTemplate rtt
	inner join tbl_ReportsType rt on rt.ReportsTypeID = rtt.ReportsTypeID
	inner join tbl_Users as cusr on cusr.UserID = rtt.CreatedBy
	inner join tbl_Users as musr on musr.UserID = rtt.ModifiedBy
END

/*

exec usp_ReportsTypeTemplate_GetAll

*/
GO
/****** Object:  StoredProcedure [dbo].[usp_ReportsTypeTemplate_GetReportsTypeTemplateByID]    Script Date: 3/28/2023 12:15:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Aqib Ehsan>
-- Create date: <Mar 9,2023>
-- Description:	<Get Reports Type Template By ID>
-- =============================================
CREATE PROCEDURE [dbo].[usp_ReportsTypeTemplate_GetReportsTypeTemplateByID]
@ReportsTypeTemplateID int
	
AS
BEGIN
	
	SET NOCOUNT ON;

	select 
		rtt.ReportsTypeTemplateID,
		rtt.ReportsTypeID,
		rtt.Name as ReportsTypeTemplateName,
		rtt.ReportsTypeTemplateKey,
		rtt.Body,
		rtt.CreatedBy,
		rtt.CreatedOn,
		rtt.CreatedByIP,
		rtt.ModifiedBy,
		rtt.ModifiedOn,
		rtt.ModifiedByIP
	from tbl_ReportsTypeTemplate rtt
	where rtt.ReportsTypeTemplateID = @ReportsTypeTemplateID
END

/*

exec usp_ReportsTypeTemplate_GetReportsTypeTemplateByID @ReportsTypeTemplateID = 1

*/
GO
/****** Object:  StoredProcedure [dbo].[usp_ReportsTypeTemplate_Update]    Script Date: 3/28/2023 12:15:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Aqib Ehsan>
-- Create date: <Mar 9,2023>
-- Description:	<Update Reports Type Template>
-- =============================================
CREATE PROCEDURE [dbo].[usp_ReportsTypeTemplate_Update]
@ReportsTypeTemplateID	int,
@ReportsTypeID int,
@ReportsTypeTemplateName nvarchar,
@ReportsTypeTemplateKey nvarchar,
@Body nvarchar,
@ModifiedBy int,
@ModifiedOn datetime,
@ModifiedByIP nvarchar	
AS
BEGIN
	
	SET NOCOUNT ON;

	update tbl_ReportsTypeTemplate
	set 
		Name = @ReportsTypeTemplateName,
		ReportsTypeTemplateKey = @ReportsTypeTemplateKey,
		Body = @Body,
		ModifiedBy = @ModifiedBy,
		ModifiedOn = @ModifiedOn,
		ModifiedByIP = @ModifiedByIP
		where ReportsTypeTemplateID = @ReportsTypeTemplateID


	if(@@ROWCOUNT > 0)
	begin
	select 
		rtt.ReportsTypeTemplateID,
		rtt.ReportsTypeID,
		rtt.Name as ReportsTypeTemplateName,
		rtt.ReportsTypeTemplateKey
	from tbl_ReportsTypeTemplate rtt
	where rtt.ReportsTypeTemplateID = @ReportsTypeTemplateID
	end
END

/*

exec usp_ReportsTypeTemplate_Update
@ReportsTypeTemplateID = 1,
@ReportsTypeID = 1,
@ReportsTypeTemplateName = 'dfasfasdf',
@ReportsTypeTemplateKey = asdf-asdf-asdf-sadf,
@Body = 'sdfsad fsd fasfasdfasdf',
@ModifiedBy = 1,
@ModifiedOn = '2023-03-09 12:15:49.653',
@ModifiedByIP = '',

*/
GO
/****** Object:  StoredProcedure [dbo].[usp_Role_Add]    Script Date: 3/28/2023 12:15:30 PM ******/
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
/****** Object:  StoredProcedure [dbo].[usp_Role_GetAll]    Script Date: 3/28/2023 12:15:30 PM ******/
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
/****** Object:  StoredProcedure [dbo].[usp_Role_GetRoleByID]    Script Date: 3/28/2023 12:15:30 PM ******/
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
/****** Object:  StoredProcedure [dbo].[usp_Role_Module_ModulePageAction_GetAll]    Script Date: 3/28/2023 12:15:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Aqib Ehsan>
-- Create date: <Feb 27,2023>
-- Description:	<Get All Role Module and Module Page Action>
-- =============================================
CREATE PROCEDURE [dbo].[usp_Role_Module_ModulePageAction_GetAll]
	
AS
BEGIN
	
	SET NOCOUNT ON;

    select 
	RoleID,
	Name as RoleName
	from tbl_Roles
	where RoleID <> 1

	select distinct
	mp.ModulePageID,
	mp.Name as ModulePageName
	from tbl_ModulePageAction mpa
	inner join tbl_ModulePages mp on mp.ModulePageID = mpa.ModulePageID

	select
	ModulePageActionID,
	ModulePageID,
	Name as ModulePageActionName
	from tbl_ModulePageAction
END


/*

usp_Role_Module_ModulePageAction_GetAll

*/
GO
/****** Object:  StoredProcedure [dbo].[usp_Role_Update]    Script Date: 3/28/2023 12:15:30 PM ******/
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
/****** Object:  StoredProcedure [dbo].[usp_SiteConfig_Add]    Script Date: 3/28/2023 12:15:30 PM ******/
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
@CreatedByIP nvarchar(200),
@SiteThemeSetting nvarchar(max)
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
		ModifiedByIP,
		SiteThemeSetting
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
		@CreatedByIP,
		@SiteThemeSetting
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

usp_SiteConfig_Add 
@Logo = '',
@PoweredBy = 'I am Testing',
@IsActive = 1,
@CreatedBy = 1,
@CreatedOn = '2023-01-12 10:55:29.930',
@CreatedByIP = '',
@SiteThemeSetting = '{}'

*/
GO
/****** Object:  StoredProcedure [dbo].[usp_SiteConfig_GetAll]    Script Date: 3/28/2023 12:15:30 PM ******/
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
/****** Object:  StoredProcedure [dbo].[usp_SiteConfig_GetAllActive]    Script Date: 3/28/2023 12:15:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Aqib Ehsan>
-- Create date: <Feb 10,2023>
-- Description:	<Get All Active Site Config>
-- =============================================
CREATE PROCEDURE [dbo].[usp_SiteConfig_GetAllActive]
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
		config.SiteThemeSetting,
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
/****** Object:  StoredProcedure [dbo].[usp_SiteConfig_GetSiteConfigByID]    Script Date: 3/28/2023 12:15:30 PM ******/
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
		config.ModifiedByIP,
		config.SiteThemeSetting
	from tbl_Configuration config
	where config.ConfigurationID = @ConfigurationID
END


/*

usp_SiteConfig_GetSiteCOnfigByID @ConfigurationID = 1

*/
GO
/****** Object:  StoredProcedure [dbo].[usp_SiteConfig_Update]    Script Date: 3/28/2023 12:15:30 PM ******/
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
@ModifiedByIP nvarchar(200),
@SiteThemeSetting nvarchar(max)
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
			ModifiedByIP = @ModifiedByIP,
			SiteThemeSetting = @SiteThemeSetting
		where ConfigurationID = @ConfigurationID
	end

	else
	begin
		update tbl_Configuration
			set PoweredBy = @PoweredBy,
			IsActive = @IsActive,
			ModifiedBy = @ModifiedBy,
			ModifiedOn = @ModifiedOn,
			ModifiedByIP = @ModifiedByIP,
			SiteThemeSetting = @SiteThemeSetting
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

usp_SiteConfig_Update 
@Logo = '',
@PoweredBy = 'I am Testing',
@IsActive = 1,
@ModifiedBy = 1,@ModifiedOn = '2023-01-12 10:55:29.930',
@ModifiedByIP = '',
@ConfigurationID = 1,
@SiteThemeSetting = ''

*/
GO
/****** Object:  StoredProcedure [dbo].[usp_State_Add]    Script Date: 3/28/2023 12:15:30 PM ******/
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

	exec usp_State_Code_Generate @StateID = @StateID,@CountryID = @CountryID

	select 
		st.Name as StateName,
		ctry.Name as CountryName
	from tbl_State st
	inner join tbl_Country ctry on ctry.CountryID = st.CountryID
	where st.StateID = @StateID
	
END

/*

usp_State_Add 
@CountryID = 1,
@StateCode = 'asdf',
@StateName = 'asdf',
@CreatedBy = 1,
@CreatedOn = '2023-01-12 10:42:29.930',
@CreatedByIP = ''

*/
GO
/****** Object:  StoredProcedure [dbo].[usp_State_Code_Generate]    Script Date: 3/28/2023 12:15:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Aqib Ehsan>
-- Create date: <Mar 14,2023>
-- Description:	<Generate State Code>
-- =============================================
create PROCEDURE [dbo].[usp_State_Code_Generate]
@StateID int,
@CountryID int
AS
BEGIN
	SET NOCOUNT ON;

	declare @State_Code nvarchar(100);
	declare @LastState_CodeID int;
	declare @CodePrefix varchar(100);
	 
	select top 1 @LastState_CodeID = State_CodeID
	from tbl_State
	where CountryID = @CountryID
	and StateID <> @StateID
	order by StateID desc

	select @CodePrefix = Name 
	from tbl_CodePrefixes 
	where CodePrefixKey = 'state-code'
	
	if(@LastState_CodeID is null)
	begin
		set @LastState_CodeID = 1;
		set @State_Code = @CodePrefix+'-'+cast(@CountryID AS VARCHAR(15))+'-00000'+cast(@LastState_CodeID AS VARCHAR(15));

		update tbl_State
		set State_CodeID = @LastState_CodeID,
		State_Code = @State_Code
		where StateID = @StateID

	end
	else
	begin
		set @LastState_CodeID = @LastState_CodeID + 1;

		IF LEN(@LastState_CodeID) = 1
			BEGIN
				set @State_Code = @CodePrefix+'-'+cast(@CountryID AS VARCHAR(15))+'-00000'+cast(@LastState_CodeID AS VARCHAR(15));
			END
			ELSE IF LEN(@LastState_CodeID + 1) = 2
			BEGIN
				set @State_Code = @CodePrefix+'-'+cast(@CountryID AS VARCHAR(15))+'-0000'+cast(@LastState_CodeID AS VARCHAR(15));
			END
			ELSE IF LEN(@LastState_CodeID + 1) = 3
			BEGIN
				set @State_Code = @CodePrefix+'-'+cast(@CountryID AS VARCHAR(15))+'-000'+cast(@LastState_CodeID AS VARCHAR(15));
			END
			ELSE IF LEN(@LastState_CodeID + 1) = 4
			BEGIN
				set @State_Code = @CodePrefix+'-'+cast(@CountryID AS VARCHAR(15))+'-00'+cast(@LastState_CodeID AS VARCHAR(15));
			END
			ELSE IF LEN(@LastState_CodeID + 1) = 5
			BEGIN
				set @State_Code = @CodePrefix+'-'+cast(@CountryID AS VARCHAR(15))+'-0'+cast(@LastState_CodeID AS VARCHAR(15));
			END
			ELSE IF LEN(@LastState_CodeID + 1) = 6
			BEGIN
				set @State_Code = @CodePrefix+'-'+cast(@CountryID AS VARCHAR(15))+'-'+cast(@LastState_CodeID AS VARCHAR(15));
			END

		update tbl_State
		set State_CodeID = @LastState_CodeID,
		State_Code = @State_Code
		where StateID = @StateID

	end

	--select @LastState_CodeID,@State_Code

END

/*

exec usp_State_Code_Generate @StateID = 11,@CountryID = 1

*/


GO
/****** Object:  StoredProcedure [dbo].[usp_State_GetAll]    Script Date: 3/28/2023 12:15:30 PM ******/
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
		musr.FirstName+' '+musr.LastName as ModifiedByUserName,
		st.State_Code
	from tbl_State st
	inner join tbl_Country ctry on ctry.CountryID = st.CountryID
	inner join tbl_Users as cusr on cusr.UserID = st.CreatedBy
	inner join tbl_Users as musr on musr.UserID = st.ModifiedBy

END

/*

usp_State_GetAll

*/
GO
/****** Object:  StoredProcedure [dbo].[usp_State_GetStateByID]    Script Date: 3/28/2023 12:15:30 PM ******/
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
		st.ModifiedByIP,
		st.State_Code
	from tbl_State st
	where StateID = @StateID

END

/*

usp_State_GetStateByID @StateID=1

*/
GO
/****** Object:  StoredProcedure [dbo].[usp_State_Update]    Script Date: 3/28/2023 12:15:30 PM ******/
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
/****** Object:  StoredProcedure [dbo].[usp_TimeZone_Add]    Script Date: 3/28/2023 12:15:30 PM ******/
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

	exec usp_TimeZoneCode_Generate @TimeZoneID = @TimeZoneID,@CreatedOn = @CreatedOn

	select 
		tz.TimeZoneID,
		tz.Name TimeZoneName,
		tz.Description,
		tz.RelativeToGMT
	from tbl_TimeZones tz
	where tz.TimeZoneID = @TimeZoneID
END

/*

usp_TimeZone_Add 
@TimeZoneName = 'sdfasdf',
@Description = 'adf',
@RelativeToGMT = 'asdf',
@CreatedBy = 1,
@CreatedOn = '2023-01-12 10:55:29.930',
@CreatedByIP = ''

*/
GO
/****** Object:  StoredProcedure [dbo].[usp_TimeZone_GetAll]    Script Date: 3/28/2023 12:15:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Aqib Ehsan>
-- Create date: <Feb 10,2023>
-- Description:	<Get All Time Zone>
-- =============================================
CREATE PROCEDURE [dbo].[usp_TimeZone_GetAll]
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
		musr.FirstName+' '+musr.LastName as ModifiedByUserName,
		tz.TimeZoneCode
	from tbl_TimeZones tz
	inner join tbl_Users as cusr on cusr.UserID = tz.CreatedBy
	inner join tbl_Users as musr on musr.UserID = tz.ModifiedBy
END


/*

usp_TimeZone_GetAll

*/
GO
/****** Object:  StoredProcedure [dbo].[usp_TimeZone_GetTimeZoneByID]    Script Date: 3/28/2023 12:15:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Aqib Ehsan>
-- Create date: <Feb 10,2023>
-- Description:	<Get Time Zone By ID>
-- =============================================
CREATE PROCEDURE [dbo].[usp_TimeZone_GetTimeZoneByID]
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
		tz.ModifiedByIP,
		tz.TimeZoneCode
	from tbl_TimeZones tz
	where tz.TimeZoneID = @TimeZoneID
END


/*

usp_TimeZone_GetTimeZoneByID @TimeZoneID = 1

*/
GO
/****** Object:  StoredProcedure [dbo].[usp_TimeZone_Update]    Script Date: 3/28/2023 12:15:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Aqib Ehsan>
-- Create date: <Feb 10,2023>
-- Description:	<Update Time Zone>
-- =============================================
CREATE PROCEDURE [dbo].[usp_TimeZone_Update]
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
/****** Object:  StoredProcedure [dbo].[usp_TimeZoneCode_Generate]    Script Date: 3/28/2023 12:15:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Aqib Ehsan>
-- Create date: <Mar 14,2023>
-- Description:	<Generate Time Zone Code>
-- =============================================
create PROCEDURE [dbo].[usp_TimeZoneCode_Generate]
@TimeZoneID int,
@CreatedOn datetime
AS
BEGIN
	SET NOCOUNT ON;

	declare @TimeZoneCode nvarchar(100);
	declare @LastTimeZoneCodeID int;
	declare @CodePrefix varchar(100);
	DECLARE @LastRecordYear NVARCHAR(15)
		DECLARE @CurrentRecordYear NVARCHAR(15)
	 
	select top 1 @LastTimeZoneCodeID = ISNULL(TimeZoneCodeID,0),
	@LastRecordYear = Format(CreatedOn, 'yy')
	from tbl_TimeZones
	where TimeZoneID <> @TimeZoneID
	order by TimeZoneID desc

	select @CodePrefix = Name 
	from tbl_CodePrefixes 
	where CodePrefixKey = 'timezone-code'

	if(@LastTimeZoneCodeID is null)set @LastTimeZoneCodeID = 0;

	SET @CurrentRecordYear = FORMAT(@CreatedOn, 'yy')
	
	if(@CurrentRecordYear <> @LastRecordYear)
	begin
		set @LastTimeZoneCodeID = 1;
		set @TimeZoneCode = @CodePrefix+'-'+@CurrentRecordYear+'-00000'+cast(@LastTimeZoneCodeID AS VARCHAR(15));

		update tbl_TimeZones
		set TimeZoneCodeID = @LastTimeZoneCodeID,
		TimeZoneCode = @TimeZoneCode
		where TimeZoneID = @TimeZoneID

	end
	else
	begin

		set @LastTimeZoneCodeID = @LastTimeZoneCodeID + 1;
		
		IF LEN(@LastTimeZoneCodeID) = 1
			BEGIN
				set @TimeZoneCode = @CodePrefix+'-'+@CurrentRecordYear+'-00000'+cast(@LastTimeZoneCodeID AS VARCHAR(15));
			END
			ELSE IF LEN(@LastTimeZoneCodeID + 1) = 2
			BEGIN
				set @TimeZoneCode = @CodePrefix+'-'+@CurrentRecordYear+'-0000'+cast(@LastTimeZoneCodeID AS VARCHAR(15));
			END
			ELSE IF LEN(@LastTimeZoneCodeID + 1) = 3
			BEGIN
				set @TimeZoneCode = @CodePrefix+'-'+@CurrentRecordYear+'-000'+cast(@LastTimeZoneCodeID AS VARCHAR(15));
			END
			ELSE IF LEN(@LastTimeZoneCodeID + 1) = 4
			BEGIN
				set @TimeZoneCode = @CodePrefix+'-'+@CurrentRecordYear+'-00'+cast(@LastTimeZoneCodeID AS VARCHAR(15));
			END
			ELSE IF LEN(@LastTimeZoneCodeID + 1) = 5
			BEGIN
				set @TimeZoneCode = @CodePrefix+'-'+@CurrentRecordYear+'-0'+cast(@LastTimeZoneCodeID AS VARCHAR(15));
			END
			ELSE IF LEN(@LastTimeZoneCodeID + 1) = 6
			BEGIN
				set @TimeZoneCode = @CodePrefix+'-'+@CurrentRecordYear+'-'+cast(@LastTimeZoneCodeID AS VARCHAR(15));
			END

		update tbl_TimeZones
		set TimeZoneCodeID = @LastTimeZoneCodeID,
		TimeZoneCode = @TimeZoneCode
		where TimeZoneID = @TimeZoneID

	end

	--select @LastTimeZoneCodeID,@TimeZoneCode

END

/*

exec usp_TimeZoneCode_Generate @TimeZoneID = 2,@CreatedOn = '2022-01-12 10:55:29.930'

*/


GO
/****** Object:  StoredProcedure [dbo].[usp_User_Add]    Script Date: 3/28/2023 12:15:30 PM ******/
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
@DOB	date,
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

	exec usp_UserCode_Generate @UserID = @UserID,@CreatedOn = @CreatedOn

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
/****** Object:  StoredProcedure [dbo].[usp_User_GetAll]    Script Date: 3/28/2023 12:15:30 PM ******/
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
		musr.FirstName+' '+musr.LastName as ModifiedByUserName,
		u.UserCode
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
/****** Object:  StoredProcedure [dbo].[usp_User_GetAllActive]    Script Date: 3/28/2023 12:15:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Aqib Ehsan>
-- Create date: <Feb 22,2023>
-- Description:	<Get All Active Users>
-- =============================================
CREATE PROCEDURE [dbo].[usp_User_GetAllActive]
	
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
		musr.FirstName+' '+musr.LastName as ModifiedByUserName,
		u.UserCode
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
/****** Object:  StoredProcedure [dbo].[usp_User_GetUserByID]    Script Date: 3/28/2023 12:15:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Aqib Ehsan>
-- Create date: <Feb 22,2023>
-- Description:	<Get User By ID>
-- =============================================
CREATE PROCEDURE [dbo].[usp_User_GetUserByID]
@UserID int	
AS
BEGIN
	
	SET NOCOUNT ON;

    select 
		u.UserID,
		u.RoleID,
		u.FirstName,
		u.LastName,
		u.FirstName+' '+u.LastName as UserName,
		u.Email,
		u.Password,
		u.Phone,
		u.Address1,
		u.Address2,
		u.CityID,
		u.StateID,
		u.ZipCode,
		u.CountryID,
		u.Gender,
		u.DOB,
		u.IsActive,
		u.CreatedBy,
		u.CreatedOn,
		u.CreatedByIP,
		u.ModifiedBy,
		u.ModifiedOn,
		u.ModifiedByIP,
		u.UserCode
	from tbl_Users u
	where UserID = @UserID
END

/*

usp_User_GetUserByID @UserID = 3

*/
GO
/****** Object:  StoredProcedure [dbo].[usp_User_Update]    Script Date: 3/28/2023 12:15:30 PM ******/
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
@DOB	date,
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
/****** Object:  StoredProcedure [dbo].[usp_User_UpdateProfile]    Script Date: 3/28/2023 12:15:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Aqib Ehsan>
-- Create date: <Feb 22,2023>
-- Description:	<Update User Profile>
-- =============================================
CREATE PROCEDURE [dbo].[usp_User_UpdateProfile]
@UserID int,
@FirstName	nvarchar(200),
@LastName	nvarchar(200),
@Email	nvarchar(400),
@Phone	nvarchar(200),
@Address1	nvarchar(200),
@Address2	nvarchar(200),
@CityID	int,
@StateID	int,
@ZipCode	nvarchar(200),
@CountryID	int,
@Gender	nvarchar(200),
@DOB	date,
@IsActive	int,
@ModifiedBy	int,
@ModifiedOn	datetime,
@ModifiedByIP	nvarchar(200)
AS
BEGIN
	
	SET NOCOUNT ON;

	update tbl_Users
	set FirstName = @FirstName,
		LastName = @LastName,
		Email = @Email,
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

	if(@@ROWCOUNT > 0)
	begin
		select 
		FirstName+' '+LastName as UserName 
		from tbl_Users
		where UserID = @UserID
	end

END

/*

usp_User_UpdateProfile
@UserID = 2,
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
@ModifiedByIP = ''

*/
GO
/****** Object:  StoredProcedure [dbo].[usp_UserCode_Generate]    Script Date: 3/28/2023 12:15:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Aqib Ehsan>
-- Create date: <Mar 14,2023>
-- Description:	<Generate User Code>
-- =============================================
create PROCEDURE [dbo].[usp_UserCode_Generate]
@UserID int,
@CreatedOn datetime
AS
BEGIN
	SET NOCOUNT ON;

	declare @UserCode nvarchar(100);
	declare @LastUserCodeID int;
	declare @CodePrefix varchar(100);
	DECLARE @LastRecordYear NVARCHAR(15)
		DECLARE @CurrentRecordYear NVARCHAR(15)
	 
	select top 1 @LastUserCodeID = ISNULL(UserCodeID,0),
	@LastRecordYear = Format(CreatedOn, 'yy')
	from tbl_Users
	where UserID <> @UserID
	order by UserID desc

	select @CodePrefix = Name 
	from tbl_CodePrefixes 
	where CodePrefixKey = 'user-code'

	if(@LastUserCodeID is null)set @LastUserCodeID = 0;

	SET @CurrentRecordYear = FORMAT(@CreatedOn, 'yy')
	
	if(@CurrentRecordYear <> @LastRecordYear)
	begin
		set @LastUserCodeID = 1;
		set @UserCode = @CodePrefix+'-'+@CurrentRecordYear+'-00000'+cast(@LastUserCodeID AS VARCHAR(15));

		update tbl_Users
		set UserCodeID = @LastUserCodeID,
		UserCode = @UserCode
		where UserID = @UserID

	end
	else
	begin

		set @LastUserCodeID = @LastUserCodeID + 1;
		
		IF LEN(@LastUserCodeID) = 1
			BEGIN
				set @UserCode = @CodePrefix+'-'+@CurrentRecordYear+'-00000'+cast(@LastUserCodeID AS VARCHAR(15));
			END
			ELSE IF LEN(@LastUserCodeID + 1) = 2
			BEGIN
				set @UserCode = @CodePrefix+'-'+@CurrentRecordYear+'-0000'+cast(@LastUserCodeID AS VARCHAR(15));
			END
			ELSE IF LEN(@LastUserCodeID + 1) = 3
			BEGIN
				set @UserCode = @CodePrefix+'-'+@CurrentRecordYear+'-000'+cast(@LastUserCodeID AS VARCHAR(15));
			END
			ELSE IF LEN(@LastUserCodeID + 1) = 4
			BEGIN
				set @UserCode = @CodePrefix+'-'+@CurrentRecordYear+'-00'+cast(@LastUserCodeID AS VARCHAR(15));
			END
			ELSE IF LEN(@LastUserCodeID + 1) = 5
			BEGIN
				set @UserCode = @CodePrefix+'-'+@CurrentRecordYear+'-0'+cast(@LastUserCodeID AS VARCHAR(15));
			END
			ELSE IF LEN(@LastUserCodeID + 1) = 6
			BEGIN
				set @UserCode = @CodePrefix+'-'+@CurrentRecordYear+'-'+cast(@LastUserCodeID AS VARCHAR(15));
			END

		update tbl_Users
		set UserCodeID = @LastUserCodeID,
		UserCode = @UserCode
		where UserID = @UserID

	end

	--select @LastUserCodeID,@UserCode

END

/*

exec usp_UserCode_Generate @UserID = 2,@CreatedOn = '2022-01-12 10:55:29.930'

*/


GO
/****** Object:  StoredProcedure [dbo].[usp_ValidateLogin]    Script Date: 3/28/2023 12:15:30 PM ******/
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
	select Main.UserID,RoleID,FirstName,LastName,RoleName,Email,CompanyIdsText,BranchIdsText 
	from 
	(
		select UserID,u.RoleID,FirstName,LastName,r.Name as RoleName,Email from tbl_Users u with(nolock)
		inner join tbl_Roles r on r.RoleID = u.RoleID
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
/****** Object:  StoredProcedure [dbo].[usp_Vendor_Add]    Script Date: 3/28/2023 12:15:30 PM ******/
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
@CreatedByIP	nvarchar(200),
@CompanyID int,
@BranchID int
AS
BEGIN
	
	SET NOCOUNT ON;

	declare @VendorID int;

    insert into tbl_Vendor
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
		ModifiedByIP,
		CompanyID,
		BranchID
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
		@CreatedByIP,
		@CompanyID,
		@BranchID
	)

	SET @VendorID = SCOPE_IDENTITY();

	exec usp_VendorCode_Generate @VendorID = @VendorID,@CompanyID = @CompanyID

	select Name as VendorName 
	from tbl_Vendor 
	where VendorID = @VendorID
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
@CompanyID = 1,
@BranchID = 1

*/
GO
/****** Object:  StoredProcedure [dbo].[usp_Vendor_GetAll]    Script Date: 3/28/2023 12:15:30 PM ******/
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
		v.VendorID,
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
		musr.FirstName+' '+musr.LastName as ModifiedByUserName,
		v.CompanyID,
		c.Name as CompanyName,
		v.BranchID,
		b.Name as BranchName,
		v.VendorCode
	from tbl_Vendor v
	inner join tbl_City pc on pc.CityID = v.PostalCityID
	inner join tbl_State ps on ps.StateID = v.PostalStateID
	inner join tbl_Country pcon on pcon.CountryID = v.PostalCountryID
	inner join tbl_City bc on bc.CityID = v.BillingCityID
	inner join tbl_State bs on bs.StateID = v.BillingStateID
	inner join tbl_Country bcon on bcon.CountryID = v.BillingCountryID
	inner join tbl_Users as cusr on cusr.UserID = v.CreatedBy
	inner join tbl_Users as musr on musr.UserID = v.ModifiedBy
	inner join tbl_Company c on c.CompanyID = v.CompanyID
	inner join tbl_Branch b on b.BranchID = v.BranchID
END

/*

usp_Vendor_GetAll

*/
GO
/****** Object:  StoredProcedure [dbo].[usp_Vendor_GetVendorByID]    Script Date: 3/28/2023 12:15:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Aqib Ehsan>
-- Create date: <Feb 22,2023>
-- Description:	<Get Vendor By ID>
-- =============================================
CREATE PROCEDURE [dbo].[usp_Vendor_GetVendorByID]
@VendorID int	
AS
BEGIN
	
	SET NOCOUNT ON;

    select
		v.VendorID,
		v.Name AS VendorName ,
		v.CompanyID,
		v.BranchID,
		v.PostalPhone,
		v.PostalAddress1,
		v.PostalAddress2,
		v.PostalCityID,
		v.PostalStateID,
		v.PostalZipCode,
		v.PostalCountryID,
		v.BillingPhone,
		v.BillingAddress1,
		v.BillingAddress2,
		v.BillingCityID,
		v.BillingStateID,
		v.BillingZipCode,
		v.BillingCountryID,
		v.IsActive,
		v.CreatedBy,
		v.CreatedOn,
		v.CreatedByIP,
		v.ModifiedBy,
		v.ModifiedOn,
		v.ModifiedByIP,
		v.VendorCode
	from tbl_Vendor v
	where VendorID = @VendorID
END

/*

usp_Vendor_GetVendorByID @VendorID = 3

*/
GO
/****** Object:  StoredProcedure [dbo].[usp_Vendor_Update]    Script Date: 3/28/2023 12:15:30 PM ******/
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
@ModifiedByIP	nvarchar(200),
@CompanyID int,
@BranchID int
AS
BEGIN
	
	SET NOCOUNT ON;

	update tbl_Vendor
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
		ModifiedByIP = @ModifiedByIP,
		CompanyID = @CompanyID,
		BranchID = @BranchID
	where VendorID = @VendorID

    if(@@ROWCOUNT > 0)
	begin
		select Name as VendorName 
		from tbl_Vendor 
		where VendorID = @VendorID
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
@ModifiedByIP = '',
@CompanyID = 1,
@BranchID = 1

*/
GO
/****** Object:  StoredProcedure [dbo].[usp_VendorCode_Generate]    Script Date: 3/28/2023 12:15:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Aqib Ehsan>
-- Create date: <Mar 14,2023>
-- Description:	<Generate Vendor Code>
-- =============================================
create PROCEDURE [dbo].[usp_VendorCode_Generate]
@VendorID int,
@CompanyID int
AS
BEGIN
	SET NOCOUNT ON;

	declare @VendorCode nvarchar(100);
	declare @LastVendorCodeID int;
	declare @CodePrefix varchar(100);
	 
	select top 1 @LastVendorCodeID = VendorCodeID
	from tbl_Vendor
	where CompanyID = @CompanyID
	and VendorID <> @VendorID
	order by VendorID desc

	select @CodePrefix = Name 
	from tbl_CodePrefixes 
	where CodePrefixKey = 'Vendor-code'
	
	if(@LastVendorCodeID is null)
	begin
		set @LastVendorCodeID = 1;
		set @VendorCode = @CodePrefix+'-'+cast(@CompanyID AS VARCHAR(15))+'-00000'+cast(@LastVendorCodeID AS VARCHAR(15));

		update tbl_Vendor
		set VendorCodeID = @LastVendorCodeID,
		VendorCode = @VendorCode
		where VendorID = @VendorID

	end
	else
	begin
		set @LastVendorCodeID = @LastVendorCodeID + 1;

		IF LEN(@LastVendorCodeID) = 1
			BEGIN
				set @VendorCode = @CodePrefix+'-'+cast(@CompanyID AS VARCHAR(15))+'-00000'+cast(@LastVendorCodeID AS VARCHAR(15));
			END
			ELSE IF LEN(@LastVendorCodeID + 1) = 2
			BEGIN
				set @VendorCode = @CodePrefix+'-'+cast(@CompanyID AS VARCHAR(15))+'-0000'+cast(@LastVendorCodeID AS VARCHAR(15));
			END
			ELSE IF LEN(@LastVendorCodeID + 1) = 3
			BEGIN
				set @VendorCode = @CodePrefix+'-'+cast(@CompanyID AS VARCHAR(15))+'-000'+cast(@LastVendorCodeID AS VARCHAR(15));
			END
			ELSE IF LEN(@LastVendorCodeID + 1) = 4
			BEGIN
				set @VendorCode = @CodePrefix+'-'+cast(@CompanyID AS VARCHAR(15))+'-00'+cast(@LastVendorCodeID AS VARCHAR(15));
			END
			ELSE IF LEN(@LastVendorCodeID + 1) = 5
			BEGIN
				set @VendorCode = @CodePrefix+'-'+cast(@CompanyID AS VARCHAR(15))+'-0'+cast(@LastVendorCodeID AS VARCHAR(15));
			END
			ELSE IF LEN(@LastVendorCodeID + 1) = 6
			BEGIN
				set @VendorCode = @CodePrefix+'-'+cast(@CompanyID AS VARCHAR(15))+'-'+cast(@LastVendorCodeID AS VARCHAR(15));
			END

		update tbl_Vendor
		set VendorCodeID = @LastVendorCodeID,
		VendorCode = @VendorCode
		where VendorID = @VendorID

	end

	--select @LastVendorCodeID,@VendorCode

END

/*

exec usp_VendorCode_Generate @VendorID = 11,@CompanyID = 1

*/


GO
/****** Object:  StoredProcedure [dbo].[usp_WareHouse_Add]    Script Date: 3/28/2023 12:15:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Aqib Ehsan>
-- Create date: <Feb 23,2023>
-- Description:	<Add WareHouse>
-- =============================================
CREATE PROCEDURE [dbo].[usp_WareHouse_Add]
@CompanyID	int,
@BranchID	int,
@WareHouseName	nvarchar(200),
@Phone	nvarchar(200),
@Address1	nvarchar(200),
@Address2	nvarchar(200),
@CityID	int,
@StateID	int,
@ZipCode	nvarchar(200),
@CountryID	int,
@CreatedBy	int,
@CreatedOn	datetime,
@CreatedByIP	nvarchar(200)
AS
BEGIN
	
	SET NOCOUNT ON;

	declare @WareHouseID int;

	insert into tbl_WareHouses
	(
		CompanyID,
		BranchID,
		Name,
		Phone,
		Address1,
		Address2,
		CityID,
		StateID,
		ZipCode,
		CountryID,
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
		@BranchID,
		@WareHouseName,
		@Phone,
		@Address1,
		@Address2,
		@CityID,
		@StateID,
		@ZipCode,
		@CountryID,
		@CreatedBy,
		@CreatedOn,
		@CreatedByIP,
		@CreatedBy,
		@CreatedOn,
		@CreatedByIP
	)
    

	SET @WareHouseID = SCOPE_IDENTITY();

	exec usp_WareHouseCode_Generate @WareHouseID = @WareHouseID,@CompanyID = @CompanyID

	select 
	Name as WareHouseName 
	from tbl_WareHouses 
	where WareHouseID = @WareHouseID

END

/*

usp_WareHouse_Add
@CompanyID = 1,
@BranchID = 1,
@WareHouseName = 'fasdf asf f',
@Phone = 'as dfas f',
@Address1 = 'as fas f',
@Address2 = 'as dfas df',
@CityID = 1,
@StateID = 1,
@ZipCode = 1,
@CountryID = 1,
@CreatedBy = 1,
@CreatedOn = '2023-01-12 11:14:28.247',
@CreatedByIP = ''

*/
GO
/****** Object:  StoredProcedure [dbo].[usp_WareHouse_GetAll]    Script Date: 3/28/2023 12:15:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Aqib Ehsan>
-- Create date: <Feb 23,2023>
-- Description:	<Get All WareHouse Data>
-- =============================================
CREATE PROCEDURE [dbo].[usp_WareHouse_GetAll]
	
AS
BEGIN
	
	SET NOCOUNT ON;

    select 
		wh.WareHouseID,
		wh.CompanyID,
		cmpy.Name as CompanyName,
		wh.BranchID,
		b.Name as BranchName,
		wh.Name as WareHouseName,
		wh.Phone,
		wh.Address1,
		wh.Address2,
		wh.CityID,
		ct.Name as CityName,
		wh.StateID,
		st.Name as StateName,
		wh.ZipCode,
		wh.CountryID,
		ctry.Name as CountryName,
		wh.CreatedBy,
		wh.CreatedOn,
		wh.CreatedByIP,
		wh.ModifiedBy,
		wh.ModifiedOn,
		wh.ModifiedByIP,
		cusr.FirstName+' '+cusr.LastName as CreatedByUserName,
		musr.FirstName+' '+musr.LastName as ModifiedByUserName,
		wh.WareHouseCode
	from tbl_WareHouses wh
	inner join tbl_Company cmpy on cmpy.CompanyID = wh.CompanyID
	inner join tbl_Branch b on b.BranchID = wh.BranchID
	inner join tbl_City ct on ct.CityID = wh.CityID
	inner join tbl_State st on st.StateID = wh.StateID
	inner join tbl_Country ctry on ctry.CountryID = wh.CountryID
	inner join tbl_Users as cusr on cusr.UserID = wh.CreatedBy
	inner join tbl_Users as musr on musr.UserID = wh.ModifiedBy
END

/*

usp_WareHouse_GetAll

*/
GO
/****** Object:  StoredProcedure [dbo].[usp_WareHouse_GetWareHouseByID]    Script Date: 3/28/2023 12:15:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Aqib Ehsan>
-- Create date: <Feb 23,2023>
-- Description:	<Get WareHouse By ID>
-- =============================================
CREATE PROCEDURE [dbo].[usp_WareHouse_GetWareHouseByID]
@WareHouseID int	
AS
BEGIN
	
	SET NOCOUNT ON;

    select 
		wh.WareHouseID,
		wh.CompanyID,
		wh.BranchID,
		wh.Phone,
		wh.Address1,
		wh.Address2,
		wh.CityID,
		wh.StateID,
		wh.ZipCode,
		wh.CountryID,
		wh.CreatedBy,
		wh.CreatedOn,
		wh.CreatedByIP,
		wh.ModifiedBy,
		wh.ModifiedOn,
		wh.ModifiedByIP,
		wh.WareHouseCode
	from tbl_WareHouses wh
	where WareHouseID = WareHouseID
END

/*

usp_WareHouse_GetWareHouseByID @WareHouseID = 4

*/
GO
/****** Object:  StoredProcedure [dbo].[usp_WareHouse_Update]    Script Date: 3/28/2023 12:15:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Aqib Ehsan>
-- Create date: <Feb 23,2023>
-- Description:	<Update WareHouse>
-- =============================================
CREATE PROCEDURE [dbo].[usp_WareHouse_Update]
@WareHouseID int,
@CompanyID	int,
@BranchID	int,
@WareHouseName	nvarchar(200),
@Phone	nvarchar(200),
@Address1	nvarchar(200),
@Address2	nvarchar(200),
@CityID	int,
@StateID	int,
@ZipCode	nvarchar(200),
@CountryID	int,
@ModifiedBy	int,
@ModifiedOn	datetime,
@ModifiedByIP	nvarchar(200)
AS
BEGIN
	
	SET NOCOUNT ON;

	update tbl_WareHouses
	set CompanyID = @CompanyID,
		BranchID = @BranchID,
		Name = @WareHouseName,
		Phone = @Phone,
		Address1 = @Address1,
		Address2 = @Address2,
		CityID = @CityID,
		StateID = @StateID,
		ZipCode = @ZipCode,
		CountryID = @CountryID,
		ModifiedBy = @ModifiedBy,
		ModifiedOn = @ModifiedOn,
		ModifiedByIP = @ModifiedByIP
	where WareHouseID = @WareHouseID

	if(@@ROWCOUNT > 0)
	begin
		select 
		Name as WareHouseName 
		from tbl_WareHouses 
		where WareHouseID = @WareHouseID
	end
END

/*

usp_WareHouse_Update
@WareHouseID = 1,
@CompanyID = 1,
@BranchID = 1,
@WareHouseName = 'fasdf asf f',
@Phone = 'as dfas f',
@Address1 = 'as fas f',
@Address2 = 'as dfas df',
@CityID = 1,
@StateID = 1,
@ZipCode = 1,
@CountryID = 1,
@ModifiedBy = 1,
@ModifiedOn = '2023-01-12 11:14:28.247',
@ModifiedByIP = ''

*/
GO
/****** Object:  StoredProcedure [dbo].[usp_WareHouseCode_Generate]    Script Date: 3/28/2023 12:15:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Aqib Ehsan>
-- Create date: <Mar 14,2023>
-- Description:	<Generate WareHouse Code>
-- =============================================
create PROCEDURE [dbo].[usp_WareHouseCode_Generate]
@WareHouseID int,
@CompanyID int
AS
BEGIN
	SET NOCOUNT ON;

	declare @WareHouseCode nvarchar(100);
	declare @LastWareHouseCodeID int;
	declare @CodePrefix varchar(100);
	 
	select top 1 @LastWareHouseCodeID = WareHouseCodeID
	from tbl_WareHouses
	where CompanyID = @CompanyID
	and WareHouseID <> @WareHouseID
	order by WareHouseID desc

	select @CodePrefix = Name 
	from tbl_CodePrefixes 
	where CodePrefixKey = 'Warehouse-code'
	
	if(@LastWareHouseCodeID is null)
	begin
		set @LastWareHouseCodeID = 1;
		set @WareHouseCode = @CodePrefix+'-'+cast(@CompanyID AS VARCHAR(15))+'-00000'+cast(@LastWareHouseCodeID AS VARCHAR(15));

		update tbl_WareHouses
		set WareHouseCodeID = @LastWareHouseCodeID,
		WareHouseCode = @WareHouseCode
		where WareHouseID = @WareHouseID

	end
	else
	begin
		set @LastWareHouseCodeID = @LastWareHouseCodeID + 1;

		IF LEN(@LastWareHouseCodeID) = 1
			BEGIN
				set @WareHouseCode = @CodePrefix+'-'+cast(@CompanyID AS VARCHAR(15))+'-00000'+cast(@LastWareHouseCodeID AS VARCHAR(15));
			END
			ELSE IF LEN(@LastWareHouseCodeID + 1) = 2
			BEGIN
				set @WareHouseCode = @CodePrefix+'-'+cast(@CompanyID AS VARCHAR(15))+'-0000'+cast(@LastWareHouseCodeID AS VARCHAR(15));
			END
			ELSE IF LEN(@LastWareHouseCodeID + 1) = 3
			BEGIN
				set @WareHouseCode = @CodePrefix+'-'+cast(@CompanyID AS VARCHAR(15))+'-000'+cast(@LastWareHouseCodeID AS VARCHAR(15));
			END
			ELSE IF LEN(@LastWareHouseCodeID + 1) = 4
			BEGIN
				set @WareHouseCode = @CodePrefix+'-'+cast(@CompanyID AS VARCHAR(15))+'-00'+cast(@LastWareHouseCodeID AS VARCHAR(15));
			END
			ELSE IF LEN(@LastWareHouseCodeID + 1) = 5
			BEGIN
				set @WareHouseCode = @CodePrefix+'-'+cast(@CompanyID AS VARCHAR(15))+'-0'+cast(@LastWareHouseCodeID AS VARCHAR(15));
			END
			ELSE IF LEN(@LastWareHouseCodeID + 1) = 6
			BEGIN
				set @WareHouseCode = @CodePrefix+'-'+cast(@CompanyID AS VARCHAR(15))+'-'+cast(@LastWareHouseCodeID AS VARCHAR(15));
			END

		update tbl_WareHouses
		set WareHouseCodeID = @LastWareHouseCodeID,
		WareHouseCode = @WareHouseCode
		where WareHouseID = @WareHouseID

	end

	--select @LastWareHouseCodeID,@WareHouseCode

END

/*

exec usp_WareHouseCode_Generate @WareHouseID = 11,@CompanyID = 1

*/


GO
