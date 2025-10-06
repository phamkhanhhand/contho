GO
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
/****** Object:  User [bud_user]    Script Date: 10/6/2025 11:12:42 PM ******/
CREATE USER [bud_user] FOR LOGIN [bud_user] WITH DEFAULT_SCHEMA=[bud]
GO
/****** Object:  Schema [bud]    Script Date: 10/6/2025 11:12:42 PM ******/
CREATE SCHEMA [bud]
GO
USE [KH.BudgetManager]
GO
/****** Object:  Sequence [bud].[seq_bud_AccountingProposal]    Script Date: 10/6/2025 11:12:42 PM ******/
CREATE SEQUENCE [bud].[seq_bud_AccountingProposal] 
 AS [bigint]
 START WITH 1
 INCREMENT BY 1
 MINVALUE -9223372036854775808
 MAXVALUE 9223372036854775807
 CACHE 
GO
USE [KH.BudgetManager]
GO
/****** Object:  Sequence [bud].[seq_bud_AccountingProposalDetail]    Script Date: 10/6/2025 11:12:42 PM ******/
CREATE SEQUENCE [bud].[seq_bud_AccountingProposalDetail] 
 AS [bigint]
 START WITH 1
 INCREMENT BY 1
 MINVALUE -9223372036854775808
 MAXVALUE 9223372036854775807
 CACHE 
GO
USE [KH.BudgetManager]
GO
/****** Object:  Sequence [bud].[seq_bud_AccountingProposalHistory]    Script Date: 10/6/2025 11:12:42 PM ******/
CREATE SEQUENCE [bud].[seq_bud_AccountingProposalHistory] 
 AS [bigint]
 START WITH -9223372036854775808
 INCREMENT BY 1
 MINVALUE -9223372036854775808
 MAXVALUE 9223372036854775807
 CACHE 
GO
USE [KH.BudgetManager]
GO
/****** Object:  Sequence [bud].[seq_bud_Balancing]    Script Date: 10/6/2025 11:12:42 PM ******/
CREATE SEQUENCE [bud].[seq_bud_Balancing] 
 AS [bigint]
 START WITH 1
 INCREMENT BY 1
 MINVALUE -9223372036854775808
 MAXVALUE 9223372036854775807
 CACHE 
GO
USE [KH.BudgetManager]
GO
/****** Object:  Sequence [bud].[seq_bud_budget_request_details]    Script Date: 10/6/2025 11:12:42 PM ******/
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
/****** Object:  Sequence [bud].[seq_bud_budget_requests]    Script Date: 10/6/2025 11:12:42 PM ******/
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
/****** Object:  Sequence [bud].[seq_bud_BudgetPlan]    Script Date: 10/6/2025 11:12:42 PM ******/
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
/****** Object:  Sequence [bud].[seq_bud_BudgetPlanDetail]    Script Date: 10/6/2025 11:12:42 PM ******/
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
/****** Object:  Sequence [bud].[seq_bud_Config]    Script Date: 10/6/2025 11:12:42 PM ******/
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
/****** Object:  Sequence [bud].[seq_bud_FlexHierarchy]    Script Date: 10/6/2025 11:12:42 PM ******/
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
/****** Object:  Sequence [bud].[seq_bud_flexValues]    Script Date: 10/6/2025 11:12:42 PM ******/
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
/****** Object:  Sequence [bud].[Seq_bud_FlexValueSets]    Script Date: 10/6/2025 11:12:42 PM ******/
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
/****** Object:  Sequence [bud].[seq_bud_Template]    Script Date: 10/6/2025 11:12:42 PM ******/
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
/****** Object:  Sequence [dbo].[seq_adm_flex_hierarchy]    Script Date: 10/6/2025 11:12:42 PM ******/
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
/****** Object:  Sequence [dbo].[Seq_adm_flex_value_sets]    Script Date: 10/6/2025 11:12:42 PM ******/
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
/****** Object:  Sequence [dbo].[seq_adm_flex_values]    Script Date: 10/6/2025 11:12:42 PM ******/
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
/****** Object:  Sequence [dbo].[seq_bud_balance]    Script Date: 10/6/2025 11:12:42 PM ******/
CREATE SEQUENCE [dbo].[seq_bud_balance] 
 AS [bigint]
 START WITH 1
 INCREMENT BY 1
 MINVALUE -9223372036854775808
 MAXVALUE 9223372036854775807
 CACHE 
GO
/****** Object:  UserDefinedTableType [bud].[bud_type_check_balance_detail]    Script Date: 10/6/2025 11:12:42 PM ******/
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
/****** Object:  UserDefinedTableType [dbo].[type_list_bigint]    Script Date: 10/6/2025 11:12:42 PM ******/
CREATE TYPE [dbo].[type_list_bigint] AS TABLE(
	[value] [bigint] NULL
)
GO
/****** Object:  Synonym [bud].[Employee]    Script Date: 10/6/2025 11:12:42 PM ******/
CREATE SYNONYM [bud].[Employee] FOR [KH.BudgetManager].[dbo].[Employee]
GO
/****** Object:  Table [bud].[bud_config]    Script Date: 10/6/2025 11:12:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [bud].[bud_config](
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
/****** Object:  Table [bud].[bud_template]    Script Date: 10/6/2025 11:12:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [bud].[bud_template](
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
/****** Object:  View [bud].[coa_v]    Script Date: 10/6/2025 11:12:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


/*
* Lấy cấu hình check ngân sách
*/
CREATE   VIEW [bud].[coa_v]
AS


select a.Segment1, a.Segment2, a.Segment5,
b.*
from bud.bud_Config a
inner join bud.bud_Template b on a.TemplateID = b.TemplateID





GO
/****** Object:  Table [dbo].[adm_flex_value_sets]    Script Date: 10/6/2025 11:12:43 PM ******/
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
	[created_by] [nvarchar](256) NULL,
	[created_date] [datetime] NULL,
	[modified_by] [nvarchar](256) NULL,
	[modified_date] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[adm_flex_hierarchy]    Script Date: 10/6/2025 11:12:43 PM ******/
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
/****** Object:  UserDefinedFunction [bud].[func_config_segment]    Script Date: 10/6/2025 11:12:43 PM ******/
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
	 
	from bud.bud_config a
	inner join bud.bud_template b on a.template_id = b.template_id
	
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
/****** Object:  Table [bud].[bud_AccountingProposal]    Script Date: 10/6/2025 11:12:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [bud].[bud_AccountingProposal](
	[AccountingProposalID] [bigint] NULL,
	[AccountingProposalNo] [nvarchar](256) NULL,
	[BudgetGroup] [nvarchar](256) NULL,
	[Period] [nvarchar](256) NULL,
	[Status] [nvarchar](256) NULL,
	[ApprovalUser] [nvarchar](256) NULL,
	[TotalAmount] [decimal](20, 6) NULL,
	[ApprovalTotalAmount] [decimal](20, 6) NULL,
	[created_by] [nvarchar](256) NULL,
	[created_date] [datetime] NULL,
	[modified_by] [nvarchar](256) NULL,
	[modified_date] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [bud].[bud_AccountingProposalDetail]    Script Date: 10/6/2025 11:12:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [bud].[bud_AccountingProposalDetail](
	[AccountingProposalDetailID] [bigint] NULL,
	[AccountingProposalID] [bigint] NULL,
	[ParentID] [nvarchar](256) NULL,
	[ParentFlag] [nvarchar](256) NULL,
	[RequisitionType] [nvarchar](256) NULL,
	[Amount] [decimal](20, 6) NULL,
	[ApprovalAmount] [decimal](20, 6) NULL,
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
	[Description] [nvarchar](256) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [bud].[bud_AccountingProposalHistory]    Script Date: 10/6/2025 11:12:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [bud].[bud_AccountingProposalHistory](
	[AccountingProposalHistoryID] [bigint] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [bud].[bud_balances]    Script Date: 10/6/2025 11:12:43 PM ******/
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
/****** Object:  Table [bud].[bud_budget_plan]    Script Date: 10/6/2025 11:12:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [bud].[bud_budget_plan](
	[BudgetPlanID] [bigint] NULL,
	[Period] [nvarchar](10) NULL,
	[Status] [nvarchar](256) NULL,
	[created_by] [nvarchar](256) NULL,
	[created_date] [datetime] NULL,
	[modified_by] [nvarchar](256) NULL,
	[modified_date] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [bud].[bud_budget_plan_detail]    Script Date: 10/6/2025 11:12:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [bud].[bud_budget_plan_detail](
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
/****** Object:  Table [bud].[bud_budget_request_details]    Script Date: 10/6/2025 11:12:43 PM ******/
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
/****** Object:  Table [bud].[bud_budget_requests]    Script Date: 10/6/2025 11:12:43 PM ******/
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
/****** Object:  Table [bud].[bud_FlexHierarchy]    Script Date: 10/6/2025 11:12:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [bud].[bud_FlexHierarchy](
	[bud_FlexHierarchyID] [bigint] NOT NULL,
	[ChildValue] [nvarchar](500) NULL,
	[ParentValue] [nvarchar](500) NULL,
	[HierarchyType] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [bud].[bud_FlexValues]    Script Date: 10/6/2025 11:12:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [bud].[bud_FlexValues](
	[FlexValueID] [bigint] NOT NULL,
	[FlexValue] [nvarchar](500) NULL,
	[FlexValueName] [nvarchar](500) NULL,
	[Description] [nvarchar](500) NULL,
	[FlexValueSetID] [bigint] NULL,
	[created_by] [nvarchar](256) NULL,
	[created_date] [datetime] NULL,
	[modified_by] [nvarchar](256) NULL,
	[modified_date] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [bud].[bud_FlexValueSets]    Script Date: 10/6/2025 11:12:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [bud].[bud_FlexValueSets](
	[FlexValueSetID] [bigint] NOT NULL,
	[FlexValueSetName] [nvarchar](500) NULL,
	[Description] [nvarchar](500) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [bud].[bud_transaction]    Script Date: 10/6/2025 11:12:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [bud].[bud_transaction](
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
/****** Object:  Table [dbo].[adm_flex_values]    Script Date: 10/6/2025 11:12:43 PM ******/
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
	[description] [nvarchar](500) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[bud_AdjustmentProposal]    Script Date: 10/6/2025 11:12:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[bud_AdjustmentProposal](
	[AdjustmentProposalID] [bigint] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Employee]    Script Date: 10/6/2025 11:12:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employee](
	[EmployeeID] [bigint] NULL,
	[EmployeeCode] [nvarchar](256) NULL,
	[Fullname] [nvarchar](256) NULL,
	[Username] [nvarchar](256) NULL
) ON [PRIMARY]
GO
ALTER TABLE [bud].[bud_budget_plan] ADD  CONSTRAINT [DF_bud_BudgetPlan_BudgetPlanID]  DEFAULT (NEXT VALUE FOR [seq_bud_BudgetPlan]) FOR [BudgetPlanID]
GO
ALTER TABLE [bud].[bud_budget_plan_detail] ADD  CONSTRAINT [DF_bud_BudgetPlanDetail_BudgetPlanID]  DEFAULT (NEXT VALUE FOR [seq_bud_BudgetPlanDetail]) FOR [BudgetPlanDetailID]
GO
ALTER TABLE [bud].[bud_budget_request_details] ADD  CONSTRAINT [DF_bud_budget_request_details_budget_request_detail_id]  DEFAULT (NEXT VALUE FOR [bud].[seq_bud_budget_request_details]) FOR [budget_request_detail_id]
GO
ALTER TABLE [bud].[bud_budget_requests] ADD  CONSTRAINT [DF_bud_budget_requests_budget_request_id]  DEFAULT (NEXT VALUE FOR [bud].[seq_bud_budget_requests]) FOR [budget_request_id]
GO
ALTER TABLE [bud].[bud_config] ADD  CONSTRAINT [DF_bud_config_config_id]  DEFAULT (NEXT VALUE FOR [bud].[seq_bud_Config]) FOR [config_id]
GO
ALTER TABLE [bud].[bud_FlexHierarchy] ADD  CONSTRAINT [DF_bud_FlexHierarchy_FlexLink]  DEFAULT (NEXT VALUE FOR [seq_bud_FlexHierarchy]) FOR [bud_FlexHierarchyID]
GO
ALTER TABLE [bud].[bud_FlexValues] ADD  CONSTRAINT [DF_bud_FlexValues_FlexValueID_1]  DEFAULT (NEXT VALUE FOR [seq_bud_flexValues]) FOR [FlexValueID]
GO
ALTER TABLE [bud].[bud_FlexValueSets] ADD  CONSTRAINT [DF_bud_FlexValueSets_FlexValueSetID]  DEFAULT (NEXT VALUE FOR [seq_bud_FlexValueSets]) FOR [FlexValueSetID]
GO
ALTER TABLE [bud].[bud_template] ADD  CONSTRAINT [DF_bud_Template_TemplateID]  DEFAULT (NEXT VALUE FOR [seq_bud_Template]) FOR [template_id]
GO
ALTER TABLE [dbo].[adm_flex_hierarchy] ADD  CONSTRAINT [DF_adm_flex_hierarchy_flex_link]  DEFAULT (NEXT VALUE FOR [seq_adm_flex_hierarchy]) FOR [flex_hierarchy_id]
GO
ALTER TABLE [dbo].[adm_flex_value_sets] ADD  CONSTRAINT [DF_adm_flex_value_sets_flex_value_set_id]  DEFAULT (NEXT VALUE FOR [seq_adm_flex_value_sets]) FOR [flex_value_set_id]
GO
ALTER TABLE [dbo].[adm_flex_values] ADD  CONSTRAINT [DF_adm_flex_values_flex_value_id]  DEFAULT (NEXT VALUE FOR [seq_adm_flex_values]) FOR [flex_value_id]
GO
/****** Object:  StoredProcedure [bud].[proc_hold_balance]    Script Date: 10/6/2025 11:12:43 PM ******/
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

--declare @request_head table  
--(
--status nvarchar(256)
--, total_amount decimal(20,6)
--)

 

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
		from bud.bud_template a
		inner join bud.bud_config b1 on a.template_id = b1.template_id
		inner join @RequestDetail b on b.segment1= b1.unit_group and b.segment2 = b1.division_group
		 --and b.segment5= b1.segment5
			left join bud.bud_balances c WITH (UPDLOCK, ROWLOCK) --giữ luôn, không cho ai update nữa
				on 
				(a.segment1_type<>'U' or (a.segment1_type='U' and c.segment1 = b.segment1))
				and (a.segment2_type<>'U' or (a.segment2_type='U' and c.segment2 = b.segment2))
				and (a.segment3_type<>'U' or (a.segment3_type='U' and c.segment3 = b.segment3))
				and (a.segment4_type<>'U' or (a.segment4_type='U' and c.segment4 = b.segment4))
				and (a.segment5_type<>'U' or (a.segment5_type='U' and c.segment5 = b.segment5))
				and (a.segment6_type<>'U' or (a.segment6_type='U' and c.segment6 = b.segment6))
				and (a.segment7_type<>'U' or (a.segment7_type='U' and c.segment7 = b.segment7))
				and (a.segment8_type<>'U' or (a.segment8_type='U' and c.segment8 = b.segment8))
				and (a.segment9_type<>'U' or (a.segment9_type='U' and c.segment9 = b.segment9))
				and (a.segment10_type<>'U' or (a.segment10_type='U' and c.segment10 = b.segment10)) 
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
			from bud.bud_template a
			inner join bud.bud_config b1 on a.template_id = b1.template_id
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


		INSERT INTO [bud].[bud_transaction]
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
/****** Object:  StoredProcedure [bud].[proc_hold_balance_test]    Script Date: 10/6/2025 11:12:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 
 --=====================================
 --Hold balance
 --(cut balance amount from balance)
 --phamkhanhhand Oct 04, 2025
-- =============================================
CREATE   PROCEDURE [bud].[proc_hold_balance_test]

@username nvarchar(256),
@period int, --year
@RequestDetail [bud].[bud_type_check_balance_detail] READONLY   
 
AS
BEGIN 

declare @now datetime = getdate()


update a
set a.actual_amount = a.actual_amount+1
from bud.bud_balances a WITH (ROWLOCK)
where a.balance_id = 1

WAITFOR DELAY '00:00:20';  -- Chờ 20 giây


return

--declare @request_head table  
--(
--status nvarchar(256)
--, total_amount decimal(20,6)
--)

 

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
		from bud.bud_template a
		inner join bud.bud_config b1 on a.template_id = b1.template_id
		inner join @RequestDetail b on b.segment1= b1.unit_group and b.segment2 = b1.division_group
		 --and b.segment5= b1.segment5
			left join bud.bud_balances c WITH (UPDLOCK, ROWLOCK) on 
				(a.segment1_type<>'U' or (a.segment1_type='U' and c.segment1 = b.segment1))
				and (a.segment2_type<>'U' or (a.segment2_type='U' and c.segment2 = b.segment2))
				and (a.segment3_type<>'U' or (a.segment3_type='U' and c.segment3 = b.segment3))
				and (a.segment4_type<>'U' or (a.segment4_type='U' and c.segment4 = b.segment4))
				and (a.segment5_type<>'U' or (a.segment5_type='U' and c.segment5 = b.segment5))
				and (a.segment6_type<>'U' or (a.segment6_type='U' and c.segment6 = b.segment6))
				and (a.segment7_type<>'U' or (a.segment7_type='U' and c.segment7 = b.segment7))
				and (a.segment8_type<>'U' or (a.segment8_type='U' and c.segment8 = b.segment8))
				and (a.segment9_type<>'U' or (a.segment9_type='U' and c.segment9 = b.segment9))
				and (a.segment10_type<>'U' or (a.segment10_type='U' and c.segment10 = b.segment10)) 
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
			from bud.bud_template a
			inner join bud.bud_config b1 on a.template_id = b1.template_id
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


		INSERT INTO [bud].[bud_transaction]
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
/****** Object:  StoredProcedure [bud].[proc_revert_balance]    Script Date: 10/6/2025 11:12:43 PM ******/
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
/****** Object:  StoredProcedure [bud].[proc_revert_balance_test]    Script Date: 10/6/2025 11:12:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 
 --=====================================
 --revert balance, <> hold
 --phamkhanhhand Oct 05, 2025
-- =============================================
CREATE   PROCEDURE [bud].[proc_revert_balance_test]

@username nvarchar(256),
@period int, --year
@ListRequestID [dbo].[type_list_bigint] READONLY   
 
AS
BEGIN 


  SET LOCK_TIMEOUT 1000
 update c set c.amount =40000
	from   bud.bud_budget_request_details c  --     
  where c.budget_request_id in (1,19)

  
   

WAITFOR DELAY '00:00:30'  -- chờ 5 giây

  select c.amount
	from   bud.bud_budget_request_details c   --    
  where c.budget_request_id in (1,19)


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
  
	update b  
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
/****** Object:  StoredProcedure [dbo].[proc_hold_balance]    Script Date: 10/6/2025 11:12:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 
 --=====================================
 --Hold balance
 --(cut balance amount from balance)
 --phamkhanhhand Oct 04, 2025
-- =============================================
CREATE   PROCEDURE [dbo].[proc_hold_balance]

@username nvarchar(256),
@period int, --year
@RequestDetail [bud].[bud_type_check_balance_detail] READONLY   
 
AS
BEGIN 

declare @now datetime = getdate()

--declare @request_head table  
--(
--status nvarchar(256)
--, total_amount decimal(20,6)
--)

 

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
		from bud.bud_template a
		inner join bud.bud_config b1 on a.template_id = b1.template_id
		inner join @RequestDetail b on b.segment1= b1.unit and b.segment2 = b1.division
		 --and b.segment5= b1.segment5
			left join bud.bud_balances c on 
				(a.segment1_type<>'U' or (a.segment1_type='U' and c.segment1 = b.segment1))
				and (a.segment2_type<>'U' or (a.segment2_type='U' and c.segment2 = b.segment2))
				and (a.segment3_type<>'U' or (a.segment3_type='U' and c.segment3 = b.segment3))
				and (a.segment4_type<>'U' or (a.segment4_type='U' and c.segment4 = b.segment4))
				and (a.segment5_type<>'U' or (a.segment5_type='U' and c.segment5 = b.segment5))
				and (a.segment6_type<>'U' or (a.segment6_type='U' and c.segment6 = b.segment6))
				and (a.segment7_type<>'U' or (a.segment7_type='U' and c.segment7 = b.segment7))
				and (a.segment8_type<>'U' or (a.segment8_type='U' and c.segment8 = b.segment8))
				and (a.segment9_type<>'U' or (a.segment9_type='U' and c.segment9 = b.segment9))
				and (a.segment10_type<>'U' or (a.segment10_type='U' and c.segment10 = b.segment10)) 
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
			from bud.bud_template a
			inner join bud.bud_config b1 on a.template_id = b1.template_id
			inner join @RequestDetail b on b.segment1= b1.unit and b.segment2 = b1.division
			 --and b.segment5= b1.segment5
				inner join bud.bud_balances c on 
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


		INSERT INTO [bud].[bud_transaction]
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
/****** Object:  StoredProcedure [dbo].[proc_revert_balance]    Script Date: 10/6/2025 11:12:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 
 --=====================================
 --revert balance, <> hold
 --phamkhanhhand Oct 05, 2025
-- =============================================
CREATE   PROCEDURE [dbo].[proc_revert_balance]

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
  
	update b 
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
/****** Object:  StoredProcedure [dbo].[proc_save_hierarchy_set]    Script Date: 10/6/2025 11:12:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

 --=====================================
 --CheckPermision
 --phamkhanhhand Sep 14, 2025
-- =============================================
CREATE PROCEDURE [dbo].[proc_save_hierarchy_set]

 @id bigint
,@list_parent dbo.[type_list_bigint] READONLY  -- **TVP bắt buộc phải là READONLY**
,@list_child dbo.[type_list_bigint] READONLY  -- **TVP bắt buộc phải là READONLY**
 
AS
BEGIN 


declare @hierarchy_type int  = 0 --set=0; flexvalue = 1

--remind: validate in BE before

--delete not exists parent/child

delete a
from [adm_flex_hierarchy] a
left join @list_parent b on b.value = a.[parent_flex_value_set_id]
where a.child_flex_value_set_id = @id
and b.value is null

delete a
from [adm_flex_hierarchy] a
left join @list_child b on b.value = a.child_flex_value_set_id 
where a.[parent_flex_value_set_id]= @id
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
     

END
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Tab nào' , @level0type=N'SCHEMA',@level0name=N'bud', @level1type=N'TABLE',@level1name=N'bud_AccountingProposalDetail', @level2type=N'COLUMN',@level2name=N'RequisitionType'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'hold, unhold' , @level0type=N'SCHEMA',@level0name=N'bud', @level1type=N'TABLE',@level1name=N'bud_budget_requests', @level2type=N'COLUMN',@level2name=N'request_type'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Budget line' , @level0type=N'SCHEMA',@level0name=N'bud', @level1type=N'TABLE',@level1name=N'bud_config', @level2type=N'COLUMN',@level2name=N'budget_line'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'0: set ; 1-value' , @level0type=N'SCHEMA',@level0name=N'bud', @level1type=N'TABLE',@level1name=N'bud_FlexHierarchy', @level2type=N'COLUMN',@level2name=N'HierarchyType'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'C: chặn; CB- Cảnh báo' , @level0type=N'SCHEMA',@level0name=N'bud', @level1type=N'TABLE',@level1name=N'bud_template', @level2type=N'COLUMN',@level2name=N'notify_type'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Tài khoản check ngân sách' , @level0type=N'SCHEMA',@level0name=N'bud', @level1type=N'TABLE',@level1name=N'bud_template'
GO
USE [master]
GO
ALTER DATABASE [KH.BudgetManager] SET  READ_WRITE 
GO
