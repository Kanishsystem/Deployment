-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: bkc00oow4so4oc004g4s4o08
-- Generation Time: Aug 06, 2025 at 07:17 AM
-- Server version: 11.6.2-MariaDB-ubu2404
-- PHP Version: 8.3.15

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `hdt_hrms`
--
CREATE DATABASE IF NOT EXISTS `hdt_hrms` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_uca1400_ai_ci;
USE `hdt_hrms`;

-- --------------------------------------------------------

--
-- Table structure for table `sd_admin_api`
--

CREATE TABLE `sd_admin_api` (
  `ID` int(11) NOT NULL,
  `request_type` varchar(10) NOT NULL,
  `api_path` varchar(255) NOT NULL,
  `groups` varchar(1000) DEFAULT NULL,
  `controller_name` varchar(50) NOT NULL,
  `function_name` varchar(50) NOT NULL,
  `last_modified_time` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf16 COLLATE=utf16_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sd_admin_assets`
--

CREATE TABLE `sd_admin_assets` (
  `ID` int(11) NOT NULL,
  `asset_type` varchar(255) NOT NULL,
  `asset_name` varchar(1000) NOT NULL,
  `asset_number` varchar(255) NOT NULL,
  `asset_details` text DEFAULT NULL,
  `assert_return` longtext NOT NULL,
  `asset_condition` varchar(50) DEFAULT NULL,
  `created_by` int(11) NOT NULL DEFAULT 0,
  `status` int(11) NOT NULL DEFAULT 0,
  `last_modified_time` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sd_admin_banks`
--

CREATE TABLE `sd_admin_banks` (
  `ID` int(11) NOT NULL,
  `bank_name` varchar(255) NOT NULL,
  `bank_type` enum('Public Sector Bank','Private Sector Bank','Regional Rural Bank','Small Finance Bank','Local Area Bank','Foreign Bank') NOT NULL,
  `head_office` varchar(255) NOT NULL,
  `website_link` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sd_admin_calander_dates`
--

CREATE TABLE `sd_admin_calander_dates` (
  `ID` int(11) NOT NULL,
  `calendar_date` date NOT NULL,
  `day_of_week` varchar(10) DEFAULT NULL,
  `is_weekend` tinyint(1) DEFAULT NULL,
  `is_holiday` tinyint(1) DEFAULT NULL,
  `holiday_name` varchar(255) DEFAULT NULL,
  `fiscal_year` varchar(10) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sd_admin_const`
--

CREATE TABLE `sd_admin_const` (
  `ID` int(11) NOT NULL,
  `type` varchar(10) NOT NULL,
  `value` varchar(255) NOT NULL,
  `label` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sd_admin_employees_types`
--

CREATE TABLE `sd_admin_employees_types` (
  `ID` int(11) NOT NULL,
  `type` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `tag` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sd_admin_mail`
--

CREATE TABLE `sd_admin_mail` (
  `ID` int(11) NOT NULL,
  `mail_name` varchar(255) NOT NULL,
  `mail_subject` text NOT NULL,
  `mail_msg` longtext NOT NULL,
  `last_modified_by` int(11) NOT NULL,
  `last_modified_time` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sd_admin_menu`
--

CREATE TABLE `sd_admin_menu` (
  `ID` int(11) NOT NULL,
  `label` varchar(50) NOT NULL,
  `icon` varchar(50) NOT NULL,
  `link` varchar(150) NOT NULL,
  `roles` varchar(255) NOT NULL,
  `order_number` int(11) NOT NULL DEFAULT 0,
  `parent_id` int(11) NOT NULL DEFAULT 0,
  `created_by` int(11) NOT NULL,
  `last_modified_time` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `sd_admin_modules_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sd_admin_modules`
--

CREATE TABLE `sd_admin_modules` (
  `ID` int(11) NOT NULL,
  `module_name` varchar(255) NOT NULL,
  `status` int(11) NOT NULL DEFAULT 5
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sd_admin_module_permissions`
--

CREATE TABLE `sd_admin_module_permissions` (
  `ID` int(20) UNSIGNED NOT NULL,
  `module_id` int(11) DEFAULT NULL,
  `action` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sd_admin_role_permissions`
--

CREATE TABLE `sd_admin_role_permissions` (
  `ID` bigint(20) UNSIGNED NOT NULL,
  `role_id` int(11) DEFAULT NULL,
  `permission_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sd_advance`
--

CREATE TABLE `sd_advance` (
  `ID` int(11) NOT NULL,
  `sd_employees_id` int(11) NOT NULL COMMENT 'advance created for',
  `accounts_ref_number` varchar(255) DEFAULT NULL,
  `advance_purpose` text NOT NULL,
  `advance_amount` float NOT NULL,
  `advance_for` int(11) NOT NULL DEFAULT 1 COMMENT '1=>SELF, 2=>TEAM Member',
  `credit_to` int(11) NOT NULL DEFAULT 0,
  `credit_status` int(11) NOT NULL DEFAULT 1 COMMENT '1=>Yet to credit, 2=>Credit',
  `created_by` int(11) NOT NULL,
  `created_time` timestamp NOT NULL DEFAULT current_timestamp(),
  `approved_by` int(11) DEFAULT 0,
  `approved_time` timestamp NULL DEFAULT current_timestamp(),
  `last_modified_by` int(11) NOT NULL DEFAULT 0,
  `last_modified_time` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `accounts_id` int(11) NOT NULL DEFAULT 0,
  `accounts_time` timestamp NULL DEFAULT current_timestamp(),
  `accounts_amount` float NOT NULL DEFAULT 0,
  `accounts_credit_status` int(11) NOT NULL DEFAULT 1 COMMENT '1= Credited to account, 2=>include in pay slip',
  `status` int(11) NOT NULL DEFAULT 5,
  `approved_remarks` text DEFAULT NULL,
  `accounts_remarks` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sd_attendance`
--

CREATE TABLE `sd_attendance` (
  `ID` int(11) NOT NULL,
  `sd_employees_id` int(11) NOT NULL,
  `date` date NOT NULL DEFAULT current_timestamp(),
  `check_in_time` time DEFAULT NULL,
  `check_out_time` time DEFAULT NULL,
  `add_indication` int(11) NOT NULL DEFAULT 1 COMMENT '1=Present, 2= Absent 3=Leave',
  `location` text DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT 1,
  `mode` enum('APP','EXCEL','IOT') DEFAULT NULL,
  `created_by` int(11) NOT NULL DEFAULT 0,
  `created_time` timestamp NULL DEFAULT current_timestamp(),
  `last_modified_time` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `adv_leave_type_id` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sd_bill_claims`
--

CREATE TABLE `sd_bill_claims` (
  `ID` int(11) NOT NULL,
  `sd_employees_id` int(11) NOT NULL,
  `bill_cat` varchar(255) NOT NULL,
  `bill_title` varchar(1000) DEFAULT NULL,
  `bill_ref_number` varchar(255) DEFAULT NULL,
  `claim_amount` decimal(10,2) NOT NULL,
  `claim_date` date NOT NULL,
  `bill_file` longtext DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT 5,
  `created_by` int(11) DEFAULT 0,
  `created_time` timestamp NOT NULL DEFAULT current_timestamp(),
  `approved_date` date DEFAULT NULL,
  `approved_by` int(11) NOT NULL DEFAULT 0,
  `app_remarks` text DEFAULT NULL,
  `credited_by` int(11) NOT NULL DEFAULT 0,
  `credit_status` int(11) NOT NULL DEFAULT 0,
  `credited_date` date DEFAULT NULL,
  `credit_amount` float NOT NULL DEFAULT 0,
  `credit_details` varchar(255) DEFAULT NULL,
  `last_modified_time` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sd_bill_claims_items`
--

CREATE TABLE `sd_bill_claims_items` (
  `ID` int(11) NOT NULL,
  `sd_bill_claims_id` int(11) NOT NULL,
  `item_desc` varchar(255) NOT NULL,
  `item_date` date DEFAULT NULL,
  `item_amount` float NOT NULL,
  `upload_file` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sd_circulars`
--

CREATE TABLE `sd_circulars` (
  `ID` int(11) NOT NULL,
  `circular_type` varchar(50) NOT NULL,
  `circular_title` text NOT NULL,
  `circular_file` longtext NOT NULL,
  `created_by` int(11) NOT NULL,
  `last_modified_time` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `status` int(11) NOT NULL DEFAULT 5,
  `created_time` timestamp NOT NULL DEFAULT current_timestamp(),
  `last_modified_by` int(11) NOT NULL DEFAULT 0,
  `circular_image` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf16 COLLATE=utf16_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sd_designations`
--

CREATE TABLE `sd_designations` (
  `ID` int(11) NOT NULL,
  `designation_name` varchar(50) NOT NULL,
  `base_salary` decimal(10,2) NOT NULL,
  `created_time` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sd_doc_check_list`
--

CREATE TABLE `sd_doc_check_list` (
  `ID` int(11) NOT NULL,
  `doc_name` varchar(255) NOT NULL,
  `doc_types` text DEFAULT NULL,
  `is_required` int(11) NOT NULL,
  `created_time` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sd_employees`
--

CREATE TABLE `sd_employees` (
  `ID` int(11) NOT NULL,
  `emp_type` int(11) DEFAULT NULL,
  `employee_id` varchar(50) NOT NULL,
  `epassword` varchar(255) DEFAULT NULL,
  `ename` varchar(255) DEFAULT NULL,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `sd_designations_id` int(11) NOT NULL,
  `email` varchar(100) DEFAULT NULL,
  `phone` longtext DEFAULT NULL,
  `emp_dob` date DEFAULT NULL,
  `joining_date` date DEFAULT NULL,
  `having_login` int(11) NOT NULL DEFAULT 5,
  `attendance_app` int(11) NOT NULL DEFAULT 5,
  `active_status` int(11) DEFAULT 5,
  `profile_img` longtext DEFAULT NULL,
  `last_login_time` datetime DEFAULT NULL,
  `last_login_ip` varchar(255) DEFAULT NULL,
  `last_reset_time` datetime DEFAULT NULL,
  `change_pass` int(11) NOT NULL DEFAULT 1,
  `created_by` int(11) DEFAULT 0,
  `created_time` timestamp NULL DEFAULT current_timestamp(),
  `last_modified_by` int(11) DEFAULT 0,
  `last_modified_time` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `aadhar_number` varchar(255) DEFAULT NULL,
  `pan_number` varchar(255) DEFAULT NULL,
  `address` text DEFAULT NULL,
  `day_deduction` float NOT NULL DEFAULT 0,
  `failed_attempts` int(11) NOT NULL DEFAULT 0,
  `exit_date` date DEFAULT NULL,
  `emp_qualification` varchar(255) DEFAULT NULL,
  `emp_degree` varchar(1000) DEFAULT NULL,
  `emp_experience` int(11) NOT NULL DEFAULT 0,
  `division` varchar(255) DEFAULT NULL,
  `department` varchar(255) DEFAULT NULL,
  `location` varchar(255) DEFAULT NULL,
  `sub_location` varchar(255) DEFAULT NULL,
  `cc_code` varchar(255) DEFAULT NULL,
  `uan` varchar(255) DEFAULT NULL,
  `esi_number` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sd_employees_locations`
--

CREATE TABLE `sd_employees_locations` (
  `ID` int(11) NOT NULL,
  `sd_employees_id` int(11) NOT NULL,
  `sd_office_locations_id` int(11) NOT NULL,
  `created_time` datetime DEFAULT NULL,
  `created_by` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sd_employee_assets`
--

CREATE TABLE `sd_employee_assets` (
  `ID` int(11) NOT NULL,
  `sd_employees_id` int(11) NOT NULL,
  `sd_admin_assets_id` int(11) NOT NULL,
  `asset_details` text DEFAULT NULL,
  `asset_issue_condition` varchar(10) DEFAULT NULL,
  `asset_return_condition` varchar(50) DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT 15 COMMENT '5 = requested 10=approved, 15= uploaded',
  `remarks` text DEFAULT NULL,
  `created_by` int(11) NOT NULL DEFAULT 0,
  `created_time` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `last_modified_by` int(11) NOT NULL DEFAULT 0,
  `last_modified_time` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sd_employee_bank`
--

CREATE TABLE `sd_employee_bank` (
  `ID` int(11) NOT NULL,
  `sd_employees_id` int(11) NOT NULL,
  `sd_admin_bank_id` int(11) NOT NULL,
  `is_active` int(11) NOT NULL DEFAULT 1,
  `bank_acc_no` varchar(255) NOT NULL,
  `bank_ifsc_no` varchar(15) NOT NULL,
  `bank_location` text DEFAULT NULL,
  `created_by` int(11) NOT NULL,
  `created_time` timestamp NOT NULL DEFAULT current_timestamp(),
  `last_modified_time` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sd_employee_doc`
--

CREATE TABLE `sd_employee_doc` (
  `ID` int(11) NOT NULL,
  `sd_employees_id` int(11) NOT NULL,
  `sd_doc_check_list_id` int(11) NOT NULL,
  `upload_file` longtext DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT 15 COMMENT '5 = requested 10=approved, 15= uploaded',
  `created_by` int(11) NOT NULL DEFAULT 0,
  `created_time` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `last_modified_by` int(11) NOT NULL DEFAULT 0,
  `last_modified_time` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sd_employee_leave`
--

CREATE TABLE `sd_employee_leave` (
  `ID` int(11) NOT NULL,
  `sd_employees_id` int(11) NOT NULL,
  `sd_leave_types_id` int(11) NOT NULL,
  `is_required` int(1) NOT NULL DEFAULT 1,
  `leaves` float DEFAULT NULL,
  `created_time` timestamp NULL DEFAULT current_timestamp(),
  `created_by` int(11) DEFAULT 0,
  `last_modified_by` int(11) DEFAULT 0,
  `last_modified_time` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sd_employee_salary`
--

CREATE TABLE `sd_employee_salary` (
  `ID` int(11) NOT NULL,
  `sd_employees_id` int(11) NOT NULL,
  `sd_salary_components_id` int(11) NOT NULL,
  `add_amount` decimal(10,2) DEFAULT NULL,
  `created_time` timestamp NULL DEFAULT current_timestamp(),
  `created_by` int(11) DEFAULT 0,
  `last_modified_by` int(11) DEFAULT 0,
  `last_modified_time` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sd_gallery`
--

CREATE TABLE `sd_gallery` (
  `ID` int(11) NOT NULL,
  `title` varchar(1000) NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_time` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sd_gallery_items`
--

CREATE TABLE `sd_gallery_items` (
  `ID` int(11) NOT NULL,
  `sd_gallery_id` int(11) NOT NULL,
  `image_title` varchar(1000) NOT NULL,
  `image_file` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sd_holidays`
--

CREATE TABLE `sd_holidays` (
  `ID` int(11) NOT NULL,
  `date` date NOT NULL,
  `name` varchar(500) NOT NULL,
  `created_time` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sd_import`
--

CREATE TABLE `sd_import` (
  `ID` int(11) NOT NULL,
  `sd_import_type` varchar(20) NOT NULL,
  `sd_file` varchar(255) DEFAULT NULL,
  `sd_mt_userdb_id` int(11) NOT NULL,
  `last_modified_time` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sd_leave_approvals`
--

CREATE TABLE `sd_leave_approvals` (
  `ID` int(11) NOT NULL,
  `sd_leave_requests_id` int(11) NOT NULL,
  `approver_id` int(11) NOT NULL,
  `action` enum('Approved','Rejected') NOT NULL,
  `comments` text DEFAULT NULL,
  `action_date` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sd_leave_balances`
--

CREATE TABLE `sd_leave_balances` (
  `ID` int(11) NOT NULL,
  `sd_employees_id` int(11) NOT NULL,
  `sd_leave_types_id` int(11) NOT NULL,
  `acc_type` varchar(10) NOT NULL COMMENT 'CREDIT/DEBIT',
  `used_leaves` int(11) NOT NULL DEFAULT 0,
  `remaining_leaves` int(11) NOT NULL,
  `created_time` timestamp NULL DEFAULT current_timestamp(),
  `last_modified_time` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sd_leave_requests`
--

CREATE TABLE `sd_leave_requests` (
  `ID` int(11) NOT NULL,
  `sd_employees_id` int(11) NOT NULL,
  `sd_leave_types_id` int(11) NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `reason` text NOT NULL,
  `status` int(11) NOT NULL DEFAULT 1,
  `created_time` timestamp NULL DEFAULT current_timestamp(),
  `submitted_at` timestamp NULL DEFAULT current_timestamp(),
  `approved_at` timestamp NULL DEFAULT NULL,
  `approver_id` int(11) DEFAULT NULL,
  `approved_remarks` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sd_leave_transactions`
--

CREATE TABLE `sd_leave_transactions` (
  `ID` int(11) NOT NULL,
  `sd_employees_id` int(11) NOT NULL,
  `sd_leave_types_id` int(11) NOT NULL,
  `transaction_id` int(11) NOT NULL DEFAULT 0,
  `transaction_date` date NOT NULL,
  `transaction_type` varchar(10) NOT NULL,
  `leave_taken` float DEFAULT 0,
  `leave_added` float DEFAULT 0,
  `remarks` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sd_leave_types`
--

CREATE TABLE `sd_leave_types` (
  `ID` int(11) NOT NULL,
  `type_name` varchar(255) NOT NULL,
  `short_name` varchar(3) DEFAULT NULL,
  `max_days` int(11) NOT NULL,
  `carry_forward` int(11) NOT NULL DEFAULT 0,
  `leave_accumulation` int(11) NOT NULL DEFAULT 4,
  `max_days_occasion` int(11) NOT NULL DEFAULT 0,
  `max_days_month` int(11) NOT NULL DEFAULT 0,
  `created_time` timestamp NULL DEFAULT current_timestamp(),
  `earned_leave` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sd_mt_role`
--

CREATE TABLE `sd_mt_role` (
  `ID` int(11) NOT NULL,
  `role_name` varchar(100) NOT NULL,
  `is_fixed` int(11) NOT NULL DEFAULT 0,
  `created_time` datetime DEFAULT NULL,
  `created_by` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sd_mt_userdb`
--

CREATE TABLE `sd_mt_userdb` (
  `ID` int(11) NOT NULL,
  `ename` varchar(100) NOT NULL,
  `euserid` varchar(100) DEFAULT NULL,
  `epassword` varchar(256) NOT NULL,
  `emailid` varchar(100) DEFAULT NULL,
  `mobile_no` varchar(10) DEFAULT NULL,
  `designation` varchar(250) DEFAULT NULL,
  `profile_img` longtext DEFAULT NULL,
  `last_login_time` datetime DEFAULT NULL,
  `last_login_ip` varchar(50) DEFAULT NULL,
  `last_reset_time` datetime DEFAULT NULL,
  `change_pass` int(11) DEFAULT 0,
  `created_time` datetime DEFAULT NULL,
  `created_by` varchar(100) DEFAULT NULL,
  `active_status` int(11) NOT NULL DEFAULT 0,
  `failed_attempts` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sd_mt_user_otp`
--

CREATE TABLE `sd_mt_user_otp` (
  `ID` int(11) NOT NULL,
  `otp_type` enum('EMAIL','MOBILE') NOT NULL,
  `country_code` varchar(5) NOT NULL DEFAULT '0',
  `mobile_no` varchar(50) DEFAULT NULL,
  `email_id` varchar(255) DEFAULT NULL,
  `otp_code_hash` varchar(255) NOT NULL,
  `otp_created_time` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf16 COLLATE=utf16_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sd_mt_user_role`
--

CREATE TABLE `sd_mt_user_role` (
  `ID` int(11) NOT NULL,
  `sd_mt_userdb_id` int(11) NOT NULL,
  `sd_mt_role_id` int(11) NOT NULL,
  `created_time` datetime DEFAULT NULL,
  `created_by` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sd_office_locations`
--

CREATE TABLE `sd_office_locations` (
  `ID` int(11) NOT NULL,
  `location_name` varchar(255) NOT NULL,
  `location_address` text NOT NULL,
  `latitude` varchar(255) DEFAULT NULL,
  `longitude` varchar(255) DEFAULT NULL,
  `office_start_time` time DEFAULT NULL,
  `office_end_time` time DEFAULT NULL,
  `created_by` int(11) NOT NULL DEFAULT 0,
  `created_time` timestamp NOT NULL DEFAULT current_timestamp(),
  `last_modified_time` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sd_projects`
--

CREATE TABLE `sd_projects` (
  `ID` int(11) NOT NULL,
  `project_name` varchar(1000) NOT NULL,
  `sd_employees_id` int(11) NOT NULL,
  `created_by` int(11) NOT NULL,
  `last_modified_time` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sd_project_team`
--

CREATE TABLE `sd_project_team` (
  `ID` int(11) NOT NULL,
  `sd_projects_id` int(11) NOT NULL,
  `sd_employees_id` int(11) NOT NULL,
  `last_modified_time` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sd_salary_components`
--

CREATE TABLE `sd_salary_components` (
  `ID` int(11) NOT NULL,
  `component_name` varchar(50) NOT NULL,
  `short_name` varchar(10) NOT NULL,
  `component_type` varchar(11) NOT NULL DEFAULT '1',
  `calculation_type` enum('fixed','percentage') NOT NULL,
  `default_amount` decimal(10,2) NOT NULL,
  `created_by` int(11) DEFAULT 0,
  `created_time` timestamp NULL DEFAULT current_timestamp(),
  `last_modified_by` int(11) DEFAULT 0,
  `last_modified_time` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `order_no` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sd_salary_reports`
--

CREATE TABLE `sd_salary_reports` (
  `ID` int(11) NOT NULL,
  `month` int(11) NOT NULL,
  `year` int(11) NOT NULL,
  `status` int(11) NOT NULL DEFAULT 5,
  `created_by` int(11) NOT NULL,
  `created_time` timestamp NOT NULL DEFAULT current_timestamp(),
  `last_modified_time` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sd_salary_slips`
--

CREATE TABLE `sd_salary_slips` (
  `ID` int(11) NOT NULL,
  `sd_salary_reports_id` int(11) NOT NULL,
  `sd_employees_id` int(11) NOT NULL,
  `basic_salary` decimal(10,2) NOT NULL,
  `allowances` float NOT NULL DEFAULT 0,
  `bill_amount` float NOT NULL DEFAULT 0,
  `total_salary` decimal(10,2) NOT NULL,
  `total_deductions` decimal(10,2) NOT NULL,
  `net_salary` decimal(10,2) NOT NULL,
  `total_company` float NOT NULL DEFAULT 0,
  `total_ctc` float NOT NULL DEFAULT 0,
  `status` enum('Pending','Paid') DEFAULT 'Pending',
  `created_time` timestamp NOT NULL DEFAULT current_timestamp(),
  `last_modified_time` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `sd_designations_id` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sd_salary_slips_sub`
--

CREATE TABLE `sd_salary_slips_sub` (
  `ID` int(11) NOT NULL,
  `sd_salary_slips_id` int(11) NOT NULL,
  `sd_salary_components_id` int(11) NOT NULL,
  `basic_percentage` decimal(5,2) DEFAULT NULL,
  `amount` decimal(10,2) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `component_type` varchar(255) DEFAULT NULL,
  `component_name` varchar(255) DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT 1 COMMENT '1=Auto,2=Manual, 3= Cancel',
  `base_amount` float(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sd_site_settings`
--

CREATE TABLE `sd_site_settings` (
  `ID` int(3) NOT NULL,
  `setting_name` varchar(50) NOT NULL,
  `setting_value` longtext NOT NULL,
  `created_by` varchar(50) NOT NULL,
  `last_modified_time` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `sd_admin_api`
--
ALTER TABLE `sd_admin_api`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `sd_admin_assets`
--
ALTER TABLE `sd_admin_assets`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `sd_admin_banks`
--
ALTER TABLE `sd_admin_banks`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `sd_admin_calander_dates`
--
ALTER TABLE `sd_admin_calander_dates`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `sd_admin_const`
--
ALTER TABLE `sd_admin_const`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `sd_admin_employees_types`
--
ALTER TABLE `sd_admin_employees_types`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `sd_admin_mail`
--
ALTER TABLE `sd_admin_mail`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `sd_admin_menu`
--
ALTER TABLE `sd_admin_menu`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `sd_admin_modules`
--
ALTER TABLE `sd_admin_modules`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `sd_admin_module_permissions`
--
ALTER TABLE `sd_admin_module_permissions`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `module_id` (`module_id`,`action`);

--
-- Indexes for table `sd_admin_role_permissions`
--
ALTER TABLE `sd_admin_role_permissions`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `role_id` (`role_id`,`permission_id`);

--
-- Indexes for table `sd_advance`
--
ALTER TABLE `sd_advance`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `sd_attendance`
--
ALTER TABLE `sd_attendance`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `sd_employees_id` (`sd_employees_id`);

--
-- Indexes for table `sd_bill_claims`
--
ALTER TABLE `sd_bill_claims`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `sd_bill_claims_items`
--
ALTER TABLE `sd_bill_claims_items`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `sd_circulars`
--
ALTER TABLE `sd_circulars`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `sd_designations`
--
ALTER TABLE `sd_designations`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `designation_name` (`designation_name`);

--
-- Indexes for table `sd_doc_check_list`
--
ALTER TABLE `sd_doc_check_list`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `sd_employees`
--
ALTER TABLE `sd_employees`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `email` (`email`),
  ADD KEY `sd_designations_id` (`sd_designations_id`),
  ADD KEY `emp_type` (`emp_type`),
  ADD KEY `employee_id` (`employee_id`);

--
-- Indexes for table `sd_employees_locations`
--
ALTER TABLE `sd_employees_locations`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `sd_employee_assets`
--
ALTER TABLE `sd_employee_assets`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `sd_employees_id` (`sd_employees_id`),
  ADD KEY `sd_admin_assets_id` (`sd_admin_assets_id`);

--
-- Indexes for table `sd_employee_bank`
--
ALTER TABLE `sd_employee_bank`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `sd_employee_doc`
--
ALTER TABLE `sd_employee_doc`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `sd_employee_leave`
--
ALTER TABLE `sd_employee_leave`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `sd_employees_id` (`sd_employees_id`),
  ADD KEY `sd_salary_components_id` (`sd_leave_types_id`);

--
-- Indexes for table `sd_employee_salary`
--
ALTER TABLE `sd_employee_salary`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `sd_employees_id` (`sd_employees_id`),
  ADD KEY `sd_salary_components_id` (`sd_salary_components_id`);

--
-- Indexes for table `sd_gallery`
--
ALTER TABLE `sd_gallery`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `sd_gallery_items`
--
ALTER TABLE `sd_gallery_items`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `sd_holidays`
--
ALTER TABLE `sd_holidays`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `sd_import`
--
ALTER TABLE `sd_import`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `sd_leave_approvals`
--
ALTER TABLE `sd_leave_approvals`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `sd_leave_requests_id` (`sd_leave_requests_id`),
  ADD KEY `approver_id` (`approver_id`);

--
-- Indexes for table `sd_leave_balances`
--
ALTER TABLE `sd_leave_balances`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `sd_employees_id` (`sd_employees_id`),
  ADD KEY `sd_leave_types_id` (`sd_leave_types_id`);

--
-- Indexes for table `sd_leave_requests`
--
ALTER TABLE `sd_leave_requests`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `sd_employees_id` (`sd_employees_id`),
  ADD KEY `sd_leave_types_id` (`sd_leave_types_id`),
  ADD KEY `approver_id` (`approver_id`);

--
-- Indexes for table `sd_leave_transactions`
--
ALTER TABLE `sd_leave_transactions`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `sd_leave_types`
--
ALTER TABLE `sd_leave_types`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `type_name` (`type_name`);

--
-- Indexes for table `sd_mt_role`
--
ALTER TABLE `sd_mt_role`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `sd_mt_userdb`
--
ALTER TABLE `sd_mt_userdb`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `sd_mt_user_otp`
--
ALTER TABLE `sd_mt_user_otp`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `sd_mt_user_role`
--
ALTER TABLE `sd_mt_user_role`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `sd_office_locations`
--
ALTER TABLE `sd_office_locations`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `sd_projects`
--
ALTER TABLE `sd_projects`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `sd_project_team`
--
ALTER TABLE `sd_project_team`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `sd_salary_components`
--
ALTER TABLE `sd_salary_components`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `component_name` (`component_name`);

--
-- Indexes for table `sd_salary_reports`
--
ALTER TABLE `sd_salary_reports`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `month` (`month`,`year`);

--
-- Indexes for table `sd_salary_slips`
--
ALTER TABLE `sd_salary_slips`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `sd_salary_reports_id` (`sd_salary_reports_id`);

--
-- Indexes for table `sd_salary_slips_sub`
--
ALTER TABLE `sd_salary_slips_sub`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `sd_salary_slips_id` (`sd_salary_slips_id`);

--
-- Indexes for table `sd_site_settings`
--
ALTER TABLE `sd_site_settings`
  ADD PRIMARY KEY (`ID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `sd_admin_api`
--
ALTER TABLE `sd_admin_api`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sd_admin_assets`
--
ALTER TABLE `sd_admin_assets`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sd_admin_banks`
--
ALTER TABLE `sd_admin_banks`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sd_admin_calander_dates`
--
ALTER TABLE `sd_admin_calander_dates`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sd_admin_const`
--
ALTER TABLE `sd_admin_const`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sd_admin_employees_types`
--
ALTER TABLE `sd_admin_employees_types`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sd_admin_mail`
--
ALTER TABLE `sd_admin_mail`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sd_admin_menu`
--
ALTER TABLE `sd_admin_menu`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sd_admin_modules`
--
ALTER TABLE `sd_admin_modules`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sd_admin_module_permissions`
--
ALTER TABLE `sd_admin_module_permissions`
  MODIFY `ID` int(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sd_admin_role_permissions`
--
ALTER TABLE `sd_admin_role_permissions`
  MODIFY `ID` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sd_advance`
--
ALTER TABLE `sd_advance`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sd_attendance`
--
ALTER TABLE `sd_attendance`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sd_bill_claims`
--
ALTER TABLE `sd_bill_claims`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sd_bill_claims_items`
--
ALTER TABLE `sd_bill_claims_items`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sd_circulars`
--
ALTER TABLE `sd_circulars`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sd_designations`
--
ALTER TABLE `sd_designations`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sd_doc_check_list`
--
ALTER TABLE `sd_doc_check_list`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sd_employees`
--
ALTER TABLE `sd_employees`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sd_employees_locations`
--
ALTER TABLE `sd_employees_locations`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sd_employee_assets`
--
ALTER TABLE `sd_employee_assets`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sd_employee_bank`
--
ALTER TABLE `sd_employee_bank`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sd_employee_doc`
--
ALTER TABLE `sd_employee_doc`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sd_employee_leave`
--
ALTER TABLE `sd_employee_leave`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sd_employee_salary`
--
ALTER TABLE `sd_employee_salary`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sd_gallery`
--
ALTER TABLE `sd_gallery`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sd_gallery_items`
--
ALTER TABLE `sd_gallery_items`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sd_holidays`
--
ALTER TABLE `sd_holidays`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sd_import`
--
ALTER TABLE `sd_import`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sd_leave_approvals`
--
ALTER TABLE `sd_leave_approvals`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sd_leave_balances`
--
ALTER TABLE `sd_leave_balances`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sd_leave_requests`
--
ALTER TABLE `sd_leave_requests`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sd_leave_transactions`
--
ALTER TABLE `sd_leave_transactions`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sd_leave_types`
--
ALTER TABLE `sd_leave_types`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sd_mt_role`
--
ALTER TABLE `sd_mt_role`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sd_mt_userdb`
--
ALTER TABLE `sd_mt_userdb`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sd_mt_user_otp`
--
ALTER TABLE `sd_mt_user_otp`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sd_mt_user_role`
--
ALTER TABLE `sd_mt_user_role`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sd_office_locations`
--
ALTER TABLE `sd_office_locations`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sd_projects`
--
ALTER TABLE `sd_projects`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sd_project_team`
--
ALTER TABLE `sd_project_team`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sd_salary_components`
--
ALTER TABLE `sd_salary_components`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sd_salary_reports`
--
ALTER TABLE `sd_salary_reports`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sd_salary_slips`
--
ALTER TABLE `sd_salary_slips`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sd_salary_slips_sub`
--
ALTER TABLE `sd_salary_slips_sub`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sd_site_settings`
--
ALTER TABLE `sd_site_settings`
  MODIFY `ID` int(3) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `sd_admin_module_permissions`
--
ALTER TABLE `sd_admin_module_permissions`
  ADD CONSTRAINT `sd_admin_module_permissions_ibfk_1` FOREIGN KEY (`module_id`) REFERENCES `sd_admin_modules` (`ID`) ON DELETE CASCADE;

--
-- Constraints for table `sd_salary_slips`
--
ALTER TABLE `sd_salary_slips`
  ADD CONSTRAINT `sd_salary_slips_ibfk_1` FOREIGN KEY (`sd_salary_reports_id`) REFERENCES `sd_salary_reports` (`ID`);
--
-- Database: `mycruddb`
--
CREATE DATABASE IF NOT EXISTS `mycruddb` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_uca1400_ai_ci;
USE `mycruddb`;

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `created_at` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `category_id` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `base_price` decimal(10,2) DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `product_images`
--

CREATE TABLE `product_images` (
  `id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `product_image` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `site_settings`
--

CREATE TABLE `site_settings` (
  `id` int(11) NOT NULL,
  `setting_name` varchar(100) DEFAULT NULL,
  `setting_value` text DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `ename` varchar(100) DEFAULT NULL,
  `euserid` varchar(100) DEFAULT NULL,
  `epassword` varchar(256) DEFAULT NULL,
  `emailid` varchar(100) DEFAULT NULL,
  `mobile_no` varchar(10) DEFAULT NULL,
  `designation` varchar(250) DEFAULT NULL,
  `profile_img` longblob DEFAULT NULL,
  `intercome_number` varchar(100) DEFAULT NULL,
  `last_login_time` datetime DEFAULT NULL,
  `last_login_ip` varchar(50) DEFAULT NULL,
  `last_reset_time` datetime DEFAULT NULL,
  `change_pass` int(11) DEFAULT 0,
  `created_time` datetime DEFAULT current_timestamp(),
  `created_by` varchar(100) DEFAULT NULL,
  `active_status` int(11) DEFAULT 0,
  `failed_attempts` int(11) DEFAULT 0,
  `role_id` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `category_id` (`category_id`);

--
-- Indexes for table `product_images`
--
ALTER TABLE `product_images`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `site_settings`
--
ALTER TABLE `site_settings`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `setting_name` (`setting_name`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `product_images`
--
ALTER TABLE `product_images`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `site_settings`
--
ALTER TABLE `site_settings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`);

--
-- Constraints for table `product_images`
--
ALTER TABLE `product_images`
  ADD CONSTRAINT `product_images_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;
--
-- Database: `sds_archo`
--
CREATE DATABASE IF NOT EXISTS `sds_archo` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_uca1400_ai_ci;
USE `sds_archo`;

-- --------------------------------------------------------

--
-- Table structure for table `sd_admin_home_images`
--

CREATE TABLE `sd_admin_home_images` (
  `ID` int(11) NOT NULL,
  `image_title` varchar(255) NOT NULL,
  `image_file` longtext NOT NULL,
  `image_type` varchar(255) NOT NULL,
  `last_modified_time` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sd_circulars`
--

CREATE TABLE `sd_circulars` (
  `ID` int(11) NOT NULL,
  `circular_type` varchar(50) NOT NULL,
  `circular_title` text NOT NULL,
  `circular_file` longtext NOT NULL,
  `circular_date` date DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT 5,
  `created_by` int(11) NOT NULL DEFAULT 0,
  `created_time` timestamp NOT NULL DEFAULT current_timestamp(),
  `last_modified_by` int(11) NOT NULL DEFAULT 0,
  `last_modified_time` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sd_gallery`
--

CREATE TABLE `sd_gallery` (
  `ID` int(11) NOT NULL,
  `title` varchar(1000) NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_time` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sd_gallery_items`
--

CREATE TABLE `sd_gallery_items` (
  `ID` int(11) NOT NULL,
  `sd_gallery_id` int(11) NOT NULL,
  `image_title` varchar(1000) NOT NULL,
  `image_file` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sd_mt_role`
--

CREATE TABLE `sd_mt_role` (
  `ID` int(11) NOT NULL,
  `role_name` varchar(100) NOT NULL,
  `created_time` datetime DEFAULT NULL,
  `created_by` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sd_mt_userdb`
--

CREATE TABLE `sd_mt_userdb` (
  `ID` int(11) NOT NULL,
  `user_type` int(11) NOT NULL DEFAULT 1 COMMENT '1=admin,5=customer',
  `ename` varchar(255) NOT NULL,
  `euserid` varchar(255) NOT NULL,
  `epassword` varchar(255) DEFAULT NULL,
  `email_id` varchar(255) DEFAULT NULL,
  `mobile_no` varchar(15) DEFAULT NULL,
  `designation` varchar(255) DEFAULT NULL,
  `profile_img` longtext DEFAULT NULL,
  `unit_office` varchar(50) DEFAULT NULL,
  `icno` varchar(50) DEFAULT NULL,
  `last_login_time` datetime DEFAULT NULL,
  `last_login_ip` varchar(50) DEFAULT NULL,
  `last_reset_time` datetime DEFAULT NULL,
  `change_pass` int(11) DEFAULT 0,
  `created_time` datetime DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `active_status` int(11) NOT NULL DEFAULT 0,
  `failed_attempts` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sd_mt_user_otp`
--

CREATE TABLE `sd_mt_user_otp` (
  `ID` int(11) NOT NULL,
  `otp_type` enum('EMAIL','MOBILE') NOT NULL,
  `country_code` varchar(5) NOT NULL DEFAULT '0',
  `mobile_no` varchar(50) DEFAULT NULL,
  `email_id` varchar(255) DEFAULT NULL,
  `otp_code_hash` varchar(255) NOT NULL,
  `otp_created_time` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf16 COLLATE=utf16_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sd_mt_user_role`
--

CREATE TABLE `sd_mt_user_role` (
  `ID` int(11) NOT NULL,
  `sd_mt_userdb_id` int(11) NOT NULL,
  `sd_mt_role_id` int(11) NOT NULL,
  `created_time` datetime DEFAULT NULL,
  `created_by` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sd_site_api`
--

CREATE TABLE `sd_site_api` (
  `ID` int(11) NOT NULL,
  `api_path` varchar(255) NOT NULL,
  `controller` varchar(50) NOT NULL,
  `method` varchar(50) NOT NULL,
  `type` enum('POST','GET') NOT NULL,
  `description` text NOT NULL,
  `groups` varchar(1000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf16 COLLATE=utf16_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sd_site_settings`
--

CREATE TABLE `sd_site_settings` (
  `ID` int(3) NOT NULL,
  `setting_name` varchar(50) NOT NULL,
  `setting_value` longtext NOT NULL,
  `created_by` varchar(50) NOT NULL,
  `last_modified_time` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `sd_admin_home_images`
--
ALTER TABLE `sd_admin_home_images`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `sd_circulars`
--
ALTER TABLE `sd_circulars`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `sd_gallery`
--
ALTER TABLE `sd_gallery`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `sd_gallery_items`
--
ALTER TABLE `sd_gallery_items`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `sd_mt_role`
--
ALTER TABLE `sd_mt_role`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `sd_mt_userdb`
--
ALTER TABLE `sd_mt_userdb`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `sd_mt_user_otp`
--
ALTER TABLE `sd_mt_user_otp`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `sd_mt_user_role`
--
ALTER TABLE `sd_mt_user_role`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `sd_mt_userdb_id` (`sd_mt_userdb_id`),
  ADD KEY `sd_mt_role_id` (`sd_mt_role_id`);

--
-- Indexes for table `sd_site_api`
--
ALTER TABLE `sd_site_api`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `sd_site_settings`
--
ALTER TABLE `sd_site_settings`
  ADD PRIMARY KEY (`ID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `sd_admin_home_images`
--
ALTER TABLE `sd_admin_home_images`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sd_circulars`
--
ALTER TABLE `sd_circulars`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sd_gallery`
--
ALTER TABLE `sd_gallery`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sd_gallery_items`
--
ALTER TABLE `sd_gallery_items`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sd_mt_role`
--
ALTER TABLE `sd_mt_role`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sd_mt_userdb`
--
ALTER TABLE `sd_mt_userdb`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sd_mt_user_otp`
--
ALTER TABLE `sd_mt_user_otp`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sd_mt_user_role`
--
ALTER TABLE `sd_mt_user_role`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sd_site_api`
--
ALTER TABLE `sd_site_api`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sd_site_settings`
--
ALTER TABLE `sd_site_settings`
  MODIFY `ID` int(3) NOT NULL AUTO_INCREMENT;
--
-- Database: `sds_chatbot`
--
CREATE DATABASE IF NOT EXISTS `sds_chatbot` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_uca1400_ai_ci;
USE `sds_chatbot`;

-- --------------------------------------------------------

--
-- Table structure for table `sd_admin_auth_modes`
--

CREATE TABLE `sd_admin_auth_modes` (
  `ID` int(11) NOT NULL,
  `method_name` varchar(100) NOT NULL,
  `description` text DEFAULT NULL,
  `created_time` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sd_admin_branding_settings`
--

CREATE TABLE `sd_admin_branding_settings` (
  `ID` int(11) NOT NULL,
  `sd_admin_mt_userdb_id` int(11) NOT NULL,
  `logoUrl` varchar(500) DEFAULT NULL,
  `primaryColor` varchar(7) DEFAULT NULL,
  `secondaryColor` varchar(7) DEFAULT NULL,
  `companyName` varchar(255) DEFAULT NULL,
  `emailFromName` varchar(255) DEFAULT NULL,
  `customCss` text DEFAULT NULL,
  `isActive` tinyint(1) NOT NULL DEFAULT 1,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sd_admin_mail`
--

CREATE TABLE `sd_admin_mail` (
  `ID` int(11) NOT NULL,
  `mail_name` varchar(255) NOT NULL,
  `mail_subject` text NOT NULL,
  `mail_msg` longtext NOT NULL,
  `last_modified_by` datetime NOT NULL,
  `last_modified_time` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sd_admin_menu`
--

CREATE TABLE `sd_admin_menu` (
  `ID` int(10) UNSIGNED NOT NULL,
  `label` varchar(50) NOT NULL,
  `icon` varchar(50) NOT NULL,
  `link` varchar(150) NOT NULL,
  `roles` varchar(255) NOT NULL,
  `order_number` int(11) NOT NULL DEFAULT 0,
  `parent_id` int(10) UNSIGNED DEFAULT NULL,
  `created_time` datetime DEFAULT NULL,
  `last_modified_time` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sd_admin_mt_role`
--

CREATE TABLE `sd_admin_mt_role` (
  `ID` int(11) NOT NULL,
  `role_name` varchar(100) NOT NULL,
  `created_time` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sd_admin_mt_userdb`
--

CREATE TABLE `sd_admin_mt_userdb` (
  `ID` int(11) NOT NULL,
  `emailid` varchar(255) DEFAULT NULL,
  `ename` varchar(255) DEFAULT NULL,
  `epassword` varchar(255) DEFAULT NULL,
  `euserid` varchar(255) DEFAULT NULL,
  `mobile_no` varchar(255) DEFAULT NULL,
  `designation` varchar(250) DEFAULT NULL,
  `profile_img` text DEFAULT NULL,
  `last_login_time` datetime DEFAULT NULL,
  `last_login_ip` varchar(50) DEFAULT NULL,
  `last_reset_time` datetime DEFAULT NULL,
  `change_pass` int(11) DEFAULT 0,
  `created_time` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT 0,
  `active_status` int(11) NOT NULL DEFAULT 0,
  `failed_attempts` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sd_admin_mt_user_role`
--

CREATE TABLE `sd_admin_mt_user_role` (
  `ID` int(11) NOT NULL,
  `sd_mt_userdb_id` int(11) NOT NULL,
  `sd_mt_role_id` int(11) NOT NULL,
  `created_by` varchar(100) NOT NULL,
  `created_time` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sd_api_keys`
--

CREATE TABLE `sd_api_keys` (
  `ID` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `key` varchar(255) NOT NULL,
  `is_enabled` tinyint(1) NOT NULL DEFAULT 0,
  `ip_address` varchar(100) DEFAULT NULL,
  `site_url` varchar(1000) DEFAULT NULL,
  `title` varchar(100) DEFAULT NULL,
  `createdAt` datetime DEFAULT NULL,
  `updatedAt` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sd_api_key_stores`
--

CREATE TABLE `sd_api_key_stores` (
  `ID` int(11) NOT NULL,
  `api_key_id` int(11) NOT NULL,
  `chatbot_id` int(11) NOT NULL,
  `is_enabled` tinyint(1) NOT NULL DEFAULT 1,
  `createdAt` datetime DEFAULT NULL,
  `updatedAt` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sd_audit_log`
--

CREATE TABLE `sd_audit_log` (
  `ID` int(11) NOT NULL,
  `sd_admin_mt_userdb_id` int(11) DEFAULT NULL,
  `login_timestamp` datetime NOT NULL,
  `logout_timestamp` datetime DEFAULT NULL,
  `session_id` varchar(100) DEFAULT NULL,
  `session_duration` int(11) DEFAULT NULL COMMENT 'Duration in seconds',
  `ip_address` varchar(45) NOT NULL,
  `country` varchar(100) DEFAULT NULL,
  `city` varchar(100) DEFAULT NULL,
  `device_type` varchar(50) DEFAULT NULL COMMENT 'mobile, desktop, tablet, etc.',
  `device_name` varchar(100) DEFAULT NULL,
  `operating_system` varchar(100) DEFAULT NULL,
  `os_version` varchar(50) DEFAULT NULL,
  `browser` varchar(100) DEFAULT NULL,
  `browser_version` varchar(50) DEFAULT NULL,
  `auth_method_id` int(11) DEFAULT NULL,
  `login_status` varchar(20) NOT NULL COMMENT 'success, failed, locked, etc.',
  `failure_reason` varchar(255) DEFAULT NULL,
  `failed_attempts_count` int(11) DEFAULT 0,
  `is_suspicious` tinyint(1) DEFAULT 0,
  `suspicious_reason` text DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sd_chatbots`
--

CREATE TABLE `sd_chatbots` (
  `ID` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `form_files` text DEFAULT NULL,
  `botName` varchar(255) DEFAULT NULL,
  `greeting` varchar(255) DEFAULT NULL,
  `theme` varchar(50) DEFAULT 'dark',
  `customCSS` tinyint(1) NOT NULL DEFAULT 0,
  `animations` tinyint(1) NOT NULL DEFAULT 0,
  `darkMode` tinyint(1) NOT NULL DEFAULT 1,
  `widgetPosition` varchar(50) NOT NULL DEFAULT 'Bottom Right',
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `variant` varchar(100) DEFAULT 'standard'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sd_chatbot_feedback`
--

CREATE TABLE `sd_chatbot_feedback` (
  `ID` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `chatbot_id` int(11) NOT NULL,
  `question_id` int(11) NOT NULL,
  `session_id` int(11) NOT NULL,
  `rating` tinyint(4) DEFAULT NULL,
  `feedback_type` enum('like','dislike','rating','comment') NOT NULL,
  `comment` text DEFAULT NULL,
  `helpful` tinyint(1) DEFAULT NULL,
  `accurate` tinyint(1) DEFAULT NULL,
  `complete` tinyint(1) DEFAULT NULL,
  `relevant` tinyint(1) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sd_chatbot_metrics`
--

CREATE TABLE `sd_chatbot_metrics` (
  `ID` int(11) NOT NULL,
  `chatbot_id` int(11) NOT NULL,
  `metric_date` date NOT NULL,
  `total_queries` int(11) DEFAULT 0,
  `successful_queries` int(11) DEFAULT 0,
  `failed_queries` int(11) DEFAULT 0,
  `unique_users` int(11) DEFAULT 0,
  `total_sessions` int(11) DEFAULT 0,
  `avg_confidence_score` decimal(5,4) DEFAULT 0.0000,
  `avg_response_time_ms` int(11) DEFAULT 0,
  `positive_feedback` int(11) DEFAULT 0,
  `negative_feedback` int(11) DEFAULT 0,
  `avg_rating` decimal(3,2) DEFAULT 0.00,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sd_chatbot_pdfs`
--

CREATE TABLE `sd_chatbot_pdfs` (
  `ID` int(11) NOT NULL,
  `chatbot_id` int(11) NOT NULL,
  `filename` varchar(255) NOT NULL,
  `path` varchar(255) NOT NULL,
  `content` longtext DEFAULT NULL,
  `type` varchar(100) NOT NULL,
  `size` int(11) DEFAULT NULL,
  `train_status` enum('training','trained') NOT NULL DEFAULT 'training',
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sd_chatbot_questions`
--

CREATE TABLE `sd_chatbot_questions` (
  `ID` int(11) NOT NULL,
  `chatbot_id` int(11) NOT NULL,
  `session_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `question` varchar(1000) NOT NULL,
  `answer` varchar(5000) NOT NULL,
  `confidence_score` decimal(5,4) DEFAULT 0.0000,
  `response_time_ms` int(11) DEFAULT 0,
  `status` enum('answered','unanswered','error','filtered') DEFAULT 'answered',
  `context_used` text DEFAULT NULL,
  `source` varchar(100) DEFAULT NULL,
  `model_version` varchar(50) DEFAULT NULL,
  `query_type` enum('simple','complex','follow_up','clarification') DEFAULT 'simple',
  `language` varchar(10) DEFAULT 'en',
  `train_status` enum('training','trained') NOT NULL DEFAULT 'training',
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sd_chatbot_sessions`
--

CREATE TABLE `sd_chatbot_sessions` (
  `ID` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `chatbot_id` int(11) NOT NULL,
  `start_time` datetime DEFAULT NULL,
  `end_time` datetime DEFAULT NULL,
  `duration_seconds` int(11) DEFAULT 0,
  `total_queries` int(11) DEFAULT 0,
  `successful_queries` int(11) DEFAULT 0,
  `user_agent` text DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `platform` varchar(50) DEFAULT NULL,
  `device_type` enum('desktop','mobile','tablet') DEFAULT 'desktop',
  `is_active` tinyint(1) DEFAULT 1,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sd_chatbot_trees`
--

CREATE TABLE `sd_chatbot_trees` (
  `ID` int(11) NOT NULL,
  `chatbot_id` int(11) NOT NULL,
  `parent_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `type` enum('bot','pdf','url','qna') DEFAULT 'bot',
  `dataCount` int(11) DEFAULT 0,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sd_chatbot_web`
--

CREATE TABLE `sd_chatbot_web` (
  `ID` int(11) NOT NULL,
  `chatbot_id` int(11) NOT NULL,
  `chat_web_url` varchar(1000) NOT NULL,
  `train_status` enum('training','trained') NOT NULL DEFAULT 'training',
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sd_chatbot_weblinks`
--

CREATE TABLE `sd_chatbot_weblinks` (
  `ID` int(11) NOT NULL,
  `weburl_id` int(11) NOT NULL,
  `web_url` varchar(1000) NOT NULL,
  `url_category` varchar(1000) DEFAULT NULL,
  `chunk_id` varchar(1000) DEFAULT NULL,
  `chunk_size` varchar(1000) DEFAULT NULL,
  `content_length` int(11) DEFAULT NULL,
  `status` varchar(1000) DEFAULT NULL,
  `level` int(11) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sd_contacts`
--

CREATE TABLE `sd_contacts` (
  `ID` int(11) NOT NULL,
  `sd_admin_mt_userdb_id` int(11) NOT NULL,
  `contact_userdb_id` int(11) NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sd_help_category`
--

CREATE TABLE `sd_help_category` (
  `ID` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `category_name` varchar(100) DEFAULT NULL,
  `colorClass` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sd_help_knowledge_base`
--

CREATE TABLE `sd_help_knowledge_base` (
  `ID` int(11) NOT NULL,
  `sd_admin_mt_userdb_id` int(11) DEFAULT NULL,
  `title` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  `views_count` int(11) DEFAULT 0,
  `pdf_file` text DEFAULT NULL,
  `featured` varchar(255) DEFAULT NULL,
  `last_modified_time` datetime DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sd_help_rating`
--

CREATE TABLE `sd_help_rating` (
  `ID` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `sd_help_knowledge_id` int(11) DEFAULT NULL,
  `rate_point` float DEFAULT NULL,
  `review` text DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sd_help_view`
--

CREATE TABLE `sd_help_view` (
  `ID` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `sd_help_knowledge_id` int(11) DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `country` varchar(100) DEFAULT NULL,
  `city` varchar(100) DEFAULT NULL,
  `device_type` varchar(50) DEFAULT NULL COMMENT 'mobile, desktop, tablet, etc.',
  `device_name` varchar(100) DEFAULT NULL,
  `operating_system` varchar(100) DEFAULT NULL,
  `os_version` varchar(50) DEFAULT NULL,
  `browser` varchar(100) DEFAULT NULL,
  `browser_version` varchar(50) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sd_notifications`
--

CREATE TABLE `sd_notifications` (
  `ID` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `chatbot_id` int(11) DEFAULT NULL,
  `category` enum('LOGIN','DOCUMENT','SYSTEM') NOT NULL,
  `sub_type` varchar(255) NOT NULL,
  `message` text NOT NULL,
  `is_read` tinyint(1) NOT NULL DEFAULT 0,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sd_payment`
--

CREATE TABLE `sd_payment` (
  `ID` int(11) NOT NULL,
  `email_id` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `mobile_no` varchar(20) DEFAULT NULL,
  `billing_address` text DEFAULT NULL,
  `gst_no` varchar(50) DEFAULT NULL,
  `created_time` datetime DEFAULT NULL,
  `last_modified_time` datetime DEFAULT NULL,
  `payment_start_time` datetime DEFAULT NULL,
  `payment_ref_no` varchar(100) DEFAULT NULL,
  `payment_amount` float DEFAULT 0,
  `payment_tax` float DEFAULT 0,
  `payment_total_amount` float DEFAULT 0,
  `payment_status` varchar(50) DEFAULT 'pending',
  `plan_mode` varchar(255) DEFAULT NULL,
  `plan_duration` varchar(255) DEFAULT NULL,
  `plan_end_date` datetime DEFAULT NULL,
  `plan_count` int(11) DEFAULT NULL,
  `payment_end_time` datetime DEFAULT NULL,
  `payment_currency` varchar(255) DEFAULT NULL,
  `razorpay_order_id` varchar(255) DEFAULT NULL,
  `razorpay_payment_id` varchar(255) DEFAULT NULL,
  `razorpay_signature` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sd_project`
--

CREATE TABLE `sd_project` (
  `id` int(11) NOT NULL,
  `project_name` varchar(256) NOT NULL,
  `project_description` text NOT NULL,
  `project_env` varchar(15) NOT NULL COMMENT 'Development | Testing | Production',
  `owner_email` varchar(256) NOT NULL,
  `ip_listing_enable` int(11) DEFAULT 0,
  `brand_logo` longtext DEFAULT NULL,
  `access_key` longtext DEFAULT NULL,
  `secret_key` longtext DEFAULT NULL,
  `page_title` text DEFAULT NULL,
  `created_by` varchar(256) DEFAULT NULL,
  `created_time` datetime DEFAULT NULL,
  `last_modified_time` datetime DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sd_project_callback`
--

CREATE TABLE `sd_project_callback` (
  `ID` int(11) NOT NULL,
  `sd_project_id` int(11) NOT NULL,
  `callback_url` varchar(255) NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sd_project_ip`
--

CREATE TABLE `sd_project_ip` (
  `ID` int(11) NOT NULL,
  `sd_project_id` int(11) NOT NULL,
  `ip_address` varchar(255) NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sd_project_user`
--

CREATE TABLE `sd_project_user` (
  `ID` int(11) NOT NULL,
  `sd_project_id` int(11) NOT NULL,
  `sd_mt_userdb_id` int(11) NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sd_qna_chatbot`
--

CREATE TABLE `sd_qna_chatbot` (
  `ID` int(11) NOT NULL,
  `chatbot_id` int(11) NOT NULL,
  `chat_question` varchar(1000) NOT NULL,
  `chat_answer` longtext DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `train_status` enum('training','trained') NOT NULL DEFAULT 'training'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sd_settings_admin`
--

CREATE TABLE `sd_settings_admin` (
  `ID` int(11) NOT NULL,
  `setting_definition_id` int(11) NOT NULL,
  `setting_value` text DEFAULT NULL,
  `is_encrypted` tinyint(1) DEFAULT 0,
  `updated_by` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sd_settings_category`
--

CREATE TABLE `sd_settings_category` (
  `ID` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `description` text DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT 1,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sd_settings_definition`
--

CREATE TABLE `sd_settings_definition` (
  `ID` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `setting_key` varchar(100) NOT NULL,
  `setting_name` varchar(200) NOT NULL,
  `description` text DEFAULT NULL,
  `data_type` enum('string','integer','boolean','decimal','json','file','email','url','text') NOT NULL,
  `default_value` text DEFAULT NULL,
  `validation_rules` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`validation_rules`)),
  `is_user_configurable` tinyint(1) DEFAULT 0,
  `is_required` tinyint(1) DEFAULT 0,
  `display_order` int(11) DEFAULT 0,
  `is_active` tinyint(1) DEFAULT 1,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sd_settings_user`
--

CREATE TABLE `sd_settings_user` (
  `ID` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `setting_definition_id` int(11) NOT NULL,
  `setting_value` text DEFAULT NULL,
  `is_encrypted` tinyint(1) DEFAULT 0,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

-- --------------------------------------------------------

--
-- Stand-in structure for view `sd_settings_v_effective_settings`
-- (See below for the actual view)
--
CREATE TABLE `sd_settings_v_effective_settings` (
`setting_key` varchar(100)
,`setting_name` varchar(200)
,`description` text
,`data_type` enum('string','integer','boolean','decimal','json','file','email','url','text')
,`category_name` varchar(100)
,`effective_value` mediumtext
,`value_source` varchar(7)
,`user_id` int(11)
,`is_user_configurable` tinyint(1)
,`validation_rules` longtext
,`setting_definition_id` int(11)
,`user_setting_updated_at` datetime
,`admin_setting_updated_at` datetime
);

-- --------------------------------------------------------

--
-- Table structure for table `sd_sub_feature`
--

CREATE TABLE `sd_sub_feature` (
  `ID` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `slug` varchar(100) NOT NULL,
  `description` text DEFAULT NULL,
  `featureType` enum('boolean','numeric','text') NOT NULL DEFAULT 'boolean',
  `category` varchar(50) NOT NULL DEFAULT 'general',
  `isActive` tinyint(1) NOT NULL DEFAULT 1,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sd_sub_plan`
--

CREATE TABLE `sd_sub_plan` (
  `ID` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `slug` varchar(50) NOT NULL,
  `description` text DEFAULT NULL,
  `price` decimal(10,2) NOT NULL DEFAULT 0.00,
  `currency` varchar(3) NOT NULL DEFAULT 'USD',
  `billingInterval` enum('monthly','yearly') NOT NULL DEFAULT 'monthly',
  `trialDays` int(11) NOT NULL DEFAULT 0,
  `isActive` tinyint(1) NOT NULL DEFAULT 1,
  `sortOrder` int(11) NOT NULL DEFAULT 0,
  `created_time` datetime DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sd_sub_plan_feature`
--

CREATE TABLE `sd_sub_plan_feature` (
  `ID` int(11) NOT NULL,
  `sd_sub_plan_id` int(11) NOT NULL,
  `sd_sub_feature_id` int(11) NOT NULL,
  `value` text NOT NULL COMMENT 'JSON string for complex values, plain text for simple values',
  `isEnabled` tinyint(1) NOT NULL DEFAULT 1,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sd_sub_subscription`
--

CREATE TABLE `sd_sub_subscription` (
  `ID` int(11) NOT NULL,
  `sd_admin_mt_userdb_id` int(11) NOT NULL,
  `sd_sub_plan_id` int(11) NOT NULL,
  `status` enum('start','active','canceled','expired','trial','past_due') NOT NULL DEFAULT 'active',
  `stripeSubscriptionId` varchar(255) DEFAULT NULL,
  `stripeCustomerId` varchar(255) DEFAULT NULL,
  `currentPeriodStart` datetime NOT NULL,
  `currentPeriodEnd` datetime NOT NULL,
  `trialStart` datetime DEFAULT NULL,
  `trialEnd` datetime DEFAULT NULL,
  `canceledAt` datetime DEFAULT NULL,
  `cancelAtPeriodEnd` tinyint(1) NOT NULL DEFAULT 0,
  `admin_added` tinyint(1) NOT NULL DEFAULT 0,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sd_sub_usage_tracking`
--

CREATE TABLE `sd_sub_usage_tracking` (
  `ID` int(11) NOT NULL,
  `sd_admin_mt_userdb_id` int(11) NOT NULL,
  `featureSlug` varchar(100) NOT NULL,
  `usageCount` int(11) NOT NULL DEFAULT 0,
  `periodStart` datetime NOT NULL,
  `periodEnd` datetime NOT NULL,
  `metadata` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'Additional tracking data like document IDs, etc.' CHECK (json_valid(`metadata`)),
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

-- --------------------------------------------------------

--
-- Structure for view `sd_settings_v_effective_settings`
--
DROP TABLE IF EXISTS `sd_settings_v_effective_settings`;

CREATE ALGORITHM=UNDEFINED DEFINER=`sds_db_user`@`%` SQL SECURITY DEFINER VIEW `sd_settings_v_effective_settings`  AS SELECT `sd`.`setting_key` AS `setting_key`, `sd`.`setting_name` AS `setting_name`, `sd`.`description` AS `description`, `sd`.`data_type` AS `data_type`, `sc`.`name` AS `category_name`, coalesce(`us`.`setting_value`,`admin_s`.`setting_value`,`sd`.`default_value`) AS `effective_value`, CASE WHEN `us`.`setting_value` is not null THEN 'user' WHEN `admin_s`.`setting_value` is not null THEN 'admin' ELSE 'default' END AS `value_source`, `us`.`user_id` AS `user_id`, `sd`.`is_user_configurable` AS `is_user_configurable`, `sd`.`validation_rules` AS `validation_rules`, `sd`.`ID` AS `setting_definition_id`, `us`.`updated_at` AS `user_setting_updated_at`, `admin_s`.`updated_at` AS `admin_setting_updated_at` FROM (((`sd_settings_definition` `sd` join `sd_settings_category` `sc` on(`sd`.`category_id` = `sc`.`ID`)) left join `sd_settings_admin` `admin_s` on(`sd`.`ID` = `admin_s`.`setting_definition_id`)) left join `sd_settings_user` `us` on(`sd`.`ID` = `us`.`setting_definition_id`)) WHERE `sd`.`is_active` = 1 AND `sc`.`is_active` = 1 ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `sd_admin_auth_modes`
--
ALTER TABLE `sd_admin_auth_modes`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `sd_admin_branding_settings`
--
ALTER TABLE `sd_admin_branding_settings`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `sd_admin_mt_userdb_id` (`sd_admin_mt_userdb_id`),
  ADD KEY `sd_admin_branding_settings_sd_admin_mt_userdb_id` (`sd_admin_mt_userdb_id`);

--
-- Indexes for table `sd_admin_mail`
--
ALTER TABLE `sd_admin_mail`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `sd_admin_menu`
--
ALTER TABLE `sd_admin_menu`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `parent_id` (`parent_id`);

--
-- Indexes for table `sd_admin_mt_role`
--
ALTER TABLE `sd_admin_mt_role`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `sd_admin_mt_userdb`
--
ALTER TABLE `sd_admin_mt_userdb`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `sd_admin_mt_user_role`
--
ALTER TABLE `sd_admin_mt_user_role`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `sd_admin_mt_user_role_sd_mt_role_id_sd_mt_userdb_id_unique` (`sd_mt_userdb_id`,`sd_mt_role_id`),
  ADD KEY `sd_mt_role_id` (`sd_mt_role_id`);

--
-- Indexes for table `sd_api_keys`
--
ALTER TABLE `sd_api_keys`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `key` (`key`),
  ADD UNIQUE KEY `key_2` (`key`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `sd_api_key_stores`
--
ALTER TABLE `sd_api_key_stores`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `api_key_id` (`api_key_id`),
  ADD KEY `chatbot_id` (`chatbot_id`);

--
-- Indexes for table `sd_audit_log`
--
ALTER TABLE `sd_audit_log`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `auth_method_id` (`auth_method_id`),
  ADD KEY `sd_admin_mt_userdb_id` (`sd_admin_mt_userdb_id`);

--
-- Indexes for table `sd_chatbots`
--
ALTER TABLE `sd_chatbots`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `sd_chatbot_feedback`
--
ALTER TABLE `sd_chatbot_feedback`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `chatbot_id` (`chatbot_id`),
  ADD KEY `question_id` (`question_id`),
  ADD KEY `session_id` (`session_id`);

--
-- Indexes for table `sd_chatbot_metrics`
--
ALTER TABLE `sd_chatbot_metrics`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `chatbot_id` (`chatbot_id`);

--
-- Indexes for table `sd_chatbot_pdfs`
--
ALTER TABLE `sd_chatbot_pdfs`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `chatbot_id` (`chatbot_id`);

--
-- Indexes for table `sd_chatbot_questions`
--
ALTER TABLE `sd_chatbot_questions`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `chatbot_id` (`chatbot_id`),
  ADD KEY `session_id` (`session_id`);

--
-- Indexes for table `sd_chatbot_sessions`
--
ALTER TABLE `sd_chatbot_sessions`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `chatbot_id` (`chatbot_id`);

--
-- Indexes for table `sd_chatbot_trees`
--
ALTER TABLE `sd_chatbot_trees`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `chatbot_id` (`chatbot_id`),
  ADD KEY `parent_id` (`parent_id`);

--
-- Indexes for table `sd_chatbot_web`
--
ALTER TABLE `sd_chatbot_web`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `chatbot_id` (`chatbot_id`);

--
-- Indexes for table `sd_chatbot_weblinks`
--
ALTER TABLE `sd_chatbot_weblinks`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `weburl_id` (`weburl_id`);

--
-- Indexes for table `sd_contacts`
--
ALTER TABLE `sd_contacts`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `sd_admin_mt_userdb_id` (`sd_admin_mt_userdb_id`),
  ADD KEY `contact_userdb_id` (`contact_userdb_id`);

--
-- Indexes for table `sd_help_category`
--
ALTER TABLE `sd_help_category`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `sd_help_knowledge_base`
--
ALTER TABLE `sd_help_knowledge_base`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `sd_admin_mt_userdb_id` (`sd_admin_mt_userdb_id`),
  ADD KEY `category_id` (`category_id`);

--
-- Indexes for table `sd_help_rating`
--
ALTER TABLE `sd_help_rating`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `sd_help_knowledge_id` (`sd_help_knowledge_id`);

--
-- Indexes for table `sd_help_view`
--
ALTER TABLE `sd_help_view`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `sd_help_knowledge_id` (`sd_help_knowledge_id`);

--
-- Indexes for table `sd_notifications`
--
ALTER TABLE `sd_notifications`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `chatbot_id` (`chatbot_id`);

--
-- Indexes for table `sd_payment`
--
ALTER TABLE `sd_payment`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `sd_project`
--
ALTER TABLE `sd_project`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sd_project_callback`
--
ALTER TABLE `sd_project_callback`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `sd_project_id` (`sd_project_id`);

--
-- Indexes for table `sd_project_ip`
--
ALTER TABLE `sd_project_ip`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `sd_project_id` (`sd_project_id`);

--
-- Indexes for table `sd_project_user`
--
ALTER TABLE `sd_project_user`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `sd_project_user_sd_project_id_sd_mt_userdb_id_unique` (`sd_project_id`,`sd_mt_userdb_id`),
  ADD KEY `sd_mt_userdb_id` (`sd_mt_userdb_id`);

--
-- Indexes for table `sd_qna_chatbot`
--
ALTER TABLE `sd_qna_chatbot`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `chatbot_id` (`chatbot_id`);

--
-- Indexes for table `sd_settings_admin`
--
ALTER TABLE `sd_settings_admin`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `setting_definition_id` (`setting_definition_id`),
  ADD KEY `sd_settings_admin_setting_definition_id` (`setting_definition_id`);

--
-- Indexes for table `sd_settings_category`
--
ALTER TABLE `sd_settings_category`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `name` (`name`),
  ADD UNIQUE KEY `name_2` (`name`),
  ADD UNIQUE KEY `name_3` (`name`),
  ADD UNIQUE KEY `name_4` (`name`),
  ADD UNIQUE KEY `name_5` (`name`),
  ADD UNIQUE KEY `name_6` (`name`),
  ADD UNIQUE KEY `name_7` (`name`),
  ADD UNIQUE KEY `name_8` (`name`);

--
-- Indexes for table `sd_settings_definition`
--
ALTER TABLE `sd_settings_definition`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `setting_key` (`setting_key`),
  ADD UNIQUE KEY `setting_key_2` (`setting_key`),
  ADD UNIQUE KEY `setting_key_3` (`setting_key`),
  ADD UNIQUE KEY `setting_key_4` (`setting_key`),
  ADD UNIQUE KEY `setting_key_5` (`setting_key`),
  ADD UNIQUE KEY `setting_key_6` (`setting_key`),
  ADD UNIQUE KEY `setting_key_7` (`setting_key`),
  ADD UNIQUE KEY `setting_key_8` (`setting_key`),
  ADD KEY `sd_settings_definition_setting_key` (`setting_key`),
  ADD KEY `sd_settings_definition_category_id_is_user_configurable` (`category_id`,`is_user_configurable`);

--
-- Indexes for table `sd_settings_user`
--
ALTER TABLE `sd_settings_user`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `sd_settings_user_user_id_setting_definition_id` (`user_id`,`setting_definition_id`),
  ADD KEY `sd_settings_user_user_id` (`user_id`),
  ADD KEY `setting_definition_id` (`setting_definition_id`);

--
-- Indexes for table `sd_sub_feature`
--
ALTER TABLE `sd_sub_feature`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `name` (`name`),
  ADD UNIQUE KEY `slug` (`slug`),
  ADD UNIQUE KEY `name_2` (`name`),
  ADD UNIQUE KEY `slug_2` (`slug`),
  ADD UNIQUE KEY `name_3` (`name`),
  ADD UNIQUE KEY `slug_3` (`slug`),
  ADD UNIQUE KEY `name_4` (`name`),
  ADD UNIQUE KEY `slug_4` (`slug`),
  ADD UNIQUE KEY `name_5` (`name`),
  ADD UNIQUE KEY `slug_5` (`slug`),
  ADD UNIQUE KEY `name_6` (`name`),
  ADD UNIQUE KEY `slug_6` (`slug`),
  ADD UNIQUE KEY `name_7` (`name`),
  ADD UNIQUE KEY `slug_7` (`slug`),
  ADD UNIQUE KEY `name_8` (`name`),
  ADD UNIQUE KEY `slug_8` (`slug`),
  ADD KEY `sd_sub_feature_slug` (`slug`),
  ADD KEY `sd_sub_feature_category` (`category`);

--
-- Indexes for table `sd_sub_plan`
--
ALTER TABLE `sd_sub_plan`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `name` (`name`),
  ADD UNIQUE KEY `slug` (`slug`),
  ADD UNIQUE KEY `name_2` (`name`),
  ADD UNIQUE KEY `slug_2` (`slug`),
  ADD UNIQUE KEY `name_3` (`name`),
  ADD UNIQUE KEY `slug_3` (`slug`),
  ADD UNIQUE KEY `name_4` (`name`),
  ADD UNIQUE KEY `slug_4` (`slug`),
  ADD UNIQUE KEY `name_5` (`name`),
  ADD UNIQUE KEY `slug_5` (`slug`),
  ADD UNIQUE KEY `name_6` (`name`),
  ADD UNIQUE KEY `slug_6` (`slug`),
  ADD UNIQUE KEY `name_7` (`name`),
  ADD UNIQUE KEY `slug_7` (`slug`),
  ADD UNIQUE KEY `name_8` (`name`),
  ADD UNIQUE KEY `slug_8` (`slug`),
  ADD KEY `sd_sub_plan_slug` (`slug`),
  ADD KEY `sd_sub_plan_is_active` (`isActive`);

--
-- Indexes for table `sd_sub_plan_feature`
--
ALTER TABLE `sd_sub_plan_feature`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `sd_sub_plan_feature_sd_sub_feature_id_sd_sub_plan_id_unique` (`sd_sub_plan_id`,`sd_sub_feature_id`),
  ADD UNIQUE KEY `sd_sub_plan_feature_sd_sub_plan_id_sd_sub_feature_id` (`sd_sub_plan_id`,`sd_sub_feature_id`),
  ADD KEY `sd_sub_plan_feature_sd_sub_plan_id` (`sd_sub_plan_id`),
  ADD KEY `sd_sub_plan_feature_sd_sub_feature_id` (`sd_sub_feature_id`);

--
-- Indexes for table `sd_sub_subscription`
--
ALTER TABLE `sd_sub_subscription`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `sd_sub_subscription_sd_admin_mt_userdb_id` (`sd_admin_mt_userdb_id`),
  ADD KEY `sd_sub_subscription_sd_sub_plan_id` (`sd_sub_plan_id`),
  ADD KEY `sd_sub_subscription_status` (`status`),
  ADD KEY `sd_sub_subscription_stripe_subscription_id` (`stripeSubscriptionId`),
  ADD KEY `sd_sub_subscription_current_period_end` (`currentPeriodEnd`);

--
-- Indexes for table `sd_sub_usage_tracking`
--
ALTER TABLE `sd_sub_usage_tracking`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `sd_sub_usage_tracking_sd_admin_mt_userdb_id` (`sd_admin_mt_userdb_id`),
  ADD KEY `sd_sub_usage_tracking_feature_slug` (`featureSlug`),
  ADD KEY `sd_sub_usage_tracking_period_end` (`periodEnd`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `sd_admin_auth_modes`
--
ALTER TABLE `sd_admin_auth_modes`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sd_admin_branding_settings`
--
ALTER TABLE `sd_admin_branding_settings`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sd_admin_mail`
--
ALTER TABLE `sd_admin_mail`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sd_admin_menu`
--
ALTER TABLE `sd_admin_menu`
  MODIFY `ID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sd_admin_mt_role`
--
ALTER TABLE `sd_admin_mt_role`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sd_admin_mt_userdb`
--
ALTER TABLE `sd_admin_mt_userdb`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sd_admin_mt_user_role`
--
ALTER TABLE `sd_admin_mt_user_role`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sd_api_keys`
--
ALTER TABLE `sd_api_keys`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sd_api_key_stores`
--
ALTER TABLE `sd_api_key_stores`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sd_audit_log`
--
ALTER TABLE `sd_audit_log`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sd_chatbots`
--
ALTER TABLE `sd_chatbots`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sd_chatbot_feedback`
--
ALTER TABLE `sd_chatbot_feedback`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sd_chatbot_metrics`
--
ALTER TABLE `sd_chatbot_metrics`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sd_chatbot_pdfs`
--
ALTER TABLE `sd_chatbot_pdfs`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sd_chatbot_questions`
--
ALTER TABLE `sd_chatbot_questions`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sd_chatbot_sessions`
--
ALTER TABLE `sd_chatbot_sessions`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sd_chatbot_trees`
--
ALTER TABLE `sd_chatbot_trees`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sd_chatbot_web`
--
ALTER TABLE `sd_chatbot_web`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sd_chatbot_weblinks`
--
ALTER TABLE `sd_chatbot_weblinks`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sd_contacts`
--
ALTER TABLE `sd_contacts`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sd_help_category`
--
ALTER TABLE `sd_help_category`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sd_help_knowledge_base`
--
ALTER TABLE `sd_help_knowledge_base`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sd_help_rating`
--
ALTER TABLE `sd_help_rating`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sd_help_view`
--
ALTER TABLE `sd_help_view`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sd_notifications`
--
ALTER TABLE `sd_notifications`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sd_payment`
--
ALTER TABLE `sd_payment`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sd_project`
--
ALTER TABLE `sd_project`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sd_project_callback`
--
ALTER TABLE `sd_project_callback`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sd_project_ip`
--
ALTER TABLE `sd_project_ip`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sd_project_user`
--
ALTER TABLE `sd_project_user`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sd_qna_chatbot`
--
ALTER TABLE `sd_qna_chatbot`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sd_settings_admin`
--
ALTER TABLE `sd_settings_admin`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sd_settings_category`
--
ALTER TABLE `sd_settings_category`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sd_settings_definition`
--
ALTER TABLE `sd_settings_definition`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sd_settings_user`
--
ALTER TABLE `sd_settings_user`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sd_sub_feature`
--
ALTER TABLE `sd_sub_feature`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sd_sub_plan`
--
ALTER TABLE `sd_sub_plan`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sd_sub_plan_feature`
--
ALTER TABLE `sd_sub_plan_feature`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sd_sub_subscription`
--
ALTER TABLE `sd_sub_subscription`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sd_sub_usage_tracking`
--
ALTER TABLE `sd_sub_usage_tracking`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `sd_admin_branding_settings`
--
ALTER TABLE `sd_admin_branding_settings`
  ADD CONSTRAINT `sd_admin_branding_settings_ibfk_1` FOREIGN KEY (`sd_admin_mt_userdb_id`) REFERENCES `sd_admin_mt_userdb` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `sd_admin_menu`
--
ALTER TABLE `sd_admin_menu`
  ADD CONSTRAINT `sd_admin_menu_ibfk_1` FOREIGN KEY (`parent_id`) REFERENCES `sd_admin_menu` (`ID`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `sd_admin_mt_user_role`
--
ALTER TABLE `sd_admin_mt_user_role`
  ADD CONSTRAINT `sd_admin_mt_user_role_ibfk_15` FOREIGN KEY (`sd_mt_userdb_id`) REFERENCES `sd_admin_mt_userdb` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `sd_admin_mt_user_role_ibfk_16` FOREIGN KEY (`sd_mt_role_id`) REFERENCES `sd_admin_mt_role` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `sd_api_keys`
--
ALTER TABLE `sd_api_keys`
  ADD CONSTRAINT `sd_api_keys_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `sd_admin_mt_userdb` (`ID`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `sd_api_key_stores`
--
ALTER TABLE `sd_api_key_stores`
  ADD CONSTRAINT `sd_api_key_stores_ibfk_3` FOREIGN KEY (`api_key_id`) REFERENCES `sd_api_keys` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `sd_api_key_stores_ibfk_4` FOREIGN KEY (`chatbot_id`) REFERENCES `sd_chatbots` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `sd_audit_log`
--
ALTER TABLE `sd_audit_log`
  ADD CONSTRAINT `sd_audit_log_ibfk_12` FOREIGN KEY (`auth_method_id`) REFERENCES `sd_admin_mt_role` (`ID`),
  ADD CONSTRAINT `sd_audit_log_ibfk_13` FOREIGN KEY (`sd_admin_mt_userdb_id`) REFERENCES `sd_admin_mt_userdb` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `sd_chatbots`
--
ALTER TABLE `sd_chatbots`
  ADD CONSTRAINT `sd_chatbots_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `sd_admin_mt_userdb` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `sd_chatbot_feedback`
--
ALTER TABLE `sd_chatbot_feedback`
  ADD CONSTRAINT `sd_chatbot_feedback_ibfk_29` FOREIGN KEY (`user_id`) REFERENCES `sd_admin_mt_userdb` (`ID`),
  ADD CONSTRAINT `sd_chatbot_feedback_ibfk_30` FOREIGN KEY (`chatbot_id`) REFERENCES `sd_chatbots` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `sd_chatbot_feedback_ibfk_31` FOREIGN KEY (`question_id`) REFERENCES `sd_chatbot_questions` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `sd_chatbot_feedback_ibfk_32` FOREIGN KEY (`session_id`) REFERENCES `sd_chatbot_sessions` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `sd_chatbot_metrics`
--
ALTER TABLE `sd_chatbot_metrics`
  ADD CONSTRAINT `sd_chatbot_metrics_ibfk_1` FOREIGN KEY (`chatbot_id`) REFERENCES `sd_chatbots` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `sd_chatbot_pdfs`
--
ALTER TABLE `sd_chatbot_pdfs`
  ADD CONSTRAINT `sd_chatbot_pdfs_ibfk_1` FOREIGN KEY (`chatbot_id`) REFERENCES `sd_chatbots` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `sd_chatbot_questions`
--
ALTER TABLE `sd_chatbot_questions`
  ADD CONSTRAINT `sd_chatbot_questions_ibfk_15` FOREIGN KEY (`chatbot_id`) REFERENCES `sd_chatbots` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `sd_chatbot_questions_ibfk_16` FOREIGN KEY (`session_id`) REFERENCES `sd_chatbot_sessions` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `sd_chatbot_sessions`
--
ALTER TABLE `sd_chatbot_sessions`
  ADD CONSTRAINT `sd_chatbot_sessions_ibfk_15` FOREIGN KEY (`user_id`) REFERENCES `sd_admin_mt_userdb` (`ID`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `sd_chatbot_sessions_ibfk_16` FOREIGN KEY (`chatbot_id`) REFERENCES `sd_chatbots` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `sd_chatbot_trees`
--
ALTER TABLE `sd_chatbot_trees`
  ADD CONSTRAINT `sd_chatbot_trees_ibfk_3` FOREIGN KEY (`chatbot_id`) REFERENCES `sd_chatbots` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `sd_chatbot_trees_ibfk_4` FOREIGN KEY (`parent_id`) REFERENCES `sd_chatbot_trees` (`ID`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `sd_chatbot_web`
--
ALTER TABLE `sd_chatbot_web`
  ADD CONSTRAINT `sd_chatbot_web_ibfk_1` FOREIGN KEY (`chatbot_id`) REFERENCES `sd_chatbots` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `sd_chatbot_weblinks`
--
ALTER TABLE `sd_chatbot_weblinks`
  ADD CONSTRAINT `sd_chatbot_weblinks_ibfk_1` FOREIGN KEY (`weburl_id`) REFERENCES `sd_chatbot_web` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `sd_contacts`
--
ALTER TABLE `sd_contacts`
  ADD CONSTRAINT `sd_contacts_ibfk_1` FOREIGN KEY (`sd_admin_mt_userdb_id`) REFERENCES `sd_admin_mt_userdb` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `sd_contacts_ibfk_2` FOREIGN KEY (`contact_userdb_id`) REFERENCES `sd_admin_mt_userdb` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `sd_help_category`
--
ALTER TABLE `sd_help_category`
  ADD CONSTRAINT `sd_help_category_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `sd_admin_mt_userdb` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `sd_help_knowledge_base`
--
ALTER TABLE `sd_help_knowledge_base`
  ADD CONSTRAINT `sd_help_knowledge_base_ibfk_15` FOREIGN KEY (`sd_admin_mt_userdb_id`) REFERENCES `sd_admin_mt_userdb` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `sd_help_knowledge_base_ibfk_16` FOREIGN KEY (`category_id`) REFERENCES `sd_help_category` (`ID`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `sd_help_rating`
--
ALTER TABLE `sd_help_rating`
  ADD CONSTRAINT `sd_help_rating_ibfk_15` FOREIGN KEY (`user_id`) REFERENCES `sd_admin_mt_userdb` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `sd_help_rating_ibfk_16` FOREIGN KEY (`sd_help_knowledge_id`) REFERENCES `sd_help_knowledge_base` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `sd_help_view`
--
ALTER TABLE `sd_help_view`
  ADD CONSTRAINT `sd_help_view_ibfk_15` FOREIGN KEY (`user_id`) REFERENCES `sd_admin_mt_userdb` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `sd_help_view_ibfk_16` FOREIGN KEY (`sd_help_knowledge_id`) REFERENCES `sd_help_knowledge_base` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `sd_notifications`
--
ALTER TABLE `sd_notifications`
  ADD CONSTRAINT `sd_notifications_ibfk_3` FOREIGN KEY (`user_id`) REFERENCES `sd_admin_mt_userdb` (`ID`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `sd_notifications_ibfk_4` FOREIGN KEY (`chatbot_id`) REFERENCES `sd_chatbots` (`ID`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `sd_project_callback`
--
ALTER TABLE `sd_project_callback`
  ADD CONSTRAINT `sd_project_callback_ibfk_1` FOREIGN KEY (`sd_project_id`) REFERENCES `sd_project` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `sd_project_ip`
--
ALTER TABLE `sd_project_ip`
  ADD CONSTRAINT `sd_project_ip_ibfk_1` FOREIGN KEY (`sd_project_id`) REFERENCES `sd_project` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `sd_project_user`
--
ALTER TABLE `sd_project_user`
  ADD CONSTRAINT `sd_project_user_ibfk_15` FOREIGN KEY (`sd_project_id`) REFERENCES `sd_project` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `sd_project_user_ibfk_16` FOREIGN KEY (`sd_mt_userdb_id`) REFERENCES `sd_admin_mt_userdb` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `sd_qna_chatbot`
--
ALTER TABLE `sd_qna_chatbot`
  ADD CONSTRAINT `sd_qna_chatbot_ibfk_1` FOREIGN KEY (`chatbot_id`) REFERENCES `sd_chatbots` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `sd_settings_admin`
--
ALTER TABLE `sd_settings_admin`
  ADD CONSTRAINT `sd_settings_admin_ibfk_1` FOREIGN KEY (`setting_definition_id`) REFERENCES `sd_settings_definition` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `sd_settings_definition`
--
ALTER TABLE `sd_settings_definition`
  ADD CONSTRAINT `sd_settings_definition_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `sd_settings_category` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `sd_settings_user`
--
ALTER TABLE `sd_settings_user`
  ADD CONSTRAINT `sd_settings_user_ibfk_15` FOREIGN KEY (`user_id`) REFERENCES `sd_admin_mt_userdb` (`ID`),
  ADD CONSTRAINT `sd_settings_user_ibfk_16` FOREIGN KEY (`setting_definition_id`) REFERENCES `sd_settings_definition` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `sd_sub_plan_feature`
--
ALTER TABLE `sd_sub_plan_feature`
  ADD CONSTRAINT `sd_sub_plan_feature_ibfk_15` FOREIGN KEY (`sd_sub_plan_id`) REFERENCES `sd_sub_plan` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `sd_sub_plan_feature_ibfk_16` FOREIGN KEY (`sd_sub_feature_id`) REFERENCES `sd_sub_feature` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `sd_sub_subscription`
--
ALTER TABLE `sd_sub_subscription`
  ADD CONSTRAINT `sd_sub_subscription_ibfk_1` FOREIGN KEY (`sd_admin_mt_userdb_id`) REFERENCES `sd_admin_mt_userdb` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `sd_sub_subscription_ibfk_2` FOREIGN KEY (`sd_sub_plan_id`) REFERENCES `sd_sub_plan` (`ID`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `sd_sub_subscription_ibfk_3` FOREIGN KEY (`sd_admin_mt_userdb_id`) REFERENCES `sd_admin_mt_userdb` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `sd_sub_subscription_ibfk_4` FOREIGN KEY (`sd_sub_plan_id`) REFERENCES `sd_sub_plan` (`ID`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `sd_sub_usage_tracking`
--
ALTER TABLE `sd_sub_usage_tracking`
  ADD CONSTRAINT `sd_sub_usage_tracking_ibfk_1` FOREIGN KEY (`sd_admin_mt_userdb_id`) REFERENCES `sd_admin_mt_userdb` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE;
--
-- Database: `sds_crop`
--
CREATE DATABASE IF NOT EXISTS `sds_crop` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_uca1400_ai_ci;
USE `sds_crop`;

-- --------------------------------------------------------

--
-- Table structure for table `sd_admin_holidays`
--

CREATE TABLE `sd_admin_holidays` (
  `ID` int(11) NOT NULL,
  `state_name` varchar(1000) NOT NULL,
  `holiday_date` date NOT NULL,
  `holiday_name` text NOT NULL,
  `created_by` varchar(255) DEFAULT NULL,
  `created_time` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=MyISAM DEFAULT CHARSET=utf16 COLLATE=utf16_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sd_admin_interest`
--

CREATE TABLE `sd_admin_interest` (
  `ID` int(11) NOT NULL,
  `interest_name` varchar(1000) NOT NULL,
  `created_by` varchar(255) DEFAULT NULL,
  `created_time` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=MyISAM DEFAULT CHARSET=utf16 COLLATE=utf16_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sd_admin_loyalty`
--

CREATE TABLE `sd_admin_loyalty` (
  `ID` int(11) NOT NULL,
  `loyalty_name` varchar(1000) NOT NULL,
  `created_by` varchar(255) DEFAULT NULL,
  `created_time` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=MyISAM DEFAULT CHARSET=utf16 COLLATE=utf16_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sd_admin_notification_type`
--

CREATE TABLE `sd_admin_notification_type` (
  `ID` int(5) NOT NULL,
  `type` varchar(25) NOT NULL,
  `description` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf16 COLLATE=utf16_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sd_admin_sector`
--

CREATE TABLE `sd_admin_sector` (
  `ID` int(11) NOT NULL,
  `sector_name` varchar(255) NOT NULL,
  `purchase_image` longtext NOT NULL,
  `redumption_image` longtext NOT NULL,
  `gst_sector` int(11) NOT NULL,
  `created_by` varchar(255) DEFAULT NULL,
  `created_time` datetime DEFAULT NULL,
  `updated_by` varchar(255) DEFAULT NULL,
  `update_time` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `pickup_delivery` enum('Yes','No') NOT NULL,
  `operating_hours` enum('Yes','No') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf16 COLLATE=utf16_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sd_admin_service`
--

CREATE TABLE `sd_admin_service` (
  `ID` int(11) NOT NULL,
  `sd_mt_business_id` int(11) NOT NULL,
  `service_value` float NOT NULL,
  `last_modified_by` int(11) NOT NULL,
  `last_modified_time` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf16 COLLATE=utf16_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sd_bluedays`
--

CREATE TABLE `sd_bluedays` (
  `ID` int(11) NOT NULL,
  `sd_mt_userdb_id` int(11) NOT NULL,
  `day_type` enum('WEEKDAY','HOLIDAY_ALL','ALL','HOLIDAY_ONE') NOT NULL,
  `day_number` int(11) NOT NULL DEFAULT 0,
  `sd_admin_holidays_id` int(11) NOT NULL DEFAULT 0,
  `open_close` int(11) NOT NULL DEFAULT 0,
  `last_modified_time` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf16 COLLATE=utf16_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sd_business_variant`
--

CREATE TABLE `sd_business_variant` (
  `ID` int(11) NOT NULL,
  `sd_mt_userdb_id` int(11) NOT NULL,
  `variant_group` varchar(255) NOT NULL,
  `variant_group_index` varchar(255) DEFAULT NULL,
  `variant_name` varchar(255) NOT NULL,
  `variant_index` varchar(255) DEFAULT NULL,
  `last_modified_time` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf16 COLLATE=utf16_general_ci COMMENT='To store variants added by individual user';

-- --------------------------------------------------------

--
-- Table structure for table `sd_business_variant_default`
--

CREATE TABLE `sd_business_variant_default` (
  `ID` int(11) NOT NULL,
  `sd_mt_userdb_id` int(11) NOT NULL,
  `sd_admin_sector_id` int(11) NOT NULL,
  `variant_group` varchar(255) NOT NULL,
  `variant_name` varchar(255) NOT NULL,
  `variant_group_index` varchar(255) DEFAULT NULL,
  `variant_index` varchar(255) DEFAULT NULL,
  `last_modified_time` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf16 COLLATE=utf16_general_ci COMMENT='To store variants added by individual user';

-- --------------------------------------------------------

--
-- Table structure for table `sd_complaint`
--

CREATE TABLE `sd_complaint` (
  `ID` int(11) NOT NULL,
  `type` enum('COMPLAINT','REQUEST') NOT NULL,
  `complaint_id` varchar(50) DEFAULT NULL,
  `complaint_type` varchar(255) NOT NULL,
  `complaint_mode` enum('BUSINESS','CUSTOMER') NOT NULL DEFAULT 'CUSTOMER',
  `complaint_description` text NOT NULL,
  `complaint_number` varchar(255) DEFAULT NULL,
  `complaint_created_by` int(11) NOT NULL DEFAULT 0,
  `complaint_date` datetime NOT NULL,
  `complaint_pcm` varchar(25) NOT NULL,
  `complaint_status` enum('OPEN','PROGRESS','CLOSED') NOT NULL DEFAULT 'OPEN',
  `complaint_resolution` text DEFAULT NULL,
  `complaint_resolved_by` int(11) NOT NULL DEFAULT 0,
  `complaint_action_date` date DEFAULT NULL,
  `last_modified_time` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf16 COLLATE=utf16_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sd_const`
--

CREATE TABLE `sd_const` (
  `ID` int(3) NOT NULL,
  `type` varchar(50) DEFAULT NULL,
  `pid` varchar(50) DEFAULT NULL,
  `pval` varchar(255) NOT NULL,
  `request_name` varchar(255) DEFAULT NULL,
  `resolution_name` varchar(255) DEFAULT NULL,
  `admin_name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf16 COLLATE=utf16_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sd_crop_balance`
--

CREATE TABLE `sd_crop_balance` (
  `ID` bigint(20) NOT NULL,
  `sd_mt_userdb_id` int(10) NOT NULL COMMENT 'CROP ID of the user',
  `sd_transaction_type` enum('CREDIT','DEBIT') NOT NULL COMMENT 'Transaction Type : CREDIT / DEBIT',
  `sd_crop_type` varchar(255) NOT NULL,
  `sd_crop_points` float NOT NULL,
  `sd_amount_aud` float NOT NULL DEFAULT 0,
  `sd_gst_value` float NOT NULL DEFAULT 0,
  `sd_transaction_id` int(11) NOT NULL,
  `sd_created_by` int(11) NOT NULL,
  `sd_last_modified_time` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf16 COLLATE=utf16_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sd_custmer_audit`
--

CREATE TABLE `sd_custmer_audit` (
  `ID` bigint(20) NOT NULL,
  `sd_mt_userdb_id` int(11) NOT NULL,
  `message` text NOT NULL,
  `last_modified_time` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf16 COLLATE=utf16_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sd_feedback`
--

CREATE TABLE `sd_feedback` (
  `ID` bigint(20) NOT NULL,
  `sd_mt_userdb_id` int(11) NOT NULL,
  `feedback_value` longtext NOT NULL,
  `feedback_remark` longtext DEFAULT NULL,
  `created_time` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf16 COLLATE=utf16_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sd_get_mate`
--

CREATE TABLE `sd_get_mate` (
  `ID` int(11) NOT NULL,
  `sd_mt_userdb_id` int(11) NOT NULL,
  `country_code` varchar(4) DEFAULT NULL,
  `mobile_no` varchar(20) NOT NULL,
  `email_id` varchar(255) DEFAULT NULL,
  `promo_code` varchar(10) DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT 5,
  `created_time` datetime NOT NULL DEFAULT current_timestamp(),
  `last_modified_time` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `last_modified_by` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf16 COLLATE=utf16_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sd_invoice`
--

CREATE TABLE `sd_invoice` (
  `ID` bigint(20) NOT NULL,
  `type` varchar(255) NOT NULL COMMENT 'Invoice Type : ORDER, BID etc',
  `invoice_no` varchar(255) DEFAULT NULL,
  `user_type` varchar(11) NOT NULL,
  `sd_mt_userdb_id` int(11) NOT NULL,
  `transaction_id` int(11) NOT NULL,
  `created_date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf16 COLLATE=utf16_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sd_likes`
--

CREATE TABLE `sd_likes` (
  `ID` bigint(20) NOT NULL,
  `sd_offers_id` int(11) NOT NULL,
  `sd_mt_userdb_id` int(11) NOT NULL,
  `last_modified_time` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf16 COLLATE=utf16_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sd_loyalty_interest`
--

CREATE TABLE `sd_loyalty_interest` (
  `ID` bigint(20) NOT NULL,
  `sd_mt_userdb_id` int(11) NOT NULL,
  `loyalty_interest_id` int(11) NOT NULL,
  `type` enum('LOYALTY','INTEREST') NOT NULL,
  `created_time` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf16 COLLATE=utf16_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sd_market_offers`
--

CREATE TABLE `sd_market_offers` (
  `ID` bigint(20) NOT NULL,
  `sd_mt_userdb_id` int(10) NOT NULL,
  `sd_offers_id` int(10) NOT NULL,
  `bid_number` varchar(255) DEFAULT NULL,
  `top_ranking` enum('Yes','No') NOT NULL,
  `promos` enum('Yes','No') NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `base_bid_week` float NOT NULL,
  `base_bid_weekend` float NOT NULL,
  `base_bid_holiday` float NOT NULL,
  `base_bid_price` float NOT NULL,
  `bid_price` float NOT NULL,
  `timeszone` varchar(255) DEFAULT NULL,
  `bid_gst` float NOT NULL DEFAULT 0,
  `bid_total` float NOT NULL DEFAULT 0,
  `refund_amount` float DEFAULT NULL,
  `created_time` datetime NOT NULL DEFAULT current_timestamp(),
  `bid_status` int(3) NOT NULL,
  `bid_qualified_time` datetime DEFAULT NULL,
  `payment_intent` text DEFAULT NULL,
  `payment_client` text DEFAULT NULL,
  `payment_intent_info` text DEFAULT NULL,
  `payment_response` text DEFAULT NULL,
  `payment_status` varchar(255) DEFAULT NULL,
  `payment_mode` varchar(255) DEFAULT NULL,
  `payment_date` datetime DEFAULT current_timestamp(),
  `last_modified_time` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf16 COLLATE=utf16_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sd_market_publish_order`
--

CREATE TABLE `sd_market_publish_order` (
  `ID` bigint(20) NOT NULL,
  `sd_offers_id` int(11) NOT NULL,
  `sd_market_offers_id` int(11) NOT NULL,
  `publish_order` int(11) NOT NULL,
  `publish_date` datetime NOT NULL,
  `top_ranking` enum('Yes','No') NOT NULL,
  `promos` enum('Yes','No') NOT NULL,
  `created_time` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf16 COLLATE=utf16_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sd_missing_crops`
--

CREATE TABLE `sd_missing_crops` (
  `ID` int(11) NOT NULL,
  `sd_mt_userdb_id` int(11) NOT NULL,
  `request_id` varchar(25) DEFAULT NULL,
  `status` int(11) NOT NULL,
  `invoice_number` varchar(255) NOT NULL,
  `invoice_date` date NOT NULL,
  `invoice_image` longtext NOT NULL,
  `invoice_image_type` varchar(50) DEFAULT NULL,
  `invoice_amt` float DEFAULT NULL,
  `reason_missing` text NOT NULL,
  `business_id` int(11) NOT NULL,
  `updated_by` int(11) NOT NULL DEFAULT 0,
  `update_remarks` text DEFAULT NULL,
  `last_modified_time` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf16 COLLATE=utf16_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sd_mt_userdb`
--

CREATE TABLE `sd_mt_userdb` (
  `ID` int(11) NOT NULL,
  `user_type` int(11) NOT NULL DEFAULT 5,
  `crop_id` varchar(255) DEFAULT NULL,
  `crop_balance` float NOT NULL DEFAULT 0,
  `email_id` varchar(255) NOT NULL,
  `mobile_no` varchar(255) NOT NULL,
  `country_code` varchar(3) NOT NULL,
  `epassword` varchar(1000) DEFAULT NULL,
  `emobile_pin` varchar(1000) NOT NULL,
  `first_name` varchar(255) NOT NULL,
  `middle_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `user_name` varchar(255) NOT NULL,
  `gender` varchar(50) DEFAULT NULL,
  `age_group` int(11) NOT NULL DEFAULT 0 COMMENT '13-18, 19-25, 26-35, 36-45, 46-55 and over 55 Years',
  `age` date DEFAULT NULL,
  `business_owner` varchar(255) DEFAULT NULL,
  `abn_mo` varchar(255) DEFAULT NULL,
  `business_name` varchar(255) DEFAULT NULL,
  `sd_admin_sector_id` int(11) NOT NULL DEFAULT 0,
  `brand_logo` text DEFAULT NULL,
  `promo_code_status` enum('Yes','No') DEFAULT 'No',
  `promo_code` varchar(255) DEFAULT NULL,
  `last_login_time` datetime DEFAULT NULL,
  `last_login_ip` varchar(255) DEFAULT NULL,
  `last_reset_time` datetime DEFAULT NULL,
  `change_pass` int(11) NOT NULL DEFAULT 0,
  `created_time` datetime NOT NULL,
  `created_by` varchar(255) NOT NULL,
  `active_status` int(11) NOT NULL DEFAULT 0,
  `profile_image` longtext DEFAULT NULL,
  `failed_attempts` int(11) NOT NULL DEFAULT 0,
  `marketting` enum('Yes','No') NOT NULL DEFAULT 'No',
  `newsletter` enum('Yes','No') NOT NULL DEFAULT 'No',
  `terms_conditions` enum('Yes','No') NOT NULL DEFAULT 'No',
  `profile_update` int(11) NOT NULL DEFAULT 0,
  `crop_update` int(11) NOT NULL DEFAULT 0,
  `update_time` datetime DEFAULT NULL,
  `update_remarks` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf16 COLLATE=utf16_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sd_mt_userdb_delete`
--

CREATE TABLE `sd_mt_userdb_delete` (
  `ID` int(11) NOT NULL,
  `sd_mt_userdb_id` int(11) NOT NULL,
  `remarks` text DEFAULT NULL,
  `requested_time` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf16 COLLATE=utf16_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sd_mt_user_otp`
--

CREATE TABLE `sd_mt_user_otp` (
  `ID` int(11) NOT NULL,
  `otp_type` enum('EMAIL','MOBILE') NOT NULL,
  `country_code` varchar(5) NOT NULL DEFAULT '0',
  `mobile_no` varchar(50) DEFAULT NULL,
  `email_id` varchar(255) DEFAULT NULL,
  `otp_code_hash` varchar(255) NOT NULL,
  `otp_created_time` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf16 COLLATE=utf16_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sd_notification`
--

CREATE TABLE `sd_notification` (
  `ID` bigint(20) NOT NULL,
  `sd_mt_userdb_id` int(11) NOT NULL,
  `notification_user` varchar(255) DEFAULT NULL,
  `notification_type` varchar(50) NOT NULL,
  `notification_message` text NOT NULL,
  `notification_id` int(10) NOT NULL DEFAULT 0,
  `notification_date` datetime NOT NULL DEFAULT current_timestamp(),
  `notification_status` int(5) NOT NULL DEFAULT 1,
  `last_modified_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE current_timestamp(),
  `notification_updated_by` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf16 COLLATE=utf16_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sd_notification_links`
--

CREATE TABLE `sd_notification_links` (
  `ID` int(11) NOT NULL,
  `placeholder` varchar(255) NOT NULL,
  `text` varchar(255) NOT NULL,
  `routeweb` varchar(255) NOT NULL,
  `route` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf16 COLLATE=utf16_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sd_offers`
--

CREATE TABLE `sd_offers` (
  `ID` int(11) NOT NULL,
  `offer_title` varchar(1000) NOT NULL,
  `offer_code` varchar(255) DEFAULT NULL,
  `offer_breif` text DEFAULT NULL,
  `offer_desc` text DEFAULT NULL,
  `sd_admin_sector_id` int(11) NOT NULL DEFAULT 0,
  `price` float NOT NULL,
  `discount` float NOT NULL,
  `total_price` float NOT NULL DEFAULT 0,
  `brand` varchar(255) DEFAULT NULL,
  `variant_mode` int(11) NOT NULL DEFAULT 0,
  `earn_available` enum('Yes','No') NOT NULL,
  `earn_crop_points` float NOT NULL DEFAULT 0,
  `redeem_available` enum('Yes','No') NOT NULL,
  `redeem_crop_points` float NOT NULL DEFAULT 0,
  `gst_value` float NOT NULL DEFAULT 0,
  `offer_status` int(3) NOT NULL COMMENT 'active=5, inactive=1',
  `offer_likes` int(5) NOT NULL DEFAULT 0,
  `offer_ratings` float NOT NULL DEFAULT 0,
  `sd_mt_userdb_id` int(11) NOT NULL,
  `created_time` datetime NOT NULL,
  `last_modified_time` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf16 COLLATE=utf16_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sd_offers_direct`
--

CREATE TABLE `sd_offers_direct` (
  `ID` int(11) NOT NULL,
  `offer_title` varchar(1000) NOT NULL,
  `price` float NOT NULL,
  `sd_mt_userdb_id` int(11) NOT NULL,
  `sd_admin_sector_id` int(11) NOT NULL,
  `gst_value` float NOT NULL DEFAULT 0,
  `discount` float NOT NULL DEFAULT 0,
  `total_price` float NOT NULL DEFAULT 0,
  `earn_available` enum('Yes','No') NOT NULL,
  `earn_crop_points` float NOT NULL DEFAULT 0,
  `redeem_available` enum('Yes','No') NOT NULL,
  `redeem_crop_points` float NOT NULL DEFAULT 0,
  `created_time` datetime NOT NULL,
  `last_modified_time` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf16 COLLATE=utf16_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sd_offers_images`
--

CREATE TABLE `sd_offers_images` (
  `ID` int(11) NOT NULL,
  `sd_offers_id` int(11) NOT NULL,
  `product_image` varchar(255) NOT NULL,
  `image_type` varchar(255) DEFAULT NULL,
  `image_length` int(11) NOT NULL DEFAULT 0,
  `image_content` longtext DEFAULT NULL,
  `image_status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf16 COLLATE=utf16_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sd_offers_log`
--

CREATE TABLE `sd_offers_log` (
  `ID` bigint(20) NOT NULL,
  `offer_id` int(10) NOT NULL,
  `action` varchar(150) NOT NULL,
  `message` varchar(250) NOT NULL,
  `log_time` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf16 COLLATE=utf16_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sd_offers_variant`
--

CREATE TABLE `sd_offers_variant` (
  `ID` int(11) NOT NULL,
  `sd_offers_id` int(11) NOT NULL,
  `sd_business_variant_id` int(11) NOT NULL,
  `order_number` int(11) NOT NULL DEFAULT 0,
  `price` float NOT NULL DEFAULT 0,
  `option_check` int(11) NOT NULL DEFAULT 0,
  `last_modified_time` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf16 COLLATE=utf16_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sd_operating_hours`
--

CREATE TABLE `sd_operating_hours` (
  `ID` int(11) NOT NULL,
  `sd_mt_userdb_id` int(11) NOT NULL,
  `day_type` enum('WEEKDAY','HOLIDAY_ALL','ALL','HOLIDAY_ONE') NOT NULL,
  `day_number` int(11) NOT NULL DEFAULT 0,
  `sd_admin_holidays_id` int(11) NOT NULL DEFAULT 0,
  `open_close` int(11) NOT NULL DEFAULT 0,
  `all_checked` int(11) NOT NULL DEFAULT 0,
  `start_time` time NOT NULL,
  `end_time` time DEFAULT NULL,
  `last_modified_time` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf16 COLLATE=utf16_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sd_orders`
--

CREATE TABLE `sd_orders` (
  `ID` bigint(20) NOT NULL,
  `sd_mt_userdb_id` int(10) NOT NULL,
  `order_type` enum('EARN','REDEEM') NOT NULL,
  `order_number` varchar(255) DEFAULT NULL,
  `order_total_base` float DEFAULT NULL,
  `order_gst` float NOT NULL DEFAULT 0,
  `delivery_cost` float NOT NULL DEFAULT 0,
  `order_total` float NOT NULL DEFAULT 0,
  `order_earn_crop` float NOT NULL DEFAULT 0,
  `order_time` datetime NOT NULL DEFAULT current_timestamp(),
  `order_status` int(3) NOT NULL DEFAULT 0,
  `invoice_number` varchar(255) DEFAULT NULL,
  `business_id` int(11) NOT NULL DEFAULT 0,
  `payment_intent` text DEFAULT NULL,
  `payment_client` text DEFAULT NULL,
  `payment_intent_info` text DEFAULT NULL,
  `payment_response` text DEFAULT NULL,
  `payment_status` varchar(255) DEFAULT NULL,
  `payment_mode` varchar(255) DEFAULT NULL,
  `last_modified_time` datetime DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf16 COLLATE=utf16_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sd_orders_direct`
--

CREATE TABLE `sd_orders_direct` (
  `ID` bigint(20) NOT NULL,
  `sd_mt_userdb_id` int(10) NOT NULL,
  `order_type` enum('EARN','REDEEM') NOT NULL,
  `order_number` varchar(255) DEFAULT NULL,
  `order_total_base` float DEFAULT NULL,
  `order_gst` float NOT NULL DEFAULT 0,
  `delivery_cost` float NOT NULL DEFAULT 0,
  `order_total` float NOT NULL DEFAULT 0,
  `order_earn_crop` float NOT NULL DEFAULT 0,
  `order_time` datetime NOT NULL DEFAULT current_timestamp(),
  `order_status` int(3) NOT NULL DEFAULT 0,
  `payment_intent` text DEFAULT NULL,
  `payment_response` text DEFAULT NULL,
  `payment_status` varchar(255) DEFAULT NULL,
  `payment_mode` varchar(255) DEFAULT NULL,
  `last_modified_time` datetime DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf16 COLLATE=utf16_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sd_orders_items`
--

CREATE TABLE `sd_orders_items` (
  `ID` bigint(20) NOT NULL,
  `sd_mt_userdb_id` int(11) NOT NULL DEFAULT 0,
  `order_type` varchar(10) NOT NULL,
  `sd_orders_id` int(10) NOT NULL,
  `sd_offers_id` int(11) NOT NULL DEFAULT 0,
  `sd_wishlist_cart_id` int(11) NOT NULL DEFAULT 0,
  `sd_userdb_address_id` int(11) NOT NULL DEFAULT 0,
  `quantity` int(11) NOT NULL DEFAULT 0,
  `offer_price` float NOT NULL,
  `offer_discount` float NOT NULL,
  `offer_total` float NOT NULL,
  `order_crops` float NOT NULL,
  `delivery_crops` float NOT NULL DEFAULT 0,
  `order_title` varchar(250) NOT NULL,
  `offer_gst` float NOT NULL,
  `gst_value` float NOT NULL DEFAULT 0,
  `total_price` float NOT NULL,
  `offer_delivery` varchar(250) NOT NULL,
  `offer_mode` enum('DELIVERY','PICKUP','SERVICE') NOT NULL,
  `status` int(3) NOT NULL DEFAULT 0,
  `business_id` int(11) NOT NULL DEFAULT 0,
  `order_id` varchar(255) DEFAULT NULL,
  `order_time` datetime DEFAULT current_timestamp(),
  `return_policy_days` int(11) NOT NULL DEFAULT 0,
  `last_modified_time` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `cancel_reason` varchar(255) DEFAULT NULL,
  `cancel_remarks` text DEFAULT NULL,
  `order_eta` text DEFAULT NULL,
  `refund_percentage` float DEFAULT NULL,
  `refund_amount` float DEFAULT NULL,
  `return_business_remarks` text DEFAULT NULL,
  `variant_info` text DEFAULT NULL,
  `custom_note` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf16 COLLATE=utf16_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sd_orders_return_images`
--

CREATE TABLE `sd_orders_return_images` (
  `ID` bigint(20) NOT NULL,
  `sd_orders_items_id` int(11) NOT NULL,
  `image_content` longtext DEFAULT NULL,
  `image_status` int(4) NOT NULL,
  `remarks` longtext DEFAULT NULL,
  `created_time` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf16 COLLATE=utf16_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sd_orders_status`
--

CREATE TABLE `sd_orders_status` (
  `ID` int(11) NOT NULL,
  `status_key` int(11) NOT NULL,
  `status_value` varchar(50) NOT NULL,
  `status_short` varchar(255) DEFAULT NULL,
  `status_pickup` varchar(255) DEFAULT NULL,
  `status_next_numbers` text DEFAULT NULL,
  `status_next` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sd_orders_track`
--

CREATE TABLE `sd_orders_track` (
  `ID` bigint(20) NOT NULL,
  `sd_orders_items_id` int(11) NOT NULL,
  `sd_mt_userdb_id` int(11) NOT NULL,
  `status` int(3) NOT NULL DEFAULT 0,
  `remarks` varchar(255) DEFAULT NULL,
  `last_modified_time` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf16 COLLATE=utf16_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sd_order_items_refund`
--

CREATE TABLE `sd_order_items_refund` (
  `ID` int(11) NOT NULL,
  `sd_order_items_id` int(11) NOT NULL,
  `amount` float NOT NULL,
  `refund_id` varchar(1000) DEFAULT NULL,
  `refund_data` text DEFAULT NULL,
  `refund_reason` text DEFAULT NULL,
  `refund_init_time` datetime NOT NULL,
  `refund_status` varchar(20) DEFAULT NULL,
  `last_modified_time` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf16 COLLATE=utf16_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sd_payment_update`
--

CREATE TABLE `sd_payment_update` (
  `ID` int(11) NOT NULL,
  `sd_mt_userdb_id` int(11) NOT NULL,
  `week_date` date NOT NULL,
  `status` int(11) NOT NULL,
  `remarks` text DEFAULT NULL,
  `update_by` int(11) NOT NULL,
  `update_time` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf16 COLLATE=utf16_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sd_ratings`
--

CREATE TABLE `sd_ratings` (
  `ID` bigint(20) NOT NULL,
  `sd_order_items_id` int(11) NOT NULL DEFAULT 0,
  `sd_offers_id` int(11) NOT NULL,
  `sd_mt_userdb_id` int(11) NOT NULL,
  `rating` int(11) NOT NULL DEFAULT 0,
  `comment` text DEFAULT NULL,
  `last_modified_time` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf16 COLLATE=utf16_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sd_request`
--

CREATE TABLE `sd_request` (
  `ID` int(11) NOT NULL,
  `request_id` varchar(255) DEFAULT NULL,
  `request_type` varchar(255) NOT NULL,
  `request_mode` enum('BUSINESS','CUSTOMER') NOT NULL DEFAULT 'CUSTOMER',
  `request_description` text NOT NULL,
  `request_number` varchar(255) NOT NULL,
  `request_created_by` int(11) NOT NULL DEFAULT 0,
  `request_date` date NOT NULL,
  `request_pcm` varchar(25) NOT NULL,
  `request_status` enum('OPEN','PROGRESS','CLOSED') NOT NULL DEFAULT 'OPEN',
  `request_resolution` text DEFAULT NULL,
  `request_resolved_by` int(11) NOT NULL DEFAULT 0,
  `request_action_date` date DEFAULT NULL,
  `last_modified_time` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf16 COLLATE=utf16_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sd_site_alerts`
--

CREATE TABLE `sd_site_alerts` (
  `ID` int(11) NOT NULL,
  `type` enum('SMS','MAIL') NOT NULL,
  `name` varchar(55) NOT NULL,
  `message` text NOT NULL,
  `mail_subject` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf16 COLLATE=utf16_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sd_site_api`
--

CREATE TABLE `sd_site_api` (
  `ID` int(11) NOT NULL,
  `api_path` varchar(255) NOT NULL,
  `groups` varchar(1000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf16 COLLATE=utf16_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sd_site_errors`
--

CREATE TABLE `sd_site_errors` (
  `ID` int(11) NOT NULL,
  `module_name` varchar(255) NOT NULL,
  `error_index` varchar(255) NOT NULL,
  `error_message` varchar(2000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf16 COLLATE=utf16_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sd_site_settings`
--

CREATE TABLE `sd_site_settings` (
  `ID` int(5) NOT NULL,
  `setting_name` varchar(50) NOT NULL,
  `setting_value` longtext DEFAULT NULL,
  `created_by` varchar(20) NOT NULL,
  `last_modified_time` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf16 COLLATE=utf16_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sd_statedb`
--

CREATE TABLE `sd_statedb` (
  `ID` bigint(20) NOT NULL,
  `name` varchar(50) NOT NULL,
  `created_time` datetime NOT NULL DEFAULT current_timestamp(),
  `short_name` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf16 COLLATE=utf16_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sd_subscription`
--

CREATE TABLE `sd_subscription` (
  `ID` bigint(20) NOT NULL,
  `email_id` varchar(225) NOT NULL,
  `created_time` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf16 COLLATE=utf16_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sd_userdb_address`
--

CREATE TABLE `sd_userdb_address` (
  `ID` bigint(20) NOT NULL,
  `sd_mt_userdb_id` int(11) NOT NULL,
  `addr_one` longtext DEFAULT NULL,
  `addr_two` longtext DEFAULT NULL,
  `state` varchar(50) DEFAULT NULL,
  `city` varchar(50) DEFAULT NULL,
  `pincode` varchar(10) DEFAULT NULL,
  `status` int(3) NOT NULL,
  `created_time` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sd_userdb_bank`
--

CREATE TABLE `sd_userdb_bank` (
  `ID` bigint(20) NOT NULL,
  `sd_mt_userdb_id` int(11) NOT NULL,
  `bank_id` varchar(255) NOT NULL,
  `bank_name` varchar(50) NOT NULL,
  `accnt_no` varchar(20) NOT NULL,
  `no_of_outlets` int(11) NOT NULL,
  `status` int(3) NOT NULL,
  `created_time` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf16 COLLATE=utf16_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sd_user_site_settings`
--

CREATE TABLE `sd_user_site_settings` (
  `ID` int(5) NOT NULL,
  `sd_mt_userdb_id` int(10) NOT NULL,
  `setting_name` varchar(50) NOT NULL,
  `setting_value` longtext DEFAULT NULL,
  `created_by` varchar(10) NOT NULL,
  `last_modified_time` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf16 COLLATE=utf16_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sd_user_statements`
--

CREATE TABLE `sd_user_statements` (
  `ID` int(11) NOT NULL,
  `sd_mt_userdb_id` int(11) NOT NULL,
  `statement_year` int(11) NOT NULL,
  `statement_month` int(11) NOT NULL,
  `last_modified_time` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sd_wishlist_cart`
--

CREATE TABLE `sd_wishlist_cart` (
  `ID` bigint(20) NOT NULL,
  `sd_offers_id` int(10) NOT NULL,
  `sd_mt_userdb_id` int(10) NOT NULL,
  `created_time` datetime NOT NULL DEFAULT current_timestamp(),
  `last_updated_time` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp(),
  `type` enum('WISHLIST','CART','BUY') NOT NULL,
  `offer_type` enum('EARN','REDEEM') NOT NULL,
  `quantity` int(11) NOT NULL DEFAULT 0,
  `total_price` float NOT NULL,
  `variant_info` text DEFAULT NULL,
  `custom_note` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf16 COLLATE=utf16_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `sd_admin_holidays`
--
ALTER TABLE `sd_admin_holidays`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `sd_admin_interest`
--
ALTER TABLE `sd_admin_interest`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `sd_admin_loyalty`
--
ALTER TABLE `sd_admin_loyalty`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `sd_admin_notification_type`
--
ALTER TABLE `sd_admin_notification_type`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `sd_admin_sector`
--
ALTER TABLE `sd_admin_sector`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `sd_admin_service`
--
ALTER TABLE `sd_admin_service`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `sd_bluedays`
--
ALTER TABLE `sd_bluedays`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `sd_business_variant`
--
ALTER TABLE `sd_business_variant`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `sd_business_variant_default`
--
ALTER TABLE `sd_business_variant_default`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `sd_complaint`
--
ALTER TABLE `sd_complaint`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `complaint_mode` (`complaint_mode`),
  ADD KEY `complaint_status` (`complaint_status`);

--
-- Indexes for table `sd_const`
--
ALTER TABLE `sd_const`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `sd_crop_balance`
--
ALTER TABLE `sd_crop_balance`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `sd_custmer_audit`
--
ALTER TABLE `sd_custmer_audit`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `sd_feedback`
--
ALTER TABLE `sd_feedback`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `sd_get_mate`
--
ALTER TABLE `sd_get_mate`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `sd_invoice`
--
ALTER TABLE `sd_invoice`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `sd_likes`
--
ALTER TABLE `sd_likes`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `sd_loyalty_interest`
--
ALTER TABLE `sd_loyalty_interest`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `sd_market_offers`
--
ALTER TABLE `sd_market_offers`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `sd_market_publish_order`
--
ALTER TABLE `sd_market_publish_order`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `sd_missing_crops`
--
ALTER TABLE `sd_missing_crops`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `sd_mt_userdb`
--
ALTER TABLE `sd_mt_userdb`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `sd_mt_user_otp`
--
ALTER TABLE `sd_mt_user_otp`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `sd_notification`
--
ALTER TABLE `sd_notification`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `sd_mt_userdb_id` (`sd_mt_userdb_id`,`notification_type`);

--
-- Indexes for table `sd_notification_links`
--
ALTER TABLE `sd_notification_links`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `sd_offers`
--
ALTER TABLE `sd_offers`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `sd_offers_direct`
--
ALTER TABLE `sd_offers_direct`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `sd_offers_images`
--
ALTER TABLE `sd_offers_images`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `sd_offers_log`
--
ALTER TABLE `sd_offers_log`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `offer_id` (`offer_id`);

--
-- Indexes for table `sd_offers_variant`
--
ALTER TABLE `sd_offers_variant`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `sd_operating_hours`
--
ALTER TABLE `sd_operating_hours`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `sd_orders`
--
ALTER TABLE `sd_orders`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `sd_orders_direct`
--
ALTER TABLE `sd_orders_direct`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `sd_orders_items`
--
ALTER TABLE `sd_orders_items`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `sd_orders_return_images`
--
ALTER TABLE `sd_orders_return_images`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `sd_orders_status`
--
ALTER TABLE `sd_orders_status`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `sd_orders_track`
--
ALTER TABLE `sd_orders_track`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `sd_order_items_refund`
--
ALTER TABLE `sd_order_items_refund`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `sd_payment_update`
--
ALTER TABLE `sd_payment_update`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `sd_ratings`
--
ALTER TABLE `sd_ratings`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `sd_request`
--
ALTER TABLE `sd_request`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `sd_site_alerts`
--
ALTER TABLE `sd_site_alerts`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `sd_site_api`
--
ALTER TABLE `sd_site_api`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `sd_site_errors`
--
ALTER TABLE `sd_site_errors`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `sd_site_settings`
--
ALTER TABLE `sd_site_settings`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `sd_statedb`
--
ALTER TABLE `sd_statedb`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `sd_subscription`
--
ALTER TABLE `sd_subscription`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `sd_userdb_address`
--
ALTER TABLE `sd_userdb_address`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `sd_userdb_bank`
--
ALTER TABLE `sd_userdb_bank`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `sd_user_site_settings`
--
ALTER TABLE `sd_user_site_settings`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `sd_user_statements`
--
ALTER TABLE `sd_user_statements`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `sd_wishlist_cart`
--
ALTER TABLE `sd_wishlist_cart`
  ADD PRIMARY KEY (`ID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `sd_admin_holidays`
--
ALTER TABLE `sd_admin_holidays`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sd_admin_interest`
--
ALTER TABLE `sd_admin_interest`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sd_admin_loyalty`
--
ALTER TABLE `sd_admin_loyalty`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sd_admin_notification_type`
--
ALTER TABLE `sd_admin_notification_type`
  MODIFY `ID` int(5) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sd_admin_sector`
--
ALTER TABLE `sd_admin_sector`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sd_admin_service`
--
ALTER TABLE `sd_admin_service`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sd_bluedays`
--
ALTER TABLE `sd_bluedays`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sd_business_variant`
--
ALTER TABLE `sd_business_variant`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sd_business_variant_default`
--
ALTER TABLE `sd_business_variant_default`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sd_complaint`
--
ALTER TABLE `sd_complaint`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sd_const`
--
ALTER TABLE `sd_const`
  MODIFY `ID` int(3) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sd_crop_balance`
--
ALTER TABLE `sd_crop_balance`
  MODIFY `ID` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sd_custmer_audit`
--
ALTER TABLE `sd_custmer_audit`
  MODIFY `ID` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sd_feedback`
--
ALTER TABLE `sd_feedback`
  MODIFY `ID` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sd_get_mate`
--
ALTER TABLE `sd_get_mate`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sd_invoice`
--
ALTER TABLE `sd_invoice`
  MODIFY `ID` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sd_likes`
--
ALTER TABLE `sd_likes`
  MODIFY `ID` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sd_loyalty_interest`
--
ALTER TABLE `sd_loyalty_interest`
  MODIFY `ID` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sd_market_offers`
--
ALTER TABLE `sd_market_offers`
  MODIFY `ID` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sd_market_publish_order`
--
ALTER TABLE `sd_market_publish_order`
  MODIFY `ID` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sd_missing_crops`
--
ALTER TABLE `sd_missing_crops`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sd_mt_userdb`
--
ALTER TABLE `sd_mt_userdb`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sd_mt_user_otp`
--
ALTER TABLE `sd_mt_user_otp`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sd_notification`
--
ALTER TABLE `sd_notification`
  MODIFY `ID` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sd_notification_links`
--
ALTER TABLE `sd_notification_links`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sd_offers`
--
ALTER TABLE `sd_offers`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sd_offers_direct`
--
ALTER TABLE `sd_offers_direct`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sd_offers_images`
--
ALTER TABLE `sd_offers_images`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sd_offers_log`
--
ALTER TABLE `sd_offers_log`
  MODIFY `ID` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sd_offers_variant`
--
ALTER TABLE `sd_offers_variant`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sd_operating_hours`
--
ALTER TABLE `sd_operating_hours`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sd_orders`
--
ALTER TABLE `sd_orders`
  MODIFY `ID` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sd_orders_direct`
--
ALTER TABLE `sd_orders_direct`
  MODIFY `ID` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sd_orders_items`
--
ALTER TABLE `sd_orders_items`
  MODIFY `ID` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sd_orders_return_images`
--
ALTER TABLE `sd_orders_return_images`
  MODIFY `ID` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sd_orders_status`
--
ALTER TABLE `sd_orders_status`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sd_orders_track`
--
ALTER TABLE `sd_orders_track`
  MODIFY `ID` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sd_order_items_refund`
--
ALTER TABLE `sd_order_items_refund`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sd_payment_update`
--
ALTER TABLE `sd_payment_update`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sd_ratings`
--
ALTER TABLE `sd_ratings`
  MODIFY `ID` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sd_request`
--
ALTER TABLE `sd_request`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sd_site_alerts`
--
ALTER TABLE `sd_site_alerts`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sd_site_api`
--
ALTER TABLE `sd_site_api`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sd_site_errors`
--
ALTER TABLE `sd_site_errors`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sd_site_settings`
--
ALTER TABLE `sd_site_settings`
  MODIFY `ID` int(5) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sd_statedb`
--
ALTER TABLE `sd_statedb`
  MODIFY `ID` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sd_subscription`
--
ALTER TABLE `sd_subscription`
  MODIFY `ID` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sd_userdb_address`
--
ALTER TABLE `sd_userdb_address`
  MODIFY `ID` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sd_userdb_bank`
--
ALTER TABLE `sd_userdb_bank`
  MODIFY `ID` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sd_user_site_settings`
--
ALTER TABLE `sd_user_site_settings`
  MODIFY `ID` int(5) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sd_user_statements`
--
ALTER TABLE `sd_user_statements`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sd_wishlist_cart`
--
ALTER TABLE `sd_wishlist_cart`
  MODIFY `ID` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `sd_offers_log`
--
ALTER TABLE `sd_offers_log`
  ADD CONSTRAINT `offer_id` FOREIGN KEY (`offer_id`) REFERENCES `sd_offers` (`ID`);
--
-- Database: `sds_dsc`
--
CREATE DATABASE IF NOT EXISTS `sds_dsc` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_uca1400_ai_ci;
USE `sds_dsc`;

-- --------------------------------------------------------

--
-- Table structure for table `sd_accesskeys`
--

CREATE TABLE `sd_accesskeys` (
  `ID` int(11) NOT NULL,
  `server_name` varchar(255) NOT NULL,
  `server_url` varchar(255) NOT NULL,
  `access_key` varchar(1000) NOT NULL,
  `status` int(11) NOT NULL DEFAULT 5,
  `created_by` int(11) NOT NULL DEFAULT 0,
  `created_time` varchar(255) DEFAULT NULL,
  `last_modified_by` int(11) NOT NULL DEFAULT 0,
  `last_modified_time` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sd_const`
--

CREATE TABLE `sd_const` (
  `ID` int(3) NOT NULL,
  `type` varchar(50) DEFAULT NULL,
  `pid` varchar(50) DEFAULT NULL,
  `pval` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf16 COLLATE=utf16_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sd_const_seq`
--

CREATE TABLE `sd_const_seq` (
  `next_not_cached_value` bigint(21) NOT NULL,
  `minimum_value` bigint(21) NOT NULL,
  `maximum_value` bigint(21) NOT NULL,
  `start_value` bigint(21) NOT NULL COMMENT 'start value when sequences is created or value if RESTART is used',
  `increment` bigint(21) NOT NULL COMMENT 'increment value',
  `cache_size` bigint(21) UNSIGNED NOT NULL,
  `cycle_option` tinyint(1) UNSIGNED NOT NULL COMMENT '0 if no cycles are allowed, 1 if the sequence should begin a new cycle when maximum_value is passed',
  `cycle_count` bigint(21) NOT NULL COMMENT 'How many cycles have been done'
) ENGINE=InnoDB DEFAULT CHARSET=utf16 COLLATE=utf16_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sd_custmer_audit`
--

CREATE TABLE `sd_custmer_audit` (
  `ID` bigint(20) NOT NULL,
  `sd_mt_userdb_id` int(11) NOT NULL,
  `message` text NOT NULL,
  `last_modified_time` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf16 COLLATE=utf16_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sd_custmer_audit_seq`
--

CREATE TABLE `sd_custmer_audit_seq` (
  `next_not_cached_value` bigint(21) NOT NULL,
  `minimum_value` bigint(21) NOT NULL,
  `maximum_value` bigint(21) NOT NULL,
  `start_value` bigint(21) NOT NULL COMMENT 'start value when sequences is created or value if RESTART is used',
  `increment` bigint(21) NOT NULL COMMENT 'increment value',
  `cache_size` bigint(21) UNSIGNED NOT NULL,
  `cycle_option` tinyint(1) UNSIGNED NOT NULL COMMENT '0 if no cycles are allowed, 1 if the sequence should begin a new cycle when maximum_value is passed',
  `cycle_count` bigint(21) NOT NULL COMMENT 'How many cycles have been done'
) ENGINE=InnoDB DEFAULT CHARSET=utf16 COLLATE=utf16_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sd_dsc`
--

CREATE TABLE `sd_dsc` (
  `ID` int(11) NOT NULL,
  `dsc_empid` varchar(256) NOT NULL,
  `dsc_empname` varchar(256) NOT NULL,
  `dsc_type` varchar(10) NOT NULL,
  `dsc_register_by` varchar(25) NOT NULL COMMENT 'Site Admin / Guest',
  `dsc_register_time` datetime NOT NULL,
  `dsc_not_before` datetime NOT NULL,
  `dsc_not_after` datetime DEFAULT NULL,
  `dsc_cn` varchar(255) DEFAULT NULL,
  `dsc_dn` varchar(1000) DEFAULT NULL,
  `dsc_cert_pem` longtext DEFAULT NULL,
  `dsc_cert_pfx` longtext DEFAULT NULL,
  `dsc_serial_number` varchar(1000) NOT NULL,
  `dsc_status` int(11) NOT NULL DEFAULT 5,
  `last_modified_time` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sd_dsc_seq`
--

CREATE TABLE `sd_dsc_seq` (
  `next_not_cached_value` bigint(21) NOT NULL,
  `minimum_value` bigint(21) NOT NULL,
  `maximum_value` bigint(21) NOT NULL,
  `start_value` bigint(21) NOT NULL COMMENT 'start value when sequences is created or value if RESTART is used',
  `increment` bigint(21) NOT NULL COMMENT 'increment value',
  `cache_size` bigint(21) UNSIGNED NOT NULL,
  `cycle_option` tinyint(1) UNSIGNED NOT NULL COMMENT '0 if no cycles are allowed, 1 if the sequence should begin a new cycle when maximum_value is passed',
  `cycle_count` bigint(21) NOT NULL COMMENT 'How many cycles have been done'
) ENGINE=InnoDB DEFAULT CHARSET=utf16 COLLATE=utf16_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sd_mt_group`
--

CREATE TABLE `sd_mt_group` (
  `ID` int(11) NOT NULL,
  `group_name` varchar(100) NOT NULL,
  `created_time` datetime DEFAULT NULL,
  `created_by` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sd_mt_group_seq`
--

CREATE TABLE `sd_mt_group_seq` (
  `next_not_cached_value` bigint(21) NOT NULL,
  `minimum_value` bigint(21) NOT NULL,
  `maximum_value` bigint(21) NOT NULL,
  `start_value` bigint(21) NOT NULL COMMENT 'start value when sequences is created or value if RESTART is used',
  `increment` bigint(21) NOT NULL COMMENT 'increment value',
  `cache_size` bigint(21) UNSIGNED NOT NULL,
  `cycle_option` tinyint(1) UNSIGNED NOT NULL COMMENT '0 if no cycles are allowed, 1 if the sequence should begin a new cycle when maximum_value is passed',
  `cycle_count` bigint(21) NOT NULL COMMENT 'How many cycles have been done'
) ENGINE=InnoDB DEFAULT CHARSET=utf16 COLLATE=utf16_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sd_mt_project`
--

CREATE TABLE `sd_mt_project` (
  `id` bigint(20) NOT NULL,
  `created_by` varchar(255) DEFAULT NULL,
  `created_time` datetime(6) DEFAULT NULL,
  `last_modified_time` datetime(6) DEFAULT NULL,
  `project_name` varchar(255) DEFAULT NULL,
  `status` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sd_mt_project_roles`
--

CREATE TABLE `sd_mt_project_roles` (
  `id` bigint(20) NOT NULL,
  `created_time` datetime(6) DEFAULT NULL,
  `sd_mt_project_id` bigint(20) DEFAULT NULL,
  `sd_mt_role_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sd_mt_project_roles_seq`
--

CREATE TABLE `sd_mt_project_roles_seq` (
  `next_not_cached_value` bigint(21) NOT NULL,
  `minimum_value` bigint(21) NOT NULL,
  `maximum_value` bigint(21) NOT NULL,
  `start_value` bigint(21) NOT NULL COMMENT 'start value when sequences is created or value if RESTART is used',
  `increment` bigint(21) NOT NULL COMMENT 'increment value',
  `cache_size` bigint(21) UNSIGNED NOT NULL,
  `cycle_option` tinyint(1) UNSIGNED NOT NULL COMMENT '0 if no cycles are allowed, 1 if the sequence should begin a new cycle when maximum_value is passed',
  `cycle_count` bigint(21) NOT NULL COMMENT 'How many cycles have been done'
) ENGINE=InnoDB DEFAULT CHARSET=utf16 COLLATE=utf16_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sd_mt_project_seq`
--

CREATE TABLE `sd_mt_project_seq` (
  `next_not_cached_value` bigint(21) NOT NULL,
  `minimum_value` bigint(21) NOT NULL,
  `maximum_value` bigint(21) NOT NULL,
  `start_value` bigint(21) NOT NULL COMMENT 'start value when sequences is created or value if RESTART is used',
  `increment` bigint(21) NOT NULL COMMENT 'increment value',
  `cache_size` bigint(21) UNSIGNED NOT NULL,
  `cycle_option` tinyint(1) UNSIGNED NOT NULL COMMENT '0 if no cycles are allowed, 1 if the sequence should begin a new cycle when maximum_value is passed',
  `cycle_count` bigint(21) NOT NULL COMMENT 'How many cycles have been done'
) ENGINE=InnoDB DEFAULT CHARSET=utf16 COLLATE=utf16_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sd_mt_role`
--

CREATE TABLE `sd_mt_role` (
  `ID` int(11) NOT NULL,
  `role_name` varchar(100) NOT NULL,
  `created_time` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sd_mt_role_seq`
--

CREATE TABLE `sd_mt_role_seq` (
  `next_not_cached_value` bigint(21) NOT NULL,
  `minimum_value` bigint(21) NOT NULL,
  `maximum_value` bigint(21) NOT NULL,
  `start_value` bigint(21) NOT NULL COMMENT 'start value when sequences is created or value if RESTART is used',
  `increment` bigint(21) NOT NULL COMMENT 'increment value',
  `cache_size` bigint(21) UNSIGNED NOT NULL,
  `cycle_option` tinyint(1) UNSIGNED NOT NULL COMMENT '0 if no cycles are allowed, 1 if the sequence should begin a new cycle when maximum_value is passed',
  `cycle_count` bigint(21) NOT NULL COMMENT 'How many cycles have been done'
) ENGINE=InnoDB DEFAULT CHARSET=utf16 COLLATE=utf16_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sd_mt_userdb`
--

CREATE TABLE `sd_mt_userdb` (
  `ID` int(11) NOT NULL,
  `ename` varchar(100) NOT NULL,
  `euserid` varchar(100) NOT NULL,
  `epassword` varchar(256) NOT NULL,
  `emailid` varchar(100) DEFAULT NULL,
  `mobile_no` varchar(10) DEFAULT NULL,
  `designation` varchar(250) DEFAULT NULL,
  `profile_img` longtext DEFAULT NULL,
  `last_login_time` datetime DEFAULT NULL,
  `last_login_ip` varchar(50) DEFAULT NULL,
  `last_reset_time` datetime DEFAULT NULL,
  `change_pass` int(11) DEFAULT 0,
  `created_time` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT 0,
  `active_status` int(11) NOT NULL DEFAULT 0,
  `failed_attempts` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sd_mt_userdb_seq`
--

CREATE TABLE `sd_mt_userdb_seq` (
  `next_not_cached_value` bigint(21) NOT NULL,
  `minimum_value` bigint(21) NOT NULL,
  `maximum_value` bigint(21) NOT NULL,
  `start_value` bigint(21) NOT NULL COMMENT 'start value when sequences is created or value if RESTART is used',
  `increment` bigint(21) NOT NULL COMMENT 'increment value',
  `cache_size` bigint(21) UNSIGNED NOT NULL,
  `cycle_option` tinyint(1) UNSIGNED NOT NULL COMMENT '0 if no cycles are allowed, 1 if the sequence should begin a new cycle when maximum_value is passed',
  `cycle_count` bigint(21) NOT NULL COMMENT 'How many cycles have been done'
) ENGINE=InnoDB DEFAULT CHARSET=utf16 COLLATE=utf16_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sd_mt_user_group`
--

CREATE TABLE `sd_mt_user_group` (
  `ID` int(11) NOT NULL,
  `sd_mt_userdb_id` int(11) NOT NULL,
  `sd_mt_group_id` int(11) NOT NULL,
  `created_time` datetime DEFAULT NULL,
  `created_by` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sd_mt_user_group_seq`
--

CREATE TABLE `sd_mt_user_group_seq` (
  `next_not_cached_value` bigint(21) NOT NULL,
  `minimum_value` bigint(21) NOT NULL,
  `maximum_value` bigint(21) NOT NULL,
  `start_value` bigint(21) NOT NULL COMMENT 'start value when sequences is created or value if RESTART is used',
  `increment` bigint(21) NOT NULL COMMENT 'increment value',
  `cache_size` bigint(21) UNSIGNED NOT NULL,
  `cycle_option` tinyint(1) UNSIGNED NOT NULL COMMENT '0 if no cycles are allowed, 1 if the sequence should begin a new cycle when maximum_value is passed',
  `cycle_count` bigint(21) NOT NULL COMMENT 'How many cycles have been done'
) ENGINE=InnoDB DEFAULT CHARSET=utf16 COLLATE=utf16_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sd_mt_user_otp`
--

CREATE TABLE `sd_mt_user_otp` (
  `ID` int(11) NOT NULL,
  `otp_type` enum('EMAIL','MOBILE') NOT NULL,
  `country_code` varchar(5) NOT NULL DEFAULT '0',
  `mobile_no` varchar(50) DEFAULT NULL,
  `email_id` varchar(255) DEFAULT NULL,
  `otp_code_hash` varchar(255) NOT NULL,
  `otp_created_time` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf16 COLLATE=utf16_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sd_mt_user_otp_seq`
--

CREATE TABLE `sd_mt_user_otp_seq` (
  `next_not_cached_value` bigint(21) NOT NULL,
  `minimum_value` bigint(21) NOT NULL,
  `maximum_value` bigint(21) NOT NULL,
  `start_value` bigint(21) NOT NULL COMMENT 'start value when sequences is created or value if RESTART is used',
  `increment` bigint(21) NOT NULL COMMENT 'increment value',
  `cache_size` bigint(21) UNSIGNED NOT NULL,
  `cycle_option` tinyint(1) UNSIGNED NOT NULL COMMENT '0 if no cycles are allowed, 1 if the sequence should begin a new cycle when maximum_value is passed',
  `cycle_count` bigint(21) NOT NULL COMMENT 'How many cycles have been done'
) ENGINE=InnoDB DEFAULT CHARSET=utf16 COLLATE=utf16_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sd_mt_user_role`
--

CREATE TABLE `sd_mt_user_role` (
  `ID` int(11) NOT NULL,
  `sd_mt_userdb_id` int(11) NOT NULL,
  `sd_mt_role_id` int(11) NOT NULL,
  `created_time` datetime DEFAULT NULL,
  `created_by` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sd_mt_user_role_seq`
--

CREATE TABLE `sd_mt_user_role_seq` (
  `next_not_cached_value` bigint(21) NOT NULL,
  `minimum_value` bigint(21) NOT NULL,
  `maximum_value` bigint(21) NOT NULL,
  `start_value` bigint(21) NOT NULL COMMENT 'start value when sequences is created or value if RESTART is used',
  `increment` bigint(21) NOT NULL COMMENT 'increment value',
  `cache_size` bigint(21) UNSIGNED NOT NULL,
  `cycle_option` tinyint(1) UNSIGNED NOT NULL COMMENT '0 if no cycles are allowed, 1 if the sequence should begin a new cycle when maximum_value is passed',
  `cycle_count` bigint(21) NOT NULL COMMENT 'How many cycles have been done'
) ENGINE=InnoDB DEFAULT CHARSET=utf16 COLLATE=utf16_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sd_site_api`
--

CREATE TABLE `sd_site_api` (
  `ID` int(11) NOT NULL,
  `api_path` varchar(255) NOT NULL,
  `groups` varchar(1000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf16 COLLATE=utf16_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sd_site_api_seq`
--

CREATE TABLE `sd_site_api_seq` (
  `next_not_cached_value` bigint(21) NOT NULL,
  `minimum_value` bigint(21) NOT NULL,
  `maximum_value` bigint(21) NOT NULL,
  `start_value` bigint(21) NOT NULL COMMENT 'start value when sequences is created or value if RESTART is used',
  `increment` bigint(21) NOT NULL COMMENT 'increment value',
  `cache_size` bigint(21) UNSIGNED NOT NULL,
  `cycle_option` tinyint(1) UNSIGNED NOT NULL COMMENT '0 if no cycles are allowed, 1 if the sequence should begin a new cycle when maximum_value is passed',
  `cycle_count` bigint(21) NOT NULL COMMENT 'How many cycles have been done'
) ENGINE=InnoDB DEFAULT CHARSET=utf16 COLLATE=utf16_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sd_site_settings`
--

CREATE TABLE `sd_site_settings` (
  `ID` int(5) NOT NULL,
  `setting_name` varchar(50) NOT NULL,
  `setting_value` longtext NOT NULL,
  `created_by` int(11) DEFAULT NULL,
  `last_modified_time` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf16 COLLATE=utf16_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sd_site_settings_seq`
--

CREATE TABLE `sd_site_settings_seq` (
  `next_not_cached_value` bigint(21) NOT NULL,
  `minimum_value` bigint(21) NOT NULL,
  `maximum_value` bigint(21) NOT NULL,
  `start_value` bigint(21) NOT NULL COMMENT 'start value when sequences is created or value if RESTART is used',
  `increment` bigint(21) NOT NULL COMMENT 'increment value',
  `cache_size` bigint(21) UNSIGNED NOT NULL,
  `cycle_option` tinyint(1) UNSIGNED NOT NULL COMMENT '0 if no cycles are allowed, 1 if the sequence should begin a new cycle when maximum_value is passed',
  `cycle_count` bigint(21) NOT NULL COMMENT 'How many cycles have been done'
) ENGINE=InnoDB DEFAULT CHARSET=utf16 COLLATE=utf16_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sd_task`
--

CREATE TABLE `sd_task` (
  `ID` bigint(20) NOT NULL,
  `task_name` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `type` varchar(150) NOT NULL,
  `template` longtext DEFAULT NULL,
  `fields` longtext DEFAULT NULL,
  `result_data` longtext DEFAULT NULL,
  `status` int(3) NOT NULL DEFAULT 5 COMMENT '	5 - assigned, 10 - completed, 15 - amended',
  `parent_id` int(11) DEFAULT NULL,
  `created_by` int(5) DEFAULT 0,
  `updated_by` int(5) DEFAULT 0,
  `created_time` datetime NOT NULL DEFAULT current_timestamp(),
  `last_modified_time` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `sd_mt_project_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf16 COLLATE=utf16_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sd_task_api_info`
--

CREATE TABLE `sd_task_api_info` (
  `id` bigint(20) NOT NULL,
  `sd_task_id` int(11) DEFAULT NULL,
  `task_user_id` varchar(255) DEFAULT NULL,
  `task_user_name` varchar(255) DEFAULT NULL,
  `task_created_portal` text DEFAULT NULL,
  `task_created_time` varchar(255) DEFAULT NULL,
  `task_status` varchar(50) NOT NULL,
  `task_error` text DEFAULT NULL,
  `task_digi_cert_status` varchar(50) DEFAULT NULL,
  `task_completion_time` varchar(255) DEFAULT NULL,
  `full_task_log` longtext DEFAULT NULL,
  `task_type` varchar(10) DEFAULT NULL,
  `task_fields` longtext DEFAULT NULL,
  `task_purpose` varchar(1000) DEFAULT NULL,
  `redirect_url` varchar(1000) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sd_task_api_info_seq`
--

CREATE TABLE `sd_task_api_info_seq` (
  `next_not_cached_value` bigint(21) NOT NULL,
  `minimum_value` bigint(21) NOT NULL,
  `maximum_value` bigint(21) NOT NULL,
  `start_value` bigint(21) NOT NULL COMMENT 'start value when sequences is created or value if RESTART is used',
  `increment` bigint(21) NOT NULL COMMENT 'increment value',
  `cache_size` bigint(21) UNSIGNED NOT NULL,
  `cycle_option` tinyint(1) UNSIGNED NOT NULL COMMENT '0 if no cycles are allowed, 1 if the sequence should begin a new cycle when maximum_value is passed',
  `cycle_count` bigint(21) NOT NULL COMMENT 'How many cycles have been done'
) ENGINE=InnoDB DEFAULT CHARSET=utf16 COLLATE=utf16_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sd_task_result`
--

CREATE TABLE `sd_task_result` (
  `ID` bigint(20) NOT NULL,
  `sd_task_id` int(11) DEFAULT NULL,
  `mode` varchar(10) DEFAULT NULL,
  `template` longtext NOT NULL,
  `result_data` longtext DEFAULT NULL,
  `last_modified_time` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `accuracy` int(11) NOT NULL DEFAULT 0,
  `status` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sd_task_result_seq`
--

CREATE TABLE `sd_task_result_seq` (
  `next_not_cached_value` bigint(21) NOT NULL,
  `minimum_value` bigint(21) NOT NULL,
  `maximum_value` bigint(21) NOT NULL,
  `start_value` bigint(21) NOT NULL COMMENT 'start value when sequences is created or value if RESTART is used',
  `increment` bigint(21) NOT NULL COMMENT 'increment value',
  `cache_size` bigint(21) UNSIGNED NOT NULL,
  `cycle_option` tinyint(1) UNSIGNED NOT NULL COMMENT '0 if no cycles are allowed, 1 if the sequence should begin a new cycle when maximum_value is passed',
  `cycle_count` bigint(21) NOT NULL COMMENT 'How many cycles have been done'
) ENGINE=InnoDB DEFAULT CHARSET=utf16 COLLATE=utf16_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sd_task_seq`
--

CREATE TABLE `sd_task_seq` (
  `next_not_cached_value` bigint(21) NOT NULL,
  `minimum_value` bigint(21) NOT NULL,
  `maximum_value` bigint(21) NOT NULL,
  `start_value` bigint(21) NOT NULL COMMENT 'start value when sequences is created or value if RESTART is used',
  `increment` bigint(21) NOT NULL COMMENT 'increment value',
  `cache_size` bigint(21) UNSIGNED NOT NULL,
  `cycle_option` tinyint(1) UNSIGNED NOT NULL COMMENT '0 if no cycles are allowed, 1 if the sequence should begin a new cycle when maximum_value is passed',
  `cycle_count` bigint(21) NOT NULL COMMENT 'How many cycles have been done'
) ENGINE=InnoDB DEFAULT CHARSET=utf16 COLLATE=utf16_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sd_task_settings`
--

CREATE TABLE `sd_task_settings` (
  `ID` bigint(20) NOT NULL,
  `sd_task_id` bigint(20) DEFAULT NULL,
  `pagination` varchar(10) DEFAULT NULL,
  `footer_content` varchar(155) DEFAULT NULL,
  `footer_pst` varchar(10) DEFAULT NULL,
  `created_time` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sd_task_settings_seq`
--

CREATE TABLE `sd_task_settings_seq` (
  `next_not_cached_value` bigint(21) NOT NULL,
  `minimum_value` bigint(21) NOT NULL,
  `maximum_value` bigint(21) NOT NULL,
  `start_value` bigint(21) NOT NULL COMMENT 'start value when sequences is created or value if RESTART is used',
  `increment` bigint(21) NOT NULL COMMENT 'increment value',
  `cache_size` bigint(21) UNSIGNED NOT NULL,
  `cycle_option` tinyint(1) UNSIGNED NOT NULL COMMENT '0 if no cycles are allowed, 1 if the sequence should begin a new cycle when maximum_value is passed',
  `cycle_count` bigint(21) NOT NULL COMMENT 'How many cycles have been done'
) ENGINE=InnoDB DEFAULT CHARSET=utf16 COLLATE=utf16_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sd_task_tracker`
--

CREATE TABLE `sd_task_tracker` (
  `ID` bigint(20) NOT NULL,
  `sd_task_id` int(11) DEFAULT NULL,
  `remarks` text NOT NULL,
  `start_date` datetime NOT NULL DEFAULT current_timestamp(),
  `end_date` datetime DEFAULT NULL ON UPDATE current_timestamp(),
  `created_time` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sd_task_tracker_seq`
--

CREATE TABLE `sd_task_tracker_seq` (
  `next_not_cached_value` bigint(21) NOT NULL,
  `minimum_value` bigint(21) NOT NULL,
  `maximum_value` bigint(21) NOT NULL,
  `start_value` bigint(21) NOT NULL COMMENT 'start value when sequences is created or value if RESTART is used',
  `increment` bigint(21) NOT NULL COMMENT 'increment value',
  `cache_size` bigint(21) UNSIGNED NOT NULL,
  `cycle_option` tinyint(1) UNSIGNED NOT NULL COMMENT '0 if no cycles are allowed, 1 if the sequence should begin a new cycle when maximum_value is passed',
  `cycle_count` bigint(21) NOT NULL COMMENT 'How many cycles have been done'
) ENGINE=InnoDB DEFAULT CHARSET=utf16 COLLATE=utf16_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sd_users`
--

CREATE TABLE `sd_users` (
  `id` int(11) NOT NULL,
  `emailid` varchar(255) DEFAULT NULL,
  `ename` varchar(255) DEFAULT NULL,
  `epassword` varchar(255) DEFAULT NULL,
  `euserid` varchar(255) DEFAULT NULL,
  `mobile_no` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sd_users_seq`
--

CREATE TABLE `sd_users_seq` (
  `next_not_cached_value` bigint(21) NOT NULL,
  `minimum_value` bigint(21) NOT NULL,
  `maximum_value` bigint(21) NOT NULL,
  `start_value` bigint(21) NOT NULL COMMENT 'start value when sequences is created or value if RESTART is used',
  `increment` bigint(21) NOT NULL COMMENT 'increment value',
  `cache_size` bigint(21) UNSIGNED NOT NULL,
  `cycle_option` tinyint(1) UNSIGNED NOT NULL COMMENT '0 if no cycles are allowed, 1 if the sequence should begin a new cycle when maximum_value is passed',
  `cycle_count` bigint(21) NOT NULL COMMENT 'How many cycles have been done'
) ENGINE=InnoDB DEFAULT CHARSET=utf16 COLLATE=utf16_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `sd_accesskeys`
--
ALTER TABLE `sd_accesskeys`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `sd_const`
--
ALTER TABLE `sd_const`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `sd_custmer_audit`
--
ALTER TABLE `sd_custmer_audit`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `FK3awjywn6phacrjeafmpuii4an` (`sd_mt_userdb_id`);

--
-- Indexes for table `sd_dsc`
--
ALTER TABLE `sd_dsc`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `sd_mt_group`
--
ALTER TABLE `sd_mt_group`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `sd_mt_project`
--
ALTER TABLE `sd_mt_project`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sd_mt_project_roles`
--
ALTER TABLE `sd_mt_project_roles`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK5oa3x74ijlmcodxj2as01etxg` (`sd_mt_project_id`),
  ADD KEY `FKq2ywgj16hehyelwujg9on3svn` (`sd_mt_role_id`);

--
-- Indexes for table `sd_mt_role`
--
ALTER TABLE `sd_mt_role`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `sd_mt_userdb`
--
ALTER TABLE `sd_mt_userdb`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `sd_mt_user_group`
--
ALTER TABLE `sd_mt_user_group`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `FKrcmob97k7n32lvrrjxxqx7cpa` (`sd_mt_group_id`),
  ADD KEY `FK43j8o6m1a025ohso2cs2p9s4i` (`sd_mt_userdb_id`);

--
-- Indexes for table `sd_mt_user_otp`
--
ALTER TABLE `sd_mt_user_otp`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `sd_mt_user_role`
--
ALTER TABLE `sd_mt_user_role`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `FKcwhfa4iqwols2ybkff7of2kro` (`sd_mt_role_id`),
  ADD KEY `FKntlucki34h48gh4g978ulda5a` (`sd_mt_userdb_id`);

--
-- Indexes for table `sd_site_api`
--
ALTER TABLE `sd_site_api`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `sd_site_settings`
--
ALTER TABLE `sd_site_settings`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `sd_task`
--
ALTER TABLE `sd_task`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `FKk9cs13rnftq2t39vptayjya69` (`sd_mt_project_id`);

--
-- Indexes for table `sd_task_api_info`
--
ALTER TABLE `sd_task_api_info`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sd_task_result`
--
ALTER TABLE `sd_task_result`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `FKksjs1aw7mws16bwbeay0la7a2` (`sd_task_id`);

--
-- Indexes for table `sd_task_settings`
--
ALTER TABLE `sd_task_settings`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `FK62pihd9vdxuhi8av6i9kdcf8e` (`sd_task_id`);

--
-- Indexes for table `sd_task_tracker`
--
ALTER TABLE `sd_task_tracker`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `FKo3qyh9kh76f8rno1xu4ks0ohc` (`sd_task_id`);

--
-- Indexes for table `sd_users`
--
ALTER TABLE `sd_users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `sd_accesskeys`
--
ALTER TABLE `sd_accesskeys`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sd_const`
--
ALTER TABLE `sd_const`
  MODIFY `ID` int(3) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sd_custmer_audit`
--
ALTER TABLE `sd_custmer_audit`
  MODIFY `ID` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sd_dsc`
--
ALTER TABLE `sd_dsc`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sd_mt_group`
--
ALTER TABLE `sd_mt_group`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sd_mt_role`
--
ALTER TABLE `sd_mt_role`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sd_mt_userdb`
--
ALTER TABLE `sd_mt_userdb`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sd_mt_user_group`
--
ALTER TABLE `sd_mt_user_group`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sd_mt_user_otp`
--
ALTER TABLE `sd_mt_user_otp`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sd_mt_user_role`
--
ALTER TABLE `sd_mt_user_role`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sd_site_api`
--
ALTER TABLE `sd_site_api`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sd_site_settings`
--
ALTER TABLE `sd_site_settings`
  MODIFY `ID` int(5) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sd_task`
--
ALTER TABLE `sd_task`
  MODIFY `ID` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sd_task_api_info`
--
ALTER TABLE `sd_task_api_info`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sd_task_result`
--
ALTER TABLE `sd_task_result`
  MODIFY `ID` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sd_task_settings`
--
ALTER TABLE `sd_task_settings`
  MODIFY `ID` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sd_task_tracker`
--
ALTER TABLE `sd_task_tracker`
  MODIFY `ID` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `sd_custmer_audit`
--
ALTER TABLE `sd_custmer_audit`
  ADD CONSTRAINT `FK3awjywn6phacrjeafmpuii4an` FOREIGN KEY (`sd_mt_userdb_id`) REFERENCES `sd_mt_userdb` (`ID`);

--
-- Constraints for table `sd_mt_project_roles`
--
ALTER TABLE `sd_mt_project_roles`
  ADD CONSTRAINT `FK5oa3x74ijlmcodxj2as01etxg` FOREIGN KEY (`sd_mt_project_id`) REFERENCES `sd_mt_project` (`id`),
  ADD CONSTRAINT `FKq2ywgj16hehyelwujg9on3svn` FOREIGN KEY (`sd_mt_role_id`) REFERENCES `sd_mt_role` (`ID`);

--
-- Constraints for table `sd_mt_user_group`
--
ALTER TABLE `sd_mt_user_group`
  ADD CONSTRAINT `FK43j8o6m1a025ohso2cs2p9s4i` FOREIGN KEY (`sd_mt_userdb_id`) REFERENCES `sd_mt_userdb` (`ID`),
  ADD CONSTRAINT `FKrcmob97k7n32lvrrjxxqx7cpa` FOREIGN KEY (`sd_mt_group_id`) REFERENCES `sd_mt_group` (`ID`);

--
-- Constraints for table `sd_mt_user_role`
--
ALTER TABLE `sd_mt_user_role`
  ADD CONSTRAINT `FKcwhfa4iqwols2ybkff7of2kro` FOREIGN KEY (`sd_mt_role_id`) REFERENCES `sd_mt_role` (`ID`),
  ADD CONSTRAINT `FKntlucki34h48gh4g978ulda5a` FOREIGN KEY (`sd_mt_userdb_id`) REFERENCES `sd_mt_userdb` (`ID`);

--
-- Constraints for table `sd_task`
--
ALTER TABLE `sd_task`
  ADD CONSTRAINT `FKk9cs13rnftq2t39vptayjya69` FOREIGN KEY (`sd_mt_project_id`) REFERENCES `sd_mt_project` (`id`);

--
-- Constraints for table `sd_task_settings`
--
ALTER TABLE `sd_task_settings`
  ADD CONSTRAINT `FK62pihd9vdxuhi8av6i9kdcf8e` FOREIGN KEY (`sd_task_id`) REFERENCES `sd_task` (`ID`) ON DELETE CASCADE ON UPDATE SET NULL;
--
-- Database: `sds_dsc_new`
--
CREATE DATABASE IF NOT EXISTS `sds_dsc_new` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_uca1400_ai_ci;
USE `sds_dsc_new`;

-- --------------------------------------------------------

--
-- Table structure for table `sd_acro`
--

CREATE TABLE `sd_acro` (
  `ID` int(11) NOT NULL,
  `sd_project_id` int(11) NOT NULL,
  `content_name` varchar(255) NOT NULL,
  `secret_key` varchar(255) DEFAULT NULL,
  `plain_content` text DEFAULT NULL,
  `fields_content` text DEFAULT NULL,
  `thumbnail_path` text DEFAULT NULL,
  `fields` text NOT NULL,
  `status` int(11) DEFAULT 5 COMMENT '5: DRAFT | 10: IN-PROGRESS | 15: COMPLETE',
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf16 COLLATE=utf16_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sd_admin_doc_action_types`
--

CREATE TABLE `sd_admin_doc_action_types` (
  `ID` int(11) NOT NULL,
  `category` varchar(50) NOT NULL,
  `action_name` varchar(100) NOT NULL,
  `description` text DEFAULT NULL,
  `created_time` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `action_type_id` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf16 COLLATE=utf16_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sd_admin_mail`
--

CREATE TABLE `sd_admin_mail` (
  `ID` int(11) NOT NULL,
  `mail_name` varchar(255) NOT NULL,
  `mail_subject` text NOT NULL,
  `mail_msg` longtext NOT NULL,
  `last_modified_by` datetime NOT NULL,
  `last_modified_time` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf16 COLLATE=utf16_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sd_admin_menu`
--

CREATE TABLE `sd_admin_menu` (
  `ID` int(10) UNSIGNED NOT NULL,
  `label` varchar(50) NOT NULL,
  `icon` varchar(50) NOT NULL,
  `link` varchar(150) NOT NULL,
  `roles` varchar(255) NOT NULL,
  `order_number` int(11) NOT NULL DEFAULT 0,
  `parent_id` int(10) UNSIGNED DEFAULT NULL,
  `created_time` datetime DEFAULT NULL,
  `last_modified_time` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sd_admin_mt_role`
--

CREATE TABLE `sd_admin_mt_role` (
  `ID` int(11) NOT NULL,
  `role_name` varchar(100) NOT NULL,
  `created_time` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sd_admin_mt_userdb`
--

CREATE TABLE `sd_admin_mt_userdb` (
  `ID` int(11) NOT NULL,
  `ename` varchar(255) DEFAULT NULL,
  `euserid` varchar(255) DEFAULT NULL,
  `epassword` varchar(255) DEFAULT NULL,
  `emailid` varchar(255) DEFAULT NULL,
  `mobile_no` varchar(255) DEFAULT NULL,
  `designation` varchar(250) DEFAULT NULL,
  `profile_img` text DEFAULT NULL,
  `last_login_time` datetime DEFAULT NULL,
  `last_login_ip` varchar(50) DEFAULT NULL,
  `last_reset_time` datetime DEFAULT NULL,
  `change_pass` int(11) DEFAULT 0,
  `created_time` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT 0,
  `active_status` int(11) NOT NULL DEFAULT 0,
  `failed_attempts` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sd_admin_mt_user_otp`
--

CREATE TABLE `sd_admin_mt_user_otp` (
  `ID` int(11) NOT NULL,
  `otp_type` enum('EMAIL','MOBILE') NOT NULL,
  `country_code` varchar(5) NOT NULL DEFAULT '0',
  `mobile_no` varchar(50) DEFAULT NULL,
  `email_id` varchar(255) DEFAULT NULL,
  `otp_code_hash` varchar(255) NOT NULL,
  `otp_created_time` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf16 COLLATE=utf16_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sd_admin_mt_user_role`
--

CREATE TABLE `sd_admin_mt_user_role` (
  `ID` int(11) NOT NULL,
  `sd_mt_userdb_id` int(11) NOT NULL,
  `sd_mt_role_id` int(11) NOT NULL,
  `created_time` datetime DEFAULT NULL,
  `created_by` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sd_audit_log`
--

CREATE TABLE `sd_audit_log` (
  `ID` int(11) NOT NULL,
  `sd_admin_mt_userdb_id` int(11) DEFAULT NULL,
  `login_timestamp` datetime NOT NULL,
  `logout_timestamp` datetime DEFAULT NULL,
  `session_id` varchar(100) DEFAULT NULL,
  `session_duration` int(11) DEFAULT NULL COMMENT 'Duration in seconds',
  `ip_address` varchar(45) NOT NULL,
  `country` varchar(100) DEFAULT NULL,
  `city` varchar(100) DEFAULT NULL,
  `device_type` varchar(50) DEFAULT NULL COMMENT 'mobile, desktop, tablet, etc.',
  `device_name` varchar(100) DEFAULT NULL,
  `operating_system` varchar(100) DEFAULT NULL,
  `os_version` varchar(50) DEFAULT NULL,
  `browser` varchar(100) DEFAULT NULL,
  `browser_version` varchar(50) DEFAULT NULL,
  `auth_method_id` int(11) DEFAULT NULL,
  `login_status` varchar(20) NOT NULL COMMENT 'success, failed, locked, etc.',
  `failure_reason` varchar(255) DEFAULT NULL,
  `failed_attempts_count` int(11) DEFAULT 0,
  `is_suspicious` tinyint(1) DEFAULT 0,
  `suspicious_reason` text DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf16 COLLATE=utf16_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sd_contacts`
--

CREATE TABLE `sd_contacts` (
  `ID` int(11) NOT NULL,
  `sd_admin_mt_userdb_id` int(11) NOT NULL,
  `contact_userdb_id` int(11) NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf16 COLLATE=utf16_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sd_doc`
--

CREATE TABLE `sd_doc` (
  `ID` int(11) NOT NULL,
  `sd_admin_mt_userdb_id` int(11) NOT NULL,
  `category_id` int(11) DEFAULT NULL,
  `doc_title` varchar(255) NOT NULL,
  `doc_file` longtext DEFAULT NULL,
  `fields_content` longtext DEFAULT NULL,
  `signed_content` longtext DEFAULT NULL,
  `thumbnail_path` varchar(255) DEFAULT NULL,
  `fields` longtext NOT NULL,
  `created_by` int(11) NOT NULL,
  `last_modified_by` int(11) NOT NULL,
  `doc_status` int(11) DEFAULT 5 COMMENT '5: DRAFT | 10: IN-PROGRESS | 15: COMPLETE',
  `created_time` datetime DEFAULT NULL,
  `last_modified_time` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf16 COLLATE=utf16_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sd_doc_action_logs`
--

CREATE TABLE `sd_doc_action_logs` (
  `ID` int(11) NOT NULL,
  `doc_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `action_type_id` varchar(50) NOT NULL,
  `action_timestamp` datetime DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` varchar(255) DEFAULT NULL,
  `action_details` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`action_details`)),
  `session_id` varchar(100) DEFAULT NULL,
  `status` varchar(20) DEFAULT 'success',
  `error_message` text DEFAULT NULL,
  `geo_location` varchar(100) DEFAULT NULL,
  `device_info` varchar(100) DEFAULT NULL,
  `recipient_id` varchar(36) DEFAULT NULL,
  `field_id` varchar(36) DEFAULT NULL,
  `page_number` int(11) DEFAULT NULL,
  `created_time` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf16 COLLATE=utf16_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sd_doc_category`
--

CREATE TABLE `sd_doc_category` (
  `ID` int(11) NOT NULL,
  `category_name` varchar(255) NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf16 COLLATE=utf16_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sd_doc_flow`
--

CREATE TABLE `sd_doc_flow` (
  `ID` int(11) NOT NULL,
  `sd_admin_mt_userdb_id` int(11) NOT NULL,
  `sd_doc_id` int(11) NOT NULL,
  `sd_user_type` int(11) NOT NULL,
  `sig_field` varchar(255) DEFAULT NULL,
  `other_field` varchar(255) DEFAULT NULL,
  `user_email` varchar(255) DEFAULT '',
  `signing_order` int(11) DEFAULT 0,
  `sent_date` datetime DEFAULT NULL,
  `viewed_date` datetime DEFAULT NULL,
  `completed_date` datetime DEFAULT NULL,
  `last_reminded_date` datetime DEFAULT NULL,
  `reminder_count` int(11) DEFAULT 0,
  `access_code` varchar(255) DEFAULT '',
  `status` int(11) DEFAULT 1,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf16 COLLATE=utf16_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sd_doc_secure_links`
--

CREATE TABLE `sd_doc_secure_links` (
  `id` int(11) NOT NULL,
  `document_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `type` enum('sign','download') NOT NULL,
  `access_code` varchar(255) DEFAULT NULL,
  `token` varchar(255) NOT NULL,
  `expires_at` datetime NOT NULL,
  `is_used` tinyint(1) DEFAULT 0,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf16 COLLATE=utf16_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sd_doc_templates`
--

CREATE TABLE `sd_doc_templates` (
  `ID` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `file_size` int(11) DEFAULT NULL,
  `file_type` varchar(255) DEFAULT NULL,
  `file_name` varchar(255) DEFAULT NULL,
  `type` enum('user','system') NOT NULL DEFAULT 'user',
  `description` text DEFAULT NULL,
  `temp_status` int(11) DEFAULT 5 COMMENT '5: DRAFT | 10: FINAL',
  `category_id` int(11) DEFAULT NULL,
  `title` varchar(255) NOT NULL,
  `plain_content` longtext DEFAULT '',
  `fields_content` longtext DEFAULT NULL,
  `thumbnail_path` varchar(255) DEFAULT NULL,
  `fields` longtext NOT NULL,
  `created_by` int(11) NOT NULL,
  `last_modified_by` int(11) NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf16 COLLATE=utf16_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sd_dsc`
--

CREATE TABLE `sd_dsc` (
  `ID` int(11) NOT NULL,
  `dsc_empid` varchar(256) NOT NULL,
  `dsc_empname` varchar(256) NOT NULL,
  `dsc_type` varchar(10) NOT NULL COMMENT 'SOFT KEY / HARD KEY',
  `dsc_register_by` varchar(25) NOT NULL COMMENT 'Site Admin / Guest',
  `dsc_register_time` datetime DEFAULT NULL,
  `dsc_not_before` datetime DEFAULT NULL,
  `dsc_not_after` datetime DEFAULT NULL,
  `dsc_cn` varchar(255) DEFAULT NULL,
  `dsc_dn` varchar(1000) DEFAULT NULL,
  `dsc_cert_pem` longtext DEFAULT NULL,
  `dsc_cert_pfx` longtext DEFAULT NULL,
  `dsc_serial_number` varchar(1000) DEFAULT NULL,
  `dsc_status` int(11) NOT NULL DEFAULT 5,
  `last_modified_time` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf16 COLLATE=utf16_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sd_dsc_payment`
--

CREATE TABLE `sd_dsc_payment` (
  `ID` int(11) NOT NULL,
  `email_id` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `mobile_no` varchar(20) DEFAULT NULL,
  `billing_address` text DEFAULT NULL,
  `gst_no` varchar(50) DEFAULT NULL,
  `created_time` datetime DEFAULT NULL,
  `last_modified_time` datetime DEFAULT NULL,
  `payment_start_time` datetime DEFAULT NULL,
  `payment_ref_no` varchar(100) DEFAULT NULL,
  `payment_amount` float DEFAULT 0,
  `payment_tax` float DEFAULT 0,
  `payment_total_amount` float DEFAULT 0,
  `payment_status` varchar(50) DEFAULT 'pending',
  `plan_mode` varchar(255) DEFAULT NULL,
  `plan_duration` varchar(255) DEFAULT NULL,
  `plan_end_date` datetime DEFAULT NULL,
  `plan_count` int(11) DEFAULT NULL,
  `payment_end_time` datetime DEFAULT NULL,
  `payment_currency` varchar(255) DEFAULT NULL,
  `razorpay_order_id` varchar(255) DEFAULT NULL,
  `razorpay_payment_id` varchar(255) DEFAULT NULL,
  `razorpay_signature` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf16 COLLATE=utf16_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sd_electro_sign`
--

CREATE TABLE `sd_electro_sign` (
  `ID` int(11) NOT NULL,
  `sd_admin_mt_userdb_id` int(11) NOT NULL,
  `sign_content` longtext DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL COMMENT 'TEXT | DRAW | UPLOAD',
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf16 COLLATE=utf16_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sd_notifications`
--

CREATE TABLE `sd_notifications` (
  `ID` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `document_id` int(11) DEFAULT NULL,
  `category` enum('LOGIN','DOCUMENT','SYSTEM') NOT NULL,
  `sub_type` varchar(255) NOT NULL,
  `message` text NOT NULL,
  `is_read` tinyint(1) NOT NULL DEFAULT 0,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf16 COLLATE=utf16_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sd_project`
--

CREATE TABLE `sd_project` (
  `id` int(11) NOT NULL,
  `project_name` varchar(256) NOT NULL,
  `project_description` text NOT NULL,
  `project_env` varchar(15) NOT NULL COMMENT 'Development | Testing | Production',
  `owner_email` varchar(256) NOT NULL,
  `ip_listing_enable` int(11) DEFAULT 0,
  `brand_logo` longtext DEFAULT NULL,
  `access_key` longtext DEFAULT NULL,
  `secret_key` longtext DEFAULT NULL,
  `page_title` text DEFAULT NULL,
  `created_by` varchar(256) DEFAULT NULL,
  `created_time` datetime DEFAULT NULL,
  `last_modified_time` datetime DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf16 COLLATE=utf16_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sd_project_callback`
--

CREATE TABLE `sd_project_callback` (
  `ID` int(11) NOT NULL,
  `sd_project_id` int(11) NOT NULL,
  `callback_url` varchar(255) NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf16 COLLATE=utf16_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sd_project_ip`
--

CREATE TABLE `sd_project_ip` (
  `ID` int(11) NOT NULL,
  `sd_project_id` int(11) NOT NULL,
  `ip_address` varchar(255) NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf16 COLLATE=utf16_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sd_project_user`
--

CREATE TABLE `sd_project_user` (
  `ID` int(11) NOT NULL,
  `sd_project_id` int(11) NOT NULL,
  `sd_mt_userdb_id` int(11) NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf16 COLLATE=utf16_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sd_task`
--

CREATE TABLE `sd_task` (
  `id` int(11) NOT NULL,
  `sd_project_id` int(11) DEFAULT NULL,
  `sd_doc_id` int(11) DEFAULT NULL,
  `task_user_id` varchar(256) DEFAULT NULL,
  `task_user_name` varchar(256) DEFAULT NULL,
  `task_created_portal` text DEFAULT NULL,
  `task_created_time` datetime DEFAULT NULL,
  `task_status` varchar(100) DEFAULT NULL,
  `task_error` text DEFAULT NULL,
  `task_digi_cert_status` varchar(10) DEFAULT NULL,
  `task_completion_time` datetime DEFAULT NULL,
  `full_task_log` text DEFAULT NULL,
  `task_type` varchar(100) DEFAULT NULL,
  `task_fields` text DEFAULT NULL,
  `task_purpose` varchar(100) DEFAULT NULL,
  `redirect_url` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf16 COLLATE=utf16_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sd_task_sub`
--

CREATE TABLE `sd_task_sub` (
  `id` int(11) NOT NULL,
  `sd_task_api_id` int(11) NOT NULL,
  `title` varchar(256) NOT NULL,
  `content_path` varchar(256) NOT NULL,
  `task_sub_fields` text DEFAULT NULL,
  `status` int(11) DEFAULT NULL COMMENT '5: PENDING | 10: SIGNED | 15: CANCELED',
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf16 COLLATE=utf16_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `sd_acro`
--
ALTER TABLE `sd_acro`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `sd_project_id` (`sd_project_id`);

--
-- Indexes for table `sd_admin_doc_action_types`
--
ALTER TABLE `sd_admin_doc_action_types`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `sd_admin_mail`
--
ALTER TABLE `sd_admin_mail`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `sd_admin_menu`
--
ALTER TABLE `sd_admin_menu`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `parent_id` (`parent_id`);

--
-- Indexes for table `sd_admin_mt_role`
--
ALTER TABLE `sd_admin_mt_role`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `sd_admin_mt_userdb`
--
ALTER TABLE `sd_admin_mt_userdb`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `emailid` (`emailid`),
  ADD UNIQUE KEY `emailid_2` (`emailid`),
  ADD UNIQUE KEY `emailid_3` (`emailid`);

--
-- Indexes for table `sd_admin_mt_user_otp`
--
ALTER TABLE `sd_admin_mt_user_otp`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `sd_admin_mt_user_role`
--
ALTER TABLE `sd_admin_mt_user_role`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `FKcwhfa4iqwols2ybkff7of2kro` (`sd_mt_role_id`),
  ADD KEY `FKntlucki34h48gh4g978ulda5a` (`sd_mt_userdb_id`);

--
-- Indexes for table `sd_audit_log`
--
ALTER TABLE `sd_audit_log`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `sd_admin_mt_userdb_id` (`sd_admin_mt_userdb_id`),
  ADD KEY `auth_method_id` (`auth_method_id`);

--
-- Indexes for table `sd_contacts`
--
ALTER TABLE `sd_contacts`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `sd_admin_mt_userdb_id` (`sd_admin_mt_userdb_id`),
  ADD KEY `contact_userdb_id` (`contact_userdb_id`);

--
-- Indexes for table `sd_doc`
--
ALTER TABLE `sd_doc`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `sd_admin_mt_userdb_id` (`sd_admin_mt_userdb_id`),
  ADD KEY `category_id` (`category_id`);

--
-- Indexes for table `sd_doc_action_logs`
--
ALTER TABLE `sd_doc_action_logs`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `doc_id` (`doc_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `sd_doc_category`
--
ALTER TABLE `sd_doc_category`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `sd_doc_flow`
--
ALTER TABLE `sd_doc_flow`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `sd_admin_mt_userdb_id` (`sd_admin_mt_userdb_id`),
  ADD KEY `sd_doc_id` (`sd_doc_id`);

--
-- Indexes for table `sd_doc_secure_links`
--
ALTER TABLE `sd_doc_secure_links`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `token` (`token`),
  ADD UNIQUE KEY `token_2` (`token`),
  ADD UNIQUE KEY `token_3` (`token`),
  ADD KEY `document_id` (`document_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `sd_doc_templates`
--
ALTER TABLE `sd_doc_templates`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `category_id` (`category_id`);

--
-- Indexes for table `sd_dsc`
--
ALTER TABLE `sd_dsc`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `sd_dsc_payment`
--
ALTER TABLE `sd_dsc_payment`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `sd_electro_sign`
--
ALTER TABLE `sd_electro_sign`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `sd_admin_mt_userdb_id` (`sd_admin_mt_userdb_id`);

--
-- Indexes for table `sd_notifications`
--
ALTER TABLE `sd_notifications`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `document_id` (`document_id`);

--
-- Indexes for table `sd_project`
--
ALTER TABLE `sd_project`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sd_project_callback`
--
ALTER TABLE `sd_project_callback`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `sd_project_id` (`sd_project_id`);

--
-- Indexes for table `sd_project_ip`
--
ALTER TABLE `sd_project_ip`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `sd_project_id` (`sd_project_id`);

--
-- Indexes for table `sd_project_user`
--
ALTER TABLE `sd_project_user`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `sd_project_user_sd_project_id_sd_mt_userdb_id_unique` (`sd_project_id`,`sd_mt_userdb_id`),
  ADD KEY `sd_mt_userdb_id` (`sd_mt_userdb_id`);

--
-- Indexes for table `sd_task`
--
ALTER TABLE `sd_task`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sd_project_id` (`sd_project_id`),
  ADD KEY `sd_doc_id` (`sd_doc_id`);

--
-- Indexes for table `sd_task_sub`
--
ALTER TABLE `sd_task_sub`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sd_task_api_id` (`sd_task_api_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `sd_acro`
--
ALTER TABLE `sd_acro`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sd_admin_doc_action_types`
--
ALTER TABLE `sd_admin_doc_action_types`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sd_admin_mail`
--
ALTER TABLE `sd_admin_mail`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sd_admin_menu`
--
ALTER TABLE `sd_admin_menu`
  MODIFY `ID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sd_admin_mt_role`
--
ALTER TABLE `sd_admin_mt_role`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sd_admin_mt_userdb`
--
ALTER TABLE `sd_admin_mt_userdb`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sd_admin_mt_user_otp`
--
ALTER TABLE `sd_admin_mt_user_otp`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sd_admin_mt_user_role`
--
ALTER TABLE `sd_admin_mt_user_role`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sd_audit_log`
--
ALTER TABLE `sd_audit_log`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sd_contacts`
--
ALTER TABLE `sd_contacts`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sd_doc`
--
ALTER TABLE `sd_doc`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sd_doc_action_logs`
--
ALTER TABLE `sd_doc_action_logs`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sd_doc_category`
--
ALTER TABLE `sd_doc_category`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sd_doc_flow`
--
ALTER TABLE `sd_doc_flow`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sd_doc_secure_links`
--
ALTER TABLE `sd_doc_secure_links`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sd_doc_templates`
--
ALTER TABLE `sd_doc_templates`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sd_dsc`
--
ALTER TABLE `sd_dsc`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sd_dsc_payment`
--
ALTER TABLE `sd_dsc_payment`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sd_electro_sign`
--
ALTER TABLE `sd_electro_sign`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sd_notifications`
--
ALTER TABLE `sd_notifications`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sd_project`
--
ALTER TABLE `sd_project`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sd_project_callback`
--
ALTER TABLE `sd_project_callback`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sd_project_ip`
--
ALTER TABLE `sd_project_ip`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sd_project_user`
--
ALTER TABLE `sd_project_user`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sd_task`
--
ALTER TABLE `sd_task`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sd_task_sub`
--
ALTER TABLE `sd_task_sub`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `sd_acro`
--
ALTER TABLE `sd_acro`
  ADD CONSTRAINT `sd_acro_ibfk_1` FOREIGN KEY (`sd_project_id`) REFERENCES `sd_project` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `sd_admin_menu`
--
ALTER TABLE `sd_admin_menu`
  ADD CONSTRAINT `sd_admin_menu_ibfk_1` FOREIGN KEY (`parent_id`) REFERENCES `sd_admin_menu` (`ID`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `sd_admin_mt_user_role`
--
ALTER TABLE `sd_admin_mt_user_role`
  ADD CONSTRAINT `sd_admin_mt_user_role_ibfk_10` FOREIGN KEY (`sd_mt_role_id`) REFERENCES `sd_admin_mt_role` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `sd_admin_mt_user_role_ibfk_9` FOREIGN KEY (`sd_mt_userdb_id`) REFERENCES `sd_admin_mt_userdb` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `sd_audit_log`
--
ALTER TABLE `sd_audit_log`
  ADD CONSTRAINT `sd_audit_log_ibfk_5` FOREIGN KEY (`sd_admin_mt_userdb_id`) REFERENCES `sd_admin_mt_userdb` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `sd_audit_log_ibfk_6` FOREIGN KEY (`auth_method_id`) REFERENCES `sd_admin_mt_role` (`ID`);

--
-- Constraints for table `sd_contacts`
--
ALTER TABLE `sd_contacts`
  ADD CONSTRAINT `sd_contacts_ibfk_1` FOREIGN KEY (`sd_admin_mt_userdb_id`) REFERENCES `sd_admin_mt_userdb` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `sd_contacts_ibfk_2` FOREIGN KEY (`contact_userdb_id`) REFERENCES `sd_admin_mt_userdb` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `sd_doc`
--
ALTER TABLE `sd_doc`
  ADD CONSTRAINT `sd_doc_ibfk_5` FOREIGN KEY (`sd_admin_mt_userdb_id`) REFERENCES `sd_admin_mt_userdb` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `sd_doc_ibfk_6` FOREIGN KEY (`category_id`) REFERENCES `sd_doc_category` (`ID`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `sd_doc_action_logs`
--
ALTER TABLE `sd_doc_action_logs`
  ADD CONSTRAINT `sd_doc_action_logs_ibfk_5` FOREIGN KEY (`doc_id`) REFERENCES `sd_doc` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `sd_doc_action_logs_ibfk_6` FOREIGN KEY (`user_id`) REFERENCES `sd_admin_mt_userdb` (`ID`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `sd_doc_flow`
--
ALTER TABLE `sd_doc_flow`
  ADD CONSTRAINT `sd_doc_flow_ibfk_5` FOREIGN KEY (`sd_admin_mt_userdb_id`) REFERENCES `sd_admin_mt_userdb` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `sd_doc_flow_ibfk_6` FOREIGN KEY (`sd_doc_id`) REFERENCES `sd_doc` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `sd_doc_secure_links`
--
ALTER TABLE `sd_doc_secure_links`
  ADD CONSTRAINT `sd_doc_secure_links_ibfk_5` FOREIGN KEY (`document_id`) REFERENCES `sd_doc_flow` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `sd_doc_secure_links_ibfk_6` FOREIGN KEY (`user_id`) REFERENCES `sd_admin_mt_userdb` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `sd_doc_templates`
--
ALTER TABLE `sd_doc_templates`
  ADD CONSTRAINT `sd_doc_templates_ibfk_5` FOREIGN KEY (`user_id`) REFERENCES `sd_admin_mt_userdb` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `sd_doc_templates_ibfk_6` FOREIGN KEY (`category_id`) REFERENCES `sd_doc_category` (`ID`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `sd_electro_sign`
--
ALTER TABLE `sd_electro_sign`
  ADD CONSTRAINT `sd_electro_sign_ibfk_1` FOREIGN KEY (`sd_admin_mt_userdb_id`) REFERENCES `sd_admin_mt_userdb` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `sd_notifications`
--
ALTER TABLE `sd_notifications`
  ADD CONSTRAINT `sd_notifications_ibfk_5` FOREIGN KEY (`user_id`) REFERENCES `sd_admin_mt_userdb` (`ID`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `sd_notifications_ibfk_6` FOREIGN KEY (`document_id`) REFERENCES `sd_doc` (`ID`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `sd_project_callback`
--
ALTER TABLE `sd_project_callback`
  ADD CONSTRAINT `sd_project_callback_ibfk_1` FOREIGN KEY (`sd_project_id`) REFERENCES `sd_project` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `sd_project_ip`
--
ALTER TABLE `sd_project_ip`
  ADD CONSTRAINT `sd_project_ip_ibfk_1` FOREIGN KEY (`sd_project_id`) REFERENCES `sd_project` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `sd_project_user`
--
ALTER TABLE `sd_project_user`
  ADD CONSTRAINT `sd_project_user_ibfk_5` FOREIGN KEY (`sd_project_id`) REFERENCES `sd_project` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `sd_project_user_ibfk_6` FOREIGN KEY (`sd_mt_userdb_id`) REFERENCES `sd_admin_mt_userdb` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `sd_task`
--
ALTER TABLE `sd_task`
  ADD CONSTRAINT `sd_task_ibfk_5` FOREIGN KEY (`sd_project_id`) REFERENCES `sd_project` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `sd_task_ibfk_6` FOREIGN KEY (`sd_doc_id`) REFERENCES `sd_doc` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `sd_task_sub`
--
ALTER TABLE `sd_task_sub`
  ADD CONSTRAINT `sd_task_sub_ibfk_1` FOREIGN KEY (`sd_task_api_id`) REFERENCES `sd_task` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
--
-- Database: `sds_ecom`
--
CREATE DATABASE IF NOT EXISTS `sds_ecom` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_uca1400_ai_ci;
USE `sds_ecom`;

-- --------------------------------------------------------

--
-- Table structure for table `sd_admin_branding_settings`
--

CREATE TABLE `sd_admin_branding_settings` (
  `ID` int(11) NOT NULL,
  `sd_admin_mt_userdb_id` int(11) NOT NULL,
  `logoUrl` varchar(500) DEFAULT NULL,
  `primaryColor` varchar(7) DEFAULT NULL,
  `secondaryColor` varchar(7) DEFAULT NULL,
  `companyName` varchar(255) DEFAULT NULL,
  `emailFromName` varchar(255) DEFAULT NULL,
  `customCss` text DEFAULT NULL,
  `isActive` tinyint(1) NOT NULL DEFAULT 1,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sd_admin_cookie_consent`
--

CREATE TABLE `sd_admin_cookie_consent` (
  `ID` int(11) NOT NULL,
  `userId` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `anonymousId` varchar(255) DEFAULT NULL,
  `ipAddress` varchar(255) NOT NULL,
  `essentialCookies` tinyint(1) NOT NULL DEFAULT 1,
  `functionalCookies` tinyint(1) NOT NULL DEFAULT 0,
  `analyticsCookies` tinyint(1) NOT NULL DEFAULT 0,
  `advertisingCookies` tinyint(1) NOT NULL DEFAULT 0,
  `userAgent` text NOT NULL,
  `source` varchar(255) NOT NULL,
  `policyVersion` varchar(255) NOT NULL DEFAULT '1.0',
  `last_modified_time` datetime NOT NULL,
  `isWithdrawn` tinyint(1) DEFAULT 0,
  `withdrawnAt` datetime DEFAULT NULL,
  `created_time` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sd_admin_mail`
--

CREATE TABLE `sd_admin_mail` (
  `ID` int(11) NOT NULL,
  `mail_name` varchar(255) NOT NULL,
  `mail_subject` text NOT NULL,
  `mail_msg` longtext NOT NULL,
  `last_modified_by` datetime NOT NULL,
  `last_modified_time` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sd_admin_menu`
--

CREATE TABLE `sd_admin_menu` (
  `ID` int(10) UNSIGNED NOT NULL,
  `label` varchar(50) NOT NULL,
  `icon` varchar(50) NOT NULL,
  `link` varchar(150) NOT NULL,
  `roles` varchar(255) NOT NULL,
  `order_number` int(11) NOT NULL DEFAULT 0,
  `parent_id` int(10) UNSIGNED DEFAULT NULL,
  `created_time` datetime DEFAULT NULL,
  `last_modified_time` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sd_admin_mt_role`
--

CREATE TABLE `sd_admin_mt_role` (
  `ID` int(11) NOT NULL,
  `role_name` varchar(100) NOT NULL,
  `created_time` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sd_admin_mt_userdb`
--

CREATE TABLE `sd_admin_mt_userdb` (
  `ID` int(11) NOT NULL,
  `emailid` varchar(255) DEFAULT NULL,
  `ename` varchar(255) DEFAULT NULL,
  `epassword` varchar(255) DEFAULT NULL,
  `euserid` varchar(255) DEFAULT NULL,
  `mobile_no` varchar(255) DEFAULT NULL,
  `designation` varchar(250) DEFAULT NULL,
  `profile_img` text DEFAULT NULL,
  `last_login_time` datetime DEFAULT NULL,
  `last_login_ip` varchar(50) DEFAULT NULL,
  `last_reset_time` datetime DEFAULT NULL,
  `change_pass` int(11) DEFAULT 0,
  `created_time` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT 0,
  `active_status` int(11) NOT NULL DEFAULT 0,
  `failed_attempts` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sd_admin_mt_user_role`
--

CREATE TABLE `sd_admin_mt_user_role` (
  `ID` int(11) NOT NULL,
  `sd_mt_userdb_id` int(11) NOT NULL,
  `sd_mt_role_id` int(11) NOT NULL,
  `created_by` varchar(100) NOT NULL,
  `created_time` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sd_audit_log`
--

CREATE TABLE `sd_audit_log` (
  `ID` int(11) NOT NULL,
  `sd_admin_mt_userdb_id` int(11) DEFAULT NULL,
  `login_timestamp` datetime NOT NULL,
  `logout_timestamp` datetime DEFAULT NULL,
  `session_id` varchar(100) DEFAULT NULL,
  `session_duration` int(11) DEFAULT NULL COMMENT 'Duration in seconds',
  `ip_address` varchar(45) NOT NULL,
  `country` varchar(100) DEFAULT NULL,
  `city` varchar(100) DEFAULT NULL,
  `device_type` varchar(50) DEFAULT NULL COMMENT 'mobile, desktop, tablet, etc.',
  `device_name` varchar(100) DEFAULT NULL,
  `operating_system` varchar(100) DEFAULT NULL,
  `os_version` varchar(50) DEFAULT NULL,
  `browser` varchar(100) DEFAULT NULL,
  `browser_version` varchar(50) DEFAULT NULL,
  `auth_method_id` int(11) DEFAULT NULL,
  `login_status` varchar(20) NOT NULL COMMENT 'success, failed, locked, etc.',
  `failure_reason` varchar(255) DEFAULT NULL,
  `failed_attempts_count` int(11) DEFAULT 0,
  `is_suspicious` tinyint(1) DEFAULT 0,
  `suspicious_reason` text DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sd_cart`
--

CREATE TABLE `sd_cart` (
  `ID` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `productId` int(11) NOT NULL,
  `quantity` int(11) NOT NULL DEFAULT 1,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sd_help_category`
--

CREATE TABLE `sd_help_category` (
  `ID` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `category_name` varchar(100) DEFAULT NULL,
  `colorClass` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sd_help_knowledge_base`
--

CREATE TABLE `sd_help_knowledge_base` (
  `ID` int(11) NOT NULL,
  `sd_admin_mt_userdb_id` int(11) DEFAULT NULL,
  `title` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  `views_count` int(11) DEFAULT 0,
  `pdf_file` text DEFAULT NULL,
  `featured` varchar(255) DEFAULT NULL,
  `last_modified_time` datetime DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sd_help_rating`
--

CREATE TABLE `sd_help_rating` (
  `ID` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `sd_help_knowledge_id` int(11) DEFAULT NULL,
  `rate_point` float DEFAULT NULL,
  `review` text DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sd_help_view`
--

CREATE TABLE `sd_help_view` (
  `ID` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `sd_help_knowledge_id` int(11) DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `country` varchar(100) DEFAULT NULL,
  `city` varchar(100) DEFAULT NULL,
  `device_type` varchar(50) DEFAULT NULL COMMENT 'mobile, desktop, tablet, etc.',
  `device_name` varchar(100) DEFAULT NULL,
  `operating_system` varchar(100) DEFAULT NULL,
  `os_version` varchar(50) DEFAULT NULL,
  `browser` varchar(100) DEFAULT NULL,
  `browser_version` varchar(50) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sd_orders`
--

CREATE TABLE `sd_orders` (
  `ID` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `totalAmount` float NOT NULL,
  `status` enum('pending','confirmed','shipped','delivered','cancelled') DEFAULT 'pending',
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sd_order_items`
--

CREATE TABLE `sd_order_items` (
  `ID` int(11) NOT NULL,
  `orderId` int(11) NOT NULL,
  `productId` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `price` float NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sd_payments`
--

CREATE TABLE `sd_payments` (
  `ID` int(11) NOT NULL,
  `orderId` int(11) NOT NULL,
  `paymentMode` enum('card','upi','netbanking','cod') NOT NULL,
  `status` enum('pending','completed','failed') DEFAULT 'pending',
  `transactionId` varchar(255) DEFAULT NULL,
  `amount` float NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sd_products`
--

CREATE TABLE `sd_products` (
  `ID` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `categoryId` int(11) DEFAULT NULL,
  `userId` int(11) NOT NULL,
  `is_active` tinyint(1) DEFAULT 1,
  `description` text DEFAULT NULL,
  `productBrand` text DEFAULT NULL,
  `basePrice` float NOT NULL,
  `discount` float DEFAULT NULL,
  `total_price` float DEFAULT NULL,
  `stock` int(11) DEFAULT NULL,
  `whatsappNo` text DEFAULT NULL,
  `like_count` int(11) DEFAULT 0,
  `flashSales` int(11) DEFAULT 0,
  `cart_count` int(11) DEFAULT 0,
  `wishlist_count` int(11) DEFAULT 0,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sd_product_categories`
--

CREATE TABLE `sd_product_categories` (
  `ID` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sd_product_images`
--

CREATE TABLE `sd_product_images` (
  `ID` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `content` longtext DEFAULT NULL,
  `type` varchar(100) NOT NULL,
  `size` int(11) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sd_product_likes`
--

CREATE TABLE `sd_product_likes` (
  `ID` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `productId` int(11) NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sd_project`
--

CREATE TABLE `sd_project` (
  `id` int(11) NOT NULL,
  `project_name` varchar(256) NOT NULL,
  `project_description` text NOT NULL,
  `project_env` varchar(15) NOT NULL COMMENT 'Development | Testing | Production',
  `owner_email` varchar(256) NOT NULL,
  `ip_listing_enable` int(11) DEFAULT 0,
  `brand_logo` longtext DEFAULT NULL,
  `access_key` longtext DEFAULT NULL,
  `secret_key` longtext DEFAULT NULL,
  `page_title` text DEFAULT NULL,
  `created_by` varchar(256) DEFAULT NULL,
  `created_time` datetime DEFAULT NULL,
  `last_modified_time` datetime DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sd_project_callback`
--

CREATE TABLE `sd_project_callback` (
  `ID` int(11) NOT NULL,
  `sd_project_id` int(11) NOT NULL,
  `callback_url` varchar(255) NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sd_project_ip`
--

CREATE TABLE `sd_project_ip` (
  `ID` int(11) NOT NULL,
  `sd_project_id` int(11) NOT NULL,
  `ip_address` varchar(255) NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sd_project_user`
--

CREATE TABLE `sd_project_user` (
  `ID` int(11) NOT NULL,
  `sd_project_id` int(11) NOT NULL,
  `sd_mt_userdb_id` int(11) NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sd_settings_admin`
--

CREATE TABLE `sd_settings_admin` (
  `ID` int(11) NOT NULL,
  `setting_definition_id` int(11) NOT NULL,
  `setting_value` text DEFAULT NULL,
  `is_encrypted` tinyint(1) DEFAULT 0,
  `updated_by` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sd_settings_category`
--

CREATE TABLE `sd_settings_category` (
  `ID` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `description` text DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT 1,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sd_settings_definition`
--

CREATE TABLE `sd_settings_definition` (
  `ID` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `setting_key` varchar(100) NOT NULL,
  `setting_name` varchar(200) NOT NULL,
  `description` text DEFAULT NULL,
  `data_type` enum('string','integer','boolean','decimal','json','file','email','url','text') NOT NULL,
  `default_value` text DEFAULT NULL,
  `validation_rules` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`validation_rules`)),
  `is_user_configurable` tinyint(1) DEFAULT 0,
  `is_required` tinyint(1) DEFAULT 0,
  `display_order` int(11) DEFAULT 0,
  `is_active` tinyint(1) DEFAULT 1,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sd_settings_user`
--

CREATE TABLE `sd_settings_user` (
  `ID` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `setting_definition_id` int(11) NOT NULL,
  `setting_value` text DEFAULT NULL,
  `is_encrypted` tinyint(1) DEFAULT 0,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sd_settings_v_effective_settings`
--

CREATE TABLE `sd_settings_v_effective_settings` (
  `setting_key` varchar(100) NOT NULL,
  `setting_name` varchar(200) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `data_type` enum('string','integer','boolean','decimal','json','file','email','url','text') DEFAULT NULL,
  `category_name` varchar(100) DEFAULT NULL,
  `effective_value` text DEFAULT NULL,
  `value_source` enum('user','admin','default') DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `is_user_configurable` tinyint(1) DEFAULT NULL,
  `validation_rules` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`validation_rules`)),
  `setting_definition_id` int(11) DEFAULT NULL,
  `user_setting_updated_at` datetime DEFAULT NULL,
  `admin_setting_updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sd_wishlist`
--

CREATE TABLE `sd_wishlist` (
  `ID` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `productId` int(11) NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `sd_admin_branding_settings`
--
ALTER TABLE `sd_admin_branding_settings`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `sd_admin_mt_userdb_id` (`sd_admin_mt_userdb_id`),
  ADD KEY `sd_admin_branding_settings_sd_admin_mt_userdb_id` (`sd_admin_mt_userdb_id`);

--
-- Indexes for table `sd_admin_cookie_consent`
--
ALTER TABLE `sd_admin_cookie_consent`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `sd_admin_mail`
--
ALTER TABLE `sd_admin_mail`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `sd_admin_menu`
--
ALTER TABLE `sd_admin_menu`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `parent_id` (`parent_id`);

--
-- Indexes for table `sd_admin_mt_role`
--
ALTER TABLE `sd_admin_mt_role`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `sd_admin_mt_userdb`
--
ALTER TABLE `sd_admin_mt_userdb`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `sd_admin_mt_user_role`
--
ALTER TABLE `sd_admin_mt_user_role`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `sd_admin_mt_user_role_sd_mt_role_id_sd_mt_userdb_id_unique` (`sd_mt_userdb_id`,`sd_mt_role_id`),
  ADD KEY `sd_mt_role_id` (`sd_mt_role_id`);

--
-- Indexes for table `sd_audit_log`
--
ALTER TABLE `sd_audit_log`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `sd_admin_mt_userdb_id` (`sd_admin_mt_userdb_id`),
  ADD KEY `auth_method_id` (`auth_method_id`);

--
-- Indexes for table `sd_cart`
--
ALTER TABLE `sd_cart`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `userId` (`userId`),
  ADD KEY `productId` (`productId`);

--
-- Indexes for table `sd_help_category`
--
ALTER TABLE `sd_help_category`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `sd_help_knowledge_base`
--
ALTER TABLE `sd_help_knowledge_base`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `sd_admin_mt_userdb_id` (`sd_admin_mt_userdb_id`),
  ADD KEY `category_id` (`category_id`);

--
-- Indexes for table `sd_help_rating`
--
ALTER TABLE `sd_help_rating`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `sd_help_knowledge_id` (`sd_help_knowledge_id`);

--
-- Indexes for table `sd_help_view`
--
ALTER TABLE `sd_help_view`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `sd_help_knowledge_id` (`sd_help_knowledge_id`);

--
-- Indexes for table `sd_orders`
--
ALTER TABLE `sd_orders`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `userId` (`userId`);

--
-- Indexes for table `sd_order_items`
--
ALTER TABLE `sd_order_items`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `orderId` (`orderId`),
  ADD KEY `productId` (`productId`);

--
-- Indexes for table `sd_payments`
--
ALTER TABLE `sd_payments`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `orderId` (`orderId`);

--
-- Indexes for table `sd_products`
--
ALTER TABLE `sd_products`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `categoryId` (`categoryId`),
  ADD KEY `userId` (`userId`);

--
-- Indexes for table `sd_product_categories`
--
ALTER TABLE `sd_product_categories`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `sd_product_images`
--
ALTER TABLE `sd_product_images`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `sd_product_likes`
--
ALTER TABLE `sd_product_likes`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `sd_product_likes_user_id_product_id` (`userId`,`productId`),
  ADD KEY `productId` (`productId`);

--
-- Indexes for table `sd_project`
--
ALTER TABLE `sd_project`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sd_project_callback`
--
ALTER TABLE `sd_project_callback`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `sd_project_id` (`sd_project_id`);

--
-- Indexes for table `sd_project_ip`
--
ALTER TABLE `sd_project_ip`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `sd_project_id` (`sd_project_id`);

--
-- Indexes for table `sd_project_user`
--
ALTER TABLE `sd_project_user`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `sd_project_user_sd_project_id_sd_mt_userdb_id_unique` (`sd_project_id`,`sd_mt_userdb_id`),
  ADD KEY `sd_mt_userdb_id` (`sd_mt_userdb_id`);

--
-- Indexes for table `sd_settings_admin`
--
ALTER TABLE `sd_settings_admin`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `setting_definition_id` (`setting_definition_id`),
  ADD KEY `sd_settings_admin_setting_definition_id` (`setting_definition_id`);

--
-- Indexes for table `sd_settings_category`
--
ALTER TABLE `sd_settings_category`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `sd_settings_definition`
--
ALTER TABLE `sd_settings_definition`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `setting_key` (`setting_key`),
  ADD KEY `sd_settings_definition_setting_key` (`setting_key`),
  ADD KEY `sd_settings_definition_category_id_is_user_configurable` (`category_id`,`is_user_configurable`);

--
-- Indexes for table `sd_settings_user`
--
ALTER TABLE `sd_settings_user`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `sd_settings_user_user_id_setting_definition_id` (`user_id`,`setting_definition_id`),
  ADD KEY `setting_definition_id` (`setting_definition_id`),
  ADD KEY `sd_settings_user_user_id` (`user_id`);

--
-- Indexes for table `sd_settings_v_effective_settings`
--
ALTER TABLE `sd_settings_v_effective_settings`
  ADD PRIMARY KEY (`setting_key`);

--
-- Indexes for table `sd_wishlist`
--
ALTER TABLE `sd_wishlist`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `userId` (`userId`),
  ADD KEY `productId` (`productId`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `sd_admin_branding_settings`
--
ALTER TABLE `sd_admin_branding_settings`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sd_admin_cookie_consent`
--
ALTER TABLE `sd_admin_cookie_consent`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sd_admin_mail`
--
ALTER TABLE `sd_admin_mail`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sd_admin_menu`
--
ALTER TABLE `sd_admin_menu`
  MODIFY `ID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sd_admin_mt_role`
--
ALTER TABLE `sd_admin_mt_role`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sd_admin_mt_userdb`
--
ALTER TABLE `sd_admin_mt_userdb`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sd_admin_mt_user_role`
--
ALTER TABLE `sd_admin_mt_user_role`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sd_audit_log`
--
ALTER TABLE `sd_audit_log`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sd_cart`
--
ALTER TABLE `sd_cart`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sd_help_category`
--
ALTER TABLE `sd_help_category`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sd_help_knowledge_base`
--
ALTER TABLE `sd_help_knowledge_base`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sd_help_rating`
--
ALTER TABLE `sd_help_rating`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sd_help_view`
--
ALTER TABLE `sd_help_view`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sd_orders`
--
ALTER TABLE `sd_orders`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sd_order_items`
--
ALTER TABLE `sd_order_items`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sd_payments`
--
ALTER TABLE `sd_payments`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sd_products`
--
ALTER TABLE `sd_products`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sd_product_categories`
--
ALTER TABLE `sd_product_categories`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sd_product_images`
--
ALTER TABLE `sd_product_images`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sd_product_likes`
--
ALTER TABLE `sd_product_likes`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sd_project`
--
ALTER TABLE `sd_project`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sd_project_callback`
--
ALTER TABLE `sd_project_callback`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sd_project_ip`
--
ALTER TABLE `sd_project_ip`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sd_project_user`
--
ALTER TABLE `sd_project_user`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sd_settings_admin`
--
ALTER TABLE `sd_settings_admin`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sd_settings_category`
--
ALTER TABLE `sd_settings_category`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sd_settings_definition`
--
ALTER TABLE `sd_settings_definition`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sd_settings_user`
--
ALTER TABLE `sd_settings_user`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sd_wishlist`
--
ALTER TABLE `sd_wishlist`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `sd_admin_branding_settings`
--
ALTER TABLE `sd_admin_branding_settings`
  ADD CONSTRAINT `sd_admin_branding_settings_ibfk_1` FOREIGN KEY (`sd_admin_mt_userdb_id`) REFERENCES `sd_admin_mt_userdb` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `sd_admin_menu`
--
ALTER TABLE `sd_admin_menu`
  ADD CONSTRAINT `sd_admin_menu_ibfk_1` FOREIGN KEY (`parent_id`) REFERENCES `sd_admin_menu` (`ID`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `sd_admin_mt_user_role`
--
ALTER TABLE `sd_admin_mt_user_role`
  ADD CONSTRAINT `sd_admin_mt_user_role_ibfk_1` FOREIGN KEY (`sd_mt_userdb_id`) REFERENCES `sd_admin_mt_userdb` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `sd_admin_mt_user_role_ibfk_2` FOREIGN KEY (`sd_mt_role_id`) REFERENCES `sd_admin_mt_role` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `sd_audit_log`
--
ALTER TABLE `sd_audit_log`
  ADD CONSTRAINT `sd_audit_log_ibfk_1` FOREIGN KEY (`sd_admin_mt_userdb_id`) REFERENCES `sd_admin_mt_userdb` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `sd_audit_log_ibfk_2` FOREIGN KEY (`auth_method_id`) REFERENCES `sd_admin_mt_role` (`ID`);

--
-- Constraints for table `sd_cart`
--
ALTER TABLE `sd_cart`
  ADD CONSTRAINT `sd_cart_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `sd_admin_mt_userdb` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `sd_cart_ibfk_2` FOREIGN KEY (`productId`) REFERENCES `sd_products` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `sd_help_category`
--
ALTER TABLE `sd_help_category`
  ADD CONSTRAINT `sd_help_category_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `sd_admin_mt_userdb` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `sd_help_knowledge_base`
--
ALTER TABLE `sd_help_knowledge_base`
  ADD CONSTRAINT `sd_help_knowledge_base_ibfk_1` FOREIGN KEY (`sd_admin_mt_userdb_id`) REFERENCES `sd_admin_mt_userdb` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `sd_help_knowledge_base_ibfk_2` FOREIGN KEY (`category_id`) REFERENCES `sd_help_category` (`ID`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `sd_help_rating`
--
ALTER TABLE `sd_help_rating`
  ADD CONSTRAINT `sd_help_rating_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `sd_admin_mt_userdb` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `sd_help_rating_ibfk_2` FOREIGN KEY (`sd_help_knowledge_id`) REFERENCES `sd_help_knowledge_base` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `sd_help_view`
--
ALTER TABLE `sd_help_view`
  ADD CONSTRAINT `sd_help_view_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `sd_admin_mt_userdb` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `sd_help_view_ibfk_2` FOREIGN KEY (`sd_help_knowledge_id`) REFERENCES `sd_help_knowledge_base` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `sd_orders`
--
ALTER TABLE `sd_orders`
  ADD CONSTRAINT `sd_orders_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `sd_admin_mt_userdb` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `sd_order_items`
--
ALTER TABLE `sd_order_items`
  ADD CONSTRAINT `sd_order_items_ibfk_1` FOREIGN KEY (`orderId`) REFERENCES `sd_orders` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `sd_order_items_ibfk_2` FOREIGN KEY (`productId`) REFERENCES `sd_products` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `sd_payments`
--
ALTER TABLE `sd_payments`
  ADD CONSTRAINT `sd_payments_ibfk_1` FOREIGN KEY (`orderId`) REFERENCES `sd_orders` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `sd_products`
--
ALTER TABLE `sd_products`
  ADD CONSTRAINT `sd_products_ibfk_1` FOREIGN KEY (`categoryId`) REFERENCES `sd_product_categories` (`ID`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `sd_products_ibfk_2` FOREIGN KEY (`userId`) REFERENCES `sd_admin_mt_userdb` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `sd_product_images`
--
ALTER TABLE `sd_product_images`
  ADD CONSTRAINT `sd_product_images_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `sd_products` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `sd_product_likes`
--
ALTER TABLE `sd_product_likes`
  ADD CONSTRAINT `sd_product_likes_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `sd_admin_mt_userdb` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `sd_product_likes_ibfk_2` FOREIGN KEY (`productId`) REFERENCES `sd_products` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `sd_project_callback`
--
ALTER TABLE `sd_project_callback`
  ADD CONSTRAINT `sd_project_callback_ibfk_1` FOREIGN KEY (`sd_project_id`) REFERENCES `sd_project` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `sd_project_ip`
--
ALTER TABLE `sd_project_ip`
  ADD CONSTRAINT `sd_project_ip_ibfk_1` FOREIGN KEY (`sd_project_id`) REFERENCES `sd_project` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `sd_project_user`
--
ALTER TABLE `sd_project_user`
  ADD CONSTRAINT `sd_project_user_ibfk_1` FOREIGN KEY (`sd_project_id`) REFERENCES `sd_project` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `sd_project_user_ibfk_2` FOREIGN KEY (`sd_mt_userdb_id`) REFERENCES `sd_admin_mt_userdb` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `sd_settings_admin`
--
ALTER TABLE `sd_settings_admin`
  ADD CONSTRAINT `sd_settings_admin_ibfk_1` FOREIGN KEY (`setting_definition_id`) REFERENCES `sd_settings_definition` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `sd_settings_definition`
--
ALTER TABLE `sd_settings_definition`
  ADD CONSTRAINT `sd_settings_definition_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `sd_settings_category` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `sd_settings_user`
--
ALTER TABLE `sd_settings_user`
  ADD CONSTRAINT `sd_settings_user_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `sd_admin_mt_userdb` (`ID`),
  ADD CONSTRAINT `sd_settings_user_ibfk_2` FOREIGN KEY (`setting_definition_id`) REFERENCES `sd_settings_definition` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `sd_wishlist`
--
ALTER TABLE `sd_wishlist`
  ADD CONSTRAINT `sd_wishlist_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `sd_admin_mt_userdb` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `sd_wishlist_ibfk_2` FOREIGN KEY (`productId`) REFERENCES `sd_products` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE;
--
-- Database: `sds_efl`
--
CREATE DATABASE IF NOT EXISTS `sds_efl` DEFAULT CHARACTER SET utf16 COLLATE utf16_general_ci;
USE `sds_efl`;

-- --------------------------------------------------------

--
-- Table structure for table `rates`
--

CREATE TABLE `rates` (
  `hub` varchar(24) DEFAULT NULL,
  `vendor` varchar(27) DEFAULT NULL,
  `type` varchar(4) DEFAULT NULL,
  `range_one` varchar(7) DEFAULT NULL,
  `rate_one` varchar(4) DEFAULT NULL,
  `range_two` varchar(7) DEFAULT NULL,
  `rate_two` varchar(4) DEFAULT NULL,
  `range_three` varchar(7) DEFAULT NULL,
  `rate_three` varchar(4) DEFAULT NULL,
  `min_units` varchar(12) DEFAULT NULL,
  `extra_price` varchar(11) DEFAULT NULL,
  `minimum_units` varchar(13) DEFAULT NULL,
  `ID` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sd_admin_mail`
--

CREATE TABLE `sd_admin_mail` (
  `ID` int(11) NOT NULL,
  `mail_name` varchar(255) NOT NULL,
  `mail_subject` text NOT NULL,
  `mail_msg` longtext NOT NULL,
  `last_modified_by` int(11) NOT NULL,
  `last_modified_time` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sd_admin_menu`
--

CREATE TABLE `sd_admin_menu` (
  `ID` int(11) NOT NULL,
  `label` varchar(50) NOT NULL,
  `icon` varchar(50) NOT NULL,
  `link` varchar(150) NOT NULL,
  `roles` varchar(255) NOT NULL,
  `order_number` int(11) NOT NULL DEFAULT 0,
  `parent_id` int(11) NOT NULL DEFAULT 0,
  `created_by` int(11) NOT NULL,
  `last_modified_time` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `sd_admin_modules_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sd_admin_modules`
--

CREATE TABLE `sd_admin_modules` (
  `ID` int(11) NOT NULL,
  `module_name` varchar(255) NOT NULL,
  `status` int(11) NOT NULL DEFAULT 5
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sd_admin_module_permissions`
--

CREATE TABLE `sd_admin_module_permissions` (
  `ID` int(20) UNSIGNED NOT NULL,
  `module_id` int(11) DEFAULT NULL,
  `action` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sd_admin_role_permissions`
--

CREATE TABLE `sd_admin_role_permissions` (
  `ID` bigint(20) UNSIGNED NOT NULL,
  `role_id` int(11) DEFAULT NULL,
  `permission_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sd_bill`
--

CREATE TABLE `sd_bill` (
  `ID` int(11) NOT NULL,
  `bill_start_date` date NOT NULL,
  `bill_end_date` date NOT NULL,
  `total_invoices` int(11) NOT NULL DEFAULT 0,
  `unit_amount` float NOT NULL DEFAULT 0,
  `vehicle_amount` float NOT NULL DEFAULT 0,
  `others` float NOT NULL DEFAULT 0,
  `gst_amount` float NOT NULL DEFAULT 0,
  `total_amount` float NOT NULL DEFAULT 0,
  `invoice_date` date DEFAULT NULL,
  `due_date` date DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT 1,
  `created_by` int(11) NOT NULL DEFAULT 0,
  `created_time` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sd_cms_data`
--

CREATE TABLE `sd_cms_data` (
  `txn_id` int(100) NOT NULL,
  `date_time` datetime NOT NULL,
  `phone` varchar(255) NOT NULL,
  `name` varchar(100) NOT NULL,
  `vendor_name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `charging_station` varchar(100) NOT NULL,
  `lat_lng` varchar(100) NOT NULL,
  `charge_point` text NOT NULL,
  `charge_point_code` text NOT NULL,
  `connector_id` int(100) NOT NULL,
  `connector_type` varchar(100) NOT NULL,
  `charge_point_type` text NOT NULL,
  `charging_station_category` varchar(100) NOT NULL,
  `start_time` time NOT NULL DEFAULT current_timestamp(),
  `stop_time` time NOT NULL DEFAULT current_timestamp(),
  `duration_seconds` timestamp NOT NULL DEFAULT current_timestamp(),
  `duration_HH:MM` timestamp NOT NULL DEFAULT current_timestamp(),
  `meter_start_Wh` float(10,2) NOT NULL,
  `meter_stop_Wh` float(10,2) NOT NULL,
  `start_soc` decimal(55,0) NOT NULL,
  `stop_soc` decimal(55,0) NOT NULL,
  `energy_delivered_kWh` float(10,2) NOT NULL,
  `unit_rate_applicable` int(100) NOT NULL,
  `charging_session_cost (₹)` varchar(255) NOT NULL,
  `service_fee (₹)` int(100) NOT NULL,
  `service_fee_for_minutes (₹)` int(100) NOT NULL,
  `gst (₹)` int(100) NOT NULL,
  `previous_unpaid_amount (₹)` int(100) NOT NULL,
  `payment_processing_fee (₹)` int(100) NOT NULL,
  `total (₹)` int(255) NOT NULL,
  `refund_amount (₹)` int(100) NOT NULL,
  `payment_method` int(100) NOT NULL,
  `fleet` varchar(50) NOT NULL,
  `vehicle_number_plate` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sd_customer`
--

CREATE TABLE `sd_customer` (
  `ID` int(11) NOT NULL,
  `vendor_company` varchar(255) NOT NULL,
  `vendor_name` varchar(255) DEFAULT NULL,
  `pan_no` varchar(255) DEFAULT NULL,
  `single_bill` int(11) NOT NULL DEFAULT 0,
  `status` int(11) NOT NULL DEFAULT 0,
  `created_by` int(11) NOT NULL DEFAULT 0,
  `created_time` datetime NOT NULL,
  `last_modified_by` int(11) NOT NULL DEFAULT 0,
  `last_modified_time` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `single_bill_hsn` varchar(50) DEFAULT NULL,
  `single_bill_title` varchar(1000) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sd_customer_address`
--

CREATE TABLE `sd_customer_address` (
  `ID` int(11) NOT NULL,
  `sd_customers_id` int(11) NOT NULL,
  `billing_to` varchar(255) DEFAULT NULL,
  `gst_no` varchar(255) DEFAULT NULL,
  `address_one` text DEFAULT NULL,
  `address_two` text DEFAULT NULL,
  `state_name` varchar(255) DEFAULT NULL,
  `pin_code` varchar(15) DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT 0,
  `created_by` int(11) NOT NULL DEFAULT 0,
  `created_time` datetime NOT NULL,
  `last_modified_by` int(11) NOT NULL DEFAULT 0,
  `last_modified_time` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sd_customer_hsn`
--

CREATE TABLE `sd_customer_hsn` (
  `ID` int(11) NOT NULL,
  `sd_customer_id` int(11) NOT NULL,
  `sd_efl_hsns_id` int(11) NOT NULL DEFAULT 0,
  `hsn` varchar(10) NOT NULL,
  `title` varchar(1000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sd_efl_consumption`
--

CREATE TABLE `sd_efl_consumption` (
  `ID` int(11) NOT NULL,
  `sd_hub_id` int(11) NOT NULL,
  `sd_customer_id` int(11) NOT NULL,
  `sd_date` date NOT NULL,
  `unit_count` float NOT NULL DEFAULT 0,
  `extra_units` int(11) NOT NULL DEFAULT 0,
  `created_by` int(11) NOT NULL DEFAULT 0,
  `created_time` datetime NOT NULL,
  `last_modified_by` int(11) NOT NULL DEFAULT 0,
  `last_modified_time` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sd_efl_consumption_sub`
--

CREATE TABLE `sd_efl_consumption_sub` (
  `ID` int(11) NOT NULL,
  `sd_efl_consumption_id` int(11) NOT NULL,
  `sd_meter_types_id` int(11) NOT NULL,
  `count` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sd_efl_hsns`
--

CREATE TABLE `sd_efl_hsns` (
  `ID` int(11) NOT NULL,
  `hsn` varchar(50) NOT NULL,
  `bill_title` varchar(1000) NOT NULL,
  `title_label` varchar(255) DEFAULT NULL,
  `last_modified_time` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sd_efl_office`
--

CREATE TABLE `sd_efl_office` (
  `ID` int(11) NOT NULL,
  `office_city` varchar(255) NOT NULL,
  `address_one` text NOT NULL,
  `address_two` text DEFAULT NULL,
  `gst_no` varchar(255) NOT NULL,
  `pan_no` varchar(255) NOT NULL,
  `cin_no` varchar(255) NOT NULL,
  `state` varchar(255) NOT NULL,
  `pin_code` varchar(15) NOT NULL,
  `cgst` float NOT NULL DEFAULT 0,
  `igst` float NOT NULL DEFAULT 0,
  `sgst` float NOT NULL DEFAULT 0,
  `subject_to` varchar(255) DEFAULT NULL,
  `office_incharge_group` int(11) NOT NULL DEFAULT 0,
  `status` int(11) NOT NULL DEFAULT 0,
  `created_by` int(11) NOT NULL,
  `created_time` datetime NOT NULL,
  `last_modified_by` int(11) DEFAULT NULL,
  `last_modified_time` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sd_efl_office_groups`
--

CREATE TABLE `sd_efl_office_groups` (
  `ID` int(11) NOT NULL,
  `sd_efl_office_id` int(11) NOT NULL,
  `sd_mt_userdb_id` int(11) NOT NULL,
  `last_modified_time` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sd_efl_vehicles`
--

CREATE TABLE `sd_efl_vehicles` (
  `ID` int(11) NOT NULL,
  `sd_hub_id` int(11) NOT NULL,
  `sd_customer_id` int(11) NOT NULL,
  `sd_date` date NOT NULL,
  `vehicle_count` int(11) NOT NULL DEFAULT 0,
  `created_by` int(11) NOT NULL DEFAULT 0,
  `created_time` datetime NOT NULL,
  `last_modified_by` int(11) NOT NULL DEFAULT 0,
  `last_modified_time` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sd_efl_vehicles_sub`
--

CREATE TABLE `sd_efl_vehicles_sub` (
  `ID` int(11) NOT NULL,
  `sd_efl_vehicles_id` int(11) NOT NULL,
  `sd_vehicle_types_id` int(11) NOT NULL,
  `count` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sd_hubs`
--

CREATE TABLE `sd_hubs` (
  `ID` int(11) NOT NULL,
  `hub_id` varchar(255) NOT NULL,
  `hub_name` varchar(255) NOT NULL,
  `hub_capacity` int(11) NOT NULL DEFAULT 0,
  `hub_area` varchar(50) DEFAULT NULL,
  `hub_rental` float DEFAULT 0,
  `sd_efl_office_id` int(11) NOT NULL,
  `longitude` float DEFAULT NULL,
  `latitude` float DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT 5,
  `created_by` int(11) NOT NULL DEFAULT 0,
  `created_time` datetime DEFAULT NULL,
  `last_modified_by` int(11) DEFAULT NULL,
  `last_modified_time` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `short_name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sd_hub_groups`
--

CREATE TABLE `sd_hub_groups` (
  `ID` int(11) NOT NULL,
  `sd_hub_id` int(11) NOT NULL,
  `sd_mt_role_id` int(11) NOT NULL,
  `last_modified_time` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sd_import`
--

CREATE TABLE `sd_import` (
  `ID` int(11) NOT NULL,
  `sd_import_type` varchar(20) NOT NULL,
  `sd_file` varchar(255) DEFAULT NULL,
  `sd_mt_userdb_id` int(11) NOT NULL,
  `last_modified_time` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sd_invoice`
--

CREATE TABLE `sd_invoice` (
  `ID` int(11) NOT NULL,
  `sd_bill_id` int(11) NOT NULL,
  `sd_hub_id` int(11) NOT NULL,
  `sd_customer_id` int(11) NOT NULL,
  `sd_customer_address_id` int(11) NOT NULL DEFAULT 0,
  `sd_vendor_rate_id` int(11) NOT NULL DEFAULT 0,
  `invoice_number` varchar(255) DEFAULT NULL,
  `invoice_date` date NOT NULL,
  `invoice_type` int(11) NOT NULL DEFAULT 1 COMMENT '1= AUTO , 2=  Manual Invoice , 3 = Credit Note',
  `sign_token` text DEFAULT NULL,
  `signed_by` int(11) DEFAULT 0,
  `signed_time` datetime DEFAULT NULL,
  `invoice_serial_number` int(11) NOT NULL DEFAULT 0,
  `invoice_fin_year` varchar(20) DEFAULT NULL,
  `total_taxable` float NOT NULL DEFAULT 0,
  `sgst` float NOT NULL DEFAULT 0,
  `cgst` float NOT NULL DEFAULT 0,
  `igst` float NOT NULL DEFAULT 0,
  `gst_percentage` float NOT NULL,
  `gst_amount` float NOT NULL DEFAULT 0,
  `total_amount` float NOT NULL,
  `irn_number` varchar(1000) DEFAULT NULL,
  `signed_qr_code` text DEFAULT NULL,
  `ack_no` varchar(1000) DEFAULT NULL,
  `ack_date` date DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT 0,
  `signed_invoice` longtext DEFAULT NULL,
  `state_name` varchar(10) DEFAULT NULL,
  `remarks` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sd_invoice_sub`
--

CREATE TABLE `sd_invoice_sub` (
  `ID` int(11) NOT NULL,
  `sd_invoice_id` int(11) NOT NULL,
  `type` int(11) NOT NULL,
  `type_hsn` varchar(10) DEFAULT NULL,
  `type_desc` text DEFAULT NULL,
  `vehicle_id` int(11) NOT NULL DEFAULT 0,
  `price` float NOT NULL DEFAULT 0,
  `count` float NOT NULL DEFAULT 0,
  `month_avg` float NOT NULL DEFAULT 0,
  `min_units` float NOT NULL DEFAULT 0,
  `allowed_units` float NOT NULL DEFAULT 0,
  `total_units` float NOT NULL DEFAULT 0,
  `extra_units` float NOT NULL DEFAULT 0,
  `tax_value` float DEFAULT 0,
  `total` float NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sd_meter_readings`
--

CREATE TABLE `sd_meter_readings` (
  `ID` int(11) NOT NULL,
  `sd_hub_id` int(11) NOT NULL,
  `meter_start_date` date DEFAULT NULL,
  `meter_end_date` date DEFAULT NULL,
  `meter_start` float NOT NULL,
  `meter_end` float NOT NULL,
  `meter_cost` float NOT NULL DEFAULT 0,
  `created_by` int(11) NOT NULL,
  `created_time` datetime NOT NULL,
  `last_modified_by` int(11) DEFAULT 0,
  `last_modified_time` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sd_meter_types`
--

CREATE TABLE `sd_meter_types` (
  `ID` int(11) NOT NULL,
  `type` varchar(50) NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_time` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sd_mt_role`
--

CREATE TABLE `sd_mt_role` (
  `ID` int(11) NOT NULL,
  `role_name` varchar(100) NOT NULL,
  `created_time` datetime DEFAULT NULL,
  `created_by` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sd_mt_userdb`
--

CREATE TABLE `sd_mt_userdb` (
  `ID` int(11) NOT NULL,
  `ename` varchar(100) NOT NULL,
  `euserid` varchar(100) DEFAULT NULL,
  `epassword` varchar(256) NOT NULL,
  `emailid` varchar(100) DEFAULT NULL,
  `mobile_no` varchar(10) DEFAULT NULL,
  `designation` varchar(250) DEFAULT NULL,
  `profile_img` longtext DEFAULT NULL,
  `last_login_time` datetime DEFAULT NULL,
  `last_login_ip` varchar(50) DEFAULT NULL,
  `last_reset_time` datetime DEFAULT NULL,
  `change_pass` int(11) DEFAULT 0,
  `created_time` datetime DEFAULT NULL,
  `created_by` varchar(100) DEFAULT NULL,
  `active_status` int(11) NOT NULL DEFAULT 0,
  `failed_attempts` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sd_mt_user_role`
--

CREATE TABLE `sd_mt_user_role` (
  `ID` int(11) NOT NULL,
  `sd_mt_userdb_id` int(11) NOT NULL,
  `sd_mt_role_id` int(11) NOT NULL,
  `created_time` datetime DEFAULT NULL,
  `created_by` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sd_payment`
--

CREATE TABLE `sd_payment` (
  `ID` int(11) NOT NULL,
  `sd_invoice_id` int(11) NOT NULL,
  `sd_customer_id` int(11) NOT NULL,
  `payment_date` date NOT NULL,
  `payment_mode` varchar(255) DEFAULT NULL,
  `payment_method` text DEFAULT NULL,
  `payment_amount` float NOT NULL,
  `created_by` int(11) NOT NULL DEFAULT 0,
  `created_time` datetime DEFAULT NULL,
  `last_modified_by` int(11) NOT NULL DEFAULT 0,
  `last_modified_time` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sd_site_alerts`
--

CREATE TABLE `sd_site_alerts` (
  `ID` int(11) NOT NULL,
  `type` enum('SMS','MAIL') NOT NULL,
  `name` varchar(55) NOT NULL,
  `message` text NOT NULL,
  `mail_subject` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf16 COLLATE=utf16_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sd_site_api`
--

CREATE TABLE `sd_site_api` (
  `ID` int(11) NOT NULL,
  `api_path` varchar(255) NOT NULL,
  `groups` varchar(1000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf16 COLLATE=utf16_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sd_site_settings`
--

CREATE TABLE `sd_site_settings` (
  `ID` int(3) NOT NULL,
  `setting_name` varchar(50) NOT NULL,
  `setting_value` longtext NOT NULL,
  `created_by` varchar(20) NOT NULL,
  `last_modified_time` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sd_state_db`
--

CREATE TABLE `sd_state_db` (
  `ID` int(11) NOT NULL,
  `state_id` int(11) NOT NULL,
  `short_name` varchar(4) NOT NULL,
  `state_name` varchar(55) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sd_vehicle_types`
--

CREATE TABLE `sd_vehicle_types` (
  `ID` int(11) NOT NULL,
  `vehicle_type` varchar(50) NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_time` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sd_vendors`
--

CREATE TABLE `sd_vendors` (
  `ID` int(11) NOT NULL,
  `sd_hub_id` int(11) NOT NULL,
  `vendor_code` varchar(255) NOT NULL,
  `vendor_company` varchar(255) NOT NULL,
  `vendor_name` varchar(255) DEFAULT NULL,
  `billing_to` varchar(255) DEFAULT NULL,
  `gst_no` varchar(255) DEFAULT NULL,
  `pan_no` varchar(255) DEFAULT NULL,
  `address_one` text DEFAULT NULL,
  `address_two` text DEFAULT NULL,
  `state_name` varchar(255) DEFAULT NULL,
  `pin_code` varchar(15) DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT 0,
  `created_by` int(11) NOT NULL DEFAULT 0,
  `created_time` datetime NOT NULL,
  `last_modified_by` int(11) NOT NULL DEFAULT 0,
  `last_modified_time` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sd_vendor_rate`
--

CREATE TABLE `sd_vendor_rate` (
  `ID` int(11) NOT NULL,
  `sd_hubs_id` int(11) NOT NULL,
  `sd_customer_id` int(11) NOT NULL DEFAULT 0,
  `sd_customer_address_id` int(11) NOT NULL,
  `cms_name` varchar(100) DEFAULT NULL,
  `vendor_code` varchar(100) DEFAULT NULL,
  `bill_type` enum('CMS','SUB_METER') DEFAULT NULL,
  `effective_date` date NOT NULL,
  `created_time` datetime NOT NULL,
  `created_by` int(11) NOT NULL DEFAULT 0,
  `last_modified_by` int(11) NOT NULL DEFAULT 0,
  `last_modified_time` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sd_vendor_rate_sub`
--

CREATE TABLE `sd_vendor_rate_sub` (
  `ID` int(11) NOT NULL,
  `sd_vendor_rate_id` int(11) NOT NULL,
  `sd_hsn_id` int(11) NOT NULL DEFAULT 0,
  `sd_vehicle_types_id` int(11) NOT NULL DEFAULT 0,
  `rate_type` int(11) NOT NULL COMMENT '1=Fixed,2=Minium,3=Unit Rate',
  `min_start` int(11) NOT NULL,
  `min_end` int(11) NOT NULL,
  `price` float NOT NULL,
  `extra_price` float NOT NULL,
  `min_units_vehicle` int(11) NOT NULL DEFAULT 0,
  `min_units_type` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `rates`
--
ALTER TABLE `rates`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `sd_admin_mail`
--
ALTER TABLE `sd_admin_mail`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `sd_admin_menu`
--
ALTER TABLE `sd_admin_menu`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `sd_admin_modules`
--
ALTER TABLE `sd_admin_modules`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `sd_admin_module_permissions`
--
ALTER TABLE `sd_admin_module_permissions`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `module_id` (`module_id`,`action`);

--
-- Indexes for table `sd_admin_role_permissions`
--
ALTER TABLE `sd_admin_role_permissions`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `role_id` (`role_id`,`permission_id`);

--
-- Indexes for table `sd_bill`
--
ALTER TABLE `sd_bill`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `sd_cms_data`
--
ALTER TABLE `sd_cms_data`
  ADD PRIMARY KEY (`txn_id`);

--
-- Indexes for table `sd_customer`
--
ALTER TABLE `sd_customer`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `sd_customer_address`
--
ALTER TABLE `sd_customer_address`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `sd_customer_hsn`
--
ALTER TABLE `sd_customer_hsn`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `sd_efl_consumption`
--
ALTER TABLE `sd_efl_consumption`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `sd_hub_id` (`sd_hub_id`),
  ADD KEY `sd_customer_id` (`sd_customer_id`),
  ADD KEY `sd_date` (`sd_date`);

--
-- Indexes for table `sd_efl_consumption_sub`
--
ALTER TABLE `sd_efl_consumption_sub`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `sd_efl_consumption_id` (`sd_efl_consumption_id`);

--
-- Indexes for table `sd_efl_hsns`
--
ALTER TABLE `sd_efl_hsns`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `sd_efl_office`
--
ALTER TABLE `sd_efl_office`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `sd_efl_office_groups`
--
ALTER TABLE `sd_efl_office_groups`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `sd_efl_vehicles`
--
ALTER TABLE `sd_efl_vehicles`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `sd_hub_id` (`sd_hub_id`),
  ADD KEY `sd_customer_id` (`sd_customer_id`),
  ADD KEY `sd_date` (`sd_date`);

--
-- Indexes for table `sd_efl_vehicles_sub`
--
ALTER TABLE `sd_efl_vehicles_sub`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `sd_efl_vehicles_id` (`sd_efl_vehicles_id`);

--
-- Indexes for table `sd_hubs`
--
ALTER TABLE `sd_hubs`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `sd_efl_office_id` (`sd_efl_office_id`);

--
-- Indexes for table `sd_hub_groups`
--
ALTER TABLE `sd_hub_groups`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `sd_import`
--
ALTER TABLE `sd_import`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `sd_invoice`
--
ALTER TABLE `sd_invoice`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `sd_bill_id` (`sd_bill_id`),
  ADD KEY `sd_hub_id` (`sd_hub_id`),
  ADD KEY `sd_customer_id` (`sd_customer_id`);

--
-- Indexes for table `sd_invoice_sub`
--
ALTER TABLE `sd_invoice_sub`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `sd_meter_readings`
--
ALTER TABLE `sd_meter_readings`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `sd_meter_types`
--
ALTER TABLE `sd_meter_types`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `sd_mt_role`
--
ALTER TABLE `sd_mt_role`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `sd_mt_userdb`
--
ALTER TABLE `sd_mt_userdb`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `sd_mt_user_role`
--
ALTER TABLE `sd_mt_user_role`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `sd_payment`
--
ALTER TABLE `sd_payment`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `sd_invoice_id` (`sd_invoice_id`),
  ADD KEY `sd_customer_id` (`sd_customer_id`);

--
-- Indexes for table `sd_site_alerts`
--
ALTER TABLE `sd_site_alerts`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `sd_site_api`
--
ALTER TABLE `sd_site_api`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `sd_site_settings`
--
ALTER TABLE `sd_site_settings`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `sd_state_db`
--
ALTER TABLE `sd_state_db`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `sd_vehicle_types`
--
ALTER TABLE `sd_vehicle_types`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `sd_vendors`
--
ALTER TABLE `sd_vendors`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `sd_vendor_rate`
--
ALTER TABLE `sd_vendor_rate`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `sd_vendor_rate_sub`
--
ALTER TABLE `sd_vendor_rate_sub`
  ADD PRIMARY KEY (`ID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `rates`
--
ALTER TABLE `rates`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sd_admin_mail`
--
ALTER TABLE `sd_admin_mail`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sd_admin_menu`
--
ALTER TABLE `sd_admin_menu`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sd_admin_modules`
--
ALTER TABLE `sd_admin_modules`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sd_admin_module_permissions`
--
ALTER TABLE `sd_admin_module_permissions`
  MODIFY `ID` int(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sd_admin_role_permissions`
--
ALTER TABLE `sd_admin_role_permissions`
  MODIFY `ID` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sd_bill`
--
ALTER TABLE `sd_bill`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sd_cms_data`
--
ALTER TABLE `sd_cms_data`
  MODIFY `txn_id` int(100) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sd_customer`
--
ALTER TABLE `sd_customer`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sd_customer_address`
--
ALTER TABLE `sd_customer_address`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sd_customer_hsn`
--
ALTER TABLE `sd_customer_hsn`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sd_efl_consumption`
--
ALTER TABLE `sd_efl_consumption`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sd_efl_consumption_sub`
--
ALTER TABLE `sd_efl_consumption_sub`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sd_efl_hsns`
--
ALTER TABLE `sd_efl_hsns`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sd_efl_office`
--
ALTER TABLE `sd_efl_office`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sd_efl_office_groups`
--
ALTER TABLE `sd_efl_office_groups`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sd_efl_vehicles`
--
ALTER TABLE `sd_efl_vehicles`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sd_efl_vehicles_sub`
--
ALTER TABLE `sd_efl_vehicles_sub`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sd_hubs`
--
ALTER TABLE `sd_hubs`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sd_hub_groups`
--
ALTER TABLE `sd_hub_groups`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sd_import`
--
ALTER TABLE `sd_import`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sd_invoice`
--
ALTER TABLE `sd_invoice`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sd_invoice_sub`
--
ALTER TABLE `sd_invoice_sub`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sd_meter_readings`
--
ALTER TABLE `sd_meter_readings`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sd_meter_types`
--
ALTER TABLE `sd_meter_types`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sd_mt_role`
--
ALTER TABLE `sd_mt_role`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sd_mt_userdb`
--
ALTER TABLE `sd_mt_userdb`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sd_mt_user_role`
--
ALTER TABLE `sd_mt_user_role`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sd_payment`
--
ALTER TABLE `sd_payment`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sd_site_alerts`
--
ALTER TABLE `sd_site_alerts`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sd_site_api`
--
ALTER TABLE `sd_site_api`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sd_site_settings`
--
ALTER TABLE `sd_site_settings`
  MODIFY `ID` int(3) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sd_state_db`
--
ALTER TABLE `sd_state_db`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sd_vehicle_types`
--
ALTER TABLE `sd_vehicle_types`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sd_vendors`
--
ALTER TABLE `sd_vendors`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sd_vendor_rate`
--
ALTER TABLE `sd_vendor_rate`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sd_vendor_rate_sub`
--
ALTER TABLE `sd_vendor_rate_sub`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `sd_admin_module_permissions`
--
ALTER TABLE `sd_admin_module_permissions`
  ADD CONSTRAINT `sd_admin_module_permissions_ibfk_1` FOREIGN KEY (`module_id`) REFERENCES `sd_admin_modules` (`ID`) ON DELETE CASCADE;
--
-- Database: `sds_exam`
--
CREATE DATABASE IF NOT EXISTS `sds_exam` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_uca1400_ai_ci;
USE `sds_exam`;

-- --------------------------------------------------------

--
-- Table structure for table `sd_admin_api`
--

CREATE TABLE `sd_admin_api` (
  `ID` int(11) NOT NULL,
  `request_type` varchar(10) NOT NULL,
  `api_path` varchar(255) NOT NULL,
  `groups` varchar(1000) DEFAULT NULL,
  `controller_name` varchar(50) NOT NULL,
  `function_name` varchar(50) NOT NULL,
  `last_modified_time` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf16 COLLATE=utf16_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sd_admin_calander_dates`
--

CREATE TABLE `sd_admin_calander_dates` (
  `ID` int(11) NOT NULL,
  `calendar_date` date NOT NULL,
  `day_of_week` varchar(10) DEFAULT NULL,
  `is_weekend` tinyint(1) DEFAULT NULL,
  `is_holiday` tinyint(1) DEFAULT NULL,
  `holiday_name` varchar(255) DEFAULT NULL,
  `fiscal_year` varchar(10) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sd_admin_const`
--

CREATE TABLE `sd_admin_const` (
  `ID` int(11) NOT NULL,
  `type` varchar(10) NOT NULL,
  `value` varchar(255) NOT NULL,
  `label` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sd_admin_mail`
--

CREATE TABLE `sd_admin_mail` (
  `ID` int(11) NOT NULL,
  `mail_name` int(11) NOT NULL,
  `mail_subject` text NOT NULL,
  `mail_msg` longtext NOT NULL,
  `last_modified_by` int(11) NOT NULL,
  `last_modified_time` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sd_admin_menu`
--

CREATE TABLE `sd_admin_menu` (
  `ID` int(11) NOT NULL,
  `label` varchar(50) NOT NULL,
  `icon` varchar(50) NOT NULL,
  `link` varchar(150) NOT NULL,
  `roles` varchar(255) NOT NULL,
  `order_number` int(11) NOT NULL DEFAULT 0,
  `parent_id` int(11) NOT NULL DEFAULT 0,
  `created_by` int(11) NOT NULL,
  `last_modified_time` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sd_agency`
--

CREATE TABLE `sd_agency` (
  `ID` int(11) NOT NULL,
  `agency_name` varchar(50) NOT NULL,
  `agency_logo` longtext NOT NULL,
  `agency_user_id` int(11) NOT NULL,
  `created_by` int(11) NOT NULL DEFAULT 0,
  `created_time` timestamp NOT NULL DEFAULT current_timestamp(),
  `last_modified_by` int(11) NOT NULL DEFAULT 0,
  `last_modified_time` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sd_category`
--

CREATE TABLE `sd_category` (
  `ID` int(11) NOT NULL,
  `category_name` varchar(255) NOT NULL,
  `full_name` varchar(255) DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `last_modified_time` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `cat_type` int(1) NOT NULL DEFAULT 1,
  `max_cat` float NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sd_import`
--

CREATE TABLE `sd_import` (
  `ID` int(11) NOT NULL,
  `sd_import_type` varchar(20) NOT NULL,
  `sd_file` varchar(255) DEFAULT NULL,
  `sd_mt_userdb_id` int(11) NOT NULL,
  `last_modified_time` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sd_mt_role`
--

CREATE TABLE `sd_mt_role` (
  `ID` int(11) NOT NULL,
  `role_name` varchar(100) NOT NULL,
  `is_fixed` int(11) NOT NULL DEFAULT 0,
  `created_time` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sd_mt_userdb`
--

CREATE TABLE `sd_mt_userdb` (
  `ID` int(11) NOT NULL,
  `ename` varchar(100) NOT NULL,
  `euserid` varchar(100) NOT NULL,
  `epassword` varchar(256) NOT NULL,
  `emailid` varchar(100) DEFAULT NULL,
  `mobile_no` varchar(15) DEFAULT NULL,
  `role_selection` varchar(250) DEFAULT NULL,
  `profile_img` longtext DEFAULT NULL,
  `last_login_time` datetime DEFAULT NULL,
  `last_login_ip` varchar(50) DEFAULT NULL,
  `last_reset_time` datetime DEFAULT NULL,
  `change_pass` int(11) DEFAULT 0,
  `created_time` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT 0,
  `active_status` int(11) NOT NULL DEFAULT 0,
  `failed_attempts` int(11) NOT NULL DEFAULT 0,
  `designation` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sd_mt_user_otp`
--

CREATE TABLE `sd_mt_user_otp` (
  `ID` int(11) NOT NULL,
  `otp_type` enum('EMAIL','MOBILE') NOT NULL,
  `country_code` varchar(5) NOT NULL DEFAULT '0',
  `mobile_no` varchar(100) DEFAULT NULL,
  `email_id` varchar(255) DEFAULT NULL,
  `otp_code_hash` varchar(255) NOT NULL,
  `otp_created_time` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf16 COLLATE=utf16_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sd_mt_user_role`
--

CREATE TABLE `sd_mt_user_role` (
  `ID` int(11) NOT NULL,
  `sd_mt_userdb_id` int(11) NOT NULL,
  `sd_mt_role_id` int(11) NOT NULL,
  `created_time` datetime DEFAULT NULL,
  `created_by` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sd_options`
--

CREATE TABLE `sd_options` (
  `id` int(11) NOT NULL,
  `question_id` int(11) NOT NULL,
  `option_image` text DEFAULT NULL,
  `created_by` int(11) NOT NULL DEFAULT 0,
  `last_modified_by` int(11) DEFAULT NULL,
  `last_modified_time` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `created_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sd_option_translations`
--

CREATE TABLE `sd_option_translations` (
  `id` int(11) NOT NULL,
  `option_id` int(11) DEFAULT NULL,
  `language_code` varchar(10) DEFAULT NULL,
  `option_text` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sd_questions`
--

CREATE TABLE `sd_questions` (
  `id` int(11) NOT NULL,
  `category_id` int(11) DEFAULT NULL,
  `difficulty` enum('easy','medium','hard') NOT NULL,
  `question_image` longtext DEFAULT NULL,
  `correct_option_id` int(11) DEFAULT NULL,
  `question_type` enum('mcq','true_false','fill_blank') NOT NULL DEFAULT 'mcq',
  `status` enum('active','inactive','archived') NOT NULL DEFAULT 'active',
  `created_by` int(11) NOT NULL,
  `last_modified_by` int(11) DEFAULT NULL,
  `last_modified_time` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `created_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sd_questions_practical`
--

CREATE TABLE `sd_questions_practical` (
  `ID` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `question_text` text NOT NULL,
  `last_modified_time` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sd_question_translations`
--

CREATE TABLE `sd_question_translations` (
  `id` int(11) NOT NULL,
  `question_id` int(11) NOT NULL,
  `language_code` varchar(10) NOT NULL,
  `question_text` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sd_sessions`
--

CREATE TABLE `sd_sessions` (
  `ID` int(11) NOT NULL,
  `sd_agency_id` int(11) NOT NULL,
  `project_name` varchar(50) NOT NULL,
  `session_id` varchar(255) NOT NULL,
  `trainer_id` int(11) NOT NULL,
  `location` varchar(255) NOT NULL,
  `session_date` date NOT NULL DEFAULT curdate(),
  `session_to_date` date DEFAULT NULL,
  `no_of_questions` int(11) NOT NULL DEFAULT 0,
  `time_limit` int(11) NOT NULL,
  `time_limit_two` int(11) NOT NULL DEFAULT 0,
  `start_time` int(11) DEFAULT NULL,
  `end_time` int(11) DEFAULT NULL,
  `status` enum('active','completed','cancelled','started') NOT NULL DEFAULT 'active',
  `created_time` timestamp NULL DEFAULT current_timestamp(),
  `created_by` int(11) NOT NULL DEFAULT 0,
  `last_modified_by` int(11) NOT NULL DEFAULT 0,
  `last_modified_time` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `session_serial` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sd_session_category`
--

CREATE TABLE `sd_session_category` (
  `ID` int(11) NOT NULL,
  `sd_session_id` int(11) NOT NULL,
  `sd_session_users_id` int(11) NOT NULL DEFAULT 0,
  `category_id` int(11) NOT NULL,
  `total_questions` int(11) NOT NULL DEFAULT 0,
  `total_answered` int(11) NOT NULL DEFAULT 0,
  `total_score` float NOT NULL DEFAULT 0,
  `question_id` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sd_session_users`
--

CREATE TABLE `sd_session_users` (
  `ID` int(11) NOT NULL,
  `session_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `loco_shed` varchar(50) DEFAULT NULL,
  `otp_pin` varchar(10) DEFAULT NULL,
  `language_code` varchar(10) DEFAULT NULL,
  `status` enum('pending','in_progress','completed','failed','re-exam') NOT NULL DEFAULT 'pending',
  `total_questions` int(11) DEFAULT NULL,
  `correct_answers` int(11) DEFAULT NULL,
  `incorrect_answers` int(11) NOT NULL DEFAULT 0,
  `unanswered_answers` int(11) NOT NULL DEFAULT 0,
  `score` decimal(5,2) DEFAULT NULL,
  `practical_score` float NOT NULL DEFAULT 0,
  `practical_total` int(11) NOT NULL DEFAULT 0,
  `practical_answer` int(11) NOT NULL DEFAULT 0,
  `trainer_approval` tinyint(1) DEFAULT NULL,
  `start_time` int(11) DEFAULT 0,
  `end_time` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sd_session_user_feedback`
--

CREATE TABLE `sd_session_user_feedback` (
  `ID` int(11) NOT NULL,
  `sd_session_users_id` int(11) NOT NULL,
  `theory` int(11) DEFAULT NULL,
  `practical` int(11) NOT NULL,
  `assessment` int(11) NOT NULL,
  `overall` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sd_site_settings`
--

CREATE TABLE `sd_site_settings` (
  `ID` int(5) NOT NULL,
  `setting_name` varchar(50) NOT NULL,
  `setting_value` longtext NOT NULL,
  `created_by` int(11) DEFAULT NULL,
  `last_modified_time` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf16 COLLATE=utf16_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sd_user_answers`
--

CREATE TABLE `sd_user_answers` (
  `ID` int(11) NOT NULL,
  `session_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `question_id` int(11) NOT NULL,
  `selected_option_id` int(11) NOT NULL,
  `is_correct` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `sd_admin_api`
--
ALTER TABLE `sd_admin_api`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `sd_admin_calander_dates`
--
ALTER TABLE `sd_admin_calander_dates`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `sd_admin_const`
--
ALTER TABLE `sd_admin_const`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `sd_admin_mail`
--
ALTER TABLE `sd_admin_mail`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `sd_admin_menu`
--
ALTER TABLE `sd_admin_menu`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `sd_agency`
--
ALTER TABLE `sd_agency`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `sd_category`
--
ALTER TABLE `sd_category`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `sd_import`
--
ALTER TABLE `sd_import`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `sd_mt_role`
--
ALTER TABLE `sd_mt_role`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `sd_mt_userdb`
--
ALTER TABLE `sd_mt_userdb`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `sd_mt_user_otp`
--
ALTER TABLE `sd_mt_user_otp`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `sd_mt_user_role`
--
ALTER TABLE `sd_mt_user_role`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `FKcwhfa4iqwols2ybkff7of2kro` (`sd_mt_role_id`),
  ADD KEY `FKntlucki34h48gh4g978ulda5a` (`sd_mt_userdb_id`);

--
-- Indexes for table `sd_options`
--
ALTER TABLE `sd_options`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_option_question` (`question_id`);

--
-- Indexes for table `sd_option_translations`
--
ALTER TABLE `sd_option_translations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_translation_option` (`option_id`);

--
-- Indexes for table `sd_questions`
--
ALTER TABLE `sd_questions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_questions_correct_option` (`correct_option_id`),
  ADD KEY `idx_question_category` (`category_id`),
  ADD KEY `idx_question_status` (`status`),
  ADD KEY `idx_question_type` (`question_type`),
  ADD KEY `idx_question_created_by` (`created_by`);

--
-- Indexes for table `sd_questions_practical`
--
ALTER TABLE `sd_questions_practical`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `sd_question_translations`
--
ALTER TABLE `sd_question_translations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_translation_question` (`question_id`);

--
-- Indexes for table `sd_sessions`
--
ALTER TABLE `sd_sessions`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `sd_session_category`
--
ALTER TABLE `sd_session_category`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `sd_session_users`
--
ALTER TABLE `sd_session_users`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `fk_session_users_session` (`session_id`),
  ADD KEY `fk_session_users_user` (`user_id`);

--
-- Indexes for table `sd_session_user_feedback`
--
ALTER TABLE `sd_session_user_feedback`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `sd_site_settings`
--
ALTER TABLE `sd_site_settings`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `sd_user_answers`
--
ALTER TABLE `sd_user_answers`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `fk_user_answers_session` (`session_id`),
  ADD KEY `fk_user_answers_question` (`question_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `sd_admin_api`
--
ALTER TABLE `sd_admin_api`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sd_admin_calander_dates`
--
ALTER TABLE `sd_admin_calander_dates`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sd_admin_const`
--
ALTER TABLE `sd_admin_const`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sd_admin_mail`
--
ALTER TABLE `sd_admin_mail`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sd_admin_menu`
--
ALTER TABLE `sd_admin_menu`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sd_agency`
--
ALTER TABLE `sd_agency`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sd_category`
--
ALTER TABLE `sd_category`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sd_import`
--
ALTER TABLE `sd_import`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sd_mt_role`
--
ALTER TABLE `sd_mt_role`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sd_mt_userdb`
--
ALTER TABLE `sd_mt_userdb`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sd_mt_user_otp`
--
ALTER TABLE `sd_mt_user_otp`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sd_mt_user_role`
--
ALTER TABLE `sd_mt_user_role`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sd_options`
--
ALTER TABLE `sd_options`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sd_option_translations`
--
ALTER TABLE `sd_option_translations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sd_questions`
--
ALTER TABLE `sd_questions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sd_questions_practical`
--
ALTER TABLE `sd_questions_practical`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sd_question_translations`
--
ALTER TABLE `sd_question_translations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sd_sessions`
--
ALTER TABLE `sd_sessions`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sd_session_category`
--
ALTER TABLE `sd_session_category`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sd_session_users`
--
ALTER TABLE `sd_session_users`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sd_session_user_feedback`
--
ALTER TABLE `sd_session_user_feedback`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sd_site_settings`
--
ALTER TABLE `sd_site_settings`
  MODIFY `ID` int(5) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sd_user_answers`
--
ALTER TABLE `sd_user_answers`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `sd_mt_user_role`
--
ALTER TABLE `sd_mt_user_role`
  ADD CONSTRAINT `FKcwhfa4iqwols2ybkff7of2kro` FOREIGN KEY (`sd_mt_role_id`) REFERENCES `sd_mt_role` (`ID`),
  ADD CONSTRAINT `FKntlucki34h48gh4g978ulda5a` FOREIGN KEY (`sd_mt_userdb_id`) REFERENCES `sd_mt_userdb` (`ID`);

--
-- Constraints for table `sd_options`
--
ALTER TABLE `sd_options`
  ADD CONSTRAINT `fk_options_question` FOREIGN KEY (`question_id`) REFERENCES `sd_questions` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `sd_option_translations`
--
ALTER TABLE `sd_option_translations`
  ADD CONSTRAINT `fk_option_translations_option` FOREIGN KEY (`option_id`) REFERENCES `sd_options` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `sd_questions`
--
ALTER TABLE `sd_questions`
  ADD CONSTRAINT `fk_questions_correct_option` FOREIGN KEY (`correct_option_id`) REFERENCES `sd_options` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `sd_question_translations`
--
ALTER TABLE `sd_question_translations`
  ADD CONSTRAINT `fk_question_translations_question` FOREIGN KEY (`question_id`) REFERENCES `sd_questions` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `sd_session_users`
--
ALTER TABLE `sd_session_users`
  ADD CONSTRAINT `fk_session_users_session` FOREIGN KEY (`session_id`) REFERENCES `sd_sessions` (`ID`) ON DELETE CASCADE;

--
-- Constraints for table `sd_user_answers`
--
ALTER TABLE `sd_user_answers`
  ADD CONSTRAINT `fk_user_answers_session` FOREIGN KEY (`session_id`) REFERENCES `sd_sessions` (`ID`) ON DELETE CASCADE;
--
-- Database: `sds_hims`
--
CREATE DATABASE IF NOT EXISTS `sds_hims` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_uca1400_ai_ci;
USE `sds_hims`;

-- --------------------------------------------------------

--
-- Table structure for table `sd_doctor_specailization`
--

CREATE TABLE `sd_doctor_specailization` (
  `ID` int(11) NOT NULL,
  `specialization_name` varchar(100) NOT NULL,
  `specialization_code` varchar(20) NOT NULL,
  `description` text DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sd_hims_appointment`
--

CREATE TABLE `sd_hims_appointment` (
  `ID` int(11) NOT NULL,
  `sd_hims_patient_id` int(11) NOT NULL,
  `sd_mt_userdb_id` int(11) DEFAULT NULL,
  `appointment_date` date NOT NULL,
  `appointment_time` time NOT NULL,
  `status` enum('Pending','Confirmed','Cancelled','Doctor Consulted','Payment Completed') DEFAULT 'Pending',
  `appointment_number` varchar(20) DEFAULT NULL,
  `apointment_mode` varchar(50) DEFAULT NULL,
  `registration_fee` int(11) NOT NULL DEFAULT 0,
  `payment_status` int(11) DEFAULT 0,
  `payment_mode` varchar(10) DEFAULT NULL,
  `payment_details` text DEFAULT NULL,
  `created_by` int(11) NOT NULL DEFAULT 0,
  `created_time` timestamp NOT NULL DEFAULT current_timestamp(),
  `last_modified_by` int(11) DEFAULT 0,
  `last_modified_time` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sd_hims_bill`
--

CREATE TABLE `sd_hims_bill` (
  `ID` int(11) NOT NULL,
  `type` enum('APOINTMENT','OTHERs') DEFAULT 'APOINTMENT',
  `sd_hims_patient_id` int(11) NOT NULL,
  `sd_hims_appointment_id` int(11) DEFAULT 0,
  `sd_mt_userdb_id` int(11) NOT NULL DEFAULT 0 COMMENT 'doctor mid',
  `bill_referrer_details` text DEFAULT NULL,
  `bill_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `total_amount` decimal(10,2) DEFAULT 0.00,
  `payment_status` enum('Unpaid','Paid') DEFAULT 'Unpaid',
  `created_by` int(11) NOT NULL,
  `created_time` timestamp NOT NULL DEFAULT current_timestamp(),
  `last_modified_by` int(11) NOT NULL DEFAULT 0,
  `last_modified_time` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sd_hims_bill_component`
--

CREATE TABLE `sd_hims_bill_component` (
  `ID` int(11) NOT NULL,
  `sd_hims_bill_id` int(11) NOT NULL,
  `sd_hims_bill_standard_id` int(11) NOT NULL,
  `quantity` float NOT NULL DEFAULT 0,
  `component_amount` decimal(10,2) NOT NULL,
  `component_description` text DEFAULT NULL,
  `unit_price` float NOT NULL DEFAULT 0,
  `tax` float NOT NULL DEFAULT 0,
  `total_price` float NOT NULL DEFAULT 0,
  `item_status` int(11) NOT NULL DEFAULT 5,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `created_by` int(11) NOT NULL DEFAULT 0,
  `last_modified_by` int(11) NOT NULL DEFAULT 0,
  `last_modified_time` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sd_hims_bill_standard`
--

CREATE TABLE `sd_hims_bill_standard` (
  `ID` int(11) NOT NULL,
  `component_name` varchar(100) NOT NULL,
  `component_description` text DEFAULT NULL,
  `default_amount` decimal(10,2) DEFAULT 0.00,
  `tax_percentage` float NOT NULL,
  `total_amount` float NOT NULL,
  `status` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sd_hims_departments`
--

CREATE TABLE `sd_hims_departments` (
  `ID` int(11) NOT NULL,
  `department_name` varchar(100) NOT NULL,
  `department_code` varchar(20) NOT NULL,
  `description` text DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sd_hims_patient`
--

CREATE TABLE `sd_hims_patient` (
  `ID` int(11) NOT NULL,
  `patient_id` varchar(50) DEFAULT NULL,
  `mode` enum('HIMS','MEDICAL','APP') NOT NULL DEFAULT 'HIMS',
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) DEFAULT NULL,
  `date_of_birth` date DEFAULT NULL,
  `age` int(11) NOT NULL,
  `gender` int(1) NOT NULL,
  `mobile_number` varchar(15) NOT NULL,
  `email` varchar(100) DEFAULT NULL,
  `address` text DEFAULT NULL,
  `aadhar_number` varchar(100) DEFAULT NULL,
  `created_by` int(11) NOT NULL DEFAULT 0,
  `last_modified_by` int(11) NOT NULL DEFAULT 0,
  `created_time` timestamp NOT NULL DEFAULT current_timestamp(),
  `last_modified_time` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sd_labs`
--

CREATE TABLE `sd_labs` (
  `ID` int(11) NOT NULL,
  `lab_name` varchar(100) NOT NULL,
  `location` varchar(200) DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT 5,
  `created_by` int(11) NOT NULL DEFAULT 0,
  `created_time` timestamp NOT NULL DEFAULT current_timestamp(),
  `last_modified_by` int(11) NOT NULL DEFAULT 0,
  `last_modified_time` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sd_labs_patient_test`
--

CREATE TABLE `sd_labs_patient_test` (
  `ID` int(11) NOT NULL,
  `sd_hims_patient_id` int(11) NOT NULL,
  `sd_hims_appointment_id` int(11) DEFAULT 0,
  `sd_labs_tests_id` int(11) NOT NULL,
  `status` enum('Pending','In Progress','Completed') DEFAULT 'Pending',
  `sd_mt_userdb_id` int(11) DEFAULT 0,
  `created_by` int(11) DEFAULT NULL,
  `created_time` timestamp NOT NULL DEFAULT current_timestamp(),
  `last_modified_by` int(11) DEFAULT NULL,
  `last_modified_time` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sd_labs_technician`
--

CREATE TABLE `sd_labs_technician` (
  `ID` int(11) NOT NULL,
  `sd_labs_id` int(11) NOT NULL,
  `sd_mt_userdb_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sd_labs_tests`
--

CREATE TABLE `sd_labs_tests` (
  `ID` int(11) NOT NULL,
  `sd_labs_test_categories_id` int(11) NOT NULL,
  `sd_labs_id` int(11) DEFAULT 0,
  `test_name` varchar(100) NOT NULL,
  `description` text DEFAULT NULL,
  `cost` decimal(10,2) NOT NULL,
  `status` int(11) NOT NULL DEFAULT 5,
  `created_by` int(11) NOT NULL DEFAULT 0,
  `created_time` timestamp NOT NULL DEFAULT current_timestamp(),
  `last_modified_by` int(11) NOT NULL DEFAULT 0,
  `last_modified_time` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sd_labs_test_categories`
--

CREATE TABLE `sd_labs_test_categories` (
  `ID` int(11) NOT NULL,
  `category_name` varchar(100) NOT NULL,
  `description` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sd_med_batches`
--

CREATE TABLE `sd_med_batches` (
  `ID` int(11) NOT NULL,
  `sd_med_invoice_id` int(11) NOT NULL,
  `sd_med_products_id` int(100) NOT NULL,
  `expiry_date` date NOT NULL,
  `batch_code` varchar(50) NOT NULL,
  `batch_number` varchar(50) NOT NULL,
  `mrp_price` float NOT NULL,
  `inventory_price` float NOT NULL,
  `discount` float NOT NULL DEFAULT 0,
  `sale_price` float NOT NULL,
  `tax_status` int(11) NOT NULL DEFAULT 2,
  `tax` float NOT NULL DEFAULT 0,
  `sgst` float NOT NULL DEFAULT 0,
  `cgst` float NOT NULL DEFAULT 0,
  `bill_quant` float NOT NULL DEFAULT 0,
  `comp_quant` float NOT NULL DEFAULT 0,
  `total_quant` float NOT NULL DEFAULT 0,
  `created_by` int(11) NOT NULL DEFAULT 0,
  `created_time` datetime NOT NULL DEFAULT current_timestamp(),
  `last_modified_by` int(11) NOT NULL DEFAULT 0,
  `last_modified_time` timestamp NOT NULL DEFAULT current_timestamp(),
  `sd_med_vendor_id` int(11) NOT NULL,
  `remarks` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sd_med_bill`
--

CREATE TABLE `sd_med_bill` (
  `ID` int(11) NOT NULL,
  `bill_number` varchar(100) DEFAULT NULL,
  `sd_hims_patient_id` int(11) DEFAULT NULL,
  `sd_doctor_id` int(11) DEFAULT 0,
  `doctor_name` varchar(255) DEFAULT NULL,
  `bill_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `items_count` int(11) NOT NULL DEFAULT 0,
  `mrp_amount` float NOT NULL DEFAULT 0,
  `base_amount` decimal(10,2) DEFAULT NULL,
  `sgst` decimal(10,2) DEFAULT NULL,
  `cgst` decimal(10,2) DEFAULT NULL,
  `tax_amount` float NOT NULL DEFAULT 0,
  `total_amount` decimal(10,2) DEFAULT NULL,
  `status` int(11) DEFAULT 5,
  `payment_method` enum('Cash','Card','UPI','Other') NOT NULL DEFAULT 'Cash',
  `payment_details` text DEFAULT NULL,
  `payment_amount` decimal(10,2) NOT NULL DEFAULT 0.00,
  `payment_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `created_by` int(11) NOT NULL DEFAULT 0,
  `last_modified_by` int(11) NOT NULL DEFAULT 0,
  `created_time` timestamp NOT NULL DEFAULT current_timestamp(),
  `last_modify_time` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sd_med_bill_items`
--

CREATE TABLE `sd_med_bill_items` (
  `ID` int(11) NOT NULL,
  `sd_med_bill_id` int(11) DEFAULT NULL,
  `sd_med_products_id` int(11) DEFAULT NULL,
  `sd_med_batch_id` int(11) DEFAULT NULL,
  `quantity` float NOT NULL,
  `mrp_price` float NOT NULL DEFAULT 0,
  `sale_price` decimal(10,2) NOT NULL,
  `discount` decimal(10,2) DEFAULT 0.00,
  `tax` decimal(10,2) DEFAULT 0.00,
  `total_amount` decimal(10,2) DEFAULT NULL,
  `item_status` int(11) NOT NULL DEFAULT 5,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sd_med_invoice`
--

CREATE TABLE `sd_med_invoice` (
  `ID` int(11) NOT NULL,
  `sd_med_vendor_id` int(11) NOT NULL,
  `invoice_number` varchar(255) DEFAULT NULL,
  `invoice_date` date DEFAULT NULL,
  `invoice_amount` float NOT NULL DEFAULT 0,
  `payment_status` int(11) NOT NULL DEFAULT 0,
  `payment_details` text DEFAULT NULL,
  `created_by` int(11) NOT NULL DEFAULT 0,
  `created_time` timestamp NOT NULL DEFAULT current_timestamp(),
  `last_modified_by` int(11) NOT NULL DEFAULT 0,
  `last_modified_time` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sd_med_products`
--

CREATE TABLE `sd_med_products` (
  `ID` int(11) NOT NULL,
  `generic_name` varchar(255) DEFAULT NULL,
  `product_desc` varchar(255) NOT NULL,
  `product_category` varchar(25) DEFAULT NULL,
  `product_schedule` varchar(25) DEFAULT NULL,
  `product_hsn` varchar(50) DEFAULT NULL,
  `product_min_qty` float NOT NULL DEFAULT 0,
  `status` int(11) NOT NULL,
  `created_by` int(11) NOT NULL DEFAULT 0,
  `created_time` datetime NOT NULL DEFAULT current_timestamp(),
  `last_modified_by` int(11) NOT NULL DEFAULT 0,
  `last_modified_time` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sd_med_quantity`
--

CREATE TABLE `sd_med_quantity` (
  `ID` int(11) NOT NULL,
  `sd_med_products_id` int(100) NOT NULL,
  `sd_med_expiry_id` int(100) NOT NULL,
  `type` varchar(255) NOT NULL,
  `quantity` int(100) NOT NULL,
  `trasaction_date` date NOT NULL,
  `transaction_id` int(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sd_med_vendor`
--

CREATE TABLE `sd_med_vendor` (
  `ID` int(11) NOT NULL,
  `vendor_name` varchar(255) NOT NULL,
  `company_name` varchar(255) NOT NULL,
  `vendor_address_one` text DEFAULT NULL,
  `vendor_address_two` text DEFAULT NULL,
  `vendor_city` varchar(255) DEFAULT NULL,
  `vendor_state` varchar(255) NOT NULL,
  `vendor_pin` varchar(15) NOT NULL,
  `email_id` varchar(255) NOT NULL,
  `phone_no` varchar(20) NOT NULL,
  `gst_no` varchar(255) NOT NULL,
  `status` int(11) NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_time` datetime DEFAULT NULL,
  `last_modified_by` int(11) NOT NULL,
  `last_modified_time` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sd_mt_role`
--

CREATE TABLE `sd_mt_role` (
  `ID` int(11) NOT NULL,
  `role_name` varchar(100) NOT NULL,
  `created_time` datetime DEFAULT NULL,
  `created_by` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sd_mt_userdb`
--

CREATE TABLE `sd_mt_userdb` (
  `ID` int(11) NOT NULL,
  `ename` varchar(255) NOT NULL,
  `euserid` varchar(255) NOT NULL,
  `epassword` varchar(255) NOT NULL,
  `email_id` varchar(255) NOT NULL,
  `profile_img` longtext DEFAULT NULL,
  `last_login_time` datetime DEFAULT NULL,
  `last_login_ip` varchar(50) DEFAULT NULL,
  `last_reset_time` datetime DEFAULT NULL,
  `change_pass` int(11) DEFAULT 0,
  `created_time` datetime DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `active_status` int(11) NOT NULL DEFAULT 0,
  `failed_attempts` int(11) NOT NULL DEFAULT 0,
  `address` text DEFAULT NULL,
  `gender` varchar(15) DEFAULT NULL,
  `date_of_birth` date DEFAULT NULL,
  `emergency_contact` varchar(15) DEFAULT NULL,
  `doctor_license_number` varchar(255) DEFAULT NULL,
  `qualifications` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sd_mt_user_role`
--

CREATE TABLE `sd_mt_user_role` (
  `ID` int(11) NOT NULL,
  `sd_mt_userdb_id` int(11) NOT NULL,
  `sd_mt_role_id` int(11) NOT NULL,
  `created_time` datetime DEFAULT NULL,
  `created_by` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sd_salary_details`
--

CREATE TABLE `sd_salary_details` (
  `ID` int(11) NOT NULL,
  `sd_mt_userdb_id` int(11) NOT NULL,
  `sd_salary_structure_id` int(11) NOT NULL,
  `base_salary` decimal(10,2) NOT NULL,
  `allowance` decimal(10,2) DEFAULT 0.00,
  `custom_deductions` decimal(10,2) DEFAULT 0.00,
  `effective_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sd_salary_increments`
--

CREATE TABLE `sd_salary_increments` (
  `ID` int(11) NOT NULL,
  `sd_mt_userdb_id` int(11) NOT NULL,
  `increment_amount` decimal(10,2) NOT NULL,
  `increment_type` enum('Performance','Annual','Promotion') NOT NULL,
  `increment_date` date NOT NULL,
  `description` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sd_salary_monthly`
--

CREATE TABLE `sd_salary_monthly` (
  `ID` int(11) NOT NULL,
  `sd_mt_userdb_id` int(11) NOT NULL,
  `year` int(11) NOT NULL,
  `month` int(11) NOT NULL,
  `total_gross_salary` decimal(10,2) DEFAULT NULL,
  `total_deductions` decimal(10,2) DEFAULT NULL,
  `net_salary` decimal(10,2) DEFAULT NULL,
  `status` enum('Generated','Finalized','Paid','Unpaid') DEFAULT 'Generated',
  `payment_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sd_salary_monthly_sub`
--

CREATE TABLE `sd_salary_monthly_sub` (
  `ID` int(11) NOT NULL,
  `sd_salary_monthly_id` int(11) NOT NULL,
  `component_type` enum('Base Salary','Allowance','Bonus','Deduction') NOT NULL,
  `component_name` varchar(50) DEFAULT NULL,
  `amount` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sd_salary_structure`
--

CREATE TABLE `sd_salary_structure` (
  `ID` int(11) NOT NULL,
  `role` enum('Doctor','Consultant','Nurse','Administrative Staff','Pharmacist') NOT NULL,
  `employment_type` enum('Full-time','Part-time','Consultant') NOT NULL,
  `base_salary` decimal(10,2) NOT NULL,
  `bonus_percentage` decimal(5,2) DEFAULT 0.00,
  `commission_rate` decimal(5,2) DEFAULT 0.00,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sd_site_alerts`
--

CREATE TABLE `sd_site_alerts` (
  `ID` int(11) NOT NULL,
  `type` enum('SMS','MAIL') NOT NULL,
  `name` varchar(55) NOT NULL,
  `message` text NOT NULL,
  `mail_subject` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf16 COLLATE=utf16_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sd_site_api`
--

CREATE TABLE `sd_site_api` (
  `ID` int(11) NOT NULL,
  `api_path` varchar(255) NOT NULL,
  `groups` varchar(1000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf16 COLLATE=utf16_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sd_site_settings`
--

CREATE TABLE `sd_site_settings` (
  `ID` int(3) NOT NULL,
  `setting_name` varchar(50) NOT NULL,
  `setting_value` longtext NOT NULL,
  `created_by` varchar(50) NOT NULL,
  `last_modified_time` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `sd_doctor_specailization`
--
ALTER TABLE `sd_doctor_specailization`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `specialization_code` (`specialization_code`);

--
-- Indexes for table `sd_hims_appointment`
--
ALTER TABLE `sd_hims_appointment`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `appointment_number` (`appointment_number`),
  ADD KEY `sd_mt_userdb_id` (`sd_mt_userdb_id`),
  ADD KEY `sd_hims_patient_id` (`sd_hims_patient_id`);

--
-- Indexes for table `sd_hims_bill`
--
ALTER TABLE `sd_hims_bill`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `sd_hims_bill_ibfk_1` (`sd_hims_patient_id`);

--
-- Indexes for table `sd_hims_bill_component`
--
ALTER TABLE `sd_hims_bill_component`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `sd_hims_bill_id` (`sd_hims_bill_id`),
  ADD KEY `sd_hims_bill_standard_id` (`sd_hims_bill_standard_id`);

--
-- Indexes for table `sd_hims_bill_standard`
--
ALTER TABLE `sd_hims_bill_standard`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `sd_hims_departments`
--
ALTER TABLE `sd_hims_departments`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `specialization_code` (`department_code`);

--
-- Indexes for table `sd_hims_patient`
--
ALTER TABLE `sd_hims_patient`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `sd_labs`
--
ALTER TABLE `sd_labs`
  ADD PRIMARY KEY (`ID`) USING BTREE;

--
-- Indexes for table `sd_labs_patient_test`
--
ALTER TABLE `sd_labs_patient_test`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `sd_labs_tests_id` (`sd_labs_tests_id`),
  ADD KEY `sd_labs_patient_test_ibfk_1` (`sd_hims_patient_id`);

--
-- Indexes for table `sd_labs_technician`
--
ALTER TABLE `sd_labs_technician`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `sd_labs_id` (`sd_labs_id`),
  ADD KEY `sd_mt_userdb_id` (`sd_mt_userdb_id`);

--
-- Indexes for table `sd_labs_tests`
--
ALTER TABLE `sd_labs_tests`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `sd_labs_test_categories_id` (`sd_labs_test_categories_id`),
  ADD KEY `sd_labs_id` (`sd_labs_id`);

--
-- Indexes for table `sd_labs_test_categories`
--
ALTER TABLE `sd_labs_test_categories`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `sd_med_batches`
--
ALTER TABLE `sd_med_batches`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `sd_med_bill`
--
ALTER TABLE `sd_med_bill`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `sd_med_bill_items`
--
ALTER TABLE `sd_med_bill_items`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `sd_med_bill_id` (`sd_med_bill_id`),
  ADD KEY `sd_med_products_id` (`sd_med_products_id`),
  ADD KEY `sd_med_expiry_id` (`sd_med_batch_id`);

--
-- Indexes for table `sd_med_invoice`
--
ALTER TABLE `sd_med_invoice`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `sd_med_vendor_id` (`sd_med_vendor_id`);

--
-- Indexes for table `sd_med_products`
--
ALTER TABLE `sd_med_products`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `sd_med_quantity`
--
ALTER TABLE `sd_med_quantity`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `sd_med_vendor`
--
ALTER TABLE `sd_med_vendor`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `sd_mt_userdb`
--
ALTER TABLE `sd_mt_userdb`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `sd_mt_user_role`
--
ALTER TABLE `sd_mt_user_role`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `sd_mt_userdb_id` (`sd_mt_userdb_id`),
  ADD KEY `sd_mt_role_id` (`sd_mt_role_id`);

--
-- Indexes for table `sd_salary_details`
--
ALTER TABLE `sd_salary_details`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `sd_mt_userdb_id` (`sd_mt_userdb_id`),
  ADD KEY `sd_salary_structure_id` (`sd_salary_structure_id`);

--
-- Indexes for table `sd_salary_increments`
--
ALTER TABLE `sd_salary_increments`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `sd_mt_userdb_id` (`sd_mt_userdb_id`);

--
-- Indexes for table `sd_salary_monthly`
--
ALTER TABLE `sd_salary_monthly`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `sd_mt_userdb_id` (`sd_mt_userdb_id`,`year`,`month`);

--
-- Indexes for table `sd_salary_monthly_sub`
--
ALTER TABLE `sd_salary_monthly_sub`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `sd_salary_monthly_id` (`sd_salary_monthly_id`);

--
-- Indexes for table `sd_salary_structure`
--
ALTER TABLE `sd_salary_structure`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `sd_site_alerts`
--
ALTER TABLE `sd_site_alerts`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `sd_site_api`
--
ALTER TABLE `sd_site_api`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `sd_site_settings`
--
ALTER TABLE `sd_site_settings`
  ADD PRIMARY KEY (`ID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `sd_doctor_specailization`
--
ALTER TABLE `sd_doctor_specailization`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sd_hims_appointment`
--
ALTER TABLE `sd_hims_appointment`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sd_hims_bill`
--
ALTER TABLE `sd_hims_bill`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sd_hims_bill_component`
--
ALTER TABLE `sd_hims_bill_component`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sd_hims_bill_standard`
--
ALTER TABLE `sd_hims_bill_standard`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sd_hims_departments`
--
ALTER TABLE `sd_hims_departments`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sd_hims_patient`
--
ALTER TABLE `sd_hims_patient`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sd_labs_patient_test`
--
ALTER TABLE `sd_labs_patient_test`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sd_labs_technician`
--
ALTER TABLE `sd_labs_technician`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sd_labs_tests`
--
ALTER TABLE `sd_labs_tests`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sd_labs_test_categories`
--
ALTER TABLE `sd_labs_test_categories`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sd_med_batches`
--
ALTER TABLE `sd_med_batches`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sd_med_bill`
--
ALTER TABLE `sd_med_bill`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sd_med_bill_items`
--
ALTER TABLE `sd_med_bill_items`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sd_med_invoice`
--
ALTER TABLE `sd_med_invoice`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sd_med_products`
--
ALTER TABLE `sd_med_products`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sd_med_quantity`
--
ALTER TABLE `sd_med_quantity`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sd_med_vendor`
--
ALTER TABLE `sd_med_vendor`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sd_mt_userdb`
--
ALTER TABLE `sd_mt_userdb`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sd_mt_user_role`
--
ALTER TABLE `sd_mt_user_role`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sd_salary_details`
--
ALTER TABLE `sd_salary_details`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sd_salary_increments`
--
ALTER TABLE `sd_salary_increments`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sd_salary_monthly`
--
ALTER TABLE `sd_salary_monthly`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sd_salary_monthly_sub`
--
ALTER TABLE `sd_salary_monthly_sub`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sd_salary_structure`
--
ALTER TABLE `sd_salary_structure`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sd_site_alerts`
--
ALTER TABLE `sd_site_alerts`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sd_site_api`
--
ALTER TABLE `sd_site_api`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sd_site_settings`
--
ALTER TABLE `sd_site_settings`
  MODIFY `ID` int(3) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `sd_hims_appointment`
--
ALTER TABLE `sd_hims_appointment`
  ADD CONSTRAINT `sd_hims_appointment_ibfk_2` FOREIGN KEY (`sd_mt_userdb_id`) REFERENCES `sd_mt_userdb` (`ID`),
  ADD CONSTRAINT `sd_hims_appointment_ibfk_3` FOREIGN KEY (`sd_hims_patient_id`) REFERENCES `sd_hims_patient` (`ID`);

--
-- Constraints for table `sd_hims_bill`
--
ALTER TABLE `sd_hims_bill`
  ADD CONSTRAINT `sd_hims_bill_ibfk_1` FOREIGN KEY (`sd_hims_patient_id`) REFERENCES `sd_hims_patient` (`ID`);

--
-- Constraints for table `sd_hims_bill_component`
--
ALTER TABLE `sd_hims_bill_component`
  ADD CONSTRAINT `sd_hims_bill_component_ibfk_1` FOREIGN KEY (`sd_hims_bill_id`) REFERENCES `sd_hims_bill` (`ID`),
  ADD CONSTRAINT `sd_hims_bill_component_ibfk_2` FOREIGN KEY (`sd_hims_bill_standard_id`) REFERENCES `sd_hims_bill_standard` (`ID`);

--
-- Constraints for table `sd_labs_patient_test`
--
ALTER TABLE `sd_labs_patient_test`
  ADD CONSTRAINT `sd_labs_patient_test_ibfk_1` FOREIGN KEY (`sd_hims_patient_id`) REFERENCES `sd_hims_patient` (`ID`),
  ADD CONSTRAINT `sd_labs_patient_test_ibfk_2` FOREIGN KEY (`sd_labs_tests_id`) REFERENCES `sd_labs_tests` (`ID`);

--
-- Constraints for table `sd_labs_technician`
--
ALTER TABLE `sd_labs_technician`
  ADD CONSTRAINT `sd_labs_technician_ibfk_1` FOREIGN KEY (`sd_labs_id`) REFERENCES `sd_labs` (`ID`),
  ADD CONSTRAINT `sd_labs_technician_ibfk_2` FOREIGN KEY (`sd_mt_userdb_id`) REFERENCES `sd_mt_userdb` (`ID`);

--
-- Constraints for table `sd_labs_tests`
--
ALTER TABLE `sd_labs_tests`
  ADD CONSTRAINT `sd_labs_tests_ibfk_1` FOREIGN KEY (`sd_labs_test_categories_id`) REFERENCES `sd_labs_test_categories` (`ID`);

--
-- Constraints for table `sd_med_bill_items`
--
ALTER TABLE `sd_med_bill_items`
  ADD CONSTRAINT `sd_med_bill_items_ibfk_1` FOREIGN KEY (`sd_med_bill_id`) REFERENCES `sd_med_bill` (`ID`),
  ADD CONSTRAINT `sd_med_bill_items_ibfk_2` FOREIGN KEY (`sd_med_products_id`) REFERENCES `sd_med_products` (`ID`),
  ADD CONSTRAINT `sd_med_bill_items_ibfk_3` FOREIGN KEY (`sd_med_batch_id`) REFERENCES `sd_med_batches` (`ID`);

--
-- Constraints for table `sd_med_invoice`
--
ALTER TABLE `sd_med_invoice`
  ADD CONSTRAINT `sd_med_invoice_ibfk_1` FOREIGN KEY (`sd_med_vendor_id`) REFERENCES `sd_med_vendor` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `sd_salary_details`
--
ALTER TABLE `sd_salary_details`
  ADD CONSTRAINT `sd_salary_details_ibfk_1` FOREIGN KEY (`sd_mt_userdb_id`) REFERENCES `sd_mt_userdb` (`ID`),
  ADD CONSTRAINT `sd_salary_details_ibfk_2` FOREIGN KEY (`sd_salary_structure_id`) REFERENCES `sd_salary_structure` (`ID`);

--
-- Constraints for table `sd_salary_increments`
--
ALTER TABLE `sd_salary_increments`
  ADD CONSTRAINT `sd_salary_increments_ibfk_1` FOREIGN KEY (`sd_mt_userdb_id`) REFERENCES `sd_mt_userdb` (`ID`);

--
-- Constraints for table `sd_salary_monthly`
--
ALTER TABLE `sd_salary_monthly`
  ADD CONSTRAINT `sd_salary_monthly_ibfk_1` FOREIGN KEY (`sd_mt_userdb_id`) REFERENCES `sd_mt_userdb` (`ID`);

--
-- Constraints for table `sd_salary_monthly_sub`
--
ALTER TABLE `sd_salary_monthly_sub`
  ADD CONSTRAINT `sd_salary_monthly_sub_ibfk_1` FOREIGN KEY (`sd_salary_monthly_id`) REFERENCES `sd_salary_monthly` (`ID`);
--
-- Database: `sds_home`
--
CREATE DATABASE IF NOT EXISTS `sds_home` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_uca1400_ai_ci;
USE `sds_home`;

-- --------------------------------------------------------

--
-- Table structure for table `sd_admin_cookie_consent`
--

CREATE TABLE `sd_admin_cookie_consent` (
  `ID` int(11) NOT NULL,
  `userId` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `anonymousId` varchar(255) DEFAULT NULL,
  `ipAddress` varchar(255) NOT NULL,
  `essentialCookies` tinyint(1) NOT NULL DEFAULT 1,
  `functionalCookies` tinyint(1) NOT NULL DEFAULT 0,
  `analyticsCookies` tinyint(1) NOT NULL DEFAULT 0,
  `advertisingCookies` tinyint(1) NOT NULL DEFAULT 0,
  `userAgent` text NOT NULL,
  `source` varchar(255) NOT NULL,
  `policyVersion` varchar(255) NOT NULL DEFAULT '1.0',
  `last_modified_time` datetime NOT NULL,
  `isWithdrawn` tinyint(1) DEFAULT 0,
  `withdrawnAt` datetime DEFAULT NULL,
  `created_time` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sd_admin_mail`
--

CREATE TABLE `sd_admin_mail` (
  `ID` int(11) NOT NULL,
  `mail_name` varchar(255) NOT NULL,
  `mail_subject` text NOT NULL,
  `mail_msg` longtext NOT NULL,
  `last_modified_by` datetime NOT NULL,
  `last_modified_time` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sd_admin_menu`
--

CREATE TABLE `sd_admin_menu` (
  `ID` int(11) NOT NULL,
  `label` varchar(50) NOT NULL,
  `icon` varchar(50) NOT NULL,
  `link` varchar(150) NOT NULL,
  `roles` varchar(255) NOT NULL,
  `order_number` int(11) NOT NULL DEFAULT 0,
  `parent_id` int(11) NOT NULL DEFAULT 0,
  `created_by` datetime NOT NULL,
  `last_modified_time` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sd_admin_mt_role`
--

CREATE TABLE `sd_admin_mt_role` (
  `ID` int(11) NOT NULL,
  `role_name` varchar(100) NOT NULL,
  `created_time` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sd_admin_mt_userdb`
--

CREATE TABLE `sd_admin_mt_userdb` (
  `ID` int(11) NOT NULL,
  `emailid` varchar(255) DEFAULT NULL,
  `ename` varchar(255) DEFAULT NULL,
  `epassword` varchar(255) DEFAULT NULL,
  `euserid` varchar(255) DEFAULT NULL,
  `mobile_no` varchar(255) DEFAULT NULL,
  `designation` varchar(250) DEFAULT NULL,
  `profile_img` text DEFAULT NULL,
  `last_login_time` datetime DEFAULT NULL,
  `last_login_ip` varchar(50) DEFAULT NULL,
  `last_reset_time` datetime DEFAULT NULL,
  `change_pass` int(11) DEFAULT 0,
  `created_time` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT 0,
  `active_status` int(11) NOT NULL DEFAULT 0,
  `failed_attempts` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sd_admin_mt_user_role`
--

CREATE TABLE `sd_admin_mt_user_role` (
  `ID` int(11) NOT NULL,
  `sd_mt_userdb_id` int(11) NOT NULL,
  `sd_mt_role_id` int(11) NOT NULL,
  `created_by` varchar(100) NOT NULL,
  `created_time` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sd_bank_form`
--

CREATE TABLE `sd_bank_form` (
  `id` int(11) NOT NULL,
  `email` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `mobile_no` varchar(15) NOT NULL,
  `aadhar_no` varchar(12) NOT NULL,
  `profile_img` longtext DEFAULT NULL,
  `full_data` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`full_data`)),
  `status` varchar(50) NOT NULL DEFAULT '5',
  `created_time` datetime NOT NULL,
  `approved_by` int(11) DEFAULT NULL,
  `approved_time` datetime DEFAULT NULL,
  `approved_remarks` varchar(500) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sd_contact`
--

CREATE TABLE `sd_contact` (
  `ID` int(11) NOT NULL,
  `email_id` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `msg` varchar(255) DEFAULT NULL,
  `mobile_no` varchar(10) DEFAULT NULL,
  `last_modified_time` datetime DEFAULT NULL,
  `created_time` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sd_csp`
--

CREATE TABLE `sd_csp` (
  `ID` int(11) NOT NULL,
  `sd_url` varchar(255) DEFAULT NULL,
  `email_id` varchar(255) DEFAULT NULL,
  `sd_mt_userdb_id` int(11) DEFAULT NULL,
  `created_time` datetime DEFAULT NULL,
  `overall_score` float DEFAULT 0,
  `last_modified_time` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sd_csp_analysis`
--

CREATE TABLE `sd_csp_analysis` (
  `ID` int(11) NOT NULL,
  `url_id` int(11) NOT NULL,
  `directives` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`directives`)),
  `overall_score` int(11) NOT NULL,
  `created_time` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sd_csp_payment`
--

CREATE TABLE `sd_csp_payment` (
  `ID` int(11) NOT NULL,
  `email_id` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `mobile_no` varchar(20) DEFAULT NULL,
  `billing_address` text DEFAULT NULL,
  `gst_no` varchar(50) DEFAULT NULL,
  `created_time` datetime DEFAULT NULL,
  `last_modified_time` datetime DEFAULT NULL,
  `payment_start_time` datetime DEFAULT NULL,
  `payment_ref_no` varchar(100) DEFAULT NULL,
  `payment_amount` float DEFAULT 0,
  `payment_tax` float DEFAULT 0,
  `payment_total_amount` float DEFAULT 0,
  `payment_status` varchar(50) DEFAULT 'pending',
  `plan_mode` varchar(255) DEFAULT NULL,
  `plan_duration` varchar(255) DEFAULT NULL,
  `plan_end_date` date DEFAULT NULL,
  `plan_count` int(11) DEFAULT NULL,
  `payment_end_time` datetime DEFAULT NULL,
  `payment_currency` varchar(50) DEFAULT NULL,
  `razorpay_order_id` text DEFAULT NULL,
  `razorpay_payment_id` text DEFAULT NULL,
  `razorpay_signature` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sd_csp_settings`
--

CREATE TABLE `sd_csp_settings` (
  `ID` int(11) NOT NULL,
  `request_type` varchar(255) NOT NULL,
  `alter_email_id` varchar(255) DEFAULT NULL,
  `csp_id` int(11) NOT NULL,
  `created_time` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sd_dsc_demo`
--

CREATE TABLE `sd_dsc_demo` (
  `id` int(11) NOT NULL,
  `email` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `mobile_no` varchar(15) NOT NULL,
  `aadhar_no` varchar(12) NOT NULL,
  `profile_img` longtext DEFAULT NULL,
  `full_data` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`full_data`)),
  `status` varchar(50) NOT NULL DEFAULT '5',
  `created_time` datetime NOT NULL,
  `approved_by` int(11) DEFAULT NULL,
  `approved_time` datetime DEFAULT NULL,
  `approved_remarks` varchar(500) DEFAULT NULL,
  `last_modified_time` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sd_menu`
--

CREATE TABLE `sd_menu` (
  `ID` int(11) NOT NULL,
  `label` varchar(50) NOT NULL,
  `icon` varchar(50) NOT NULL,
  `link` varchar(150) NOT NULL,
  `roles` varchar(255) NOT NULL,
  `order_number` int(11) NOT NULL DEFAULT 0,
  `parent_id` int(11) NOT NULL DEFAULT 0,
  `created_by` datetime NOT NULL,
  `last_modified_time` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `sd_admin_cookie_consent`
--
ALTER TABLE `sd_admin_cookie_consent`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `sd_admin_mail`
--
ALTER TABLE `sd_admin_mail`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `sd_admin_menu`
--
ALTER TABLE `sd_admin_menu`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `sd_admin_mt_role`
--
ALTER TABLE `sd_admin_mt_role`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `sd_admin_mt_userdb`
--
ALTER TABLE `sd_admin_mt_userdb`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `sd_admin_mt_user_role`
--
ALTER TABLE `sd_admin_mt_user_role`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `sd_admin_mt_user_role_sd_mt_role_id_sd_mt_userdb_id_unique` (`sd_mt_userdb_id`,`sd_mt_role_id`),
  ADD KEY `sd_mt_role_id` (`sd_mt_role_id`);

--
-- Indexes for table `sd_bank_form`
--
ALTER TABLE `sd_bank_form`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `aadhar_no` (`aadhar_no`);

--
-- Indexes for table `sd_contact`
--
ALTER TABLE `sd_contact`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `sd_csp`
--
ALTER TABLE `sd_csp`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `sd_mt_userdb_id` (`sd_mt_userdb_id`);

--
-- Indexes for table `sd_csp_analysis`
--
ALTER TABLE `sd_csp_analysis`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `url_id` (`url_id`);

--
-- Indexes for table `sd_csp_payment`
--
ALTER TABLE `sd_csp_payment`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `sd_csp_settings`
--
ALTER TABLE `sd_csp_settings`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `csp_id` (`csp_id`);

--
-- Indexes for table `sd_dsc_demo`
--
ALTER TABLE `sd_dsc_demo`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `aadhar_no` (`aadhar_no`);

--
-- Indexes for table `sd_menu`
--
ALTER TABLE `sd_menu`
  ADD PRIMARY KEY (`ID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `sd_admin_cookie_consent`
--
ALTER TABLE `sd_admin_cookie_consent`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sd_admin_mail`
--
ALTER TABLE `sd_admin_mail`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sd_admin_menu`
--
ALTER TABLE `sd_admin_menu`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sd_admin_mt_role`
--
ALTER TABLE `sd_admin_mt_role`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sd_admin_mt_userdb`
--
ALTER TABLE `sd_admin_mt_userdb`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sd_admin_mt_user_role`
--
ALTER TABLE `sd_admin_mt_user_role`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sd_bank_form`
--
ALTER TABLE `sd_bank_form`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sd_contact`
--
ALTER TABLE `sd_contact`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sd_csp`
--
ALTER TABLE `sd_csp`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sd_csp_analysis`
--
ALTER TABLE `sd_csp_analysis`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sd_csp_payment`
--
ALTER TABLE `sd_csp_payment`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sd_csp_settings`
--
ALTER TABLE `sd_csp_settings`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sd_dsc_demo`
--
ALTER TABLE `sd_dsc_demo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sd_menu`
--
ALTER TABLE `sd_menu`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `sd_admin_mt_user_role`
--
ALTER TABLE `sd_admin_mt_user_role`
  ADD CONSTRAINT `sd_admin_mt_user_role_ibfk_1` FOREIGN KEY (`sd_mt_userdb_id`) REFERENCES `sd_admin_mt_userdb` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `sd_admin_mt_user_role_ibfk_2` FOREIGN KEY (`sd_mt_role_id`) REFERENCES `sd_admin_mt_role` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `sd_csp`
--
ALTER TABLE `sd_csp`
  ADD CONSTRAINT `sd_csp_ibfk_1` FOREIGN KEY (`sd_mt_userdb_id`) REFERENCES `sd_admin_mt_userdb` (`ID`);

--
-- Constraints for table `sd_csp_analysis`
--
ALTER TABLE `sd_csp_analysis`
  ADD CONSTRAINT `sd_csp_analysis_ibfk_1` FOREIGN KEY (`url_id`) REFERENCES `sd_csp` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `sd_csp_settings`
--
ALTER TABLE `sd_csp_settings`
  ADD CONSTRAINT `sd_csp_settings_ibfk_1` FOREIGN KEY (`csp_id`) REFERENCES `sd_csp` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE;
--
-- Database: `sds_hrms`
--
CREATE DATABASE IF NOT EXISTS `sds_hrms` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_uca1400_ai_ci;
USE `sds_hrms`;

-- --------------------------------------------------------

--
-- Table structure for table `sd_admin_api`
--

CREATE TABLE `sd_admin_api` (
  `ID` int(11) NOT NULL,
  `request_type` varchar(10) NOT NULL,
  `api_path` varchar(255) NOT NULL,
  `groups` varchar(1000) DEFAULT NULL,
  `controller_name` varchar(50) NOT NULL,
  `function_name` varchar(50) NOT NULL,
  `last_modified_time` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf16 COLLATE=utf16_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sd_admin_assets`
--

CREATE TABLE `sd_admin_assets` (
  `ID` int(11) NOT NULL,
  `asset_type` varchar(255) NOT NULL,
  `asset_name` varchar(1000) NOT NULL,
  `asset_number` varchar(255) NOT NULL,
  `asset_details` text DEFAULT NULL,
  `assert_return` longtext NOT NULL,
  `asset_condition` varchar(50) DEFAULT NULL,
  `created_by` int(11) NOT NULL DEFAULT 0,
  `status` int(11) NOT NULL DEFAULT 0,
  `last_modified_time` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sd_admin_banks`
--

CREATE TABLE `sd_admin_banks` (
  `ID` int(11) NOT NULL,
  `bank_name` varchar(255) NOT NULL,
  `bank_type` enum('Public Sector Bank','Private Sector Bank','Regional Rural Bank','Small Finance Bank','Local Area Bank','Foreign Bank') NOT NULL,
  `head_office` varchar(255) NOT NULL,
  `website_link` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sd_admin_calander_dates`
--

CREATE TABLE `sd_admin_calander_dates` (
  `ID` int(11) NOT NULL,
  `calendar_date` date NOT NULL,
  `day_of_week` varchar(10) DEFAULT NULL,
  `is_weekend` tinyint(1) DEFAULT NULL,
  `is_holiday` tinyint(1) DEFAULT NULL,
  `holiday_name` varchar(255) DEFAULT NULL,
  `fiscal_year` varchar(10) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sd_admin_const`
--

CREATE TABLE `sd_admin_const` (
  `ID` int(11) NOT NULL,
  `type` varchar(10) NOT NULL,
  `value` varchar(255) NOT NULL,
  `label` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sd_admin_employees_types`
--

CREATE TABLE `sd_admin_employees_types` (
  `ID` int(11) NOT NULL,
  `type` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `tag` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sd_admin_mail`
--

CREATE TABLE `sd_admin_mail` (
  `ID` int(11) NOT NULL,
  `mail_name` varchar(255) NOT NULL,
  `mail_subject` text NOT NULL,
  `mail_msg` longtext NOT NULL,
  `last_modified_by` int(11) NOT NULL,
  `last_modified_time` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sd_admin_menu`
--

CREATE TABLE `sd_admin_menu` (
  `ID` int(11) NOT NULL,
  `label` varchar(50) NOT NULL,
  `icon` varchar(50) NOT NULL,
  `link` varchar(150) NOT NULL,
  `roles` varchar(255) NOT NULL,
  `order_number` int(11) NOT NULL DEFAULT 0,
  `parent_id` int(11) NOT NULL DEFAULT 0,
  `created_by` int(11) NOT NULL,
  `last_modified_time` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `sd_admin_modules_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sd_admin_modules`
--

CREATE TABLE `sd_admin_modules` (
  `ID` int(11) NOT NULL,
  `module_name` varchar(255) NOT NULL,
  `status` int(11) NOT NULL DEFAULT 5
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sd_admin_module_permissions`
--

CREATE TABLE `sd_admin_module_permissions` (
  `ID` int(20) UNSIGNED NOT NULL,
  `module_id` int(11) DEFAULT NULL,
  `action` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sd_admin_role_permissions`
--

CREATE TABLE `sd_admin_role_permissions` (
  `ID` bigint(20) UNSIGNED NOT NULL,
  `role_id` int(11) DEFAULT NULL,
  `permission_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sd_admin_tax_configurations`
--

CREATE TABLE `sd_admin_tax_configurations` (
  `ID` int(11) NOT NULL,
  `tax_name` varchar(100) NOT NULL,
  `tax_code` varchar(20) NOT NULL,
  `tax_rate` decimal(5,2) NOT NULL,
  `tax_type` enum('Inclusive','Exclusive') DEFAULT 'Exclusive',
  `country_code` varchar(3) DEFAULT NULL,
  `state_code` varchar(10) DEFAULT NULL,
  `effective_from` date DEFAULT NULL,
  `effective_to` date DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT 1,
  `is_default` tinyint(1) DEFAULT 0,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sd_advance`
--

CREATE TABLE `sd_advance` (
  `ID` int(11) NOT NULL,
  `sd_employees_id` int(11) NOT NULL COMMENT 'advance created for',
  `accounts_ref_number` varchar(255) DEFAULT NULL,
  `advance_purpose` text NOT NULL,
  `advance_amount` float NOT NULL,
  `advance_for` int(11) NOT NULL DEFAULT 1 COMMENT '1=>SELF, 2=>TEAM Member',
  `credit_to` int(11) NOT NULL DEFAULT 0,
  `credit_status` int(11) NOT NULL DEFAULT 1 COMMENT '1=>Yet to credit, 2=>Credit',
  `created_by` int(11) NOT NULL,
  `created_time` timestamp NOT NULL DEFAULT current_timestamp(),
  `approved_by` int(11) DEFAULT 0,
  `approved_time` timestamp NULL DEFAULT current_timestamp(),
  `last_modified_by` int(11) NOT NULL DEFAULT 0,
  `last_modified_time` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `accounts_id` int(11) NOT NULL DEFAULT 0,
  `accounts_time` timestamp NULL DEFAULT current_timestamp(),
  `accounts_amount` float NOT NULL DEFAULT 0,
  `accounts_credit_status` int(11) NOT NULL DEFAULT 1 COMMENT '1= Credited to account, 2=>include in pay slip',
  `status` int(11) NOT NULL DEFAULT 5,
  `approved_remarks` text DEFAULT NULL,
  `accounts_remarks` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sd_attendance`
--

CREATE TABLE `sd_attendance` (
  `ID` int(11) NOT NULL,
  `sd_employees_id` int(11) NOT NULL,
  `date` date NOT NULL DEFAULT current_timestamp(),
  `check_in_time` time DEFAULT NULL,
  `check_out_time` time DEFAULT NULL,
  `add_indication` int(11) NOT NULL DEFAULT 1 COMMENT '1=Present, 2= Absent 3=Leave',
  `location` text DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT 1,
  `mode` enum('APP','EXCEL','IOT') DEFAULT NULL,
  `created_by` int(11) NOT NULL DEFAULT 0,
  `created_time` timestamp NULL DEFAULT current_timestamp(),
  `last_modified_time` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `adv_leave_type_id` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sd_bill_claims`
--

CREATE TABLE `sd_bill_claims` (
  `ID` int(11) NOT NULL,
  `sd_employees_id` int(11) NOT NULL,
  `bill_cat` varchar(255) NOT NULL,
  `bill_title` varchar(1000) DEFAULT NULL,
  `bill_ref_number` varchar(255) DEFAULT NULL,
  `claim_amount` decimal(10,2) NOT NULL,
  `claim_date` date NOT NULL,
  `bill_file` longtext DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT 5,
  `created_by` int(11) DEFAULT 0,
  `created_time` timestamp NOT NULL DEFAULT current_timestamp(),
  `approved_date` date DEFAULT NULL,
  `approved_by` int(11) NOT NULL DEFAULT 0,
  `app_remarks` text DEFAULT NULL,
  `credited_by` int(11) NOT NULL DEFAULT 0,
  `credit_status` int(11) NOT NULL DEFAULT 0,
  `credited_date` date DEFAULT NULL,
  `credit_amount` float NOT NULL DEFAULT 0,
  `credit_details` varchar(255) DEFAULT NULL,
  `last_modified_time` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sd_bill_claims_items`
--

CREATE TABLE `sd_bill_claims_items` (
  `ID` int(11) NOT NULL,
  `sd_bill_claims_id` int(11) NOT NULL,
  `item_desc` varchar(255) NOT NULL,
  `item_date` date DEFAULT NULL,
  `item_amount` float NOT NULL,
  `upload_file` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sd_circulars`
--

CREATE TABLE `sd_circulars` (
  `ID` int(11) NOT NULL,
  `circular_type` varchar(50) NOT NULL,
  `circular_title` text NOT NULL,
  `circular_file` longtext NOT NULL,
  `created_by` int(11) NOT NULL,
  `last_modified_time` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `status` int(11) NOT NULL DEFAULT 5,
  `created_time` timestamp NOT NULL DEFAULT current_timestamp(),
  `last_modified_by` int(11) NOT NULL DEFAULT 0,
  `circular_image` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf16 COLLATE=utf16_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sd_customer`
--

CREATE TABLE `sd_customer` (
  `ID` int(11) NOT NULL,
  `vendor_company` varchar(255) NOT NULL,
  `vendor_name` varchar(255) DEFAULT NULL,
  `pan_no` varchar(255) DEFAULT NULL,
  `single_bill` int(11) NOT NULL DEFAULT 0,
  `status` int(11) NOT NULL DEFAULT 0,
  `created_by` int(11) NOT NULL DEFAULT 0,
  `created_time` datetime NOT NULL,
  `last_modified_by` int(11) NOT NULL DEFAULT 0,
  `last_modified_time` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `single_bill_hsn` varchar(50) DEFAULT NULL,
  `single_bill_title` varchar(1000) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sd_customer_address`
--

CREATE TABLE `sd_customer_address` (
  `ID` int(11) NOT NULL,
  `sd_customers_id` int(11) NOT NULL,
  `billing_to` varchar(255) DEFAULT NULL,
  `gst_no` varchar(255) DEFAULT NULL,
  `address_one` text DEFAULT NULL,
  `address_two` text DEFAULT NULL,
  `state_name` varchar(255) DEFAULT NULL,
  `pin_code` varchar(15) DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT 0,
  `created_by` int(11) NOT NULL DEFAULT 0,
  `created_time` datetime NOT NULL,
  `last_modified_by` int(11) NOT NULL DEFAULT 0,
  `last_modified_time` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sd_customer_hsn`
--

CREATE TABLE `sd_customer_hsn` (
  `ID` int(11) NOT NULL,
  `sd_customer_id` int(11) NOT NULL,
  `sd_efl_hsns_id` int(11) NOT NULL DEFAULT 0,
  `hsn` varchar(10) NOT NULL,
  `title` varchar(1000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sd_designations`
--

CREATE TABLE `sd_designations` (
  `ID` int(11) NOT NULL,
  `designation_name` varchar(50) NOT NULL,
  `base_salary` decimal(10,2) NOT NULL,
  `created_time` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sd_doc_check_list`
--

CREATE TABLE `sd_doc_check_list` (
  `ID` int(11) NOT NULL,
  `doc_name` varchar(255) NOT NULL,
  `doc_types` text DEFAULT NULL,
  `is_required` int(11) NOT NULL,
  `created_time` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sd_employees`
--

CREATE TABLE `sd_employees` (
  `ID` int(11) NOT NULL,
  `emp_type` int(11) DEFAULT NULL,
  `employee_id` varchar(50) NOT NULL,
  `epassword` varchar(255) DEFAULT NULL,
  `ename` varchar(255) DEFAULT NULL,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `sd_designations_id` int(11) NOT NULL,
  `email` varchar(100) DEFAULT NULL,
  `phone` longtext DEFAULT NULL,
  `emp_dob` date DEFAULT NULL,
  `joining_date` date DEFAULT NULL,
  `having_login` int(11) NOT NULL DEFAULT 5,
  `attendance_app` int(11) NOT NULL DEFAULT 5,
  `active_status` int(11) DEFAULT 5,
  `profile_img` longtext DEFAULT NULL,
  `last_login_time` datetime DEFAULT NULL,
  `last_login_ip` varchar(255) DEFAULT NULL,
  `last_reset_time` datetime DEFAULT NULL,
  `change_pass` int(11) NOT NULL DEFAULT 1,
  `created_by` int(11) DEFAULT 0,
  `created_time` timestamp NULL DEFAULT current_timestamp(),
  `last_modified_by` int(11) DEFAULT 0,
  `last_modified_time` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `aadhar_number` varchar(255) DEFAULT NULL,
  `pan_number` varchar(255) DEFAULT NULL,
  `address` text DEFAULT NULL,
  `day_deduction` float NOT NULL DEFAULT 0,
  `failed_attempts` int(11) NOT NULL DEFAULT 0,
  `exit_date` date DEFAULT NULL,
  `emp_qualification` varchar(255) DEFAULT NULL,
  `emp_degree` varchar(1000) DEFAULT NULL,
  `emp_experience` int(11) NOT NULL DEFAULT 0,
  `division` varchar(255) DEFAULT NULL,
  `department` varchar(255) DEFAULT NULL,
  `location` varchar(255) DEFAULT NULL,
  `sub_location` varchar(255) DEFAULT NULL,
  `cc_code` varchar(255) DEFAULT NULL,
  `uan` varchar(255) DEFAULT NULL,
  `esi_number` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sd_employees_locations`
--

CREATE TABLE `sd_employees_locations` (
  `ID` int(11) NOT NULL,
  `sd_employees_id` int(11) NOT NULL,
  `sd_office_locations_id` int(11) NOT NULL,
  `created_time` datetime DEFAULT NULL,
  `created_by` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sd_employee_assets`
--

CREATE TABLE `sd_employee_assets` (
  `ID` int(11) NOT NULL,
  `sd_employees_id` int(11) NOT NULL,
  `sd_admin_assets_id` int(11) NOT NULL,
  `asset_details` text DEFAULT NULL,
  `asset_issue_condition` varchar(10) DEFAULT NULL,
  `asset_return_condition` varchar(50) DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT 15 COMMENT '5 = requested 10=approved, 15= uploaded',
  `remarks` text DEFAULT NULL,
  `created_by` int(11) NOT NULL DEFAULT 0,
  `created_time` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `last_modified_by` int(11) NOT NULL DEFAULT 0,
  `last_modified_time` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sd_employee_bank`
--

CREATE TABLE `sd_employee_bank` (
  `ID` int(11) NOT NULL,
  `sd_employees_id` int(11) NOT NULL,
  `sd_admin_bank_id` int(11) NOT NULL,
  `is_active` int(11) NOT NULL DEFAULT 1,
  `bank_acc_no` varchar(255) NOT NULL,
  `bank_ifsc_no` varchar(15) NOT NULL,
  `bank_location` text DEFAULT NULL,
  `created_by` int(11) NOT NULL,
  `created_time` timestamp NOT NULL DEFAULT current_timestamp(),
  `last_modified_time` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sd_employee_doc`
--

CREATE TABLE `sd_employee_doc` (
  `ID` int(11) NOT NULL,
  `sd_employees_id` int(11) NOT NULL,
  `sd_doc_check_list_id` int(11) NOT NULL,
  `upload_file` longtext DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT 15 COMMENT '5 = requested 10=approved, 15= uploaded',
  `created_by` int(11) NOT NULL DEFAULT 0,
  `created_time` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `last_modified_by` int(11) NOT NULL DEFAULT 0,
  `last_modified_time` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sd_employee_leave`
--

CREATE TABLE `sd_employee_leave` (
  `ID` int(11) NOT NULL,
  `sd_employees_id` int(11) NOT NULL,
  `sd_leave_types_id` int(11) NOT NULL,
  `is_required` int(1) NOT NULL DEFAULT 1,
  `leaves` float DEFAULT NULL,
  `created_time` timestamp NULL DEFAULT current_timestamp(),
  `created_by` int(11) DEFAULT 0,
  `last_modified_by` int(11) DEFAULT 0,
  `last_modified_time` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sd_employee_salary`
--

CREATE TABLE `sd_employee_salary` (
  `ID` int(11) NOT NULL,
  `sd_employees_id` int(11) NOT NULL,
  `sd_salary_components_id` int(11) NOT NULL,
  `add_amount` decimal(10,2) DEFAULT NULL,
  `created_time` timestamp NULL DEFAULT current_timestamp(),
  `created_by` int(11) DEFAULT 0,
  `last_modified_by` int(11) DEFAULT 0,
  `last_modified_time` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sd_gallery`
--

CREATE TABLE `sd_gallery` (
  `ID` int(11) NOT NULL,
  `title` varchar(1000) NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_time` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sd_gallery_items`
--

CREATE TABLE `sd_gallery_items` (
  `ID` int(11) NOT NULL,
  `sd_gallery_id` int(11) NOT NULL,
  `image_title` varchar(1000) NOT NULL,
  `image_file` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sd_holidays`
--

CREATE TABLE `sd_holidays` (
  `ID` int(11) NOT NULL,
  `date` date NOT NULL,
  `name` varchar(500) NOT NULL,
  `created_time` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sd_import`
--

CREATE TABLE `sd_import` (
  `ID` int(11) NOT NULL,
  `sd_import_type` varchar(20) NOT NULL,
  `sd_file` varchar(255) DEFAULT NULL,
  `sd_mt_userdb_id` int(11) NOT NULL,
  `last_modified_time` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sd_invoices`
--

CREATE TABLE `sd_invoices` (
  `ID` int(11) NOT NULL,
  `invoice_number` varchar(50) NOT NULL,
  `invoice_series_id` int(11) DEFAULT NULL,
  `sd_vendors_id` int(11) NOT NULL,
  `invoice_date` date NOT NULL,
  `due_date` date NOT NULL,
  `payment_date` date DEFAULT NULL,
  `subtotal` decimal(15,2) NOT NULL DEFAULT 0.00,
  `tax_amount` decimal(15,2) NOT NULL DEFAULT 0.00,
  `discount_amount` decimal(15,2) NOT NULL DEFAULT 0.00,
  `total_amount` decimal(15,2) NOT NULL DEFAULT 0.00,
  `paid_amount` decimal(15,2) NOT NULL DEFAULT 0.00,
  `balance_amount` decimal(15,2) NOT NULL DEFAULT 0.00,
  `currency_code` varchar(3) DEFAULT 'USD',
  `exchange_rate` decimal(10,6) DEFAULT 1.000000,
  `status` enum('Draft','Sent','Viewed','Partial','Paid','Overdue','Cancelled','Refunded') DEFAULT 'Draft',
  `payment_status` enum('Unpaid','Partial','Paid','Overdue','Refunded') DEFAULT 'Unpaid',
  `template_id` int(11) DEFAULT NULL,
  `delivery_method` varchar(50) DEFAULT NULL,
  `sent_at` timestamp NULL DEFAULT NULL,
  `viewed_at` timestamp NULL DEFAULT NULL,
  `is_recurring` tinyint(1) DEFAULT 0,
  `parent_invoice_id` int(11) DEFAULT NULL,
  `recurring_frequency` enum('Daily','Weekly','Monthly','Quarterly','Yearly') DEFAULT NULL,
  `next_invoice_date` date DEFAULT NULL,
  `recurring_end_date` date DEFAULT NULL,
  `max_occurrences` int(11) DEFAULT NULL,
  `current_occurrence` int(11) DEFAULT 0,
  `notes` text DEFAULT NULL,
  `internal_notes` text DEFAULT NULL,
  `reference_number` varchar(100) DEFAULT NULL,
  `purchase_order_number` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `created_by` int(11) NOT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `recurring_start_date` date DEFAULT NULL,
  `recurring_end_condition` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sd_invoice_items`
--

CREATE TABLE `sd_invoice_items` (
  `ID` int(11) NOT NULL,
  `sd_invoices_id` int(11) NOT NULL,
  `item_sequence` int(11) NOT NULL DEFAULT 1,
  `item_code` varchar(50) DEFAULT NULL,
  `item_name` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `category` varchar(100) DEFAULT NULL,
  `quantity` decimal(10,3) NOT NULL DEFAULT 1.000,
  `unit_price` decimal(15,2) NOT NULL DEFAULT 0.00,
  `discount_percentage` decimal(5,2) DEFAULT 0.00,
  `discount_amount` decimal(15,2) DEFAULT 0.00,
  `tax_rate` decimal(5,2) DEFAULT 0.00,
  `tax_amount` decimal(15,2) DEFAULT 0.00,
  `tax_type` varchar(50) DEFAULT NULL,
  `line_total` decimal(15,2) NOT NULL DEFAULT 0.00,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sd_invoice_series`
--

CREATE TABLE `sd_invoice_series` (
  `ID` int(11) NOT NULL,
  `series_name` varchar(50) NOT NULL,
  `series_prefix` varchar(10) NOT NULL,
  `current_number` int(11) DEFAULT 1,
  `number_format` varchar(50) DEFAULT '{prefix}-{year}-{number:04d}',
  `is_active` tinyint(1) DEFAULT 1,
  `created_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sd_invoice_templates`
--

CREATE TABLE `sd_invoice_templates` (
  `ID` int(11) NOT NULL,
  `template_name` varchar(100) NOT NULL,
  `template_code` varchar(20) NOT NULL,
  `description` text DEFAULT NULL,
  `template_html` text DEFAULT NULL,
  `template_css` text DEFAULT NULL,
  `is_default` tinyint(1) DEFAULT 0,
  `status` enum('Active','Inactive') DEFAULT 'Active',
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sd_leave_approvals`
--

CREATE TABLE `sd_leave_approvals` (
  `ID` int(11) NOT NULL,
  `sd_leave_requests_id` int(11) NOT NULL,
  `approver_id` int(11) NOT NULL,
  `action` enum('Approved','Rejected') NOT NULL,
  `comments` text DEFAULT NULL,
  `action_date` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sd_leave_balances`
--

CREATE TABLE `sd_leave_balances` (
  `ID` int(11) NOT NULL,
  `sd_employees_id` int(11) NOT NULL,
  `sd_leave_types_id` int(11) NOT NULL,
  `acc_type` varchar(10) NOT NULL COMMENT 'CREDIT/DEBIT',
  `used_leaves` int(11) NOT NULL DEFAULT 0,
  `remaining_leaves` int(11) NOT NULL,
  `created_time` timestamp NULL DEFAULT current_timestamp(),
  `last_modified_time` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sd_leave_requests`
--

CREATE TABLE `sd_leave_requests` (
  `ID` int(11) NOT NULL,
  `sd_employees_id` int(11) NOT NULL,
  `sd_leave_types_id` int(11) NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `reason` text NOT NULL,
  `status` int(11) NOT NULL DEFAULT 1,
  `created_time` timestamp NULL DEFAULT current_timestamp(),
  `submitted_at` timestamp NULL DEFAULT current_timestamp(),
  `approved_at` timestamp NULL DEFAULT NULL,
  `approver_id` int(11) DEFAULT NULL,
  `approved_remarks` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sd_leave_transactions`
--

CREATE TABLE `sd_leave_transactions` (
  `ID` int(11) NOT NULL,
  `sd_employees_id` int(11) NOT NULL,
  `sd_leave_types_id` int(11) NOT NULL,
  `transaction_id` int(11) NOT NULL DEFAULT 0,
  `transaction_date` date NOT NULL,
  `transaction_type` varchar(10) NOT NULL,
  `leave_taken` float DEFAULT 0,
  `leave_added` float DEFAULT 0,
  `remarks` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sd_leave_types`
--

CREATE TABLE `sd_leave_types` (
  `ID` int(11) NOT NULL,
  `type_name` varchar(255) NOT NULL,
  `short_name` varchar(3) DEFAULT NULL,
  `max_days` int(11) NOT NULL,
  `carry_forward` int(11) NOT NULL DEFAULT 0,
  `leave_accumulation` int(11) NOT NULL DEFAULT 4,
  `max_days_occasion` int(11) NOT NULL DEFAULT 0,
  `max_days_month` int(11) NOT NULL DEFAULT 0,
  `created_time` timestamp NULL DEFAULT current_timestamp(),
  `earned_leave` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sd_mt_role`
--

CREATE TABLE `sd_mt_role` (
  `ID` int(11) NOT NULL,
  `role_name` varchar(100) NOT NULL,
  `is_fixed` int(11) NOT NULL DEFAULT 0,
  `created_time` datetime DEFAULT NULL,
  `created_by` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sd_mt_userdb`
--

CREATE TABLE `sd_mt_userdb` (
  `ID` int(11) NOT NULL,
  `ename` varchar(100) NOT NULL,
  `euserid` varchar(100) DEFAULT NULL,
  `epassword` varchar(256) NOT NULL,
  `emailid` varchar(100) DEFAULT NULL,
  `mobile_no` varchar(10) DEFAULT NULL,
  `designation` varchar(250) DEFAULT NULL,
  `profile_img` longtext DEFAULT NULL,
  `last_login_time` datetime DEFAULT NULL,
  `last_login_ip` varchar(50) DEFAULT NULL,
  `last_reset_time` datetime DEFAULT NULL,
  `change_pass` int(11) DEFAULT 0,
  `created_time` datetime DEFAULT NULL,
  `created_by` varchar(100) DEFAULT NULL,
  `active_status` int(11) NOT NULL DEFAULT 0,
  `failed_attempts` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sd_mt_user_otp`
--

CREATE TABLE `sd_mt_user_otp` (
  `ID` int(11) NOT NULL,
  `otp_type` enum('EMAIL','MOBILE') NOT NULL,
  `country_code` varchar(5) NOT NULL DEFAULT '0',
  `mobile_no` varchar(50) DEFAULT NULL,
  `email_id` varchar(255) DEFAULT NULL,
  `otp_code_hash` varchar(255) NOT NULL,
  `otp_created_time` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf16 COLLATE=utf16_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sd_mt_user_role`
--

CREATE TABLE `sd_mt_user_role` (
  `ID` int(11) NOT NULL,
  `sd_mt_userdb_id` int(11) NOT NULL,
  `sd_mt_role_id` int(11) NOT NULL,
  `created_time` datetime DEFAULT NULL,
  `created_by` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sd_office_locations`
--

CREATE TABLE `sd_office_locations` (
  `ID` int(11) NOT NULL,
  `location_name` varchar(255) NOT NULL,
  `location_address` text NOT NULL,
  `latitude` varchar(255) DEFAULT NULL,
  `longitude` varchar(255) DEFAULT NULL,
  `office_start_time` time DEFAULT NULL,
  `office_end_time` time DEFAULT NULL,
  `created_by` int(11) NOT NULL DEFAULT 0,
  `created_time` timestamp NOT NULL DEFAULT current_timestamp(),
  `last_modified_time` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sd_projects`
--

CREATE TABLE `sd_projects` (
  `ID` int(11) NOT NULL,
  `project_name` varchar(1000) NOT NULL,
  `sd_employees_id` int(11) NOT NULL,
  `created_by` int(11) NOT NULL,
  `last_modified_time` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sd_project_team`
--

CREATE TABLE `sd_project_team` (
  `ID` int(11) NOT NULL,
  `sd_projects_id` int(11) NOT NULL,
  `sd_employees_id` int(11) NOT NULL,
  `last_modified_time` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sd_salary_components`
--

CREATE TABLE `sd_salary_components` (
  `ID` int(11) NOT NULL,
  `component_name` varchar(50) NOT NULL,
  `short_name` varchar(10) NOT NULL,
  `component_type` varchar(11) NOT NULL DEFAULT '1',
  `calculation_type` enum('fixed','percentage') NOT NULL,
  `default_amount` decimal(10,2) NOT NULL,
  `created_by` int(11) DEFAULT 0,
  `created_time` timestamp NULL DEFAULT current_timestamp(),
  `last_modified_by` int(11) DEFAULT 0,
  `last_modified_time` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `order_no` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sd_salary_reports`
--

CREATE TABLE `sd_salary_reports` (
  `ID` int(11) NOT NULL,
  `month` int(11) NOT NULL,
  `year` int(11) NOT NULL,
  `status` int(11) NOT NULL DEFAULT 5,
  `created_by` int(11) NOT NULL,
  `created_time` timestamp NOT NULL DEFAULT current_timestamp(),
  `last_modified_time` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sd_salary_slips`
--

CREATE TABLE `sd_salary_slips` (
  `ID` int(11) NOT NULL,
  `sd_salary_reports_id` int(11) NOT NULL,
  `sd_employees_id` int(11) NOT NULL,
  `basic_salary` decimal(10,2) NOT NULL,
  `allowances` float NOT NULL DEFAULT 0,
  `bill_amount` float NOT NULL DEFAULT 0,
  `total_salary` decimal(10,2) NOT NULL,
  `total_deductions` decimal(10,2) NOT NULL,
  `net_salary` decimal(10,2) NOT NULL,
  `total_company` float NOT NULL DEFAULT 0,
  `total_ctc` float NOT NULL DEFAULT 0,
  `status` enum('Pending','Paid') DEFAULT 'Pending',
  `created_time` timestamp NOT NULL DEFAULT current_timestamp(),
  `last_modified_time` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `sd_designations_id` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sd_salary_slips_sub`
--

CREATE TABLE `sd_salary_slips_sub` (
  `ID` int(11) NOT NULL,
  `sd_salary_slips_id` int(11) NOT NULL,
  `sd_salary_components_id` int(11) NOT NULL,
  `basic_percentage` decimal(5,2) DEFAULT NULL,
  `amount` decimal(10,2) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `component_type` varchar(255) DEFAULT NULL,
  `component_name` varchar(255) DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT 1 COMMENT '1=Auto,2=Manual, 3= Cancel',
  `base_amount` float(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sd_site_settings`
--

CREATE TABLE `sd_site_settings` (
  `ID` int(3) NOT NULL,
  `setting_name` varchar(50) NOT NULL,
  `setting_value` longtext NOT NULL,
  `created_by` varchar(50) NOT NULL,
  `last_modified_time` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sd_state_db`
--

CREATE TABLE `sd_state_db` (
  `ID` int(11) NOT NULL,
  `state_id` int(11) NOT NULL,
  `short_name` varchar(4) NOT NULL,
  `state_name` varchar(55) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sd_vendors`
--

CREATE TABLE `sd_vendors` (
  `ID` int(11) NOT NULL,
  `sd_hub_id` int(11) NOT NULL,
  `vendor_code` varchar(255) NOT NULL,
  `vendor_company` varchar(255) NOT NULL,
  `vendor_name` varchar(255) DEFAULT NULL,
  `billing_to` varchar(255) DEFAULT NULL,
  `gst_no` varchar(255) DEFAULT NULL,
  `pan_no` varchar(255) DEFAULT NULL,
  `address_one` text DEFAULT NULL,
  `address_two` text DEFAULT NULL,
  `state_name` varchar(255) DEFAULT NULL,
  `pin_code` varchar(15) DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT 0,
  `created_by` int(11) NOT NULL DEFAULT 0,
  `created_time` datetime NOT NULL,
  `last_modified_by` int(11) NOT NULL DEFAULT 0,
  `last_modified_time` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `sd_admin_api`
--
ALTER TABLE `sd_admin_api`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `sd_admin_assets`
--
ALTER TABLE `sd_admin_assets`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `sd_admin_banks`
--
ALTER TABLE `sd_admin_banks`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `sd_admin_calander_dates`
--
ALTER TABLE `sd_admin_calander_dates`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `sd_admin_const`
--
ALTER TABLE `sd_admin_const`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `sd_admin_employees_types`
--
ALTER TABLE `sd_admin_employees_types`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `sd_admin_mail`
--
ALTER TABLE `sd_admin_mail`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `sd_admin_menu`
--
ALTER TABLE `sd_admin_menu`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `sd_admin_modules`
--
ALTER TABLE `sd_admin_modules`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `sd_admin_module_permissions`
--
ALTER TABLE `sd_admin_module_permissions`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `module_id` (`module_id`,`action`);

--
-- Indexes for table `sd_admin_role_permissions`
--
ALTER TABLE `sd_admin_role_permissions`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `role_id` (`role_id`,`permission_id`);

--
-- Indexes for table `sd_admin_tax_configurations`
--
ALTER TABLE `sd_admin_tax_configurations`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `idx_tax_code` (`tax_code`),
  ADD KEY `idx_country_state` (`country_code`,`state_code`),
  ADD KEY `idx_effective_dates` (`effective_from`,`effective_to`);

--
-- Indexes for table `sd_advance`
--
ALTER TABLE `sd_advance`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `sd_attendance`
--
ALTER TABLE `sd_attendance`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `sd_employees_id` (`sd_employees_id`);

--
-- Indexes for table `sd_bill_claims`
--
ALTER TABLE `sd_bill_claims`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `sd_bill_claims_items`
--
ALTER TABLE `sd_bill_claims_items`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `sd_circulars`
--
ALTER TABLE `sd_circulars`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `sd_customer`
--
ALTER TABLE `sd_customer`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `sd_customer_address`
--
ALTER TABLE `sd_customer_address`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `sd_customer_hsn`
--
ALTER TABLE `sd_customer_hsn`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `sd_designations`
--
ALTER TABLE `sd_designations`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `designation_name` (`designation_name`);

--
-- Indexes for table `sd_doc_check_list`
--
ALTER TABLE `sd_doc_check_list`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `sd_employees`
--
ALTER TABLE `sd_employees`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `email` (`email`),
  ADD KEY `sd_designations_id` (`sd_designations_id`),
  ADD KEY `emp_type` (`emp_type`),
  ADD KEY `employee_id` (`employee_id`);

--
-- Indexes for table `sd_employees_locations`
--
ALTER TABLE `sd_employees_locations`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `sd_employee_assets`
--
ALTER TABLE `sd_employee_assets`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `sd_employees_id` (`sd_employees_id`),
  ADD KEY `sd_admin_assets_id` (`sd_admin_assets_id`);

--
-- Indexes for table `sd_employee_bank`
--
ALTER TABLE `sd_employee_bank`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `sd_employee_doc`
--
ALTER TABLE `sd_employee_doc`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `sd_employee_leave`
--
ALTER TABLE `sd_employee_leave`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `sd_employees_id` (`sd_employees_id`),
  ADD KEY `sd_salary_components_id` (`sd_leave_types_id`);

--
-- Indexes for table `sd_employee_salary`
--
ALTER TABLE `sd_employee_salary`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `sd_employees_id` (`sd_employees_id`),
  ADD KEY `sd_salary_components_id` (`sd_salary_components_id`);

--
-- Indexes for table `sd_gallery`
--
ALTER TABLE `sd_gallery`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `sd_gallery_items`
--
ALTER TABLE `sd_gallery_items`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `sd_holidays`
--
ALTER TABLE `sd_holidays`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `sd_import`
--
ALTER TABLE `sd_import`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `sd_invoices`
--
ALTER TABLE `sd_invoices`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `invoice_number` (`invoice_number`),
  ADD KEY `invoice_series_id` (`invoice_series_id`),
  ADD KEY `template_id` (`template_id`),
  ADD KEY `idx_invoice_number` (`invoice_number`),
  ADD KEY `idx_vednor_id` (`sd_vendors_id`),
  ADD KEY `idx_invoice_date` (`invoice_date`),
  ADD KEY `idx_due_date` (`due_date`),
  ADD KEY `idx_status` (`status`),
  ADD KEY `idx_payment_status` (`payment_status`),
  ADD KEY `idx_recurring` (`is_recurring`),
  ADD KEY `idx_parent_invoice` (`parent_invoice_id`);

--
-- Indexes for table `sd_invoice_items`
--
ALTER TABLE `sd_invoice_items`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `idx_invoice_id` (`sd_invoices_id`),
  ADD KEY `idx_item_code` (`item_code`),
  ADD KEY `idx_category` (`category`);

--
-- Indexes for table `sd_invoice_series`
--
ALTER TABLE `sd_invoice_series`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `sd_invoice_templates`
--
ALTER TABLE `sd_invoice_templates`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `template_code` (`template_code`);

--
-- Indexes for table `sd_leave_approvals`
--
ALTER TABLE `sd_leave_approvals`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `sd_leave_requests_id` (`sd_leave_requests_id`),
  ADD KEY `approver_id` (`approver_id`);

--
-- Indexes for table `sd_leave_balances`
--
ALTER TABLE `sd_leave_balances`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `sd_employees_id` (`sd_employees_id`),
  ADD KEY `sd_leave_types_id` (`sd_leave_types_id`);

--
-- Indexes for table `sd_leave_requests`
--
ALTER TABLE `sd_leave_requests`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `sd_employees_id` (`sd_employees_id`),
  ADD KEY `sd_leave_types_id` (`sd_leave_types_id`),
  ADD KEY `approver_id` (`approver_id`);

--
-- Indexes for table `sd_leave_transactions`
--
ALTER TABLE `sd_leave_transactions`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `sd_leave_types`
--
ALTER TABLE `sd_leave_types`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `type_name` (`type_name`);

--
-- Indexes for table `sd_mt_role`
--
ALTER TABLE `sd_mt_role`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `sd_mt_userdb`
--
ALTER TABLE `sd_mt_userdb`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `sd_mt_user_otp`
--
ALTER TABLE `sd_mt_user_otp`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `sd_mt_user_role`
--
ALTER TABLE `sd_mt_user_role`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `sd_office_locations`
--
ALTER TABLE `sd_office_locations`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `sd_projects`
--
ALTER TABLE `sd_projects`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `sd_project_team`
--
ALTER TABLE `sd_project_team`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `sd_salary_components`
--
ALTER TABLE `sd_salary_components`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `component_name` (`component_name`);

--
-- Indexes for table `sd_salary_reports`
--
ALTER TABLE `sd_salary_reports`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `month` (`month`,`year`);

--
-- Indexes for table `sd_salary_slips`
--
ALTER TABLE `sd_salary_slips`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `sd_salary_reports_id` (`sd_salary_reports_id`);

--
-- Indexes for table `sd_salary_slips_sub`
--
ALTER TABLE `sd_salary_slips_sub`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `sd_salary_slips_id` (`sd_salary_slips_id`);

--
-- Indexes for table `sd_site_settings`
--
ALTER TABLE `sd_site_settings`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `sd_state_db`
--
ALTER TABLE `sd_state_db`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `sd_vendors`
--
ALTER TABLE `sd_vendors`
  ADD PRIMARY KEY (`ID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `sd_admin_api`
--
ALTER TABLE `sd_admin_api`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sd_admin_assets`
--
ALTER TABLE `sd_admin_assets`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sd_admin_banks`
--
ALTER TABLE `sd_admin_banks`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sd_admin_calander_dates`
--
ALTER TABLE `sd_admin_calander_dates`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sd_admin_const`
--
ALTER TABLE `sd_admin_const`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sd_admin_employees_types`
--
ALTER TABLE `sd_admin_employees_types`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sd_admin_mail`
--
ALTER TABLE `sd_admin_mail`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sd_admin_menu`
--
ALTER TABLE `sd_admin_menu`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sd_admin_modules`
--
ALTER TABLE `sd_admin_modules`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sd_admin_module_permissions`
--
ALTER TABLE `sd_admin_module_permissions`
  MODIFY `ID` int(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sd_admin_role_permissions`
--
ALTER TABLE `sd_admin_role_permissions`
  MODIFY `ID` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sd_admin_tax_configurations`
--
ALTER TABLE `sd_admin_tax_configurations`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sd_advance`
--
ALTER TABLE `sd_advance`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sd_attendance`
--
ALTER TABLE `sd_attendance`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sd_bill_claims`
--
ALTER TABLE `sd_bill_claims`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sd_bill_claims_items`
--
ALTER TABLE `sd_bill_claims_items`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sd_circulars`
--
ALTER TABLE `sd_circulars`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sd_customer`
--
ALTER TABLE `sd_customer`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sd_customer_address`
--
ALTER TABLE `sd_customer_address`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sd_customer_hsn`
--
ALTER TABLE `sd_customer_hsn`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sd_designations`
--
ALTER TABLE `sd_designations`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sd_doc_check_list`
--
ALTER TABLE `sd_doc_check_list`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sd_employees`
--
ALTER TABLE `sd_employees`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sd_employees_locations`
--
ALTER TABLE `sd_employees_locations`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sd_employee_assets`
--
ALTER TABLE `sd_employee_assets`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sd_employee_bank`
--
ALTER TABLE `sd_employee_bank`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sd_employee_doc`
--
ALTER TABLE `sd_employee_doc`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sd_employee_leave`
--
ALTER TABLE `sd_employee_leave`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sd_employee_salary`
--
ALTER TABLE `sd_employee_salary`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sd_gallery`
--
ALTER TABLE `sd_gallery`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sd_gallery_items`
--
ALTER TABLE `sd_gallery_items`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sd_holidays`
--
ALTER TABLE `sd_holidays`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sd_import`
--
ALTER TABLE `sd_import`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sd_invoices`
--
ALTER TABLE `sd_invoices`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sd_invoice_items`
--
ALTER TABLE `sd_invoice_items`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sd_invoice_series`
--
ALTER TABLE `sd_invoice_series`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sd_invoice_templates`
--
ALTER TABLE `sd_invoice_templates`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sd_leave_approvals`
--
ALTER TABLE `sd_leave_approvals`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sd_leave_balances`
--
ALTER TABLE `sd_leave_balances`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sd_leave_requests`
--
ALTER TABLE `sd_leave_requests`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sd_leave_transactions`
--
ALTER TABLE `sd_leave_transactions`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sd_leave_types`
--
ALTER TABLE `sd_leave_types`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sd_mt_role`
--
ALTER TABLE `sd_mt_role`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sd_mt_userdb`
--
ALTER TABLE `sd_mt_userdb`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sd_mt_user_otp`
--
ALTER TABLE `sd_mt_user_otp`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sd_mt_user_role`
--
ALTER TABLE `sd_mt_user_role`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sd_office_locations`
--
ALTER TABLE `sd_office_locations`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sd_projects`
--
ALTER TABLE `sd_projects`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sd_project_team`
--
ALTER TABLE `sd_project_team`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sd_salary_components`
--
ALTER TABLE `sd_salary_components`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sd_salary_reports`
--
ALTER TABLE `sd_salary_reports`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sd_salary_slips`
--
ALTER TABLE `sd_salary_slips`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sd_salary_slips_sub`
--
ALTER TABLE `sd_salary_slips_sub`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sd_site_settings`
--
ALTER TABLE `sd_site_settings`
  MODIFY `ID` int(3) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sd_state_db`
--
ALTER TABLE `sd_state_db`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sd_vendors`
--
ALTER TABLE `sd_vendors`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `sd_admin_module_permissions`
--
ALTER TABLE `sd_admin_module_permissions`
  ADD CONSTRAINT `sd_admin_module_permissions_ibfk_1` FOREIGN KEY (`module_id`) REFERENCES `sd_admin_modules` (`ID`) ON DELETE CASCADE;

--
-- Constraints for table `sd_invoices`
--
ALTER TABLE `sd_invoices`
  ADD CONSTRAINT `sd_invoices_ibfk_1` FOREIGN KEY (`invoice_series_id`) REFERENCES `sd_invoice_series` (`ID`),
  ADD CONSTRAINT `sd_invoices_ibfk_2` FOREIGN KEY (`template_id`) REFERENCES `sd_invoice_templates` (`ID`),
  ADD CONSTRAINT `sd_invoices_ibfk_3` FOREIGN KEY (`parent_invoice_id`) REFERENCES `sd_invoices` (`ID`);

--
-- Constraints for table `sd_invoice_items`
--
ALTER TABLE `sd_invoice_items`
  ADD CONSTRAINT `sd_invoice_items_ibfk_1` FOREIGN KEY (`sd_invoices_id`) REFERENCES `sd_invoices` (`ID`) ON DELETE CASCADE;

--
-- Constraints for table `sd_salary_slips`
--
ALTER TABLE `sd_salary_slips`
  ADD CONSTRAINT `sd_salary_slips_ibfk_1` FOREIGN KEY (`sd_salary_reports_id`) REFERENCES `sd_salary_reports` (`ID`);

--
-- Constraints for table `sd_salary_slips_sub`
--
ALTER TABLE `sd_salary_slips_sub`
  ADD CONSTRAINT `sd_salary_slips_sub_ibfk_1` FOREIGN KEY (`sd_salary_slips_id`) REFERENCES `sd_salary_slips` (`ID`);
--
-- Database: `sds_igcdoc`
--
CREATE DATABASE IF NOT EXISTS `sds_igcdoc` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_uca1400_ai_ci;
USE `sds_igcdoc`;

-- --------------------------------------------------------

--
-- Table structure for table `sd_acv_shutdown`
--

CREATE TABLE `sd_acv_shutdown` (
  `ID` int(11) NOT NULL,
  `from_date` date DEFAULT NULL,
  `to_date` date DEFAULT NULL,
  `from_time` time NOT NULL,
  `to_time` time NOT NULL,
  `description` text DEFAULT NULL,
  `location` text DEFAULT NULL,
  `sd_mt_userdb_id` int(100) NOT NULL,
  `admin_id` int(11) DEFAULT 0,
  `admin_time` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `admin_remarks` varchar(255) DEFAULT NULL,
  `created_time` datetime(6) NOT NULL,
  `status` int(11) NOT NULL DEFAULT 5 COMMENT '5=waiting,10=approved,4=rejected',
  `last_modified_by` varchar(255) DEFAULT NULL,
  `last_modified_remarks` text DEFAULT NULL,
  `last_modified_time` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `hos_id` int(11) DEFAULT NULL,
  `hos_remarks` text DEFAULT NULL,
  `hos_time` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `hod_id` int(11) DEFAULT NULL,
  `hod_remarks` text DEFAULT NULL,
  `hod_time` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sd_ac_ventilation_complaint`
--

CREATE TABLE `sd_ac_ventilation_complaint` (
  `ID` int(11) NOT NULL,
  `title` varchar(1000) NOT NULL,
  `description` text DEFAULT NULL,
  `location` text NOT NULL,
  `sd_mt_userdb_id` int(100) NOT NULL,
  `app_id` int(11) NOT NULL DEFAULT 0,
  `app_time` datetime NOT NULL DEFAULT current_timestamp(),
  `app_remarks` varchar(255) DEFAULT NULL,
  `admin_id` int(11) NOT NULL DEFAULT 0,
  `admin_time` datetime NOT NULL DEFAULT current_timestamp(),
  `admin_remarks` varchar(255) DEFAULT NULL,
  `created_time` datetime NOT NULL,
  `status` int(11) NOT NULL DEFAULT 5,
  `last_modified_by` varchar(255) DEFAULT NULL,
  `last_modified_time` timestamp NOT NULL DEFAULT current_timestamp(),
  `last_modified_remarks` text DEFAULT NULL,
  `date_of_closure` date DEFAULT NULL,
  `supervisor_description` longtext DEFAULT NULL,
  `supervisor` int(11) DEFAULT NULL,
  `supervisor_time` datetime DEFAULT NULL,
  `authority_type` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sd_admin_menu`
--

CREATE TABLE `sd_admin_menu` (
  `ID` int(11) NOT NULL,
  `label` varchar(50) NOT NULL,
  `icon` varchar(50) NOT NULL,
  `link` varchar(150) NOT NULL,
  `roles` varchar(255) NOT NULL,
  `order_number` int(11) NOT NULL DEFAULT 0,
  `parent_id` int(11) NOT NULL DEFAULT 0,
  `created_by` int(11) NOT NULL,
  `last_modified_time` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `sd_admin_modules_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sd_admin_modules`
--

CREATE TABLE `sd_admin_modules` (
  `ID` int(11) NOT NULL,
  `module_name` varchar(255) NOT NULL,
  `status` int(11) NOT NULL DEFAULT 5
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sd_admin_module_permissions`
--

CREATE TABLE `sd_admin_module_permissions` (
  `ID` int(20) UNSIGNED NOT NULL,
  `module_id` int(11) DEFAULT NULL,
  `action` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sd_admin_role_permissions`
--

CREATE TABLE `sd_admin_role_permissions` (
  `ID` bigint(20) UNSIGNED NOT NULL,
  `role_id` int(11) DEFAULT NULL,
  `permission_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sd_awards`
--

CREATE TABLE `sd_awards` (
  `ID` int(5) NOT NULL,
  `title` varchar(255) NOT NULL,
  `img_loc` longtext DEFAULT NULL,
  `award_date` date NOT NULL,
  `created_by` int(5) NOT NULL,
  `created_time` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sd_complaints`
--

CREATE TABLE `sd_complaints` (
  `ID` int(11) NOT NULL,
  `type` varchar(255) NOT NULL,
  `title` varchar(1000) NOT NULL,
  `description` text DEFAULT NULL,
  `location` text NOT NULL,
  `sd_mt_userdb_id` int(100) NOT NULL,
  `app_id` int(11) NOT NULL DEFAULT 0,
  `app_time` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `app_remarks` varchar(255) DEFAULT NULL,
  `admin_id` int(11) DEFAULT 0,
  `admin_time` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `admin_remarks` varchar(255) DEFAULT NULL,
  `created_time` datetime(6) NOT NULL,
  `status` int(11) NOT NULL DEFAULT 5 COMMENT '5=waiting,10=approved,4=rejected',
  `last_modified_by` varchar(255) DEFAULT NULL,
  `last_modified_remarks` text DEFAULT NULL,
  `last_modified_time` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `date_of_closure` date DEFAULT NULL,
  `supervisor_description` longtext DEFAULT NULL,
  `supervisor` int(11) DEFAULT NULL,
  `supervisor_time` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sd_complaint_types`
--

CREATE TABLE `sd_complaint_types` (
  `ID` int(11) NOT NULL,
  `complaint_type` varchar(250) NOT NULL,
  `complaint_admin` int(10) NOT NULL,
  `created_time` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sd_doc_authors`
--

CREATE TABLE `sd_doc_authors` (
  `ID` int(11) NOT NULL,
  `doc_id` int(11) NOT NULL,
  `author_id` int(10) NOT NULL,
  `created_time` datetime NOT NULL,
  `created_by` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sd_doc_category`
--

CREATE TABLE `sd_doc_category` (
  `ID` int(11) NOT NULL,
  `doc_type` varchar(255) NOT NULL,
  `doc_category` varchar(20) NOT NULL,
  `show_chart` int(2) NOT NULL COMMENT '1= Yes',
  `created_time` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sd_doc_list`
--

CREATE TABLE `sd_doc_list` (
  `ID` int(11) NOT NULL,
  `doc_title` varchar(1000) NOT NULL,
  `doc_type` int(11) NOT NULL,
  `doc_main_cat` varchar(250) DEFAULT NULL,
  `doc_loc` varchar(255) DEFAULT NULL,
  `wo_no` varchar(255) DEFAULT NULL,
  `wo_value` varchar(255) DEFAULT NULL,
  `wo_name` varchar(255) DEFAULT NULL,
  `wo_type` varchar(255) DEFAULT NULL,
  `wo_start_from` date DEFAULT NULL,
  `wo_start_to` date DEFAULT NULL,
  `contractor_name` varchar(255) DEFAULT NULL,
  `work_type` varchar(255) DEFAULT NULL,
  `doc_status` int(11) NOT NULL DEFAULT 5,
  `app_id` int(11) NOT NULL,
  `app_time` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `app_remarks` varchar(250) DEFAULT NULL,
  `admin_id` int(11) NOT NULL DEFAULT 0,
  `admin_time` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `admin_remarks` varchar(250) DEFAULT NULL,
  `created_by` int(11) NOT NULL,
  `created_time` datetime NOT NULL,
  `updated_by` varchar(255) DEFAULT NULL,
  `last_modified_time` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `entering_keyword` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sd_doc_list_permission`
--

CREATE TABLE `sd_doc_list_permission` (
  `ID` int(11) NOT NULL,
  `sd_doc_list_id` int(11) NOT NULL,
  `permission_type` int(11) NOT NULL COMMENT 'VIEW/DOWNLOAD',
  `type` int(11) NOT NULL COMMENT 'USER/ROLE',
  `sd_mt_userdb_id` int(11) DEFAULT NULL,
  `sd_mt_role_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sd_electrical`
--

CREATE TABLE `sd_electrical` (
  `ID` int(11) NOT NULL,
  `title` varchar(1000) NOT NULL,
  `description` text DEFAULT NULL,
  `location` text NOT NULL,
  `sd_mt_userdb_id` int(100) NOT NULL,
  `app_id` int(11) NOT NULL DEFAULT 0,
  `app_time` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `app_remarks` varchar(255) DEFAULT NULL,
  `admin_id` int(11) DEFAULT 0,
  `admin_time` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `admin_remarks` varchar(255) DEFAULT NULL,
  `created_time` datetime(6) NOT NULL,
  `status` int(11) NOT NULL DEFAULT 5 COMMENT '5=waiting,10=approved,4=rejected',
  `last_modified_by` varchar(255) DEFAULT NULL,
  `last_modified_remarks` text DEFAULT NULL,
  `last_modified_time` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `date_of_closure` date DEFAULT NULL,
  `supervisor_description` longtext DEFAULT NULL,
  `supervisor` varchar(255) DEFAULT NULL,
  `supervisor_time` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sd_electrical_shutdown`
--

CREATE TABLE `sd_electrical_shutdown` (
  `ID` int(11) NOT NULL,
  `from_date` date DEFAULT NULL,
  `to_date` date DEFAULT NULL,
  `from_time` time NOT NULL,
  `to_time` time NOT NULL,
  `description` text DEFAULT NULL,
  `location` text DEFAULT NULL,
  `sd_mt_userdb_id` int(100) NOT NULL,
  `admin_id` int(11) DEFAULT 0,
  `admin_time` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `admin_remarks` varchar(255) DEFAULT NULL,
  `created_time` datetime(6) NOT NULL,
  `status` int(11) NOT NULL DEFAULT 5 COMMENT '5=waiting,10=approved,4=rejected',
  `last_modified_by` varchar(255) DEFAULT NULL,
  `last_modified_remarks` text DEFAULT NULL,
  `last_modified_time` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `hos_id` int(11) DEFAULT NULL,
  `hos_remarks` text DEFAULT NULL,
  `hos_time` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `hod_id` int(11) DEFAULT NULL,
  `hod_remarks` text DEFAULT NULL,
  `hod_time` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sd_forms`
--

CREATE TABLE `sd_forms` (
  `ID` int(3) NOT NULL,
  `form_name` varchar(1000) NOT NULL,
  `form_status` int(11) NOT NULL DEFAULT 0,
  `created_by` varchar(20) NOT NULL,
  `last_modified_time` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sd_gallery`
--

CREATE TABLE `sd_gallery` (
  `ID` int(5) NOT NULL,
  `event_name` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `img_loc` longtext DEFAULT NULL,
  `created_by` int(5) NOT NULL,
  `created_time` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sd_history`
--

CREATE TABLE `sd_history` (
  `ID` int(11) NOT NULL,
  `description` longtext NOT NULL,
  `file_loc` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sd_homeforms`
--

CREATE TABLE `sd_homeforms` (
  `ID` int(5) NOT NULL,
  `title` varchar(255) NOT NULL,
  `doc_loc` text DEFAULT NULL,
  `created_by` int(5) NOT NULL,
  `created_time` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sd_home_images`
--

CREATE TABLE `sd_home_images` (
  `ID` int(11) NOT NULL,
  `home_image` longtext DEFAULT NULL,
  `title` varchar(255) NOT NULL,
  `description` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sd_import`
--

CREATE TABLE `sd_import` (
  `ID` int(11) NOT NULL,
  `sd_import_type` varchar(20) NOT NULL,
  `sd_file` varchar(255) DEFAULT NULL,
  `sd_mt_userdb_id` int(11) NOT NULL,
  `last_modified_time` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sd_license`
--

CREATE TABLE `sd_license` (
  `ID` int(5) NOT NULL,
  `title` varchar(255) NOT NULL,
  `doc_loc` text DEFAULT NULL,
  `created_by` int(5) NOT NULL,
  `created_time` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sd_mbook_entry`
--

CREATE TABLE `sd_mbook_entry` (
  `ID` int(11) NOT NULL,
  `sd_mbook_issue_id` int(11) NOT NULL,
  `created_time` datetime DEFAULT NULL,
  `sd_mt_userdb_id` int(100) NOT NULL,
  `app_id` int(11) NOT NULL DEFAULT 0,
  `app_time` date NOT NULL DEFAULT current_timestamp(),
  `app_remarks` varchar(255) DEFAULT NULL,
  `admin_id` int(11) NOT NULL DEFAULT 0,
  `admin_time` datetime NOT NULL DEFAULT current_timestamp(),
  `admin_remarks` varchar(255) DEFAULT NULL,
  `last_modified_by` varchar(255) DEFAULT NULL,
  `last_modified_remarks` text DEFAULT NULL,
  `last_modified_time` timestamp NOT NULL DEFAULT current_timestamp(),
  `entry_status` int(11) NOT NULL DEFAULT 5 COMMENT '5=waiting,10=approved,4=rejected',
  `hos_id` int(11) DEFAULT NULL,
  `hos_remarks` text DEFAULT NULL,
  `hos_time` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `hod_id` int(11) DEFAULT NULL,
  `hod_remarks` text DEFAULT NULL,
  `hod_time` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `ad_id` int(11) DEFAULT NULL,
  `ad_remarks` text DEFAULT NULL,
  `ad_time` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `gd_id` int(11) DEFAULT NULL,
  `gd_remarks` text DEFAULT NULL,
  `gd_time` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `ra_number` varchar(255) DEFAULT NULL,
  `ra_amount` int(11) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `date_of_issue` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sd_mbook_issue`
--

CREATE TABLE `sd_mbook_issue` (
  `ID` int(11) NOT NULL,
  `mbook_number` varchar(100) NOT NULL,
  `date_of_issue` date NOT NULL,
  `title` varchar(1000) NOT NULL,
  `description` text DEFAULT NULL,
  `sd_mt_userdb_id` int(100) NOT NULL,
  `app_id` int(11) DEFAULT 0,
  `app_time` datetime DEFAULT current_timestamp(),
  `app_remarks` varchar(255) DEFAULT NULL,
  `admin_id` int(11) NOT NULL DEFAULT 0,
  `admin_time` datetime DEFAULT current_timestamp(),
  `admin_remarks` varchar(255) DEFAULT NULL,
  `created_time` datetime NOT NULL DEFAULT current_timestamp(),
  `status` int(11) NOT NULL DEFAULT 5 COMMENT '5=waiting,10=approved,4=rejected	',
  `last_modified_by` varchar(255) DEFAULT NULL,
  `last_modified_remarks` text DEFAULT NULL,
  `last_modified_time` timestamp NOT NULL DEFAULT current_timestamp(),
  `name_of_work` text DEFAULT NULL,
  `work_order_number` varchar(255) DEFAULT NULL,
  `date_of_work_order` date DEFAULT NULL,
  `work_order_value` varchar(255) DEFAULT NULL,
  `budget_type` varchar(255) DEFAULT NULL,
  `budget_pin` varchar(255) DEFAULT NULL,
  `period` varchar(255) DEFAULT NULL,
  `contact_name` varchar(255) DEFAULT NULL,
  `technical_sanction_number` varchar(255) DEFAULT NULL,
  `file_type` text DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `others` varchar(255) DEFAULT NULL,
  `doc_loc` text DEFAULT NULL,
  `cc_number` varchar(255) DEFAULT NULL,
  `pan_number` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `mobile_no` bigint(20) DEFAULT NULL,
  `wages_count` int(11) DEFAULT NULL,
  `salary_amount` int(11) DEFAULT NULL,
  `uploaded_file` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sd_mechanical`
--

CREATE TABLE `sd_mechanical` (
  `ID` int(11) NOT NULL,
  `title` varchar(1000) NOT NULL,
  `description` text DEFAULT NULL,
  `location` text NOT NULL,
  `sd_mt_userdb_id` int(100) NOT NULL,
  `app_id` int(11) NOT NULL DEFAULT 0,
  `app_time` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `app_remarks` varchar(255) DEFAULT NULL,
  `admin_id` int(11) NOT NULL DEFAULT 0,
  `admin_time` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `admin_remarks` varchar(255) DEFAULT NULL,
  `created_time` datetime(6) NOT NULL,
  `status` int(11) NOT NULL DEFAULT 5,
  `last_modified_by` varchar(255) DEFAULT NULL,
  `last_modified_remarks` text DEFAULT NULL,
  `last_modified_time` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sd_meetroom`
--

CREATE TABLE `sd_meetroom` (
  `ID` int(11) NOT NULL,
  `room_name` int(11) NOT NULL,
  `meet_purpose` text NOT NULL,
  `meet_date` date NOT NULL,
  `meet_start_time` time NOT NULL,
  `meet_end_time` time NOT NULL,
  `sd_mt_userdb_id` int(100) NOT NULL,
  `created_time` datetime(6) NOT NULL,
  `status` int(11) NOT NULL,
  `last_modified_by` int(11) DEFAULT NULL,
  `last_modified_remarks` text DEFAULT NULL,
  `last_modified_time` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sd_meet_proposal`
--

CREATE TABLE `sd_meet_proposal` (
  `ID` int(5) NOT NULL,
  `mom_type` varchar(50) DEFAULT NULL,
  `title` varchar(55) NOT NULL,
  `description` varchar(255) NOT NULL,
  `doc_loc` text DEFAULT NULL,
  `app_id` int(5) NOT NULL DEFAULT 0,
  `app_date` date DEFAULT NULL,
  `app_remarks` text DEFAULT NULL,
  `status` int(2) NOT NULL,
  `created_by` int(5) NOT NULL,
  `created_time` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sd_mom`
--

CREATE TABLE `sd_mom` (
  `ID` int(11) NOT NULL,
  `mom_type` varchar(250) NOT NULL,
  `meet_no` varchar(30) NOT NULL,
  `meet_desc` varchar(250) NOT NULL,
  `meet_date` datetime NOT NULL,
  `mom_file` varchar(255) DEFAULT NULL,
  `created_by` int(11) NOT NULL,
  `created_time` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sd_mom_types`
--

CREATE TABLE `sd_mom_types` (
  `ID` int(11) NOT NULL,
  `type` varchar(250) NOT NULL,
  `member_role_id` int(10) NOT NULL,
  `admin_role_id` int(10) NOT NULL,
  `mom_file` varchar(255) DEFAULT NULL,
  `created_time` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sd_mt_role`
--

CREATE TABLE `sd_mt_role` (
  `ID` int(11) NOT NULL,
  `role_name` varchar(100) NOT NULL,
  `created_time` datetime DEFAULT NULL,
  `created_by` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sd_mt_type`
--

CREATE TABLE `sd_mt_type` (
  `ID` int(11) NOT NULL,
  `type_name` varchar(255) NOT NULL,
  `type_value` varchar(1000) NOT NULL,
  `order_number` int(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sd_mt_userdb`
--

CREATE TABLE `sd_mt_userdb` (
  `ID` int(11) NOT NULL,
  `ename` varchar(100) NOT NULL,
  `euserid` varchar(100) NOT NULL,
  `epassword` varchar(256) NOT NULL,
  `emailid` varchar(100) DEFAULT NULL,
  `mobile_no` varchar(10) DEFAULT NULL,
  `designation` varchar(250) DEFAULT NULL,
  `profile_img` longblob NOT NULL,
  `sd_org_id` int(11) DEFAULT NULL,
  `intercome_number` varchar(10) NOT NULL,
  `last_login_time` datetime DEFAULT NULL,
  `last_login_ip` varchar(50) DEFAULT NULL,
  `last_reset_time` datetime DEFAULT NULL,
  `change_pass` int(11) DEFAULT 0,
  `created_time` datetime DEFAULT NULL,
  `created_by` varchar(100) DEFAULT NULL,
  `active_status` int(11) NOT NULL DEFAULT 0,
  `failed_attempts` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sd_mt_user_otp`
--

CREATE TABLE `sd_mt_user_otp` (
  `ID` bigint(20) NOT NULL,
  `sd_mt_userdb_id` int(11) NOT NULL DEFAULT 0,
  `mobile_no` varchar(15) DEFAULT NULL,
  `otp_code_hast` varchar(256) NOT NULL,
  `otp_created_time` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sd_mt_user_role`
--

CREATE TABLE `sd_mt_user_role` (
  `ID` int(11) NOT NULL,
  `sd_mt_userdb_id` int(11) NOT NULL,
  `sd_mt_role_id` int(11) NOT NULL,
  `created_time` datetime DEFAULT NULL,
  `created_by` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sd_network`
--

CREATE TABLE `sd_network` (
  `ID` int(11) NOT NULL,
  `title` varchar(1000) NOT NULL,
  `description` text DEFAULT NULL,
  `location` text NOT NULL,
  `sd_mt_userdb_id` int(100) NOT NULL,
  `app_id` int(11) NOT NULL DEFAULT 0,
  `app_time` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `app_remarks` varchar(255) DEFAULT NULL,
  `admin_id` int(11) NOT NULL DEFAULT 0,
  `admin_time` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `admin_remarks` varchar(255) DEFAULT NULL,
  `created_time` datetime(6) NOT NULL,
  `status` int(11) NOT NULL DEFAULT 5,
  `last_modified_by` varchar(255) DEFAULT NULL,
  `last_modified_remarks` text DEFAULT NULL,
  `last_modified_time` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `date_of_closure` date DEFAULT NULL,
  `supervisor_description` longtext DEFAULT NULL,
  `supervisor_time` datetime DEFAULT NULL,
  `supervisor` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sd_org`
--

CREATE TABLE `sd_org` (
  `ID` int(11) NOT NULL,
  `sd_org_name` varchar(50) NOT NULL,
  `sd_org_type_id` int(11) NOT NULL,
  `sd_org_id` int(11) DEFAULT NULL COMMENT 'Parent ID can be null if not assigned',
  `sd_org_short_label` varchar(250) NOT NULL,
  `sd_org_full_label` varchar(250) NOT NULL,
  `sd_mt_userdb_id` int(11) DEFAULT NULL COMMENT 'Assigned Employee',
  `created_by` int(11) NOT NULL COMMENT 'Logged in User',
  `created_time` datetime NOT NULL DEFAULT current_timestamp(),
  `last_modified_time` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sd_radiological_work`
--

CREATE TABLE `sd_radiological_work` (
  `ID` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `nature_of_work` varchar(255) DEFAULT NULL,
  `signature_medical_officer` varchar(255) DEFAULT NULL,
  `status` int(11) NOT NULL,
  `sd_mt_userdb_id` int(100) DEFAULT NULL,
  `created_time` datetime NOT NULL DEFAULT current_timestamp(),
  `last_modified_by` varchar(255) DEFAULT NULL,
  `last_modified_time` datetime NOT NULL DEFAULT current_timestamp(),
  `app_id` int(11) DEFAULT 0,
  `app_time` datetime DEFAULT current_timestamp(),
  `app_remarks` varchar(255) DEFAULT NULL,
  `admin_id` int(11) DEFAULT 0,
  `admin_time` datetime DEFAULT current_timestamp(),
  `last_modified_remarks` text DEFAULT NULL,
  `job_description` varchar(255) DEFAULT NULL,
  `rubber_instruction` text DEFAULT NULL,
  `cover_all` enum('Yes','No') DEFAULT NULL,
  `rubber_glove` enum('Yes','No') DEFAULT NULL,
  `dosimeter` enum('Yes','No') DEFAULT NULL,
  `complete_dress` enum('Yes','No') DEFAULT NULL,
  `surgical_gloves` enum('Yes','No') DEFAULT NULL,
  `respirator` enum('Yes','No') DEFAULT NULL,
  `over_shoes` enum('Yes','No') DEFAULT NULL,
  `dust_gas_mask` enum('Yes','No') DEFAULT NULL,
  `plastic_suit` enum('Yes','No') DEFAULT NULL,
  `change_of_clothes` enum('Yes','No') DEFAULT NULL,
  `air_activity` text DEFAULT NULL,
  `airline_breathing_apparatus` enum('Yes','No') DEFAULT NULL,
  `rubber_station` enum('Yes','No') DEFAULT NULL,
  `single_rubber_area` enum('Yes','No') DEFAULT NULL,
  `double_rubber_area` enum('Yes','No') DEFAULT NULL,
  `shower_after_work` enum('Yes','No') DEFAULT NULL,
  `admin_remarks` varchar(255) DEFAULT NULL,
  `lab_incharge_id` int(11) DEFAULT NULL,
  `lab_incharge_remarks` text DEFAULT NULL,
  `lab_incharge_time` datetime DEFAULT NULL,
  `hp_id` int(11) DEFAULT NULL,
  `hp_remarks` text DEFAULT NULL,
  `hp_time` datetime DEFAULT NULL,
  `rwp_no` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sd_radiological_work_sub`
--

CREATE TABLE `sd_radiological_work_sub` (
  `ID` int(11) NOT NULL,
  `sd_radiological_work_id` int(11) DEFAULT NULL,
  `name_of_personnel` varchar(255) DEFAULT NULL,
  `tld_no` varchar(100) DEFAULT NULL,
  `activity_nature` text DEFAULT NULL,
  `signature` varchar(255) DEFAULT NULL,
  `drd_no` varchar(1000) DEFAULT NULL,
  `planned_exposure` varchar(1000) DEFAULT NULL,
  `dose_as_per` varchar(1000) DEFAULT NULL,
  `created_time` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sd_rfid_card`
--

CREATE TABLE `sd_rfid_card` (
  `ID` int(11) NOT NULL,
  `from_date` date DEFAULT NULL,
  `to_date` date DEFAULT NULL,
  `nature_of_visitor` varchar(255) DEFAULT NULL,
  `igcar_entry_permit_no` varchar(255) DEFAULT NULL,
  `igcar_entry_date_of_validity` date DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `gender` varchar(255) DEFAULT NULL,
  `age` int(100) DEFAULT NULL,
  `area_of_visit` varchar(255) DEFAULT NULL,
  `intercom_no` int(100) DEFAULT NULL,
  `institute_address` varchar(255) DEFAULT NULL,
  `mobile_no` varchar(15) DEFAULT NULL,
  `rfid_req_number` varchar(1000) DEFAULT NULL,
  `sd_mt_userdb_id` int(100) NOT NULL,
  `created_time` datetime(6) DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT 5 COMMENT '5=waiting,10=approved,4=rejected	',
  `hos_id` int(11) NOT NULL DEFAULT 0,
  `hos_remarks` text DEFAULT NULL,
  `hos_time` datetime DEFAULT NULL,
  `hod_id` int(11) DEFAULT NULL,
  `hod_remarks` text DEFAULT NULL,
  `hod_time` datetime DEFAULT NULL,
  `supervisor` int(11) DEFAULT NULL,
  `supervisor_remarks` text DEFAULT NULL,
  `supervisor_time` datetime DEFAULT NULL,
  `card_no` varchar(255) DEFAULT NULL,
  `card_date` date DEFAULT NULL,
  `deposited_name` varchar(255) DEFAULT NULL,
  `deposited_date` date DEFAULT NULL,
  `last_modified_by` int(11) DEFAULT 0,
  `last_modified_time` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sd_shutdown`
--

CREATE TABLE `sd_shutdown` (
  `ID` int(11) NOT NULL,
  `from_date` date DEFAULT NULL,
  `to_date` date DEFAULT NULL,
  `from_time` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `to_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `description` text DEFAULT NULL,
  `location` text DEFAULT NULL,
  `sd_mt_userdb_id` int(100) NOT NULL,
  `admin_id` int(11) DEFAULT 0,
  `admin_time` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `admin_remarks` varchar(255) DEFAULT NULL,
  `created_time` datetime(6) NOT NULL,
  `status` int(11) NOT NULL DEFAULT 5 COMMENT '5=waiting,10=approved,4=rejected',
  `last_modified_by` varchar(255) DEFAULT NULL,
  `last_modified_remarks` text DEFAULT NULL,
  `last_modified_time` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sd_site_activities`
--

CREATE TABLE `sd_site_activities` (
  `ID` int(11) NOT NULL,
  `activity_title` varchar(150) NOT NULL,
  `activity_desc` varchar(1000) NOT NULL,
  `activity_image` longtext NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_time` datetime DEFAULT current_timestamp(),
  `last_modified_time` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sd_site_settings`
--

CREATE TABLE `sd_site_settings` (
  `ID` int(3) NOT NULL,
  `setting_name` varchar(50) NOT NULL,
  `setting_value` longtext NOT NULL,
  `created_by` varchar(20) NOT NULL,
  `last_modified_time` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sd_telephone`
--

CREATE TABLE `sd_telephone` (
  `ID` int(11) NOT NULL,
  `title` varchar(1000) NOT NULL,
  `description` text DEFAULT NULL,
  `telephone_number` text NOT NULL,
  `location` text NOT NULL,
  `sd_mt_userdb_id` int(100) NOT NULL,
  `app_id` int(11) NOT NULL DEFAULT 0,
  `app_time` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `app_remarks` varchar(255) DEFAULT NULL,
  `admin_id` int(11) NOT NULL DEFAULT 0,
  `admin_time` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `admin_remarks` varchar(255) DEFAULT NULL,
  `created_time` datetime(6) NOT NULL,
  `status` int(11) NOT NULL DEFAULT 5,
  `last_modified_by` varchar(255) DEFAULT NULL,
  `last_modified_remarks` text DEFAULT NULL,
  `last_modified_time` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `date_of_closure` date DEFAULT NULL,
  `supervisor_description` longtext DEFAULT NULL,
  `supervisor_time` datetime DEFAULT NULL,
  `supervisor` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sd_temporary_advance`
--

CREATE TABLE `sd_temporary_advance` (
  `ID` int(11) NOT NULL,
  `temporary_advance_number` varchar(1000) DEFAULT NULL,
  `raised_by` varchar(1000) DEFAULT NULL,
  `advance_amount` bigint(20) DEFAULT NULL,
  `settlement` varchar(1000) DEFAULT NULL,
  `balance` bigint(20) DEFAULT NULL,
  `applied_on_date` date DEFAULT NULL,
  `sanction_date` date DEFAULT NULL,
  `stock_reg_no` bigint(20) DEFAULT NULL,
  `physically_verified_by` varchar(10000) DEFAULT NULL,
  `title` varchar(1000) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `sd_mt_userdb_id` int(100) NOT NULL,
  `admin_id` int(11) NOT NULL DEFAULT 0,
  `status` int(11) NOT NULL DEFAULT 5 COMMENT '5=waiting,10=approved,4=rejected	',
  `created_time` datetime(6) NOT NULL,
  `last_modified_by` varchar(255) DEFAULT NULL,
  `last_modified_remarks` text DEFAULT NULL,
  `app_id` int(11) NOT NULL DEFAULT 0,
  `app_time` datetime NOT NULL DEFAULT current_timestamp(),
  `app_remarks` varchar(255) DEFAULT NULL,
  `admin_time` datetime NOT NULL DEFAULT current_timestamp(),
  `admin_remarks` varchar(255) DEFAULT NULL,
  `last_modified_time` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `hos_id` int(11) DEFAULT NULL,
  `hos_remarks` text DEFAULT NULL,
  `hos_time` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `hod_id` int(11) DEFAULT NULL,
  `hod_remarks` text DEFAULT NULL,
  `hod_time` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `ad_id` int(11) DEFAULT NULL,
  `ad_remarks` text DEFAULT NULL,
  `ad_time` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `gd_id` int(11) DEFAULT NULL,
  `gd_remarks` text DEFAULT NULL,
  `gd_time` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `supervisor` int(11) DEFAULT NULL,
  `supervisor_description` varchar(255) DEFAULT NULL,
  `supervisor_time` datetime DEFAULT NULL ON UPDATE current_timestamp(),
  `purchase_amount` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sd_workshop`
--

CREATE TABLE `sd_workshop` (
  `ID` int(11) NOT NULL,
  `name` text DEFAULT NULL,
  `description` text DEFAULT NULL,
  `location` text DEFAULT NULL,
  `sd_mt_userdb_id` int(100) NOT NULL,
  `admin_id` int(11) DEFAULT 0,
  `admin_time` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `admin_remarks` text DEFAULT NULL,
  `free_material` int(2) NOT NULL,
  `completion_date` date NOT NULL,
  `free_description` text DEFAULT NULL,
  `created_time` datetime(6) NOT NULL,
  `status` int(11) NOT NULL DEFAULT 5 COMMENT '5=waiting,10=approved,4=rejected',
  `last_modified_by` varchar(255) DEFAULT NULL,
  `last_modified_remarks` text DEFAULT NULL,
  `last_modified_time` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sd_work_permit`
--

CREATE TABLE `sd_work_permit` (
  `ID` int(11) NOT NULL,
  `permit_no` varchar(255) DEFAULT NULL,
  `system` varchar(255) DEFAULT NULL,
  `description_of_location` varchar(255) DEFAULT NULL,
  `team_involved` varchar(255) DEFAULT NULL,
  `shutdown_jobs` varchar(255) DEFAULT NULL,
  `ac_venitilation_type` varchar(255) DEFAULT NULL,
  `description_of_work` varchar(255) DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `necessary_disconnection` varchar(255) DEFAULT NULL,
  `isolation` varchar(255) DEFAULT NULL,
  `no_of_item` varchar(255) DEFAULT NULL,
  `health_physical_instructions` varchar(255) DEFAULT NULL,
  `industrial_safety_permit` varchar(255) DEFAULT NULL,
  `welding_cutting_permit` varchar(255) DEFAULT NULL,
  `supervisor` int(11) DEFAULT NULL,
  `sd_mt_userdb_id` int(100) NOT NULL,
  `admin_id` int(11) NOT NULL DEFAULT 0,
  `status` int(11) NOT NULL DEFAULT 5 COMMENT '	5=waiting,10=approved,4=rejected	',
  `created_time` datetime(6) DEFAULT NULL,
  `last_modified_by` varchar(255) DEFAULT NULL,
  `app_id` int(11) NOT NULL DEFAULT 0,
  `app_time` datetime NOT NULL DEFAULT current_timestamp(),
  `app_remarks` varchar(255) DEFAULT NULL,
  `admin_time` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `admin_remarks` varchar(255) DEFAULT NULL,
  `last_modified_time` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `supervisor_description` varchar(255) DEFAULT NULL,
  `supervisor_time` datetime DEFAULT NULL,
  `work_all_completed` varchar(255) DEFAULT NULL,
  `defect_rectified` varchar(255) DEFAULT NULL,
  `work_area_cleared` varchar(255) DEFAULT NULL,
  `tags_cleared` varchar(255) DEFAULT NULL,
  `protection_available` varchar(255) DEFAULT NULL,
  `operation_test` varchar(255) DEFAULT NULL,
  `system_return_normal` varchar(255) DEFAULT NULL,
  `comments` varchar(255) DEFAULT NULL,
  `details_work` varchar(255) DEFAULT NULL,
  `hos_remarks` varchar(255) DEFAULT NULL,
  `hos_id` int(11) DEFAULT NULL,
  `hos_time` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `site_visitors`
--

CREATE TABLE `site_visitors` (
  `id` int(11) NOT NULL,
  `ip_address` varchar(45) NOT NULL,
  `visit_date` date NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `sd_acv_shutdown`
--
ALTER TABLE `sd_acv_shutdown`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `sd_ac_ventilation_complaint`
--
ALTER TABLE `sd_ac_ventilation_complaint`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `sd_admin_menu`
--
ALTER TABLE `sd_admin_menu`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `sd_admin_modules`
--
ALTER TABLE `sd_admin_modules`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `sd_admin_module_permissions`
--
ALTER TABLE `sd_admin_module_permissions`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `module_id` (`module_id`,`action`);

--
-- Indexes for table `sd_admin_role_permissions`
--
ALTER TABLE `sd_admin_role_permissions`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `role_id` (`role_id`,`permission_id`);

--
-- Indexes for table `sd_awards`
--
ALTER TABLE `sd_awards`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `sd_complaints`
--
ALTER TABLE `sd_complaints`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `sd_complaint_types`
--
ALTER TABLE `sd_complaint_types`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `sd_doc_authors`
--
ALTER TABLE `sd_doc_authors`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `sd_doc_category`
--
ALTER TABLE `sd_doc_category`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `sd_doc_list`
--
ALTER TABLE `sd_doc_list`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `sd_doc_list_permission`
--
ALTER TABLE `sd_doc_list_permission`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `sd_electrical`
--
ALTER TABLE `sd_electrical`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `sd_electrical_shutdown`
--
ALTER TABLE `sd_electrical_shutdown`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `sd_forms`
--
ALTER TABLE `sd_forms`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `sd_gallery`
--
ALTER TABLE `sd_gallery`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `sd_history`
--
ALTER TABLE `sd_history`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `sd_homeforms`
--
ALTER TABLE `sd_homeforms`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `sd_home_images`
--
ALTER TABLE `sd_home_images`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `sd_import`
--
ALTER TABLE `sd_import`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `sd_license`
--
ALTER TABLE `sd_license`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `sd_mbook_entry`
--
ALTER TABLE `sd_mbook_entry`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `sd_mbook_issue`
--
ALTER TABLE `sd_mbook_issue`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `sd_mechanical`
--
ALTER TABLE `sd_mechanical`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `sd_meetroom`
--
ALTER TABLE `sd_meetroom`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `sd_meet_proposal`
--
ALTER TABLE `sd_meet_proposal`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `sd_mom`
--
ALTER TABLE `sd_mom`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `sd_mom_types`
--
ALTER TABLE `sd_mom_types`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `sd_mt_role`
--
ALTER TABLE `sd_mt_role`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `sd_mt_type`
--
ALTER TABLE `sd_mt_type`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `sd_mt_userdb`
--
ALTER TABLE `sd_mt_userdb`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `sd_mt_user_otp`
--
ALTER TABLE `sd_mt_user_otp`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `sd_mt_user_role`
--
ALTER TABLE `sd_mt_user_role`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `sd_network`
--
ALTER TABLE `sd_network`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `sd_org`
--
ALTER TABLE `sd_org`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `sd_radiological_work`
--
ALTER TABLE `sd_radiological_work`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `sd_radiological_work_sub`
--
ALTER TABLE `sd_radiological_work_sub`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `sd_rfid_card`
--
ALTER TABLE `sd_rfid_card`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `sd_shutdown`
--
ALTER TABLE `sd_shutdown`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `sd_site_activities`
--
ALTER TABLE `sd_site_activities`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `sd_site_settings`
--
ALTER TABLE `sd_site_settings`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `sd_telephone`
--
ALTER TABLE `sd_telephone`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `sd_temporary_advance`
--
ALTER TABLE `sd_temporary_advance`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `sd_workshop`
--
ALTER TABLE `sd_workshop`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `sd_work_permit`
--
ALTER TABLE `sd_work_permit`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `site_visitors`
--
ALTER TABLE `site_visitors`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_ip_date` (`ip_address`,`visit_date`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `sd_acv_shutdown`
--
ALTER TABLE `sd_acv_shutdown`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sd_ac_ventilation_complaint`
--
ALTER TABLE `sd_ac_ventilation_complaint`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sd_admin_menu`
--
ALTER TABLE `sd_admin_menu`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sd_admin_modules`
--
ALTER TABLE `sd_admin_modules`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sd_admin_module_permissions`
--
ALTER TABLE `sd_admin_module_permissions`
  MODIFY `ID` int(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sd_admin_role_permissions`
--
ALTER TABLE `sd_admin_role_permissions`
  MODIFY `ID` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sd_awards`
--
ALTER TABLE `sd_awards`
  MODIFY `ID` int(5) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sd_complaints`
--
ALTER TABLE `sd_complaints`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sd_complaint_types`
--
ALTER TABLE `sd_complaint_types`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sd_doc_authors`
--
ALTER TABLE `sd_doc_authors`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sd_doc_category`
--
ALTER TABLE `sd_doc_category`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sd_doc_list`
--
ALTER TABLE `sd_doc_list`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sd_doc_list_permission`
--
ALTER TABLE `sd_doc_list_permission`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sd_electrical`
--
ALTER TABLE `sd_electrical`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sd_electrical_shutdown`
--
ALTER TABLE `sd_electrical_shutdown`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sd_forms`
--
ALTER TABLE `sd_forms`
  MODIFY `ID` int(3) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sd_gallery`
--
ALTER TABLE `sd_gallery`
  MODIFY `ID` int(5) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sd_history`
--
ALTER TABLE `sd_history`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sd_homeforms`
--
ALTER TABLE `sd_homeforms`
  MODIFY `ID` int(5) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sd_home_images`
--
ALTER TABLE `sd_home_images`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sd_import`
--
ALTER TABLE `sd_import`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sd_license`
--
ALTER TABLE `sd_license`
  MODIFY `ID` int(5) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sd_mbook_entry`
--
ALTER TABLE `sd_mbook_entry`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sd_mbook_issue`
--
ALTER TABLE `sd_mbook_issue`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sd_mechanical`
--
ALTER TABLE `sd_mechanical`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sd_meetroom`
--
ALTER TABLE `sd_meetroom`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sd_meet_proposal`
--
ALTER TABLE `sd_meet_proposal`
  MODIFY `ID` int(5) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sd_mom`
--
ALTER TABLE `sd_mom`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sd_mom_types`
--
ALTER TABLE `sd_mom_types`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sd_mt_role`
--
ALTER TABLE `sd_mt_role`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sd_mt_type`
--
ALTER TABLE `sd_mt_type`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sd_mt_userdb`
--
ALTER TABLE `sd_mt_userdb`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sd_mt_user_otp`
--
ALTER TABLE `sd_mt_user_otp`
  MODIFY `ID` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sd_mt_user_role`
--
ALTER TABLE `sd_mt_user_role`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sd_network`
--
ALTER TABLE `sd_network`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sd_org`
--
ALTER TABLE `sd_org`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sd_radiological_work`
--
ALTER TABLE `sd_radiological_work`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sd_radiological_work_sub`
--
ALTER TABLE `sd_radiological_work_sub`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sd_rfid_card`
--
ALTER TABLE `sd_rfid_card`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sd_shutdown`
--
ALTER TABLE `sd_shutdown`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sd_site_activities`
--
ALTER TABLE `sd_site_activities`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sd_site_settings`
--
ALTER TABLE `sd_site_settings`
  MODIFY `ID` int(3) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sd_telephone`
--
ALTER TABLE `sd_telephone`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sd_temporary_advance`
--
ALTER TABLE `sd_temporary_advance`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sd_workshop`
--
ALTER TABLE `sd_workshop`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sd_work_permit`
--
ALTER TABLE `sd_work_permit`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `site_visitors`
--
ALTER TABLE `site_visitors`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `sd_admin_module_permissions`
--
ALTER TABLE `sd_admin_module_permissions`
  ADD CONSTRAINT `sd_admin_module_permissions_ibfk_1` FOREIGN KEY (`module_id`) REFERENCES `sd_admin_modules` (`ID`) ON DELETE CASCADE;
--
-- Database: `sds_nvm_2025`
--
CREATE DATABASE IF NOT EXISTS `sds_nvm_2025` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_uca1400_ai_ci;
USE `sds_nvm_2025`;

-- --------------------------------------------------------

--
-- Table structure for table `sds_pdf_details`
--

CREATE TABLE `sds_pdf_details` (
  `ID` int(11) NOT NULL,
  `category` varchar(255) DEFAULT NULL,
  `pdf_title` varchar(255) DEFAULT NULL,
  `file_name` varchar(255) DEFAULT NULL,
  `file_type` varchar(100) DEFAULT NULL,
  `file_size` int(11) DEFAULT NULL,
  `file_content` longtext DEFAULT NULL,
  `created_time` datetime DEFAULT NULL,
  `last_modified_time` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sd_admin_cookie_consent`
--

CREATE TABLE `sd_admin_cookie_consent` (
  `ID` int(11) NOT NULL,
  `userId` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `anonymousId` varchar(255) DEFAULT NULL,
  `ipAddress` varchar(255) NOT NULL,
  `essentialCookies` tinyint(1) NOT NULL DEFAULT 1,
  `functionalCookies` tinyint(1) NOT NULL DEFAULT 0,
  `analyticsCookies` tinyint(1) NOT NULL DEFAULT 0,
  `advertisingCookies` tinyint(1) NOT NULL DEFAULT 0,
  `userAgent` text NOT NULL,
  `source` varchar(255) NOT NULL,
  `policyVersion` varchar(255) NOT NULL DEFAULT '1.0',
  `last_modified_time` datetime NOT NULL,
  `isWithdrawn` tinyint(1) DEFAULT 0,
  `withdrawnAt` datetime DEFAULT NULL,
  `created_time` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sd_admin_mail`
--

CREATE TABLE `sd_admin_mail` (
  `ID` int(11) NOT NULL,
  `mail_name` varchar(255) NOT NULL,
  `mail_subject` text NOT NULL,
  `mail_msg` longtext NOT NULL,
  `last_modified_by` datetime NOT NULL,
  `last_modified_time` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sd_admin_menu`
--

CREATE TABLE `sd_admin_menu` (
  `ID` int(11) NOT NULL,
  `label` varchar(50) NOT NULL,
  `icon` varchar(50) NOT NULL,
  `link` varchar(150) NOT NULL,
  `roles` varchar(255) NOT NULL,
  `order_number` int(11) NOT NULL DEFAULT 0,
  `parent_id` int(11) NOT NULL DEFAULT 0,
  `created_by` datetime NOT NULL,
  `last_modified_time` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sd_admin_mt_role`
--

CREATE TABLE `sd_admin_mt_role` (
  `ID` int(11) NOT NULL,
  `role_name` varchar(100) NOT NULL,
  `created_time` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sd_admin_mt_userdb`
--

CREATE TABLE `sd_admin_mt_userdb` (
  `ID` int(11) NOT NULL,
  `emailid` varchar(255) DEFAULT NULL,
  `ename` varchar(255) DEFAULT NULL,
  `epassword` varchar(255) DEFAULT NULL,
  `euserid` varchar(255) DEFAULT NULL,
  `mobile_no` varchar(255) DEFAULT NULL,
  `designation` varchar(250) DEFAULT NULL,
  `profile_img` text DEFAULT NULL,
  `last_login_time` datetime DEFAULT NULL,
  `last_login_ip` varchar(50) DEFAULT NULL,
  `last_reset_time` datetime DEFAULT NULL,
  `change_pass` int(11) DEFAULT 0,
  `created_time` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT 0,
  `active_status` int(11) NOT NULL DEFAULT 0,
  `failed_attempts` int(11) NOT NULL DEFAULT 0,
  `role` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sd_admin_mt_user_role`
--

CREATE TABLE `sd_admin_mt_user_role` (
  `ID` int(11) NOT NULL,
  `sd_mt_userdb_id` int(11) NOT NULL,
  `sd_mt_role_id` int(11) NOT NULL,
  `created_by` varchar(100) NOT NULL,
  `created_time` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sd_payment_fees`
--

CREATE TABLE `sd_payment_fees` (
  `adv_type` varchar(100) NOT NULL,
  `tariff` float NOT NULL,
  `gst` float NOT NULL,
  `net_payable` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sd_submission_dates`
--

CREATE TABLE `sd_submission_dates` (
  `ID` int(11) NOT NULL,
  `sub_abstracts_date` datetime DEFAULT NULL,
  `acceptance_abstracts_date` datetime DEFAULT NULL,
  `full_paper_date` datetime DEFAULT NULL,
  `registration_date` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sd_user_paper`
--

CREATE TABLE `sd_user_paper` (
  `ID` int(11) NOT NULL,
  `sd_mt_userdb_id` int(11) NOT NULL,
  `title` text NOT NULL,
  `authors` text NOT NULL,
  `poster` int(11) DEFAULT NULL,
  `abstract_file` longtext DEFAULT NULL,
  `presentation_file` longtext DEFAULT NULL,
  `full_paper` longtext DEFAULT NULL,
  `created_time` datetime DEFAULT NULL,
  `status` int(11) DEFAULT 5,
  `updated_by` int(11) DEFAULT NULL,
  `updated_time` datetime DEFAULT NULL,
  `last_modified_time` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sd_user_payment`
--

CREATE TABLE `sd_user_payment` (
  `ID` int(11) NOT NULL,
  `sd_mt_userdb_id` int(11) NOT NULL,
  `adv_type` varchar(100) NOT NULL,
  `spouse` int(11) DEFAULT NULL,
  `ref_no` varchar(100) NOT NULL,
  `ref_date` datetime DEFAULT NULL,
  `ref_amount` float DEFAULT NULL,
  `gst_amount` float DEFAULT NULL,
  `total_amount` float DEFAULT NULL,
  `created_time` datetime DEFAULT NULL,
  `status` int(11) DEFAULT 5,
  `updated_by` int(11) DEFAULT NULL,
  `updated_time` datetime DEFAULT NULL,
  `last_modified_time` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `sds_pdf_details`
--
ALTER TABLE `sds_pdf_details`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `sd_admin_cookie_consent`
--
ALTER TABLE `sd_admin_cookie_consent`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `sd_admin_mail`
--
ALTER TABLE `sd_admin_mail`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `sd_admin_menu`
--
ALTER TABLE `sd_admin_menu`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `sd_admin_mt_role`
--
ALTER TABLE `sd_admin_mt_role`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `sd_admin_mt_userdb`
--
ALTER TABLE `sd_admin_mt_userdb`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `sd_admin_mt_user_role`
--
ALTER TABLE `sd_admin_mt_user_role`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `sd_admin_mt_user_role_sd_mt_role_id_sd_mt_userdb_id_unique` (`sd_mt_userdb_id`,`sd_mt_role_id`),
  ADD KEY `sd_mt_role_id` (`sd_mt_role_id`);

--
-- Indexes for table `sd_payment_fees`
--
ALTER TABLE `sd_payment_fees`
  ADD PRIMARY KEY (`adv_type`);

--
-- Indexes for table `sd_submission_dates`
--
ALTER TABLE `sd_submission_dates`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `sd_user_paper`
--
ALTER TABLE `sd_user_paper`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `sd_mt_userdb_id` (`sd_mt_userdb_id`),
  ADD KEY `updated_by` (`updated_by`);

--
-- Indexes for table `sd_user_payment`
--
ALTER TABLE `sd_user_payment`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `sd_mt_userdb_id` (`sd_mt_userdb_id`),
  ADD KEY `updated_by` (`updated_by`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `sds_pdf_details`
--
ALTER TABLE `sds_pdf_details`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sd_admin_cookie_consent`
--
ALTER TABLE `sd_admin_cookie_consent`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sd_admin_mail`
--
ALTER TABLE `sd_admin_mail`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sd_admin_menu`
--
ALTER TABLE `sd_admin_menu`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sd_admin_mt_role`
--
ALTER TABLE `sd_admin_mt_role`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sd_admin_mt_userdb`
--
ALTER TABLE `sd_admin_mt_userdb`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sd_admin_mt_user_role`
--
ALTER TABLE `sd_admin_mt_user_role`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sd_submission_dates`
--
ALTER TABLE `sd_submission_dates`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sd_user_paper`
--
ALTER TABLE `sd_user_paper`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sd_user_payment`
--
ALTER TABLE `sd_user_payment`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `sd_admin_mt_user_role`
--
ALTER TABLE `sd_admin_mt_user_role`
  ADD CONSTRAINT `sd_admin_mt_user_role_ibfk_1` FOREIGN KEY (`sd_mt_userdb_id`) REFERENCES `sd_admin_mt_userdb` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `sd_admin_mt_user_role_ibfk_2` FOREIGN KEY (`sd_mt_role_id`) REFERENCES `sd_admin_mt_role` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `sd_user_paper`
--
ALTER TABLE `sd_user_paper`
  ADD CONSTRAINT `sd_user_paper_ibfk_1` FOREIGN KEY (`sd_mt_userdb_id`) REFERENCES `sd_admin_mt_userdb` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `sd_user_paper_ibfk_2` FOREIGN KEY (`updated_by`) REFERENCES `sd_admin_mt_userdb` (`ID`);

--
-- Constraints for table `sd_user_payment`
--
ALTER TABLE `sd_user_payment`
  ADD CONSTRAINT `sd_user_payment_ibfk_1` FOREIGN KEY (`sd_mt_userdb_id`) REFERENCES `sd_admin_mt_userdb` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `sd_user_payment_ibfk_2` FOREIGN KEY (`updated_by`) REFERENCES `sd_admin_mt_userdb` (`ID`);
--
-- Database: `sd_kgr_live`
--
CREATE DATABASE IF NOT EXISTS `sd_kgr_live` DEFAULT CHARACTER SET utf16 COLLATE utf16_general_ci;
USE `sd_kgr_live`;

-- --------------------------------------------------------

--
-- Table structure for table `sd_admin_home_images`
--

CREATE TABLE `sd_admin_home_images` (
  `ID` int(11) NOT NULL,
  `image_title` varchar(255) NOT NULL,
  `image_file` longtext NOT NULL,
  `image_type` varchar(255) NOT NULL,
  `last_modified_time` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sd_admin_menu`
--

CREATE TABLE `sd_admin_menu` (
  `ID` int(11) NOT NULL,
  `label` varchar(50) NOT NULL,
  `icon` varchar(50) NOT NULL,
  `link` varchar(150) NOT NULL,
  `roles` varchar(255) NOT NULL,
  `order_number` int(11) NOT NULL DEFAULT 0,
  `parent_id` int(11) NOT NULL DEFAULT 0,
  `created_by` int(11) NOT NULL,
  `last_modified_time` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `sd_admin_modules_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sd_admin_modules`
--

CREATE TABLE `sd_admin_modules` (
  `ID` int(11) NOT NULL,
  `module_name` varchar(255) NOT NULL,
  `status` int(11) NOT NULL DEFAULT 5
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sd_admin_module_permissions`
--

CREATE TABLE `sd_admin_module_permissions` (
  `ID` int(20) UNSIGNED NOT NULL,
  `module_id` int(11) DEFAULT NULL,
  `action` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sd_admin_role_permissions`
--

CREATE TABLE `sd_admin_role_permissions` (
  `ID` bigint(20) UNSIGNED NOT NULL,
  `role_id` int(11) DEFAULT NULL,
  `permission_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sd_advertisement`
--

CREATE TABLE `sd_advertisement` (
  `ID` int(11) NOT NULL,
  `adv_image` longtext NOT NULL,
  `adv_company` varchar(255) NOT NULL,
  `adv_url` varchar(255) DEFAULT NULL,
  `adv_display` varchar(255) DEFAULT NULL,
  `adv_type` varchar(255) DEFAULT NULL,
  `adv_classified_id` int(11) NOT NULL DEFAULT 0,
  `status` int(11) NOT NULL DEFAULT 0,
  `order_number` int(11) NOT NULL DEFAULT 0,
  `created_by` int(11) NOT NULL DEFAULT 0,
  `created_time` timestamp NOT NULL DEFAULT current_timestamp(),
  `last_modified_by` int(11) NOT NULL DEFAULT 0,
  `last_modified_time` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sd_city_help_line`
--

CREATE TABLE `sd_city_help_line` (
  `ID` int(11) NOT NULL,
  `sd_location_id` int(11) NOT NULL,
  `sd_taluka_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `type` varchar(50) NOT NULL,
  `city_image` longtext NOT NULL,
  `contact_number` varchar(100) NOT NULL,
  `address` varchar(255) NOT NULL,
  `city` varchar(255) NOT NULL,
  `pincode` int(11) NOT NULL,
  `status` int(11) NOT NULL DEFAULT 5,
  `created_by` int(11) NOT NULL DEFAULT 0,
  `created_time` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `last_modified_by` int(11) NOT NULL DEFAULT 0,
  `last_modified_time` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sd_city_info`
--

CREATE TABLE `sd_city_info` (
  `ID` int(11) NOT NULL,
  `sd_location_id` int(11) NOT NULL,
  `city_content` text NOT NULL,
  `city_image` longtext NOT NULL,
  `total_area` varchar(50) NOT NULL,
  `total_courts` varchar(50) NOT NULL,
  `total_police` varchar(50) NOT NULL,
  `total_hospital` varchar(50) NOT NULL,
  `total_panchayth` varchar(50) NOT NULL,
  `total_tourist` varchar(50) NOT NULL,
  `created_by` int(11) NOT NULL,
  `last_modified_time` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf16 COLLATE=utf16_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sd_city_info_sub`
--

CREATE TABLE `sd_city_info_sub` (
  `ID` int(11) NOT NULL,
  `sd_city_info_id` int(11) NOT NULL,
  `name` varchar(10000) NOT NULL,
  `image` longtext NOT NULL,
  `designation` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf16 COLLATE=utf16_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sd_classifieds`
--

CREATE TABLE `sd_classifieds` (
  `ID` int(11) NOT NULL,
  `sd_classified_category` int(100) NOT NULL,
  `service_image` longtext NOT NULL,
  `service_title` varchar(1000) NOT NULL,
  `service_description` longtext DEFAULT NULL,
  `service_start_time` varchar(255) DEFAULT NULL,
  `service_end_time` varchar(255) DEFAULT NULL,
  `star_rating` int(11) NOT NULL DEFAULT 0,
  `service_address` text DEFAULT NULL,
  `mobile_no` varchar(15) NOT NULL,
  `email_id` varchar(100) NOT NULL,
  `sd_location_id` int(11) NOT NULL,
  `status` int(11) NOT NULL DEFAULT 5,
  `created_by` int(11) NOT NULL,
  `created_time` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `last_modified_by` int(11) NOT NULL DEFAULT 0,
  `last_modified_time` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `sd_taluka_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sd_classified_category`
--

CREATE TABLE `sd_classified_category` (
  `ID` int(11) NOT NULL,
  `name` varchar(1000) NOT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `type` enum('ICON','IMAGE') NOT NULL DEFAULT 'ICON',
  `image_text` longtext DEFAULT NULL,
  `icon` varchar(255) DEFAULT NULL,
  `order_number` int(11) NOT NULL DEFAULT 0,
  `status` int(11) NOT NULL DEFAULT 5,
  `created_time` timestamp NOT NULL DEFAULT current_timestamp(),
  `last_modified_time` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sd_daily_updates`
--

CREATE TABLE `sd_daily_updates` (
  `ID` int(11) NOT NULL,
  `item_name` varchar(1000) NOT NULL,
  `item_image` longtext NOT NULL,
  `created_by` int(11) NOT NULL DEFAULT 0,
  `created_time` timestamp NOT NULL DEFAULT current_timestamp(),
  `last_modified_by` int(11) NOT NULL DEFAULT 0,
  `last_modified_time` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sd_daily_updates_sub`
--

CREATE TABLE `sd_daily_updates_sub` (
  `ID` int(11) NOT NULL,
  `sd_daily_updates_id` int(11) NOT NULL,
  `sub_item_name` varchar(255) NOT NULL,
  `sub_item_price` varchar(255) NOT NULL,
  `sub_item_unit` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sd_delete_account`
--

CREATE TABLE `sd_delete_account` (
  `ID` int(11) NOT NULL,
  `st_mt_userdb_id` int(11) DEFAULT NULL,
  `reason` varchar(255) NOT NULL,
  `status` int(11) NOT NULL DEFAULT 0,
  `created_by` int(11) NOT NULL DEFAULT 0,
  `created_time` datetime DEFAULT current_timestamp(),
  `last_modified_by` int(11) NOT NULL DEFAULT 0,
  `last_modified_time` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sd_donate_blood`
--

CREATE TABLE `sd_donate_blood` (
  `ID` int(11) NOT NULL,
  `sd_location_id` int(11) NOT NULL,
  `sd_taluka_id` int(11) NOT NULL,
  `name` varchar(1000) NOT NULL,
  `blood_group` varchar(100) NOT NULL,
  `type` enum('Donor','Bank') NOT NULL,
  `contact_number` varchar(100) NOT NULL,
  `address` varchar(255) NOT NULL,
  `city` varchar(255) NOT NULL,
  `pincode` int(11) NOT NULL,
  `status` int(11) NOT NULL DEFAULT 5,
  `created_by` int(11) NOT NULL DEFAULT 0,
  `created_time` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `last_modified_by` int(11) NOT NULL DEFAULT 0,
  `last_modified_time` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sd_donate_food`
--

CREATE TABLE `sd_donate_food` (
  `ID` int(11) NOT NULL,
  `sd_location_id` int(11) NOT NULL,
  `sd_taluka_id` int(11) NOT NULL,
  `trust_name` varchar(255) NOT NULL,
  `contact_number` varchar(100) NOT NULL,
  `address` varchar(255) NOT NULL,
  `city` varchar(255) NOT NULL,
  `pincode` int(11) NOT NULL,
  `status` int(11) NOT NULL DEFAULT 5,
  `created_by` int(11) NOT NULL DEFAULT 0,
  `created_time` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `last_modified_by` int(11) NOT NULL DEFAULT 0,
  `last_modified_time` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sd_entertainment`
--

CREATE TABLE `sd_entertainment` (
  `ID` int(11) NOT NULL,
  `movie_name` varchar(1000) NOT NULL,
  `movie_image` longtext NOT NULL,
  `sd_entertainment_category_id` int(11) NOT NULL,
  `sd_location_id` int(11) NOT NULL,
  `sd_taluka_id` int(11) NOT NULL,
  `movie_date` date NOT NULL,
  `movie_show` varchar(255) DEFAULT NULL,
  `movie_language` varchar(255) NOT NULL,
  `movie_screen` varchar(255) DEFAULT NULL,
  `move_parking` varchar(255) DEFAULT NULL,
  `theatre_name` varchar(255) NOT NULL,
  `status` int(11) NOT NULL,
  `address` varchar(255) DEFAULT NULL,
  `created_by` int(11) NOT NULL DEFAULT 0,
  `created_time` datetime DEFAULT NULL,
  `last_modified_by` int(11) NOT NULL DEFAULT 0,
  `last_modified_time` timestamp NOT NULL DEFAULT current_timestamp(),
  `show_timings` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sd_entertainment_category`
--

CREATE TABLE `sd_entertainment_category` (
  `ID` int(11) NOT NULL,
  `category` varchar(11) NOT NULL,
  `created_by` int(11) NOT NULL DEFAULT 0,
  `created_time` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sd_events`
--

CREATE TABLE `sd_events` (
  `ID` int(11) NOT NULL,
  `event_image` longtext NOT NULL,
  `event_title` varchar(1000) NOT NULL,
  `from_date` date NOT NULL,
  `to_date` date NOT NULL,
  `start_time` time NOT NULL,
  `end_time` time NOT NULL,
  `address` varchar(255) NOT NULL,
  `status` int(11) NOT NULL DEFAULT 5,
  `views_count` int(11) NOT NULL DEFAULT 0,
  `created_by` int(11) NOT NULL DEFAULT 0,
  `created_time` datetime DEFAULT current_timestamp(),
  `last_modified_by` int(11) NOT NULL DEFAULT 0,
  `last_modified_time` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `sd_location_id` int(11) NOT NULL,
  `sd_taluka_id` int(11) NOT NULL,
  `event_description` longtext NOT NULL,
  `phone_no` int(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sd_events_interactions`
--

CREATE TABLE `sd_events_interactions` (
  `ID` int(11) NOT NULL,
  `sd_events_id` int(11) NOT NULL,
  `sd_mt_userdb_id` int(11) NOT NULL,
  `comment` text DEFAULT NULL,
  `liked` tinyint(1) DEFAULT 0,
  `created_time` timestamp NOT NULL DEFAULT current_timestamp(),
  `last_modified_time` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sd_events_views`
--

CREATE TABLE `sd_events_views` (
  `ID` int(11) NOT NULL,
  `sd_events_id` int(11) NOT NULL,
  `sd_mt_userdb_id` int(11) NOT NULL,
  `created_time` timestamp NOT NULL DEFAULT current_timestamp(),
  `last_modified_time` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sd_feedback`
--

CREATE TABLE `sd_feedback` (
  `ID` int(11) NOT NULL,
  `st_mt_userdb_id` int(11) DEFAULT NULL,
  `rating` int(100) NOT NULL,
  `remarks` varchar(255) DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT 5,
  `created_by` int(11) NOT NULL DEFAULT 0,
  `created_time` datetime DEFAULT current_timestamp(),
  `last_modified_by` int(11) NOT NULL DEFAULT 0,
  `last_modified_time` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sd_jobs`
--

CREATE TABLE `sd_jobs` (
  `ID` int(100) NOT NULL,
  `jobs_image` longtext NOT NULL,
  `jobs_description` longtext NOT NULL,
  `jobs_heading` varchar(100) NOT NULL,
  `jobs_experience_details` varchar(255) NOT NULL,
  `jobs_time_date` datetime DEFAULT NULL,
  `jobs_locations` varchar(255) NOT NULL,
  `sd_jobs_category_id` int(11) NOT NULL,
  `jobs_salary` varchar(100) NOT NULL,
  `jobs_about_company` text NOT NULL,
  `sd_location_id` int(11) NOT NULL,
  `sd_taluka_id` int(11) NOT NULL,
  `jobs_vacancy` varchar(255) NOT NULL,
  `status` int(11) NOT NULL DEFAULT 5,
  `views_count` int(11) NOT NULL DEFAULT 0,
  `created_by` int(11) NOT NULL DEFAULT 0,
  `created_time` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `last_modified_by` int(11) NOT NULL DEFAULT 0,
  `last_modified_time` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sd_jobs_category`
--

CREATE TABLE `sd_jobs_category` (
  `ID` int(11) NOT NULL,
  `category` varchar(100) NOT NULL,
  `created_by` int(11) NOT NULL DEFAULT 0,
  `created_time` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sd_jobs_views`
--

CREATE TABLE `sd_jobs_views` (
  `ID` int(11) NOT NULL,
  `sd_jobs_id` int(11) NOT NULL,
  `sd_mt_userdb_id` int(11) NOT NULL,
  `created_time` timestamp NOT NULL DEFAULT current_timestamp(),
  `last_modified_time` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sd_location`
--

CREATE TABLE `sd_location` (
  `ID` int(11) NOT NULL,
  `location_name` varchar(255) NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_time` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sd_mt_role`
--

CREATE TABLE `sd_mt_role` (
  `ID` int(11) NOT NULL,
  `role_name` varchar(100) NOT NULL,
  `created_time` datetime DEFAULT NULL,
  `created_by` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sd_mt_userdb`
--

CREATE TABLE `sd_mt_userdb` (
  `ID` int(11) NOT NULL,
  `user_type` int(11) NOT NULL DEFAULT 1 COMMENT '1=admin,5=customer',
  `ename` varchar(255) NOT NULL,
  `euserid` varchar(255) NOT NULL,
  `epassword` varchar(255) DEFAULT NULL,
  `email_id` varchar(255) DEFAULT NULL,
  `mobile_no` varchar(15) DEFAULT NULL,
  `designation` varchar(255) DEFAULT NULL,
  `profile_img` longtext DEFAULT NULL,
  `storage_capacity` float DEFAULT NULL,
  `max_capacity` int(50) DEFAULT NULL,
  `last_login_time` datetime DEFAULT NULL,
  `last_login_ip` varchar(50) DEFAULT NULL,
  `last_reset_time` datetime DEFAULT NULL,
  `change_pass` int(11) DEFAULT 0,
  `created_time` datetime DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `active_status` int(11) NOT NULL DEFAULT 0,
  `failed_attempts` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sd_mt_user_log`
--

CREATE TABLE `sd_mt_user_log` (
  `ID` int(11) NOT NULL,
  `sd_mt_userdb_id` int(11) NOT NULL,
  `last_modified_time` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sd_mt_user_otp`
--

CREATE TABLE `sd_mt_user_otp` (
  `ID` int(11) NOT NULL,
  `otp_type` enum('EMAIL','MOBILE') NOT NULL,
  `country_code` varchar(5) NOT NULL DEFAULT '0',
  `mobile_no` varchar(50) DEFAULT NULL,
  `email_id` varchar(255) DEFAULT NULL,
  `otp_code_hash` varchar(255) NOT NULL,
  `otp_created_time` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf16 COLLATE=utf16_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sd_mt_user_role`
--

CREATE TABLE `sd_mt_user_role` (
  `ID` int(11) NOT NULL,
  `sd_mt_userdb_id` int(11) NOT NULL,
  `sd_mt_role_id` int(11) NOT NULL,
  `created_time` datetime DEFAULT NULL,
  `created_by` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sd_news`
--

CREATE TABLE `sd_news` (
  `ID` int(11) NOT NULL,
  `sd_news_category_id` int(11) NOT NULL,
  `news_image` longtext NOT NULL,
  `news_content` text NOT NULL,
  `news_heading` text NOT NULL,
  `views_count` int(11) DEFAULT NULL,
  `publisher_name` varchar(255) NOT NULL,
  `news_comments` varchar(255) DEFAULT NULL,
  `news_likes` int(11) DEFAULT NULL,
  `sd_location_id` int(11) NOT NULL,
  `sd_taluka_id` int(11) NOT NULL,
  `status` int(11) NOT NULL DEFAULT 5,
  `created_time` datetime DEFAULT NULL,
  `created_by` int(11) NOT NULL DEFAULT 0,
  `last_modified_by` int(11) NOT NULL DEFAULT 0,
  `last_modified_time` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sd_news_category`
--

CREATE TABLE `sd_news_category` (
  `ID` int(11) NOT NULL,
  `category` varchar(255) NOT NULL,
  `created_by` int(11) NOT NULL DEFAULT 0,
  `created_time` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sd_news_interactions`
--

CREATE TABLE `sd_news_interactions` (
  `ID` int(11) NOT NULL,
  `sd_news_id` int(11) NOT NULL,
  `sd_mt_userdb_id` int(11) NOT NULL,
  `comment` text DEFAULT NULL,
  `liked` tinyint(1) DEFAULT 0,
  `created_time` timestamp NOT NULL DEFAULT current_timestamp(),
  `last_modified_time` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sd_news_views`
--

CREATE TABLE `sd_news_views` (
  `ID` int(11) NOT NULL,
  `sd_news_id` int(11) NOT NULL,
  `sd_mt_userdb_id` int(11) NOT NULL,
  `created_time` timestamp NOT NULL DEFAULT current_timestamp(),
  `last_modified_time` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sd_offerzone_category`
--

CREATE TABLE `sd_offerzone_category` (
  `ID` int(11) NOT NULL,
  `category` varchar(50) NOT NULL,
  `created_by` int(11) NOT NULL DEFAULT 0,
  `created_time` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf16 COLLATE=utf16_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sd_offer_zone`
--

CREATE TABLE `sd_offer_zone` (
  `ID` int(11) NOT NULL,
  `offer_image` longtext NOT NULL,
  `title` varchar(1000) NOT NULL,
  `description` longtext DEFAULT NULL,
  `price` varchar(50) DEFAULT NULL,
  `contact_details` text DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT 5,
  `offer_link` varchar(500) DEFAULT NULL,
  `sd_classifieds_id` int(11) DEFAULT NULL,
  `offer_type` enum('EXTERNAL','INTERNAL') NOT NULL,
  `created_by` int(11) NOT NULL DEFAULT 0,
  `created_time` date DEFAULT current_timestamp(),
  `last_modified_by` int(11) NOT NULL DEFAULT 0,
  `last_modified_time` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `sd_offerzone_category_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sd_site_alerts`
--

CREATE TABLE `sd_site_alerts` (
  `ID` int(11) NOT NULL,
  `type` enum('SMS','MAIL') NOT NULL,
  `name` varchar(55) NOT NULL,
  `message` text NOT NULL,
  `mail_subject` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf16 COLLATE=utf16_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sd_site_api`
--

CREATE TABLE `sd_site_api` (
  `ID` int(11) NOT NULL,
  `api_path` varchar(255) NOT NULL,
  `controller` varchar(50) NOT NULL,
  `method` varchar(50) NOT NULL,
  `type` enum('POST','GET') NOT NULL,
  `description` text NOT NULL,
  `groups` varchar(1000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf16 COLLATE=utf16_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sd_site_settings`
--

CREATE TABLE `sd_site_settings` (
  `ID` int(3) NOT NULL,
  `setting_name` varchar(50) NOT NULL,
  `setting_value` longtext NOT NULL,
  `created_by` varchar(50) NOT NULL,
  `last_modified_time` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sd_stores`
--

CREATE TABLE `sd_stores` (
  `ID` int(11) NOT NULL,
  `store_name` varchar(255) NOT NULL,
  `store_contact_details` varchar(255) NOT NULL,
  `sd_classified_category_id` int(100) NOT NULL,
  `store_description` varchar(255) NOT NULL,
  `status` int(11) NOT NULL DEFAULT 5,
  `created_by` int(11) NOT NULL DEFAULT 0,
  `created_time` datetime DEFAULT current_timestamp(),
  `last_modified_by` int(11) NOT NULL DEFAULT 0,
  `last_modified_time` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sd_taluka`
--

CREATE TABLE `sd_taluka` (
  `ID` int(11) NOT NULL,
  `sd_location_id` int(11) NOT NULL,
  `taluka_name` varchar(255) NOT NULL,
  `created_by` int(11) NOT NULL DEFAULT 0,
  `created_time` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `sd_admin_home_images`
--
ALTER TABLE `sd_admin_home_images`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `sd_admin_menu`
--
ALTER TABLE `sd_admin_menu`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `sd_admin_modules`
--
ALTER TABLE `sd_admin_modules`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `sd_admin_module_permissions`
--
ALTER TABLE `sd_admin_module_permissions`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `module_id` (`module_id`,`action`);

--
-- Indexes for table `sd_admin_role_permissions`
--
ALTER TABLE `sd_admin_role_permissions`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `role_id` (`role_id`,`permission_id`);

--
-- Indexes for table `sd_advertisement`
--
ALTER TABLE `sd_advertisement`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `sd_city_help_line`
--
ALTER TABLE `sd_city_help_line`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `sd_taluka_id` (`sd_taluka_id`),
  ADD KEY `type` (`type`);

--
-- Indexes for table `sd_city_info`
--
ALTER TABLE `sd_city_info`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `sd_city_info_sub`
--
ALTER TABLE `sd_city_info_sub`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `sd_classifieds`
--
ALTER TABLE `sd_classifieds`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `classifieds_category` (`sd_classified_category`);

--
-- Indexes for table `sd_classified_category`
--
ALTER TABLE `sd_classified_category`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `parent_id` (`parent_id`);

--
-- Indexes for table `sd_daily_updates`
--
ALTER TABLE `sd_daily_updates`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `sd_daily_updates_sub`
--
ALTER TABLE `sd_daily_updates_sub`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `sd_delete_account`
--
ALTER TABLE `sd_delete_account`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `sd_donate_blood`
--
ALTER TABLE `sd_donate_blood`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `sd_donate_food`
--
ALTER TABLE `sd_donate_food`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `sd_entertainment`
--
ALTER TABLE `sd_entertainment`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `sd_entertainment_category`
--
ALTER TABLE `sd_entertainment_category`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `sd_events`
--
ALTER TABLE `sd_events`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `sd_events_interactions`
--
ALTER TABLE `sd_events_interactions`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `sd_news_id` (`sd_events_id`),
  ADD KEY `sd_mt_userdb_id` (`sd_mt_userdb_id`);

--
-- Indexes for table `sd_events_views`
--
ALTER TABLE `sd_events_views`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `sd_mt_userdb_id` (`sd_mt_userdb_id`),
  ADD KEY `sd_jobs_id` (`sd_events_id`) USING BTREE,
  ADD KEY `sd_events_id` (`sd_events_id`);

--
-- Indexes for table `sd_feedback`
--
ALTER TABLE `sd_feedback`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `sd_jobs`
--
ALTER TABLE `sd_jobs`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `sd_jobs_category`
--
ALTER TABLE `sd_jobs_category`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `sd_jobs_views`
--
ALTER TABLE `sd_jobs_views`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `sd_mt_userdb_id` (`sd_mt_userdb_id`),
  ADD KEY `sd_jobs_id` (`sd_jobs_id`) USING BTREE;

--
-- Indexes for table `sd_location`
--
ALTER TABLE `sd_location`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `sd_mt_userdb`
--
ALTER TABLE `sd_mt_userdb`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `sd_mt_user_log`
--
ALTER TABLE `sd_mt_user_log`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `sd_mt_userdb_id` (`sd_mt_userdb_id`);

--
-- Indexes for table `sd_mt_user_otp`
--
ALTER TABLE `sd_mt_user_otp`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `sd_mt_user_role`
--
ALTER TABLE `sd_mt_user_role`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `sd_mt_userdb_id` (`sd_mt_userdb_id`),
  ADD KEY `sd_mt_role_id` (`sd_mt_role_id`);

--
-- Indexes for table `sd_news`
--
ALTER TABLE `sd_news`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `sd_location_id` (`sd_location_id`),
  ADD KEY `sd_news_category_id` (`sd_news_category_id`),
  ADD KEY `sd_taluka_id` (`sd_taluka_id`);

--
-- Indexes for table `sd_news_category`
--
ALTER TABLE `sd_news_category`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `sd_news_interactions`
--
ALTER TABLE `sd_news_interactions`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `sd_news_id` (`sd_news_id`),
  ADD KEY `sd_mt_userdb_id` (`sd_mt_userdb_id`);

--
-- Indexes for table `sd_news_views`
--
ALTER TABLE `sd_news_views`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `sd_news_id` (`sd_news_id`),
  ADD KEY `sd_mt_userdb_id` (`sd_mt_userdb_id`);

--
-- Indexes for table `sd_offerzone_category`
--
ALTER TABLE `sd_offerzone_category`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `sd_offer_zone`
--
ALTER TABLE `sd_offer_zone`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `sd_site_alerts`
--
ALTER TABLE `sd_site_alerts`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `sd_site_api`
--
ALTER TABLE `sd_site_api`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `sd_site_settings`
--
ALTER TABLE `sd_site_settings`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `sd_stores`
--
ALTER TABLE `sd_stores`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `sd_taluka`
--
ALTER TABLE `sd_taluka`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `sd_location_id` (`sd_location_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `sd_admin_home_images`
--
ALTER TABLE `sd_admin_home_images`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sd_admin_menu`
--
ALTER TABLE `sd_admin_menu`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sd_admin_modules`
--
ALTER TABLE `sd_admin_modules`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sd_admin_module_permissions`
--
ALTER TABLE `sd_admin_module_permissions`
  MODIFY `ID` int(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sd_admin_role_permissions`
--
ALTER TABLE `sd_admin_role_permissions`
  MODIFY `ID` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sd_advertisement`
--
ALTER TABLE `sd_advertisement`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sd_city_help_line`
--
ALTER TABLE `sd_city_help_line`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sd_city_info`
--
ALTER TABLE `sd_city_info`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sd_city_info_sub`
--
ALTER TABLE `sd_city_info_sub`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sd_classifieds`
--
ALTER TABLE `sd_classifieds`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sd_classified_category`
--
ALTER TABLE `sd_classified_category`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sd_daily_updates`
--
ALTER TABLE `sd_daily_updates`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sd_daily_updates_sub`
--
ALTER TABLE `sd_daily_updates_sub`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sd_delete_account`
--
ALTER TABLE `sd_delete_account`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sd_donate_blood`
--
ALTER TABLE `sd_donate_blood`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sd_donate_food`
--
ALTER TABLE `sd_donate_food`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sd_entertainment`
--
ALTER TABLE `sd_entertainment`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sd_entertainment_category`
--
ALTER TABLE `sd_entertainment_category`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sd_events`
--
ALTER TABLE `sd_events`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sd_events_interactions`
--
ALTER TABLE `sd_events_interactions`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sd_events_views`
--
ALTER TABLE `sd_events_views`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sd_feedback`
--
ALTER TABLE `sd_feedback`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sd_jobs`
--
ALTER TABLE `sd_jobs`
  MODIFY `ID` int(100) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sd_jobs_category`
--
ALTER TABLE `sd_jobs_category`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sd_jobs_views`
--
ALTER TABLE `sd_jobs_views`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sd_location`
--
ALTER TABLE `sd_location`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sd_mt_userdb`
--
ALTER TABLE `sd_mt_userdb`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sd_mt_user_log`
--
ALTER TABLE `sd_mt_user_log`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sd_mt_user_otp`
--
ALTER TABLE `sd_mt_user_otp`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sd_mt_user_role`
--
ALTER TABLE `sd_mt_user_role`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sd_news`
--
ALTER TABLE `sd_news`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sd_news_category`
--
ALTER TABLE `sd_news_category`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sd_news_interactions`
--
ALTER TABLE `sd_news_interactions`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sd_news_views`
--
ALTER TABLE `sd_news_views`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sd_offerzone_category`
--
ALTER TABLE `sd_offerzone_category`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sd_offer_zone`
--
ALTER TABLE `sd_offer_zone`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sd_site_alerts`
--
ALTER TABLE `sd_site_alerts`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sd_site_api`
--
ALTER TABLE `sd_site_api`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sd_site_settings`
--
ALTER TABLE `sd_site_settings`
  MODIFY `ID` int(3) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sd_stores`
--
ALTER TABLE `sd_stores`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sd_taluka`
--
ALTER TABLE `sd_taluka`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `sd_admin_module_permissions`
--
ALTER TABLE `sd_admin_module_permissions`
  ADD CONSTRAINT `sd_admin_module_permissions_ibfk_1` FOREIGN KEY (`module_id`) REFERENCES `sd_admin_modules` (`ID`) ON DELETE CASCADE;

--
-- Constraints for table `sd_classified_category`
--
ALTER TABLE `sd_classified_category`
  ADD CONSTRAINT `sd_classified_category_ibfk_1` FOREIGN KEY (`parent_id`) REFERENCES `sd_classified_category` (`ID`) ON DELETE CASCADE;

--
-- Constraints for table `sd_news`
--
ALTER TABLE `sd_news`
  ADD CONSTRAINT `sd_news_ibfk_1` FOREIGN KEY (`sd_location_id`) REFERENCES `sd_location` (`ID`),
  ADD CONSTRAINT `sd_news_ibfk_2` FOREIGN KEY (`sd_news_category_id`) REFERENCES `sd_news_category` (`ID`),
  ADD CONSTRAINT `sd_news_ibfk_3` FOREIGN KEY (`sd_taluka_id`) REFERENCES `sd_taluka` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `sd_news_interactions`
--
ALTER TABLE `sd_news_interactions`
  ADD CONSTRAINT `sd_news_interactions_ibfk_1` FOREIGN KEY (`sd_news_id`) REFERENCES `sd_news` (`ID`) ON DELETE CASCADE;

--
-- Constraints for table `sd_taluka`
--
ALTER TABLE `sd_taluka`
  ADD CONSTRAINT `sd_taluka_ibfk_1` FOREIGN KEY (`sd_location_id`) REFERENCES `sd_location` (`ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
