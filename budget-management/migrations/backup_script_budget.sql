USE [master]
GO
/****** Object:  Database [KH.BudgetManager]    Script Date: 10/12/2025 9:25:12 PM ******/
CREATE DATABASE [KH.BudgetManager]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'KH.BudgetManager', FILENAME = N'\KH.BudgetManager.mdf' , SIZE = 73728KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'KH.BudgetManager_log', FILENAME = N'\KH.BudgetManager_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [KH.BudgetManager] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [KH.BudgetManager].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [KH.BudgetManager] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [KH.BudgetManager] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [KH.BudgetManager] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [KH.BudgetManager] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [KH.BudgetManager] SET ARITHABORT OFF 
GO
ALTER DATABASE [KH.BudgetManager] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [KH.BudgetManager] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [KH.BudgetManager] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [KH.BudgetManager] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [KH.BudgetManager] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [KH.BudgetManager] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [KH.BudgetManager] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [KH.BudgetManager] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [KH.BudgetManager] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [KH.BudgetManager] SET  DISABLE_BROKER 
GO
ALTER DATABASE [KH.BudgetManager] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [KH.BudgetManager] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [KH.BudgetManager] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [KH.BudgetManager] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [KH.BudgetManager] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [KH.BudgetManager] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [KH.BudgetManager] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [KH.BudgetManager] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [KH.BudgetManager] SET  MULTI_USER 
GO
ALTER DATABASE [KH.BudgetManager] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [KH.BudgetManager] SET DB_CHAINING OFF 
GO
ALTER DATABASE [KH.BudgetManager] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [KH.BudgetManager] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [KH.BudgetManager] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [KH.BudgetManager] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [KH.BudgetManager] SET QUERY_STORE = ON
GO
ALTER DATABASE [KH.BudgetManager] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [KH.BudgetManager]
GO
/****** Object:  User [bud_user]    Script Date: 10/12/2025 9:25:12 PM ******/
CREATE USER [bud_user] FOR LOGIN [bud_user] WITH DEFAULT_SCHEMA=[bud]
GO
/****** Object:  Schema [auth]    Script Date: 10/12/2025 9:25:12 PM ******/
CREATE SCHEMA [auth]
GO
/****** Object:  Schema [bud]    Script Date: 10/12/2025 9:25:12 PM ******/
CREATE SCHEMA [bud]
GO
USE [KH.BudgetManager]
GO
/****** Object:  Sequence [bud].[seq_adm_employees]    Script Date: 10/12/2025 9:25:12 PM ******/
CREATE SEQUENCE [bud].[seq_adm_employees] 
 AS [bigint]
 START WITH 1
 INCREMENT BY 1
 MINVALUE -9223372036854775808
 MAXVALUE 9223372036854775807
 CACHE 
GO
USE [KH.BudgetManager]
GO
/****** Object:  Sequence [bud].[seq_bud_budget_adjustment_details]    Script Date: 10/12/2025 9:25:12 PM ******/
CREATE SEQUENCE [bud].[seq_bud_budget_adjustment_details] 
 AS [bigint]
 START WITH 1
 INCREMENT BY 50
 MINVALUE -9223372036854775808
 MAXVALUE 9223372036854775807
 CACHE 
GO
USE [KH.BudgetManager]
GO
/****** Object:  Sequence [bud].[seq_bud_budget_adjustment_histories]    Script Date: 10/12/2025 9:25:12 PM ******/
CREATE SEQUENCE [bud].[seq_bud_budget_adjustment_histories] 
 AS [bigint]
 START WITH 1
 INCREMENT BY 1
 MINVALUE -9223372036854775808
 MAXVALUE 9223372036854775807
 CACHE 
GO
USE [KH.BudgetManager]
GO
/****** Object:  Sequence [bud].[seq_bud_budget_adjustments]    Script Date: 10/12/2025 9:25:12 PM ******/
CREATE SEQUENCE [bud].[seq_bud_budget_adjustments] 
 AS [bigint]
 START WITH 1
 INCREMENT BY 50
 MINVALUE -9223372036854775808
 MAXVALUE 9223372036854775807
 CACHE 
GO
USE [KH.BudgetManager]
GO
/****** Object:  Sequence [bud].[seq_bud_budget_request_details]    Script Date: 10/12/2025 9:25:12 PM ******/
CREATE SEQUENCE [bud].[seq_bud_budget_request_details] 
 AS [bigint]
 START WITH 1
 INCREMENT BY 1
 MINVALUE -9223372036854775808
 MAXVALUE 9223372036854775807
 CACHE 
GO
USE [KH.BudgetManager]
GO
/****** Object:  Sequence [bud].[seq_bud_budget_requests]    Script Date: 10/12/2025 9:25:12 PM ******/
CREATE SEQUENCE [bud].[seq_bud_budget_requests] 
 AS [bigint]
 START WITH 1
 INCREMENT BY 1
 MINVALUE -9223372036854775808
 MAXVALUE 9223372036854775807
 CACHE 
GO
USE [KH.BudgetManager]
GO
/****** Object:  Sequence [bud].[seq_bud_BudgetPlan]    Script Date: 10/12/2025 9:25:12 PM ******/
CREATE SEQUENCE [bud].[seq_bud_BudgetPlan] 
 AS [bigint]
 START WITH 1
 INCREMENT BY 1
 MINVALUE -9223372036854775808
 MAXVALUE 9223372036854775807
 CACHE 
GO
USE [KH.BudgetManager]
GO
/****** Object:  Sequence [bud].[seq_bud_BudgetPlanDetail]    Script Date: 10/12/2025 9:25:12 PM ******/
CREATE SEQUENCE [bud].[seq_bud_BudgetPlanDetail] 
 AS [bigint]
 START WITH 100
 INCREMENT BY 1
 MINVALUE -9223372036854775808
 MAXVALUE 9223372036854775807
 CACHE 
GO
USE [KH.BudgetManager]
GO
/****** Object:  Sequence [bud].[seq_bud_Config]    Script Date: 10/12/2025 9:25:12 PM ******/
CREATE SEQUENCE [bud].[seq_bud_Config] 
 AS [bigint]
 START WITH 1
 INCREMENT BY 1
 MINVALUE -9223372036854775808
 MAXVALUE 9223372036854775807
 CACHE 
GO
USE [KH.BudgetManager]
GO
/****** Object:  Sequence [bud].[seq_bud_FlexHierarchy]    Script Date: 10/12/2025 9:25:12 PM ******/
CREATE SEQUENCE [bud].[seq_bud_FlexHierarchy] 
 AS [bigint]
 START WITH 1
 INCREMENT BY 1
 MINVALUE -9223372036854775808
 MAXVALUE 9223372036854775807
 CACHE 
GO
USE [KH.BudgetManager]
GO
/****** Object:  Sequence [bud].[seq_bud_flexValues]    Script Date: 10/12/2025 9:25:12 PM ******/
CREATE SEQUENCE [bud].[seq_bud_flexValues] 
 AS [bigint]
 START WITH 1
 INCREMENT BY 1
 MINVALUE -9223372036854775808
 MAXVALUE 9223372036854775807
 CACHE 
GO
USE [KH.BudgetManager]
GO
/****** Object:  Sequence [bud].[Seq_bud_FlexValueSets]    Script Date: 10/12/2025 9:25:12 PM ******/
CREATE SEQUENCE [bud].[Seq_bud_FlexValueSets] 
 AS [bigint]
 START WITH 1
 INCREMENT BY 1
 MINVALUE -9223372036854775808
 MAXVALUE 9223372036854775807
 CACHE 
GO
USE [KH.BudgetManager]
GO
/****** Object:  Sequence [bud].[seq_bud_Template]    Script Date: 10/12/2025 9:25:12 PM ******/
CREATE SEQUENCE [bud].[seq_bud_Template] 
 AS [bigint]
 START WITH 1
 INCREMENT BY 1
 MINVALUE -9223372036854775808
 MAXVALUE 9223372036854775807
 CACHE 
GO
USE [KH.BudgetManager]
GO
/****** Object:  Sequence [dbo].[seq_adm_flex_hierarchy]    Script Date: 10/12/2025 9:25:12 PM ******/
CREATE SEQUENCE [dbo].[seq_adm_flex_hierarchy] 
 AS [bigint]
 START WITH 1
 INCREMENT BY 1
 MINVALUE -9223372036854775808
 MAXVALUE 9223372036854775807
 CACHE 
GO
USE [KH.BudgetManager]
GO
/****** Object:  Sequence [dbo].[Seq_adm_flex_value_sets]    Script Date: 10/12/2025 9:25:12 PM ******/
CREATE SEQUENCE [dbo].[Seq_adm_flex_value_sets] 
 AS [bigint]
 START WITH 1
 INCREMENT BY 1
 MINVALUE -9223372036854775808
 MAXVALUE 9223372036854775807
 CACHE 
GO
USE [KH.BudgetManager]
GO
/****** Object:  Sequence [dbo].[seq_adm_flex_values]    Script Date: 10/12/2025 9:25:12 PM ******/
CREATE SEQUENCE [dbo].[seq_adm_flex_values] 
 AS [bigint]
 START WITH 1
 INCREMENT BY 1
 MINVALUE -9223372036854775808
 MAXVALUE 9223372036854775807
 CACHE 
GO
USE [KH.BudgetManager]
GO
/****** Object:  Sequence [dbo].[seq_bud_balance]    Script Date: 10/12/2025 9:25:12 PM ******/
CREATE SEQUENCE [dbo].[seq_bud_balance] 
 AS [bigint]
 START WITH 1
 INCREMENT BY 1
 MINVALUE -9223372036854775808
 MAXVALUE 9223372036854775807
 CACHE 
GO
/****** Object:  UserDefinedTableType [bud].[bud_type_check_balance_detail]    Script Date: 10/12/2025 9:25:12 PM ******/
CREATE TYPE [bud].[bud_type_check_balance_detail] AS TABLE(
	[source_header_id] [bigint] NULL,
	[source_detail_id] [bigint] NULL,
	[balance_id] [bigint] NULL,
	[amount] [decimal](20, 6) NULL,
	[segment1] [nvarchar](500) NULL,
	[segment2] [nvarchar](500) NULL,
	[segment3] [nvarchar](500) NULL,
	[segment4] [nvarchar](500) NULL,
	[segment5] [nvarchar](500) NULL,
	[segment6] [nvarchar](500) NULL,
	[segment7] [nvarchar](500) NULL,
	[segment8] [nvarchar](500) NULL,
	[segment9] [nvarchar](500) NULL,
	[segment10] [nvarchar](500) NULL
)
GO
/****** Object:  UserDefinedTableType [dbo].[type_list_bigint]    Script Date: 10/12/2025 9:25:12 PM ******/
CREATE TYPE [dbo].[type_list_bigint] AS TABLE(
	[value] [bigint] NULL
)
GO
/****** Object:  UserDefinedTableType [dbo].[type_list_string]    Script Date: 10/12/2025 9:25:12 PM ******/
CREATE TYPE [dbo].[type_list_string] AS TABLE(
	[value] [nvarchar](4000) NULL
)
GO
/****** Object:  Synonym [bud].[Employee]    Script Date: 10/12/2025 9:25:12 PM ******/
CREATE SYNONYM [bud].[Employee] FOR [KH.BudgetManager].[dbo].[Employee]
GO
/****** Object:  Table [dbo].[adm_employee_organization]    Script Date: 10/12/2025 9:25:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[adm_employee_organization](
	[employee_organization_id] [int] IDENTITY(1,1) NOT NULL,
	[organization_id] [int] NULL,
	[employee_id] [int] NULL,
 CONSTRAINT [PK_adm_employee_organization] PRIMARY KEY CLUSTERED 
(
	[employee_organization_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[adm_organizations]    Script Date: 10/12/2025 9:25:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[adm_organizations](
	[organization_id] [bigint] IDENTITY(1,1) NOT NULL,
	[organization_code] [nvarchar](255) NULL,
	[organization_name] [nvarchar](1000) NULL,
	[address] [nvarchar](255) NULL,
	[unit_id] [bigint] NULL,
	[parent_id] [bigint] NULL,
	[unit_code] [nvarchar](255) NULL,
	[division_code] [nvarchar](255) NULL,
	[department_code] [nvarchar](255) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[adm_employees]    Script Date: 10/12/2025 9:25:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[adm_employees](
	[employee_id] [int] NOT NULL,
	[employee_name] [nvarchar](1000) NULL,
	[employee_code] [nvarchar](255) NULL,
	[username] [nvarchar](255) NULL,
	[edit_version] [timestamp] NOT NULL,
 CONSTRAINT [PK_employee] PRIMARY KEY CLUSTERED 
(
	[employee_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[employee_organization_unit_lite_v]    Script Date: 10/12/2025 9:25:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/*
* username, branch code, division code
* phamha Oct 09, 2025
*/
create   view [dbo].[employee_organization_unit_lite_v]
as
(
select a.username, c.unit_code, c.division_code
from adm_employees a
inner join adm_employee_organization b on a.employee_id = b.employee_id
inner join adm_organizations c on b.organization_id = c.organization_id 
)
GO
/****** Object:  Table [dbo].[adm_data_scope_permission]    Script Date: 10/12/2025 9:25:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[adm_data_scope_permission](
	[data_scope_permission_id] [bigint] IDENTITY(1,1) NOT NULL,
	[description] [nvarchar](255) NULL,
	[data_scope_id] [bigint] NOT NULL,
	[flex_value_id] [bigint] NOT NULL,
	[role_id] [bigint] NULL,
 CONSTRAINT [PK_data_scope_permission] PRIMARY KEY CLUSTERED 
(
	[data_scope_permission_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[adm_data_scope]    Script Date: 10/12/2025 9:25:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[adm_data_scope](
	[data_scope_id] [bigint] IDENTITY(1,1) NOT NULL,
	[scope_type] [int] NULL,
	[description] [nvarchar](255) NULL,
 CONSTRAINT [PK_adm_scope_data] PRIMARY KEY CLUSTERED 
(
	[data_scope_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[adm_roles]    Script Date: 10/12/2025 9:25:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[adm_roles](
	[role_id] [int] NOT NULL,
	[role_code] [nvarchar](255) NULL,
	[role_name] [nvarchar](1000) NULL,
	[description] [nvarchar](255) NULL,
 CONSTRAINT [PK_Role] PRIMARY KEY CLUSTERED 
(
	[role_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[adm_employee_role]    Script Date: 10/12/2025 9:25:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[adm_employee_role](
	[employee_role_id] [int] IDENTITY(1,1) NOT NULL,
	[employee_id] [int] NOT NULL,
	[role_id] [int] NOT NULL,
 CONSTRAINT [PK_employee_role] PRIMARY KEY CLUSTERED 
(
	[employee_role_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[employee_role_lite_v]    Script Date: 10/12/2025 9:25:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
  
create   view [dbo].[employee_role_lite_v]
as
(
select a.employee_id, a.username, c.role_id 
from dbo.adm_employees a
inner join dbo.adm_employee_role b on a.employee_id = b.role_id
inner join dbo.adm_roles c on b.role_id = c.role_id

)
GO
/****** Object:  Table [dbo].[adm_flex_values]    Script Date: 10/12/2025 9:25:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[adm_flex_values](
	[flex_value_id] [bigint] NOT NULL,
	[flex_value_set_id] [bigint] NULL,
	[flex_value] [nvarchar](500) NULL,
	[flex_value_name] [nvarchar](500) NULL,
	[enable_flag] [nvarchar](10) NULL,
	[period] [nvarchar](10) NULL,
	[description] [nvarchar](500) NULL,
	[edit_version] [timestamp] NOT NULL,
	[created_by] [nvarchar](255) NULL,
	[created_date] [datetime] NULL,
	[modified_by] [nvarchar](255) NULL,
	[modified_date] [datetime] NULL,
	[attribute1] [nvarchar](256) NULL,
	[attribute2] [nvarchar](256) NULL,
	[attribute3] [nvarchar](256) NULL,
	[attribute4] [nvarchar](256) NULL,
	[attribute5] [nvarchar](256) NULL,
	[attribute1_label] [nvarchar](256) NULL,
	[attribute2_label] [nvarchar](256) NULL,
	[attribute3_label] [nvarchar](256) NULL,
	[attribute4_label] [nvarchar](256) NULL,
	[attribute5_label] [nvarchar](256) NULL,
	[attribute6_label] [nvarchar](256) NULL,
	[ref_id] [bigint] NULL,
 CONSTRAINT [PK_adm_flex_value] PRIMARY KEY CLUSTERED 
(
	[flex_value_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[permission_data_scope_type_v]    Script Date: 10/12/2025 9:25:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


/*
* username, code get scope_type
* phamha Oct 09, 2025
*/

create   view [dbo].[permission_data_scope_type_v]
as
(
select b.flex_value as permission_data_code,

c.username,
d.scope_type,

b.attribute1,
b.attribute2,
b.attribute3,
b.attribute4,
b.attribute5,
b.ref_id
from [dbo].adm_data_scope_permission a
inner join  [dbo].adm_flex_values b on a.flex_value_id = b.flex_value_id
inner join [dbo].employee_role_lite_v c on a.role_id = c.role_id
inner join [dbo].adm_data_scope d on d.data_scope_id = a.data_scope_id
where b.flex_value ='PERMISS_BUDGET'

)
 
GO
/****** Object:  View [dbo].[employee_organization_org_lite_v]    Script Date: 10/12/2025 9:25:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


/*
* username, branch code, division code
* THeo co cau to chuc
* phamha Oct 09, 2025
*/
create   view [dbo].[employee_organization_org_lite_v]
as
(
	select a.username, c.unit_code, c.division_code
	from [dbo].adm_employees a
	inner join [dbo].adm_employee_organization b on a.employee_id = b.employee_id
	inner join [dbo].adm_organizations c on b.organization_id = c.organization_id 

	union  

	select a.username, f.unit_code, f.division_code   
	from [dbo].adm_employees a
	inner join adm_employee_organization b on a.employee_id = b.employee_id
	inner join [dbo].adm_organizations c on b.organization_id = c.organization_id --department
	inner join [dbo].adm_organizations d on d.organization_id = c.parent_id --unit
	
	--get child
	inner join [dbo].adm_organizations e on e.parent_id = d.organization_id
	--child
	inner join [dbo].adm_organizations f on f.unit_code = e.organization_code

)
GO
/****** Object:  UserDefinedFunction [dbo].[func_get_data_scope_permission]    Script Date: 10/12/2025 9:25:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

     
CREATE function [dbo].[func_get_data_scope_permission](
@username nvarchar(256),
@permission_data_code nvarchar(256)

)
returns table
as
return
(

	with a as (
	select  permission_data_code, username, scope_type, x.attribute1, x.attribute2
	from permission_data_scope_type_v x
	where x.username=@username
        and (@permission_data_code = '' or permission_data_code = @permission_data_code)
	)
	select a.permission_data_code, a.username,  b.unit_code, b.division_code,a.attribute1, a.attribute2
	from a
	inner join employee_organization_unit_lite_v b on a.username = b.username
	where a.scope_type = 1 
	union all
	select a.permission_data_code,a.username,  b.unit_code, b.division_code,a.attribute1, a.attribute2
	from a
	inner join employee_organization_org_lite_v b on a.username = b.username
	where a.scope_type = 2 

)
GO
/****** Object:  Table [bud].[adm_employees]    Script Date: 10/12/2025 9:25:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [bud].[adm_employees](
	[employee_id] [bigint] NOT NULL,
	[employee_name] [nvarchar](1000) NULL,
	[employee_code] [nvarchar](255) NULL,
	[username] [nvarchar](255) NULL,
	[edit_version] [timestamp] NOT NULL,
 CONSTRAINT [PK_employee] PRIMARY KEY CLUSTERED 
(
	[employee_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [bud].[adm_roles]    Script Date: 10/12/2025 9:25:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [bud].[adm_roles](
	[role_id] [int] NOT NULL,
	[role_code] [nvarchar](255) NULL,
	[role_name] [nvarchar](1000) NULL,
	[description] [nvarchar](255) NULL,
 CONSTRAINT [PK_Role] PRIMARY KEY CLUSTERED 
(
	[role_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [bud].[adm_employee_role]    Script Date: 10/12/2025 9:25:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [bud].[adm_employee_role](
	[employee_role_id] [int] IDENTITY(1,1) NOT NULL,
	[employee_id] [int] NOT NULL,
	[role_id] [int] NOT NULL,
 CONSTRAINT [PK_employee_role] PRIMARY KEY CLUSTERED 
(
	[employee_role_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [bud].[employee_role_lite_v]    Script Date: 10/12/2025 9:25:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


create   view [bud].[employee_role_lite_v]
as
(
select a.employee_id, a.username, c.role_id 
from bud.adm_employees a
inner join bud.adm_employee_role b on a.employee_id = b.role_id
inner join bud.adm_roles c on b.role_id = c.role_id

)

 
GO
/****** Object:  Table [bud].[adm_employee_organization]    Script Date: 10/12/2025 9:25:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [bud].[adm_employee_organization](
	[employee_organization_id] [int] IDENTITY(1,1) NOT NULL,
	[organization_id] [int] NULL,
	[employee_id] [int] NULL,
 CONSTRAINT [PK_adm_employee_organization] PRIMARY KEY CLUSTERED 
(
	[employee_organization_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [bud].[adm_organizations]    Script Date: 10/12/2025 9:25:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [bud].[adm_organizations](
	[organization_id] [bigint] IDENTITY(1,1) NOT NULL,
	[organization_code] [nvarchar](255) NULL,
	[organization_name] [nvarchar](1000) NULL,
	[address] [nvarchar](255) NULL,
	[unit_id] [bigint] NULL,
	[parent_id] [bigint] NULL,
	[unit_code] [nvarchar](255) NULL,
	[division_code] [nvarchar](255) NULL,
	[department_code] [nvarchar](255) NULL
) ON [PRIMARY]
GO
/****** Object:  View [bud].[employee_organization_unit_lite_v]    Script Date: 10/12/2025 9:25:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO





/*
* username, branch code, division code
* phamha Oct 09, 2025
*/
create   view [bud].[employee_organization_unit_lite_v]
as
(
select a.username, c.unit_code, c.division_code
from bud.adm_employees a
inner join bud.adm_employee_organization b on a.employee_id = b.employee_id
inner join bud.adm_organizations c on b.organization_id = c.organization_id 
)
GO
/****** Object:  View [bud].[employee_organization_org_lite_v]    Script Date: 10/12/2025 9:25:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 



/*
* username, branch code, division code
* THeo co cau to chuc
* phamha Oct 09, 2025
*/
create   view [bud].[employee_organization_org_lite_v]
as
(
	select a.username, c.unit_code, c.division_code
	from bud.adm_employees a
	inner join bud.adm_employee_organization b on a.employee_id = b.employee_id
	inner join bud.adm_organizations c on b.organization_id = c.organization_id 

	union  

	select a.username, f.unit_code, f.division_code   
	from bud.adm_employees a
	inner join bud.adm_employee_organization b on a.employee_id = b.employee_id
	inner join bud.adm_organizations c on b.organization_id = c.organization_id --department
	inner join bud.adm_organizations d on d.organization_id = c.parent_id --unit
	
	--get child
	inner join bud.adm_organizations e on e.parent_id = d.organization_id
	--child e
	inner join bud.adm_organizations f on f.unit_code = e.organization_code

)
GO
/****** Object:  Table [bud].[adm_data_scope_permission]    Script Date: 10/12/2025 9:25:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [bud].[adm_data_scope_permission](
	[data_scope_permission_id] [bigint] IDENTITY(1,1) NOT NULL,
	[description] [nvarchar](255) NULL,
	[data_scope_id] [bigint] NOT NULL,
	[flex_value_id] [bigint] NOT NULL,
	[role_id] [bigint] NULL,
 CONSTRAINT [PK_data_scope_permission] PRIMARY KEY CLUSTERED 
(
	[data_scope_permission_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [bud].[adm_data_scopes]    Script Date: 10/12/2025 9:25:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [bud].[adm_data_scopes](
	[data_scope_id] [bigint] IDENTITY(1,1) NOT NULL,
	[scope_type] [int] NULL,
	[description] [nvarchar](255) NULL,
 CONSTRAINT [PK_adm_scope_data] PRIMARY KEY CLUSTERED 
(
	[data_scope_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [bud].[adm_flex_values]    Script Date: 10/12/2025 9:25:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [bud].[adm_flex_values](
	[flex_value_id] [bigint] NOT NULL,
	[flex_value_set_id] [bigint] NULL,
	[flex_value] [nvarchar](500) NULL,
	[flex_value_name] [nvarchar](500) NULL,
	[enable_flag] [nvarchar](10) NULL,
	[period] [nvarchar](10) NULL,
	[description] [nvarchar](500) NULL,
	[edit_version] [timestamp] NOT NULL,
	[created_by] [nvarchar](255) NULL,
	[created_date] [datetime] NULL,
	[modified_by] [nvarchar](255) NULL,
	[modified_date] [datetime] NULL,
	[attribute1] [nvarchar](256) NULL,
	[attribute2] [nvarchar](256) NULL,
	[attribute3] [nvarchar](256) NULL,
	[attribute4] [nvarchar](256) NULL,
	[attribute5] [nvarchar](256) NULL,
	[attribute1_label] [nvarchar](256) NULL,
	[attribute2_label] [nvarchar](256) NULL,
	[attribute3_label] [nvarchar](256) NULL,
	[attribute4_label] [nvarchar](256) NULL,
	[attribute5_label] [nvarchar](256) NULL,
	[attribute6_label] [nvarchar](256) NULL,
	[ref_id] [bigint] NULL,
 CONSTRAINT [PK_adm_flex_value] PRIMARY KEY CLUSTERED 
(
	[flex_value_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [bud].[permission_data_scope_type_v]    Script Date: 10/12/2025 9:25:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 





/*
* username, code get scope_type
* phamha Oct 09, 2025
*/

create     view [bud].[permission_data_scope_type_v]
as
(
select b.flex_value as permission_data_code,

c.username,
d.scope_type,

b.attribute1,
b.attribute2,
b.attribute3,
b.attribute4,
b.attribute5,
b.ref_id
from bud.adm_data_scope_permission a
inner join  bud.adm_flex_values b on a.flex_value_id = b.flex_value_id
inner join bud.employee_role_lite_v c on a.role_id = c.role_id
inner join bud.adm_data_scopes d on d.data_scope_id = a.data_scope_id
where b.flex_value ='PERMISS_BUDGET'

)
 

GO
/****** Object:  UserDefinedFunction [bud].[func_get_data_scope_permission]    Script Date: 10/12/2025 9:25:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 


CREATE function [bud].[func_get_data_scope_permission](
@username nvarchar(256),
@permission_data_code nvarchar(256)

)
returns table
as
return
(

	with a as (
	select  permission_data_code, username, scope_type, x.attribute1, x.attribute2
	from bud.permission_data_scope_type_v x
	where x.username=@username
        and (@permission_data_code = '' or permission_data_code = @permission_data_code)
	)
	select a.permission_data_code, a.username,  b.unit_code, b.division_code,a.attribute1, a.attribute2
	from a
	inner join bud.employee_organization_unit_lite_v b on a.username = b.username
	where a.scope_type = 1 
	union all
	select a.permission_data_code,a.username,  b.unit_code, b.division_code,a.attribute1, a.attribute2
	from a
	inner join bud.employee_organization_org_lite_v b on a.username = b.username
	where a.scope_type = 2 

)

GO
/****** Object:  Table [dbo].[adm_flex_hierarchy]    Script Date: 10/12/2025 9:25:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[adm_flex_hierarchy](
	[flex_hierarchy_id] [bigint] NOT NULL,
	[parent_flex_value_set_id] [bigint] NOT NULL,
	[child_flex_value_set_id] [bigint] NOT NULL,
	[parent_flex_value_id] [bigint] NOT NULL,
	[child_flex_value_id] [bigint] NOT NULL,
	[child_value] [nvarchar](500) NULL,
	[parent_value] [nvarchar](500) NULL,
	[hierarchy_type] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[adm_flex_value_sets]    Script Date: 10/12/2025 9:25:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[adm_flex_value_sets](
	[flex_value_set_id] [bigint] NOT NULL,
	[flex_value_set_name] [nvarchar](500) NULL,
	[enable_flag] [nvarchar](10) NULL,
	[period] [nvarchar](10) NULL,
	[description] [nvarchar](500) NULL,
	[edit_version] [timestamp] NOT NULL,
	[created_by] [nvarchar](255) NULL,
	[created_date] [datetime] NULL,
	[modified_by] [nvarchar](255) NULL,
	[modified_date] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [bud].[bud_configs]    Script Date: 10/12/2025 9:25:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [bud].[bud_configs](
	[config_id] [bigint] NULL,
	[template_id] [bigint] NULL,
	[unit_type] [nvarchar](256) NULL,
	[unit_group] [nvarchar](256) NULL,
	[division_group] [nvarchar](256) NULL,
	[budget_line] [nvarchar](256) NULL,
	[created_by] [nvarchar](256) NULL,
	[created_date] [datetime] NULL,
	[modified_by] [nvarchar](256) NULL,
	[modified_date] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [bud].[bud_templates]    Script Date: 10/12/2025 9:25:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [bud].[bud_templates](
	[template_id] [bigint] NULL,
	[template_concanate] [nvarchar](500) NULL,
	[segment1_type] [nvarchar](10) NULL,
	[segment2_type] [nvarchar](10) NULL,
	[segment3_type] [nvarchar](10) NULL,
	[segment4_type] [nvarchar](10) NULL,
	[segment5_type] [nvarchar](10) NULL,
	[segment6_type] [nvarchar](10) NULL,
	[segment7_type] [nvarchar](10) NULL,
	[segment8_type] [nvarchar](10) NULL,
	[segment9_type] [nvarchar](10) NULL,
	[segment10_type] [nvarchar](10) NULL,
	[notify_type] [nvarchar](10) NULL,
	[created_by] [nvarchar](256) NULL,
	[created_date] [datetime] NULL,
	[modified_by] [nvarchar](256) NULL,
	[modified_date] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  UserDefinedFunction [bud].[func_config_segment]    Script Date: 10/12/2025 9:25:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
* get config block from deail request
* phamkhanhhand Oct 06, 2025
*/
CREATE   FUNCTION [bud].[func_config_segment]
(
    @request_budget_list bud.bud_type_check_balance_detail readonly
) 
RETURNS   TABLE 
AS
return
(

	select
	a.config_id,
	b.template_id,
	c.balance_id,
	b.segment1_type, 
	b.segment2_type, 
	b.segment3_type, 
	b.segment4_type, 
	b.segment5_type, 
	b.segment6_type, 
	b.segment7_type, 
	b.segment8_type, 
	b.segment9_type, 
	b.segment10_type, 
	
	b.notify_type 
	,h1s.child_value segment1_balance --full value branch, ho, office
	,c.amount,
	h1.child_value segment1  --016 to 001
	,c.segment2
	,c.segment3
	,c.segment4
	,c.segment5
	,c.segment6
	,c.segment7
	,c.segment8
	,c.segment9
	,c.segment10
	 
	from bud.bud_configs a
	inner join bud.bud_templates b on a.template_id = b.template_id
	
	left join dbo.adm_flex_hierarchy h1 on h1.parent_value = a.unit_group
	left join dbo.adm_flex_value_sets sc1 on sc1.flex_value_set_id = h1.child_flex_value_id and sc1.flex_value_set_name ='BRANCH_ITEM'--set child
	left join dbo.adm_flex_value_sets sp1 on sp1.flex_value_set_id = h1.parent_flex_value_set_id and  sp1.flex_value_set_name ='BRANCH_GROUP' --set parent

	left join dbo.adm_flex_hierarchy h1s on h1.child_flex_value_set_id = h1s.parent_flex_value_set_id
			and h1.child_flex_value_id = h1s.parent_flex_value_id --grandchild
			
	left join dbo.adm_flex_value_sets sc1s on sc1s.flex_value_set_id = h1s.child_flex_value_set_id and  sp1.flex_value_set_name ='BUDGET_UNIT_ITEM' --set grandchild


	left join dbo.adm_flex_hierarchy h2 on h2.parent_value = a.division_group
	left join dbo.adm_flex_value_sets sc2 on sc2.flex_value_set_id = h2.child_flex_value_id and sc2.flex_value_set_name ='DIVISION_ITEM'--set child
	left join dbo.adm_flex_value_sets sp2 on sp2.flex_value_set_id = h2.parent_flex_value_set_id and  sp2.flex_value_set_name ='DIVISION_GROUP' --set parent

	right join @request_budget_list c
		on a.budget_line = c.segment5 
		   and h1s.child_value = c.segment1
		   and h2.child_value = c.segment2


		   )

GO
/****** Object:  Table [auth].[auth_accounts]    Script Date: 10/12/2025 9:25:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [auth].[auth_accounts](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[username] [nvarchar](255) NULL,
	[password_hash] [nvarchar](2000) NULL,
	[created_date] [datetime] NULL,
	[created_by] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [bud].[adm_flex_hierarchy]    Script Date: 10/12/2025 9:25:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [bud].[adm_flex_hierarchy](
	[flex_hierarchy_id] [bigint] NOT NULL,
	[parent_flex_value_set_id] [bigint] NOT NULL,
	[child_flex_value_set_id] [bigint] NOT NULL,
	[parent_flex_value_id] [bigint] NOT NULL,
	[child_flex_value_id] [bigint] NOT NULL,
	[child_value] [nvarchar](500) NULL,
	[parent_value] [nvarchar](500) NULL,
	[hierarchy_type] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [bud].[adm_flex_value_sets]    Script Date: 10/12/2025 9:25:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [bud].[adm_flex_value_sets](
	[flex_value_set_id] [bigint] NOT NULL,
	[flex_value_set_name] [nvarchar](500) NULL,
	[enable_flag] [nvarchar](10) NULL,
	[period] [nvarchar](10) NULL,
	[description] [nvarchar](500) NULL,
	[edit_version] [timestamp] NOT NULL,
	[created_by] [nvarchar](255) NULL,
	[created_date] [datetime] NULL,
	[modified_by] [nvarchar](255) NULL,
	[modified_date] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [bud].[adm_scopes]    Script Date: 10/12/2025 9:25:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [bud].[adm_scopes](
	[scope_id] [int] NOT NULL,
	[scope_code] [nvarchar](255) NULL,
	[scope_name] [nvarchar](1000) NULL,
	[description] [nvarchar](255) NULL,
 CONSTRAINT [pk_scope] PRIMARY KEY CLUSTERED 
(
	[scope_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [bud].[bud_balances]    Script Date: 10/12/2025 9:25:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [bud].[bud_balances](
	[balance_id] [bigint] NOT NULL,
	[segment1] [nvarchar](500) NULL,
	[segment2] [nvarchar](500) NULL,
	[segment3] [nvarchar](500) NULL,
	[segment4] [nvarchar](500) NULL,
	[segment5] [nvarchar](500) NULL,
	[segment6] [nvarchar](500) NULL,
	[segment7] [nvarchar](500) NULL,
	[segment8] [nvarchar](500) NULL,
	[segment9] [nvarchar](500) NULL,
	[segment10] [nvarchar](500) NULL,
	[planning_amount] [decimal](20, 4) NULL,
	[actual_amount] [decimal](20, 4) NULL,
	[remainning_amount] [decimal](20, 4) NULL,
	[period] [nvarchar](256) NULL,
	[created_by] [nvarchar](256) NULL,
	[created_date] [datetime] NULL,
	[modified_by] [nvarchar](256) NULL,
	[modified_date] [datetime] NULL,
 CONSTRAINT [PK_bud_balances] PRIMARY KEY CLUSTERED 
(
	[balance_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [bud].[bud_budget_adjustment_details]    Script Date: 10/12/2025 9:25:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [bud].[bud_budget_adjustment_details](
	[budget_adjustment_detail_id] [bigint] NOT NULL,
	[budget_adjustment_id] [bigint] NULL,
	[parent_id] [nvarchar](256) NULL,
	[parent_flag] [nvarchar](256) NULL,
	[adjustment_type] [nvarchar](256) NULL,
	[amount] [decimal](20, 6) NULL,
	[approved_amount] [decimal](20, 6) NULL,
	[segment1] [nvarchar](500) NULL,
	[segment2] [nvarchar](500) NULL,
	[segment3] [nvarchar](500) NULL,
	[segment4] [nvarchar](500) NULL,
	[segment5] [nvarchar](500) NULL,
	[segment6] [nvarchar](500) NULL,
	[segment7] [nvarchar](500) NULL,
	[segment8] [nvarchar](500) NULL,
	[segment9] [nvarchar](500) NULL,
	[segment10] [nvarchar](500) NULL,
	[description] [nvarchar](1000) NULL,
	[comment] [nvarchar](1000) NULL,
	[change_type] [nvarchar](50) NULL,
	[approved_change_type] [nvarchar](50) NULL,
	[ref_id] [bigint] NULL,
 CONSTRAINT [PK_bud_budget_adjustment_details] PRIMARY KEY CLUSTERED 
(
	[budget_adjustment_detail_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [bud].[bud_budget_adjustment_histories]    Script Date: 10/12/2025 9:25:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [bud].[bud_budget_adjustment_histories](
	[budget_adjustment_history_id] [bigint] IDENTITY(1,1) NOT NULL,
	[budget_adjustment_id] [bigint] NULL,
	[budget_adjustment_no] [nvarchar](256) NULL,
	[from_status] [nvarchar](256) NULL,
	[to_status] [nvarchar](256) NULL,
	[comment] [nvarchar](1000) NULL,
	[created_by] [nvarchar](256) NULL,
	[created_date] [datetime] NULL,
 CONSTRAINT [PK_bud_budget_adjustment_histories] PRIMARY KEY CLUSTERED 
(
	[budget_adjustment_history_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [bud].[bud_budget_adjustments]    Script Date: 10/12/2025 9:25:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [bud].[bud_budget_adjustments](
	[budget_adjustment_id] [bigint] NOT NULL,
	[budget_adjustment_no] [nvarchar](256) NULL,
	[budget_group] [nvarchar](256) NULL,
	[period] [nvarchar](256) NULL,
	[status] [nvarchar](256) NULL,
	[approval_username] [nvarchar](256) NULL,
	[total_amount] [decimal](20, 6) NULL,
	[approval_total_amount] [decimal](20, 6) NULL,
	[created_by] [nvarchar](256) NULL,
	[created_date] [datetime] NULL,
	[modified_by] [nvarchar](256) NULL,
	[modified_date] [datetime] NULL,
	[description] [nvarchar](1000) NULL,
	[comment] [nvarchar](1000) NULL,
 CONSTRAINT [PK_bud_budget_adjustments] PRIMARY KEY CLUSTERED 
(
	[budget_adjustment_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [bud].[bud_budget_plan_details]    Script Date: 10/12/2025 9:25:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [bud].[bud_budget_plan_details](
	[BudgetPlanDetailID] [bigint] NULL,
	[BudgetPlanID] [bigint] NULL,
	[Segment1] [nvarchar](500) NULL,
	[Segment2] [nvarchar](500) NULL,
	[Segment3] [nvarchar](500) NULL,
	[Segment4] [nvarchar](500) NULL,
	[Segment5] [nvarchar](500) NULL,
	[Segment6] [nvarchar](500) NULL,
	[Segment7] [nvarchar](500) NULL,
	[Segment8] [nvarchar](500) NULL,
	[Segment9] [nvarchar](500) NULL,
	[Segment10] [nvarchar](500) NULL,
	[Amount] [decimal](20, 4) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [bud].[bud_budget_plans]    Script Date: 10/12/2025 9:25:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [bud].[bud_budget_plans](
	[BudgetPlanID] [bigint] NULL,
	[Period] [nvarchar](10) NULL,
	[Status] [nvarchar](256) NULL,
	[created_by] [nvarchar](256) NULL,
	[created_date] [datetime] NULL,
	[modified_by] [nvarchar](256) NULL,
	[modified_date] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [bud].[bud_budget_request_details]    Script Date: 10/12/2025 9:25:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [bud].[bud_budget_request_details](
	[budget_request_detail_id] [bigint] NULL,
	[budget_request_id] [bigint] NULL,
	[amount] [decimal](20, 6) NULL,
	[segment1] [nvarchar](500) NULL,
	[segment2] [nvarchar](500) NULL,
	[segment3] [nvarchar](500) NULL,
	[segment4] [nvarchar](500) NULL,
	[segment5] [nvarchar](500) NULL,
	[segment6] [nvarchar](500) NULL,
	[segment7] [nvarchar](500) NULL,
	[segment8] [nvarchar](500) NULL,
	[segment9] [nvarchar](500) NULL,
	[segment10] [nvarchar](500) NULL,
	[balance_id] [bigint] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [bud].[bud_budget_requests]    Script Date: 10/12/2025 9:25:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [bud].[bud_budget_requests](
	[budget_request_id] [bigint] NULL,
	[source_type] [nvarchar](256) NULL,
	[source_id] [nvarchar](256) NULL,
	[source_no] [nvarchar](256) NULL,
	[check_result] [nvarchar](256) NULL,
	[status] [nvarchar](256) NULL,
	[request_type] [nvarchar](256) NULL,
	[total_amount] [decimal](20, 6) NULL,
	[created_by] [nvarchar](256) NULL,
	[created_date] [datetime] NULL,
	[modified_by] [nvarchar](256) NULL,
	[modified_date] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [bud].[bud_transactions]    Script Date: 10/12/2025 9:25:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [bud].[bud_transactions](
	[transaction_id] [bigint] IDENTITY(1,1) NOT NULL,
	[ref_type] [int] NULL,
	[ref_id] [bigint] NULL,
	[amount] [decimal](20, 6) NULL,
	[description] [nvarchar](1024) NULL,
	[created_by] [nvarchar](256) NULL,
	[created_date] [datetime] NULL,
	[modified_by] [nvarchar](256) NULL,
	[modified_date] [datetime] NULL,
 CONSTRAINT [PK_bud_transaction] PRIMARY KEY CLUSTERED 
(
	[transaction_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[adm_employee_roles]    Script Date: 10/12/2025 9:25:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[adm_employee_roles](
	[employee_role_id] [int] IDENTITY(1,1) NOT NULL,
	[employee_id] [int] NOT NULL,
	[role_id] [int] NOT NULL,
 CONSTRAINT [PK_employee_roles] PRIMARY KEY CLUSTERED 
(
	[employee_role_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[adm_permissions]    Script Date: 10/12/2025 9:25:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[adm_permissions](
	[permission_id] [int] IDENTITY(1,1) NOT NULL,
	[resource_id] [int] NOT NULL,
	[scope_id] [int] NOT NULL,
	[role_id] [int] NULL,
	[employee_id] [int] NULL,
 CONSTRAINT [pk_permission] PRIMARY KEY CLUSTERED 
(
	[permission_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[adm_resource_detail_apis]    Script Date: 10/12/2025 9:25:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[adm_resource_detail_apis](
	[adm_resource_detail_api_id] [int] IDENTITY(1,1) NOT NULL,
	[resource_id] [int] NULL,
	[uri] [nvarchar](255) NULL,
 CONSTRAINT [PK_adm_resource_detail_api] PRIMARY KEY CLUSTERED 
(
	[adm_resource_detail_api_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[adm_resource_scope]    Script Date: 10/12/2025 9:25:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[adm_resource_scope](
	[resource_scope_id] [int] IDENTITY(1,1) NOT NULL,
	[resource_id] [int] NULL,
	[scope_id] [int] NULL,
 CONSTRAINT [PK_adm_resource_scope] PRIMARY KEY CLUSTERED 
(
	[resource_scope_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[adm_resources]    Script Date: 10/12/2025 9:25:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[adm_resources](
	[resource_id] [int] NOT NULL,
	[resource_code] [nvarchar](255) NULL,
	[resource_name] [nvarchar](1000) NULL,
	[list_scope] [nvarchar](1000) NULL,
	[url] [nvarchar](255) NULL,
 CONSTRAINT [PK_resouce] PRIMARY KEY CLUSTERED 
(
	[resource_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[adm_scopes]    Script Date: 10/12/2025 9:25:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[adm_scopes](
	[scope_id] [int] NOT NULL,
	[scope_code] [nvarchar](255) NULL,
	[scope_name] [nvarchar](1000) NULL,
	[description] [nvarchar](255) NULL,
 CONSTRAINT [pk_scope] PRIMARY KEY CLUSTERED 
(
	[scope_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [bud].[adm_data_scope_permission] ADD  CONSTRAINT [DF_data_scope_permission_flex_value_id]  DEFAULT (NEXT VALUE FOR [seq_adm_flex_values]) FOR [flex_value_id]
GO
ALTER TABLE [bud].[adm_employees] ADD  CONSTRAINT [DF_adm_employees_employee_id]  DEFAULT (NEXT VALUE FOR [bud].[seq_adm_employees]) FOR [employee_id]
GO
ALTER TABLE [bud].[adm_flex_hierarchy] ADD  CONSTRAINT [DF_adm_flex_hierarchy_flex_link]  DEFAULT (NEXT VALUE FOR [seq_adm_flex_hierarchy]) FOR [flex_hierarchy_id]
GO
ALTER TABLE [bud].[adm_flex_value_sets] ADD  CONSTRAINT [DF_adm_flex_value_sets_flex_value_set_id]  DEFAULT (NEXT VALUE FOR [seq_adm_flex_value_sets]) FOR [flex_value_set_id]
GO
ALTER TABLE [bud].[adm_flex_values] ADD  CONSTRAINT [DF_adm_flex_values_flex_value_id]  DEFAULT (NEXT VALUE FOR [seq_adm_flex_values]) FOR [flex_value_id]
GO
ALTER TABLE [bud].[bud_budget_adjustment_details] ADD  CONSTRAINT [DF_bud_budget_adjustment_details_budget_adjustment_detail_id]  DEFAULT (NEXT VALUE FOR [bud].[seq_bud_budget_adjustment_details]) FOR [budget_adjustment_detail_id]
GO
ALTER TABLE [bud].[bud_budget_adjustment_histories] ADD  CONSTRAINT [DF_bud_budget_adjustment_histories_budget_adjustment_id]  DEFAULT (NEXT VALUE FOR [bud].[seq_bud_budget_adjustments]) FOR [budget_adjustment_id]
GO
ALTER TABLE [bud].[bud_budget_adjustments] ADD  CONSTRAINT [DF_bud_budget_adjustments_budget_adjustment_id]  DEFAULT (NEXT VALUE FOR [bud].[seq_bud_budget_adjustments]) FOR [budget_adjustment_id]
GO
ALTER TABLE [bud].[bud_budget_plan_details] ADD  CONSTRAINT [DF_bud_BudgetPlanDetail_BudgetPlanID]  DEFAULT (NEXT VALUE FOR [seq_bud_BudgetPlanDetail]) FOR [BudgetPlanDetailID]
GO
ALTER TABLE [bud].[bud_budget_plans] ADD  CONSTRAINT [DF_bud_BudgetPlan_BudgetPlanID]  DEFAULT (NEXT VALUE FOR [seq_bud_BudgetPlan]) FOR [BudgetPlanID]
GO
ALTER TABLE [bud].[bud_budget_request_details] ADD  CONSTRAINT [DF_bud_budget_request_details_budget_request_detail_id]  DEFAULT (NEXT VALUE FOR [bud].[seq_bud_budget_request_details]) FOR [budget_request_detail_id]
GO
ALTER TABLE [bud].[bud_budget_requests] ADD  CONSTRAINT [DF_bud_budget_requests_budget_request_id]  DEFAULT (NEXT VALUE FOR [bud].[seq_bud_budget_requests]) FOR [budget_request_id]
GO
ALTER TABLE [bud].[bud_configs] ADD  CONSTRAINT [DF_bud_config_config_id]  DEFAULT (NEXT VALUE FOR [bud].[seq_bud_Config]) FOR [config_id]
GO
ALTER TABLE [bud].[bud_templates] ADD  CONSTRAINT [DF_bud_Template_TemplateID]  DEFAULT (NEXT VALUE FOR [seq_bud_Template]) FOR [template_id]
GO
ALTER TABLE [dbo].[adm_data_scope_permission] ADD  CONSTRAINT [DF_data_scope_permission_flex_value_id]  DEFAULT (NEXT VALUE FOR [seq_adm_flex_values]) FOR [flex_value_id]
GO
ALTER TABLE [dbo].[adm_flex_hierarchy] ADD  CONSTRAINT [DF_adm_flex_hierarchy_flex_link]  DEFAULT (NEXT VALUE FOR [seq_adm_flex_hierarchy]) FOR [flex_hierarchy_id]
GO
/****** Object:  StoredProcedure [bud].[proc_hold_balance]    Script Date: 10/12/2025 9:25:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 
 --=====================================
 --Hold balance
 --(cut balance amount from balance)
 --phamkhanhhand Oct 04, 2025
-- =============================================
CREATE   PROCEDURE [bud].[proc_hold_balance]

@username nvarchar(256),
@period int, --year
@RequestDetail [bud].[bud_type_check_balance_detail] READONLY   
 
AS
BEGIN 

declare @now datetime = getdate()
 
 

--note that: bud_template block by segment config, mabe sum
--note 2: @RequestDetail segment distinct
--note 3: check is not the same with hold

-------------check balance------------
	begin	
		select c.balance_id, 
		 ISNULL(c.remainning_amount,0)  remainning_amount,
		 ISNULL(c.remainning_amount,0)  - sum(ISNULL(b.amount,0)) AmountLeft,
		 a.notify_type ,
		 a.template_concanate
		 into #tblCalculateBlock --block when the account balance is insufficient
		from bud.bud_templates a
		inner join bud.bud_configs b1 on a.template_id = b1.template_id
		inner join @RequestDetail b on b.segment1= b1.unit_group and b.segment2 = b1.division_group
		 and b.segment5= b1.budget_line
			left join bud.bud_balances c WITH (UPDLOCK, ROWLOCK) --giữ luôn, không cho ai update nữa
				on 
				( (a.segment1_type<>'U' and b.segment1  is null ) or (a.segment1_type='U' and c.segment1 = b.segment1))
				and ((a.segment2_type<>'U' and b.segment2  is null ) or (a.segment2_type='U' and c.segment2 = b.segment2))
				and ((a.segment3_type<>'U' and b.segment3  is null ) or (a.segment3_type='U' and c.segment3 = b.segment3))
				and ((a.segment4_type<>'U' and b.segment4  is null ) or (a.segment4_type='U' and c.segment4 = b.segment4))
				and ((a.segment5_type<>'U' and b.segment5  is null ) or (a.segment5_type='U' and c.segment5 = b.segment5))
				and ((a.segment6_type<>'U' and b.segment6  is null ) or (a.segment6_type='U' and c.segment6 = b.segment6))
				and ((a.segment7_type<>'U' and b.segment7  is null ) or (a.segment7_type='U' and c.segment7 = b.segment7))
				and ((a.segment8_type<>'U' and b.segment8  is null ) or (a.segment8_type='U' and c.segment8 = b.segment8))
				and ((a.segment9_type<>'U' and b.segment9  is null ) or (a.segment9_type='U' and c.segment9 = b.segment9))
				and ((a.segment10_type<>'U' and b.segment10  is null )  or (a.segment10_type='U' and c.segment10 = b.segment10)) 
				and c.period = @period
				group by c.balance_id,c.remainning_amount, a.notify_type,
		 a.template_concanate



		 --if balance_is null => show err not exists balance

		--select *
		--from #tblCalculateBlock
		
		if exists (
			select *
			from #tblCalculateBlock a
			where a.balance_id is null
		)
		or exists (
			select *
			from #tblCalculateBlock a
			where a.notify_type ='B'
			and a.AmountLeft<0
		)
		begin

		
			select IIF( a.balance_id is null, 1,0) IsNotExists,
			 IIF( a.AmountLeft<0  , 'F','P') NotEnough,
			 remainning_amount,
			 template_concanate
			from #tblCalculateBlock a
			where a.notify_type ='B'
			and a.AmountLeft<0 or a.balance_id is null

			 
			return
		end
		 
	end
----------------end check balance------------------


--------------sub balance---------------
 begin

 


		select c.balance_id, 
			b.amount,
			b.segment1,
			b.segment2,
			b.segment3,
			b.segment4,
			b.segment5,
			b.segment6,
			b.segment7,
			b.segment8,
			b.segment9,
			b.segment10,
			b.source_detail_id,
			b.source_header_id
			into #tblDetail
			from bud.bud_templates a
			inner join bud.bud_configs b1 on a.template_id = b1.template_id
			inner join @RequestDetail b on b.segment1= b1.unit_group and b.segment2 = b1.division_group
			 --and b.segment5= b1.segment5
				inner join bud.bud_balances c WITH (UPDLOCK, ROWLOCK) on 
					   (c.segment1 = b.segment1 or (c.segment1 is null and b.segment1 is null))
					  and (c.segment2 = b.segment2 or (c.segment2 is null and b.segment2 is null))
					  and (c.segment3 = b.segment3 or (c.segment3 is null and b.segment3 is null))
					  and (c.segment4 = b.segment4 or (c.segment4 is null and b.segment4 is null))
					  and (c.segment5 = b.segment5 or (c.segment5 is null and b.segment5 is null))
					  and (c.segment6 = b.segment6 or (c.segment6 is null and b.segment6 is null))
					  and (c.segment7 = b.segment7 or (c.segment7 is null and b.segment7 is null))
					  and (c.segment8 = b.segment8 or (c.segment8 is null and b.segment8 is null))
					  and (c.segment9 = b.segment9 or (c.segment9 is null and b.segment9 is null))
					  and (c.segment10 = b.segment10 or (c.segment10 is null and b.segment10 is null))
				 and  c.period = @period

		update b 
		set b.remainning_amount =ISNULL(b.remainning_amount,0)-a.amount,
			b.actual_amount=ISNULL( b.actual_amount,0)-a.amount
			,b.modified_by = @username
			,b.modified_date = @now
		from #tblDetail a 
			inner join bud.bud_balances b on a.balance_id = b.balance_id  
			where b.period = @period


 end

--------------end sub balance---------------

declare @total_amount decimal(20,6)

select @total_amount = sum(a.amount)
from #tblDetail a
 
			declare @header_request_id bigint = (NEXT VALUE FOR [bud].[seq_bud_budget_requests])
			--add request 
			INSERT INTO [bud].[bud_budget_requests]
					   ([budget_request_id]
					   ,[source_type]
					   ,[source_id]
					   ,[source_no]
					   ,[check_result]
					   ,[status]
					   ,[request_type]
					   ,[total_amount],
					   created_by,
					   created_date
				   )
				 VALUES
					   (
					   @header_request_id
					   ,''
					   ,NULL --<source_id, nvarchar(256),>
					   ,NULL --<source_no, nvarchar(256),>
					   ,NULL--<check_result, nvarchar(256),> F-Fail; P-pass
					   ,'H'--status --B: begin, H: holded, R: reverted, C: confirm-complete
					   ,NULL--<request_type, nvarchar(256),>
					   ,@total_amount--<total_amount, decimal(20,6),>
					   ,@username --created_by,
					   ,@now-- created_date
					   )


		   
			INSERT INTO [bud].[bud_budget_request_details]
					   ([budget_request_detail_id]
					   ,[budget_request_id]
					   ,balance_id
					   ,[amount]
					   ,[segment1]
					   ,[segment2]
					   ,[segment3]
					   ,[segment4]
					   ,[segment5]
					   ,[segment6]
					   ,[segment7]
					   ,[segment8]
					   ,[segment9]
					   ,[segment10])
				 select 

				(NEXT VALUE FOR [bud].[seq_bud_budget_request_details]) [budget_request_detail_id]
					   ,@header_request_id [budget_request_id]
					   ,balance_id
					   ,[amount]
					   ,[segment1]
					   ,[segment2]
					   ,[segment3]
					   ,[segment4]
					   ,[segment5]
					   ,[segment6]
					   ,[segment7]
					   ,[segment8]
					   ,[segment9]
					   ,[segment10]

				 from #tblDetail a


--transaction


		INSERT INTO [bud].[bud_transactions]
				   ([ref_type]
				   ,[ref_id]
				   ,[amount]
				   ,[description],
				   created_by,
				   created_date)
			 VALUES
				   (NULL--<ref_type, int,>
				   ,@header_request_id---<ref_id, bigint,>
				   , @total_amount --<amount, decimal(20,6),>
				   , N'hold balance' --<description, nvarchar(1024),>
				   
				   ,@username --created_by,
				   ,@now-- created_date
				   )

 
 select @header_request_id header_request_id
		   
END


GO
/****** Object:  StoredProcedure [bud].[proc_hold_balance_adjustment]    Script Date: 10/12/2025 9:25:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 
 --=====================================
 --Hold balance by adjustment down type row/cắt ngân sách cho type donw của đề nghị điều chỉnh
 --(cut balance amount from balance)
 --phamkhanhhand Oct 11, 2025
-- =============================================
CREATE   PROCEDURE [bud].[proc_hold_balance_adjustment]

@username nvarchar(256),
@adjustment_id bigint
 
AS
BEGIN 

declare @now datetime = getdate(),
@period nvarchar(256), --year
@RequestDetail [bud].[bud_type_check_balance_detail]   
 

 select @period = a.period
 from bud_budget_adjustments a
 where a.budget_adjustment_id = @adjustment_id


 insert into @RequestDetail(
 balance_id,
 amount,
 source_detail_id,
 source_header_id,
 segment1,
 segment2,
 segment3,
 segment4,
 segment5,
 segment6,
 segment7,
 segment8,
 segment9,
 segment10 
 )

 select 
 
 NULL  balance_id,
 case when a.adjustment_type='ADDITION' then -a.amount else a.amount end, --sub because hold
 a.budget_adjustment_detail_id source_detail_id,
 a.budget_adjustment_id source_header_id,
 segment1,
 segment2,
 segment3,
 segment4,
 segment5,
 segment6,
 segment7,
 segment8,
 segment9,
 segment10 
 from bud_budget_adjustment_details a
 where a.budget_adjustment_id = @adjustment_id
 ---and a.change_type =N'DOWN'
 and (  
	 (a.adjustment_type='ADDITION' and a.amount < 0)
	 or (a.adjustment_type='TRANSFER' and a.parent_flag='Y')
 ) 
  

 exec [bud].[proc_hold_balance] @username = @username, @period = @period, @requestDetail = @requestDetail

		   
END
GO
/****** Object:  StoredProcedure [bud].[proc_hold_gap_balance_adjustment]    Script Date: 10/12/2025 9:25:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 
 --=====================================
 --Hold balance by adjustment down type row/cắt ngân sách cho type donw của đề nghị điều chỉnh
 --(cut balance amount from balance)
 --phamkhanhhand Oct 11, 2025
-- =============================================
CREATE   PROCEDURE [bud].[proc_hold_gap_balance_adjustment]

@username nvarchar(256),
@adjustment_id bigint
 
AS
BEGIN 

declare @now datetime = getdate(),
@period nvarchar(256), --year
@RequestDetail [bud].[bud_type_check_balance_detail]   
 

 select @period = a.period
 from bud_budget_adjustments a
 where a.budget_adjustment_id = @adjustment_id


 insert into @RequestDetail(
 balance_id,
 amount,
 source_detail_id,
 source_header_id,
 segment1,
 segment2,
 segment3,
 segment4,
 segment5,
 segment6,
 segment7,
 segment8,
 segment9,
 segment10 
 )

 select 
 
 NULL  balance_id,
 case when a.adjustment_type='ADDITION' then - (a.approved_amount  -a.amount)
 
 --transfer
 else (a.approved_amount-a.amount) end
 
 --chenh lech amount va approved amount
 
 , --sub because hold
 a.budget_adjustment_detail_id source_detail_id,
 a.budget_adjustment_id source_header_id,
 segment1,
 segment2,
 segment3,
 segment4,
 segment5,
 segment6,
 segment7,
 segment8,
 segment9,
 segment10 
 from bud_budget_adjustment_details a
 where a.budget_adjustment_id = @adjustment_id
 ---and a.change_type =N'DOWN'
 and (  
	 (a.adjustment_type='ADDITION' and a.approved_amount < 0 and (a.approved_amount < a.amount))
	 or (a.adjustment_type='TRANSFER' and a.parent_flag='Y' and a.approved_amount> a.amount)
 ) 
  

 exec [bud].[proc_hold_balance] @username = @username, @period = @period, @requestDetail = @requestDetail

		   
END
GO
/****** Object:  StoredProcedure [bud].[proc_revert_balance]    Script Date: 10/12/2025 9:25:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 
 --=====================================
 --revert balance, <> hold
 --phamkhanhhand Oct 05, 2025
-- =============================================
CREATE   PROCEDURE [bud].[proc_revert_balance]

@username nvarchar(256),
@period int, --year
@ListRequestID [dbo].[type_list_bigint] READONLY   
 
AS
BEGIN 
   
	declare @now datetime = getdate()

	 --check status is not allow
	 if exists (
		 select *
		 from bud.bud_budget_requests a
		 inner join @ListRequestID b on a.budget_request_id = b.value
		 where a.status not in (N'H') --status --B: begin, H: holded, R: reverted, C: confirm-complete
	 )
	 begin
		select N'Trang thai khong thoa man'
	 end

	select 
	c.*
	into #tbl_bud_budget_request_details
	from bud.bud_budget_requests a
	inner join @ListRequestID b on a.budget_request_id = b.value
	inner join bud.bud_budget_request_details c on a.budget_request_id = c.budget_request_id
  
	update b  WITH (UPDLOCK, ROWLOCK)
	set b.remainning_amount =ISNULL(b.remainning_amount,0)+ a.amount,
	b.actual_amount=ISNULL( b.actual_amount,0)+ a.amount
	,b.modified_by = @username
	,b.modified_date = @now
	from #tbl_bud_budget_request_details a 
	inner join bud.bud_balances b on a.balance_id = b.balance_id  
	where b.period = @period

	update a
	set a.modified_by = @username,
	a.modified_date = @now,
	a.status = N'R'--status --B: begin, H: holded, R: reverted, C: confirm-complete
	from bud.bud_budget_requests a
	inner join @ListRequestID b on a.budget_request_id = b.value

--transaction


	INSERT INTO [bud].[bud_transaction]
				([ref_type]
				,[ref_id]
				,[amount]
				,[description],
				created_by,
				created_date)
			select 
			NULL--<ref_type, int,>
				,a.budget_request_id---<ref_id, bigint,>
				, a.total_amount --<amount, decimal(20,6),>
				, N'revert balance' --<description, nvarchar(1024),>
				,@username --created_by,
				,@now-- created_date
				 
				 from bud.bud_budget_requests a
		 inner join @ListRequestID b on a.budget_request_id = b.value
  
END
GO
/****** Object:  StoredProcedure [bud].[proc_revert_balance_adjustment]    Script Date: 10/12/2025 9:25:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 
 --=====================================
 --Hold balance by adjustment down type row/cắt ngân sách cho type donw của đề nghị điều chỉnh
 --(cut balance amount from balance)
 --phamkhanhhand Oct 11, 2025
-- =============================================
CREATE   PROCEDURE [bud].[proc_revert_balance_adjustment]

@username nvarchar(256),
@adjustment_id bigint
 
AS
BEGIN 

declare @now datetime = getdate(),
@period nvarchar(256), --year
@ListRequestID [dbo].[type_list_bigint]     
 
 select @period = a.period
 from bud_budget_adjustments a
 where a.budget_adjustment_id = @adjustment_id


 insert into @ListRequestID( value)

 select 
 b.budget_request_id
 from bud_budget_adjustment_details a
 inner join bud_budget_requests b on b.source_id = a.budget_adjustment_detail_id
 where a.budget_adjustment_id = @adjustment_id
 and b.source_type='ADJUSTMENT' 
   
 exec [bud].[proc_revert_balance] @username = @username, @period = @period, @ListRequestID = @ListRequestID

		   
END
GO
/****** Object:  StoredProcedure [dbo].[proc_CheckPermission]    Script Date: 10/12/2025 9:25:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

 --=====================================
 --CheckPermision
 --phamha Nov 16, 2024
-- =============================================
CREATE     PROCEDURE [dbo].[proc_CheckPermission]


@uri nvarchar(1000)
,@username nvarchar(256)
,@list_scope dbo.type_list_string READONLY  -- **TVP bắt buộc phải là READONLY**
 
AS
BEGIN
declare @hasPermission bit = 0



if exists (

	select 1
	from dbo.adm_permissions a
	inner join dbo.adm_employees b on a.employee_id = b.employee_id
	inner join dbo.adm_resources c on a.resource_id = c.resource_id
	inner join dbo.[adm_resource_detail_apis] d on c.resource_id = c.resource_id
	inner join dbo.adm_scopes e on e.scope_id = a.scope_id
	inner join @list_scope f on f.value = e.scope_code
	where b.username = @username
	and d.uri = @uri 

	union all
	select 1
	from dbo.adm_permissions a
	inner join dbo.adm_roles b1  on a.role_id = b1.role_id
	inner join dbo.adm_employee_role b2 on b1.role_id = b2.role_id
	inner join dbo.adm_employees b on b2.employee_id = b.employee_id
	inner join dbo.adm_resources c on a.resource_id = c.resource_id
	inner join dbo.[adm_resource_detail_apis] d on c.resource_id = c.resource_id
	inner join dbo.adm_scopes e on e.scope_id = a.scope_id
	inner join @list_scope f on f.value = e.scope_code
	where b.username = @username
	and d.uri = @uri 

	)
 
	select @hasPermission = cast(1 as bit)


	select @hasPermission
END
GO
/****** Object:  StoredProcedure [dbo].[proc_save_hierarchy_set]    Script Date: 10/12/2025 9:25:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

 --=====================================
 --save link flex value set
 --phamkhanhhand Sep 14, 2025
-- =============================================
CREATE    PROCEDURE [dbo].[proc_save_hierarchy_set]

 @id bigint
,@list_parent dbo.[type_list_bigint] READONLY  -- **TVP bắt buộc phải là READONLY**
,@list_child dbo.[type_list_bigint] READONLY  -- **TVP bắt buộc phải là READONLY**
 
AS
BEGIN 


declare @hierarchy_type int  = 0 --set=0; flexvalue = 1

--remind: validate in BE before: delete not has value child-parent

--delete not exists parent/child

delete a
from [adm_flex_hierarchy] a
left join @list_parent b on b.value = a.[parent_flex_value_set_id]
where a.child_flex_value_set_id = @id
and a.hierarchy_type =@hierarchy_type 
and b.value is null

delete a
from [adm_flex_hierarchy] a
left join @list_child b on b.value = a.child_flex_value_set_id 
where a.[parent_flex_value_set_id]= @id
and a.hierarchy_type =@hierarchy_type 
and b.value is null

--insert if notexists	

--parent
INSERT INTO [dbo].[adm_flex_hierarchy]
           ([flex_hierarchy_id]
           ,[parent_flex_value_set_id]
           ,[child_flex_value_set_id]
           ,[parent_flex_value_id]
           ,[child_flex_value_id]
           ,[child_value]
           ,[parent_value]
           ,[hierarchy_type])

		   select 
		   NEXT VALUE FOR dbo.seq_adm_flex_hierarchy [flex_hierarchy_id]
           , a.value [parent_flex_value_set_id]
           ,@id [child_flex_value_set_id]
           ,NULL [parent_flex_value_id]
           ,NULL [child_flex_value_id]
           ,NULL [child_value]
           ,NULL [parent_value]
           ,@hierarchy_type [hierarchy_type]
		   from @list_parent a
		   left join [adm_flex_hierarchy] b 
				on a.value =b.parent_flex_value_set_id 
				and b.hierarchy_type =@hierarchy_type 
				and b.child_flex_value_set_id = @id
		   where b.flex_hierarchy_id is null
     
	 --child
	 
INSERT INTO [dbo].[adm_flex_hierarchy]
           ([flex_hierarchy_id]
           ,[parent_flex_value_set_id]
           ,[child_flex_value_set_id]
           ,[parent_flex_value_id]
           ,[child_flex_value_id]
           ,[child_value]
           ,[parent_value]
           ,[hierarchy_type])

		   select 
		   NEXT VALUE FOR dbo.seq_adm_flex_hierarchy [flex_hierarchy_id]
           ,@id [parent_flex_value_set_id]
           ,a.value [child_flex_value_set_id]
           ,NULL [parent_flex_value_id]
           ,NULL [child_flex_value_id]
           ,NULL [child_value]
           ,NULL [parent_value]
           ,@hierarchy_type [hierarchy_type] 
		   from @list_child a
		   left join [adm_flex_hierarchy] b 
				on a.value =b.[child_flex_value_set_id] 
				and b.hierarchy_type =@hierarchy_type 
				and b.[parent_flex_value_set_id] = @id

		   where b.flex_hierarchy_id is null
     
	 select 1

END
GO
/****** Object:  StoredProcedure [dbo].[proc_save_hierarchy_value]    Script Date: 10/12/2025 9:25:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

 --=====================================
 --save link flex value
 --note that: flex value set rule flex value link
 --phamkhanhhand Sep 14, 2025
-- =============================================
CREATE    PROCEDURE [dbo].[proc_save_hierarchy_value]
 @id bigint 
,@ref_set_ID bigint
,@list_ref dbo.[type_list_bigint] READONLY  -- **TVP bắt buộc phải là READONLY**
 ,@for int --0: child; 1-parent 
AS
BEGIN 


declare @hierarchy_type int  = 1 --set=0; flexvalue = 1
declare @set_id bigint
declare @flex_value nvarchar(500)

select @set_id = a.flex_value_set_id
	   ,@flex_value = a.flex_value
from adm_flex_values a
where a.flex_value_id = @id

--remind: validate in BE before: delete not has value child-parent

--delete not exists parent/child


--add child link
if (@for=0)
begin


	--delete not ref new child
	delete a
	from [adm_flex_hierarchy] a
	left join @list_ref b on b.value = a.child_flex_value_id 
	where a.parent_flex_value_id = @id
	and a.[parent_flex_value_set_id]= @set_id
	and a.child_flex_value_set_id = @ref_set_ID
	and a.hierarchy_type =@hierarchy_type 
	and b.value is null


	
	INSERT INTO [dbo].[adm_flex_hierarchy]
           ([flex_hierarchy_id]
           ,[parent_flex_value_set_id]
           ,[child_flex_value_set_id]
           ,[parent_flex_value_id]
           ,[child_flex_value_id]
           ,[child_value]
           ,[parent_value]
           ,[hierarchy_type])

		   select 
		    NEXT VALUE FOR dbo.seq_adm_flex_hierarchy [flex_hierarchy_id] 
           ,@set_id [parent_flex_value_set_id]
           ,@ref_set_id  [child_flex_value_set_id]
           ,@id [parent_flex_value_id]
           ,a.value [child_flex_value_id]
           ,c.flex_value [child_value]
           ,@flex_value [parent_value]
           ,@hierarchy_type [hierarchy_type]

		   from @list_ref a
		   left join [adm_flex_hierarchy] b
				on b.hierarchy_type = @hierarchy_type
				  and b.parent_flex_value_set_id = @set_id
				  and b.parent_flex_value_id = @id
				  and b.child_flex_value_set_id	= @ref_set_ID
				  and b.child_flex_value_id = a.value
			inner join adm_flex_values c on a.value = c.flex_value_id
			where b.flex_hierarchy_id is null
			 

end
 

 ---else add for parent
 
else if (@for=1)
begin


	--delete not ref new child
	delete a
	from [adm_flex_hierarchy] a
	left join @list_ref b on b.value = a.parent_flex_value_id 
	where a.child_flex_value_id = @id
	and a.[child_flex_value_set_id]= @set_id
	and a.parent_flex_value_set_id = @ref_set_ID
	and a.hierarchy_type =@hierarchy_type 
	and b.value is null


	
	INSERT INTO [dbo].[adm_flex_hierarchy]
           ([flex_hierarchy_id]
           ,[parent_flex_value_set_id]
           ,[child_flex_value_set_id]
           ,[parent_flex_value_id]
           ,[child_flex_value_id]
           ,[child_value]
           ,[parent_value]
           ,[hierarchy_type])

		   select 
		    NEXT VALUE FOR dbo.seq_adm_flex_hierarchy [flex_hierarchy_id] 
           ,@ref_set_id [parent_flex_value_set_id]
           ,@set_id   [child_flex_value_set_id]
           ,a.value [parent_flex_value_id]
           ,@id [child_flex_value_id]
           ,@flex_value [child_value]
           ,c.flex_value [parent_value]
           ,@hierarchy_type [hierarchy_type]

		   from @list_ref a
		   left join [adm_flex_hierarchy] b
				on b.hierarchy_type = @hierarchy_type
				  and b.child_flex_value_set_id = @set_id
				  and b.child_flex_value_id = @id
				  and b.parent_flex_value_set_id	= @ref_set_ID
				  and b.parent_flex_value_id = a.value
			inner join adm_flex_values c on a.value = c.flex_value_id
			where b.flex_hierarchy_id is null
			 

end
 
     
	 select 1

END
GO
/****** Object:  StoredProcedure [dbo].[proc_save_hierarchy_value_all]    Script Date: 10/12/2025 9:25:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

 
 --=====================================
 --save link flex value
 --note that: flex value set rule flex value link
 --phamkhanhhand Sep 14, 2025
-- =============================================
CREATE    PROCEDURE [dbo].[proc_save_hierarchy_value_all]
 @id bigint 

,@child_set_ID bigint
,@list_child dbo.[type_list_bigint] READONLY  -- **TVP bắt buộc phải là READONLY** 



,@parent_set_ID bigint
,@list_parent dbo.[type_list_bigint] READONLY  -- **TVP bắt buộc phải là READONLY** 


AS
BEGIN 


declare @hierarchy_type int  = 1 --set=0; flexvalue = 1
declare @set_id bigint
declare @flex_value nvarchar(500)

select @set_id = a.flex_value_set_id
	   ,@flex_value = a.flex_value
from adm_flex_values a
where a.flex_value_id = @id

--remind: validate in BE before: delete not has value child-parent

--delete not exists parent/child


--add child link 
begin


	--delete not ref new child
	delete a
	from [adm_flex_hierarchy] a
	left join @list_child b on b.value = a.child_flex_value_id 
	where a.parent_flex_value_id = @id
	and a.[parent_flex_value_set_id]= @set_id
	and a.child_flex_value_set_id = @child_set_ID
	and a.hierarchy_type =@hierarchy_type 
	and b.value is null


	
	INSERT INTO [dbo].[adm_flex_hierarchy]
           ([flex_hierarchy_id]
           ,[parent_flex_value_set_id]
           ,[child_flex_value_set_id]
           ,[parent_flex_value_id]
           ,[child_flex_value_id]
           ,[child_value]
           ,[parent_value]
           ,[hierarchy_type])

		   select 
		    NEXT VALUE FOR dbo.seq_adm_flex_hierarchy [flex_hierarchy_id] 
           ,@set_id [parent_flex_value_set_id]
           ,@child_set_id  [child_flex_value_set_id]
           ,@id [parent_flex_value_id]
           ,a.value [child_flex_value_id]
           ,c.flex_value [child_value]
           ,@flex_value [parent_value]
           ,@hierarchy_type [hierarchy_type]

		   from @list_child a
		   left join [adm_flex_hierarchy] b
				on b.hierarchy_type = @hierarchy_type
				  and b.parent_flex_value_set_id = @set_id
				  and b.parent_flex_value_id = @id
				  and b.child_flex_value_set_id	= @child_set_ID
				  and b.child_flex_value_id = a.value
			inner join adm_flex_values c on a.value = c.flex_value_id
			where b.flex_hierarchy_id is null
			 

end
 

 ---else add for parent 
begin


	--delete not ref new child
	delete a
	from [adm_flex_hierarchy] a
	left join @list_parent b on b.value = a.parent_flex_value_id 
	where a.child_flex_value_id = @id
	and a.[child_flex_value_set_id]= @set_id
	and a.parent_flex_value_set_id = @parent_set_ID
	and a.hierarchy_type =@hierarchy_type 
	and b.value is null


	
	INSERT INTO [dbo].[adm_flex_hierarchy]
           ([flex_hierarchy_id]
           ,[parent_flex_value_set_id]
           ,[child_flex_value_set_id]
           ,[parent_flex_value_id]
           ,[child_flex_value_id]
           ,[child_value]
           ,[parent_value]
           ,[hierarchy_type])

		   select 
		    NEXT VALUE FOR dbo.seq_adm_flex_hierarchy [flex_hierarchy_id] 
           ,@parent_set_id [parent_flex_value_set_id]
           ,@set_id   [child_flex_value_set_id]
           ,a.value [parent_flex_value_id]
           ,@id [child_flex_value_id]
           ,@flex_value [child_value]
           ,c.flex_value [parent_value]
           ,@hierarchy_type [hierarchy_type]

		   from @list_parent a
		   left join [adm_flex_hierarchy] b
				on b.hierarchy_type = @hierarchy_type
				  and b.child_flex_value_set_id = @set_id
				  and b.child_flex_value_id = @id
				  and b.parent_flex_value_set_id	= @parent_set_ID
				  and b.parent_flex_value_id = a.value
			inner join adm_flex_values c on a.value = c.flex_value_id
			where b.flex_hierarchy_id is null
			 

end
 
     
	 select 1

END
GO
/****** Object:  StoredProcedure [dbo].[proc_save_hierarchy_value_all_set]    Script Date: 10/12/2025 9:25:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

     

 --=====================================
 --save link flex value
 --note that: flex value set rule flex value link
 --phamkhanhhand Sep 14, 2025
-- =============================================
CREATE    PROCEDURE [dbo].[proc_save_hierarchy_value_all_set]
 @id bigint  
,@list_child dbo.[type_list_bigint] READONLY  -- **TVP bắt buộc phải là READONLY** 
,@list_parent dbo.[type_list_bigint] READONLY  -- **TVP bắt buộc phải là READONLY** 
AS
BEGIN 


declare @hierarchy_type int  = 1 --set=0; flexvalue = 1
declare @set_id bigint
declare @flex_value nvarchar(500)

select @set_id = a.flex_value_set_id
	   ,@flex_value = a.flex_value
from adm_flex_values a
where a.flex_value_id = @id

--remind: validate in BE before: delete not has value child-parent

--delete not exists parent/child


--add child link 
begin


	--delete not ref new child, for all set
	delete a
	from [adm_flex_hierarchy] a
			--inner join adm_flex_values c on a.child_flex_value_id = c.flex_value_id
	left join @list_child b on b.value = a.child_flex_value_id 
	where a.parent_flex_value_id = @id
	and a.[parent_flex_value_set_id]= @set_id
	--and a.child_flex_value_set_id = c.flex_value_set_id
	and a.hierarchy_type =@hierarchy_type 
	and b.value is null


	
	INSERT INTO [dbo].[adm_flex_hierarchy]
           ([flex_hierarchy_id]
           ,[parent_flex_value_set_id]
           ,[child_flex_value_set_id]
           ,[parent_flex_value_id]
           ,[child_flex_value_id]
           ,[child_value]
           ,[parent_value]
           ,[hierarchy_type])

		   select 
		    NEXT VALUE FOR dbo.seq_adm_flex_hierarchy [flex_hierarchy_id] 
           ,@set_id [parent_flex_value_set_id]
           ,c.flex_value_set_id  [child_flex_value_set_id]
           ,@id [parent_flex_value_id]
           ,a.value [child_flex_value_id]
           ,c.flex_value [child_value]
           ,@flex_value [parent_value]
           ,@hierarchy_type [hierarchy_type]

		   from @list_child a
			inner join adm_flex_values c on a.value = c.flex_value_id
		   left join [adm_flex_hierarchy] b
				on b.hierarchy_type = @hierarchy_type
				  and b.parent_flex_value_set_id = @set_id
				  and b.parent_flex_value_id = @id
				  and b.child_flex_value_set_id	= c.flex_value_set_id
				  and b.child_flex_value_id = a.value
			where b.flex_hierarchy_id is null
			 

end
 

 ---else add for parent 
begin


	--delete not ref new child
	delete a
	from [adm_flex_hierarchy] a
			--inner join adm_flex_values c on a.child_flex_value_id = c.flex_value_id
	left join @list_parent b on b.value = a.parent_flex_value_id 
	where a.child_flex_value_id = @id
	and a.[child_flex_value_set_id]= @set_id
	--and a.parent_flex_value_set_id = c.flex_value_set_id
	and a.hierarchy_type =@hierarchy_type 
	and b.value is null


	
	INSERT INTO [dbo].[adm_flex_hierarchy]
           ([flex_hierarchy_id]
           ,[parent_flex_value_set_id]
           ,[child_flex_value_set_id]
           ,[parent_flex_value_id]
           ,[child_flex_value_id]
           ,[child_value]
           ,[parent_value]
           ,[hierarchy_type])

		   select 
		    NEXT VALUE FOR dbo.seq_adm_flex_hierarchy [flex_hierarchy_id] 
           ,c.flex_value_set_id [parent_flex_value_set_id]
           ,@set_id   [child_flex_value_set_id]
           ,a.value [parent_flex_value_id]
           ,@id [child_flex_value_id]
           ,@flex_value [child_value]
           ,c.flex_value [parent_value]
           ,@hierarchy_type [hierarchy_type]

		   from @list_parent a
			inner join adm_flex_values c on a.value = c.flex_value_id
		   left join [adm_flex_hierarchy] b
				on b.hierarchy_type = @hierarchy_type
				  and b.child_flex_value_set_id = @set_id
				  and b.child_flex_value_id = @id
				  and b.parent_flex_value_set_id	= c.flex_value_set_id
				  and b.parent_flex_value_id = a.value
			where b.flex_hierarchy_id is null
			 

end
 
     
	 select 1

END

GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Tab nào' , @level0type=N'SCHEMA',@level0name=N'bud', @level1type=N'TABLE',@level1name=N'bud_budget_adjustment_details', @level2type=N'COLUMN',@level2name=N'adjustment_type'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'hold, unhold' , @level0type=N'SCHEMA',@level0name=N'bud', @level1type=N'TABLE',@level1name=N'bud_budget_requests', @level2type=N'COLUMN',@level2name=N'request_type'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Budget line' , @level0type=N'SCHEMA',@level0name=N'bud', @level1type=N'TABLE',@level1name=N'bud_configs', @level2type=N'COLUMN',@level2name=N'budget_line'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'C: chặn; CB- Cảnh báo' , @level0type=N'SCHEMA',@level0name=N'bud', @level1type=N'TABLE',@level1name=N'bud_templates', @level2type=N'COLUMN',@level2name=N'notify_type'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Tài khoản check ngân sách' , @level0type=N'SCHEMA',@level0name=N'bud', @level1type=N'TABLE',@level1name=N'bud_templates'
GO
USE [master]
GO
ALTER DATABASE [KH.BudgetManager] SET  READ_WRITE 
GO
