-- phpMyAdmin SQL Dump
-- version 3.5.2.2
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Apr 11, 2013 at 07:50 AM
-- Server version: 5.5.27
-- PHP Version: 5.4.7

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `testing1`
--

-- --------------------------------------------------------

--
-- Table structure for table `mdl_assign`
--

CREATE TABLE IF NOT EXISTS `mdl_assign` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `course` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `intro` longtext NOT NULL,
  `introformat` smallint(4) NOT NULL DEFAULT '0',
  `alwaysshowdescription` tinyint(2) NOT NULL DEFAULT '0',
  `nosubmissions` tinyint(2) NOT NULL DEFAULT '0',
  `submissiondrafts` tinyint(2) NOT NULL DEFAULT '0',
  `sendnotifications` tinyint(2) NOT NULL DEFAULT '0',
  `sendlatenotifications` tinyint(2) NOT NULL DEFAULT '0',
  `duedate` bigint(10) NOT NULL DEFAULT '0',
  `allowsubmissionsfromdate` bigint(10) NOT NULL DEFAULT '0',
  `grade` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `requiresubmissionstatement` tinyint(2) NOT NULL DEFAULT '0',
  `completionsubmit` tinyint(2) NOT NULL DEFAULT '0',
  `cutoffdate` bigint(10) NOT NULL DEFAULT '0',
  `teamsubmission` tinyint(2) NOT NULL DEFAULT '0',
  `requireallteammemberssubmit` tinyint(2) NOT NULL DEFAULT '0',
  `teamsubmissiongroupingid` bigint(10) NOT NULL DEFAULT '0',
  `blindmarking` tinyint(2) NOT NULL DEFAULT '0',
  `revealidentities` tinyint(2) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_assi_cou_ix` (`course`),
  KEY `mdl_assi_tea_ix` (`teamsubmissiongroupingid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='This table saves information about an instance of mod_assign' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_assignfeedback_comments`
--

CREATE TABLE IF NOT EXISTS `mdl_assignfeedback_comments` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `assignment` bigint(10) NOT NULL DEFAULT '0',
  `grade` bigint(10) NOT NULL DEFAULT '0',
  `commenttext` longtext,
  `commentformat` smallint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_assicomm_ass_ix` (`assignment`),
  KEY `mdl_assicomm_gra_ix` (`grade`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Text feedback for submitted assignments' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_assignfeedback_file`
--

CREATE TABLE IF NOT EXISTS `mdl_assignfeedback_file` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `assignment` bigint(10) NOT NULL DEFAULT '0',
  `grade` bigint(10) NOT NULL DEFAULT '0',
  `numfiles` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_assifile_ass2_ix` (`assignment`),
  KEY `mdl_assifile_gra_ix` (`grade`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Stores info about the number of files submitted by a student' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_assignment`
--

CREATE TABLE IF NOT EXISTS `mdl_assignment` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `course` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `intro` longtext NOT NULL,
  `introformat` smallint(4) NOT NULL DEFAULT '0',
  `assignmenttype` varchar(50) NOT NULL DEFAULT '',
  `resubmit` tinyint(2) NOT NULL DEFAULT '0',
  `preventlate` tinyint(2) NOT NULL DEFAULT '0',
  `emailteachers` tinyint(2) NOT NULL DEFAULT '0',
  `var1` bigint(10) DEFAULT '0',
  `var2` bigint(10) DEFAULT '0',
  `var3` bigint(10) DEFAULT '0',
  `var4` bigint(10) DEFAULT '0',
  `var5` bigint(10) DEFAULT '0',
  `maxbytes` bigint(10) NOT NULL DEFAULT '100000',
  `timedue` bigint(10) NOT NULL DEFAULT '0',
  `timeavailable` bigint(10) NOT NULL DEFAULT '0',
  `grade` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_assi_cou2_ix` (`course`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Defines assignments' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_assignment_submissions`
--

CREATE TABLE IF NOT EXISTS `mdl_assignment_submissions` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `assignment` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `timecreated` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `numfiles` bigint(10) NOT NULL DEFAULT '0',
  `data1` longtext,
  `data2` longtext,
  `grade` bigint(11) NOT NULL DEFAULT '0',
  `submissioncomment` longtext NOT NULL,
  `format` smallint(4) NOT NULL DEFAULT '0',
  `teacher` bigint(10) NOT NULL DEFAULT '0',
  `timemarked` bigint(10) NOT NULL DEFAULT '0',
  `mailed` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_assisubm_use2_ix` (`userid`),
  KEY `mdl_assisubm_mai_ix` (`mailed`),
  KEY `mdl_assisubm_tim_ix` (`timemarked`),
  KEY `mdl_assisubm_ass2_ix` (`assignment`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Info about submitted assignments' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_assignsubmission_file`
--

CREATE TABLE IF NOT EXISTS `mdl_assignsubmission_file` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `assignment` bigint(10) NOT NULL DEFAULT '0',
  `submission` bigint(10) NOT NULL DEFAULT '0',
  `numfiles` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_assifile_ass_ix` (`assignment`),
  KEY `mdl_assifile_sub_ix` (`submission`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Info about file submissions for assignments' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_assignsubmission_onlinetext`
--

CREATE TABLE IF NOT EXISTS `mdl_assignsubmission_onlinetext` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `assignment` bigint(10) NOT NULL DEFAULT '0',
  `submission` bigint(10) NOT NULL DEFAULT '0',
  `onlinetext` longtext,
  `onlineformat` smallint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_assionli_ass_ix` (`assignment`),
  KEY `mdl_assionli_sub_ix` (`submission`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Info about onlinetext submission' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_assign_grades`
--

CREATE TABLE IF NOT EXISTS `mdl_assign_grades` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `assignment` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `timecreated` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `grader` bigint(10) NOT NULL DEFAULT '0',
  `grade` decimal(10,5) DEFAULT '0.00000',
  `locked` tinyint(1) NOT NULL DEFAULT '0',
  `mailed` tinyint(1) NOT NULL DEFAULT '0',
  `extensionduedate` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_assigrad_use_ix` (`userid`),
  KEY `mdl_assigrad_mai_ix` (`mailed`),
  KEY `mdl_assigrad_ass_ix` (`assignment`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Grading information about a single assignment submission.' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_assign_plugin_config`
--

CREATE TABLE IF NOT EXISTS `mdl_assign_plugin_config` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `assignment` bigint(10) NOT NULL DEFAULT '0',
  `plugin` varchar(28) NOT NULL DEFAULT '',
  `subtype` varchar(28) NOT NULL DEFAULT '',
  `name` varchar(28) NOT NULL DEFAULT '',
  `value` longtext,
  PRIMARY KEY (`id`),
  KEY `mdl_assiplugconf_plu_ix` (`plugin`),
  KEY `mdl_assiplugconf_sub_ix` (`subtype`),
  KEY `mdl_assiplugconf_nam_ix` (`name`),
  KEY `mdl_assiplugconf_ass_ix` (`assignment`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Config data for an instance of a plugin in an assignment.' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_assign_submission`
--

CREATE TABLE IF NOT EXISTS `mdl_assign_submission` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `assignment` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `timecreated` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `status` varchar(10) DEFAULT NULL,
  `groupid` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_assisubm_use_ix` (`userid`),
  KEY `mdl_assisubm_ass_ix` (`assignment`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='This table keeps information about student interactions with' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_assign_user_mapping`
--

CREATE TABLE IF NOT EXISTS `mdl_assign_user_mapping` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `assignment` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_assiusermapp_ass_ix` (`assignment`),
  KEY `mdl_assiusermapp_use_ix` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Map an assignment specific id number to a user' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_attendance_log`
--

CREATE TABLE IF NOT EXISTS `mdl_attendance_log` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `sessionid` bigint(10) NOT NULL DEFAULT '0',
  `studentid` bigint(10) NOT NULL DEFAULT '0',
  `statusid` bigint(10) NOT NULL DEFAULT '0',
  `statusset` varchar(100) DEFAULT NULL,
  `timetaken` bigint(10) NOT NULL DEFAULT '0',
  `takenby` bigint(10) NOT NULL DEFAULT '0',
  `remarks` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_attelog_ses_ix` (`sessionid`),
  KEY `mdl_attelog_stu_ix` (`studentid`),
  KEY `mdl_attelog_sta_ix` (`statusid`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='attendance_log table retrofitted from MySQL' AUTO_INCREMENT=18 ;

--
-- Dumping data for table `mdl_attendance_log`
--

INSERT INTO `mdl_attendance_log` (`id`, `sessionid`, `studentid`, `statusid`, `statusset`, `timetaken`, `takenby`, `remarks`) VALUES
(1, 10, 4, 5, '5,6,7,8', 1365626182, 2, ''),
(2, 11, 3, 5, '5,6,7,8', 1365626206, 2, ''),
(3, 11, 4, 8, '5,6,7,8', 1365626206, 2, ''),
(4, 12, 4, 7, '5,6,7,8', 1365626253, 2, ''),
(5, 14, 4, 9, '9,10,11,12', 1365626343, 2, ''),
(6, 15, 3, 10, '9,10,11,12', 1365654066, 2, ''),
(7, 15, 4, 10, '9,10,11,12', 1365654066, 2, ''),
(8, 16, 3, 9, '9,10,11,12', 1365654098, 2, ''),
(9, 16, 4, 9, '9,10,11,12', 1365654098, 2, ''),
(10, 17, 3, 13, '13,14,15,16', 1365654365, 2, ''),
(11, 17, 4, 13, '13,14,15,16', 1365654365, 2, ''),
(12, 18, 3, 14, '13,14,15,16', 1365654398, 2, ''),
(13, 18, 4, 14, '13,14,15,16', 1365654398, 2, ''),
(14, 19, 3, 14, '13,14,15,16', 1365654423, 2, ''),
(15, 19, 4, 13, '13,14,15,16', 1365654423, 2, ''),
(16, 29, 12, 17, '17,18,19,20', 1365654453, 2, ''),
(17, 29, 4, 17, '17,18,19,20', 1365654453, 2, '');

-- --------------------------------------------------------

--
-- Table structure for table `mdl_attendance_sessions`
--

CREATE TABLE IF NOT EXISTS `mdl_attendance_sessions` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `attendanceid` bigint(10) NOT NULL DEFAULT '0',
  `groupid` bigint(10) NOT NULL DEFAULT '0',
  `sessdate` bigint(10) NOT NULL DEFAULT '0',
  `duration` bigint(10) NOT NULL DEFAULT '0',
  `lasttaken` bigint(10) DEFAULT NULL,
  `lasttakenby` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) DEFAULT NULL,
  `description` longtext NOT NULL,
  `descriptionformat` tinyint(2) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_attesess_att_ix` (`attendanceid`),
  KEY `mdl_attesess_gro_ix` (`groupid`),
  KEY `mdl_attesess_ses_ix` (`sessdate`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='attendance_sessions table retrofitted from MySQL' AUTO_INCREMENT=39 ;

--
-- Dumping data for table `mdl_attendance_sessions`
--

INSERT INTO `mdl_attendance_sessions` (`id`, `attendanceid`, `groupid`, `sessdate`, `duration`, `lasttaken`, `lasttakenby`, `timemodified`, `description`, `descriptionformat`) VALUES
(9, 3, 0, 1365626100, 0, NULL, 0, 1365626126, '', 1),
(10, 3, 0, 1365712500, 0, 1365626182, 2, 1365626126, '', 1),
(11, 3, 0, 1365798900, 0, 1365626206, 2, 1365626126, '', 1),
(12, 3, 0, 1365885300, 0, 1365626253, 2, 1365626126, '', 1),
(13, 4, 0, 1365626100, 0, NULL, 0, 1365626315, '', 1),
(14, 4, 0, 1365712500, 0, 1365626343, 2, 1365626315, '', 1),
(15, 4, 0, 1365798900, 0, 1365654066, 2, 1365626315, '', 1),
(16, 4, 0, 1365885300, 0, 1365654098, 2, 1365626315, '', 1),
(17, 5, 0, 1365654000, 0, 1365654365, 2, 1365654304, '', 1),
(18, 5, 0, 1365740400, 0, 1365654398, 2, 1365654304, '', 1),
(19, 5, 0, 1365826800, 0, 1365654423, 2, 1365654304, '', 1),
(20, 5, 0, 1365999600, 0, NULL, 0, 1365654304, '', 1),
(21, 5, 0, 1366086000, 0, NULL, 0, 1365654304, '', 1),
(22, 5, 0, 1366172400, 0, NULL, 0, 1365654304, '', 1),
(23, 5, 0, 1366258800, 0, NULL, 0, 1365654304, '', 1),
(24, 5, 0, 1366345200, 0, NULL, 0, 1365654304, '', 1),
(25, 5, 0, 1366431600, 0, NULL, 0, 1365654304, '', 1),
(26, 5, 0, 1366604400, 0, NULL, 0, 1365654304, '', 1),
(27, 5, 0, 1366690800, 0, NULL, 0, 1365654304, '', 1),
(28, 6, 0, 1365654300, 0, NULL, 0, 1365654377, '', 1),
(29, 6, 0, 1365740700, 0, 1365654453, 2, 1365654377, '', 1),
(30, 6, 0, 1365827100, 0, NULL, 0, 1365654377, '', 1),
(31, 6, 0, 1365999900, 0, NULL, 0, 1365654377, '', 1),
(32, 6, 0, 1366086300, 0, NULL, 0, 1365654377, '', 1),
(33, 6, 0, 1366172700, 0, NULL, 0, 1365654377, '', 1),
(34, 6, 0, 1366259100, 0, NULL, 0, 1365654377, '', 1),
(35, 6, 0, 1366345500, 0, NULL, 0, 1365654377, '', 1),
(36, 6, 0, 1366431900, 0, NULL, 0, 1365654377, '', 1),
(37, 6, 0, 1366604700, 0, NULL, 0, 1365654377, '', 1),
(38, 6, 0, 1366691100, 0, NULL, 0, 1365654377, '', 1);

-- --------------------------------------------------------

--
-- Table structure for table `mdl_attendance_statuses`
--

CREATE TABLE IF NOT EXISTS `mdl_attendance_statuses` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `attendanceid` bigint(10) NOT NULL DEFAULT '0',
  `acronym` varchar(2) NOT NULL DEFAULT '',
  `description` varchar(30) NOT NULL DEFAULT '',
  `grade` smallint(3) NOT NULL DEFAULT '0',
  `visible` tinyint(1) NOT NULL DEFAULT '1',
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_attestat_att_ix` (`attendanceid`),
  KEY `mdl_attestat_vis_ix` (`visible`),
  KEY `mdl_attestat_del_ix` (`deleted`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='attendance_statuses table retrofitted from MySQL' AUTO_INCREMENT=21 ;

--
-- Dumping data for table `mdl_attendance_statuses`
--

INSERT INTO `mdl_attendance_statuses` (`id`, `attendanceid`, `acronym`, `description`, `grade`, `visible`, `deleted`) VALUES
(1, 0, 'P', 'Present', 2, 1, 0),
(2, 0, 'A', 'Absent', 0, 1, 0),
(3, 0, 'L', 'Late', 0, 1, 0),
(4, 0, 'E', 'Excused', 0, 1, 0),
(5, 3, 'P', 'Present', 2, 1, 0),
(6, 3, 'A', 'Absent', 0, 1, 0),
(7, 3, 'L', 'Late', 0, 1, 0),
(8, 3, 'E', 'Excused', 0, 1, 0),
(9, 4, 'P', 'Present', 2, 1, 0),
(10, 4, 'A', 'Absent', 0, 1, 0),
(11, 4, 'L', 'Late', 0, 1, 0),
(12, 4, 'E', 'Excused', 0, 1, 0),
(13, 5, 'P', 'Present', 2, 1, 0),
(14, 5, 'A', 'Absent', 0, 1, 0),
(15, 5, 'L', 'Late', 0, 1, 0),
(16, 5, 'E', 'Excused', 0, 1, 0),
(17, 6, 'P', 'Present', 2, 1, 0),
(18, 6, 'A', 'Absent', 0, 1, 0),
(19, 6, 'L', 'Late', 0, 1, 0),
(20, 6, 'E', 'Excused', 0, 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `mdl_attforblock`
--

CREATE TABLE IF NOT EXISTS `mdl_attforblock` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `course` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) DEFAULT NULL,
  `grade` bigint(10) NOT NULL DEFAULT '100',
  PRIMARY KEY (`id`),
  KEY `mdl_attf_cou_ix` (`course`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Module for support Attendances' AUTO_INCREMENT=7 ;

--
-- Dumping data for table `mdl_attforblock`
--

INSERT INTO `mdl_attforblock` (`id`, `course`, `name`, `grade`) VALUES
(3, 5, 'Attendance', 100),
(4, 5, 'Attendance', 100),
(5, 5, 'Attendance', 100),
(6, 6, 'Attendance', 100);

-- --------------------------------------------------------

--
-- Table structure for table `mdl_backup_controllers`
--

CREATE TABLE IF NOT EXISTS `mdl_backup_controllers` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `backupid` varchar(32) NOT NULL DEFAULT '',
  `operation` varchar(20) NOT NULL DEFAULT 'backup',
  `type` varchar(10) NOT NULL DEFAULT '',
  `itemid` bigint(10) NOT NULL,
  `format` varchar(20) NOT NULL DEFAULT '',
  `interactive` smallint(4) NOT NULL,
  `purpose` smallint(4) NOT NULL,
  `userid` bigint(10) NOT NULL,
  `status` smallint(4) NOT NULL,
  `execution` smallint(4) NOT NULL,
  `executiontime` bigint(10) NOT NULL,
  `checksum` varchar(32) NOT NULL DEFAULT '',
  `timecreated` bigint(10) NOT NULL,
  `timemodified` bigint(10) NOT NULL,
  `controller` longtext NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_backcont_bac_uix` (`backupid`),
  KEY `mdl_backcont_typite_ix` (`type`,`itemid`),
  KEY `mdl_backcont_use_ix` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='To store the backup_controllers as they are used' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_backup_courses`
--

CREATE TABLE IF NOT EXISTS `mdl_backup_courses` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `courseid` bigint(10) NOT NULL DEFAULT '0',
  `laststarttime` bigint(10) NOT NULL DEFAULT '0',
  `lastendtime` bigint(10) NOT NULL DEFAULT '0',
  `laststatus` varchar(1) NOT NULL DEFAULT '0',
  `nextstarttime` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_backcour_cou_uix` (`courseid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='To store every course backup status' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_backup_files_template`
--

CREATE TABLE IF NOT EXISTS `mdl_backup_files_template` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `backupid` varchar(32) NOT NULL DEFAULT '',
  `contextid` bigint(10) NOT NULL,
  `component` varchar(100) NOT NULL DEFAULT '',
  `filearea` varchar(50) NOT NULL DEFAULT '',
  `itemid` bigint(10) NOT NULL,
  `info` longtext,
  `newcontextid` bigint(10) DEFAULT NULL,
  `newitemid` bigint(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_backfiletemp_bacconcomf_ix` (`backupid`,`contextid`,`component`,`filearea`,`itemid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='To store files along the backup process. Note this table isn' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_backup_ids_template`
--

CREATE TABLE IF NOT EXISTS `mdl_backup_ids_template` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `backupid` varchar(32) NOT NULL DEFAULT '',
  `itemname` varchar(160) NOT NULL DEFAULT '',
  `itemid` bigint(10) NOT NULL,
  `newitemid` bigint(10) NOT NULL DEFAULT '0',
  `parentitemid` bigint(10) DEFAULT NULL,
  `info` longtext,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_backidstemp_baciteite_uix` (`backupid`,`itemname`,`itemid`),
  KEY `mdl_backidstemp_bacitepar_ix` (`backupid`,`itemname`,`parentitemid`),
  KEY `mdl_backidstemp_bacitenew_ix` (`backupid`,`itemname`,`newitemid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='To store all sort of ids along the backup process. Note this' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_backup_logs`
--

CREATE TABLE IF NOT EXISTS `mdl_backup_logs` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `backupid` varchar(32) NOT NULL DEFAULT '',
  `loglevel` smallint(4) NOT NULL,
  `message` varchar(255) NOT NULL DEFAULT '',
  `timecreated` bigint(10) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_backlogs_bacid_uix` (`backupid`,`id`),
  KEY `mdl_backlogs_bac_ix` (`backupid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='To store all the logs from backup and restore operations (by' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_block`
--

CREATE TABLE IF NOT EXISTS `mdl_block` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(40) NOT NULL DEFAULT '',
  `version` bigint(10) NOT NULL DEFAULT '0',
  `cron` bigint(10) NOT NULL DEFAULT '0',
  `lastcron` bigint(10) NOT NULL DEFAULT '0',
  `visible` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_bloc_nam_uix` (`name`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='contains all installed blocks' AUTO_INCREMENT=39 ;

--
-- Dumping data for table `mdl_block`
--

INSERT INTO `mdl_block` (`id`, `name`, `version`, `cron`, `lastcron`, `visible`) VALUES
(1, 'activity_modules', 2012112900, 0, 0, 1),
(2, 'admin_bookmarks', 2012112900, 0, 0, 1),
(3, 'blog_menu', 2012112900, 0, 0, 1),
(4, 'blog_recent', 2012112900, 0, 0, 1),
(5, 'blog_tags', 2012112900, 0, 0, 1),
(6, 'calendar_month', 2012112900, 0, 0, 1),
(7, 'calendar_upcoming', 2012112900, 0, 0, 1),
(8, 'comments', 2012112900, 0, 0, 1),
(9, 'community', 2012112900, 0, 0, 1),
(10, 'completionstatus', 2012112901, 0, 0, 1),
(11, 'course_list', 2012112900, 0, 0, 1),
(12, 'course_overview', 2012121000, 0, 0, 1),
(13, 'course_summary', 2012112901, 0, 0, 1),
(14, 'feedback', 2012112900, 0, 0, 0),
(15, 'glossary_random', 2012112902, 0, 0, 1),
(16, 'html', 2012112900, 0, 0, 1),
(17, 'login', 2012112900, 0, 0, 1),
(18, 'mentees', 2012112902, 0, 0, 1),
(19, 'messages', 2012112900, 0, 0, 1),
(20, 'mnet_hosts', 2012112900, 0, 0, 1),
(21, 'myprofile', 2012112900, 0, 0, 1),
(22, 'navigation', 2012112901, 0, 0, 1),
(23, 'news_items', 2012112902, 0, 0, 1),
(24, 'online_users', 2012112902, 0, 0, 1),
(25, 'participants', 2012112900, 0, 0, 1),
(26, 'private_files', 2012112900, 0, 0, 1),
(27, 'quiz_results', 2012112900, 0, 0, 1),
(28, 'recent_activity', 2012112900, 0, 0, 1),
(29, 'rss_client', 2012112900, 300, 0, 1),
(30, 'search_forums', 2012112900, 0, 0, 1),
(31, 'section_links', 2012112900, 0, 0, 1),
(32, 'selfcompletion', 2012112901, 0, 0, 1),
(33, 'settings', 2012112900, 0, 0, 1),
(34, 'site_main_menu', 2012112900, 0, 0, 1),
(35, 'social_activities', 2012112900, 0, 0, 1),
(36, 'tag_flickr', 2012112900, 0, 0, 1),
(37, 'tag_youtube', 2012112900, 0, 0, 1),
(38, 'tags', 2012112900, 0, 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `mdl_block_community`
--

CREATE TABLE IF NOT EXISTS `mdl_block_community` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `userid` bigint(10) NOT NULL,
  `coursename` varchar(255) NOT NULL DEFAULT '',
  `coursedescription` longtext,
  `courseurl` varchar(255) NOT NULL DEFAULT '',
  `imageurl` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Community block' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_block_instances`
--

CREATE TABLE IF NOT EXISTS `mdl_block_instances` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `blockname` varchar(40) NOT NULL DEFAULT '',
  `parentcontextid` bigint(10) NOT NULL,
  `showinsubcontexts` smallint(4) NOT NULL,
  `pagetypepattern` varchar(64) NOT NULL DEFAULT '',
  `subpagepattern` varchar(16) DEFAULT NULL,
  `defaultregion` varchar(16) NOT NULL DEFAULT '',
  `defaultweight` bigint(10) NOT NULL,
  `configdata` longtext,
  PRIMARY KEY (`id`),
  KEY `mdl_blocinst_parshopagsub_ix` (`parentcontextid`,`showinsubcontexts`,`pagetypepattern`,`subpagepattern`),
  KEY `mdl_blocinst_par_ix` (`parentcontextid`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='This table stores block instances. The type of block this is' AUTO_INCREMENT=30 ;

--
-- Dumping data for table `mdl_block_instances`
--

INSERT INTO `mdl_block_instances` (`id`, `blockname`, `parentcontextid`, `showinsubcontexts`, `pagetypepattern`, `subpagepattern`, `defaultregion`, `defaultweight`, `configdata`) VALUES
(1, 'site_main_menu', 2, 0, 'site-index', NULL, 'side-pre', 0, ''),
(2, 'course_summary', 2, 0, 'site-index', NULL, 'side-post', 0, ''),
(3, 'calendar_month', 2, 0, 'site-index', NULL, 'side-post', 1, ''),
(4, 'navigation', 1, 1, '*', NULL, 'side-pre', 0, ''),
(5, 'settings', 1, 1, '*', NULL, 'side-pre', 1, ''),
(6, 'admin_bookmarks', 1, 0, 'admin-*', NULL, 'side-pre', 0, ''),
(7, 'private_files', 1, 0, 'my-index', '2', 'side-post', 0, ''),
(8, 'online_users', 1, 0, 'my-index', '2', 'side-post', 1, ''),
(9, 'course_overview', 1, 0, 'my-index', '2', 'content', 0, ''),
(22, 'search_forums', 43, 0, 'course-view-*', NULL, 'side-post', 0, ''),
(23, 'news_items', 43, 0, 'course-view-*', NULL, 'side-post', 1, ''),
(24, 'calendar_upcoming', 43, 0, 'course-view-*', NULL, 'side-post', 2, ''),
(25, 'recent_activity', 43, 0, 'course-view-*', NULL, 'side-post', 3, ''),
(26, 'search_forums', 53, 0, 'course-view-*', NULL, 'side-post', 0, ''),
(27, 'news_items', 53, 0, 'course-view-*', NULL, 'side-post', 1, ''),
(28, 'calendar_upcoming', 53, 0, 'course-view-*', NULL, 'side-post', 2, ''),
(29, 'recent_activity', 53, 0, 'course-view-*', NULL, 'side-post', 3, '');

-- --------------------------------------------------------

--
-- Table structure for table `mdl_block_positions`
--

CREATE TABLE IF NOT EXISTS `mdl_block_positions` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `blockinstanceid` bigint(10) NOT NULL,
  `contextid` bigint(10) NOT NULL,
  `pagetype` varchar(64) NOT NULL DEFAULT '',
  `subpage` varchar(16) NOT NULL DEFAULT '',
  `visible` smallint(4) NOT NULL,
  `region` varchar(16) NOT NULL DEFAULT '',
  `weight` bigint(10) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_blocposi_bloconpagsub_uix` (`blockinstanceid`,`contextid`,`pagetype`,`subpage`),
  KEY `mdl_blocposi_blo_ix` (`blockinstanceid`),
  KEY `mdl_blocposi_con_ix` (`contextid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Stores the position of a sticky block_instance on a another ' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_block_rss_client`
--

CREATE TABLE IF NOT EXISTS `mdl_block_rss_client` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `title` longtext NOT NULL,
  `preferredtitle` varchar(64) NOT NULL DEFAULT '',
  `description` longtext NOT NULL,
  `shared` tinyint(2) NOT NULL DEFAULT '0',
  `url` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Remote news feed information. Contains the news feed id, the' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_blog_association`
--

CREATE TABLE IF NOT EXISTS `mdl_blog_association` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `contextid` bigint(10) NOT NULL,
  `blogid` bigint(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_blogasso_con_ix` (`contextid`),
  KEY `mdl_blogasso_blo_ix` (`blogid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Associations of blog entries with courses and module instanc' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_blog_external`
--

CREATE TABLE IF NOT EXISTS `mdl_blog_external` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `userid` bigint(10) NOT NULL,
  `name` varchar(255) NOT NULL DEFAULT '',
  `description` longtext,
  `url` longtext NOT NULL,
  `filtertags` varchar(255) DEFAULT NULL,
  `failedlastsync` tinyint(1) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) DEFAULT NULL,
  `timefetched` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_blogexte_use_ix` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='External blog links used for RSS copying of blog entries to ' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_book`
--

CREATE TABLE IF NOT EXISTS `mdl_book` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `course` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `intro` longtext,
  `introformat` smallint(4) NOT NULL DEFAULT '0',
  `numbering` smallint(4) NOT NULL DEFAULT '0',
  `customtitles` tinyint(2) NOT NULL DEFAULT '0',
  `revision` bigint(10) NOT NULL DEFAULT '0',
  `timecreated` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Defines book' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_book_chapters`
--

CREATE TABLE IF NOT EXISTS `mdl_book_chapters` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `bookid` bigint(10) NOT NULL DEFAULT '0',
  `pagenum` bigint(10) NOT NULL DEFAULT '0',
  `subchapter` bigint(10) NOT NULL DEFAULT '0',
  `title` varchar(255) NOT NULL DEFAULT '',
  `content` longtext NOT NULL,
  `contentformat` smallint(4) NOT NULL DEFAULT '0',
  `hidden` tinyint(2) NOT NULL DEFAULT '0',
  `timecreated` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `importsrc` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Defines book_chapters' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_cache_filters`
--

CREATE TABLE IF NOT EXISTS `mdl_cache_filters` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `filter` varchar(32) NOT NULL DEFAULT '',
  `version` bigint(10) NOT NULL DEFAULT '0',
  `md5key` varchar(32) NOT NULL DEFAULT '',
  `rawtext` longtext NOT NULL,
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_cachfilt_filmd5_ix` (`filter`,`md5key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='For keeping information about cached data' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_cache_flags`
--

CREATE TABLE IF NOT EXISTS `mdl_cache_flags` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `flagtype` varchar(255) NOT NULL DEFAULT '',
  `name` varchar(255) NOT NULL DEFAULT '',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `value` longtext NOT NULL,
  `expiry` bigint(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_cachflag_fla_ix` (`flagtype`),
  KEY `mdl_cachflag_nam_ix` (`name`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Cache of time-sensitive flags' AUTO_INCREMENT=33 ;

--
-- Dumping data for table `mdl_cache_flags`
--

INSERT INTO `mdl_cache_flags` (`id`, `flagtype`, `name`, `timemodified`, `value`, `expiry`) VALUES
(1, 'userpreferenceschanged', '2', 1365449937, '1', 1365457137),
(2, 'accesslib/dirtycontexts', '/1/3/15', 1365625738, '1', 1365632938),
(3, 'userpreferenceschanged', '3', 1365531073, '1', 1365538273),
(4, 'userpreferenceschanged', '4', 1365531135, '1', 1365538335),
(5, 'userpreferenceschanged', '5', 1365531522, '1', 1365538722),
(6, 'accesslib/dirtycontexts', '/1/3/26', 1365625723, '1', 1365632923),
(7, 'accesslib/dirtycontexts', '/1/3/31', 1365625708, '1', 1365632908),
(8, 'accesslib/dirtycontexts', '/1/3/31/32', 1365625706, '1', 1365632906),
(9, 'accesslib/dirtycontexts', '/1/3/31/33', 1365625706, '1', 1365632906),
(10, 'accesslib/dirtycontexts', '/1/3/31/34', 1365625706, '1', 1365632906),
(11, 'accesslib/dirtycontexts', '/1/3/31/35', 1365625706, '1', 1365632906),
(12, 'accesslib/dirtycontexts', '/1/3/31/37', 1365625707, '1', 1365632907),
(13, 'accesslib/dirtycontexts', '/1/3/31/38', 1365625707, '1', 1365632907),
(14, 'accesslib/dirtycontexts', '/1/3/31/41', 1365625707, '1', 1365632907),
(15, 'accesslib/dirtycontexts', '/1/3/26/27', 1365625723, '1', 1365632923),
(16, 'accesslib/dirtycontexts', '/1/3/26/28', 1365625723, '1', 1365632923),
(17, 'accesslib/dirtycontexts', '/1/3/26/29', 1365625723, '1', 1365632923),
(18, 'accesslib/dirtycontexts', '/1/3/26/30', 1365625723, '1', 1365632923),
(19, 'accesslib/dirtycontexts', '/1/3/26/40', 1365625723, '1', 1365632923),
(20, 'accesslib/dirtycontexts', '/1/3/26/36', 1365625723, '1', 1365632923),
(21, 'accesslib/dirtycontexts', '/1/3/26/39', 1365625723, '1', 1365632923),
(22, 'accesslib/dirtycontexts', '/1/3/26/42', 1365625723, '1', 1365632923),
(23, 'accesslib/dirtycontexts', '/1/3/15/16', 1365625738, '1', 1365632938),
(24, 'accesslib/dirtycontexts', '/1/3/15/17', 1365625738, '1', 1365632938),
(25, 'accesslib/dirtycontexts', '/1/3/15/18', 1365625738, '1', 1365632938),
(26, 'accesslib/dirtycontexts', '/1/3/15/19', 1365625738, '1', 1365632938),
(27, 'accesslib/dirtycontexts', '/1/3/15/23', 1365625738, '1', 1365632938),
(28, 'accesslib/dirtycontexts', '/1/3/15/24', 1365625738, '1', 1365632938),
(29, 'accesslib/dirtycontexts', '/1/3/15/25', 1365625738, '1', 1365632938),
(30, 'accesslib/dirtycontexts', '/1/3/43', 1365625803, '1', 1365633003),
(31, 'accesslib/dirtycontexts', '/1/3/43/49', 1365625921, '1', 1365633121),
(32, 'accesslib/dirtycontexts', '/1/3/53', 1365654289, '1', 1365661489);

-- --------------------------------------------------------

--
-- Table structure for table `mdl_cache_text`
--

CREATE TABLE IF NOT EXISTS `mdl_cache_text` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `md5key` varchar(32) NOT NULL DEFAULT '',
  `formattedtext` longtext NOT NULL,
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_cachtext_md5_ix` (`md5key`),
  KEY `mdl_cachtext_tim_ix` (`timemodified`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='For storing temporary copies of processed texts' AUTO_INCREMENT=173 ;

--
-- Dumping data for table `mdl_cache_text`
--

INSERT INTO `mdl_cache_text` (`id`, `md5key`, `formattedtext`, `timemodified`) VALUES
(1, '7088784e04c075cc90016a72cf938cb2', '<p>When players are enabled in these settings, files can be embedded using the media filter (if enabled) or using a File or URL resources with the Embed option. When not enabled, these formats are not embedded and users can manually download or follow links to these resources.</p>\n\n<p>Where two players support the same format, enabling both increases compatibility across different devices such as mobile phones. It is possible to increase compatibility further by providing multiple files in different formats for a single audio or video clip.</p>\n', 1365625687),
(2, '095c8653214c00bf83ca89c7eb23e6eb', '<p>When players are enabled in these settings, files can be embedded using the media filter (if enabled) or using a File or URL resources with the Embed option. When not enabled, these formats are not embedded and users can manually download or follow links to these resources.</p>\n\n<p>Where two players support the same format, enabling both increases compatibility across different devices such as mobile phones. It is possible to increase compatibility further by providing multiple files in different formats for a single audio or video clip.</p>\n', 1365625755),
(3, 'aea93396646cd03d24184af38ff8c3a2', '<p>When players are enabled in these settings, files can be embedded using the media filter (if enabled) or using a File or URL resources with the Embed option. When not enabled, these formats are not embedded and users can manually download or follow links to these resources.</p>\n\n<p>Where two players support the same format, enabling both increases compatibility across different devices such as mobile phones. It is possible to increase compatibility further by providing multiple files in different formats for a single audio or video clip.</p>\n', 1365620788),
(4, '8d6d3d12a562c2bbec012713441740de', '<p>When players are enabled in these settings, files can be embedded using the media filter (if enabled) or using a File or URL resources with the Embed option. When not enabled, these formats are not embedded and users can manually download or follow links to these resources.</p>\n\n<p>Where two players support the same format, enabling both increases compatibility across different devices such as mobile phones. It is possible to increase compatibility further by providing multiple files in different formats for a single audio or video clip.</p>\n', 1365625818),
(5, '9619fe44badf08ecdad6a545a1c42121', '<p>The assignment activity module enables a teacher to communicate tasks, collect work and provide grades and feedback.</p>\n\n<p>Students can submit any digital content (files), such as word-processed documents, spreadsheets, images, or audio and video clips. Alternatively, or in addition, the assignment may require students to type text directly into the text editor. An assignment can also be used to remind students of ''real-world'' assignments they need to complete offline, such as art work, and thus not require any digital content. Students can submit work individually or as a member of a group.</p>\n\n<p>When reviewing assignments, teachers can leave feedback comments and upload files, such as marked-up student submissions, documents with comments or spoken audio feedback. Assignments can be graded using a numerical or custom scale or an advanced grading method such as a rubric. Final grades are recorded in the gradebook.</p>\n\n<div class="helpdoclink"><a href="http://docs.moodle.org/24/en/mod/assignment/view" class="helplinkpopup"><img class="iconhelp icon-pre" alt="More help" title="More help" src="http://localhost/moodle243/theme/image.php/standard/core/1365530675/docs" />More help</a></div>\n', 1365620840),
(6, '32763eea66e8b6be6f7044702d29d624', '<p>There is currently no help associated with this resource or activity</p>\n', 1365620840),
(7, 'ed9731eaaee1443b681f4f6798cf02e6', '<p>The chat activity module enables participants to have text-based, real-time synchronous discussions.</p>\n\n<p>The chat may be a one-time activity or it may be repeated at the same time each day or each week. Chat sessions are saved and can be made available for everyone to view or restricted to users with the capability to view chat session logs.</p>\n\n<p>Chats are especially useful when the group chatting is not able to meet face-to-face, such as</p>\n\n<ul><li>Regular meetings of students participating in online courses to enable them to share experiences with others in the same course but in a different location</li>\n<li>A student temporarily unable to attend in person chatting with their teacher to catch up with work</li>\n<li>Students out on work experience getting together to discuss their experiences with each other and their teacher</li>\n<li>Younger children using chat at home in the evenings as a controlled (monitored) introduction to the world of social networking</li>\n<li>A question and answer session with an invited speaker in a different location</li>\n<li>Sessions to help students prepare for tests where the teacher, or other students, would pose sample questions</li>\n</ul><div class="helpdoclink"><a href="http://docs.moodle.org/24/en/mod/chat/view" class="helplinkpopup"><img class="iconhelp icon-pre" alt="More help" title="More help" src="http://localhost/moodle243/theme/image.php/standard/core/1365530675/docs" />More help</a></div>\n', 1365620840),
(8, 'd0f65729db6ce9ea262160668b90a5ba', '<p>The choice activity module enables a teacher to ask a single question and offer a selection of possible responses.</p>\n\n<p>Choice results may be published after students have answered, after a certain date, or not at all. Results may be published with student names or anonymously.</p>\n\n<p>A choice activity may be used</p>\n\n<ul><li>As a quick poll to stimulate thinking about a topic</li>\n<li>To quickly test students'' understanding</li>\n<li>To facilitate student decision-making, for example allowing students to vote on a direction for the course</li>\n</ul><div class="helpdoclink"><a href="http://docs.moodle.org/24/en/mod/choice/view" class="helplinkpopup"><img class="iconhelp icon-pre" alt="More help" title="More help" src="http://localhost/moodle243/theme/image.php/standard/core/1365530675/docs" />More help</a></div>\n', 1365620840),
(9, '0c5f8cfe448e4b32d10f69eb389165bf', '<p>The database activity module enables participants to create, maintain and search a collection of entries (i.e. records).  The structure of the entries is defined by the teacher as a number of fields. Field types include checkbox, radio buttons, dropdown menu, text area, URL, picture and uploaded file.</p>\n\n<p>The visual layout of information when listing, viewing or editing database entries may be controlled by database templates. Database activities may be shared between courses as presets and a teacher may also import and export database entries.</p>\n\n<p>If the database auto-linking filter is enabled, any entries in a database will be automatically linked where the words or phrases appear within the course.</p>\n\n<p>A teacher can allow comments on entries. Entries can also be rated by teachers or students (peer evaluation). Ratings can be aggregated to form a final grade which is recorded in the gradebook.</p>\n\n<p>Database activities have many uses, such as</p>\n\n<ul><li>A collaborative collection of web links, books, book reviews, journal references etc</li>\n<li>For displaying student-created photos, posters, websites or poems for peer comment and review</li>\n</ul><div class="helpdoclink"><a href="http://docs.moodle.org/24/en/mod/data/view" class="helplinkpopup"><img class="iconhelp icon-pre" alt="More help" title="More help" src="http://localhost/moodle243/theme/image.php/standard/core/1365530675/docs" />More help</a></div>\n', 1365620840),
(10, '2b75d7ecb78272d9b85ce5b425cd0551', '<p>The external tool activity module enables students to interact with learning resources and activities on other web sites. For example, an external tool could provide access to a new activity type or learning materials from a publisher.</p>\n\n<p>To create an external tool activity, a tool provider which supports LTI (Learning Tools Interoperability) is required. A teacher can create an external tool activity or make use of a tool configured by the site administrator.</p>\n\n<p>External tool activities differ from URL resources in a few ways:</p>\n\n<ul><li>External tools are context aware i.e. they have access to information about the user who launched the tool, such as institution, course and name</li>\n<li>External tools support reading, updating, and deleting grades associated with the activity instance</li>\n<li>External tool configurations create a trust relationship between your site and the tool provider, allowing secure communication between them</li>\n</ul><div class="helpdoclink"><a href="http://docs.moodle.org/24/en/mod/lti/view" class="helplinkpopup"><img class="iconhelp icon-pre" alt="More help" title="More help" src="http://localhost/moodle243/theme/image.php/standard/core/1365530675/docs" />More help</a></div>\n', 1365620840),
(11, 'a8e02b4b02f5d8481e567f295417700e', '<p>The forum activity module enables participants to have asynchronous discussions i.e. discussions that take place over an extended period of time.</p>\n\n<p>There are several forum types to choose from, such as a standard forum where anyone can start a new discussion at any time; a forum where each student can post exactly one discussion; or a question and answer forum where students must first post before being able to view other students'' posts. A teacher can allow files to be attached to forum posts. Attached images are displayed in the forum post.</p>\n\n<p>Participants can subscribe to a forum to receive notifications of new forum posts. A teacher can set the subscription mode to optional, forced or auto, or prevent subscription completely. If required, students can be blocked from posting more than a given number of posts in a given time period; this can prevent individuals from dominating discussions.</p>\n\n<p>Forum posts can be rated by teachers or students (peer evaluation). Ratings can be aggregated to form a final grade which is recorded in the gradebook.</p>\n\n<p>Forums have many uses, such as</p>\n\n<ul><li>A social space for students to get to know each other</li>\n<li>For course announcements (using a news forum with forced subscription)</li>\n<li>For discussing course content or reading materials</li>\n<li>For continuing online an issue raised previously in a face-to-face session</li>\n<li>For teacher-only discussions (using a hidden forum)</li>\n<li>A help centre where tutors and students can give advice</li>\n<li>A one-on-one support area for private student-teacher communications (using a forum with separate groups and with one student per group)</li>\n<li>For extension activities, for example ‘brain teasers’ for students to ponder and suggest solutions to</li>\n</ul><div class="helpdoclink"><a href="http://docs.moodle.org/24/en/mod/forum/view" class="helplinkpopup"><img class="iconhelp icon-pre" alt="More help" title="More help" src="http://localhost/moodle243/theme/image.php/standard/core/1365530675/docs" />More help</a></div>\n', 1365620840),
(12, '16a7c58d924fcc7bed12a832b4a74a4e', '<p>The glossary activity module enables participants to create and maintain a list of definitions, like a dictionary, or to collect and organise resources or information.</p>\n\n<p>A teacher can allow files to be attached to glossary entries. Attached images are displayed in the entry. Entries can be searched or browsed alphabetically or by category, date or author. Entries can be approved by default or require approval by a teacher before they are viewable by everyone.</p>\n\n<p>If the glossary auto-linking filter is enabled, entries will be automatically linked where the concept words and/or phrases appear within the course.</p>\n\n<p>A teacher can allow comments on entries. Entries can also be rated by teachers or students (peer evaluation). Ratings can be aggregated to form a final grade which is recorded in the gradebook.</p>\n\n<p>Glossaries have many uses, such as</p>\n\n<ul><li>A collaborative bank of key terms</li>\n<li>A ‘getting to know you’ space where new students add their name and personal details</li>\n<li>A ‘handy tips’ resource of best practice in a practical subject</li>\n<li>A sharing area of useful videos, images or sound files</li>\n<li>A revision resource of facts to remember</li>\n</ul><div class="helpdoclink"><a href="http://docs.moodle.org/24/en/mod/glossary/view" class="helplinkpopup"><img class="iconhelp icon-pre" alt="More help" title="More help" src="http://localhost/moodle243/theme/image.php/standard/core/1365530675/docs" />More help</a></div>\n', 1365620840),
(13, '8eb2f6df4eb0ebdb38b0c03e76c05ab8', '<p>The lesson activity module enables a teacher to deliver content and/or practice activities in  interesting and flexible ways. A teacher can use the lesson to create a linear set of content pages or instructional activities that offer a variety of paths or options for the learner. In either case, teachers can choose to increase engagement and ensure understanding by including a variety of questions, such as multiple choice, matching and short answer. Depending on the student''s choice of answer and how the teacher develops the lesson, students may progress to the next page, be taken back to a previous page or redirected down a different path entirely.</p>\n\n<p>A lesson may be graded, with the grade recorded in the gradebook.</p>\n\n<p>Lessons may be used</p>\n\n<ul><li>For self-directed learning of a new topic</li>\n<li>For  scenarios or simulations/decision-making exercises</li>\n<li>For differentiated revision, with different sets of revision questions depending upon answers given to initial questions</li>\n</ul><div class="helpdoclink"><a href="http://docs.moodle.org/24/en/mod/lesson/view" class="helplinkpopup"><img class="iconhelp icon-pre" alt="More help" title="More help" src="http://localhost/moodle243/theme/image.php/standard/core/1365530675/docs" />More help</a></div>\n', 1365620840),
(14, '7576720ca58a54777d4c721fad3553ec', '<p>The quiz activity enables a teacher to create quizzes comprising questions of various types, including multiple choice, matching, short-answer and numerical.</p>\n\n<p>The teacher can allow the quiz to be attempted multiple times, with the questions shuffled or randomly selected from the question bank. A time limit may be set.</p>\n\n<p>Each attempt is marked automatically, with the exception of essay questions, and the grade is recorded in the gradebook.</p>\n\n<p>The teacher can choose when and if hints, feedback and correct answers are shown to students.</p>\n\n<p>Quizzes may be used</p>\n\n<ul><li>As course exams</li>\n<li>As mini tests for reading assignments or at the end of a topic</li>\n<li>As exam practice using questions from past exams</li>\n<li>To deliver immediate feedback about performance</li>\n<li>For self-assessment</li>\n</ul><div class="helpdoclink"><a href="http://docs.moodle.org/24/en/mod/quiz/view" class="helplinkpopup"><img class="iconhelp icon-pre" alt="More help" title="More help" src="http://localhost/moodle243/theme/image.php/standard/core/1365530675/docs" />More help</a></div>\n', 1365620840),
(15, '2c2d3c90a8986948d8abf6d5e8e108d4', '<p>A SCORM package is a collection of files which are packaged according to an agreed standard for learning objects. The SCORM activity module enables SCORM or AICC packages to be uploaded as a zip file and added to a course.</p>\n\n<p>Content is usually displayed over several pages, with navigation between the pages. There are various options for displaying content in a pop-up window, with a table of contents, with navigation buttons etc. SCORM activities generally include questions, with grades being recorded in the gradebook.</p>\n\n<p>SCORM activities may be used</p>\n\n<ul><li>For presenting multimedia content and animations</li>\n<li>As an assessment tool</li>\n</ul><div class="helpdoclink"><a href="http://docs.moodle.org/24/en/mod/scorm/view" class="helplinkpopup"><img class="iconhelp icon-pre" alt="More help" title="More help" src="http://localhost/moodle243/theme/image.php/standard/core/1365530675/docs" />More help</a></div>\n', 1365620840),
(16, '8c9a286ace3844569090f9b8957df57b', '<p>The survey activity module provides a number of verified survey instruments that have been found useful in assessing and stimulating learning in online environments. A teacher can use these to gather data from their students that will help them learn about their class and reflect on their own teaching.</p>\n\n<p>Note that these survey tools are pre-populated with questions. Teachers who wish to create their own survey should use the feedback activity module.</p>\n\n<div class="helpdoclink"><a href="http://docs.moodle.org/24/en/mod/survey/view" class="helplinkpopup"><img class="iconhelp icon-pre" alt="More help" title="More help" src="http://localhost/moodle243/theme/image.php/standard/core/1365530675/docs" />More help</a></div>\n', 1365620840),
(17, '64d7b96714f9d81e5ad5f1e88c0dd603', '<p>The wiki activity module enables participants to add and edit a collection of web pages. A wiki can be collaborative, with everyone being able to edit it, or individual, where everyone has their own wiki which only they can edit.</p>\n\n<p>A history of previous versions of each page in the wiki is kept, listing the edits made by each participant.</p>\n\n<p>Wikis have many uses, such as</p>\n\n<ul><li>For group lecture notes or study guides</li>\n<li>For members of a faculty to plan a scheme of work or meeting agenda together</li>\n<li>For students to collaboratively author an online book, creating content on a topic set by their tutor</li>\n<li>For collaborative storytelling or poetry creation, where each participant writes a line or verse</li>\n<li>As a personal journal for examination notes or revision (using an individual wiki)</li>\n</ul><div class="helpdoclink"><a href="http://docs.moodle.org/24/en/mod/wiki/view" class="helplinkpopup"><img class="iconhelp icon-pre" alt="More help" title="More help" src="http://localhost/moodle243/theme/image.php/standard/core/1365530675/docs" />More help</a></div>\n', 1365620840),
(18, 'b9d40a02e52b0ba0daf46cb2eaf3d0b9', '<p>The workshop activity module enables the collection, review and peer assessment of students'' work.</p>\n\n<p>Students can submit any digital content (files), such as word-processed documents or spreadsheets and can also type text directly into a field using the text editor.</p>\n\n<p>Submissions are assessed using a multi-criteria assessment form defined by the teacher. The process of peer assessment and understanding the assessment form can be practised in advance with example submissions provided by the teacher, together with a reference assessment. Students are given the opportunity to assess one or more of their peers'' submissions. Submissions and reviewers may be anonymous if required.</p>\n\n<p>Students obtain two grades in a workshop activity - a grade for their submission and a grade for their assessment of their peers'' submissions. Both grades are recorded in the gradebook.</p>\n\n<div class="helpdoclink"><a href="http://docs.moodle.org/24/en/mod/workshop/view" class="helplinkpopup"><img class="iconhelp icon-pre" alt="More help" title="More help" src="http://localhost/moodle243/theme/image.php/standard/core/1365530675/docs" />More help</a></div>\n', 1365620840),
(19, '80f290f4f0b7dbff33c16ee2bc9df163', '<p>The book module enables a teacher to create a multi-page resource in a book-like format, with chapters and subchapters. Books can contain media files as well as text and are useful for displaying lengthy passages of information which can be broken down into sections.</p>\n\n<p>A book may be used</p>\n\n<ul><li>To display reading material for individual modules of study</li>\n<li>As a staff departmental handbook</li>\n<li>As a showcase portfolio of student work</li>\n</ul><div class="helpdoclink"><a href="http://docs.moodle.org/24/en/mod/book/view" class="helplinkpopup"><img class="iconhelp icon-pre" alt="More help" title="More help" src="http://localhost/moodle243/theme/image.php/standard/core/1365530675/docs" />More help</a></div>\n', 1365620840),
(20, 'ffe71a38fd0591e04e8ae3fd39fc073d', '<p>The file module enables a teacher to provide a file as a course resource. Where possible, the file will be displayed within the course interface; otherwise students will be prompted to download it. The file may include supporting files, for example an HTML page may have embedded images or Flash objects.</p>\n\n<p>Note that students need to have the appropriate software on their computers in order to open the file.</p>\n\n<p>A file may be used</p>\n\n<ul><li>To share presentations given in class</li>\n<li>To include a mini website as a course resource</li>\n<li>To provide draft files of certain software programs (eg Photoshop .psd) so students can edit and submit them for assessment</li>\n</ul><div class="helpdoclink"><a href="http://docs.moodle.org/24/en/mod/resource/view" class="helplinkpopup"><img class="iconhelp icon-pre" alt="More help" title="More help" src="http://localhost/moodle243/theme/image.php/standard/core/1365530675/docs" />More help</a></div>\n', 1365620840),
(21, 'c539972a128c7c8bfb0975b200e95ec1', '<p>The folder module enables a teacher to display a number of related files inside a single folder, reducing scrolling on the course page. A zipped folder may be uploaded and unzipped for display, or an empty folder created and files uploaded into it.</p>\n\n<p>A folder may be used</p>\n\n<ul><li>For a series of files on one topic, for example a set of past examination papers in pdf format or a collection of image files for use in student projects</li>\n<li>To provide a shared uploading space for teachers on the course page (keeping the folder hidden so that only teachers can see it)</li>\n</ul><div class="helpdoclink"><a href="http://docs.moodle.org/24/en/mod/folder/view" class="helplinkpopup"><img class="iconhelp icon-pre" alt="More help" title="More help" src="http://localhost/moodle243/theme/image.php/standard/core/1365530675/docs" />More help</a></div>\n', 1365620840),
(22, '12437da064438ea250a9fc36db9adedb', '<p>An IMS content package is a collection of files which are packaged according to an agreed standard so they can be reused in different systems. The IMS content package module enables such content packages to be uploaded as a zip file and added to a course as a resource.</p>\n\n<p>Content is usually displayed over several pages, with navigation between the pages. There are various options for displaying content in a pop-up window, with a navigation menu or buttons etc.</p>\n\n<p>An IMS content package may be used for presenting multimedia content and animations.</p>\n\n<div class="helpdoclink"><a href="http://docs.moodle.org/24/en/mod/imscp/view" class="helplinkpopup"><img class="iconhelp icon-pre" alt="More help" title="More help" src="http://localhost/moodle243/theme/image.php/standard/core/1365530675/docs" />More help</a></div>\n', 1365620840),
(23, '4861d12b166c33b6af8ffc7cddb68a62', '<p>The label module enables text and multimedia to be inserted into the course page in between links to other resources and activities. Labels are very versatile and can help to improve the appearance of a course if used thoughtfully.</p>\n\n<p>Labels may be used</p>\n\n<ul><li>To split up a long list of activities with a subheading or an image</li>\n<li>To display an embedded sound file or video directly on the course page</li>\n<li>To add a short description to a course section</li>\n</ul><div class="helpdoclink"><a href="http://docs.moodle.org/24/en/mod/label/view" class="helplinkpopup"><img class="iconhelp icon-pre" alt="More help" title="More help" src="http://localhost/moodle243/theme/image.php/standard/core/1365530675/docs" />More help</a></div>\n', 1365620840),
(24, '3a2bd17b83328bd81cc92600371a77ff', '<p>The page module enables a teacher to create a web page resource using the text editor. A page can display text, images, sound, video, web links and embedded code, such as Google maps.</p>\n\n<p>Advantages of using the page module rather than the file module include the resource being more accessible (for example to users of mobile devices) and easier to update.</p>\n\n<p>For large amounts of content, it''s recommended that a book is used rather than a page.</p>\n\n<p>A page may be used</p>\n\n<ul><li>To present the terms and conditions of a course or a summary of the course syllabus</li>\n<li>To embed several videos or sound files together with some explanatory text</li>\n</ul><div class="helpdoclink"><a href="http://docs.moodle.org/24/en/mod/page/view" class="helplinkpopup"><img class="iconhelp icon-pre" alt="More help" title="More help" src="http://localhost/moodle243/theme/image.php/standard/core/1365530675/docs" />More help</a></div>\n', 1365620841),
(25, '507660e1a2039966e5e3b8c40b3f9558', '<p>The URL module enables a teacher to provide a web link as a course resource. Anything that is freely available online, such as documents or images, can be linked to; the URL doesn’t have to be the home page of a website. The URL of a particular web page may be copied and pasted or a teacher can use the file picker and choose a link from a repository such as Flickr, YouTube or Wikimedia (depending upon which repositories are enabled for the site).</p>\n\n<p>There are a number of display options for the URL, such as embedded or opening in a new window and advanced options for passing information, such as a student''s name, to the URL if required.</p>\n\n<p>Note that URLs can also be added to any other resource or activity type through the text editor.</p>\n\n<div class="helpdoclink"><a href="http://docs.moodle.org/24/en/mod/url/view" class="helplinkpopup"><img class="iconhelp icon-pre" alt="More help" title="More help" src="http://localhost/moodle243/theme/image.php/standard/core/1365530675/docs" />More help</a></div>\n', 1365620841),
(26, '57fa94f2a7fd35869eae9635c2e341df', '<p>There are two types of sessions: common and groups. Ability to add different types depends on activity group mode.</p>\n\n<ul><li>In group mode "No groups" you can add only common sessions.</li>\n<li>In group mode "Visible groups" you can add common and group sessions.</li>\n<li>In group mode "Separate groups" you can add only group sessions.</li>\n</ul>', 1365532157),
(27, 'bcd2d79f338802c5541bff362f0cbcca', '<p>When players are enabled in these settings, files can be embedded using the media filter (if enabled) or using a File or URL resources with the Embed option. When not enabled, these formats are not embedded and users can manually download or follow links to these resources.</p>\n\n<p>Where two players support the same format, enabling both increases compatibility across different devices such as mobile phones. It is possible to increase compatibility further by providing multiple files in different formats for a single audio or video clip.</p>\n', 1365622641),
(28, '91aed7692903b3a2fcee5d6d684668ea', '<p>The assignment activity module enables a teacher to communicate tasks, collect work and provide grades and feedback.</p>\n\n<p>Students can submit any digital content (files), such as word-processed documents, spreadsheets, images, or audio and video clips. Alternatively, or in addition, the assignment may require students to type text directly into the text editor. An assignment can also be used to remind students of ''real-world'' assignments they need to complete offline, such as art work, and thus not require any digital content. Students can submit work individually or as a member of a group.</p>\n\n<p>When reviewing assignments, teachers can leave feedback comments and upload files, such as marked-up student submissions, documents with comments or spoken audio feedback. Assignments can be graded using a numerical or custom scale or an advanced grading method such as a rubric. Final grades are recorded in the gradebook.</p>\n\n<div class="helpdoclink"><a href="http://docs.moodle.org/24/en/mod/assignment/view" class="helplinkpopup"><img class="iconhelp icon-pre" alt="More help" title="More help" src="http://localhost/moodle243/theme/image.php/standard/core/1365530675/docs" />More help</a></div>\n', 1365625820),
(29, '054ebf66d81ad73b8fefada55259264e', '<p>There is currently no help associated with this resource or activity</p>\n', 1365625820),
(30, 'd8a80b0d9992cf04ca33631a03361c4b', '<p>The chat activity module enables participants to have text-based, real-time synchronous discussions.</p>\n\n<p>The chat may be a one-time activity or it may be repeated at the same time each day or each week. Chat sessions are saved and can be made available for everyone to view or restricted to users with the capability to view chat session logs.</p>\n\n<p>Chats are especially useful when the group chatting is not able to meet face-to-face, such as</p>\n\n<ul><li>Regular meetings of students participating in online courses to enable them to share experiences with others in the same course but in a different location</li>\n<li>A student temporarily unable to attend in person chatting with their teacher to catch up with work</li>\n<li>Students out on work experience getting together to discuss their experiences with each other and their teacher</li>\n<li>Younger children using chat at home in the evenings as a controlled (monitored) introduction to the world of social networking</li>\n<li>A question and answer session with an invited speaker in a different location</li>\n<li>Sessions to help students prepare for tests where the teacher, or other students, would pose sample questions</li>\n</ul><div class="helpdoclink"><a href="http://docs.moodle.org/24/en/mod/chat/view" class="helplinkpopup"><img class="iconhelp icon-pre" alt="More help" title="More help" src="http://localhost/moodle243/theme/image.php/standard/core/1365530675/docs" />More help</a></div>\n', 1365625820),
(31, '707f944318549290bae085894813fea8', '<p>The choice activity module enables a teacher to ask a single question and offer a selection of possible responses.</p>\n\n<p>Choice results may be published after students have answered, after a certain date, or not at all. Results may be published with student names or anonymously.</p>\n\n<p>A choice activity may be used</p>\n\n<ul><li>As a quick poll to stimulate thinking about a topic</li>\n<li>To quickly test students'' understanding</li>\n<li>To facilitate student decision-making, for example allowing students to vote on a direction for the course</li>\n</ul><div class="helpdoclink"><a href="http://docs.moodle.org/24/en/mod/choice/view" class="helplinkpopup"><img class="iconhelp icon-pre" alt="More help" title="More help" src="http://localhost/moodle243/theme/image.php/standard/core/1365530675/docs" />More help</a></div>\n', 1365625820),
(32, '1c8563fb594c176de5ea4c753a27c118', '<p>The database activity module enables participants to create, maintain and search a collection of entries (i.e. records).  The structure of the entries is defined by the teacher as a number of fields. Field types include checkbox, radio buttons, dropdown menu, text area, URL, picture and uploaded file.</p>\n\n<p>The visual layout of information when listing, viewing or editing database entries may be controlled by database templates. Database activities may be shared between courses as presets and a teacher may also import and export database entries.</p>\n\n<p>If the database auto-linking filter is enabled, any entries in a database will be automatically linked where the words or phrases appear within the course.</p>\n\n<p>A teacher can allow comments on entries. Entries can also be rated by teachers or students (peer evaluation). Ratings can be aggregated to form a final grade which is recorded in the gradebook.</p>\n\n<p>Database activities have many uses, such as</p>\n\n<ul><li>A collaborative collection of web links, books, book reviews, journal references etc</li>\n<li>For displaying student-created photos, posters, websites or poems for peer comment and review</li>\n</ul><div class="helpdoclink"><a href="http://docs.moodle.org/24/en/mod/data/view" class="helplinkpopup"><img class="iconhelp icon-pre" alt="More help" title="More help" src="http://localhost/moodle243/theme/image.php/standard/core/1365530675/docs" />More help</a></div>\n', 1365625820),
(33, 'fc7dee87616ebde2ca13652e80e306ac', '<p>The external tool activity module enables students to interact with learning resources and activities on other web sites. For example, an external tool could provide access to a new activity type or learning materials from a publisher.</p>\n\n<p>To create an external tool activity, a tool provider which supports LTI (Learning Tools Interoperability) is required. A teacher can create an external tool activity or make use of a tool configured by the site administrator.</p>\n\n<p>External tool activities differ from URL resources in a few ways:</p>\n\n<ul><li>External tools are context aware i.e. they have access to information about the user who launched the tool, such as institution, course and name</li>\n<li>External tools support reading, updating, and deleting grades associated with the activity instance</li>\n<li>External tool configurations create a trust relationship between your site and the tool provider, allowing secure communication between them</li>\n</ul><div class="helpdoclink"><a href="http://docs.moodle.org/24/en/mod/lti/view" class="helplinkpopup"><img class="iconhelp icon-pre" alt="More help" title="More help" src="http://localhost/moodle243/theme/image.php/standard/core/1365530675/docs" />More help</a></div>\n', 1365625820),
(34, '0aa811e65cc53eb80aca3c66a732d05f', '<p>The forum activity module enables participants to have asynchronous discussions i.e. discussions that take place over an extended period of time.</p>\n\n<p>There are several forum types to choose from, such as a standard forum where anyone can start a new discussion at any time; a forum where each student can post exactly one discussion; or a question and answer forum where students must first post before being able to view other students'' posts. A teacher can allow files to be attached to forum posts. Attached images are displayed in the forum post.</p>\n\n<p>Participants can subscribe to a forum to receive notifications of new forum posts. A teacher can set the subscription mode to optional, forced or auto, or prevent subscription completely. If required, students can be blocked from posting more than a given number of posts in a given time period; this can prevent individuals from dominating discussions.</p>\n\n<p>Forum posts can be rated by teachers or students (peer evaluation). Ratings can be aggregated to form a final grade which is recorded in the gradebook.</p>\n\n<p>Forums have many uses, such as</p>\n\n<ul><li>A social space for students to get to know each other</li>\n<li>For course announcements (using a news forum with forced subscription)</li>\n<li>For discussing course content or reading materials</li>\n<li>For continuing online an issue raised previously in a face-to-face session</li>\n<li>For teacher-only discussions (using a hidden forum)</li>\n<li>A help centre where tutors and students can give advice</li>\n<li>A one-on-one support area for private student-teacher communications (using a forum with separate groups and with one student per group)</li>\n<li>For extension activities, for example ‘brain teasers’ for students to ponder and suggest solutions to</li>\n</ul><div class="helpdoclink"><a href="http://docs.moodle.org/24/en/mod/forum/view" class="helplinkpopup"><img class="iconhelp icon-pre" alt="More help" title="More help" src="http://localhost/moodle243/theme/image.php/standard/core/1365530675/docs" />More help</a></div>\n', 1365625820),
(35, 'f18baa11f07c2610755753a2a2b319f8', '<p>The glossary activity module enables participants to create and maintain a list of definitions, like a dictionary, or to collect and organise resources or information.</p>\n\n<p>A teacher can allow files to be attached to glossary entries. Attached images are displayed in the entry. Entries can be searched or browsed alphabetically or by category, date or author. Entries can be approved by default or require approval by a teacher before they are viewable by everyone.</p>\n\n<p>If the glossary auto-linking filter is enabled, entries will be automatically linked where the concept words and/or phrases appear within the course.</p>\n\n<p>A teacher can allow comments on entries. Entries can also be rated by teachers or students (peer evaluation). Ratings can be aggregated to form a final grade which is recorded in the gradebook.</p>\n\n<p>Glossaries have many uses, such as</p>\n\n<ul><li>A collaborative bank of key terms</li>\n<li>A ‘getting to know you’ space where new students add their name and personal details</li>\n<li>A ‘handy tips’ resource of best practice in a practical subject</li>\n<li>A sharing area of useful videos, images or sound files</li>\n<li>A revision resource of facts to remember</li>\n</ul><div class="helpdoclink"><a href="http://docs.moodle.org/24/en/mod/glossary/view" class="helplinkpopup"><img class="iconhelp icon-pre" alt="More help" title="More help" src="http://localhost/moodle243/theme/image.php/standard/core/1365530675/docs" />More help</a></div>\n', 1365625820),
(36, '10c67a0935dedd23c8e943b1c8ce8723', '<p>The lesson activity module enables a teacher to deliver content and/or practice activities in  interesting and flexible ways. A teacher can use the lesson to create a linear set of content pages or instructional activities that offer a variety of paths or options for the learner. In either case, teachers can choose to increase engagement and ensure understanding by including a variety of questions, such as multiple choice, matching and short answer. Depending on the student''s choice of answer and how the teacher develops the lesson, students may progress to the next page, be taken back to a previous page or redirected down a different path entirely.</p>\n\n<p>A lesson may be graded, with the grade recorded in the gradebook.</p>\n\n<p>Lessons may be used</p>\n\n<ul><li>For self-directed learning of a new topic</li>\n<li>For  scenarios or simulations/decision-making exercises</li>\n<li>For differentiated revision, with different sets of revision questions depending upon answers given to initial questions</li>\n</ul><div class="helpdoclink"><a href="http://docs.moodle.org/24/en/mod/lesson/view" class="helplinkpopup"><img class="iconhelp icon-pre" alt="More help" title="More help" src="http://localhost/moodle243/theme/image.php/standard/core/1365530675/docs" />More help</a></div>\n', 1365625820),
(37, '4d328260d35b5d9ecc007124c3c1470e', '<p>The quiz activity enables a teacher to create quizzes comprising questions of various types, including multiple choice, matching, short-answer and numerical.</p>\n\n<p>The teacher can allow the quiz to be attempted multiple times, with the questions shuffled or randomly selected from the question bank. A time limit may be set.</p>\n\n<p>Each attempt is marked automatically, with the exception of essay questions, and the grade is recorded in the gradebook.</p>\n\n<p>The teacher can choose when and if hints, feedback and correct answers are shown to students.</p>\n\n<p>Quizzes may be used</p>\n\n<ul><li>As course exams</li>\n<li>As mini tests for reading assignments or at the end of a topic</li>\n<li>As exam practice using questions from past exams</li>\n<li>To deliver immediate feedback about performance</li>\n<li>For self-assessment</li>\n</ul><div class="helpdoclink"><a href="http://docs.moodle.org/24/en/mod/quiz/view" class="helplinkpopup"><img class="iconhelp icon-pre" alt="More help" title="More help" src="http://localhost/moodle243/theme/image.php/standard/core/1365530675/docs" />More help</a></div>\n', 1365625820),
(38, '78802416be0f51cda9278e0f03567025', '<p>A SCORM package is a collection of files which are packaged according to an agreed standard for learning objects. The SCORM activity module enables SCORM or AICC packages to be uploaded as a zip file and added to a course.</p>\n\n<p>Content is usually displayed over several pages, with navigation between the pages. There are various options for displaying content in a pop-up window, with a table of contents, with navigation buttons etc. SCORM activities generally include questions, with grades being recorded in the gradebook.</p>\n\n<p>SCORM activities may be used</p>\n\n<ul><li>For presenting multimedia content and animations</li>\n<li>As an assessment tool</li>\n</ul><div class="helpdoclink"><a href="http://docs.moodle.org/24/en/mod/scorm/view" class="helplinkpopup"><img class="iconhelp icon-pre" alt="More help" title="More help" src="http://localhost/moodle243/theme/image.php/standard/core/1365530675/docs" />More help</a></div>\n', 1365625820),
(39, '6c83dc42eb8188c77e8712916fa49e1b', '<p>The survey activity module provides a number of verified survey instruments that have been found useful in assessing and stimulating learning in online environments. A teacher can use these to gather data from their students that will help them learn about their class and reflect on their own teaching.</p>\n\n<p>Note that these survey tools are pre-populated with questions. Teachers who wish to create their own survey should use the feedback activity module.</p>\n\n<div class="helpdoclink"><a href="http://docs.moodle.org/24/en/mod/survey/view" class="helplinkpopup"><img class="iconhelp icon-pre" alt="More help" title="More help" src="http://localhost/moodle243/theme/image.php/standard/core/1365530675/docs" />More help</a></div>\n', 1365625820),
(40, '7ce61eda3445af4da8b569137c9b2d5c', '<p>The wiki activity module enables participants to add and edit a collection of web pages. A wiki can be collaborative, with everyone being able to edit it, or individual, where everyone has their own wiki which only they can edit.</p>\n\n<p>A history of previous versions of each page in the wiki is kept, listing the edits made by each participant.</p>\n\n<p>Wikis have many uses, such as</p>\n\n<ul><li>For group lecture notes or study guides</li>\n<li>For members of a faculty to plan a scheme of work or meeting agenda together</li>\n<li>For students to collaboratively author an online book, creating content on a topic set by their tutor</li>\n<li>For collaborative storytelling or poetry creation, where each participant writes a line or verse</li>\n<li>As a personal journal for examination notes or revision (using an individual wiki)</li>\n</ul><div class="helpdoclink"><a href="http://docs.moodle.org/24/en/mod/wiki/view" class="helplinkpopup"><img class="iconhelp icon-pre" alt="More help" title="More help" src="http://localhost/moodle243/theme/image.php/standard/core/1365530675/docs" />More help</a></div>\n', 1365625820),
(41, '52c029be219a081c877bd7c4ab1f05b4', '<p>The workshop activity module enables the collection, review and peer assessment of students'' work.</p>\n\n<p>Students can submit any digital content (files), such as word-processed documents or spreadsheets and can also type text directly into a field using the text editor.</p>\n\n<p>Submissions are assessed using a multi-criteria assessment form defined by the teacher. The process of peer assessment and understanding the assessment form can be practised in advance with example submissions provided by the teacher, together with a reference assessment. Students are given the opportunity to assess one or more of their peers'' submissions. Submissions and reviewers may be anonymous if required.</p>\n\n<p>Students obtain two grades in a workshop activity - a grade for their submission and a grade for their assessment of their peers'' submissions. Both grades are recorded in the gradebook.</p>\n\n<div class="helpdoclink"><a href="http://docs.moodle.org/24/en/mod/workshop/view" class="helplinkpopup"><img class="iconhelp icon-pre" alt="More help" title="More help" src="http://localhost/moodle243/theme/image.php/standard/core/1365530675/docs" />More help</a></div>\n', 1365625820),
(42, 'c9bd8ba2cbfe224bff838a80880b80e8', '<p>The book module enables a teacher to create a multi-page resource in a book-like format, with chapters and subchapters. Books can contain media files as well as text and are useful for displaying lengthy passages of information which can be broken down into sections.</p>\n\n<p>A book may be used</p>\n\n<ul><li>To display reading material for individual modules of study</li>\n<li>As a staff departmental handbook</li>\n<li>As a showcase portfolio of student work</li>\n</ul><div class="helpdoclink"><a href="http://docs.moodle.org/24/en/mod/book/view" class="helplinkpopup"><img class="iconhelp icon-pre" alt="More help" title="More help" src="http://localhost/moodle243/theme/image.php/standard/core/1365530675/docs" />More help</a></div>\n', 1365625820),
(43, 'debd744d336df29e67efb3085c80f6c3', '<p>The file module enables a teacher to provide a file as a course resource. Where possible, the file will be displayed within the course interface; otherwise students will be prompted to download it. The file may include supporting files, for example an HTML page may have embedded images or Flash objects.</p>\n\n<p>Note that students need to have the appropriate software on their computers in order to open the file.</p>\n\n<p>A file may be used</p>\n\n<ul><li>To share presentations given in class</li>\n<li>To include a mini website as a course resource</li>\n<li>To provide draft files of certain software programs (eg Photoshop .psd) so students can edit and submit them for assessment</li>\n</ul><div class="helpdoclink"><a href="http://docs.moodle.org/24/en/mod/resource/view" class="helplinkpopup"><img class="iconhelp icon-pre" alt="More help" title="More help" src="http://localhost/moodle243/theme/image.php/standard/core/1365530675/docs" />More help</a></div>\n', 1365625820),
(44, 'a162a636c06e1a9ce96efac1c56ce967', '<p>The folder module enables a teacher to display a number of related files inside a single folder, reducing scrolling on the course page. A zipped folder may be uploaded and unzipped for display, or an empty folder created and files uploaded into it.</p>\n\n<p>A folder may be used</p>\n\n<ul><li>For a series of files on one topic, for example a set of past examination papers in pdf format or a collection of image files for use in student projects</li>\n<li>To provide a shared uploading space for teachers on the course page (keeping the folder hidden so that only teachers can see it)</li>\n</ul><div class="helpdoclink"><a href="http://docs.moodle.org/24/en/mod/folder/view" class="helplinkpopup"><img class="iconhelp icon-pre" alt="More help" title="More help" src="http://localhost/moodle243/theme/image.php/standard/core/1365530675/docs" />More help</a></div>\n', 1365625820),
(45, 'ee65cb7f7eb9779cb1b135bcfefdff4e', '<p>An IMS content package is a collection of files which are packaged according to an agreed standard so they can be reused in different systems. The IMS content package module enables such content packages to be uploaded as a zip file and added to a course as a resource.</p>\n\n<p>Content is usually displayed over several pages, with navigation between the pages. There are various options for displaying content in a pop-up window, with a navigation menu or buttons etc.</p>\n\n<p>An IMS content package may be used for presenting multimedia content and animations.</p>\n\n<div class="helpdoclink"><a href="http://docs.moodle.org/24/en/mod/imscp/view" class="helplinkpopup"><img class="iconhelp icon-pre" alt="More help" title="More help" src="http://localhost/moodle243/theme/image.php/standard/core/1365530675/docs" />More help</a></div>\n', 1365625820),
(46, '05dba4a819eb2d1c20bd66bf383b90db', '<p>The label module enables text and multimedia to be inserted into the course page in between links to other resources and activities. Labels are very versatile and can help to improve the appearance of a course if used thoughtfully.</p>\n\n<p>Labels may be used</p>\n\n<ul><li>To split up a long list of activities with a subheading or an image</li>\n<li>To display an embedded sound file or video directly on the course page</li>\n<li>To add a short description to a course section</li>\n</ul><div class="helpdoclink"><a href="http://docs.moodle.org/24/en/mod/label/view" class="helplinkpopup"><img class="iconhelp icon-pre" alt="More help" title="More help" src="http://localhost/moodle243/theme/image.php/standard/core/1365530675/docs" />More help</a></div>\n', 1365625820),
(47, '05c22c4655e500d765f68e4208a0e69b', '<p>The page module enables a teacher to create a web page resource using the text editor. A page can display text, images, sound, video, web links and embedded code, such as Google maps.</p>\n\n<p>Advantages of using the page module rather than the file module include the resource being more accessible (for example to users of mobile devices) and easier to update.</p>\n\n<p>For large amounts of content, it''s recommended that a book is used rather than a page.</p>\n\n<p>A page may be used</p>\n\n<ul><li>To present the terms and conditions of a course or a summary of the course syllabus</li>\n<li>To embed several videos or sound files together with some explanatory text</li>\n</ul><div class="helpdoclink"><a href="http://docs.moodle.org/24/en/mod/page/view" class="helplinkpopup"><img class="iconhelp icon-pre" alt="More help" title="More help" src="http://localhost/moodle243/theme/image.php/standard/core/1365530675/docs" />More help</a></div>\n', 1365625820);
INSERT INTO `mdl_cache_text` (`id`, `md5key`, `formattedtext`, `timemodified`) VALUES
(48, '94ef41edbea3e1e06388708859e22ecb', '<p>The URL module enables a teacher to provide a web link as a course resource. Anything that is freely available online, such as documents or images, can be linked to; the URL doesn’t have to be the home page of a website. The URL of a particular web page may be copied and pasted or a teacher can use the file picker and choose a link from a repository such as Flickr, YouTube or Wikimedia (depending upon which repositories are enabled for the site).</p>\n\n<p>There are a number of display options for the URL, such as embedded or opening in a new window and advanced options for passing information, such as a student''s name, to the URL if required.</p>\n\n<p>Note that URLs can also be added to any other resource or activity type through the text editor.</p>\n\n<div class="helpdoclink"><a href="http://docs.moodle.org/24/en/mod/url/view" class="helplinkpopup"><img class="iconhelp icon-pre" alt="More help" title="More help" src="http://localhost/moodle243/theme/image.php/standard/core/1365530675/docs" />More help</a></div>\n', 1365625820),
(49, 'b1b2d42a6e7982f2caa6fdaede355c90', '<p>When players are enabled in these settings, files can be embedded using the media filter (if enabled) or using a File or URL resources with the Embed option. When not enabled, these formats are not embedded and users can manually download or follow links to these resources.</p>\n\n<p>Where two players support the same format, enabling both increases compatibility across different devices such as mobile phones. It is possible to increase compatibility further by providing multiple files in different formats for a single audio or video clip.</p>\n', 1365625588),
(50, 'ea5c61928dabf10558e172084d555046', '<p>When players are enabled in these settings, files can be embedded using the media filter (if enabled) or using a File or URL resources with the Embed option. When not enabled, these formats are not embedded and users can manually download or follow links to these resources.</p>\n\n<p>Where two players support the same format, enabling both increases compatibility across different devices such as mobile phones. It is possible to increase compatibility further by providing multiple files in different formats for a single audio or video clip.</p>\n', 1365625592),
(51, '06c41e527f69dd73ba42b1769ed853cd', '<p>The assignment activity module enables a teacher to communicate tasks, collect work and provide grades and feedback.</p>\n\n<p>Students can submit any digital content (files), such as word-processed documents, spreadsheets, images, or audio and video clips. Alternatively, or in addition, the assignment may require students to type text directly into the text editor. An assignment can also be used to remind students of ''real-world'' assignments they need to complete offline, such as art work, and thus not require any digital content. Students can submit work individually or as a member of a group.</p>\n\n<p>When reviewing assignments, teachers can leave feedback comments and upload files, such as marked-up student submissions, documents with comments or spoken audio feedback. Assignments can be graded using a numerical or custom scale or an advanced grading method such as a rubric. Final grades are recorded in the gradebook.</p>\n\n<div class="helpdoclink"><a href="http://docs.moodle.org/24/en/mod/assignment/view" class="helplinkpopup"><img class="iconhelp icon-pre" alt="More help" title="More help" src="http://localhost/moodle243/theme/image.php/standard/core/1365530675/docs" />More help</a></div>\n', 1365625591),
(52, 'de08e489025bdf5d4c438aedb65fe52d', '<p>There is currently no help associated with this resource or activity</p>\n', 1365625591),
(53, '4a9437a78d1e5967131a32bd2f1c2841', '<p>The chat activity module enables participants to have text-based, real-time synchronous discussions.</p>\n\n<p>The chat may be a one-time activity or it may be repeated at the same time each day or each week. Chat sessions are saved and can be made available for everyone to view or restricted to users with the capability to view chat session logs.</p>\n\n<p>Chats are especially useful when the group chatting is not able to meet face-to-face, such as</p>\n\n<ul><li>Regular meetings of students participating in online courses to enable them to share experiences with others in the same course but in a different location</li>\n<li>A student temporarily unable to attend in person chatting with their teacher to catch up with work</li>\n<li>Students out on work experience getting together to discuss their experiences with each other and their teacher</li>\n<li>Younger children using chat at home in the evenings as a controlled (monitored) introduction to the world of social networking</li>\n<li>A question and answer session with an invited speaker in a different location</li>\n<li>Sessions to help students prepare for tests where the teacher, or other students, would pose sample questions</li>\n</ul><div class="helpdoclink"><a href="http://docs.moodle.org/24/en/mod/chat/view" class="helplinkpopup"><img class="iconhelp icon-pre" alt="More help" title="More help" src="http://localhost/moodle243/theme/image.php/standard/core/1365530675/docs" />More help</a></div>\n', 1365625591),
(54, '59b9c46ec125def587ba64577429fa84', '<p>The choice activity module enables a teacher to ask a single question and offer a selection of possible responses.</p>\n\n<p>Choice results may be published after students have answered, after a certain date, or not at all. Results may be published with student names or anonymously.</p>\n\n<p>A choice activity may be used</p>\n\n<ul><li>As a quick poll to stimulate thinking about a topic</li>\n<li>To quickly test students'' understanding</li>\n<li>To facilitate student decision-making, for example allowing students to vote on a direction for the course</li>\n</ul><div class="helpdoclink"><a href="http://docs.moodle.org/24/en/mod/choice/view" class="helplinkpopup"><img class="iconhelp icon-pre" alt="More help" title="More help" src="http://localhost/moodle243/theme/image.php/standard/core/1365530675/docs" />More help</a></div>\n', 1365625591),
(55, '774f4383a9c644fc5541c8fc45a9c1a4', '<p>The database activity module enables participants to create, maintain and search a collection of entries (i.e. records).  The structure of the entries is defined by the teacher as a number of fields. Field types include checkbox, radio buttons, dropdown menu, text area, URL, picture and uploaded file.</p>\n\n<p>The visual layout of information when listing, viewing or editing database entries may be controlled by database templates. Database activities may be shared between courses as presets and a teacher may also import and export database entries.</p>\n\n<p>If the database auto-linking filter is enabled, any entries in a database will be automatically linked where the words or phrases appear within the course.</p>\n\n<p>A teacher can allow comments on entries. Entries can also be rated by teachers or students (peer evaluation). Ratings can be aggregated to form a final grade which is recorded in the gradebook.</p>\n\n<p>Database activities have many uses, such as</p>\n\n<ul><li>A collaborative collection of web links, books, book reviews, journal references etc</li>\n<li>For displaying student-created photos, posters, websites or poems for peer comment and review</li>\n</ul><div class="helpdoclink"><a href="http://docs.moodle.org/24/en/mod/data/view" class="helplinkpopup"><img class="iconhelp icon-pre" alt="More help" title="More help" src="http://localhost/moodle243/theme/image.php/standard/core/1365530675/docs" />More help</a></div>\n', 1365625591),
(56, '17e383554609952d7a7be7fb8415ed7a', '<p>The external tool activity module enables students to interact with learning resources and activities on other web sites. For example, an external tool could provide access to a new activity type or learning materials from a publisher.</p>\n\n<p>To create an external tool activity, a tool provider which supports LTI (Learning Tools Interoperability) is required. A teacher can create an external tool activity or make use of a tool configured by the site administrator.</p>\n\n<p>External tool activities differ from URL resources in a few ways:</p>\n\n<ul><li>External tools are context aware i.e. they have access to information about the user who launched the tool, such as institution, course and name</li>\n<li>External tools support reading, updating, and deleting grades associated with the activity instance</li>\n<li>External tool configurations create a trust relationship between your site and the tool provider, allowing secure communication between them</li>\n</ul><div class="helpdoclink"><a href="http://docs.moodle.org/24/en/mod/lti/view" class="helplinkpopup"><img class="iconhelp icon-pre" alt="More help" title="More help" src="http://localhost/moodle243/theme/image.php/standard/core/1365530675/docs" />More help</a></div>\n', 1365625591),
(57, 'd975bdb6f440dc47a8037421017bbc62', '<p>The forum activity module enables participants to have asynchronous discussions i.e. discussions that take place over an extended period of time.</p>\n\n<p>There are several forum types to choose from, such as a standard forum where anyone can start a new discussion at any time; a forum where each student can post exactly one discussion; or a question and answer forum where students must first post before being able to view other students'' posts. A teacher can allow files to be attached to forum posts. Attached images are displayed in the forum post.</p>\n\n<p>Participants can subscribe to a forum to receive notifications of new forum posts. A teacher can set the subscription mode to optional, forced or auto, or prevent subscription completely. If required, students can be blocked from posting more than a given number of posts in a given time period; this can prevent individuals from dominating discussions.</p>\n\n<p>Forum posts can be rated by teachers or students (peer evaluation). Ratings can be aggregated to form a final grade which is recorded in the gradebook.</p>\n\n<p>Forums have many uses, such as</p>\n\n<ul><li>A social space for students to get to know each other</li>\n<li>For course announcements (using a news forum with forced subscription)</li>\n<li>For discussing course content or reading materials</li>\n<li>For continuing online an issue raised previously in a face-to-face session</li>\n<li>For teacher-only discussions (using a hidden forum)</li>\n<li>A help centre where tutors and students can give advice</li>\n<li>A one-on-one support area for private student-teacher communications (using a forum with separate groups and with one student per group)</li>\n<li>For extension activities, for example ‘brain teasers’ for students to ponder and suggest solutions to</li>\n</ul><div class="helpdoclink"><a href="http://docs.moodle.org/24/en/mod/forum/view" class="helplinkpopup"><img class="iconhelp icon-pre" alt="More help" title="More help" src="http://localhost/moodle243/theme/image.php/standard/core/1365530675/docs" />More help</a></div>\n', 1365625591),
(58, '85f83e6acaf9f663a1df0b5ff1c928e9', '<p>The glossary activity module enables participants to create and maintain a list of definitions, like a dictionary, or to collect and organise resources or information.</p>\n\n<p>A teacher can allow files to be attached to glossary entries. Attached images are displayed in the entry. Entries can be searched or browsed alphabetically or by category, date or author. Entries can be approved by default or require approval by a teacher before they are viewable by everyone.</p>\n\n<p>If the glossary auto-linking filter is enabled, entries will be automatically linked where the concept words and/or phrases appear within the course.</p>\n\n<p>A teacher can allow comments on entries. Entries can also be rated by teachers or students (peer evaluation). Ratings can be aggregated to form a final grade which is recorded in the gradebook.</p>\n\n<p>Glossaries have many uses, such as</p>\n\n<ul><li>A collaborative bank of key terms</li>\n<li>A ‘getting to know you’ space where new students add their name and personal details</li>\n<li>A ‘handy tips’ resource of best practice in a practical subject</li>\n<li>A sharing area of useful videos, images or sound files</li>\n<li>A revision resource of facts to remember</li>\n</ul><div class="helpdoclink"><a href="http://docs.moodle.org/24/en/mod/glossary/view" class="helplinkpopup"><img class="iconhelp icon-pre" alt="More help" title="More help" src="http://localhost/moodle243/theme/image.php/standard/core/1365530675/docs" />More help</a></div>\n', 1365625591),
(59, 'ae33c494f00e3d3cd7141dcdd762c904', '<p>The lesson activity module enables a teacher to deliver content and/or practice activities in  interesting and flexible ways. A teacher can use the lesson to create a linear set of content pages or instructional activities that offer a variety of paths or options for the learner. In either case, teachers can choose to increase engagement and ensure understanding by including a variety of questions, such as multiple choice, matching and short answer. Depending on the student''s choice of answer and how the teacher develops the lesson, students may progress to the next page, be taken back to a previous page or redirected down a different path entirely.</p>\n\n<p>A lesson may be graded, with the grade recorded in the gradebook.</p>\n\n<p>Lessons may be used</p>\n\n<ul><li>For self-directed learning of a new topic</li>\n<li>For  scenarios or simulations/decision-making exercises</li>\n<li>For differentiated revision, with different sets of revision questions depending upon answers given to initial questions</li>\n</ul><div class="helpdoclink"><a href="http://docs.moodle.org/24/en/mod/lesson/view" class="helplinkpopup"><img class="iconhelp icon-pre" alt="More help" title="More help" src="http://localhost/moodle243/theme/image.php/standard/core/1365530675/docs" />More help</a></div>\n', 1365625591),
(60, 'ea9dd3608b50401596c972573dd310a5', '<p>The quiz activity enables a teacher to create quizzes comprising questions of various types, including multiple choice, matching, short-answer and numerical.</p>\n\n<p>The teacher can allow the quiz to be attempted multiple times, with the questions shuffled or randomly selected from the question bank. A time limit may be set.</p>\n\n<p>Each attempt is marked automatically, with the exception of essay questions, and the grade is recorded in the gradebook.</p>\n\n<p>The teacher can choose when and if hints, feedback and correct answers are shown to students.</p>\n\n<p>Quizzes may be used</p>\n\n<ul><li>As course exams</li>\n<li>As mini tests for reading assignments or at the end of a topic</li>\n<li>As exam practice using questions from past exams</li>\n<li>To deliver immediate feedback about performance</li>\n<li>For self-assessment</li>\n</ul><div class="helpdoclink"><a href="http://docs.moodle.org/24/en/mod/quiz/view" class="helplinkpopup"><img class="iconhelp icon-pre" alt="More help" title="More help" src="http://localhost/moodle243/theme/image.php/standard/core/1365530675/docs" />More help</a></div>\n', 1365625591),
(61, 'a377aa4a43c72f0bc2ec403113851b85', '<p>A SCORM package is a collection of files which are packaged according to an agreed standard for learning objects. The SCORM activity module enables SCORM or AICC packages to be uploaded as a zip file and added to a course.</p>\n\n<p>Content is usually displayed over several pages, with navigation between the pages. There are various options for displaying content in a pop-up window, with a table of contents, with navigation buttons etc. SCORM activities generally include questions, with grades being recorded in the gradebook.</p>\n\n<p>SCORM activities may be used</p>\n\n<ul><li>For presenting multimedia content and animations</li>\n<li>As an assessment tool</li>\n</ul><div class="helpdoclink"><a href="http://docs.moodle.org/24/en/mod/scorm/view" class="helplinkpopup"><img class="iconhelp icon-pre" alt="More help" title="More help" src="http://localhost/moodle243/theme/image.php/standard/core/1365530675/docs" />More help</a></div>\n', 1365625591),
(62, '8dfd3dff44dd1dc1144998e0039fdab9', '<p>The survey activity module provides a number of verified survey instruments that have been found useful in assessing and stimulating learning in online environments. A teacher can use these to gather data from their students that will help them learn about their class and reflect on their own teaching.</p>\n\n<p>Note that these survey tools are pre-populated with questions. Teachers who wish to create their own survey should use the feedback activity module.</p>\n\n<div class="helpdoclink"><a href="http://docs.moodle.org/24/en/mod/survey/view" class="helplinkpopup"><img class="iconhelp icon-pre" alt="More help" title="More help" src="http://localhost/moodle243/theme/image.php/standard/core/1365530675/docs" />More help</a></div>\n', 1365625591),
(63, '2ad93692d4603eee39fef8c566da8d3a', '<p>The wiki activity module enables participants to add and edit a collection of web pages. A wiki can be collaborative, with everyone being able to edit it, or individual, where everyone has their own wiki which only they can edit.</p>\n\n<p>A history of previous versions of each page in the wiki is kept, listing the edits made by each participant.</p>\n\n<p>Wikis have many uses, such as</p>\n\n<ul><li>For group lecture notes or study guides</li>\n<li>For members of a faculty to plan a scheme of work or meeting agenda together</li>\n<li>For students to collaboratively author an online book, creating content on a topic set by their tutor</li>\n<li>For collaborative storytelling or poetry creation, where each participant writes a line or verse</li>\n<li>As a personal journal for examination notes or revision (using an individual wiki)</li>\n</ul><div class="helpdoclink"><a href="http://docs.moodle.org/24/en/mod/wiki/view" class="helplinkpopup"><img class="iconhelp icon-pre" alt="More help" title="More help" src="http://localhost/moodle243/theme/image.php/standard/core/1365530675/docs" />More help</a></div>\n', 1365625591),
(64, 'cd608d6b11b45f1d24730eb9a0c0ec8e', '<p>The workshop activity module enables the collection, review and peer assessment of students'' work.</p>\n\n<p>Students can submit any digital content (files), such as word-processed documents or spreadsheets and can also type text directly into a field using the text editor.</p>\n\n<p>Submissions are assessed using a multi-criteria assessment form defined by the teacher. The process of peer assessment and understanding the assessment form can be practised in advance with example submissions provided by the teacher, together with a reference assessment. Students are given the opportunity to assess one or more of their peers'' submissions. Submissions and reviewers may be anonymous if required.</p>\n\n<p>Students obtain two grades in a workshop activity - a grade for their submission and a grade for their assessment of their peers'' submissions. Both grades are recorded in the gradebook.</p>\n\n<div class="helpdoclink"><a href="http://docs.moodle.org/24/en/mod/workshop/view" class="helplinkpopup"><img class="iconhelp icon-pre" alt="More help" title="More help" src="http://localhost/moodle243/theme/image.php/standard/core/1365530675/docs" />More help</a></div>\n', 1365625591),
(65, '2e8d0642a8aee0b242390be2df34621d', '<p>The book module enables a teacher to create a multi-page resource in a book-like format, with chapters and subchapters. Books can contain media files as well as text and are useful for displaying lengthy passages of information which can be broken down into sections.</p>\n\n<p>A book may be used</p>\n\n<ul><li>To display reading material for individual modules of study</li>\n<li>As a staff departmental handbook</li>\n<li>As a showcase portfolio of student work</li>\n</ul><div class="helpdoclink"><a href="http://docs.moodle.org/24/en/mod/book/view" class="helplinkpopup"><img class="iconhelp icon-pre" alt="More help" title="More help" src="http://localhost/moodle243/theme/image.php/standard/core/1365530675/docs" />More help</a></div>\n', 1365625591),
(66, '23ca02cdbd43abc84781a4f4973ba07e', '<p>The file module enables a teacher to provide a file as a course resource. Where possible, the file will be displayed within the course interface; otherwise students will be prompted to download it. The file may include supporting files, for example an HTML page may have embedded images or Flash objects.</p>\n\n<p>Note that students need to have the appropriate software on their computers in order to open the file.</p>\n\n<p>A file may be used</p>\n\n<ul><li>To share presentations given in class</li>\n<li>To include a mini website as a course resource</li>\n<li>To provide draft files of certain software programs (eg Photoshop .psd) so students can edit and submit them for assessment</li>\n</ul><div class="helpdoclink"><a href="http://docs.moodle.org/24/en/mod/resource/view" class="helplinkpopup"><img class="iconhelp icon-pre" alt="More help" title="More help" src="http://localhost/moodle243/theme/image.php/standard/core/1365530675/docs" />More help</a></div>\n', 1365625591),
(67, 'e7a20bdcddc9d908ead47622eb9c6bc3', '<p>The folder module enables a teacher to display a number of related files inside a single folder, reducing scrolling on the course page. A zipped folder may be uploaded and unzipped for display, or an empty folder created and files uploaded into it.</p>\n\n<p>A folder may be used</p>\n\n<ul><li>For a series of files on one topic, for example a set of past examination papers in pdf format or a collection of image files for use in student projects</li>\n<li>To provide a shared uploading space for teachers on the course page (keeping the folder hidden so that only teachers can see it)</li>\n</ul><div class="helpdoclink"><a href="http://docs.moodle.org/24/en/mod/folder/view" class="helplinkpopup"><img class="iconhelp icon-pre" alt="More help" title="More help" src="http://localhost/moodle243/theme/image.php/standard/core/1365530675/docs" />More help</a></div>\n', 1365625591),
(68, 'f8daefa2bed0804de85e9f99f1adaf48', '<p>An IMS content package is a collection of files which are packaged according to an agreed standard so they can be reused in different systems. The IMS content package module enables such content packages to be uploaded as a zip file and added to a course as a resource.</p>\n\n<p>Content is usually displayed over several pages, with navigation between the pages. There are various options for displaying content in a pop-up window, with a navigation menu or buttons etc.</p>\n\n<p>An IMS content package may be used for presenting multimedia content and animations.</p>\n\n<div class="helpdoclink"><a href="http://docs.moodle.org/24/en/mod/imscp/view" class="helplinkpopup"><img class="iconhelp icon-pre" alt="More help" title="More help" src="http://localhost/moodle243/theme/image.php/standard/core/1365530675/docs" />More help</a></div>\n', 1365625591),
(69, '46d94ca217d9f1f5ef3843c00de2027f', '<p>The label module enables text and multimedia to be inserted into the course page in between links to other resources and activities. Labels are very versatile and can help to improve the appearance of a course if used thoughtfully.</p>\n\n<p>Labels may be used</p>\n\n<ul><li>To split up a long list of activities with a subheading or an image</li>\n<li>To display an embedded sound file or video directly on the course page</li>\n<li>To add a short description to a course section</li>\n</ul><div class="helpdoclink"><a href="http://docs.moodle.org/24/en/mod/label/view" class="helplinkpopup"><img class="iconhelp icon-pre" alt="More help" title="More help" src="http://localhost/moodle243/theme/image.php/standard/core/1365530675/docs" />More help</a></div>\n', 1365625591),
(70, 'a818c9f28d874258164a48e1930a2034', '<p>The page module enables a teacher to create a web page resource using the text editor. A page can display text, images, sound, video, web links and embedded code, such as Google maps.</p>\n\n<p>Advantages of using the page module rather than the file module include the resource being more accessible (for example to users of mobile devices) and easier to update.</p>\n\n<p>For large amounts of content, it''s recommended that a book is used rather than a page.</p>\n\n<p>A page may be used</p>\n\n<ul><li>To present the terms and conditions of a course or a summary of the course syllabus</li>\n<li>To embed several videos or sound files together with some explanatory text</li>\n</ul><div class="helpdoclink"><a href="http://docs.moodle.org/24/en/mod/page/view" class="helplinkpopup"><img class="iconhelp icon-pre" alt="More help" title="More help" src="http://localhost/moodle243/theme/image.php/standard/core/1365530675/docs" />More help</a></div>\n', 1365625591),
(71, 'a71b01362036858b2e1c746a4d1f4baa', '<p>The URL module enables a teacher to provide a web link as a course resource. Anything that is freely available online, such as documents or images, can be linked to; the URL doesn’t have to be the home page of a website. The URL of a particular web page may be copied and pasted or a teacher can use the file picker and choose a link from a repository such as Flickr, YouTube or Wikimedia (depending upon which repositories are enabled for the site).</p>\n\n<p>There are a number of display options for the URL, such as embedded or opening in a new window and advanced options for passing information, such as a student''s name, to the URL if required.</p>\n\n<p>Note that URLs can also be added to any other resource or activity type through the text editor.</p>\n\n<div class="helpdoclink"><a href="http://docs.moodle.org/24/en/mod/url/view" class="helplinkpopup"><img class="iconhelp icon-pre" alt="More help" title="More help" src="http://localhost/moodle243/theme/image.php/standard/core/1365530675/docs" />More help</a></div>\n', 1365625591),
(72, 'de73ed9e1f01a5d754d09585edb8b4ae', '<p>The assignment activity module enables a teacher to communicate tasks, collect work and provide grades and feedback.</p>\n\n<p>Students can submit any digital content (files), such as word-processed documents, spreadsheets, images, or audio and video clips. Alternatively, or in addition, the assignment may require students to type text directly into the text editor. An assignment can also be used to remind students of ''real-world'' assignments they need to complete offline, such as art work, and thus not require any digital content. Students can submit work individually or as a member of a group.</p>\n\n<p>When reviewing assignments, teachers can leave feedback comments and upload files, such as marked-up student submissions, documents with comments or spoken audio feedback. Assignments can be graded using a numerical or custom scale or an advanced grading method such as a rubric. Final grades are recorded in the gradebook.</p>\n\n<div class="helpdoclink"><a href="http://docs.moodle.org/24/en/mod/assignment/view" class="helplinkpopup"><img class="iconhelp icon-pre" alt="More help" title="More help" src="http://localhost/moodle243/theme/image.php/standard/core/1365530675/docs" />More help</a></div>\n', 1365625595),
(73, '5bb5e57e14bf00e238fed83ee7ba2f6c', '<p>There is currently no help associated with this resource or activity</p>\n', 1365625595),
(74, '65c3b800228e7b1b39ba3fbca9bfdc5e', '<p>The chat activity module enables participants to have text-based, real-time synchronous discussions.</p>\n\n<p>The chat may be a one-time activity or it may be repeated at the same time each day or each week. Chat sessions are saved and can be made available for everyone to view or restricted to users with the capability to view chat session logs.</p>\n\n<p>Chats are especially useful when the group chatting is not able to meet face-to-face, such as</p>\n\n<ul><li>Regular meetings of students participating in online courses to enable them to share experiences with others in the same course but in a different location</li>\n<li>A student temporarily unable to attend in person chatting with their teacher to catch up with work</li>\n<li>Students out on work experience getting together to discuss their experiences with each other and their teacher</li>\n<li>Younger children using chat at home in the evenings as a controlled (monitored) introduction to the world of social networking</li>\n<li>A question and answer session with an invited speaker in a different location</li>\n<li>Sessions to help students prepare for tests where the teacher, or other students, would pose sample questions</li>\n</ul><div class="helpdoclink"><a href="http://docs.moodle.org/24/en/mod/chat/view" class="helplinkpopup"><img class="iconhelp icon-pre" alt="More help" title="More help" src="http://localhost/moodle243/theme/image.php/standard/core/1365530675/docs" />More help</a></div>\n', 1365625595),
(75, '88d914405d5d2ca38fe7537baa565d19', '<p>The choice activity module enables a teacher to ask a single question and offer a selection of possible responses.</p>\n\n<p>Choice results may be published after students have answered, after a certain date, or not at all. Results may be published with student names or anonymously.</p>\n\n<p>A choice activity may be used</p>\n\n<ul><li>As a quick poll to stimulate thinking about a topic</li>\n<li>To quickly test students'' understanding</li>\n<li>To facilitate student decision-making, for example allowing students to vote on a direction for the course</li>\n</ul><div class="helpdoclink"><a href="http://docs.moodle.org/24/en/mod/choice/view" class="helplinkpopup"><img class="iconhelp icon-pre" alt="More help" title="More help" src="http://localhost/moodle243/theme/image.php/standard/core/1365530675/docs" />More help</a></div>\n', 1365625595),
(76, '8df0a54b4d6837ac1551e9a94c7f5d19', '<p>The database activity module enables participants to create, maintain and search a collection of entries (i.e. records).  The structure of the entries is defined by the teacher as a number of fields. Field types include checkbox, radio buttons, dropdown menu, text area, URL, picture and uploaded file.</p>\n\n<p>The visual layout of information when listing, viewing or editing database entries may be controlled by database templates. Database activities may be shared between courses as presets and a teacher may also import and export database entries.</p>\n\n<p>If the database auto-linking filter is enabled, any entries in a database will be automatically linked where the words or phrases appear within the course.</p>\n\n<p>A teacher can allow comments on entries. Entries can also be rated by teachers or students (peer evaluation). Ratings can be aggregated to form a final grade which is recorded in the gradebook.</p>\n\n<p>Database activities have many uses, such as</p>\n\n<ul><li>A collaborative collection of web links, books, book reviews, journal references etc</li>\n<li>For displaying student-created photos, posters, websites or poems for peer comment and review</li>\n</ul><div class="helpdoclink"><a href="http://docs.moodle.org/24/en/mod/data/view" class="helplinkpopup"><img class="iconhelp icon-pre" alt="More help" title="More help" src="http://localhost/moodle243/theme/image.php/standard/core/1365530675/docs" />More help</a></div>\n', 1365625595),
(77, '178b51a8739e3e49b32c57b8b23e10a8', '<p>The external tool activity module enables students to interact with learning resources and activities on other web sites. For example, an external tool could provide access to a new activity type or learning materials from a publisher.</p>\n\n<p>To create an external tool activity, a tool provider which supports LTI (Learning Tools Interoperability) is required. A teacher can create an external tool activity or make use of a tool configured by the site administrator.</p>\n\n<p>External tool activities differ from URL resources in a few ways:</p>\n\n<ul><li>External tools are context aware i.e. they have access to information about the user who launched the tool, such as institution, course and name</li>\n<li>External tools support reading, updating, and deleting grades associated with the activity instance</li>\n<li>External tool configurations create a trust relationship between your site and the tool provider, allowing secure communication between them</li>\n</ul><div class="helpdoclink"><a href="http://docs.moodle.org/24/en/mod/lti/view" class="helplinkpopup"><img class="iconhelp icon-pre" alt="More help" title="More help" src="http://localhost/moodle243/theme/image.php/standard/core/1365530675/docs" />More help</a></div>\n', 1365625595),
(78, '08952e9f387f0fe4f7349395f2869a2c', '<p>The forum activity module enables participants to have asynchronous discussions i.e. discussions that take place over an extended period of time.</p>\n\n<p>There are several forum types to choose from, such as a standard forum where anyone can start a new discussion at any time; a forum where each student can post exactly one discussion; or a question and answer forum where students must first post before being able to view other students'' posts. A teacher can allow files to be attached to forum posts. Attached images are displayed in the forum post.</p>\n\n<p>Participants can subscribe to a forum to receive notifications of new forum posts. A teacher can set the subscription mode to optional, forced or auto, or prevent subscription completely. If required, students can be blocked from posting more than a given number of posts in a given time period; this can prevent individuals from dominating discussions.</p>\n\n<p>Forum posts can be rated by teachers or students (peer evaluation). Ratings can be aggregated to form a final grade which is recorded in the gradebook.</p>\n\n<p>Forums have many uses, such as</p>\n\n<ul><li>A social space for students to get to know each other</li>\n<li>For course announcements (using a news forum with forced subscription)</li>\n<li>For discussing course content or reading materials</li>\n<li>For continuing online an issue raised previously in a face-to-face session</li>\n<li>For teacher-only discussions (using a hidden forum)</li>\n<li>A help centre where tutors and students can give advice</li>\n<li>A one-on-one support area for private student-teacher communications (using a forum with separate groups and with one student per group)</li>\n<li>For extension activities, for example ‘brain teasers’ for students to ponder and suggest solutions to</li>\n</ul><div class="helpdoclink"><a href="http://docs.moodle.org/24/en/mod/forum/view" class="helplinkpopup"><img class="iconhelp icon-pre" alt="More help" title="More help" src="http://localhost/moodle243/theme/image.php/standard/core/1365530675/docs" />More help</a></div>\n', 1365625595),
(79, '5ac262fc3646dd16d9c9533705179af9', '<p>The glossary activity module enables participants to create and maintain a list of definitions, like a dictionary, or to collect and organise resources or information.</p>\n\n<p>A teacher can allow files to be attached to glossary entries. Attached images are displayed in the entry. Entries can be searched or browsed alphabetically or by category, date or author. Entries can be approved by default or require approval by a teacher before they are viewable by everyone.</p>\n\n<p>If the glossary auto-linking filter is enabled, entries will be automatically linked where the concept words and/or phrases appear within the course.</p>\n\n<p>A teacher can allow comments on entries. Entries can also be rated by teachers or students (peer evaluation). Ratings can be aggregated to form a final grade which is recorded in the gradebook.</p>\n\n<p>Glossaries have many uses, such as</p>\n\n<ul><li>A collaborative bank of key terms</li>\n<li>A ‘getting to know you’ space where new students add their name and personal details</li>\n<li>A ‘handy tips’ resource of best practice in a practical subject</li>\n<li>A sharing area of useful videos, images or sound files</li>\n<li>A revision resource of facts to remember</li>\n</ul><div class="helpdoclink"><a href="http://docs.moodle.org/24/en/mod/glossary/view" class="helplinkpopup"><img class="iconhelp icon-pre" alt="More help" title="More help" src="http://localhost/moodle243/theme/image.php/standard/core/1365530675/docs" />More help</a></div>\n', 1365625595),
(80, '8849cf283e024d7cb55a5e2f89550757', '<p>The lesson activity module enables a teacher to deliver content and/or practice activities in  interesting and flexible ways. A teacher can use the lesson to create a linear set of content pages or instructional activities that offer a variety of paths or options for the learner. In either case, teachers can choose to increase engagement and ensure understanding by including a variety of questions, such as multiple choice, matching and short answer. Depending on the student''s choice of answer and how the teacher develops the lesson, students may progress to the next page, be taken back to a previous page or redirected down a different path entirely.</p>\n\n<p>A lesson may be graded, with the grade recorded in the gradebook.</p>\n\n<p>Lessons may be used</p>\n\n<ul><li>For self-directed learning of a new topic</li>\n<li>For  scenarios or simulations/decision-making exercises</li>\n<li>For differentiated revision, with different sets of revision questions depending upon answers given to initial questions</li>\n</ul><div class="helpdoclink"><a href="http://docs.moodle.org/24/en/mod/lesson/view" class="helplinkpopup"><img class="iconhelp icon-pre" alt="More help" title="More help" src="http://localhost/moodle243/theme/image.php/standard/core/1365530675/docs" />More help</a></div>\n', 1365625595),
(81, 'a918e374b71fbdb8e9f407b305d768d1', '<p>The quiz activity enables a teacher to create quizzes comprising questions of various types, including multiple choice, matching, short-answer and numerical.</p>\n\n<p>The teacher can allow the quiz to be attempted multiple times, with the questions shuffled or randomly selected from the question bank. A time limit may be set.</p>\n\n<p>Each attempt is marked automatically, with the exception of essay questions, and the grade is recorded in the gradebook.</p>\n\n<p>The teacher can choose when and if hints, feedback and correct answers are shown to students.</p>\n\n<p>Quizzes may be used</p>\n\n<ul><li>As course exams</li>\n<li>As mini tests for reading assignments or at the end of a topic</li>\n<li>As exam practice using questions from past exams</li>\n<li>To deliver immediate feedback about performance</li>\n<li>For self-assessment</li>\n</ul><div class="helpdoclink"><a href="http://docs.moodle.org/24/en/mod/quiz/view" class="helplinkpopup"><img class="iconhelp icon-pre" alt="More help" title="More help" src="http://localhost/moodle243/theme/image.php/standard/core/1365530675/docs" />More help</a></div>\n', 1365625595),
(82, 'd3a6626e7178f68343882af00e9ee14c', '<p>A SCORM package is a collection of files which are packaged according to an agreed standard for learning objects. The SCORM activity module enables SCORM or AICC packages to be uploaded as a zip file and added to a course.</p>\n\n<p>Content is usually displayed over several pages, with navigation between the pages. There are various options for displaying content in a pop-up window, with a table of contents, with navigation buttons etc. SCORM activities generally include questions, with grades being recorded in the gradebook.</p>\n\n<p>SCORM activities may be used</p>\n\n<ul><li>For presenting multimedia content and animations</li>\n<li>As an assessment tool</li>\n</ul><div class="helpdoclink"><a href="http://docs.moodle.org/24/en/mod/scorm/view" class="helplinkpopup"><img class="iconhelp icon-pre" alt="More help" title="More help" src="http://localhost/moodle243/theme/image.php/standard/core/1365530675/docs" />More help</a></div>\n', 1365625595),
(83, '8b6eba438be6943c03a4400e4fd7587f', '<p>The survey activity module provides a number of verified survey instruments that have been found useful in assessing and stimulating learning in online environments. A teacher can use these to gather data from their students that will help them learn about their class and reflect on their own teaching.</p>\n\n<p>Note that these survey tools are pre-populated with questions. Teachers who wish to create their own survey should use the feedback activity module.</p>\n\n<div class="helpdoclink"><a href="http://docs.moodle.org/24/en/mod/survey/view" class="helplinkpopup"><img class="iconhelp icon-pre" alt="More help" title="More help" src="http://localhost/moodle243/theme/image.php/standard/core/1365530675/docs" />More help</a></div>\n', 1365625595),
(84, '2a0a56bd7c56df788716c6eb885e0eb0', '<p>The wiki activity module enables participants to add and edit a collection of web pages. A wiki can be collaborative, with everyone being able to edit it, or individual, where everyone has their own wiki which only they can edit.</p>\n\n<p>A history of previous versions of each page in the wiki is kept, listing the edits made by each participant.</p>\n\n<p>Wikis have many uses, such as</p>\n\n<ul><li>For group lecture notes or study guides</li>\n<li>For members of a faculty to plan a scheme of work or meeting agenda together</li>\n<li>For students to collaboratively author an online book, creating content on a topic set by their tutor</li>\n<li>For collaborative storytelling or poetry creation, where each participant writes a line or verse</li>\n<li>As a personal journal for examination notes or revision (using an individual wiki)</li>\n</ul><div class="helpdoclink"><a href="http://docs.moodle.org/24/en/mod/wiki/view" class="helplinkpopup"><img class="iconhelp icon-pre" alt="More help" title="More help" src="http://localhost/moodle243/theme/image.php/standard/core/1365530675/docs" />More help</a></div>\n', 1365625595),
(85, '5d099ff839ed5124d02bb02f1acf23e0', '<p>The workshop activity module enables the collection, review and peer assessment of students'' work.</p>\n\n<p>Students can submit any digital content (files), such as word-processed documents or spreadsheets and can also type text directly into a field using the text editor.</p>\n\n<p>Submissions are assessed using a multi-criteria assessment form defined by the teacher. The process of peer assessment and understanding the assessment form can be practised in advance with example submissions provided by the teacher, together with a reference assessment. Students are given the opportunity to assess one or more of their peers'' submissions. Submissions and reviewers may be anonymous if required.</p>\n\n<p>Students obtain two grades in a workshop activity - a grade for their submission and a grade for their assessment of their peers'' submissions. Both grades are recorded in the gradebook.</p>\n\n<div class="helpdoclink"><a href="http://docs.moodle.org/24/en/mod/workshop/view" class="helplinkpopup"><img class="iconhelp icon-pre" alt="More help" title="More help" src="http://localhost/moodle243/theme/image.php/standard/core/1365530675/docs" />More help</a></div>\n', 1365625595),
(86, 'ac253f987248d8cb2c5a5065e070cca8', '<p>The book module enables a teacher to create a multi-page resource in a book-like format, with chapters and subchapters. Books can contain media files as well as text and are useful for displaying lengthy passages of information which can be broken down into sections.</p>\n\n<p>A book may be used</p>\n\n<ul><li>To display reading material for individual modules of study</li>\n<li>As a staff departmental handbook</li>\n<li>As a showcase portfolio of student work</li>\n</ul><div class="helpdoclink"><a href="http://docs.moodle.org/24/en/mod/book/view" class="helplinkpopup"><img class="iconhelp icon-pre" alt="More help" title="More help" src="http://localhost/moodle243/theme/image.php/standard/core/1365530675/docs" />More help</a></div>\n', 1365625595),
(87, 'a8d2e53746e532e2736edcd50249ecb1', '<p>The file module enables a teacher to provide a file as a course resource. Where possible, the file will be displayed within the course interface; otherwise students will be prompted to download it. The file may include supporting files, for example an HTML page may have embedded images or Flash objects.</p>\n\n<p>Note that students need to have the appropriate software on their computers in order to open the file.</p>\n\n<p>A file may be used</p>\n\n<ul><li>To share presentations given in class</li>\n<li>To include a mini website as a course resource</li>\n<li>To provide draft files of certain software programs (eg Photoshop .psd) so students can edit and submit them for assessment</li>\n</ul><div class="helpdoclink"><a href="http://docs.moodle.org/24/en/mod/resource/view" class="helplinkpopup"><img class="iconhelp icon-pre" alt="More help" title="More help" src="http://localhost/moodle243/theme/image.php/standard/core/1365530675/docs" />More help</a></div>\n', 1365625595),
(88, '5a58771df957aa3df4f26d3f8711bd85', '<p>The folder module enables a teacher to display a number of related files inside a single folder, reducing scrolling on the course page. A zipped folder may be uploaded and unzipped for display, or an empty folder created and files uploaded into it.</p>\n\n<p>A folder may be used</p>\n\n<ul><li>For a series of files on one topic, for example a set of past examination papers in pdf format or a collection of image files for use in student projects</li>\n<li>To provide a shared uploading space for teachers on the course page (keeping the folder hidden so that only teachers can see it)</li>\n</ul><div class="helpdoclink"><a href="http://docs.moodle.org/24/en/mod/folder/view" class="helplinkpopup"><img class="iconhelp icon-pre" alt="More help" title="More help" src="http://localhost/moodle243/theme/image.php/standard/core/1365530675/docs" />More help</a></div>\n', 1365625595),
(89, '32cf64839e7e3f24002e16a3e5281e86', '<p>An IMS content package is a collection of files which are packaged according to an agreed standard so they can be reused in different systems. The IMS content package module enables such content packages to be uploaded as a zip file and added to a course as a resource.</p>\n\n<p>Content is usually displayed over several pages, with navigation between the pages. There are various options for displaying content in a pop-up window, with a navigation menu or buttons etc.</p>\n\n<p>An IMS content package may be used for presenting multimedia content and animations.</p>\n\n<div class="helpdoclink"><a href="http://docs.moodle.org/24/en/mod/imscp/view" class="helplinkpopup"><img class="iconhelp icon-pre" alt="More help" title="More help" src="http://localhost/moodle243/theme/image.php/standard/core/1365530675/docs" />More help</a></div>\n', 1365625595),
(90, '51db59b762bf55766e100a53c8e5f8f8', '<p>The label module enables text and multimedia to be inserted into the course page in between links to other resources and activities. Labels are very versatile and can help to improve the appearance of a course if used thoughtfully.</p>\n\n<p>Labels may be used</p>\n\n<ul><li>To split up a long list of activities with a subheading or an image</li>\n<li>To display an embedded sound file or video directly on the course page</li>\n<li>To add a short description to a course section</li>\n</ul><div class="helpdoclink"><a href="http://docs.moodle.org/24/en/mod/label/view" class="helplinkpopup"><img class="iconhelp icon-pre" alt="More help" title="More help" src="http://localhost/moodle243/theme/image.php/standard/core/1365530675/docs" />More help</a></div>\n', 1365625595),
(91, 'dda1125ecdca50d4cda46dda2302207e', '<p>The page module enables a teacher to create a web page resource using the text editor. A page can display text, images, sound, video, web links and embedded code, such as Google maps.</p>\n\n<p>Advantages of using the page module rather than the file module include the resource being more accessible (for example to users of mobile devices) and easier to update.</p>\n\n<p>For large amounts of content, it''s recommended that a book is used rather than a page.</p>\n\n<p>A page may be used</p>\n\n<ul><li>To present the terms and conditions of a course or a summary of the course syllabus</li>\n<li>To embed several videos or sound files together with some explanatory text</li>\n</ul><div class="helpdoclink"><a href="http://docs.moodle.org/24/en/mod/page/view" class="helplinkpopup"><img class="iconhelp icon-pre" alt="More help" title="More help" src="http://localhost/moodle243/theme/image.php/standard/core/1365530675/docs" />More help</a></div>\n', 1365625595),
(92, 'eba6d44cbfa11f213d58634050c16fe6', '<p>The URL module enables a teacher to provide a web link as a course resource. Anything that is freely available online, such as documents or images, can be linked to; the URL doesn’t have to be the home page of a website. The URL of a particular web page may be copied and pasted or a teacher can use the file picker and choose a link from a repository such as Flickr, YouTube or Wikimedia (depending upon which repositories are enabled for the site).</p>\n\n<p>There are a number of display options for the URL, such as embedded or opening in a new window and advanced options for passing information, such as a student''s name, to the URL if required.</p>\n\n<p>Note that URLs can also be added to any other resource or activity type through the text editor.</p>\n\n<div class="helpdoclink"><a href="http://docs.moodle.org/24/en/mod/url/view" class="helplinkpopup"><img class="iconhelp icon-pre" alt="More help" title="More help" src="http://localhost/moodle243/theme/image.php/standard/core/1365530675/docs" />More help</a></div>\n', 1365625595);
INSERT INTO `mdl_cache_text` (`id`, `md5key`, `formattedtext`, `timemodified`) VALUES
(93, '73bb06c927bb2bfacff8e87685156f33', '<p>When players are enabled in these settings, files can be embedded using the media filter (if enabled) or using a File or URL resources with the Embed option. When not enabled, these formats are not embedded and users can manually download or follow links to these resources.</p>\n\n<p>Where two players support the same format, enabling both increases compatibility across different devices such as mobile phones. It is possible to increase compatibility further by providing multiple files in different formats for a single audio or video clip.</p>\n', 1365623821),
(94, '67c7c00658d5e34185f5999aabc1e22e', '<p>When players are enabled in these settings, files can be embedded using the media filter (if enabled) or using a File or URL resources with the Embed option. When not enabled, these formats are not embedded and users can manually download or follow links to these resources.</p>\n\n<p>Where two players support the same format, enabling both increases compatibility across different devices such as mobile phones. It is possible to increase compatibility further by providing multiple files in different formats for a single audio or video clip.</p>\n', 1365624557),
(95, '9a98a84f39cf7fee8b10f9611db9a10a', '<p>When players are enabled in these settings, files can be embedded using the media filter (if enabled) or using a File or URL resources with the Embed option. When not enabled, these formats are not embedded and users can manually download or follow links to these resources.</p>\n\n<p>Where two players support the same format, enabling both increases compatibility across different devices such as mobile phones. It is possible to increase compatibility further by providing multiple files in different formats for a single audio or video clip.</p>\n', 1365625415),
(96, '48f1176142f1c6b92b4f5d26e1ad1b13', '<p>When players are enabled in these settings, files can be embedded using the media filter (if enabled) or using a File or URL resources with the Embed option. When not enabled, these formats are not embedded and users can manually download or follow links to these resources.</p>\n\n<p>Where two players support the same format, enabling both increases compatibility across different devices such as mobile phones. It is possible to increase compatibility further by providing multiple files in different formats for a single audio or video clip.</p>\n', 1365625428),
(97, '66963954f4a039994c58d27d7b93ef7c', '<p>When players are enabled in these settings, files can be embedded using the media filter (if enabled) or using a File or URL resources with the Embed option. When not enabled, these formats are not embedded and users can manually download or follow links to these resources.</p>\n\n<p>Where two players support the same format, enabling both increases compatibility across different devices such as mobile phones. It is possible to increase compatibility further by providing multiple files in different formats for a single audio or video clip.</p>\n', 1365625610),
(98, '1cf192db4dd626aadd44a1908c648335', '<p>When players are enabled in these settings, files can be embedded using the media filter (if enabled) or using a File or URL resources with the Embed option. When not enabled, these formats are not embedded and users can manually download or follow links to these resources.</p>\n\n<p>Where two players support the same format, enabling both increases compatibility across different devices such as mobile phones. It is possible to increase compatibility further by providing multiple files in different formats for a single audio or video clip.</p>\n', 1365626271),
(99, '6be34dd4d4bfa29a06481a54b541dc66', '<p>The assignment activity module enables a teacher to communicate tasks, collect work and provide grades and feedback.</p>\n\n<p>Students can submit any digital content (files), such as word-processed documents, spreadsheets, images, or audio and video clips. Alternatively, or in addition, the assignment may require students to type text directly into the text editor. An assignment can also be used to remind students of ''real-world'' assignments they need to complete offline, such as art work, and thus not require any digital content. Students can submit work individually or as a member of a group.</p>\n\n<p>When reviewing assignments, teachers can leave feedback comments and upload files, such as marked-up student submissions, documents with comments or spoken audio feedback. Assignments can be graded using a numerical or custom scale or an advanced grading method such as a rubric. Final grades are recorded in the gradebook.</p>\n\n<div class="helpdoclink"><a href="http://docs.moodle.org/24/en/mod/assignment/view" class="helplinkpopup"><img class="iconhelp icon-pre" alt="More help" title="More help" src="http://localhost/moodle243/theme/image.php/standard/core/1365530675/docs" />More help</a></div>\n', 1365626273),
(100, '7b83e33913f2c0261366fbd18825c48f', '<p>There is currently no help associated with this resource or activity</p>\n', 1365654173),
(101, 'ab4c33797fd6f172cf0742966508b42b', '<p>The chat activity module enables participants to have text-based, real-time synchronous discussions.</p>\n\n<p>The chat may be a one-time activity or it may be repeated at the same time each day or each week. Chat sessions are saved and can be made available for everyone to view or restricted to users with the capability to view chat session logs.</p>\n\n<p>Chats are especially useful when the group chatting is not able to meet face-to-face, such as</p>\n\n<ul><li>Regular meetings of students participating in online courses to enable them to share experiences with others in the same course but in a different location</li>\n<li>A student temporarily unable to attend in person chatting with their teacher to catch up with work</li>\n<li>Students out on work experience getting together to discuss their experiences with each other and their teacher</li>\n<li>Younger children using chat at home in the evenings as a controlled (monitored) introduction to the world of social networking</li>\n<li>A question and answer session with an invited speaker in a different location</li>\n<li>Sessions to help students prepare for tests where the teacher, or other students, would pose sample questions</li>\n</ul><div class="helpdoclink"><a href="http://docs.moodle.org/24/en/mod/chat/view" class="helplinkpopup"><img class="iconhelp icon-pre" alt="More help" title="More help" src="http://localhost/moodle243/theme/image.php/standard/core/1365530675/docs" />More help</a></div>\n', 1365626273),
(102, '700bfa237230edecf88f1f6d4dab46cf', '<p>The choice activity module enables a teacher to ask a single question and offer a selection of possible responses.</p>\n\n<p>Choice results may be published after students have answered, after a certain date, or not at all. Results may be published with student names or anonymously.</p>\n\n<p>A choice activity may be used</p>\n\n<ul><li>As a quick poll to stimulate thinking about a topic</li>\n<li>To quickly test students'' understanding</li>\n<li>To facilitate student decision-making, for example allowing students to vote on a direction for the course</li>\n</ul><div class="helpdoclink"><a href="http://docs.moodle.org/24/en/mod/choice/view" class="helplinkpopup"><img class="iconhelp icon-pre" alt="More help" title="More help" src="http://localhost/moodle243/theme/image.php/standard/core/1365530675/docs" />More help</a></div>\n', 1365626273),
(103, 'c99b55cd57154639de32d8fee1741965', '<p>The database activity module enables participants to create, maintain and search a collection of entries (i.e. records).  The structure of the entries is defined by the teacher as a number of fields. Field types include checkbox, radio buttons, dropdown menu, text area, URL, picture and uploaded file.</p>\n\n<p>The visual layout of information when listing, viewing or editing database entries may be controlled by database templates. Database activities may be shared between courses as presets and a teacher may also import and export database entries.</p>\n\n<p>If the database auto-linking filter is enabled, any entries in a database will be automatically linked where the words or phrases appear within the course.</p>\n\n<p>A teacher can allow comments on entries. Entries can also be rated by teachers or students (peer evaluation). Ratings can be aggregated to form a final grade which is recorded in the gradebook.</p>\n\n<p>Database activities have many uses, such as</p>\n\n<ul><li>A collaborative collection of web links, books, book reviews, journal references etc</li>\n<li>For displaying student-created photos, posters, websites or poems for peer comment and review</li>\n</ul><div class="helpdoclink"><a href="http://docs.moodle.org/24/en/mod/data/view" class="helplinkpopup"><img class="iconhelp icon-pre" alt="More help" title="More help" src="http://localhost/moodle243/theme/image.php/standard/core/1365530675/docs" />More help</a></div>\n', 1365626273),
(104, '796d0e63ed9961f4c1e9572e828abbdd', '<p>The external tool activity module enables students to interact with learning resources and activities on other web sites. For example, an external tool could provide access to a new activity type or learning materials from a publisher.</p>\n\n<p>To create an external tool activity, a tool provider which supports LTI (Learning Tools Interoperability) is required. A teacher can create an external tool activity or make use of a tool configured by the site administrator.</p>\n\n<p>External tool activities differ from URL resources in a few ways:</p>\n\n<ul><li>External tools are context aware i.e. they have access to information about the user who launched the tool, such as institution, course and name</li>\n<li>External tools support reading, updating, and deleting grades associated with the activity instance</li>\n<li>External tool configurations create a trust relationship between your site and the tool provider, allowing secure communication between them</li>\n</ul><div class="helpdoclink"><a href="http://docs.moodle.org/24/en/mod/lti/view" class="helplinkpopup"><img class="iconhelp icon-pre" alt="More help" title="More help" src="http://localhost/moodle243/theme/image.php/standard/core/1365530675/docs" />More help</a></div>\n', 1365626274),
(105, 'e18c812a4003ff124ee60835e24900a9', '<p>The forum activity module enables participants to have asynchronous discussions i.e. discussions that take place over an extended period of time.</p>\n\n<p>There are several forum types to choose from, such as a standard forum where anyone can start a new discussion at any time; a forum where each student can post exactly one discussion; or a question and answer forum where students must first post before being able to view other students'' posts. A teacher can allow files to be attached to forum posts. Attached images are displayed in the forum post.</p>\n\n<p>Participants can subscribe to a forum to receive notifications of new forum posts. A teacher can set the subscription mode to optional, forced or auto, or prevent subscription completely. If required, students can be blocked from posting more than a given number of posts in a given time period; this can prevent individuals from dominating discussions.</p>\n\n<p>Forum posts can be rated by teachers or students (peer evaluation). Ratings can be aggregated to form a final grade which is recorded in the gradebook.</p>\n\n<p>Forums have many uses, such as</p>\n\n<ul><li>A social space for students to get to know each other</li>\n<li>For course announcements (using a news forum with forced subscription)</li>\n<li>For discussing course content or reading materials</li>\n<li>For continuing online an issue raised previously in a face-to-face session</li>\n<li>For teacher-only discussions (using a hidden forum)</li>\n<li>A help centre where tutors and students can give advice</li>\n<li>A one-on-one support area for private student-teacher communications (using a forum with separate groups and with one student per group)</li>\n<li>For extension activities, for example ‘brain teasers’ for students to ponder and suggest solutions to</li>\n</ul><div class="helpdoclink"><a href="http://docs.moodle.org/24/en/mod/forum/view" class="helplinkpopup"><img class="iconhelp icon-pre" alt="More help" title="More help" src="http://localhost/moodle243/theme/image.php/standard/core/1365530675/docs" />More help</a></div>\n', 1365626274),
(106, '7978b66722986707109a1dbc40f0c078', '<p>The glossary activity module enables participants to create and maintain a list of definitions, like a dictionary, or to collect and organise resources or information.</p>\n\n<p>A teacher can allow files to be attached to glossary entries. Attached images are displayed in the entry. Entries can be searched or browsed alphabetically or by category, date or author. Entries can be approved by default or require approval by a teacher before they are viewable by everyone.</p>\n\n<p>If the glossary auto-linking filter is enabled, entries will be automatically linked where the concept words and/or phrases appear within the course.</p>\n\n<p>A teacher can allow comments on entries. Entries can also be rated by teachers or students (peer evaluation). Ratings can be aggregated to form a final grade which is recorded in the gradebook.</p>\n\n<p>Glossaries have many uses, such as</p>\n\n<ul><li>A collaborative bank of key terms</li>\n<li>A ‘getting to know you’ space where new students add their name and personal details</li>\n<li>A ‘handy tips’ resource of best practice in a practical subject</li>\n<li>A sharing area of useful videos, images or sound files</li>\n<li>A revision resource of facts to remember</li>\n</ul><div class="helpdoclink"><a href="http://docs.moodle.org/24/en/mod/glossary/view" class="helplinkpopup"><img class="iconhelp icon-pre" alt="More help" title="More help" src="http://localhost/moodle243/theme/image.php/standard/core/1365530675/docs" />More help</a></div>\n', 1365626274),
(107, 'e16fc9e854891bb1b6cace20f90b2e1c', '<p>The lesson activity module enables a teacher to deliver content and/or practice activities in  interesting and flexible ways. A teacher can use the lesson to create a linear set of content pages or instructional activities that offer a variety of paths or options for the learner. In either case, teachers can choose to increase engagement and ensure understanding by including a variety of questions, such as multiple choice, matching and short answer. Depending on the student''s choice of answer and how the teacher develops the lesson, students may progress to the next page, be taken back to a previous page or redirected down a different path entirely.</p>\n\n<p>A lesson may be graded, with the grade recorded in the gradebook.</p>\n\n<p>Lessons may be used</p>\n\n<ul><li>For self-directed learning of a new topic</li>\n<li>For  scenarios or simulations/decision-making exercises</li>\n<li>For differentiated revision, with different sets of revision questions depending upon answers given to initial questions</li>\n</ul><div class="helpdoclink"><a href="http://docs.moodle.org/24/en/mod/lesson/view" class="helplinkpopup"><img class="iconhelp icon-pre" alt="More help" title="More help" src="http://localhost/moodle243/theme/image.php/standard/core/1365530675/docs" />More help</a></div>\n', 1365626274),
(108, '92559f3a4ae179f98c22f9e7d794e97c', '<p>The quiz activity enables a teacher to create quizzes comprising questions of various types, including multiple choice, matching, short-answer and numerical.</p>\n\n<p>The teacher can allow the quiz to be attempted multiple times, with the questions shuffled or randomly selected from the question bank. A time limit may be set.</p>\n\n<p>Each attempt is marked automatically, with the exception of essay questions, and the grade is recorded in the gradebook.</p>\n\n<p>The teacher can choose when and if hints, feedback and correct answers are shown to students.</p>\n\n<p>Quizzes may be used</p>\n\n<ul><li>As course exams</li>\n<li>As mini tests for reading assignments or at the end of a topic</li>\n<li>As exam practice using questions from past exams</li>\n<li>To deliver immediate feedback about performance</li>\n<li>For self-assessment</li>\n</ul><div class="helpdoclink"><a href="http://docs.moodle.org/24/en/mod/quiz/view" class="helplinkpopup"><img class="iconhelp icon-pre" alt="More help" title="More help" src="http://localhost/moodle243/theme/image.php/standard/core/1365530675/docs" />More help</a></div>\n', 1365626274),
(109, '8e63087515e39bf0fa1483c5662b9683', '<p>A SCORM package is a collection of files which are packaged according to an agreed standard for learning objects. The SCORM activity module enables SCORM or AICC packages to be uploaded as a zip file and added to a course.</p>\n\n<p>Content is usually displayed over several pages, with navigation between the pages. There are various options for displaying content in a pop-up window, with a table of contents, with navigation buttons etc. SCORM activities generally include questions, with grades being recorded in the gradebook.</p>\n\n<p>SCORM activities may be used</p>\n\n<ul><li>For presenting multimedia content and animations</li>\n<li>As an assessment tool</li>\n</ul><div class="helpdoclink"><a href="http://docs.moodle.org/24/en/mod/scorm/view" class="helplinkpopup"><img class="iconhelp icon-pre" alt="More help" title="More help" src="http://localhost/moodle243/theme/image.php/standard/core/1365530675/docs" />More help</a></div>\n', 1365626274),
(110, '7a63e4575863cce99e33a486047d3ee7', '<p>The survey activity module provides a number of verified survey instruments that have been found useful in assessing and stimulating learning in online environments. A teacher can use these to gather data from their students that will help them learn about their class and reflect on their own teaching.</p>\n\n<p>Note that these survey tools are pre-populated with questions. Teachers who wish to create their own survey should use the feedback activity module.</p>\n\n<div class="helpdoclink"><a href="http://docs.moodle.org/24/en/mod/survey/view" class="helplinkpopup"><img class="iconhelp icon-pre" alt="More help" title="More help" src="http://localhost/moodle243/theme/image.php/standard/core/1365530675/docs" />More help</a></div>\n', 1365626274),
(111, '152adf8cfd555c9124df0dc60618cb78', '<p>The wiki activity module enables participants to add and edit a collection of web pages. A wiki can be collaborative, with everyone being able to edit it, or individual, where everyone has their own wiki which only they can edit.</p>\n\n<p>A history of previous versions of each page in the wiki is kept, listing the edits made by each participant.</p>\n\n<p>Wikis have many uses, such as</p>\n\n<ul><li>For group lecture notes or study guides</li>\n<li>For members of a faculty to plan a scheme of work or meeting agenda together</li>\n<li>For students to collaboratively author an online book, creating content on a topic set by their tutor</li>\n<li>For collaborative storytelling or poetry creation, where each participant writes a line or verse</li>\n<li>As a personal journal for examination notes or revision (using an individual wiki)</li>\n</ul><div class="helpdoclink"><a href="http://docs.moodle.org/24/en/mod/wiki/view" class="helplinkpopup"><img class="iconhelp icon-pre" alt="More help" title="More help" src="http://localhost/moodle243/theme/image.php/standard/core/1365530675/docs" />More help</a></div>\n', 1365626274),
(112, '87dac9e585ddf7d0a9d9988176d2bbe3', '<p>The workshop activity module enables the collection, review and peer assessment of students'' work.</p>\n\n<p>Students can submit any digital content (files), such as word-processed documents or spreadsheets and can also type text directly into a field using the text editor.</p>\n\n<p>Submissions are assessed using a multi-criteria assessment form defined by the teacher. The process of peer assessment and understanding the assessment form can be practised in advance with example submissions provided by the teacher, together with a reference assessment. Students are given the opportunity to assess one or more of their peers'' submissions. Submissions and reviewers may be anonymous if required.</p>\n\n<p>Students obtain two grades in a workshop activity - a grade for their submission and a grade for their assessment of their peers'' submissions. Both grades are recorded in the gradebook.</p>\n\n<div class="helpdoclink"><a href="http://docs.moodle.org/24/en/mod/workshop/view" class="helplinkpopup"><img class="iconhelp icon-pre" alt="More help" title="More help" src="http://localhost/moodle243/theme/image.php/standard/core/1365530675/docs" />More help</a></div>\n', 1365626274),
(113, 'f60f30d20894033fd11cd4ac05573cde', '<p>The book module enables a teacher to create a multi-page resource in a book-like format, with chapters and subchapters. Books can contain media files as well as text and are useful for displaying lengthy passages of information which can be broken down into sections.</p>\n\n<p>A book may be used</p>\n\n<ul><li>To display reading material for individual modules of study</li>\n<li>As a staff departmental handbook</li>\n<li>As a showcase portfolio of student work</li>\n</ul><div class="helpdoclink"><a href="http://docs.moodle.org/24/en/mod/book/view" class="helplinkpopup"><img class="iconhelp icon-pre" alt="More help" title="More help" src="http://localhost/moodle243/theme/image.php/standard/core/1365530675/docs" />More help</a></div>\n', 1365626274),
(114, '5e63794929642aa3c2e296c6aad9078b', '<p>The file module enables a teacher to provide a file as a course resource. Where possible, the file will be displayed within the course interface; otherwise students will be prompted to download it. The file may include supporting files, for example an HTML page may have embedded images or Flash objects.</p>\n\n<p>Note that students need to have the appropriate software on their computers in order to open the file.</p>\n\n<p>A file may be used</p>\n\n<ul><li>To share presentations given in class</li>\n<li>To include a mini website as a course resource</li>\n<li>To provide draft files of certain software programs (eg Photoshop .psd) so students can edit and submit them for assessment</li>\n</ul><div class="helpdoclink"><a href="http://docs.moodle.org/24/en/mod/resource/view" class="helplinkpopup"><img class="iconhelp icon-pre" alt="More help" title="More help" src="http://localhost/moodle243/theme/image.php/standard/core/1365530675/docs" />More help</a></div>\n', 1365626274),
(115, '4dc687e76134474414886f9f4e85c3dc', '<p>The folder module enables a teacher to display a number of related files inside a single folder, reducing scrolling on the course page. A zipped folder may be uploaded and unzipped for display, or an empty folder created and files uploaded into it.</p>\n\n<p>A folder may be used</p>\n\n<ul><li>For a series of files on one topic, for example a set of past examination papers in pdf format or a collection of image files for use in student projects</li>\n<li>To provide a shared uploading space for teachers on the course page (keeping the folder hidden so that only teachers can see it)</li>\n</ul><div class="helpdoclink"><a href="http://docs.moodle.org/24/en/mod/folder/view" class="helplinkpopup"><img class="iconhelp icon-pre" alt="More help" title="More help" src="http://localhost/moodle243/theme/image.php/standard/core/1365530675/docs" />More help</a></div>\n', 1365626274),
(116, 'b62455517a6a0e1de3ffc3091188e57c', '<p>An IMS content package is a collection of files which are packaged according to an agreed standard so they can be reused in different systems. The IMS content package module enables such content packages to be uploaded as a zip file and added to a course as a resource.</p>\n\n<p>Content is usually displayed over several pages, with navigation between the pages. There are various options for displaying content in a pop-up window, with a navigation menu or buttons etc.</p>\n\n<p>An IMS content package may be used for presenting multimedia content and animations.</p>\n\n<div class="helpdoclink"><a href="http://docs.moodle.org/24/en/mod/imscp/view" class="helplinkpopup"><img class="iconhelp icon-pre" alt="More help" title="More help" src="http://localhost/moodle243/theme/image.php/standard/core/1365530675/docs" />More help</a></div>\n', 1365626274),
(117, 'd0d2c18134166fa97fd2d4375522699d', '<p>The label module enables text and multimedia to be inserted into the course page in between links to other resources and activities. Labels are very versatile and can help to improve the appearance of a course if used thoughtfully.</p>\n\n<p>Labels may be used</p>\n\n<ul><li>To split up a long list of activities with a subheading or an image</li>\n<li>To display an embedded sound file or video directly on the course page</li>\n<li>To add a short description to a course section</li>\n</ul><div class="helpdoclink"><a href="http://docs.moodle.org/24/en/mod/label/view" class="helplinkpopup"><img class="iconhelp icon-pre" alt="More help" title="More help" src="http://localhost/moodle243/theme/image.php/standard/core/1365530675/docs" />More help</a></div>\n', 1365626274),
(118, '3bb7b2467ff3fd20eba33bf422ee214e', '<p>The page module enables a teacher to create a web page resource using the text editor. A page can display text, images, sound, video, web links and embedded code, such as Google maps.</p>\n\n<p>Advantages of using the page module rather than the file module include the resource being more accessible (for example to users of mobile devices) and easier to update.</p>\n\n<p>For large amounts of content, it''s recommended that a book is used rather than a page.</p>\n\n<p>A page may be used</p>\n\n<ul><li>To present the terms and conditions of a course or a summary of the course syllabus</li>\n<li>To embed several videos or sound files together with some explanatory text</li>\n</ul><div class="helpdoclink"><a href="http://docs.moodle.org/24/en/mod/page/view" class="helplinkpopup"><img class="iconhelp icon-pre" alt="More help" title="More help" src="http://localhost/moodle243/theme/image.php/standard/core/1365530675/docs" />More help</a></div>\n', 1365626274),
(119, '8e8fcae550fb91638b873eee368f86f1', '<p>The URL module enables a teacher to provide a web link as a course resource. Anything that is freely available online, such as documents or images, can be linked to; the URL doesn’t have to be the home page of a website. The URL of a particular web page may be copied and pasted or a teacher can use the file picker and choose a link from a repository such as Flickr, YouTube or Wikimedia (depending upon which repositories are enabled for the site).</p>\n\n<p>There are a number of display options for the URL, such as embedded or opening in a new window and advanced options for passing information, such as a student''s name, to the URL if required.</p>\n\n<p>Note that URLs can also be added to any other resource or activity type through the text editor.</p>\n\n<div class="helpdoclink"><a href="http://docs.moodle.org/24/en/mod/url/view" class="helplinkpopup"><img class="iconhelp icon-pre" alt="More help" title="More help" src="http://localhost/moodle243/theme/image.php/standard/core/1365530675/docs" />More help</a></div>\n', 1365626274),
(120, 'c984fd828caad1f609cbe52046957aa1', '<p>When players are enabled in these settings, files can be embedded using the media filter (if enabled) or using a File or URL resources with the Embed option. When not enabled, these formats are not embedded and users can manually download or follow links to these resources.</p>\n\n<p>Where two players support the same format, enabling both increases compatibility across different devices such as mobile phones. It is possible to increase compatibility further by providing multiple files in different formats for a single audio or video clip.</p>\n', 1365625834),
(121, '899189f6f19b6fb65fa3f5b159f2a5e2', '<p>When players are enabled in these settings, files can be embedded using the media filter (if enabled) or using a File or URL resources with the Embed option. When not enabled, these formats are not embedded and users can manually download or follow links to these resources.</p>\n\n<p>Where two players support the same format, enabling both increases compatibility across different devices such as mobile phones. It is possible to increase compatibility further by providing multiple files in different formats for a single audio or video clip.</p>\n', 1365626227),
(122, '0afe56e530607ac382c135babe7bf4ef', '<p>When players are enabled in these settings, files can be embedded using the media filter (if enabled) or using a File or URL resources with the Embed option. When not enabled, these formats are not embedded and users can manually download or follow links to these resources.</p>\n\n<p>Where two players support the same format, enabling both increases compatibility across different devices such as mobile phones. It is possible to increase compatibility further by providing multiple files in different formats for a single audio or video clip.</p>\n', 1365626350),
(123, 'f8c40de10935e52fe3caa5cbcc8d1a9b', '<p>When players are enabled in these settings, files can be embedded using the media filter (if enabled) or using a File or URL resources with the Embed option. When not enabled, these formats are not embedded and users can manually download or follow links to these resources.</p>\n\n<p>Where two players support the same format, enabling both increases compatibility across different devices such as mobile phones. It is possible to increase compatibility further by providing multiple files in different formats for a single audio or video clip.</p>\n', 1365653921),
(124, '87bbc462df298f6230aff5a24fe0d484', '<p>When players are enabled in these settings, files can be embedded using the media filter (if enabled) or using a File or URL resources with the Embed option. When not enabled, these formats are not embedded and users can manually download or follow links to these resources.</p>\n\n<p>Where two players support the same format, enabling both increases compatibility across different devices such as mobile phones. It is possible to increase compatibility further by providing multiple files in different formats for a single audio or video clip.</p>\n', 1365654169),
(125, '1d926ba90553690f9e7c9d4f1bcda161', '<p>The assignment activity module enables a teacher to communicate tasks, collect work and provide grades and feedback.</p>\n\n<p>Students can submit any digital content (files), such as word-processed documents, spreadsheets, images, or audio and video clips. Alternatively, or in addition, the assignment may require students to type text directly into the text editor. An assignment can also be used to remind students of ''real-world'' assignments they need to complete offline, such as art work, and thus not require any digital content. Students can submit work individually or as a member of a group.</p>\n\n<p>When reviewing assignments, teachers can leave feedback comments and upload files, such as marked-up student submissions, documents with comments or spoken audio feedback. Assignments can be graded using a numerical or custom scale or an advanced grading method such as a rubric. Final grades are recorded in the gradebook.</p>\n\n<div class="helpdoclink"><a href="http://docs.moodle.org/24/en/mod/assignment/view" class="helplinkpopup"><img class="iconhelp icon-pre" alt="More help" title="More help" src="http://localhost/m123/theme/image.php/standard/core/1365530675/docs" />More help</a></div>\n', 1365654173),
(126, '98e1c995665f0f235238645e66b070e1', '<p>The chat activity module enables participants to have text-based, real-time synchronous discussions.</p>\n\n<p>The chat may be a one-time activity or it may be repeated at the same time each day or each week. Chat sessions are saved and can be made available for everyone to view or restricted to users with the capability to view chat session logs.</p>\n\n<p>Chats are especially useful when the group chatting is not able to meet face-to-face, such as</p>\n\n<ul><li>Regular meetings of students participating in online courses to enable them to share experiences with others in the same course but in a different location</li>\n<li>A student temporarily unable to attend in person chatting with their teacher to catch up with work</li>\n<li>Students out on work experience getting together to discuss their experiences with each other and their teacher</li>\n<li>Younger children using chat at home in the evenings as a controlled (monitored) introduction to the world of social networking</li>\n<li>A question and answer session with an invited speaker in a different location</li>\n<li>Sessions to help students prepare for tests where the teacher, or other students, would pose sample questions</li>\n</ul><div class="helpdoclink"><a href="http://docs.moodle.org/24/en/mod/chat/view" class="helplinkpopup"><img class="iconhelp icon-pre" alt="More help" title="More help" src="http://localhost/m123/theme/image.php/standard/core/1365530675/docs" />More help</a></div>\n', 1365654173),
(127, 'e1ac2b159f9a0dedd6dc21427ba4724b', '<p>The choice activity module enables a teacher to ask a single question and offer a selection of possible responses.</p>\n\n<p>Choice results may be published after students have answered, after a certain date, or not at all. Results may be published with student names or anonymously.</p>\n\n<p>A choice activity may be used</p>\n\n<ul><li>As a quick poll to stimulate thinking about a topic</li>\n<li>To quickly test students'' understanding</li>\n<li>To facilitate student decision-making, for example allowing students to vote on a direction for the course</li>\n</ul><div class="helpdoclink"><a href="http://docs.moodle.org/24/en/mod/choice/view" class="helplinkpopup"><img class="iconhelp icon-pre" alt="More help" title="More help" src="http://localhost/m123/theme/image.php/standard/core/1365530675/docs" />More help</a></div>\n', 1365654173),
(128, '93f0b28f19884cc7c6bbb1e657ce2d3a', '<p>The database activity module enables participants to create, maintain and search a collection of entries (i.e. records).  The structure of the entries is defined by the teacher as a number of fields. Field types include checkbox, radio buttons, dropdown menu, text area, URL, picture and uploaded file.</p>\n\n<p>The visual layout of information when listing, viewing or editing database entries may be controlled by database templates. Database activities may be shared between courses as presets and a teacher may also import and export database entries.</p>\n\n<p>If the database auto-linking filter is enabled, any entries in a database will be automatically linked where the words or phrases appear within the course.</p>\n\n<p>A teacher can allow comments on entries. Entries can also be rated by teachers or students (peer evaluation). Ratings can be aggregated to form a final grade which is recorded in the gradebook.</p>\n\n<p>Database activities have many uses, such as</p>\n\n<ul><li>A collaborative collection of web links, books, book reviews, journal references etc</li>\n<li>For displaying student-created photos, posters, websites or poems for peer comment and review</li>\n</ul><div class="helpdoclink"><a href="http://docs.moodle.org/24/en/mod/data/view" class="helplinkpopup"><img class="iconhelp icon-pre" alt="More help" title="More help" src="http://localhost/m123/theme/image.php/standard/core/1365530675/docs" />More help</a></div>\n', 1365654173),
(129, '25eb402a8034b2a2c55b57613c933346', '<p>The external tool activity module enables students to interact with learning resources and activities on other web sites. For example, an external tool could provide access to a new activity type or learning materials from a publisher.</p>\n\n<p>To create an external tool activity, a tool provider which supports LTI (Learning Tools Interoperability) is required. A teacher can create an external tool activity or make use of a tool configured by the site administrator.</p>\n\n<p>External tool activities differ from URL resources in a few ways:</p>\n\n<ul><li>External tools are context aware i.e. they have access to information about the user who launched the tool, such as institution, course and name</li>\n<li>External tools support reading, updating, and deleting grades associated with the activity instance</li>\n<li>External tool configurations create a trust relationship between your site and the tool provider, allowing secure communication between them</li>\n</ul><div class="helpdoclink"><a href="http://docs.moodle.org/24/en/mod/lti/view" class="helplinkpopup"><img class="iconhelp icon-pre" alt="More help" title="More help" src="http://localhost/m123/theme/image.php/standard/core/1365530675/docs" />More help</a></div>\n', 1365654173),
(130, '6cc52b369a337ddfb59083878a67a160', '<p>The forum activity module enables participants to have asynchronous discussions i.e. discussions that take place over an extended period of time.</p>\n\n<p>There are several forum types to choose from, such as a standard forum where anyone can start a new discussion at any time; a forum where each student can post exactly one discussion; or a question and answer forum where students must first post before being able to view other students'' posts. A teacher can allow files to be attached to forum posts. Attached images are displayed in the forum post.</p>\n\n<p>Participants can subscribe to a forum to receive notifications of new forum posts. A teacher can set the subscription mode to optional, forced or auto, or prevent subscription completely. If required, students can be blocked from posting more than a given number of posts in a given time period; this can prevent individuals from dominating discussions.</p>\n\n<p>Forum posts can be rated by teachers or students (peer evaluation). Ratings can be aggregated to form a final grade which is recorded in the gradebook.</p>\n\n<p>Forums have many uses, such as</p>\n\n<ul><li>A social space for students to get to know each other</li>\n<li>For course announcements (using a news forum with forced subscription)</li>\n<li>For discussing course content or reading materials</li>\n<li>For continuing online an issue raised previously in a face-to-face session</li>\n<li>For teacher-only discussions (using a hidden forum)</li>\n<li>A help centre where tutors and students can give advice</li>\n<li>A one-on-one support area for private student-teacher communications (using a forum with separate groups and with one student per group)</li>\n<li>For extension activities, for example ‘brain teasers’ for students to ponder and suggest solutions to</li>\n</ul><div class="helpdoclink"><a href="http://docs.moodle.org/24/en/mod/forum/view" class="helplinkpopup"><img class="iconhelp icon-pre" alt="More help" title="More help" src="http://localhost/m123/theme/image.php/standard/core/1365530675/docs" />More help</a></div>\n', 1365654174),
(131, 'fcb72d012ca790979ee8b4ae979c04b1', '<p>The glossary activity module enables participants to create and maintain a list of definitions, like a dictionary, or to collect and organise resources or information.</p>\n\n<p>A teacher can allow files to be attached to glossary entries. Attached images are displayed in the entry. Entries can be searched or browsed alphabetically or by category, date or author. Entries can be approved by default or require approval by a teacher before they are viewable by everyone.</p>\n\n<p>If the glossary auto-linking filter is enabled, entries will be automatically linked where the concept words and/or phrases appear within the course.</p>\n\n<p>A teacher can allow comments on entries. Entries can also be rated by teachers or students (peer evaluation). Ratings can be aggregated to form a final grade which is recorded in the gradebook.</p>\n\n<p>Glossaries have many uses, such as</p>\n\n<ul><li>A collaborative bank of key terms</li>\n<li>A ‘getting to know you’ space where new students add their name and personal details</li>\n<li>A ‘handy tips’ resource of best practice in a practical subject</li>\n<li>A sharing area of useful videos, images or sound files</li>\n<li>A revision resource of facts to remember</li>\n</ul><div class="helpdoclink"><a href="http://docs.moodle.org/24/en/mod/glossary/view" class="helplinkpopup"><img class="iconhelp icon-pre" alt="More help" title="More help" src="http://localhost/m123/theme/image.php/standard/core/1365530675/docs" />More help</a></div>\n', 1365654174),
(132, 'c329af801b447933a5c054fb23e978b0', '<p>The lesson activity module enables a teacher to deliver content and/or practice activities in  interesting and flexible ways. A teacher can use the lesson to create a linear set of content pages or instructional activities that offer a variety of paths or options for the learner. In either case, teachers can choose to increase engagement and ensure understanding by including a variety of questions, such as multiple choice, matching and short answer. Depending on the student''s choice of answer and how the teacher develops the lesson, students may progress to the next page, be taken back to a previous page or redirected down a different path entirely.</p>\n\n<p>A lesson may be graded, with the grade recorded in the gradebook.</p>\n\n<p>Lessons may be used</p>\n\n<ul><li>For self-directed learning of a new topic</li>\n<li>For  scenarios or simulations/decision-making exercises</li>\n<li>For differentiated revision, with different sets of revision questions depending upon answers given to initial questions</li>\n</ul><div class="helpdoclink"><a href="http://docs.moodle.org/24/en/mod/lesson/view" class="helplinkpopup"><img class="iconhelp icon-pre" alt="More help" title="More help" src="http://localhost/m123/theme/image.php/standard/core/1365530675/docs" />More help</a></div>\n', 1365654174),
(133, '4fd2f40cebddef25e0ece4319021bb43', '<p>The quiz activity enables a teacher to create quizzes comprising questions of various types, including multiple choice, matching, short-answer and numerical.</p>\n\n<p>The teacher can allow the quiz to be attempted multiple times, with the questions shuffled or randomly selected from the question bank. A time limit may be set.</p>\n\n<p>Each attempt is marked automatically, with the exception of essay questions, and the grade is recorded in the gradebook.</p>\n\n<p>The teacher can choose when and if hints, feedback and correct answers are shown to students.</p>\n\n<p>Quizzes may be used</p>\n\n<ul><li>As course exams</li>\n<li>As mini tests for reading assignments or at the end of a topic</li>\n<li>As exam practice using questions from past exams</li>\n<li>To deliver immediate feedback about performance</li>\n<li>For self-assessment</li>\n</ul><div class="helpdoclink"><a href="http://docs.moodle.org/24/en/mod/quiz/view" class="helplinkpopup"><img class="iconhelp icon-pre" alt="More help" title="More help" src="http://localhost/m123/theme/image.php/standard/core/1365530675/docs" />More help</a></div>\n', 1365654174),
(134, '5336e5f69abfd8bbbe2219c92779aa1b', '<p>A SCORM package is a collection of files which are packaged according to an agreed standard for learning objects. The SCORM activity module enables SCORM or AICC packages to be uploaded as a zip file and added to a course.</p>\n\n<p>Content is usually displayed over several pages, with navigation between the pages. There are various options for displaying content in a pop-up window, with a table of contents, with navigation buttons etc. SCORM activities generally include questions, with grades being recorded in the gradebook.</p>\n\n<p>SCORM activities may be used</p>\n\n<ul><li>For presenting multimedia content and animations</li>\n<li>As an assessment tool</li>\n</ul><div class="helpdoclink"><a href="http://docs.moodle.org/24/en/mod/scorm/view" class="helplinkpopup"><img class="iconhelp icon-pre" alt="More help" title="More help" src="http://localhost/m123/theme/image.php/standard/core/1365530675/docs" />More help</a></div>\n', 1365654174),
(135, 'b980748728b3bb3b8bfd25731dfa4edd', '<p>The survey activity module provides a number of verified survey instruments that have been found useful in assessing and stimulating learning in online environments. A teacher can use these to gather data from their students that will help them learn about their class and reflect on their own teaching.</p>\n\n<p>Note that these survey tools are pre-populated with questions. Teachers who wish to create their own survey should use the feedback activity module.</p>\n\n<div class="helpdoclink"><a href="http://docs.moodle.org/24/en/mod/survey/view" class="helplinkpopup"><img class="iconhelp icon-pre" alt="More help" title="More help" src="http://localhost/m123/theme/image.php/standard/core/1365530675/docs" />More help</a></div>\n', 1365654174),
(136, '97637afcf4665d2ae405cb36a4a72a5c', '<p>The wiki activity module enables participants to add and edit a collection of web pages. A wiki can be collaborative, with everyone being able to edit it, or individual, where everyone has their own wiki which only they can edit.</p>\n\n<p>A history of previous versions of each page in the wiki is kept, listing the edits made by each participant.</p>\n\n<p>Wikis have many uses, such as</p>\n\n<ul><li>For group lecture notes or study guides</li>\n<li>For members of a faculty to plan a scheme of work or meeting agenda together</li>\n<li>For students to collaboratively author an online book, creating content on a topic set by their tutor</li>\n<li>For collaborative storytelling or poetry creation, where each participant writes a line or verse</li>\n<li>As a personal journal for examination notes or revision (using an individual wiki)</li>\n</ul><div class="helpdoclink"><a href="http://docs.moodle.org/24/en/mod/wiki/view" class="helplinkpopup"><img class="iconhelp icon-pre" alt="More help" title="More help" src="http://localhost/m123/theme/image.php/standard/core/1365530675/docs" />More help</a></div>\n', 1365654174),
(137, '3a2b7a61954d27a4b30e488124d89a8f', '<p>The workshop activity module enables the collection, review and peer assessment of students'' work.</p>\n\n<p>Students can submit any digital content (files), such as word-processed documents or spreadsheets and can also type text directly into a field using the text editor.</p>\n\n<p>Submissions are assessed using a multi-criteria assessment form defined by the teacher. The process of peer assessment and understanding the assessment form can be practised in advance with example submissions provided by the teacher, together with a reference assessment. Students are given the opportunity to assess one or more of their peers'' submissions. Submissions and reviewers may be anonymous if required.</p>\n\n<p>Students obtain two grades in a workshop activity - a grade for their submission and a grade for their assessment of their peers'' submissions. Both grades are recorded in the gradebook.</p>\n\n<div class="helpdoclink"><a href="http://docs.moodle.org/24/en/mod/workshop/view" class="helplinkpopup"><img class="iconhelp icon-pre" alt="More help" title="More help" src="http://localhost/m123/theme/image.php/standard/core/1365530675/docs" />More help</a></div>\n', 1365654174),
(138, 'df0b060fa3dbc9226e7cdbcb7abd6158', '<p>The book module enables a teacher to create a multi-page resource in a book-like format, with chapters and subchapters. Books can contain media files as well as text and are useful for displaying lengthy passages of information which can be broken down into sections.</p>\n\n<p>A book may be used</p>\n\n<ul><li>To display reading material for individual modules of study</li>\n<li>As a staff departmental handbook</li>\n<li>As a showcase portfolio of student work</li>\n</ul><div class="helpdoclink"><a href="http://docs.moodle.org/24/en/mod/book/view" class="helplinkpopup"><img class="iconhelp icon-pre" alt="More help" title="More help" src="http://localhost/m123/theme/image.php/standard/core/1365530675/docs" />More help</a></div>\n', 1365654174),
(139, '833dbd9b452c3b9f2ee99ef6f2fc32c0', '<p>The file module enables a teacher to provide a file as a course resource. Where possible, the file will be displayed within the course interface; otherwise students will be prompted to download it. The file may include supporting files, for example an HTML page may have embedded images or Flash objects.</p>\n\n<p>Note that students need to have the appropriate software on their computers in order to open the file.</p>\n\n<p>A file may be used</p>\n\n<ul><li>To share presentations given in class</li>\n<li>To include a mini website as a course resource</li>\n<li>To provide draft files of certain software programs (eg Photoshop .psd) so students can edit and submit them for assessment</li>\n</ul><div class="helpdoclink"><a href="http://docs.moodle.org/24/en/mod/resource/view" class="helplinkpopup"><img class="iconhelp icon-pre" alt="More help" title="More help" src="http://localhost/m123/theme/image.php/standard/core/1365530675/docs" />More help</a></div>\n', 1365654174);
INSERT INTO `mdl_cache_text` (`id`, `md5key`, `formattedtext`, `timemodified`) VALUES
(140, '16aef0f02053207e4404a8c11946ac92', '<p>The folder module enables a teacher to display a number of related files inside a single folder, reducing scrolling on the course page. A zipped folder may be uploaded and unzipped for display, or an empty folder created and files uploaded into it.</p>\n\n<p>A folder may be used</p>\n\n<ul><li>For a series of files on one topic, for example a set of past examination papers in pdf format or a collection of image files for use in student projects</li>\n<li>To provide a shared uploading space for teachers on the course page (keeping the folder hidden so that only teachers can see it)</li>\n</ul><div class="helpdoclink"><a href="http://docs.moodle.org/24/en/mod/folder/view" class="helplinkpopup"><img class="iconhelp icon-pre" alt="More help" title="More help" src="http://localhost/m123/theme/image.php/standard/core/1365530675/docs" />More help</a></div>\n', 1365654174),
(141, '1ac28307fa15dd4117ab836424c2e6a5', '<p>An IMS content package is a collection of files which are packaged according to an agreed standard so they can be reused in different systems. The IMS content package module enables such content packages to be uploaded as a zip file and added to a course as a resource.</p>\n\n<p>Content is usually displayed over several pages, with navigation between the pages. There are various options for displaying content in a pop-up window, with a navigation menu or buttons etc.</p>\n\n<p>An IMS content package may be used for presenting multimedia content and animations.</p>\n\n<div class="helpdoclink"><a href="http://docs.moodle.org/24/en/mod/imscp/view" class="helplinkpopup"><img class="iconhelp icon-pre" alt="More help" title="More help" src="http://localhost/m123/theme/image.php/standard/core/1365530675/docs" />More help</a></div>\n', 1365654174),
(142, '525cf1bd3f2c6129165219a392d98e19', '<p>The label module enables text and multimedia to be inserted into the course page in between links to other resources and activities. Labels are very versatile and can help to improve the appearance of a course if used thoughtfully.</p>\n\n<p>Labels may be used</p>\n\n<ul><li>To split up a long list of activities with a subheading or an image</li>\n<li>To display an embedded sound file or video directly on the course page</li>\n<li>To add a short description to a course section</li>\n</ul><div class="helpdoclink"><a href="http://docs.moodle.org/24/en/mod/label/view" class="helplinkpopup"><img class="iconhelp icon-pre" alt="More help" title="More help" src="http://localhost/m123/theme/image.php/standard/core/1365530675/docs" />More help</a></div>\n', 1365654174),
(143, 'd168a2d2bde573feb6a4567c79b8f3a2', '<p>The page module enables a teacher to create a web page resource using the text editor. A page can display text, images, sound, video, web links and embedded code, such as Google maps.</p>\n\n<p>Advantages of using the page module rather than the file module include the resource being more accessible (for example to users of mobile devices) and easier to update.</p>\n\n<p>For large amounts of content, it''s recommended that a book is used rather than a page.</p>\n\n<p>A page may be used</p>\n\n<ul><li>To present the terms and conditions of a course or a summary of the course syllabus</li>\n<li>To embed several videos or sound files together with some explanatory text</li>\n</ul><div class="helpdoclink"><a href="http://docs.moodle.org/24/en/mod/page/view" class="helplinkpopup"><img class="iconhelp icon-pre" alt="More help" title="More help" src="http://localhost/m123/theme/image.php/standard/core/1365530675/docs" />More help</a></div>\n', 1365654174),
(144, 'ec2f8634885d7efdc4f9631c713b5784', '<p>The URL module enables a teacher to provide a web link as a course resource. Anything that is freely available online, such as documents or images, can be linked to; the URL doesn’t have to be the home page of a website. The URL of a particular web page may be copied and pasted or a teacher can use the file picker and choose a link from a repository such as Flickr, YouTube or Wikimedia (depending upon which repositories are enabled for the site).</p>\n\n<p>There are a number of display options for the URL, such as embedded or opening in a new window and advanced options for passing information, such as a student''s name, to the URL if required.</p>\n\n<p>Note that URLs can also be added to any other resource or activity type through the text editor.</p>\n\n<div class="helpdoclink"><a href="http://docs.moodle.org/24/en/mod/url/view" class="helplinkpopup"><img class="iconhelp icon-pre" alt="More help" title="More help" src="http://localhost/m123/theme/image.php/standard/core/1365530675/docs" />More help</a></div>\n', 1365654174),
(145, '5cfae2e0bf98c777dc2d700717ba5d21', '<p>When players are enabled in these settings, files can be embedded using the media filter (if enabled) or using a File or URL resources with the Embed option. When not enabled, these formats are not embedded and users can manually download or follow links to these resources.</p>\n\n<p>Where two players support the same format, enabling both increases compatibility across different devices such as mobile phones. It is possible to increase compatibility further by providing multiple files in different formats for a single audio or video clip.</p>\n', 1365654215),
(146, '7e62621f6cf906bab2bc85223b5570d1', '<p>When players are enabled in these settings, files can be embedded using the media filter (if enabled) or using a File or URL resources with the Embed option. When not enabled, these formats are not embedded and users can manually download or follow links to these resources.</p>\n\n<p>Where two players support the same format, enabling both increases compatibility across different devices such as mobile phones. It is possible to increase compatibility further by providing multiple files in different formats for a single audio or video clip.</p>\n', 1365654227),
(147, '130117011d1940f18bfb5c4da5a31afd', '<p>When players are enabled in these settings, files can be embedded using the media filter (if enabled) or using a File or URL resources with the Embed option. When not enabled, these formats are not embedded and users can manually download or follow links to these resources.</p>\n\n<p>Where two players support the same format, enabling both increases compatibility across different devices such as mobile phones. It is possible to increase compatibility further by providing multiple files in different formats for a single audio or video clip.</p>\n', 1365654165),
(148, '3e4c69ff7028c3f7ce1c8d6c469c9d02', '<p>When players are enabled in these settings, files can be embedded using the media filter (if enabled) or using a File or URL resources with the Embed option. When not enabled, these formats are not embedded and users can manually download or follow links to these resources.</p>\n\n<p>Where two players support the same format, enabling both increases compatibility across different devices such as mobile phones. It is possible to increase compatibility further by providing multiple files in different formats for a single audio or video clip.</p>\n', 1365654179),
(149, '59eedd7b920ea153e9df1e9cd2621126', '<p>When players are enabled in these settings, files can be embedded using the media filter (if enabled) or using a File or URL resources with the Embed option. When not enabled, these formats are not embedded and users can manually download or follow links to these resources.</p>\n\n<p>Where two players support the same format, enabling both increases compatibility across different devices such as mobile phones. It is possible to increase compatibility further by providing multiple files in different formats for a single audio or video clip.</p>\n', 1365654373),
(150, '63bf81d11e1ae383c8d6e7fe32dc5abc', '<p>When players are enabled in these settings, files can be embedded using the media filter (if enabled) or using a File or URL resources with the Embed option. When not enabled, these formats are not embedded and users can manually download or follow links to these resources.</p>\n\n<p>Where two players support the same format, enabling both increases compatibility across different devices such as mobile phones. It is possible to increase compatibility further by providing multiple files in different formats for a single audio or video clip.</p>\n', 1365654314),
(151, '5f8db4779dea2c519bb38197b93cd536', '<p>The assignment activity module enables a teacher to communicate tasks, collect work and provide grades and feedback.</p>\n\n<p>Students can submit any digital content (files), such as word-processed documents, spreadsheets, images, or audio and video clips. Alternatively, or in addition, the assignment may require students to type text directly into the text editor. An assignment can also be used to remind students of ''real-world'' assignments they need to complete offline, such as art work, and thus not require any digital content. Students can submit work individually or as a member of a group.</p>\n\n<p>When reviewing assignments, teachers can leave feedback comments and upload files, such as marked-up student submissions, documents with comments or spoken audio feedback. Assignments can be graded using a numerical or custom scale or an advanced grading method such as a rubric. Final grades are recorded in the gradebook.</p>\n\n<div class="helpdoclink"><a href="http://docs.moodle.org/24/en/mod/assignment/view" class="helplinkpopup"><img class="iconhelp icon-pre" alt="More help" title="More help" src="http://localhost/m123/theme/image.php/standard/core/1365530675/docs" />More help</a></div>\n', 1365654318),
(152, '5de08a597eab78d11e6acbb61601384d', '<p>There is currently no help associated with this resource or activity</p>\n', 1365654318),
(153, 'de16141a0a514014d1c7994fe1e61802', '<p>The chat activity module enables participants to have text-based, real-time synchronous discussions.</p>\n\n<p>The chat may be a one-time activity or it may be repeated at the same time each day or each week. Chat sessions are saved and can be made available for everyone to view or restricted to users with the capability to view chat session logs.</p>\n\n<p>Chats are especially useful when the group chatting is not able to meet face-to-face, such as</p>\n\n<ul><li>Regular meetings of students participating in online courses to enable them to share experiences with others in the same course but in a different location</li>\n<li>A student temporarily unable to attend in person chatting with their teacher to catch up with work</li>\n<li>Students out on work experience getting together to discuss their experiences with each other and their teacher</li>\n<li>Younger children using chat at home in the evenings as a controlled (monitored) introduction to the world of social networking</li>\n<li>A question and answer session with an invited speaker in a different location</li>\n<li>Sessions to help students prepare for tests where the teacher, or other students, would pose sample questions</li>\n</ul><div class="helpdoclink"><a href="http://docs.moodle.org/24/en/mod/chat/view" class="helplinkpopup"><img class="iconhelp icon-pre" alt="More help" title="More help" src="http://localhost/m123/theme/image.php/standard/core/1365530675/docs" />More help</a></div>\n', 1365654318),
(154, 'a30d023a110a9aef305946db8634ed32', '<p>The choice activity module enables a teacher to ask a single question and offer a selection of possible responses.</p>\n\n<p>Choice results may be published after students have answered, after a certain date, or not at all. Results may be published with student names or anonymously.</p>\n\n<p>A choice activity may be used</p>\n\n<ul><li>As a quick poll to stimulate thinking about a topic</li>\n<li>To quickly test students'' understanding</li>\n<li>To facilitate student decision-making, for example allowing students to vote on a direction for the course</li>\n</ul><div class="helpdoclink"><a href="http://docs.moodle.org/24/en/mod/choice/view" class="helplinkpopup"><img class="iconhelp icon-pre" alt="More help" title="More help" src="http://localhost/m123/theme/image.php/standard/core/1365530675/docs" />More help</a></div>\n', 1365654318),
(155, '1af2018b17822e8dd0e4c335f04aa79e', '<p>The database activity module enables participants to create, maintain and search a collection of entries (i.e. records).  The structure of the entries is defined by the teacher as a number of fields. Field types include checkbox, radio buttons, dropdown menu, text area, URL, picture and uploaded file.</p>\n\n<p>The visual layout of information when listing, viewing or editing database entries may be controlled by database templates. Database activities may be shared between courses as presets and a teacher may also import and export database entries.</p>\n\n<p>If the database auto-linking filter is enabled, any entries in a database will be automatically linked where the words or phrases appear within the course.</p>\n\n<p>A teacher can allow comments on entries. Entries can also be rated by teachers or students (peer evaluation). Ratings can be aggregated to form a final grade which is recorded in the gradebook.</p>\n\n<p>Database activities have many uses, such as</p>\n\n<ul><li>A collaborative collection of web links, books, book reviews, journal references etc</li>\n<li>For displaying student-created photos, posters, websites or poems for peer comment and review</li>\n</ul><div class="helpdoclink"><a href="http://docs.moodle.org/24/en/mod/data/view" class="helplinkpopup"><img class="iconhelp icon-pre" alt="More help" title="More help" src="http://localhost/m123/theme/image.php/standard/core/1365530675/docs" />More help</a></div>\n', 1365654318),
(156, '51e1f8f8f33f5fde9d6c19184df871db', '<p>The external tool activity module enables students to interact with learning resources and activities on other web sites. For example, an external tool could provide access to a new activity type or learning materials from a publisher.</p>\n\n<p>To create an external tool activity, a tool provider which supports LTI (Learning Tools Interoperability) is required. A teacher can create an external tool activity or make use of a tool configured by the site administrator.</p>\n\n<p>External tool activities differ from URL resources in a few ways:</p>\n\n<ul><li>External tools are context aware i.e. they have access to information about the user who launched the tool, such as institution, course and name</li>\n<li>External tools support reading, updating, and deleting grades associated with the activity instance</li>\n<li>External tool configurations create a trust relationship between your site and the tool provider, allowing secure communication between them</li>\n</ul><div class="helpdoclink"><a href="http://docs.moodle.org/24/en/mod/lti/view" class="helplinkpopup"><img class="iconhelp icon-pre" alt="More help" title="More help" src="http://localhost/m123/theme/image.php/standard/core/1365530675/docs" />More help</a></div>\n', 1365654318),
(157, '9ea7afc1cf9d3d23f1b0cf794ece3565', '<p>The forum activity module enables participants to have asynchronous discussions i.e. discussions that take place over an extended period of time.</p>\n\n<p>There are several forum types to choose from, such as a standard forum where anyone can start a new discussion at any time; a forum where each student can post exactly one discussion; or a question and answer forum where students must first post before being able to view other students'' posts. A teacher can allow files to be attached to forum posts. Attached images are displayed in the forum post.</p>\n\n<p>Participants can subscribe to a forum to receive notifications of new forum posts. A teacher can set the subscription mode to optional, forced or auto, or prevent subscription completely. If required, students can be blocked from posting more than a given number of posts in a given time period; this can prevent individuals from dominating discussions.</p>\n\n<p>Forum posts can be rated by teachers or students (peer evaluation). Ratings can be aggregated to form a final grade which is recorded in the gradebook.</p>\n\n<p>Forums have many uses, such as</p>\n\n<ul><li>A social space for students to get to know each other</li>\n<li>For course announcements (using a news forum with forced subscription)</li>\n<li>For discussing course content or reading materials</li>\n<li>For continuing online an issue raised previously in a face-to-face session</li>\n<li>For teacher-only discussions (using a hidden forum)</li>\n<li>A help centre where tutors and students can give advice</li>\n<li>A one-on-one support area for private student-teacher communications (using a forum with separate groups and with one student per group)</li>\n<li>For extension activities, for example ‘brain teasers’ for students to ponder and suggest solutions to</li>\n</ul><div class="helpdoclink"><a href="http://docs.moodle.org/24/en/mod/forum/view" class="helplinkpopup"><img class="iconhelp icon-pre" alt="More help" title="More help" src="http://localhost/m123/theme/image.php/standard/core/1365530675/docs" />More help</a></div>\n', 1365654318),
(158, '56751091bfe5667c5586a2b1636bab3f', '<p>The glossary activity module enables participants to create and maintain a list of definitions, like a dictionary, or to collect and organise resources or information.</p>\n\n<p>A teacher can allow files to be attached to glossary entries. Attached images are displayed in the entry. Entries can be searched or browsed alphabetically or by category, date or author. Entries can be approved by default or require approval by a teacher before they are viewable by everyone.</p>\n\n<p>If the glossary auto-linking filter is enabled, entries will be automatically linked where the concept words and/or phrases appear within the course.</p>\n\n<p>A teacher can allow comments on entries. Entries can also be rated by teachers or students (peer evaluation). Ratings can be aggregated to form a final grade which is recorded in the gradebook.</p>\n\n<p>Glossaries have many uses, such as</p>\n\n<ul><li>A collaborative bank of key terms</li>\n<li>A ‘getting to know you’ space where new students add their name and personal details</li>\n<li>A ‘handy tips’ resource of best practice in a practical subject</li>\n<li>A sharing area of useful videos, images or sound files</li>\n<li>A revision resource of facts to remember</li>\n</ul><div class="helpdoclink"><a href="http://docs.moodle.org/24/en/mod/glossary/view" class="helplinkpopup"><img class="iconhelp icon-pre" alt="More help" title="More help" src="http://localhost/m123/theme/image.php/standard/core/1365530675/docs" />More help</a></div>\n', 1365654318),
(159, '7ef1d8fafee58d865b4e007f271f1442', '<p>The lesson activity module enables a teacher to deliver content and/or practice activities in  interesting and flexible ways. A teacher can use the lesson to create a linear set of content pages or instructional activities that offer a variety of paths or options for the learner. In either case, teachers can choose to increase engagement and ensure understanding by including a variety of questions, such as multiple choice, matching and short answer. Depending on the student''s choice of answer and how the teacher develops the lesson, students may progress to the next page, be taken back to a previous page or redirected down a different path entirely.</p>\n\n<p>A lesson may be graded, with the grade recorded in the gradebook.</p>\n\n<p>Lessons may be used</p>\n\n<ul><li>For self-directed learning of a new topic</li>\n<li>For  scenarios or simulations/decision-making exercises</li>\n<li>For differentiated revision, with different sets of revision questions depending upon answers given to initial questions</li>\n</ul><div class="helpdoclink"><a href="http://docs.moodle.org/24/en/mod/lesson/view" class="helplinkpopup"><img class="iconhelp icon-pre" alt="More help" title="More help" src="http://localhost/m123/theme/image.php/standard/core/1365530675/docs" />More help</a></div>\n', 1365654318),
(160, '0c3ef9deb6361cd5a69f2a36653fa52a', '<p>The quiz activity enables a teacher to create quizzes comprising questions of various types, including multiple choice, matching, short-answer and numerical.</p>\n\n<p>The teacher can allow the quiz to be attempted multiple times, with the questions shuffled or randomly selected from the question bank. A time limit may be set.</p>\n\n<p>Each attempt is marked automatically, with the exception of essay questions, and the grade is recorded in the gradebook.</p>\n\n<p>The teacher can choose when and if hints, feedback and correct answers are shown to students.</p>\n\n<p>Quizzes may be used</p>\n\n<ul><li>As course exams</li>\n<li>As mini tests for reading assignments or at the end of a topic</li>\n<li>As exam practice using questions from past exams</li>\n<li>To deliver immediate feedback about performance</li>\n<li>For self-assessment</li>\n</ul><div class="helpdoclink"><a href="http://docs.moodle.org/24/en/mod/quiz/view" class="helplinkpopup"><img class="iconhelp icon-pre" alt="More help" title="More help" src="http://localhost/m123/theme/image.php/standard/core/1365530675/docs" />More help</a></div>\n', 1365654318),
(161, '32b451f2a1fef813128fe0ec88de9dfb', '<p>A SCORM package is a collection of files which are packaged according to an agreed standard for learning objects. The SCORM activity module enables SCORM or AICC packages to be uploaded as a zip file and added to a course.</p>\n\n<p>Content is usually displayed over several pages, with navigation between the pages. There are various options for displaying content in a pop-up window, with a table of contents, with navigation buttons etc. SCORM activities generally include questions, with grades being recorded in the gradebook.</p>\n\n<p>SCORM activities may be used</p>\n\n<ul><li>For presenting multimedia content and animations</li>\n<li>As an assessment tool</li>\n</ul><div class="helpdoclink"><a href="http://docs.moodle.org/24/en/mod/scorm/view" class="helplinkpopup"><img class="iconhelp icon-pre" alt="More help" title="More help" src="http://localhost/m123/theme/image.php/standard/core/1365530675/docs" />More help</a></div>\n', 1365654318),
(162, 'c8990360f44d5424dfd7e50868a4b496', '<p>The survey activity module provides a number of verified survey instruments that have been found useful in assessing and stimulating learning in online environments. A teacher can use these to gather data from their students that will help them learn about their class and reflect on their own teaching.</p>\n\n<p>Note that these survey tools are pre-populated with questions. Teachers who wish to create their own survey should use the feedback activity module.</p>\n\n<div class="helpdoclink"><a href="http://docs.moodle.org/24/en/mod/survey/view" class="helplinkpopup"><img class="iconhelp icon-pre" alt="More help" title="More help" src="http://localhost/m123/theme/image.php/standard/core/1365530675/docs" />More help</a></div>\n', 1365654319),
(163, '669d0e6313a0774aa4066c011ae1abeb', '<p>The wiki activity module enables participants to add and edit a collection of web pages. A wiki can be collaborative, with everyone being able to edit it, or individual, where everyone has their own wiki which only they can edit.</p>\n\n<p>A history of previous versions of each page in the wiki is kept, listing the edits made by each participant.</p>\n\n<p>Wikis have many uses, such as</p>\n\n<ul><li>For group lecture notes or study guides</li>\n<li>For members of a faculty to plan a scheme of work or meeting agenda together</li>\n<li>For students to collaboratively author an online book, creating content on a topic set by their tutor</li>\n<li>For collaborative storytelling or poetry creation, where each participant writes a line or verse</li>\n<li>As a personal journal for examination notes or revision (using an individual wiki)</li>\n</ul><div class="helpdoclink"><a href="http://docs.moodle.org/24/en/mod/wiki/view" class="helplinkpopup"><img class="iconhelp icon-pre" alt="More help" title="More help" src="http://localhost/m123/theme/image.php/standard/core/1365530675/docs" />More help</a></div>\n', 1365654319),
(164, '2215452df4be11d22af39b5c8d292e7f', '<p>The workshop activity module enables the collection, review and peer assessment of students'' work.</p>\n\n<p>Students can submit any digital content (files), such as word-processed documents or spreadsheets and can also type text directly into a field using the text editor.</p>\n\n<p>Submissions are assessed using a multi-criteria assessment form defined by the teacher. The process of peer assessment and understanding the assessment form can be practised in advance with example submissions provided by the teacher, together with a reference assessment. Students are given the opportunity to assess one or more of their peers'' submissions. Submissions and reviewers may be anonymous if required.</p>\n\n<p>Students obtain two grades in a workshop activity - a grade for their submission and a grade for their assessment of their peers'' submissions. Both grades are recorded in the gradebook.</p>\n\n<div class="helpdoclink"><a href="http://docs.moodle.org/24/en/mod/workshop/view" class="helplinkpopup"><img class="iconhelp icon-pre" alt="More help" title="More help" src="http://localhost/m123/theme/image.php/standard/core/1365530675/docs" />More help</a></div>\n', 1365654319),
(165, '99db8d9175b1b88eb19fa655ac9c4380', '<p>The book module enables a teacher to create a multi-page resource in a book-like format, with chapters and subchapters. Books can contain media files as well as text and are useful for displaying lengthy passages of information which can be broken down into sections.</p>\n\n<p>A book may be used</p>\n\n<ul><li>To display reading material for individual modules of study</li>\n<li>As a staff departmental handbook</li>\n<li>As a showcase portfolio of student work</li>\n</ul><div class="helpdoclink"><a href="http://docs.moodle.org/24/en/mod/book/view" class="helplinkpopup"><img class="iconhelp icon-pre" alt="More help" title="More help" src="http://localhost/m123/theme/image.php/standard/core/1365530675/docs" />More help</a></div>\n', 1365654319),
(166, '2e036e5406f77c8d5814cab1505aa3a7', '<p>The file module enables a teacher to provide a file as a course resource. Where possible, the file will be displayed within the course interface; otherwise students will be prompted to download it. The file may include supporting files, for example an HTML page may have embedded images or Flash objects.</p>\n\n<p>Note that students need to have the appropriate software on their computers in order to open the file.</p>\n\n<p>A file may be used</p>\n\n<ul><li>To share presentations given in class</li>\n<li>To include a mini website as a course resource</li>\n<li>To provide draft files of certain software programs (eg Photoshop .psd) so students can edit and submit them for assessment</li>\n</ul><div class="helpdoclink"><a href="http://docs.moodle.org/24/en/mod/resource/view" class="helplinkpopup"><img class="iconhelp icon-pre" alt="More help" title="More help" src="http://localhost/m123/theme/image.php/standard/core/1365530675/docs" />More help</a></div>\n', 1365654319),
(167, '8611f5bb0753821aad0768ad521a106f', '<p>The folder module enables a teacher to display a number of related files inside a single folder, reducing scrolling on the course page. A zipped folder may be uploaded and unzipped for display, or an empty folder created and files uploaded into it.</p>\n\n<p>A folder may be used</p>\n\n<ul><li>For a series of files on one topic, for example a set of past examination papers in pdf format or a collection of image files for use in student projects</li>\n<li>To provide a shared uploading space for teachers on the course page (keeping the folder hidden so that only teachers can see it)</li>\n</ul><div class="helpdoclink"><a href="http://docs.moodle.org/24/en/mod/folder/view" class="helplinkpopup"><img class="iconhelp icon-pre" alt="More help" title="More help" src="http://localhost/m123/theme/image.php/standard/core/1365530675/docs" />More help</a></div>\n', 1365654319),
(168, 'a68adbfd61abff9ade9f3ffa37d86e96', '<p>An IMS content package is a collection of files which are packaged according to an agreed standard so they can be reused in different systems. The IMS content package module enables such content packages to be uploaded as a zip file and added to a course as a resource.</p>\n\n<p>Content is usually displayed over several pages, with navigation between the pages. There are various options for displaying content in a pop-up window, with a navigation menu or buttons etc.</p>\n\n<p>An IMS content package may be used for presenting multimedia content and animations.</p>\n\n<div class="helpdoclink"><a href="http://docs.moodle.org/24/en/mod/imscp/view" class="helplinkpopup"><img class="iconhelp icon-pre" alt="More help" title="More help" src="http://localhost/m123/theme/image.php/standard/core/1365530675/docs" />More help</a></div>\n', 1365654319),
(169, 'f8ed802fab9e079ea77401876c3dcef8', '<p>The label module enables text and multimedia to be inserted into the course page in between links to other resources and activities. Labels are very versatile and can help to improve the appearance of a course if used thoughtfully.</p>\n\n<p>Labels may be used</p>\n\n<ul><li>To split up a long list of activities with a subheading or an image</li>\n<li>To display an embedded sound file or video directly on the course page</li>\n<li>To add a short description to a course section</li>\n</ul><div class="helpdoclink"><a href="http://docs.moodle.org/24/en/mod/label/view" class="helplinkpopup"><img class="iconhelp icon-pre" alt="More help" title="More help" src="http://localhost/m123/theme/image.php/standard/core/1365530675/docs" />More help</a></div>\n', 1365654319),
(170, 'f679f454dc6edd3627fd8d60079a38b2', '<p>The page module enables a teacher to create a web page resource using the text editor. A page can display text, images, sound, video, web links and embedded code, such as Google maps.</p>\n\n<p>Advantages of using the page module rather than the file module include the resource being more accessible (for example to users of mobile devices) and easier to update.</p>\n\n<p>For large amounts of content, it''s recommended that a book is used rather than a page.</p>\n\n<p>A page may be used</p>\n\n<ul><li>To present the terms and conditions of a course or a summary of the course syllabus</li>\n<li>To embed several videos or sound files together with some explanatory text</li>\n</ul><div class="helpdoclink"><a href="http://docs.moodle.org/24/en/mod/page/view" class="helplinkpopup"><img class="iconhelp icon-pre" alt="More help" title="More help" src="http://localhost/m123/theme/image.php/standard/core/1365530675/docs" />More help</a></div>\n', 1365654319),
(171, 'c52f06e2956e6155923b8b6c8228d444', '<p>The URL module enables a teacher to provide a web link as a course resource. Anything that is freely available online, such as documents or images, can be linked to; the URL doesn’t have to be the home page of a website. The URL of a particular web page may be copied and pasted or a teacher can use the file picker and choose a link from a repository such as Flickr, YouTube or Wikimedia (depending upon which repositories are enabled for the site).</p>\n\n<p>There are a number of display options for the URL, such as embedded or opening in a new window and advanced options for passing information, such as a student''s name, to the URL if required.</p>\n\n<p>Note that URLs can also be added to any other resource or activity type through the text editor.</p>\n\n<div class="helpdoclink"><a href="http://docs.moodle.org/24/en/mod/url/view" class="helplinkpopup"><img class="iconhelp icon-pre" alt="More help" title="More help" src="http://localhost/m123/theme/image.php/standard/core/1365530675/docs" />More help</a></div>\n', 1365654319),
(172, '40f207080de33d36000e0193ca0957f4', '<p>When players are enabled in these settings, files can be embedded using the media filter (if enabled) or using a File or URL resources with the Embed option. When not enabled, these formats are not embedded and users can manually download or follow links to these resources.</p>\n\n<p>Where two players support the same format, enabling both increases compatibility across different devices such as mobile phones. It is possible to increase compatibility further by providing multiple files in different formats for a single audio or video clip.</p>\n', 1365654446);

-- --------------------------------------------------------

--
-- Table structure for table `mdl_capabilities`
--

CREATE TABLE IF NOT EXISTS `mdl_capabilities` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  `captype` varchar(50) NOT NULL DEFAULT '',
  `contextlevel` bigint(10) NOT NULL DEFAULT '0',
  `component` varchar(100) NOT NULL DEFAULT '',
  `riskbitmask` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_capa_nam_uix` (`name`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='this defines all capabilities' AUTO_INCREMENT=490 ;

--
-- Dumping data for table `mdl_capabilities`
--

INSERT INTO `mdl_capabilities` (`id`, `name`, `captype`, `contextlevel`, `component`, `riskbitmask`) VALUES
(1, 'moodle/site:config', 'write', 10, 'moodle', 62),
(2, 'moodle/site:readallmessages', 'read', 10, 'moodle', 8),
(3, 'moodle/site:sendmessage', 'write', 10, 'moodle', 16),
(4, 'moodle/site:approvecourse', 'write', 10, 'moodle', 4),
(5, 'moodle/backup:backupcourse', 'write', 50, 'moodle', 28),
(6, 'moodle/backup:backupsection', 'write', 50, 'moodle', 28),
(7, 'moodle/backup:backupactivity', 'write', 70, 'moodle', 28),
(8, 'moodle/backup:backuptargethub', 'write', 50, 'moodle', 28),
(9, 'moodle/backup:backuptargetimport', 'write', 50, 'moodle', 28),
(10, 'moodle/backup:downloadfile', 'write', 50, 'moodle', 28),
(11, 'moodle/backup:configure', 'write', 50, 'moodle', 28),
(12, 'moodle/backup:userinfo', 'read', 50, 'moodle', 8),
(13, 'moodle/backup:anonymise', 'read', 50, 'moodle', 8),
(14, 'moodle/restore:restorecourse', 'write', 50, 'moodle', 28),
(15, 'moodle/restore:restoresection', 'write', 50, 'moodle', 28),
(16, 'moodle/restore:restoreactivity', 'write', 50, 'moodle', 28),
(17, 'moodle/restore:viewautomatedfilearea', 'write', 50, 'moodle', 28),
(18, 'moodle/restore:restoretargethub', 'write', 50, 'moodle', 28),
(19, 'moodle/restore:restoretargetimport', 'write', 50, 'moodle', 28),
(20, 'moodle/restore:uploadfile', 'write', 50, 'moodle', 28),
(21, 'moodle/restore:configure', 'write', 50, 'moodle', 28),
(22, 'moodle/restore:rolldates', 'write', 50, 'moodle', 0),
(23, 'moodle/restore:userinfo', 'write', 50, 'moodle', 30),
(24, 'moodle/restore:createuser', 'write', 10, 'moodle', 24),
(25, 'moodle/site:manageblocks', 'write', 80, 'moodle', 20),
(26, 'moodle/site:accessallgroups', 'read', 50, 'moodle', 0),
(27, 'moodle/site:viewfullnames', 'read', 50, 'moodle', 0),
(28, 'moodle/site:viewuseridentity', 'read', 50, 'moodle', 0),
(29, 'moodle/site:viewreports', 'read', 50, 'moodle', 8),
(30, 'moodle/site:trustcontent', 'write', 50, 'moodle', 4),
(31, 'moodle/site:uploadusers', 'write', 10, 'moodle', 24),
(32, 'moodle/filter:manage', 'write', 50, 'moodle', 0),
(33, 'moodle/user:create', 'write', 10, 'moodle', 24),
(34, 'moodle/user:delete', 'write', 10, 'moodle', 8),
(35, 'moodle/user:update', 'write', 10, 'moodle', 24),
(36, 'moodle/user:viewdetails', 'read', 50, 'moodle', 0),
(37, 'moodle/user:viewalldetails', 'read', 30, 'moodle', 8),
(38, 'moodle/user:viewhiddendetails', 'read', 50, 'moodle', 8),
(39, 'moodle/user:loginas', 'write', 50, 'moodle', 30),
(40, 'moodle/user:managesyspages', 'write', 10, 'moodle', 0),
(41, 'moodle/user:manageblocks', 'write', 30, 'moodle', 0),
(42, 'moodle/user:manageownblocks', 'write', 10, 'moodle', 0),
(43, 'moodle/user:manageownfiles', 'write', 10, 'moodle', 0),
(44, 'moodle/user:ignoreuserquota', 'write', 10, 'moodle', 0),
(45, 'moodle/my:configsyspages', 'write', 10, 'moodle', 0),
(46, 'moodle/role:assign', 'write', 50, 'moodle', 28),
(47, 'moodle/role:review', 'read', 50, 'moodle', 8),
(48, 'moodle/role:override', 'write', 50, 'moodle', 28),
(49, 'moodle/role:safeoverride', 'write', 50, 'moodle', 16),
(50, 'moodle/role:manage', 'write', 10, 'moodle', 28),
(51, 'moodle/role:switchroles', 'read', 50, 'moodle', 12),
(52, 'moodle/category:manage', 'write', 40, 'moodle', 4),
(53, 'moodle/category:viewhiddencategories', 'read', 40, 'moodle', 0),
(54, 'moodle/cohort:manage', 'write', 40, 'moodle', 0),
(55, 'moodle/cohort:assign', 'write', 40, 'moodle', 0),
(56, 'moodle/cohort:view', 'read', 50, 'moodle', 0),
(57, 'moodle/course:create', 'write', 40, 'moodle', 4),
(58, 'moodle/course:request', 'write', 10, 'moodle', 0),
(59, 'moodle/course:delete', 'write', 50, 'moodle', 32),
(60, 'moodle/course:update', 'write', 50, 'moodle', 4),
(61, 'moodle/course:view', 'read', 50, 'moodle', 0),
(62, 'moodle/course:enrolreview', 'read', 50, 'moodle', 8),
(63, 'moodle/course:enrolconfig', 'write', 50, 'moodle', 8),
(64, 'moodle/course:bulkmessaging', 'write', 50, 'moodle', 16),
(65, 'moodle/course:viewhiddenuserfields', 'read', 50, 'moodle', 8),
(66, 'moodle/course:viewhiddencourses', 'read', 50, 'moodle', 0),
(67, 'moodle/course:visibility', 'write', 50, 'moodle', 0),
(68, 'moodle/course:managefiles', 'write', 50, 'moodle', 4),
(69, 'moodle/course:ignorefilesizelimits', 'write', 50, 'moodle', 0),
(70, 'moodle/course:manageactivities', 'write', 70, 'moodle', 4),
(71, 'moodle/course:activityvisibility', 'write', 70, 'moodle', 0),
(72, 'moodle/course:viewhiddenactivities', 'write', 70, 'moodle', 0),
(73, 'moodle/course:viewparticipants', 'read', 50, 'moodle', 0),
(74, 'moodle/course:changefullname', 'write', 50, 'moodle', 4),
(75, 'moodle/course:changeshortname', 'write', 50, 'moodle', 4),
(76, 'moodle/course:changeidnumber', 'write', 50, 'moodle', 4),
(77, 'moodle/course:changecategory', 'write', 50, 'moodle', 4),
(78, 'moodle/course:changesummary', 'write', 50, 'moodle', 4),
(79, 'moodle/site:viewparticipants', 'read', 10, 'moodle', 0),
(80, 'moodle/course:isincompletionreports', 'read', 50, 'moodle', 0),
(81, 'moodle/course:viewscales', 'read', 50, 'moodle', 0),
(82, 'moodle/course:managescales', 'write', 50, 'moodle', 0),
(83, 'moodle/course:managegroups', 'write', 50, 'moodle', 0),
(84, 'moodle/course:reset', 'write', 50, 'moodle', 32),
(85, 'moodle/blog:view', 'read', 10, 'moodle', 0),
(86, 'moodle/blog:search', 'read', 10, 'moodle', 0),
(87, 'moodle/blog:viewdrafts', 'read', 10, 'moodle', 8),
(88, 'moodle/blog:create', 'write', 10, 'moodle', 16),
(89, 'moodle/blog:manageentries', 'write', 10, 'moodle', 16),
(90, 'moodle/blog:manageexternal', 'write', 10, 'moodle', 16),
(91, 'moodle/blog:associatecourse', 'write', 50, 'moodle', 0),
(92, 'moodle/blog:associatemodule', 'write', 70, 'moodle', 0),
(93, 'moodle/calendar:manageownentries', 'write', 50, 'moodle', 16),
(94, 'moodle/calendar:managegroupentries', 'write', 50, 'moodle', 16),
(95, 'moodle/calendar:manageentries', 'write', 50, 'moodle', 16),
(96, 'moodle/user:editprofile', 'write', 30, 'moodle', 24),
(97, 'moodle/user:editownprofile', 'write', 10, 'moodle', 16),
(98, 'moodle/user:changeownpassword', 'write', 10, 'moodle', 0),
(99, 'moodle/user:readuserposts', 'read', 30, 'moodle', 0),
(100, 'moodle/user:readuserblogs', 'read', 30, 'moodle', 0),
(101, 'moodle/user:viewuseractivitiesreport', 'read', 30, 'moodle', 8),
(102, 'moodle/user:editmessageprofile', 'write', 30, 'moodle', 16),
(103, 'moodle/user:editownmessageprofile', 'write', 10, 'moodle', 0),
(104, 'moodle/question:managecategory', 'write', 50, 'moodle', 20),
(105, 'moodle/question:add', 'write', 50, 'moodle', 20),
(106, 'moodle/question:editmine', 'write', 50, 'moodle', 20),
(107, 'moodle/question:editall', 'write', 50, 'moodle', 20),
(108, 'moodle/question:viewmine', 'read', 50, 'moodle', 0),
(109, 'moodle/question:viewall', 'read', 50, 'moodle', 0),
(110, 'moodle/question:usemine', 'read', 50, 'moodle', 0),
(111, 'moodle/question:useall', 'read', 50, 'moodle', 0),
(112, 'moodle/question:movemine', 'write', 50, 'moodle', 0),
(113, 'moodle/question:moveall', 'write', 50, 'moodle', 0),
(114, 'moodle/question:config', 'write', 10, 'moodle', 2),
(115, 'moodle/question:flag', 'write', 50, 'moodle', 0),
(116, 'moodle/site:doclinks', 'read', 10, 'moodle', 0),
(117, 'moodle/course:sectionvisibility', 'write', 50, 'moodle', 0),
(118, 'moodle/course:useremail', 'write', 50, 'moodle', 0),
(119, 'moodle/course:viewhiddensections', 'write', 50, 'moodle', 0),
(120, 'moodle/course:setcurrentsection', 'write', 50, 'moodle', 0),
(121, 'moodle/course:movesections', 'write', 50, 'moodle', 0),
(122, 'moodle/site:mnetlogintoremote', 'read', 10, 'moodle', 0),
(123, 'moodle/grade:viewall', 'read', 50, 'moodle', 8),
(124, 'moodle/grade:view', 'read', 50, 'moodle', 0),
(125, 'moodle/grade:viewhidden', 'read', 50, 'moodle', 8),
(126, 'moodle/grade:import', 'write', 50, 'moodle', 12),
(127, 'moodle/grade:export', 'read', 50, 'moodle', 8),
(128, 'moodle/grade:manage', 'write', 50, 'moodle', 12),
(129, 'moodle/grade:edit', 'write', 50, 'moodle', 12),
(130, 'moodle/grade:managegradingforms', 'write', 50, 'moodle', 12),
(131, 'moodle/grade:sharegradingforms', 'write', 10, 'moodle', 4),
(132, 'moodle/grade:managesharedforms', 'write', 10, 'moodle', 4),
(133, 'moodle/grade:manageoutcomes', 'write', 50, 'moodle', 0),
(134, 'moodle/grade:manageletters', 'write', 50, 'moodle', 0),
(135, 'moodle/grade:hide', 'write', 50, 'moodle', 0),
(136, 'moodle/grade:lock', 'write', 50, 'moodle', 0),
(137, 'moodle/grade:unlock', 'write', 50, 'moodle', 0),
(138, 'moodle/my:manageblocks', 'write', 10, 'moodle', 0),
(139, 'moodle/notes:view', 'read', 50, 'moodle', 0),
(140, 'moodle/notes:manage', 'write', 50, 'moodle', 16),
(141, 'moodle/tag:manage', 'write', 10, 'moodle', 16),
(142, 'moodle/tag:create', 'write', 10, 'moodle', 16),
(143, 'moodle/tag:edit', 'write', 10, 'moodle', 16),
(144, 'moodle/tag:flag', 'write', 10, 'moodle', 16),
(145, 'moodle/tag:editblocks', 'write', 10, 'moodle', 0),
(146, 'moodle/block:view', 'read', 80, 'moodle', 0),
(147, 'moodle/block:edit', 'write', 80, 'moodle', 20),
(148, 'moodle/portfolio:export', 'read', 10, 'moodle', 0),
(149, 'moodle/comment:view', 'read', 50, 'moodle', 0),
(150, 'moodle/comment:post', 'write', 50, 'moodle', 24),
(151, 'moodle/comment:delete', 'write', 50, 'moodle', 32),
(152, 'moodle/webservice:createtoken', 'write', 10, 'moodle', 62),
(153, 'moodle/webservice:createmobiletoken', 'write', 10, 'moodle', 24),
(154, 'moodle/rating:view', 'read', 50, 'moodle', 0),
(155, 'moodle/rating:viewany', 'read', 50, 'moodle', 8),
(156, 'moodle/rating:viewall', 'read', 50, 'moodle', 8),
(157, 'moodle/rating:rate', 'write', 50, 'moodle', 0),
(158, 'moodle/course:publish', 'write', 10, 'moodle', 24),
(159, 'moodle/course:markcomplete', 'write', 50, 'moodle', 0),
(160, 'moodle/community:add', 'write', 10, 'moodle', 0),
(161, 'moodle/community:download', 'write', 10, 'moodle', 0),
(162, 'mod/assign:view', 'read', 70, 'mod_assign', 0),
(163, 'mod/assign:submit', 'write', 70, 'mod_assign', 0),
(164, 'mod/assign:grade', 'write', 70, 'mod_assign', 4),
(165, 'mod/assign:exportownsubmission', 'read', 70, 'mod_assign', 0),
(166, 'mod/assign:addinstance', 'write', 50, 'mod_assign', 4),
(167, 'mod/assign:grantextension', 'write', 70, 'mod_assign', 0),
(168, 'mod/assign:revealidentities', 'write', 70, 'mod_assign', 0),
(169, 'mod/assignment:view', 'read', 70, 'mod_assignment', 0),
(170, 'mod/assignment:addinstance', 'write', 50, 'mod_assignment', 4),
(171, 'mod/assignment:submit', 'write', 70, 'mod_assignment', 0),
(172, 'mod/assignment:grade', 'write', 70, 'mod_assignment', 4),
(173, 'mod/assignment:exportownsubmission', 'read', 70, 'mod_assignment', 0),
(174, 'mod/book:addinstance', 'write', 50, 'mod_book', 4),
(175, 'mod/book:read', 'read', 70, 'mod_book', 0),
(176, 'mod/book:viewhiddenchapters', 'read', 70, 'mod_book', 0),
(177, 'mod/book:edit', 'write', 70, 'mod_book', 4),
(178, 'mod/chat:addinstance', 'write', 50, 'mod_chat', 4),
(179, 'mod/chat:chat', 'write', 70, 'mod_chat', 16),
(180, 'mod/chat:readlog', 'read', 70, 'mod_chat', 0),
(181, 'mod/chat:deletelog', 'write', 70, 'mod_chat', 0),
(182, 'mod/chat:exportparticipatedsession', 'read', 70, 'mod_chat', 8),
(183, 'mod/chat:exportsession', 'read', 70, 'mod_chat', 8),
(184, 'mod/choice:addinstance', 'write', 50, 'mod_choice', 4),
(185, 'mod/choice:choose', 'write', 70, 'mod_choice', 0),
(186, 'mod/choice:readresponses', 'read', 70, 'mod_choice', 0),
(187, 'mod/choice:deleteresponses', 'write', 70, 'mod_choice', 0),
(188, 'mod/choice:downloadresponses', 'read', 70, 'mod_choice', 0),
(189, 'mod/data:addinstance', 'write', 50, 'mod_data', 4),
(190, 'mod/data:viewentry', 'read', 70, 'mod_data', 0),
(191, 'mod/data:writeentry', 'write', 70, 'mod_data', 16),
(192, 'mod/data:comment', 'write', 70, 'mod_data', 16),
(193, 'mod/data:rate', 'write', 70, 'mod_data', 0),
(194, 'mod/data:viewrating', 'read', 70, 'mod_data', 0),
(195, 'mod/data:viewanyrating', 'read', 70, 'mod_data', 8),
(196, 'mod/data:viewallratings', 'read', 70, 'mod_data', 8),
(197, 'mod/data:approve', 'write', 70, 'mod_data', 16),
(198, 'mod/data:manageentries', 'write', 70, 'mod_data', 16),
(199, 'mod/data:managecomments', 'write', 70, 'mod_data', 16),
(200, 'mod/data:managetemplates', 'write', 70, 'mod_data', 20),
(201, 'mod/data:viewalluserpresets', 'read', 70, 'mod_data', 0),
(202, 'mod/data:manageuserpresets', 'write', 70, 'mod_data', 20),
(203, 'mod/data:exportentry', 'read', 70, 'mod_data', 8),
(204, 'mod/data:exportownentry', 'read', 70, 'mod_data', 0),
(205, 'mod/data:exportallentries', 'read', 70, 'mod_data', 8),
(206, 'mod/data:exportuserinfo', 'read', 70, 'mod_data', 8),
(207, 'mod/feedback:addinstance', 'write', 50, 'mod_feedback', 4),
(208, 'mod/feedback:view', 'read', 70, 'mod_feedback', 0),
(209, 'mod/feedback:complete', 'write', 70, 'mod_feedback', 16),
(210, 'mod/feedback:viewanalysepage', 'read', 70, 'mod_feedback', 8),
(211, 'mod/feedback:deletesubmissions', 'write', 70, 'mod_feedback', 0),
(212, 'mod/feedback:mapcourse', 'write', 70, 'mod_feedback', 0),
(213, 'mod/feedback:edititems', 'write', 70, 'mod_feedback', 20),
(214, 'mod/feedback:createprivatetemplate', 'write', 70, 'mod_feedback', 16),
(215, 'mod/feedback:createpublictemplate', 'write', 70, 'mod_feedback', 16),
(216, 'mod/feedback:deletetemplate', 'write', 70, 'mod_feedback', 0),
(217, 'mod/feedback:viewreports', 'read', 70, 'mod_feedback', 8),
(218, 'mod/feedback:receivemail', 'read', 70, 'mod_feedback', 8),
(219, 'mod/folder:addinstance', 'write', 50, 'mod_folder', 4),
(220, 'mod/folder:view', 'read', 70, 'mod_folder', 0),
(221, 'mod/folder:managefiles', 'write', 70, 'mod_folder', 16),
(222, 'mod/forum:addinstance', 'write', 50, 'mod_forum', 4),
(223, 'mod/forum:viewdiscussion', 'read', 70, 'mod_forum', 0),
(224, 'mod/forum:viewhiddentimedposts', 'read', 70, 'mod_forum', 0),
(225, 'mod/forum:startdiscussion', 'write', 70, 'mod_forum', 16),
(226, 'mod/forum:replypost', 'write', 70, 'mod_forum', 16),
(227, 'mod/forum:addnews', 'write', 70, 'mod_forum', 16),
(228, 'mod/forum:replynews', 'write', 70, 'mod_forum', 16),
(229, 'mod/forum:viewrating', 'read', 70, 'mod_forum', 0),
(230, 'mod/forum:viewanyrating', 'read', 70, 'mod_forum', 8),
(231, 'mod/forum:viewallratings', 'read', 70, 'mod_forum', 8),
(232, 'mod/forum:rate', 'write', 70, 'mod_forum', 0),
(233, 'mod/forum:createattachment', 'write', 70, 'mod_forum', 16),
(234, 'mod/forum:deleteownpost', 'read', 70, 'mod_forum', 0),
(235, 'mod/forum:deleteanypost', 'read', 70, 'mod_forum', 0),
(236, 'mod/forum:splitdiscussions', 'read', 70, 'mod_forum', 0),
(237, 'mod/forum:movediscussions', 'read', 70, 'mod_forum', 0),
(238, 'mod/forum:editanypost', 'write', 70, 'mod_forum', 16),
(239, 'mod/forum:viewqandawithoutposting', 'read', 70, 'mod_forum', 0),
(240, 'mod/forum:viewsubscribers', 'read', 70, 'mod_forum', 0),
(241, 'mod/forum:managesubscriptions', 'read', 70, 'mod_forum', 16),
(242, 'mod/forum:postwithoutthrottling', 'write', 70, 'mod_forum', 16),
(243, 'mod/forum:exportdiscussion', 'read', 70, 'mod_forum', 8),
(244, 'mod/forum:exportpost', 'read', 70, 'mod_forum', 8),
(245, 'mod/forum:exportownpost', 'read', 70, 'mod_forum', 8),
(246, 'mod/forum:addquestion', 'write', 70, 'mod_forum', 16),
(247, 'mod/forum:allowforcesubscribe', 'read', 70, 'mod_forum', 0),
(248, 'mod/glossary:addinstance', 'write', 50, 'mod_glossary', 4),
(249, 'mod/glossary:view', 'read', 70, 'mod_glossary', 0),
(250, 'mod/glossary:write', 'write', 70, 'mod_glossary', 16),
(251, 'mod/glossary:manageentries', 'write', 70, 'mod_glossary', 16),
(252, 'mod/glossary:managecategories', 'write', 70, 'mod_glossary', 16),
(253, 'mod/glossary:comment', 'write', 70, 'mod_glossary', 16),
(254, 'mod/glossary:managecomments', 'write', 70, 'mod_glossary', 16),
(255, 'mod/glossary:import', 'write', 70, 'mod_glossary', 16),
(256, 'mod/glossary:export', 'read', 70, 'mod_glossary', 0),
(257, 'mod/glossary:approve', 'write', 70, 'mod_glossary', 16),
(258, 'mod/glossary:rate', 'write', 70, 'mod_glossary', 0),
(259, 'mod/glossary:viewrating', 'read', 70, 'mod_glossary', 0),
(260, 'mod/glossary:viewanyrating', 'read', 70, 'mod_glossary', 8),
(261, 'mod/glossary:viewallratings', 'read', 70, 'mod_glossary', 8),
(262, 'mod/glossary:exportentry', 'read', 70, 'mod_glossary', 8),
(263, 'mod/glossary:exportownentry', 'read', 70, 'mod_glossary', 0),
(264, 'mod/imscp:view', 'read', 70, 'mod_imscp', 0),
(265, 'mod/imscp:addinstance', 'write', 50, 'mod_imscp', 4),
(266, 'mod/label:addinstance', 'write', 50, 'mod_label', 4),
(267, 'mod/lesson:addinstance', 'write', 50, 'mod_lesson', 4),
(268, 'mod/lesson:edit', 'write', 70, 'mod_lesson', 4),
(269, 'mod/lesson:manage', 'write', 70, 'mod_lesson', 0),
(270, 'mod/lti:view', 'read', 70, 'mod_lti', 0),
(271, 'mod/lti:addinstance', 'write', 50, 'mod_lti', 4),
(272, 'mod/lti:grade', 'write', 70, 'mod_lti', 4),
(273, 'mod/lti:manage', 'write', 70, 'mod_lti', 4),
(274, 'mod/lti:addcoursetool', 'write', 50, 'mod_lti', 0),
(275, 'mod/lti:requesttooladd', 'write', 50, 'mod_lti', 0),
(276, 'mod/page:view', 'read', 70, 'mod_page', 0),
(277, 'mod/page:addinstance', 'write', 50, 'mod_page', 4),
(278, 'mod/quiz:view', 'read', 70, 'mod_quiz', 0),
(279, 'mod/quiz:addinstance', 'write', 50, 'mod_quiz', 4),
(280, 'mod/quiz:attempt', 'write', 70, 'mod_quiz', 16),
(281, 'mod/quiz:reviewmyattempts', 'read', 70, 'mod_quiz', 0),
(282, 'mod/quiz:manage', 'write', 70, 'mod_quiz', 16),
(283, 'mod/quiz:manageoverrides', 'write', 70, 'mod_quiz', 0),
(284, 'mod/quiz:preview', 'write', 70, 'mod_quiz', 0),
(285, 'mod/quiz:grade', 'write', 70, 'mod_quiz', 16),
(286, 'mod/quiz:regrade', 'write', 70, 'mod_quiz', 16),
(287, 'mod/quiz:viewreports', 'read', 70, 'mod_quiz', 8),
(288, 'mod/quiz:deleteattempts', 'write', 70, 'mod_quiz', 32),
(289, 'mod/quiz:ignoretimelimits', 'read', 70, 'mod_quiz', 0),
(290, 'mod/quiz:emailconfirmsubmission', 'read', 70, 'mod_quiz', 0),
(291, 'mod/quiz:emailnotifysubmission', 'read', 70, 'mod_quiz', 0),
(292, 'mod/quiz:emailwarnoverdue', 'read', 70, 'mod_quiz', 0),
(293, 'mod/resource:view', 'read', 70, 'mod_resource', 0),
(294, 'mod/resource:addinstance', 'write', 50, 'mod_resource', 4),
(295, 'mod/scorm:addinstance', 'write', 50, 'mod_scorm', 4),
(296, 'mod/scorm:viewreport', 'read', 70, 'mod_scorm', 0),
(297, 'mod/scorm:skipview', 'write', 70, 'mod_scorm', 0),
(298, 'mod/scorm:savetrack', 'write', 70, 'mod_scorm', 0),
(299, 'mod/scorm:viewscores', 'read', 70, 'mod_scorm', 0),
(300, 'mod/scorm:deleteresponses', 'read', 70, 'mod_scorm', 0),
(301, 'mod/scorm:deleteownresponses', 'write', 70, 'mod_scorm', 0),
(302, 'mod/survey:addinstance', 'write', 50, 'mod_survey', 4),
(303, 'mod/survey:participate', 'read', 70, 'mod_survey', 0),
(304, 'mod/survey:readresponses', 'read', 70, 'mod_survey', 0),
(305, 'mod/survey:download', 'read', 70, 'mod_survey', 0),
(306, 'mod/url:view', 'read', 70, 'mod_url', 0),
(307, 'mod/url:addinstance', 'write', 50, 'mod_url', 4),
(308, 'mod/wiki:addinstance', 'write', 50, 'mod_wiki', 4),
(309, 'mod/wiki:viewpage', 'read', 70, 'mod_wiki', 0),
(310, 'mod/wiki:editpage', 'write', 70, 'mod_wiki', 16),
(311, 'mod/wiki:createpage', 'write', 70, 'mod_wiki', 16),
(312, 'mod/wiki:viewcomment', 'read', 70, 'mod_wiki', 0),
(313, 'mod/wiki:editcomment', 'write', 70, 'mod_wiki', 16),
(314, 'mod/wiki:managecomment', 'write', 70, 'mod_wiki', 0),
(315, 'mod/wiki:managefiles', 'write', 70, 'mod_wiki', 0),
(316, 'mod/wiki:overridelock', 'write', 70, 'mod_wiki', 0),
(317, 'mod/wiki:managewiki', 'write', 70, 'mod_wiki', 0),
(318, 'mod/workshop:view', 'read', 70, 'mod_workshop', 0),
(319, 'mod/workshop:addinstance', 'write', 50, 'mod_workshop', 4),
(320, 'mod/workshop:switchphase', 'write', 70, 'mod_workshop', 0),
(321, 'mod/workshop:editdimensions', 'write', 70, 'mod_workshop', 4),
(322, 'mod/workshop:submit', 'write', 70, 'mod_workshop', 0),
(323, 'mod/workshop:peerassess', 'write', 70, 'mod_workshop', 0),
(324, 'mod/workshop:manageexamples', 'write', 70, 'mod_workshop', 0),
(325, 'mod/workshop:allocate', 'write', 70, 'mod_workshop', 0),
(326, 'mod/workshop:publishsubmissions', 'write', 70, 'mod_workshop', 0),
(327, 'mod/workshop:viewauthornames', 'read', 70, 'mod_workshop', 0),
(328, 'mod/workshop:viewreviewernames', 'read', 70, 'mod_workshop', 0),
(329, 'mod/workshop:viewallsubmissions', 'read', 70, 'mod_workshop', 0),
(330, 'mod/workshop:viewpublishedsubmissions', 'read', 70, 'mod_workshop', 0),
(331, 'mod/workshop:viewauthorpublished', 'read', 70, 'mod_workshop', 0),
(332, 'mod/workshop:viewallassessments', 'read', 70, 'mod_workshop', 0),
(333, 'mod/workshop:overridegrades', 'write', 70, 'mod_workshop', 0),
(334, 'mod/workshop:ignoredeadlines', 'write', 70, 'mod_workshop', 0),
(335, 'enrol/authorize:config', 'write', 50, 'enrol_authorize', 0),
(336, 'enrol/authorize:manage', 'write', 50, 'enrol_authorize', 0),
(337, 'enrol/authorize:unenrol', 'write', 50, 'enrol_authorize', 0),
(338, 'enrol/authorize:unenrolself', 'write', 50, 'enrol_authorize', 0),
(339, 'enrol/authorize:managepayments', 'write', 10, 'enrol_authorize', 8),
(340, 'enrol/authorize:uploadcsv', 'write', 10, 'enrol_authorize', 4),
(341, 'enrol/category:synchronised', 'write', 10, 'enrol_category', 0),
(342, 'enrol/cohort:config', 'write', 50, 'enrol_cohort', 0),
(343, 'enrol/cohort:unenrol', 'write', 50, 'enrol_cohort', 0),
(344, 'enrol/database:unenrol', 'write', 50, 'enrol_database', 0),
(345, 'enrol/guest:config', 'write', 50, 'enrol_guest', 0),
(346, 'enrol/ldap:manage', 'write', 50, 'enrol_ldap', 0),
(347, 'enrol/manual:config', 'write', 50, 'enrol_manual', 0),
(348, 'enrol/manual:enrol', 'write', 50, 'enrol_manual', 0),
(349, 'enrol/manual:manage', 'write', 50, 'enrol_manual', 0),
(350, 'enrol/manual:unenrol', 'write', 50, 'enrol_manual', 0),
(351, 'enrol/manual:unenrolself', 'write', 50, 'enrol_manual', 0),
(352, 'enrol/meta:config', 'write', 50, 'enrol_meta', 0),
(353, 'enrol/meta:selectaslinked', 'read', 50, 'enrol_meta', 0),
(354, 'enrol/meta:unenrol', 'write', 50, 'enrol_meta', 0),
(355, 'enrol/paypal:config', 'write', 50, 'enrol_paypal', 0),
(356, 'enrol/paypal:manage', 'write', 50, 'enrol_paypal', 0),
(357, 'enrol/paypal:unenrol', 'write', 50, 'enrol_paypal', 0),
(358, 'enrol/paypal:unenrolself', 'write', 50, 'enrol_paypal', 0),
(359, 'enrol/self:config', 'write', 50, 'enrol_self', 0),
(360, 'enrol/self:manage', 'write', 50, 'enrol_self', 0),
(361, 'enrol/self:unenrolself', 'write', 50, 'enrol_self', 0),
(362, 'enrol/self:unenrol', 'write', 50, 'enrol_self', 0),
(363, 'block/activity_modules:addinstance', 'write', 80, 'block_activity_modules', 20),
(364, 'block/admin_bookmarks:myaddinstance', 'write', 10, 'block_admin_bookmarks', 0),
(365, 'block/admin_bookmarks:addinstance', 'write', 80, 'block_admin_bookmarks', 20),
(366, 'block/blog_menu:addinstance', 'write', 80, 'block_blog_menu', 20),
(367, 'block/blog_recent:addinstance', 'write', 80, 'block_blog_recent', 20),
(368, 'block/blog_tags:addinstance', 'write', 80, 'block_blog_tags', 20),
(369, 'block/calendar_month:myaddinstance', 'write', 10, 'block_calendar_month', 0),
(370, 'block/calendar_month:addinstance', 'write', 80, 'block_calendar_month', 20),
(371, 'block/calendar_upcoming:myaddinstance', 'write', 10, 'block_calendar_upcoming', 0),
(372, 'block/calendar_upcoming:addinstance', 'write', 80, 'block_calendar_upcoming', 20),
(373, 'block/comments:myaddinstance', 'write', 10, 'block_comments', 0),
(374, 'block/comments:addinstance', 'write', 80, 'block_comments', 20),
(375, 'block/community:myaddinstance', 'write', 10, 'block_community', 0),
(376, 'block/community:addinstance', 'write', 80, 'block_community', 20),
(377, 'block/completionstatus:addinstance', 'write', 80, 'block_completionstatus', 20),
(378, 'block/course_list:myaddinstance', 'write', 10, 'block_course_list', 0),
(379, 'block/course_list:addinstance', 'write', 80, 'block_course_list', 20),
(380, 'block/course_overview:myaddinstance', 'write', 10, 'block_course_overview', 0),
(381, 'block/course_summary:addinstance', 'write', 80, 'block_course_summary', 20),
(382, 'block/feedback:addinstance', 'write', 80, 'block_feedback', 20),
(383, 'block/glossary_random:myaddinstance', 'write', 10, 'block_glossary_random', 0),
(384, 'block/glossary_random:addinstance', 'write', 80, 'block_glossary_random', 20),
(385, 'block/html:myaddinstance', 'write', 10, 'block_html', 0),
(386, 'block/html:addinstance', 'write', 80, 'block_html', 20),
(387, 'block/login:addinstance', 'write', 80, 'block_login', 20),
(388, 'block/mentees:myaddinstance', 'write', 10, 'block_mentees', 0),
(389, 'block/mentees:addinstance', 'write', 80, 'block_mentees', 20),
(390, 'block/messages:myaddinstance', 'write', 10, 'block_messages', 0),
(391, 'block/messages:addinstance', 'write', 80, 'block_messages', 20),
(392, 'block/mnet_hosts:myaddinstance', 'write', 10, 'block_mnet_hosts', 0),
(393, 'block/mnet_hosts:addinstance', 'write', 80, 'block_mnet_hosts', 20),
(394, 'block/myprofile:myaddinstance', 'write', 10, 'block_myprofile', 0),
(395, 'block/myprofile:addinstance', 'write', 80, 'block_myprofile', 20),
(396, 'block/navigation:myaddinstance', 'write', 10, 'block_navigation', 0),
(397, 'block/navigation:addinstance', 'write', 80, 'block_navigation', 20),
(398, 'block/news_items:myaddinstance', 'write', 10, 'block_news_items', 0),
(399, 'block/news_items:addinstance', 'write', 80, 'block_news_items', 20),
(400, 'block/online_users:myaddinstance', 'write', 10, 'block_online_users', 0),
(401, 'block/online_users:addinstance', 'write', 80, 'block_online_users', 20),
(402, 'block/online_users:viewlist', 'read', 80, 'block_online_users', 0),
(403, 'block/participants:addinstance', 'write', 80, 'block_participants', 20),
(404, 'block/private_files:myaddinstance', 'write', 10, 'block_private_files', 0),
(405, 'block/private_files:addinstance', 'write', 80, 'block_private_files', 20),
(406, 'block/quiz_results:addinstance', 'write', 80, 'block_quiz_results', 20),
(407, 'block/recent_activity:addinstance', 'write', 80, 'block_recent_activity', 20),
(408, 'block/rss_client:myaddinstance', 'write', 10, 'block_rss_client', 0),
(409, 'block/rss_client:addinstance', 'write', 80, 'block_rss_client', 20),
(410, 'block/rss_client:manageownfeeds', 'write', 80, 'block_rss_client', 0),
(411, 'block/rss_client:manageanyfeeds', 'write', 80, 'block_rss_client', 16),
(412, 'block/search_forums:addinstance', 'write', 80, 'block_search_forums', 20),
(413, 'block/section_links:addinstance', 'write', 80, 'block_section_links', 20),
(414, 'block/selfcompletion:addinstance', 'write', 80, 'block_selfcompletion', 20),
(415, 'block/settings:myaddinstance', 'write', 10, 'block_settings', 0),
(416, 'block/settings:addinstance', 'write', 80, 'block_settings', 20),
(417, 'block/site_main_menu:addinstance', 'write', 80, 'block_site_main_menu', 20),
(418, 'block/social_activities:addinstance', 'write', 80, 'block_social_activities', 20),
(419, 'block/tag_flickr:addinstance', 'write', 80, 'block_tag_flickr', 20),
(420, 'block/tag_youtube:addinstance', 'write', 80, 'block_tag_youtube', 20),
(421, 'block/tags:myaddinstance', 'write', 10, 'block_tags', 0),
(422, 'block/tags:addinstance', 'write', 80, 'block_tags', 20),
(423, 'report/completion:view', 'read', 50, 'report_completion', 8),
(424, 'report/courseoverview:view', 'read', 10, 'report_courseoverview', 8),
(425, 'report/log:view', 'read', 50, 'report_log', 8),
(426, 'report/log:viewtoday', 'read', 50, 'report_log', 8),
(427, 'report/loglive:view', 'read', 50, 'report_loglive', 8),
(428, 'report/outline:view', 'read', 50, 'report_outline', 8),
(429, 'report/participation:view', 'read', 50, 'report_participation', 8),
(430, 'report/progress:view', 'read', 50, 'report_progress', 8),
(431, 'report/questioninstances:view', 'read', 10, 'report_questioninstances', 0),
(432, 'report/security:view', 'read', 10, 'report_security', 2),
(433, 'report/stats:view', 'read', 50, 'report_stats', 8),
(434, 'gradeexport/ods:view', 'read', 50, 'gradeexport_ods', 8),
(435, 'gradeexport/ods:publish', 'read', 50, 'gradeexport_ods', 8),
(436, 'gradeexport/txt:view', 'read', 50, 'gradeexport_txt', 8),
(437, 'gradeexport/txt:publish', 'read', 50, 'gradeexport_txt', 8),
(438, 'gradeexport/xls:view', 'read', 50, 'gradeexport_xls', 8),
(439, 'gradeexport/xls:publish', 'read', 50, 'gradeexport_xls', 8),
(440, 'gradeexport/xml:view', 'read', 50, 'gradeexport_xml', 8),
(441, 'gradeexport/xml:publish', 'read', 50, 'gradeexport_xml', 8),
(442, 'gradeimport/csv:view', 'write', 50, 'gradeimport_csv', 0),
(443, 'gradeimport/xml:view', 'write', 50, 'gradeimport_xml', 0),
(444, 'gradeimport/xml:publish', 'write', 50, 'gradeimport_xml', 0),
(445, 'gradereport/grader:view', 'read', 50, 'gradereport_grader', 8),
(446, 'gradereport/outcomes:view', 'read', 50, 'gradereport_outcomes', 8),
(447, 'gradereport/overview:view', 'read', 50, 'gradereport_overview', 8),
(448, 'gradereport/user:view', 'read', 50, 'gradereport_user', 8),
(449, 'webservice/amf:use', 'read', 50, 'webservice_amf', 62),
(450, 'webservice/rest:use', 'read', 50, 'webservice_rest', 62),
(451, 'webservice/soap:use', 'read', 50, 'webservice_soap', 62),
(452, 'webservice/xmlrpc:use', 'read', 50, 'webservice_xmlrpc', 62),
(453, 'repository/alfresco:view', 'read', 70, 'repository_alfresco', 0),
(454, 'repository/boxnet:view', 'read', 70, 'repository_boxnet', 0),
(455, 'repository/coursefiles:view', 'read', 70, 'repository_coursefiles', 0),
(456, 'repository/dropbox:view', 'read', 70, 'repository_dropbox', 0),
(457, 'repository/equella:view', 'read', 70, 'repository_equella', 0),
(458, 'repository/filesystem:view', 'read', 70, 'repository_filesystem', 0),
(459, 'repository/flickr:view', 'read', 70, 'repository_flickr', 0),
(460, 'repository/flickr_public:view', 'read', 70, 'repository_flickr_public', 0),
(461, 'repository/googledocs:view', 'read', 70, 'repository_googledocs', 0),
(462, 'repository/local:view', 'read', 70, 'repository_local', 0),
(463, 'repository/merlot:view', 'read', 70, 'repository_merlot', 0),
(464, 'repository/picasa:view', 'read', 70, 'repository_picasa', 0),
(465, 'repository/recent:view', 'read', 70, 'repository_recent', 0),
(466, 'repository/s3:view', 'read', 70, 'repository_s3', 0),
(467, 'repository/upload:view', 'read', 70, 'repository_upload', 0),
(468, 'repository/url:view', 'read', 70, 'repository_url', 0),
(469, 'repository/user:view', 'read', 70, 'repository_user', 0),
(470, 'repository/webdav:view', 'read', 70, 'repository_webdav', 0),
(471, 'repository/wikimedia:view', 'read', 70, 'repository_wikimedia', 0),
(472, 'repository/youtube:view', 'read', 70, 'repository_youtube', 0),
(473, 'tool/customlang:view', 'read', 10, 'tool_customlang', 2),
(474, 'tool/customlang:edit', 'write', 10, 'tool_customlang', 6),
(475, 'booktool/exportimscp:export', 'read', 70, 'booktool_exportimscp', 0),
(476, 'booktool/importhtml:import', 'write', 70, 'booktool_importhtml', 4),
(477, 'booktool/print:print', 'read', 70, 'booktool_print', 0),
(478, 'quiz/grading:viewstudentnames', 'read', 70, 'quiz_grading', 0),
(479, 'quiz/grading:viewidnumber', 'read', 70, 'quiz_grading', 0),
(480, 'quiz/statistics:view', 'read', 70, 'quiz_statistics', 0),
(481, 'mod/attforblock:view', 'read', 70, 'mod_attforblock', 0),
(482, 'mod/attforblock:addinstance', 'write', 50, 'mod_attforblock', 4),
(483, 'mod/attforblock:viewreports', 'read', 70, 'mod_attforblock', 8),
(484, 'mod/attforblock:takeattendances', 'write', 70, 'mod_attforblock', 32),
(485, 'mod/attforblock:changeattendances', 'write', 70, 'mod_attforblock', 32),
(486, 'mod/attforblock:manageattendances', 'write', 70, 'mod_attforblock', 2),
(487, 'mod/attforblock:changepreferences', 'write', 70, 'mod_attforblock', 2),
(488, 'mod/attforblock:export', 'read', 70, 'mod_attforblock', 8),
(489, 'mod/attforblock:canbelisted', 'read', 70, 'mod_attforblock', 8);

-- --------------------------------------------------------

--
-- Table structure for table `mdl_chat`
--

CREATE TABLE IF NOT EXISTS `mdl_chat` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `course` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `intro` longtext NOT NULL,
  `introformat` smallint(4) NOT NULL DEFAULT '0',
  `keepdays` bigint(11) NOT NULL DEFAULT '0',
  `studentlogs` smallint(4) NOT NULL DEFAULT '0',
  `chattime` bigint(10) NOT NULL DEFAULT '0',
  `schedule` smallint(4) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_chat_cou_ix` (`course`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Each of these is a chat room' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_chat_messages`
--

CREATE TABLE IF NOT EXISTS `mdl_chat_messages` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `chatid` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `groupid` bigint(10) NOT NULL DEFAULT '0',
  `system` tinyint(1) NOT NULL DEFAULT '0',
  `message` longtext NOT NULL,
  `timestamp` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_chatmess_use_ix` (`userid`),
  KEY `mdl_chatmess_gro_ix` (`groupid`),
  KEY `mdl_chatmess_timcha_ix` (`timestamp`,`chatid`),
  KEY `mdl_chatmess_cha_ix` (`chatid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Stores all the actual chat messages' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_chat_messages_current`
--

CREATE TABLE IF NOT EXISTS `mdl_chat_messages_current` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `chatid` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `groupid` bigint(10) NOT NULL DEFAULT '0',
  `system` tinyint(1) NOT NULL DEFAULT '0',
  `message` longtext NOT NULL,
  `timestamp` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_chatmesscurr_use_ix` (`userid`),
  KEY `mdl_chatmesscurr_gro_ix` (`groupid`),
  KEY `mdl_chatmesscurr_timcha_ix` (`timestamp`,`chatid`),
  KEY `mdl_chatmesscurr_cha_ix` (`chatid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Stores current session' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_chat_users`
--

CREATE TABLE IF NOT EXISTS `mdl_chat_users` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `chatid` bigint(11) NOT NULL DEFAULT '0',
  `userid` bigint(11) NOT NULL DEFAULT '0',
  `groupid` bigint(11) NOT NULL DEFAULT '0',
  `version` varchar(16) NOT NULL DEFAULT '',
  `ip` varchar(45) NOT NULL DEFAULT '',
  `firstping` bigint(10) NOT NULL DEFAULT '0',
  `lastping` bigint(10) NOT NULL DEFAULT '0',
  `lastmessageping` bigint(10) NOT NULL DEFAULT '0',
  `sid` varchar(32) NOT NULL DEFAULT '',
  `course` bigint(10) NOT NULL DEFAULT '0',
  `lang` varchar(30) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `mdl_chatuser_use_ix` (`userid`),
  KEY `mdl_chatuser_las_ix` (`lastping`),
  KEY `mdl_chatuser_gro_ix` (`groupid`),
  KEY `mdl_chatuser_cha_ix` (`chatid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Keeps track of which users are in which chat rooms' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_choice`
--

CREATE TABLE IF NOT EXISTS `mdl_choice` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `course` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `intro` longtext NOT NULL,
  `introformat` smallint(4) NOT NULL DEFAULT '0',
  `publish` tinyint(2) NOT NULL DEFAULT '0',
  `showresults` tinyint(2) NOT NULL DEFAULT '0',
  `display` smallint(4) NOT NULL DEFAULT '0',
  `allowupdate` tinyint(2) NOT NULL DEFAULT '0',
  `showunanswered` tinyint(2) NOT NULL DEFAULT '0',
  `limitanswers` tinyint(2) NOT NULL DEFAULT '0',
  `timeopen` bigint(10) NOT NULL DEFAULT '0',
  `timeclose` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `completionsubmit` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_choi_cou_ix` (`course`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Available choices are stored here' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_choice_answers`
--

CREATE TABLE IF NOT EXISTS `mdl_choice_answers` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `choiceid` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `optionid` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_choiansw_use_ix` (`userid`),
  KEY `mdl_choiansw_cho_ix` (`choiceid`),
  KEY `mdl_choiansw_opt_ix` (`optionid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='choices performed by users' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_choice_options`
--

CREATE TABLE IF NOT EXISTS `mdl_choice_options` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `choiceid` bigint(10) NOT NULL DEFAULT '0',
  `text` longtext,
  `maxanswers` bigint(10) DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_choiopti_cho_ix` (`choiceid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='available options to choice' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_cohort`
--

CREATE TABLE IF NOT EXISTS `mdl_cohort` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `contextid` bigint(10) NOT NULL,
  `name` varchar(254) NOT NULL DEFAULT '',
  `idnumber` varchar(100) DEFAULT NULL,
  `description` longtext,
  `descriptionformat` tinyint(2) NOT NULL,
  `component` varchar(100) NOT NULL DEFAULT '',
  `timecreated` bigint(10) NOT NULL,
  `timemodified` bigint(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_coho_con_ix` (`contextid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Each record represents one cohort (aka site-wide group).' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_cohort_members`
--

CREATE TABLE IF NOT EXISTS `mdl_cohort_members` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `cohortid` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `timeadded` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_cohomemb_cohuse_uix` (`cohortid`,`userid`),
  KEY `mdl_cohomemb_coh_ix` (`cohortid`),
  KEY `mdl_cohomemb_use_ix` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Link a user to a cohort.' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_comments`
--

CREATE TABLE IF NOT EXISTS `mdl_comments` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `contextid` bigint(10) NOT NULL,
  `commentarea` varchar(255) NOT NULL DEFAULT '',
  `itemid` bigint(10) NOT NULL,
  `content` longtext NOT NULL,
  `format` tinyint(2) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL,
  `timecreated` bigint(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='moodle comments module' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_config`
--

CREATE TABLE IF NOT EXISTS `mdl_config` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  `value` longtext NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_conf_nam_uix` (`name`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Moodle configuration variables' AUTO_INCREMENT=405 ;

--
-- Dumping data for table `mdl_config`
--

INSERT INTO `mdl_config` (`id`, `name`, `value`) VALUES
(2, 'rolesactive', '1'),
(3, 'auth', 'email'),
(4, 'auth_pop3mailbox', 'INBOX'),
(5, 'enrol_plugins_enabled', 'manual,guest,self,cohort'),
(6, 'theme', 'standard'),
(7, 'filter_multilang_converted', '1'),
(8, 'siteidentifier', '5xQ9JuDzjJSoQGJOdHxIGCHkiP1kUnlVlocalhost'),
(9, 'backup_version', '2008111700'),
(10, 'backup_release', '2.0 dev'),
(11, 'mnet_dispatcher_mode', 'off'),
(12, 'sessiontimeout', '7200'),
(13, 'stringfilters', ''),
(14, 'filterall', '0'),
(15, 'texteditors', 'tinymce,textarea'),
(16, 'mnet_localhost_id', '1'),
(17, 'mnet_all_hosts_id', '2'),
(18, 'siteguest', '1'),
(19, 'siteadmins', '2'),
(20, 'themerev', '1365530675'),
(21, 'jsrev', '1365530675'),
(22, 'licenses', 'unknown,allrightsreserved,public,cc,cc-nd,cc-nc-nd,cc-nc,cc-nc-sa,cc-sa'),
(23, 'version', '2012120303'),
(24, 'enableoutcomes', '0'),
(25, 'usecomments', '1'),
(26, 'usetags', '1'),
(27, 'enablenotes', '1'),
(28, 'enableportfolios', '0'),
(29, 'enablewebservices', '0'),
(30, 'messaging', '1'),
(31, 'messaginghidereadnotifications', '0'),
(32, 'messagingdeletereadnotificationsdelay', '604800'),
(33, 'messagingallowemailoverride', '0'),
(34, 'enablestats', '0'),
(35, 'enablerssfeeds', '0'),
(36, 'enableblogs', '1'),
(37, 'enablecompletion', '0'),
(38, 'enableavailability', '0'),
(39, 'enableplagiarism', '0'),
(40, 'autologinguests', '0'),
(41, 'hiddenuserfields', ''),
(42, 'showuseridentity', 'email'),
(43, 'enablegravatar', '0'),
(44, 'gravatardefaulturl', 'mm'),
(45, 'enablecourserequests', '0'),
(46, 'defaultrequestcategory', '1'),
(47, 'requestcategoryselection', '0'),
(48, 'courserequestnotify', ''),
(49, 'grade_profilereport', 'user'),
(50, 'grade_aggregationposition', '1'),
(51, 'grade_includescalesinaggregation', '1'),
(52, 'grade_hiddenasdate', '0'),
(53, 'gradepublishing', '0'),
(54, 'grade_export_displaytype', '1'),
(55, 'grade_export_decimalpoints', '2'),
(56, 'grade_navmethod', '0'),
(57, 'grade_export_userprofilefields', 'firstname,lastname,idnumber,institution,department,email'),
(58, 'grade_export_customprofilefields', ''),
(59, 'recovergradesdefault', '0'),
(60, 'gradeexport', ''),
(61, 'unlimitedgrades', '0'),
(62, 'grade_hideforcedsettings', '1'),
(63, 'grade_aggregation', '11'),
(64, 'grade_aggregation_flag', '0'),
(65, 'grade_aggregations_visible', '0,10,11,12,2,4,6,8,13'),
(66, 'grade_aggregateonlygraded', '1'),
(67, 'grade_aggregateonlygraded_flag', '2'),
(68, 'grade_aggregateoutcomes', '0'),
(69, 'grade_aggregateoutcomes_flag', '2'),
(70, 'grade_aggregatesubcats', '0'),
(71, 'grade_aggregatesubcats_flag', '2'),
(72, 'grade_keephigh', '0'),
(73, 'grade_keephigh_flag', '3'),
(74, 'grade_droplow', '0'),
(75, 'grade_droplow_flag', '2'),
(76, 'grade_displaytype', '1'),
(77, 'grade_decimalpoints', '2'),
(78, 'grade_item_advanced', 'iteminfo,idnumber,gradepass,plusfactor,multfactor,display,decimals,hiddenuntil,locktime'),
(79, 'grade_report_studentsperpage', '100'),
(80, 'grade_report_quickgrading', '1'),
(81, 'grade_report_showquickfeedback', '0'),
(82, 'grade_report_fixedstudents', '0'),
(83, 'grade_report_meanselection', '1'),
(84, 'grade_report_enableajax', '0'),
(85, 'grade_report_showcalculations', '0'),
(86, 'grade_report_showeyecons', '0'),
(87, 'grade_report_showaverages', '1'),
(88, 'grade_report_showlocks', '0'),
(89, 'grade_report_showranges', '0'),
(90, 'grade_report_showanalysisicon', '1'),
(91, 'grade_report_showuserimage', '1'),
(92, 'grade_report_showactivityicons', '1'),
(93, 'grade_report_shownumberofgrades', '0'),
(94, 'grade_report_averagesdisplaytype', 'inherit'),
(95, 'grade_report_rangesdisplaytype', 'inherit'),
(96, 'grade_report_averagesdecimalpoints', 'inherit'),
(97, 'grade_report_rangesdecimalpoints', 'inherit'),
(98, 'grade_report_overview_showrank', '0'),
(99, 'grade_report_overview_showtotalsifcontainhidden', '0'),
(100, 'grade_report_user_showrank', '0'),
(101, 'grade_report_user_showpercentage', '1'),
(102, 'grade_report_user_showgrade', '1'),
(103, 'grade_report_user_showfeedback', '1'),
(104, 'grade_report_user_showrange', '1'),
(105, 'grade_report_user_showweight', '0'),
(106, 'grade_report_user_showaverage', '0'),
(107, 'grade_report_user_showlettergrade', '0'),
(108, 'grade_report_user_rangedecimals', '0'),
(109, 'grade_report_user_showhiddenitems', '1'),
(110, 'grade_report_user_showtotalsifcontainhidden', '0'),
(111, 'timezone', '99'),
(112, 'forcetimezone', '99'),
(113, 'country', '0'),
(114, 'defaultcity', ''),
(115, 'geoipfile', 'D:\\xampp\\moodle243data/geoip/GeoLiteCity.dat'),
(116, 'googlemapkey3', ''),
(117, 'allcountrycodes', ''),
(118, 'autolang', '1'),
(119, 'lang', 'en'),
(120, 'langmenu', '1'),
(121, 'langlist', ''),
(122, 'langrev', '1365530676'),
(123, 'langcache', '1'),
(124, 'langstringcache', '1'),
(125, 'locale', ''),
(126, 'latinexcelexport', '0'),
(127, 'block_course_list_adminview', 'all'),
(128, 'block_course_list_hideallcourseslink', '0'),
(129, 'block_html_allowcssclasses', '0'),
(130, 'block_online_users_timetosee', '5'),
(131, 'block_rss_client_num_entries', '5'),
(132, 'block_rss_client_timeout', '30'),
(133, 'block_tags_showcoursetags', '0'),
(135, 'authpreventaccountcreation', '0'),
(136, 'loginpageautofocus', '0'),
(137, 'guestloginbutton', '1'),
(138, 'alternateloginurl', ''),
(139, 'forgottenpasswordurl', ''),
(140, 'auth_instructions', ''),
(141, 'allowemailaddresses', ''),
(142, 'denyemailaddresses', ''),
(143, 'verifychangedemail', '1'),
(144, 'recaptchapublickey', ''),
(145, 'recaptchaprivatekey', ''),
(146, 'sitedefaultlicense', 'allrightsreserved'),
(147, 'cachetext', '60'),
(148, 'filteruploadedfiles', '0'),
(149, 'filtermatchoneperpage', '0'),
(150, 'filtermatchonepertext', '0'),
(151, 'portfolio_moderate_filesize_threshold', '1048576'),
(152, 'portfolio_high_filesize_threshold', '5242880'),
(153, 'portfolio_moderate_db_threshold', '20'),
(154, 'portfolio_high_db_threshold', '50'),
(155, 'repositorycacheexpire', '120'),
(156, 'repositoryallowexternallinks', '1'),
(157, 'legacyfilesinnewcourses', '0'),
(158, 'mobilecssurl', ''),
(159, 'enablewsdocumentation', '0'),
(160, 'allowbeforeblock', '0'),
(161, 'allowedip', ''),
(162, 'blockedip', ''),
(163, 'protectusernames', '1'),
(164, 'forcelogin', '0'),
(165, 'forceloginforprofiles', '1'),
(166, 'forceloginforprofileimage', '0'),
(167, 'opentogoogle', '0'),
(168, 'maxbytes', '0'),
(169, 'userquota', '104857600'),
(170, 'allowobjectembed', '0'),
(171, 'enabletrusttext', '0'),
(172, 'maxeditingtime', '1800'),
(173, 'fullnamedisplay', 'language'),
(174, 'extendedusernamechars', '0'),
(175, 'sitepolicy', ''),
(176, 'sitepolicyguest', ''),
(177, 'keeptagnamecase', '1'),
(178, 'profilesforenrolledusersonly', '1'),
(179, 'cronclionly', '0'),
(180, 'cronremotepassword', ''),
(181, 'passwordpolicy', '1'),
(182, 'minpasswordlength', '8'),
(183, 'minpassworddigits', '1'),
(184, 'minpasswordlower', '1'),
(185, 'minpasswordupper', '1'),
(186, 'minpasswordnonalphanum', '1'),
(187, 'maxconsecutiveidentchars', '0'),
(188, 'groupenrolmentkeypolicy', '1'),
(189, 'disableuserimages', '0'),
(190, 'emailchangeconfirmation', '1'),
(191, 'rememberusername', '2'),
(192, 'strictformsrequired', '0'),
(193, 'loginhttps', '0'),
(194, 'cookiesecure', '0'),
(195, 'cookiehttponly', '0'),
(196, 'allowframembedding', '0'),
(197, 'loginpasswordautocomplete', '0'),
(198, 'displayloginfailures', ''),
(199, 'notifyloginfailures', ''),
(200, 'notifyloginthreshold', '10'),
(201, 'runclamonupload', '0'),
(202, 'pathtoclam', ''),
(203, 'quarantinedir', ''),
(204, 'clamfailureonupload', 'donothing'),
(205, 'themelist', ''),
(206, 'themedesignermode', '0'),
(207, 'allowuserthemes', '0'),
(208, 'allowcoursethemes', '0'),
(209, 'allowcategorythemes', '0'),
(210, 'allowthemechangeonurl', '0'),
(211, 'allowuserblockhiding', '1'),
(212, 'allowblockstodock', '1'),
(213, 'custommenuitems', ''),
(214, 'enabledevicedetection', '1'),
(215, 'devicedetectregex', '[]'),
(216, 'calendar_adminseesall', '0'),
(217, 'calendar_site_timeformat', '0'),
(218, 'calendar_startwday', '0'),
(219, 'calendar_weekend', '65'),
(220, 'calendar_lookahead', '21'),
(221, 'calendar_maxevents', '10'),
(222, 'enablecalendarexport', '1'),
(223, 'calendar_exportsalt', 'TocwqctWwZmpnlHjdubhvEoYI1nKN3qwl8GcawhQvNrJL20ZdK9LD1nJ3n68'),
(224, 'useblogassociations', '1'),
(225, 'bloglevel', '4'),
(226, 'useexternalblogs', '1'),
(227, 'externalblogcrontime', '86400'),
(228, 'maxexternalblogsperuser', '1'),
(229, 'blogusecomments', '1'),
(230, 'blogshowcommentscount', '1'),
(231, 'defaulthomepage', '0'),
(232, 'allowguestmymoodle', '1'),
(233, 'navshowcategories', '1'),
(234, 'navshowmycoursecategories', '0'),
(235, 'navshowallcourses', '0'),
(236, 'navsortmycoursessort', 'sortorder'),
(237, 'navcourselimit', '20'),
(238, 'usesitenameforsitepages', '0'),
(239, 'linkadmincategories', '0'),
(240, 'navshowfrontpagemods', '1'),
(241, 'navadduserpostslinks', '1'),
(242, 'formatstringstriptags', '1'),
(243, 'emoticons', '[{"text":":-)","imagename":"s\\/smiley","imagecomponent":"core","altidentifier":"smiley","altcomponent":"core_pix"},{"text":":)","imagename":"s\\/smiley","imagecomponent":"core","altidentifier":"smiley","altcomponent":"core_pix"},{"text":":-D","imagename":"s\\/biggrin","imagecomponent":"core","altidentifier":"biggrin","altcomponent":"core_pix"},{"text":";-)","imagename":"s\\/wink","imagecomponent":"core","altidentifier":"wink","altcomponent":"core_pix"},{"text":":-\\/","imagename":"s\\/mixed","imagecomponent":"core","altidentifier":"mixed","altcomponent":"core_pix"},{"text":"V-.","imagename":"s\\/thoughtful","imagecomponent":"core","altidentifier":"thoughtful","altcomponent":"core_pix"},{"text":":-P","imagename":"s\\/tongueout","imagecomponent":"core","altidentifier":"tongueout","altcomponent":"core_pix"},{"text":":-p","imagename":"s\\/tongueout","imagecomponent":"core","altidentifier":"tongueout","altcomponent":"core_pix"},{"text":"B-)","imagename":"s\\/cool","imagecomponent":"core","altidentifier":"cool","altcomponent":"core_pix"},{"text":"^-)","imagename":"s\\/approve","imagecomponent":"core","altidentifier":"approve","altcomponent":"core_pix"},{"text":"8-)","imagename":"s\\/wideeyes","imagecomponent":"core","altidentifier":"wideeyes","altcomponent":"core_pix"},{"text":":o)","imagename":"s\\/clown","imagecomponent":"core","altidentifier":"clown","altcomponent":"core_pix"},{"text":":-(","imagename":"s\\/sad","imagecomponent":"core","altidentifier":"sad","altcomponent":"core_pix"},{"text":":(","imagename":"s\\/sad","imagecomponent":"core","altidentifier":"sad","altcomponent":"core_pix"},{"text":"8-.","imagename":"s\\/shy","imagecomponent":"core","altidentifier":"shy","altcomponent":"core_pix"},{"text":":-I","imagename":"s\\/blush","imagecomponent":"core","altidentifier":"blush","altcomponent":"core_pix"},{"text":":-X","imagename":"s\\/kiss","imagecomponent":"core","altidentifier":"kiss","altcomponent":"core_pix"},{"text":"8-o","imagename":"s\\/surprise","imagecomponent":"core","altidentifier":"surprise","altcomponent":"core_pix"},{"text":"P-|","imagename":"s\\/blackeye","imagecomponent":"core","altidentifier":"blackeye","altcomponent":"core_pix"},{"text":"8-[","imagename":"s\\/angry","imagecomponent":"core","altidentifier":"angry","altcomponent":"core_pix"},{"text":"(grr)","imagename":"s\\/angry","imagecomponent":"core","altidentifier":"angry","altcomponent":"core_pix"},{"text":"xx-P","imagename":"s\\/dead","imagecomponent":"core","altidentifier":"dead","altcomponent":"core_pix"},{"text":"|-.","imagename":"s\\/sleepy","imagecomponent":"core","altidentifier":"sleepy","altcomponent":"core_pix"},{"text":"}-]","imagename":"s\\/evil","imagecomponent":"core","altidentifier":"evil","altcomponent":"core_pix"},{"text":"(h)","imagename":"s\\/heart","imagecomponent":"core","altidentifier":"heart","altcomponent":"core_pix"},{"text":"(heart)","imagename":"s\\/heart","imagecomponent":"core","altidentifier":"heart","altcomponent":"core_pix"},{"text":"(y)","imagename":"s\\/yes","imagecomponent":"core","altidentifier":"yes","altcomponent":"core"},{"text":"(n)","imagename":"s\\/no","imagecomponent":"core","altidentifier":"no","altcomponent":"core"},{"text":"(martin)","imagename":"s\\/martin","imagecomponent":"core","altidentifier":"martin","altcomponent":"core_pix"},{"text":"( )","imagename":"s\\/egg","imagecomponent":"core","altidentifier":"egg","altcomponent":"core_pix"}]'),
(244, 'core_media_enable_youtube', '1'),
(245, 'core_media_enable_vimeo', '0'),
(246, 'core_media_enable_mp3', '1'),
(247, 'core_media_enable_flv', '1'),
(248, 'core_media_enable_swf', '1'),
(249, 'core_media_enable_html5audio', '1'),
(250, 'core_media_enable_html5video', '1'),
(251, 'core_media_enable_qt', '1'),
(252, 'core_media_enable_wmp', '1'),
(253, 'core_media_enable_rm', '1'),
(254, 'docroot', 'http://docs.moodle.org'),
(255, 'doctonewwindow', '0'),
(256, 'courselistshortnames', '0'),
(257, 'coursesperpage', '20'),
(258, 'courseswithsummarieslimit', '10'),
(259, 'enableajax', '1'),
(260, 'useexternalyui', '0'),
(261, 'yuicomboloading', '1'),
(262, 'cachejs', '1'),
(263, 'modchooserdefault', '1'),
(264, 'additionalhtmlhead', ''),
(265, 'additionalhtmltopofbody', ''),
(266, 'additionalhtmlfooter', ''),
(267, 'gdversion', '2'),
(268, 'pathtodu', ''),
(269, 'aspellpath', ''),
(270, 'pathtodot', ''),
(271, 'supportpage', ''),
(272, 'dbsessions', '1'),
(273, 'sessioncookie', ''),
(274, 'sessioncookiepath', ''),
(275, 'sessioncookiedomain', ''),
(276, 'statsfirstrun', 'none'),
(277, 'statsmaxruntime', '0'),
(278, 'statsruntimedays', '31'),
(279, 'statsruntimestarthour', '0'),
(280, 'statsruntimestartminute', '0'),
(281, 'statsuserthreshold', '0'),
(282, 'slasharguments', '1'),
(283, 'getremoteaddrconf', '0'),
(284, 'proxyhost', ''),
(285, 'proxyport', '0'),
(286, 'proxytype', 'HTTP'),
(287, 'proxyuser', ''),
(288, 'proxypassword', ''),
(289, 'proxybypass', 'localhost, 127.0.0.1'),
(290, 'maintenance_enabled', '0'),
(291, 'maintenance_message', ''),
(292, 'deleteunconfirmed', '168'),
(293, 'deleteincompleteusers', '0'),
(294, 'logguests', '1'),
(295, 'loglifetime', '0'),
(296, 'disablegradehistory', '0'),
(297, 'gradehistorylifetime', '0'),
(298, 'numcoursesincombo', '500'),
(299, 'extramemorylimit', '512M'),
(300, 'curlcache', '120'),
(301, 'curltimeoutkbitrate', '56'),
(302, 'updateautocheck', '1'),
(303, 'updateautodeploy', '0'),
(304, 'updateminmaturity', '200'),
(305, 'updatenotifybuilds', '0'),
(306, 'enablesafebrowserintegration', '0'),
(307, 'enablegroupmembersonly', '0'),
(308, 'dndallowtextandlinks', '0'),
(309, 'enablecssoptimiser', '0'),
(310, 'debug', '0'),
(311, 'debugdisplay', '1'),
(312, 'debugsmtp', '0'),
(313, 'perfdebug', '7'),
(314, 'debugstringids', '0'),
(315, 'debugvalidators', '0'),
(316, 'debugpageinfo', '0'),
(317, 'release', '2.4.3 (Build: 20130318)'),
(318, 'branch', '24'),
(320, 'notloggedinroleid', '6'),
(321, 'guestroleid', '6'),
(322, 'defaultuserroleid', '7'),
(323, 'creatornewroleid', '3'),
(324, 'restorernewroleid', '3'),
(325, 'gradebookroles', '5'),
(326, 'assignment_maxbytes', '1048576'),
(327, 'assignment_itemstocount', '1'),
(328, 'assignment_showrecentsubmissions', '1'),
(329, 'chat_method', 'ajax'),
(330, 'chat_refresh_userlist', '10'),
(331, 'chat_old_ping', '35'),
(332, 'chat_refresh_room', '5'),
(333, 'chat_normal_updatemode', 'jsupdate'),
(334, 'chat_serverhost', 'localhost'),
(335, 'chat_serverip', '127.0.0.1'),
(336, 'chat_serverport', '9111'),
(337, 'chat_servermax', '100'),
(338, 'data_enablerssfeeds', '0'),
(339, 'feedback_allowfullanonymous', '0'),
(340, 'forum_displaymode', '3'),
(341, 'forum_replytouser', '1'),
(342, 'forum_shortpost', '300'),
(343, 'forum_longpost', '600'),
(344, 'forum_manydiscussions', '100'),
(345, 'forum_maxbytes', '512000'),
(346, 'forum_maxattachments', '9'),
(347, 'forum_trackreadposts', '1'),
(348, 'forum_oldpostdays', '14'),
(349, 'forum_usermarksread', '0'),
(350, 'forum_cleanreadtime', '2'),
(351, 'digestmailtime', '17'),
(352, 'forum_enablerssfeeds', '0'),
(353, 'forum_enabletimedposts', '0'),
(354, 'glossary_entbypage', '10'),
(355, 'glossary_dupentries', '0'),
(356, 'glossary_allowcomments', '0'),
(357, 'glossary_linkbydefault', '1'),
(358, 'glossary_defaultapproval', '1'),
(359, 'glossary_enablerssfeeds', '0'),
(360, 'glossary_linkentries', '0'),
(361, 'glossary_casesensitive', '0'),
(362, 'glossary_fullmatch', '0'),
(363, 'lesson_slideshowwidth', '640'),
(364, 'lesson_slideshowheight', '480'),
(365, 'lesson_slideshowbgcolor', '#FFFFFF'),
(366, 'lesson_mediawidth', '640'),
(367, 'lesson_mediaheight', '480'),
(368, 'lesson_mediaclose', '0'),
(369, 'lesson_maxhighscores', '10'),
(370, 'lesson_maxanswers', '4'),
(371, 'lesson_defaultnextpage', '0'),
(372, 'smtphosts', ''),
(373, 'smtpsecure', ''),
(374, 'smtpuser', ''),
(375, 'smtppass', ''),
(376, 'smtpmaxbulk', '1'),
(377, 'noreplyaddress', 'noreply@localhost'),
(378, 'sitemailcharset', '0'),
(379, 'allowusermailcharset', '0'),
(380, 'mailnewline', 'LF'),
(381, 'jabberhost', ''),
(382, 'jabberserver', ''),
(383, 'jabberusername', ''),
(384, 'jabberpassword', ''),
(385, 'jabberport', '5222'),
(386, 'filter_multilang_force_old', '0'),
(387, 'filter_tex_latexpreamble', '\\usepackage[latin1]{inputenc}\n\\usepackage{amsmath}\n\\usepackage{amsfonts}\n\\RequirePackage{amsmath,amssymb,latexsym}\n'),
(388, 'filter_tex_latexbackground', '#FFFFFF'),
(389, 'filter_tex_density', '120'),
(390, 'filter_tex_pathlatex', '"c:\\texmf\\miktex\\bin\\latex.exe" '),
(391, 'filter_tex_pathdvips', '"c:\\texmf\\miktex\\bin\\dvips.exe" '),
(392, 'filter_tex_pathconvert', '"c:\\imagemagick\\convert.exe" '),
(393, 'filter_tex_convertformat', 'gif'),
(394, 'filter_censor_badwords', ''),
(395, 'profileroles', '5,4,3'),
(396, 'coursecontact', '3'),
(397, 'frontpage', '1'),
(398, 'frontpageloggedin', '1'),
(399, 'maxcategorydepth', '0'),
(400, 'commentsperpage', '15'),
(401, 'defaultfrontpageroleid', '8'),
(402, 'supportname', 'Admin User'),
(403, 'supportemail', 'admin@admin.com'),
(404, 'registerauth', 'email');

-- --------------------------------------------------------

--
-- Table structure for table `mdl_config_log`
--

CREATE TABLE IF NOT EXISTS `mdl_config_log` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `userid` bigint(10) NOT NULL,
  `timemodified` bigint(10) NOT NULL,
  `plugin` varchar(100) DEFAULT NULL,
  `name` varchar(100) NOT NULL DEFAULT '',
  `value` longtext,
  `oldvalue` longtext,
  PRIMARY KEY (`id`),
  KEY `mdl_conflog_tim_ix` (`timemodified`),
  KEY `mdl_conflog_use_ix` (`userid`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Changes done in server configuration through admin UI' AUTO_INCREMENT=807 ;

--
-- Dumping data for table `mdl_config_log`
--

INSERT INTO `mdl_config_log` (`id`, `userid`, `timemodified`, `plugin`, `name`, `value`, `oldvalue`) VALUES
(1, 0, 1365445904, NULL, 'enableoutcomes', '0', NULL),
(2, 0, 1365445904, NULL, 'usecomments', '1', NULL),
(3, 0, 1365445904, NULL, 'usetags', '1', NULL),
(4, 0, 1365445904, NULL, 'enablenotes', '1', NULL),
(5, 0, 1365445904, NULL, 'enableportfolios', '0', NULL),
(6, 0, 1365445904, NULL, 'enablewebservices', '0', NULL),
(7, 0, 1365445904, NULL, 'messaging', '1', NULL),
(8, 0, 1365445904, NULL, 'messaginghidereadnotifications', '0', NULL),
(9, 0, 1365445904, NULL, 'messagingdeletereadnotificationsdelay', '604800', NULL),
(10, 0, 1365445904, NULL, 'messagingallowemailoverride', '0', NULL),
(11, 0, 1365445904, NULL, 'enablestats', '0', NULL),
(12, 0, 1365445904, NULL, 'enablerssfeeds', '0', NULL),
(13, 0, 1365445904, NULL, 'enableblogs', '1', NULL),
(14, 0, 1365445904, NULL, 'enablecompletion', '0', NULL),
(15, 0, 1365445904, NULL, 'enableavailability', '0', NULL),
(16, 0, 1365445904, NULL, 'enableplagiarism', '0', NULL),
(17, 0, 1365445904, NULL, 'autologinguests', '0', NULL),
(18, 0, 1365445904, NULL, 'hiddenuserfields', '', NULL),
(19, 0, 1365445904, NULL, 'showuseridentity', 'email', NULL),
(20, 0, 1365445904, NULL, 'enablegravatar', '0', NULL),
(21, 0, 1365445904, NULL, 'gravatardefaulturl', 'mm', NULL),
(22, 0, 1365445904, 'moodlecourse', 'format', 'weeks', NULL),
(23, 0, 1365445904, 'moodlecourse', 'maxsections', '52', NULL),
(24, 0, 1365445904, 'moodlecourse', 'numsections', '10', NULL),
(25, 0, 1365445904, 'moodlecourse', 'hiddensections', '0', NULL),
(26, 0, 1365445904, 'moodlecourse', 'newsitems', '5', NULL),
(27, 0, 1365445904, 'moodlecourse', 'showgrades', '1', NULL),
(28, 0, 1365445904, 'moodlecourse', 'showreports', '0', NULL),
(29, 0, 1365445904, 'moodlecourse', 'maxbytes', '8388608', NULL),
(30, 0, 1365445904, 'moodlecourse', 'coursedisplay', '0', NULL),
(31, 0, 1365445904, 'moodlecourse', 'groupmode', '0', NULL),
(32, 0, 1365445904, 'moodlecourse', 'groupmodeforce', '0', NULL),
(33, 0, 1365445904, 'moodlecourse', 'visible', '1', NULL),
(34, 0, 1365445904, 'moodlecourse', 'lang', '', NULL),
(35, 0, 1365445904, 'moodlecourse', 'enablecompletion', '0', NULL),
(36, 0, 1365445904, 'moodlecourse', 'completionstartonenrol', '0', NULL),
(37, 0, 1365445904, NULL, 'enablecourserequests', '0', NULL),
(38, 0, 1365445904, NULL, 'defaultrequestcategory', '1', NULL),
(39, 0, 1365445904, NULL, 'requestcategoryselection', '0', NULL),
(40, 0, 1365445904, NULL, 'courserequestnotify', '', NULL),
(41, 0, 1365445904, 'backup', 'loglifetime', '30', NULL),
(42, 0, 1365445904, 'backup', 'backup_general_users', '1', NULL),
(43, 0, 1365445904, 'backup', 'backup_general_users_locked', '0', NULL),
(44, 0, 1365445904, 'backup', 'backup_general_anonymize', '0', NULL),
(45, 0, 1365445904, 'backup', 'backup_general_anonymize_locked', '0', NULL),
(46, 0, 1365445904, 'backup', 'backup_general_role_assignments', '1', NULL),
(47, 0, 1365445905, 'backup', 'backup_general_role_assignments_locked', '0', NULL),
(48, 0, 1365445905, 'backup', 'backup_general_activities', '1', NULL),
(49, 0, 1365445905, 'backup', 'backup_general_activities_locked', '0', NULL),
(50, 0, 1365445905, 'backup', 'backup_general_blocks', '1', NULL),
(51, 0, 1365445905, 'backup', 'backup_general_blocks_locked', '0', NULL),
(52, 0, 1365445905, 'backup', 'backup_general_filters', '1', NULL),
(53, 0, 1365445905, 'backup', 'backup_general_filters_locked', '0', NULL),
(54, 0, 1365445905, 'backup', 'backup_general_comments', '1', NULL),
(55, 0, 1365445905, 'backup', 'backup_general_comments_locked', '0', NULL),
(56, 0, 1365445905, 'backup', 'backup_general_userscompletion', '1', NULL),
(57, 0, 1365445905, 'backup', 'backup_general_userscompletion_locked', '0', NULL),
(58, 0, 1365445905, 'backup', 'backup_general_logs', '0', NULL),
(59, 0, 1365445905, 'backup', 'backup_general_logs_locked', '0', NULL),
(60, 0, 1365445905, 'backup', 'backup_general_histories', '0', NULL),
(61, 0, 1365445905, 'backup', 'backup_general_histories_locked', '0', NULL),
(62, 0, 1365445905, 'backup', 'backup_auto_active', '0', NULL),
(63, 0, 1365445905, 'backup', 'backup_auto_weekdays', '0000000', NULL),
(64, 0, 1365445905, 'backup', 'backup_auto_hour', '0', NULL),
(65, 0, 1365445905, 'backup', 'backup_auto_minute', '0', NULL),
(66, 0, 1365445905, 'backup', 'backup_auto_storage', '0', NULL),
(67, 0, 1365445905, 'backup', 'backup_auto_destination', '', NULL),
(68, 0, 1365445905, 'backup', 'backup_auto_keep', '1', NULL),
(69, 0, 1365445905, 'backup', 'backup_shortname', '0', NULL),
(70, 0, 1365445905, 'backup', 'backup_auto_skip_hidden', '1', NULL),
(71, 0, 1365445905, 'backup', 'backup_auto_skip_modif_days', '30', NULL),
(72, 0, 1365445905, 'backup', 'backup_auto_skip_modif_prev', '0', NULL),
(73, 0, 1365445905, 'backup', 'backup_auto_users', '1', NULL),
(74, 0, 1365445905, 'backup', 'backup_auto_role_assignments', '1', NULL),
(75, 0, 1365445905, 'backup', 'backup_auto_activities', '1', NULL),
(76, 0, 1365445905, 'backup', 'backup_auto_blocks', '1', NULL),
(77, 0, 1365445905, 'backup', 'backup_auto_filters', '1', NULL),
(78, 0, 1365445905, 'backup', 'backup_auto_comments', '1', NULL),
(79, 0, 1365445905, 'backup', 'backup_auto_userscompletion', '1', NULL),
(80, 0, 1365445905, 'backup', 'backup_auto_logs', '0', NULL),
(81, 0, 1365445905, 'backup', 'backup_auto_histories', '0', NULL),
(82, 0, 1365445905, NULL, 'grade_profilereport', 'user', NULL),
(83, 0, 1365445905, NULL, 'grade_aggregationposition', '1', NULL),
(84, 0, 1365445905, NULL, 'grade_includescalesinaggregation', '1', NULL),
(85, 0, 1365445905, NULL, 'grade_hiddenasdate', '0', NULL),
(86, 0, 1365445905, NULL, 'gradepublishing', '0', NULL),
(87, 0, 1365445905, NULL, 'grade_export_displaytype', '1', NULL),
(88, 0, 1365445905, NULL, 'grade_export_decimalpoints', '2', NULL),
(89, 0, 1365445905, NULL, 'grade_navmethod', '0', NULL),
(90, 0, 1365445905, NULL, 'grade_export_userprofilefields', 'firstname,lastname,idnumber,institution,department,email', NULL),
(91, 0, 1365445905, NULL, 'grade_export_customprofilefields', '', NULL),
(92, 0, 1365445905, NULL, 'recovergradesdefault', '0', NULL),
(93, 0, 1365445905, NULL, 'gradeexport', '', NULL),
(94, 0, 1365445905, NULL, 'unlimitedgrades', '0', NULL),
(95, 0, 1365445905, NULL, 'grade_hideforcedsettings', '1', NULL),
(96, 0, 1365445905, NULL, 'grade_aggregation', '11', NULL),
(97, 0, 1365445905, NULL, 'grade_aggregation_flag', '0', NULL),
(98, 0, 1365445905, NULL, 'grade_aggregations_visible', '0,10,11,12,2,4,6,8,13', NULL),
(99, 0, 1365445905, NULL, 'grade_aggregateonlygraded', '1', NULL),
(100, 0, 1365445905, NULL, 'grade_aggregateonlygraded_flag', '2', NULL),
(101, 0, 1365445905, NULL, 'grade_aggregateoutcomes', '0', NULL),
(102, 0, 1365445905, NULL, 'grade_aggregateoutcomes_flag', '2', NULL),
(103, 0, 1365445905, NULL, 'grade_aggregatesubcats', '0', NULL),
(104, 0, 1365445905, NULL, 'grade_aggregatesubcats_flag', '2', NULL),
(105, 0, 1365445905, NULL, 'grade_keephigh', '0', NULL),
(106, 0, 1365445905, NULL, 'grade_keephigh_flag', '3', NULL),
(107, 0, 1365445905, NULL, 'grade_droplow', '0', NULL),
(108, 0, 1365445905, NULL, 'grade_droplow_flag', '2', NULL),
(109, 0, 1365445905, NULL, 'grade_displaytype', '1', NULL),
(110, 0, 1365445905, NULL, 'grade_decimalpoints', '2', NULL),
(111, 0, 1365445905, NULL, 'grade_item_advanced', 'iteminfo,idnumber,gradepass,plusfactor,multfactor,display,decimals,hiddenuntil,locktime', NULL),
(112, 0, 1365445905, NULL, 'grade_report_studentsperpage', '100', NULL),
(113, 0, 1365445905, NULL, 'grade_report_quickgrading', '1', NULL),
(114, 0, 1365445905, NULL, 'grade_report_showquickfeedback', '0', NULL),
(115, 0, 1365445905, NULL, 'grade_report_fixedstudents', '0', NULL),
(116, 0, 1365445905, NULL, 'grade_report_meanselection', '1', NULL),
(117, 0, 1365445905, NULL, 'grade_report_enableajax', '0', NULL),
(118, 0, 1365445905, NULL, 'grade_report_showcalculations', '0', NULL),
(119, 0, 1365445905, NULL, 'grade_report_showeyecons', '0', NULL),
(120, 0, 1365445905, NULL, 'grade_report_showaverages', '1', NULL),
(121, 0, 1365445905, NULL, 'grade_report_showlocks', '0', NULL),
(122, 0, 1365445905, NULL, 'grade_report_showranges', '0', NULL),
(123, 0, 1365445905, NULL, 'grade_report_showanalysisicon', '1', NULL),
(124, 0, 1365445905, NULL, 'grade_report_showuserimage', '1', NULL),
(125, 0, 1365445905, NULL, 'grade_report_showactivityicons', '1', NULL),
(126, 0, 1365445905, NULL, 'grade_report_shownumberofgrades', '0', NULL),
(127, 0, 1365445905, NULL, 'grade_report_averagesdisplaytype', 'inherit', NULL),
(128, 0, 1365445905, NULL, 'grade_report_rangesdisplaytype', 'inherit', NULL),
(129, 0, 1365445905, NULL, 'grade_report_averagesdecimalpoints', 'inherit', NULL),
(130, 0, 1365445905, NULL, 'grade_report_rangesdecimalpoints', 'inherit', NULL),
(131, 0, 1365445905, NULL, 'grade_report_overview_showrank', '0', NULL),
(132, 0, 1365445905, NULL, 'grade_report_overview_showtotalsifcontainhidden', '0', NULL),
(133, 0, 1365445905, NULL, 'grade_report_user_showrank', '0', NULL),
(134, 0, 1365445905, NULL, 'grade_report_user_showpercentage', '1', NULL),
(135, 0, 1365445905, NULL, 'grade_report_user_showgrade', '1', NULL),
(136, 0, 1365445905, NULL, 'grade_report_user_showfeedback', '1', NULL),
(137, 0, 1365445905, NULL, 'grade_report_user_showrange', '1', NULL),
(138, 0, 1365445905, NULL, 'grade_report_user_showweight', '0', NULL),
(139, 0, 1365445905, NULL, 'grade_report_user_showaverage', '0', NULL),
(140, 0, 1365445905, NULL, 'grade_report_user_showlettergrade', '0', NULL),
(141, 0, 1365445905, NULL, 'grade_report_user_rangedecimals', '0', NULL),
(142, 0, 1365445905, NULL, 'grade_report_user_showhiddenitems', '1', NULL),
(143, 0, 1365445905, NULL, 'grade_report_user_showtotalsifcontainhidden', '0', NULL),
(144, 0, 1365445905, NULL, 'timezone', '99', NULL),
(145, 0, 1365445905, NULL, 'forcetimezone', '99', NULL),
(146, 0, 1365445906, NULL, 'country', '0', NULL),
(147, 0, 1365445906, NULL, 'defaultcity', '', NULL),
(148, 0, 1365445906, NULL, 'geoipfile', 'D:\\xampp\\moodle243data/geoip/GeoLiteCity.dat', NULL),
(149, 0, 1365445906, NULL, 'googlemapkey3', '', NULL),
(150, 0, 1365445906, NULL, 'allcountrycodes', '', NULL),
(151, 0, 1365445906, NULL, 'autolang', '1', NULL),
(152, 0, 1365445906, NULL, 'lang', 'en', NULL),
(153, 0, 1365445906, NULL, 'langmenu', '1', NULL),
(154, 0, 1365445906, NULL, 'langlist', '', NULL),
(155, 0, 1365445906, NULL, 'langcache', '1', NULL),
(156, 0, 1365445906, NULL, 'langstringcache', '1', NULL),
(157, 0, 1365445906, NULL, 'locale', '', NULL),
(158, 0, 1365445906, NULL, 'latinexcelexport', '0', NULL),
(159, 0, 1365445906, NULL, 'block_course_list_adminview', 'all', NULL),
(160, 0, 1365445906, NULL, 'block_course_list_hideallcourseslink', '0', NULL),
(161, 0, 1365445906, 'block_course_overview', 'defaultmaxcourses', '10', NULL),
(162, 0, 1365445906, 'block_course_overview', 'forcedefaultmaxcourses', '0', NULL),
(163, 0, 1365445906, 'block_course_overview', 'showchildren', '0', NULL),
(164, 0, 1365445906, 'block_course_overview', 'showwelcomearea', '0', NULL),
(165, 0, 1365445906, NULL, 'block_html_allowcssclasses', '0', NULL),
(166, 0, 1365445906, NULL, 'block_online_users_timetosee', '5', NULL),
(167, 0, 1365445906, NULL, 'block_rss_client_num_entries', '5', NULL),
(168, 0, 1365445906, NULL, 'block_rss_client_timeout', '30', NULL),
(169, 0, 1365445906, 'blocks/section_links', 'numsections1', '22', NULL),
(170, 0, 1365445906, 'blocks/section_links', 'incby1', '2', NULL),
(171, 0, 1365445906, 'blocks/section_links', 'numsections2', '40', NULL),
(172, 0, 1365445906, 'blocks/section_links', 'incby2', '5', NULL),
(173, 0, 1365445906, NULL, 'block_tags_showcoursetags', '0', NULL),
(174, 0, 1365445906, NULL, 'registerauth', '', NULL),
(175, 0, 1365445906, NULL, 'authpreventaccountcreation', '0', NULL),
(176, 0, 1365445906, NULL, 'loginpageautofocus', '0', NULL),
(177, 0, 1365445906, NULL, 'guestloginbutton', '1', NULL),
(178, 0, 1365445906, NULL, 'alternateloginurl', '', NULL),
(179, 0, 1365445906, NULL, 'forgottenpasswordurl', '', NULL),
(180, 0, 1365445906, NULL, 'auth_instructions', '', NULL),
(181, 0, 1365445906, NULL, 'allowemailaddresses', '', NULL),
(182, 0, 1365445906, NULL, 'denyemailaddresses', '', NULL),
(183, 0, 1365445906, NULL, 'verifychangedemail', '1', NULL),
(184, 0, 1365445906, NULL, 'recaptchapublickey', '', NULL),
(185, 0, 1365445906, NULL, 'recaptchaprivatekey', '', NULL),
(186, 0, 1365445906, 'enrol_database', 'dbtype', '', NULL),
(187, 0, 1365445906, 'enrol_database', 'dbhost', 'localhost', NULL),
(188, 0, 1365445906, 'enrol_database', 'dbuser', '', NULL),
(189, 0, 1365445906, 'enrol_database', 'dbpass', '', NULL),
(190, 0, 1365445906, 'enrol_database', 'dbname', '', NULL),
(191, 0, 1365445906, 'enrol_database', 'dbencoding', 'utf-8', NULL),
(192, 0, 1365445906, 'enrol_database', 'dbsetupsql', '', NULL),
(193, 0, 1365445906, 'enrol_database', 'dbsybasequoting', '0', NULL),
(194, 0, 1365445906, 'enrol_database', 'debugdb', '0', NULL),
(195, 0, 1365445906, 'enrol_database', 'localcoursefield', 'idnumber', NULL),
(196, 0, 1365445906, 'enrol_database', 'localuserfield', 'idnumber', NULL),
(197, 0, 1365445906, 'enrol_database', 'localrolefield', 'shortname', NULL),
(198, 0, 1365445906, 'enrol_database', 'localcategoryfield', 'id', NULL),
(199, 0, 1365445906, 'enrol_database', 'remoteenroltable', '', NULL),
(200, 0, 1365445906, 'enrol_database', 'remotecoursefield', '', NULL),
(201, 0, 1365445906, 'enrol_database', 'remoteuserfield', '', NULL),
(202, 0, 1365445906, 'enrol_database', 'remoterolefield', '', NULL),
(203, 0, 1365445906, 'enrol_database', 'ignorehiddencourses', '0', NULL),
(204, 0, 1365445906, 'enrol_database', 'unenrolaction', '0', NULL),
(205, 0, 1365445906, 'enrol_database', 'newcoursetable', '', NULL),
(206, 0, 1365445906, 'enrol_database', 'newcoursefullname', 'fullname', NULL),
(207, 0, 1365445906, 'enrol_database', 'newcourseshortname', 'shortname', NULL),
(208, 0, 1365445906, 'enrol_database', 'newcourseidnumber', 'idnumber', NULL),
(209, 0, 1365445906, 'enrol_database', 'newcoursecategory', '', NULL),
(210, 0, 1365445906, 'enrol_database', 'templatecourse', '', NULL),
(211, 0, 1365445906, 'enrol_flatfile', 'location', '', NULL),
(212, 0, 1365445906, 'enrol_flatfile', 'mailstudents', '0', NULL),
(213, 0, 1365445906, 'enrol_flatfile', 'mailteachers', '0', NULL),
(214, 0, 1365445906, 'enrol_flatfile', 'mailadmins', '0', NULL),
(215, 0, 1365445906, 'enrol_guest', 'requirepassword', '0', NULL),
(216, 0, 1365445906, 'enrol_guest', 'usepasswordpolicy', '0', NULL),
(217, 0, 1365445906, 'enrol_guest', 'showhint', '0', NULL),
(218, 0, 1365445906, 'enrol_guest', 'defaultenrol', '1', NULL),
(219, 0, 1365445906, 'enrol_guest', 'status', '1', NULL),
(220, 0, 1365445906, 'enrol_guest', 'status_adv', '0', NULL),
(221, 0, 1365445906, 'enrol_imsenterprise', 'imsfilelocation', '', NULL),
(222, 0, 1365445906, 'enrol_imsenterprise', 'logtolocation', '', NULL),
(223, 0, 1365445906, 'enrol_imsenterprise', 'mailadmins', '0', NULL),
(224, 0, 1365445906, 'enrol_imsenterprise', 'createnewusers', '0', NULL),
(225, 0, 1365445906, 'enrol_imsenterprise', 'imsdeleteusers', '0', NULL),
(226, 0, 1365445906, 'enrol_imsenterprise', 'fixcaseusernames', '0', NULL),
(227, 0, 1365445906, 'enrol_imsenterprise', 'fixcasepersonalnames', '0', NULL),
(228, 0, 1365445906, 'enrol_imsenterprise', 'imssourcedidfallback', '0', NULL),
(229, 0, 1365445906, 'enrol_imsenterprise', 'truncatecoursecodes', '0', NULL),
(230, 0, 1365445906, 'enrol_imsenterprise', 'createnewcourses', '0', NULL),
(231, 0, 1365445906, 'enrol_imsenterprise', 'createnewcategories', '0', NULL),
(232, 0, 1365445906, 'enrol_imsenterprise', 'imsunenrol', '0', NULL),
(233, 0, 1365445906, 'enrol_imsenterprise', 'imsrestricttarget', '', NULL),
(234, 0, 1365445906, 'enrol_imsenterprise', 'imscapitafix', '0', NULL),
(235, 0, 1365445906, 'enrol_manual', 'expiredaction', '1', NULL),
(236, 0, 1365445906, 'enrol_manual', 'expirynotifyhour', '6', NULL),
(237, 0, 1365445906, 'enrol_manual', 'defaultenrol', '1', NULL),
(238, 0, 1365445906, 'enrol_manual', 'status', '0', NULL),
(239, 0, 1365445906, 'enrol_manual', 'enrolperiod', '0', NULL),
(240, 0, 1365445906, 'enrol_manual', 'expirynotify', '0', NULL),
(241, 0, 1365445906, 'enrol_manual', 'expirythreshold', '86400', NULL),
(242, 0, 1365445906, 'enrol_paypal', 'paypalbusiness', '', NULL),
(243, 0, 1365445906, 'enrol_paypal', 'mailstudents', '0', NULL),
(244, 0, 1365445906, 'enrol_paypal', 'mailteachers', '0', NULL),
(245, 0, 1365445906, 'enrol_paypal', 'mailadmins', '0', NULL),
(246, 0, 1365445906, 'enrol_paypal', 'status', '1', NULL),
(247, 0, 1365445906, 'enrol_paypal', 'cost', '0', NULL),
(248, 0, 1365445906, 'enrol_paypal', 'currency', 'USD', NULL),
(249, 0, 1365445906, 'enrol_paypal', 'enrolperiod', '0', NULL),
(250, 0, 1365445906, 'enrol_self', 'requirepassword', '0', NULL),
(251, 0, 1365445906, 'enrol_self', 'usepasswordpolicy', '0', NULL),
(252, 0, 1365445906, 'enrol_self', 'showhint', '0', NULL),
(253, 0, 1365445906, 'enrol_self', 'expiredaction', '1', NULL),
(254, 0, 1365445906, 'enrol_self', 'expirynotifyhour', '6', NULL),
(255, 0, 1365445906, 'enrol_self', 'defaultenrol', '1', NULL),
(256, 0, 1365445906, 'enrol_self', 'status', '1', NULL),
(257, 0, 1365445906, 'enrol_self', 'groupkey', '0', NULL),
(258, 0, 1365445906, 'enrol_self', 'enrolperiod', '0', NULL),
(259, 0, 1365445906, 'enrol_self', 'expirynotify', '0', NULL),
(260, 0, 1365445906, 'enrol_self', 'expirythreshold', '86400', NULL),
(261, 0, 1365445906, 'enrol_self', 'longtimenosee', '0', NULL),
(262, 0, 1365445906, 'enrol_self', 'maxenrolled', '0', NULL),
(263, 0, 1365445906, 'enrol_self', 'sendcoursewelcomemessage', '1', NULL),
(264, 0, 1365445906, 'editor_tinymce', 'customtoolbar', 'fontselect,fontsizeselect,formatselect,|,undo,redo,|,search,replace,|,fullscreen\n\nbold,italic,underline,strikethrough,sub,sup,|,justifyleft,justifycenter,justifyright,|,cleanup,removeformat,pastetext,pasteword,|,forecolor,backcolor,|,ltr,rtl\n\nbullist,numlist,outdent,indent,|,link,unlink,|,image,nonbreaking,charmap,table,|,code', NULL),
(265, 0, 1365445906, 'editor_tinymce', 'fontselectlist', 'Trebuchet=Trebuchet MS,Verdana,Arial,Helvetica,sans-serif;Arial=arial,helvetica,sans-serif;Courier New=courier new,courier,monospace;Georgia=georgia,times new roman,times,serif;Tahoma=tahoma,arial,helvetica,sans-serif;Times New Roman=times new roman,times,serif;Verdana=verdana,arial,helvetica,sans-serif;Impact=impact;Wingdings=wingdings', NULL),
(266, 0, 1365445907, 'editor_tinymce', 'customconfig', '', NULL),
(267, 0, 1365445907, 'tinymce_dragmath', 'requiretex', '1', NULL),
(268, 0, 1365445907, 'tinymce_moodleemoticon', 'requireemoticon', '1', NULL),
(269, 0, 1365445907, 'tinymce_spellchecker', 'spellengine', 'GoogleSpell', NULL),
(270, 0, 1365445907, 'tinymce_spellchecker', 'spelllanguagelist', '+English=en,Danish=da,Dutch=nl,Finnish=fi,French=fr,German=de,Italian=it,Polish=pl,Portuguese=pt,Spanish=es,Swedish=sv', NULL),
(271, 0, 1365445907, NULL, 'sitedefaultlicense', 'allrightsreserved', NULL),
(272, 0, 1365445907, NULL, 'cachetext', '60', NULL),
(273, 0, 1365445907, NULL, 'filteruploadedfiles', '0', NULL),
(274, 0, 1365445907, NULL, 'filtermatchoneperpage', '0', NULL),
(275, 0, 1365445907, NULL, 'filtermatchonepertext', '0', NULL),
(276, 0, 1365445907, NULL, 'portfolio_moderate_filesize_threshold', '1048576', NULL),
(277, 0, 1365445907, NULL, 'portfolio_high_filesize_threshold', '5242880', NULL),
(278, 0, 1365445907, NULL, 'portfolio_moderate_db_threshold', '20', NULL),
(279, 0, 1365445907, NULL, 'portfolio_high_db_threshold', '50', NULL),
(280, 0, 1365445907, NULL, 'repositorycacheexpire', '120', NULL),
(281, 0, 1365445907, NULL, 'repositoryallowexternallinks', '1', NULL),
(282, 0, 1365445907, NULL, 'legacyfilesinnewcourses', '0', NULL),
(283, 0, 1365445907, NULL, 'mobilecssurl', '', NULL),
(284, 0, 1365445907, NULL, 'enablewsdocumentation', '0', NULL),
(285, 0, 1365445907, 'cachestore_memcache', 'testservers', '', NULL),
(286, 0, 1365445907, 'cachestore_memcached', 'testservers', '', NULL),
(287, 0, 1365445907, 'cachestore_mongodb', 'testserver', '', NULL),
(288, 0, 1365445907, NULL, 'allowbeforeblock', '0', NULL),
(289, 0, 1365445907, NULL, 'allowedip', '', NULL),
(290, 0, 1365445907, NULL, 'blockedip', '', NULL),
(291, 0, 1365445907, NULL, 'protectusernames', '1', NULL),
(292, 0, 1365445907, NULL, 'forcelogin', '0', NULL),
(293, 0, 1365445907, NULL, 'forceloginforprofiles', '1', NULL),
(294, 0, 1365445907, NULL, 'forceloginforprofileimage', '0', NULL),
(295, 0, 1365445907, NULL, 'opentogoogle', '0', NULL),
(296, 0, 1365445907, NULL, 'maxbytes', '0', NULL),
(297, 0, 1365445907, NULL, 'userquota', '104857600', NULL),
(298, 0, 1365445907, NULL, 'allowobjectembed', '0', NULL),
(299, 0, 1365445907, NULL, 'enabletrusttext', '0', NULL),
(300, 0, 1365445907, NULL, 'maxeditingtime', '1800', NULL),
(301, 0, 1365445907, NULL, 'fullnamedisplay', 'language', NULL),
(302, 0, 1365445907, NULL, 'extendedusernamechars', '0', NULL),
(303, 0, 1365445907, NULL, 'sitepolicy', '', NULL),
(304, 0, 1365445907, NULL, 'sitepolicyguest', '', NULL),
(305, 0, 1365445907, NULL, 'keeptagnamecase', '1', NULL),
(306, 0, 1365445907, NULL, 'profilesforenrolledusersonly', '1', NULL),
(307, 0, 1365445907, NULL, 'cronclionly', '0', NULL),
(308, 0, 1365445907, NULL, 'cronremotepassword', '', NULL),
(309, 0, 1365445907, NULL, 'passwordpolicy', '1', NULL),
(310, 0, 1365445907, NULL, 'minpasswordlength', '8', NULL),
(311, 0, 1365445907, NULL, 'minpassworddigits', '1', NULL),
(312, 0, 1365445907, NULL, 'minpasswordlower', '1', NULL),
(313, 0, 1365445907, NULL, 'minpasswordupper', '1', NULL),
(314, 0, 1365445907, NULL, 'minpasswordnonalphanum', '1', NULL),
(315, 0, 1365445907, NULL, 'maxconsecutiveidentchars', '0', NULL),
(316, 0, 1365445907, NULL, 'groupenrolmentkeypolicy', '1', NULL),
(317, 0, 1365445907, NULL, 'disableuserimages', '0', NULL),
(318, 0, 1365445907, NULL, 'emailchangeconfirmation', '1', NULL),
(319, 0, 1365445907, NULL, 'rememberusername', '2', NULL),
(320, 0, 1365445907, NULL, 'strictformsrequired', '0', NULL),
(321, 0, 1365445907, NULL, 'loginhttps', '0', NULL),
(322, 0, 1365445907, NULL, 'cookiesecure', '0', NULL),
(323, 0, 1365445907, NULL, 'cookiehttponly', '0', NULL),
(324, 0, 1365445907, NULL, 'allowframembedding', '0', NULL),
(325, 0, 1365445907, NULL, 'loginpasswordautocomplete', '0', NULL),
(326, 0, 1365445907, NULL, 'displayloginfailures', '', NULL),
(327, 0, 1365445907, NULL, 'notifyloginfailures', '', NULL),
(328, 0, 1365445907, NULL, 'notifyloginthreshold', '10', NULL),
(329, 0, 1365445907, NULL, 'runclamonupload', '0', NULL),
(330, 0, 1365445907, NULL, 'pathtoclam', '', NULL),
(331, 0, 1365445907, NULL, 'quarantinedir', '', NULL),
(332, 0, 1365445907, NULL, 'clamfailureonupload', 'donothing', NULL),
(333, 0, 1365445907, NULL, 'themelist', '', NULL),
(334, 0, 1365445907, NULL, 'themedesignermode', '0', NULL),
(335, 0, 1365445907, NULL, 'allowuserthemes', '0', NULL),
(336, 0, 1365445907, NULL, 'allowcoursethemes', '0', NULL),
(337, 0, 1365445907, NULL, 'allowcategorythemes', '0', NULL),
(338, 0, 1365445907, NULL, 'allowthemechangeonurl', '0', NULL),
(339, 0, 1365445907, NULL, 'allowuserblockhiding', '1', NULL),
(340, 0, 1365445907, NULL, 'allowblockstodock', '1', NULL),
(341, 0, 1365445907, NULL, 'custommenuitems', '', NULL),
(342, 0, 1365445907, NULL, 'enabledevicedetection', '1', NULL),
(343, 0, 1365445907, NULL, 'devicedetectregex', '[]', NULL),
(344, 0, 1365445907, 'theme_afterburner', 'logo', '', NULL),
(345, 0, 1365445907, 'theme_afterburner', 'footnote', '', NULL),
(346, 0, 1365445907, 'theme_afterburner', 'customcss', '', NULL),
(347, 0, 1365445907, 'theme_arialist', 'logo', '', NULL),
(348, 0, 1365445907, 'theme_arialist', 'tagline', '', NULL),
(349, 0, 1365445907, 'theme_arialist', 'linkcolor', '#f25f0f', NULL),
(350, 0, 1365445907, 'theme_arialist', 'regionwidth', '250', NULL),
(351, 0, 1365445907, 'theme_arialist', 'customcss', '', NULL),
(352, 0, 1365445907, 'theme_brick', 'logo', '', NULL),
(353, 0, 1365445907, 'theme_brick', 'linkcolor', '#06365b', NULL),
(354, 0, 1365445907, 'theme_brick', 'linkhover', '#5487ad', NULL),
(355, 0, 1365445907, 'theme_brick', 'maincolor', '#8e2800', NULL),
(356, 0, 1365445907, 'theme_brick', 'maincolorlink', '#fff0a5', NULL),
(357, 0, 1365445907, 'theme_brick', 'headingcolor', '#5c3500', NULL),
(358, 0, 1365445907, 'theme_formal_white', 'fontsizereference', '13', NULL),
(359, 0, 1365445907, 'theme_formal_white', 'noframe', '0', NULL),
(360, 0, 1365445907, 'theme_formal_white', 'framemargin', '15', NULL),
(361, 0, 1365445907, 'theme_formal_white', 'headercontent', '1', NULL),
(362, 0, 1365445907, 'theme_formal_white', 'customlogourl', '', NULL),
(363, 0, 1365445907, 'theme_formal_white', 'frontpagelogourl', '', NULL),
(364, 0, 1365445907, 'theme_formal_white', 'headerbgc', '#E3DFD4', NULL),
(365, 0, 1365445907, 'theme_formal_white', 'creditstomoodleorg', '2', NULL),
(366, 0, 1365445907, 'theme_formal_white', 'blockcolumnwidth', '200', NULL),
(367, 0, 1365445907, 'theme_formal_white', 'blockpadding', '8', NULL),
(368, 0, 1365445907, 'theme_formal_white', 'blockcontentbgc', '#F6F6F6', NULL),
(369, 0, 1365445907, 'theme_formal_white', 'lblockcolumnbgc', '#E3DFD4', NULL),
(370, 0, 1365445907, 'theme_formal_white', 'rblockcolumnbgc', '', NULL),
(371, 0, 1365445907, 'theme_formal_white', 'footnote', '', NULL),
(372, 0, 1365445907, 'theme_formal_white', 'customcss', '', NULL),
(373, 0, 1365445907, 'theme_fusion', 'linkcolor', '#2d83d5', NULL),
(374, 0, 1365445907, 'theme_fusion', 'tagline', '', NULL),
(375, 0, 1365445907, 'theme_fusion', 'footertext', '', NULL),
(376, 0, 1365445907, 'theme_fusion', 'customcss', '', NULL),
(377, 0, 1365445907, 'theme_magazine', 'background', '', NULL),
(378, 0, 1365445907, 'theme_magazine', 'logo', '', NULL),
(379, 0, 1365445907, 'theme_magazine', 'linkcolor', '#32529a', NULL),
(380, 0, 1365445907, 'theme_magazine', 'linkhover', '#4e2300', NULL),
(381, 0, 1365445907, 'theme_magazine', 'maincolor', '#002f2f', NULL),
(382, 0, 1365445907, 'theme_magazine', 'maincoloraccent', '#092323', NULL),
(383, 0, 1365445907, 'theme_magazine', 'headingcolor', '#4e0000', NULL),
(384, 0, 1365445907, 'theme_magazine', 'blockcolor', '#002f2f', NULL),
(385, 0, 1365445907, 'theme_magazine', 'forumback', '#e6e2af', NULL),
(386, 0, 1365445907, 'theme_mymobile', 'colourswatch', 'light', NULL),
(387, 0, 1365445907, 'theme_mymobile', 'showmobileintro', '', NULL),
(388, 0, 1365445907, 'theme_mymobile', 'showsitetopic', 'topicshow', NULL),
(389, 0, 1365445907, 'theme_mymobile', 'showfullsizeimages', 'ithumb', NULL),
(390, 0, 1365445907, 'theme_mymobile', 'usetableview', 'tabshow', NULL),
(391, 0, 1365445907, 'theme_mymobile', 'customcss', '', NULL),
(392, 0, 1365445907, 'theme_nimble', 'tagline', '', NULL),
(393, 0, 1365445907, 'theme_nimble', 'footerline', '', NULL),
(394, 0, 1365445907, 'theme_nimble', 'backgroundcolor', '#454545', NULL),
(395, 0, 1365445907, 'theme_nimble', 'linkcolor', '#2a65b1', NULL),
(396, 0, 1365445907, 'theme_nimble', 'linkhover', '#222222', NULL),
(397, 0, 1365445907, 'theme_nonzero', 'regionprewidth', '200', NULL),
(398, 0, 1365445907, 'theme_nonzero', 'regionpostwidth', '200', NULL),
(399, 0, 1365445907, 'theme_nonzero', 'customcss', '', NULL),
(400, 0, 1365445907, 'theme_overlay', 'linkcolor', '#428ab5', NULL),
(401, 0, 1365445907, 'theme_overlay', 'headercolor', '#2a4c7b', NULL),
(402, 0, 1365445907, 'theme_overlay', 'footertext', '', NULL),
(403, 0, 1365445907, 'theme_overlay', 'customcss', '', NULL),
(404, 0, 1365445907, 'theme_sky_high', 'logo', '', NULL),
(405, 0, 1365445908, 'theme_sky_high', 'regionwidth', '240', NULL),
(406, 0, 1365445908, 'theme_sky_high', 'footnote', '', NULL),
(407, 0, 1365445908, 'theme_sky_high', 'customcss', '', NULL),
(408, 0, 1365445908, 'theme_splash', 'logo', '', NULL),
(409, 0, 1365445908, 'theme_splash', 'tagline', 'Virtual learning center', NULL),
(410, 0, 1365445908, 'theme_splash', 'hide_tagline', '0', NULL),
(411, 0, 1365445908, 'theme_splash', 'footnote', '', NULL),
(412, 0, 1365445908, 'theme_splash', 'customcss', '', NULL),
(413, 0, 1365445908, NULL, 'calendar_adminseesall', '0', NULL),
(414, 0, 1365445908, NULL, 'calendar_site_timeformat', '0', NULL),
(415, 0, 1365445908, NULL, 'calendar_startwday', '0', NULL),
(416, 0, 1365445908, NULL, 'calendar_weekend', '65', NULL),
(417, 0, 1365445908, NULL, 'calendar_lookahead', '21', NULL),
(418, 0, 1365445908, NULL, 'calendar_maxevents', '10', NULL),
(419, 0, 1365445908, NULL, 'enablecalendarexport', '1', NULL),
(420, 0, 1365445908, NULL, 'calendar_exportsalt', 'TocwqctWwZmpnlHjdubhvEoYI1nKN3qwl8GcawhQvNrJL20ZdK9LD1nJ3n68', NULL),
(421, 0, 1365445908, NULL, 'useblogassociations', '1', NULL),
(422, 0, 1365445908, NULL, 'bloglevel', '4', NULL),
(423, 0, 1365445908, NULL, 'useexternalblogs', '1', NULL),
(424, 0, 1365445908, NULL, 'externalblogcrontime', '86400', NULL),
(425, 0, 1365445908, NULL, 'maxexternalblogsperuser', '1', NULL),
(426, 0, 1365445908, NULL, 'blogusecomments', '1', NULL),
(427, 0, 1365445908, NULL, 'blogshowcommentscount', '1', NULL),
(428, 0, 1365445908, NULL, 'defaulthomepage', '0', NULL),
(429, 0, 1365445908, NULL, 'allowguestmymoodle', '1', NULL),
(430, 0, 1365445908, NULL, 'navshowcategories', '1', NULL),
(431, 0, 1365445908, NULL, 'navshowmycoursecategories', '0', NULL),
(432, 0, 1365445908, NULL, 'navshowallcourses', '0', NULL),
(433, 0, 1365445908, NULL, 'navsortmycoursessort', 'sortorder', NULL),
(434, 0, 1365445908, NULL, 'navcourselimit', '20', NULL),
(435, 0, 1365445908, NULL, 'usesitenameforsitepages', '0', NULL),
(436, 0, 1365445908, NULL, 'linkadmincategories', '0', NULL),
(437, 0, 1365445908, NULL, 'navshowfrontpagemods', '1', NULL),
(438, 0, 1365445908, NULL, 'navadduserpostslinks', '1', NULL),
(439, 0, 1365445908, NULL, 'formatstringstriptags', '1', NULL),
(440, 0, 1365445908, NULL, 'emoticons', '[{"text":":-)","imagename":"s\\/smiley","imagecomponent":"core","altidentifier":"smiley","altcomponent":"core_pix"},{"text":":)","imagename":"s\\/smiley","imagecomponent":"core","altidentifier":"smiley","altcomponent":"core_pix"},{"text":":-D","imagename":"s\\/biggrin","imagecomponent":"core","altidentifier":"biggrin","altcomponent":"core_pix"},{"text":";-)","imagename":"s\\/wink","imagecomponent":"core","altidentifier":"wink","altcomponent":"core_pix"},{"text":":-\\/","imagename":"s\\/mixed","imagecomponent":"core","altidentifier":"mixed","altcomponent":"core_pix"},{"text":"V-.","imagename":"s\\/thoughtful","imagecomponent":"core","altidentifier":"thoughtful","altcomponent":"core_pix"},{"text":":-P","imagename":"s\\/tongueout","imagecomponent":"core","altidentifier":"tongueout","altcomponent":"core_pix"},{"text":":-p","imagename":"s\\/tongueout","imagecomponent":"core","altidentifier":"tongueout","altcomponent":"core_pix"},{"text":"B-)","imagename":"s\\/cool","imagecomponent":"core","altidentifier":"cool","altcomponent":"core_pix"},{"text":"^-)","imagename":"s\\/approve","imagecomponent":"core","altidentifier":"approve","altcomponent":"core_pix"},{"text":"8-)","imagename":"s\\/wideeyes","imagecomponent":"core","altidentifier":"wideeyes","altcomponent":"core_pix"},{"text":":o)","imagename":"s\\/clown","imagecomponent":"core","altidentifier":"clown","altcomponent":"core_pix"},{"text":":-(","imagename":"s\\/sad","imagecomponent":"core","altidentifier":"sad","altcomponent":"core_pix"},{"text":":(","imagename":"s\\/sad","imagecomponent":"core","altidentifier":"sad","altcomponent":"core_pix"},{"text":"8-.","imagename":"s\\/shy","imagecomponent":"core","altidentifier":"shy","altcomponent":"core_pix"},{"text":":-I","imagename":"s\\/blush","imagecomponent":"core","altidentifier":"blush","altcomponent":"core_pix"},{"text":":-X","imagename":"s\\/kiss","imagecomponent":"core","altidentifier":"kiss","altcomponent":"core_pix"},{"text":"8-o","imagename":"s\\/surprise","imagecomponent":"core","altidentifier":"surprise","altcomponent":"core_pix"},{"text":"P-|","imagename":"s\\/blackeye","imagecomponent":"core","altidentifier":"blackeye","altcomponent":"core_pix"},{"text":"8-[","imagename":"s\\/angry","imagecomponent":"core","altidentifier":"angry","altcomponent":"core_pix"},{"text":"(grr)","imagename":"s\\/angry","imagecomponent":"core","altidentifier":"angry","altcomponent":"core_pix"},{"text":"xx-P","imagename":"s\\/dead","imagecomponent":"core","altidentifier":"dead","altcomponent":"core_pix"},{"text":"|-.","imagename":"s\\/sleepy","imagecomponent":"core","altidentifier":"sleepy","altcomponent":"core_pix"},{"text":"}-]","imagename":"s\\/evil","imagecomponent":"core","altidentifier":"evil","altcomponent":"core_pix"},{"text":"(h)","imagename":"s\\/heart","imagecomponent":"core","altidentifier":"heart","altcomponent":"core_pix"},{"text":"(heart)","imagename":"s\\/heart","imagecomponent":"core","altidentifier":"heart","altcomponent":"core_pix"},{"text":"(y)","imagename":"s\\/yes","imagecomponent":"core","altidentifier":"yes","altcomponent":"core"},{"text":"(n)","imagename":"s\\/no","imagecomponent":"core","altidentifier":"no","altcomponent":"core"},{"text":"(martin)","imagename":"s\\/martin","imagecomponent":"core","altidentifier":"martin","altcomponent":"core_pix"},{"text":"( )","imagename":"s\\/egg","imagecomponent":"core","altidentifier":"egg","altcomponent":"core_pix"}]', NULL),
(441, 0, 1365445908, NULL, 'core_media_enable_youtube', '1', NULL),
(442, 0, 1365445908, NULL, 'core_media_enable_vimeo', '0', NULL),
(443, 0, 1365445908, NULL, 'core_media_enable_mp3', '1', NULL),
(444, 0, 1365445908, NULL, 'core_media_enable_flv', '1', NULL),
(445, 0, 1365445908, NULL, 'core_media_enable_swf', '1', NULL),
(446, 0, 1365445908, NULL, 'core_media_enable_html5audio', '1', NULL),
(447, 0, 1365445908, NULL, 'core_media_enable_html5video', '1', NULL),
(448, 0, 1365445908, NULL, 'core_media_enable_qt', '1', NULL),
(449, 0, 1365445908, NULL, 'core_media_enable_wmp', '1', NULL),
(450, 0, 1365445908, NULL, 'core_media_enable_rm', '1', NULL),
(451, 0, 1365445908, NULL, 'docroot', 'http://docs.moodle.org', NULL),
(452, 0, 1365445908, NULL, 'doctonewwindow', '0', NULL),
(453, 0, 1365445908, NULL, 'courselistshortnames', '0', NULL),
(454, 0, 1365445908, NULL, 'coursesperpage', '20', NULL),
(455, 0, 1365445908, NULL, 'courseswithsummarieslimit', '10', NULL),
(456, 0, 1365445908, NULL, 'enableajax', '1', NULL),
(457, 0, 1365445908, NULL, 'useexternalyui', '0', NULL),
(458, 0, 1365445908, NULL, 'yuicomboloading', '1', NULL),
(459, 0, 1365445908, NULL, 'cachejs', '1', NULL),
(460, 0, 1365445908, NULL, 'modchooserdefault', '1', NULL),
(461, 0, 1365445908, NULL, 'additionalhtmlhead', '', NULL),
(462, 0, 1365445908, NULL, 'additionalhtmltopofbody', '', NULL),
(463, 0, 1365445908, NULL, 'additionalhtmlfooter', '', NULL),
(464, 0, 1365445908, NULL, 'gdversion', '2', NULL),
(465, 0, 1365445908, NULL, 'pathtodu', '', NULL),
(466, 0, 1365445908, NULL, 'aspellpath', '', NULL),
(467, 0, 1365445908, NULL, 'pathtodot', '', NULL),
(468, 0, 1365445908, NULL, 'supportpage', '', NULL),
(469, 0, 1365445908, NULL, 'dbsessions', '1', NULL),
(470, 0, 1365445908, NULL, 'sessioncookie', '', NULL),
(471, 0, 1365445908, NULL, 'sessioncookiepath', '', NULL),
(472, 0, 1365445908, NULL, 'sessioncookiedomain', '', NULL),
(473, 0, 1365445908, NULL, 'statsfirstrun', 'none', NULL),
(474, 0, 1365445908, NULL, 'statsmaxruntime', '0', NULL),
(475, 0, 1365445908, NULL, 'statsruntimedays', '31', NULL),
(476, 0, 1365445908, NULL, 'statsruntimestarthour', '0', NULL),
(477, 0, 1365445908, NULL, 'statsruntimestartminute', '0', NULL),
(478, 0, 1365445908, NULL, 'statsuserthreshold', '0', NULL),
(479, 0, 1365445908, NULL, 'slasharguments', '1', NULL),
(480, 0, 1365445908, NULL, 'getremoteaddrconf', '0', NULL),
(481, 0, 1365445908, NULL, 'proxyhost', '', NULL),
(482, 0, 1365445908, NULL, 'proxyport', '0', NULL),
(483, 0, 1365445908, NULL, 'proxytype', 'HTTP', NULL),
(484, 0, 1365445908, NULL, 'proxyuser', '', NULL),
(485, 0, 1365445908, NULL, 'proxypassword', '', NULL),
(486, 0, 1365445908, NULL, 'proxybypass', 'localhost, 127.0.0.1', NULL),
(487, 0, 1365445908, NULL, 'maintenance_enabled', '0', NULL),
(488, 0, 1365445908, NULL, 'maintenance_message', '', NULL),
(489, 0, 1365445908, NULL, 'deleteunconfirmed', '168', NULL),
(490, 0, 1365445908, NULL, 'deleteincompleteusers', '0', NULL),
(491, 0, 1365445908, NULL, 'logguests', '1', NULL),
(492, 0, 1365445908, NULL, 'loglifetime', '0', NULL),
(493, 0, 1365445908, NULL, 'disablegradehistory', '0', NULL),
(494, 0, 1365445908, NULL, 'gradehistorylifetime', '0', NULL),
(495, 0, 1365445908, NULL, 'numcoursesincombo', '500', NULL),
(496, 0, 1365445908, NULL, 'extramemorylimit', '512M', NULL),
(497, 0, 1365445908, NULL, 'curlcache', '120', NULL),
(498, 0, 1365445908, NULL, 'curltimeoutkbitrate', '56', NULL),
(499, 0, 1365445908, NULL, 'updateautocheck', '1', NULL),
(500, 0, 1365445908, NULL, 'updateautodeploy', '0', NULL),
(501, 0, 1365445908, NULL, 'updateminmaturity', '200', NULL),
(502, 0, 1365445908, NULL, 'updatenotifybuilds', '0', NULL),
(503, 0, 1365445908, NULL, 'enablesafebrowserintegration', '0', NULL),
(504, 0, 1365445908, NULL, 'enablegroupmembersonly', '0', NULL),
(505, 0, 1365445908, NULL, 'dndallowtextandlinks', '0', NULL),
(506, 0, 1365445908, NULL, 'enablecssoptimiser', '0', NULL),
(507, 0, 1365445908, NULL, 'debug', '0', NULL),
(508, 0, 1365445908, NULL, 'debugdisplay', '1', NULL),
(509, 0, 1365445908, NULL, 'debugsmtp', '0', NULL),
(510, 0, 1365445908, NULL, 'perfdebug', '7', NULL),
(511, 0, 1365445908, NULL, 'debugstringids', '0', NULL),
(512, 0, 1365445908, NULL, 'debugvalidators', '0', NULL),
(513, 0, 1365445908, NULL, 'debugpageinfo', '0', NULL),
(514, 2, 1365449949, NULL, 'notloggedinroleid', '6', NULL),
(515, 2, 1365449949, NULL, 'guestroleid', '6', NULL),
(516, 2, 1365449949, NULL, 'defaultuserroleid', '7', NULL),
(517, 2, 1365449949, NULL, 'creatornewroleid', '3', NULL),
(518, 2, 1365449949, NULL, 'restorernewroleid', '3', NULL),
(519, 2, 1365449949, NULL, 'gradebookroles', '5', NULL),
(520, 2, 1365449949, 'assign', 'feedback_plugin_for_gradebook', 'assignfeedback_comments', NULL),
(521, 2, 1365449949, 'assign', 'showrecentsubmissions', '0', NULL),
(522, 2, 1365449949, 'assign', 'submissionreceipts', '1', NULL),
(523, 2, 1365449949, 'assign', 'submissionstatement', 'This assignment is my own work, except where I have acknowledged the use of the works of other people.', NULL),
(524, 2, 1365449949, 'assign', 'requiresubmissionstatement', '0', NULL),
(525, 2, 1365449949, NULL, 'assignment_maxbytes', '1048576', NULL),
(526, 2, 1365449949, NULL, 'assignment_itemstocount', '1', NULL),
(527, 2, 1365449949, NULL, 'assignment_showrecentsubmissions', '1', NULL),
(528, 2, 1365449949, 'book', 'requiremodintro', '1', NULL),
(529, 2, 1365449949, 'book', 'numberingoptions', '0,1,2,3', NULL),
(530, 2, 1365449949, 'book', 'numbering', '1', NULL),
(531, 2, 1365449949, NULL, 'chat_method', 'ajax', NULL),
(532, 2, 1365449949, NULL, 'chat_refresh_userlist', '10', NULL),
(533, 2, 1365449949, NULL, 'chat_old_ping', '35', NULL),
(534, 2, 1365449949, NULL, 'chat_refresh_room', '5', NULL),
(535, 2, 1365449949, NULL, 'chat_normal_updatemode', 'jsupdate', NULL),
(536, 2, 1365449950, NULL, 'chat_serverhost', 'localhost', NULL),
(537, 2, 1365449950, NULL, 'chat_serverip', '127.0.0.1', NULL),
(538, 2, 1365449950, NULL, 'chat_serverport', '9111', NULL),
(539, 2, 1365449950, NULL, 'chat_servermax', '100', NULL),
(540, 2, 1365449950, NULL, 'data_enablerssfeeds', '0', NULL),
(541, 2, 1365449950, NULL, 'feedback_allowfullanonymous', '0', NULL),
(542, 2, 1365449950, 'folder', 'requiremodintro', '1', NULL),
(543, 2, 1365449950, NULL, 'forum_displaymode', '3', NULL),
(544, 2, 1365449950, NULL, 'forum_replytouser', '1', NULL),
(545, 2, 1365449950, NULL, 'forum_shortpost', '300', NULL),
(546, 2, 1365449950, NULL, 'forum_longpost', '600', NULL),
(547, 2, 1365449950, NULL, 'forum_manydiscussions', '100', NULL),
(548, 2, 1365449950, NULL, 'forum_maxbytes', '512000', NULL),
(549, 2, 1365449950, NULL, 'forum_maxattachments', '9', NULL),
(550, 2, 1365449950, NULL, 'forum_trackreadposts', '1', NULL),
(551, 2, 1365449950, NULL, 'forum_oldpostdays', '14', NULL),
(552, 2, 1365449950, NULL, 'forum_usermarksread', '0', NULL),
(553, 2, 1365449950, NULL, 'forum_cleanreadtime', '2', NULL),
(554, 2, 1365449950, NULL, 'digestmailtime', '17', NULL),
(555, 2, 1365449950, NULL, 'forum_enablerssfeeds', '0', NULL),
(556, 2, 1365449950, NULL, 'forum_enabletimedposts', '0', NULL),
(557, 2, 1365449950, NULL, 'glossary_entbypage', '10', NULL),
(558, 2, 1365449950, NULL, 'glossary_dupentries', '0', NULL),
(559, 2, 1365449950, NULL, 'glossary_allowcomments', '0', NULL),
(560, 2, 1365449950, NULL, 'glossary_linkbydefault', '1', NULL),
(561, 2, 1365449950, NULL, 'glossary_defaultapproval', '1', NULL),
(562, 2, 1365449950, NULL, 'glossary_enablerssfeeds', '0', NULL),
(563, 2, 1365449950, NULL, 'glossary_linkentries', '0', NULL),
(564, 2, 1365449950, NULL, 'glossary_casesensitive', '0', NULL),
(565, 2, 1365449950, NULL, 'glossary_fullmatch', '0', NULL),
(566, 2, 1365449950, 'imscp', 'requiremodintro', '1', NULL),
(567, 2, 1365449950, 'imscp', 'keepold', '1', NULL),
(568, 2, 1365449950, 'imscp', 'keepold_adv', '0', NULL),
(569, 2, 1365449950, NULL, 'lesson_slideshowwidth', '640', NULL),
(570, 2, 1365449950, NULL, 'lesson_slideshowheight', '480', NULL),
(571, 2, 1365449950, NULL, 'lesson_slideshowbgcolor', '#FFFFFF', NULL),
(572, 2, 1365449950, NULL, 'lesson_mediawidth', '640', NULL),
(573, 2, 1365449950, NULL, 'lesson_mediaheight', '480', NULL),
(574, 2, 1365449950, NULL, 'lesson_mediaclose', '0', NULL),
(575, 2, 1365449950, NULL, 'lesson_maxhighscores', '10', NULL),
(576, 2, 1365449950, NULL, 'lesson_maxanswers', '4', NULL),
(577, 2, 1365449950, NULL, 'lesson_defaultnextpage', '0', NULL),
(578, 2, 1365449950, 'page', 'requiremodintro', '1', NULL),
(579, 2, 1365449950, 'page', 'displayoptions', '5', NULL),
(580, 2, 1365449950, 'page', 'printheading', '1', NULL),
(581, 2, 1365449950, 'page', 'printheading_adv', '0', NULL),
(582, 2, 1365449950, 'page', 'printintro', '0', NULL),
(583, 2, 1365449950, 'page', 'printintro_adv', '0', NULL),
(584, 2, 1365449950, 'page', 'display', '5', NULL),
(585, 2, 1365449950, 'page', 'display_adv', '1', NULL),
(586, 2, 1365449950, 'page', 'popupwidth', '620', NULL),
(587, 2, 1365449950, 'page', 'popupwidth_adv', '1', NULL),
(588, 2, 1365449950, 'page', 'popupheight', '450', NULL),
(589, 2, 1365449950, 'page', 'popupheight_adv', '1', NULL),
(590, 2, 1365449950, 'quiz', 'timelimit', '0', NULL),
(591, 2, 1365449950, 'quiz', 'timelimit_adv', '0', NULL),
(592, 2, 1365449951, 'quiz', 'overduehandling', 'autoabandon', NULL),
(593, 2, 1365449951, 'quiz', 'overduehandling_adv', '0', NULL),
(594, 2, 1365449951, 'quiz', 'graceperiod', '86400', NULL),
(595, 2, 1365449951, 'quiz', 'graceperiod_adv', '0', NULL),
(596, 2, 1365449951, 'quiz', 'graceperiodmin', '60', NULL),
(597, 2, 1365449951, 'quiz', 'attempts', '0', NULL),
(598, 2, 1365449951, 'quiz', 'attempts_adv', '0', NULL),
(599, 2, 1365449951, 'quiz', 'grademethod', '1', NULL),
(600, 2, 1365449951, 'quiz', 'grademethod_adv', '0', NULL),
(601, 2, 1365449951, 'quiz', 'maximumgrade', '10', NULL),
(602, 2, 1365449951, 'quiz', 'shufflequestions', '0', NULL),
(603, 2, 1365449951, 'quiz', 'shufflequestions_adv', '0', NULL),
(604, 2, 1365449951, 'quiz', 'questionsperpage', '1', NULL),
(605, 2, 1365449951, 'quiz', 'questionsperpage_adv', '0', NULL),
(606, 2, 1365449951, 'quiz', 'navmethod', 'free', NULL),
(607, 2, 1365449951, 'quiz', 'navmethod_adv', '1', NULL),
(608, 2, 1365449951, 'quiz', 'shuffleanswers', '1', NULL),
(609, 2, 1365449951, 'quiz', 'shuffleanswers_adv', '0', NULL),
(610, 2, 1365449951, 'quiz', 'preferredbehaviour', 'deferredfeedback', NULL),
(611, 2, 1365449951, 'quiz', 'attemptonlast', '0', NULL),
(612, 2, 1365449951, 'quiz', 'attemptonlast_adv', '1', NULL),
(613, 2, 1365449951, 'quiz', 'reviewattempt', '69904', NULL),
(614, 2, 1365449951, 'quiz', 'reviewcorrectness', '69904', NULL),
(615, 2, 1365449951, 'quiz', 'reviewmarks', '69904', NULL),
(616, 2, 1365449951, 'quiz', 'reviewspecificfeedback', '69904', NULL),
(617, 2, 1365449951, 'quiz', 'reviewgeneralfeedback', '69904', NULL),
(618, 2, 1365449951, 'quiz', 'reviewrightanswer', '69904', NULL),
(619, 2, 1365449951, 'quiz', 'reviewoverallfeedback', '4368', NULL),
(620, 2, 1365449951, 'quiz', 'showuserpicture', '0', NULL),
(621, 2, 1365449951, 'quiz', 'showuserpicture_adv', '0', NULL),
(622, 2, 1365449951, 'quiz', 'decimalpoints', '2', NULL),
(623, 2, 1365449951, 'quiz', 'decimalpoints_adv', '0', NULL),
(624, 2, 1365449951, 'quiz', 'questiondecimalpoints', '-1', NULL),
(625, 2, 1365449951, 'quiz', 'questiondecimalpoints_adv', '1', NULL),
(626, 2, 1365449951, 'quiz', 'showblocks', '0', NULL),
(627, 2, 1365449951, 'quiz', 'showblocks_adv', '1', NULL),
(628, 2, 1365449951, 'quiz', 'password', '', NULL),
(629, 2, 1365449951, 'quiz', 'password_adv', '1', NULL),
(630, 2, 1365449951, 'quiz', 'subnet', '', NULL),
(631, 2, 1365449951, 'quiz', 'subnet_adv', '1', NULL),
(632, 2, 1365449951, 'quiz', 'delay1', '0', NULL),
(633, 2, 1365449951, 'quiz', 'delay1_adv', '1', NULL),
(634, 2, 1365449951, 'quiz', 'delay2', '0', NULL),
(635, 2, 1365449951, 'quiz', 'delay2_adv', '1', NULL),
(636, 2, 1365449951, 'quiz', 'browsersecurity', '-', NULL),
(637, 2, 1365449951, 'quiz', 'browsersecurity_adv', '1', NULL),
(638, 2, 1365449951, 'resource', 'framesize', '130', NULL),
(639, 2, 1365449951, 'resource', 'requiremodintro', '1', NULL),
(640, 2, 1365449951, 'resource', 'displayoptions', '0,1,4,5,6', NULL),
(641, 2, 1365449951, 'resource', 'printheading', '0', NULL),
(642, 2, 1365449951, 'resource', 'printheading_adv', '0', NULL),
(643, 2, 1365449951, 'resource', 'printintro', '1', NULL),
(644, 2, 1365449951, 'resource', 'printintro_adv', '0', NULL),
(645, 2, 1365449951, 'resource', 'display', '0', NULL),
(646, 2, 1365449951, 'resource', 'display_adv', '0', NULL),
(647, 2, 1365449951, 'resource', 'showsize', '0', NULL),
(648, 2, 1365449951, 'resource', 'showsize_adv', '0', NULL),
(649, 2, 1365449951, 'resource', 'showtype', '0', NULL),
(650, 2, 1365449951, 'resource', 'showtype_adv', '0', NULL),
(651, 2, 1365449951, 'resource', 'popupwidth', '620', NULL),
(652, 2, 1365449951, 'resource', 'popupwidth_adv', '1', NULL),
(653, 2, 1365449951, 'resource', 'popupheight', '450', NULL),
(654, 2, 1365449951, 'resource', 'popupheight_adv', '1', NULL),
(655, 2, 1365449951, 'resource', 'filterfiles', '0', NULL),
(656, 2, 1365449951, 'resource', 'filterfiles_adv', '1', NULL),
(657, 2, 1365449952, 'scorm', 'displaycoursestructure', '0', NULL),
(658, 2, 1365449952, 'scorm', 'displaycoursestructure_adv', '0', NULL),
(659, 2, 1365449952, 'scorm', 'popup', '0', NULL),
(660, 2, 1365449952, 'scorm', 'popup_adv', '0', NULL),
(661, 2, 1365449952, 'scorm', 'framewidth', '100', NULL),
(662, 2, 1365449952, 'scorm', 'framewidth_adv', '1', NULL),
(663, 2, 1365449952, 'scorm', 'frameheight', '500', NULL),
(664, 2, 1365449952, 'scorm', 'frameheight_adv', '1', NULL),
(665, 2, 1365449952, 'scorm', 'winoptgrp_adv', '1', NULL),
(666, 2, 1365449952, 'scorm', 'resizable', '0', NULL),
(667, 2, 1365449952, 'scorm', 'scrollbars', '0', NULL),
(668, 2, 1365449952, 'scorm', 'directories', '0', NULL),
(669, 2, 1365449952, 'scorm', 'location', '0', NULL),
(670, 2, 1365449952, 'scorm', 'menubar', '0', NULL),
(671, 2, 1365449952, 'scorm', 'toolbar', '0', NULL),
(672, 2, 1365449952, 'scorm', 'status', '0', NULL),
(673, 2, 1365449952, 'scorm', 'skipview', '0', NULL),
(674, 2, 1365449952, 'scorm', 'skipview_adv', '1', NULL),
(675, 2, 1365449952, 'scorm', 'hidebrowse', '0', NULL),
(676, 2, 1365449952, 'scorm', 'hidebrowse_adv', '1', NULL),
(677, 2, 1365449952, 'scorm', 'hidetoc', '0', NULL),
(678, 2, 1365449952, 'scorm', 'hidetoc_adv', '1', NULL),
(679, 2, 1365449952, 'scorm', 'hidenav', '0', NULL),
(680, 2, 1365449952, 'scorm', 'hidenav_adv', '0', NULL),
(681, 2, 1365449952, 'scorm', 'grademethod', '1', NULL),
(682, 2, 1365449952, 'scorm', 'grademethod_adv', '0', NULL),
(683, 2, 1365449952, 'scorm', 'maxgrade', '100', NULL),
(684, 2, 1365449952, 'scorm', 'maxgrade_adv', '0', NULL),
(685, 2, 1365449952, 'scorm', 'maxattempt', '0', NULL),
(686, 2, 1365449952, 'scorm', 'maxattempt_adv', '0', NULL),
(687, 2, 1365449952, 'scorm', 'whatgrade', '0', NULL),
(688, 2, 1365449952, 'scorm', 'whatgrade_adv', '0', NULL),
(689, 2, 1365449952, 'scorm', 'displayattemptstatus', '1', NULL),
(690, 2, 1365449952, 'scorm', 'displayattemptstatus_adv', '0', NULL),
(691, 2, 1365449952, 'scorm', 'forcecompleted', '0', NULL),
(692, 2, 1365449952, 'scorm', 'forcecompleted_adv', '1', NULL),
(693, 2, 1365449952, 'scorm', 'forcenewattempt', '0', NULL),
(694, 2, 1365449952, 'scorm', 'forcenewattempt_adv', '1', NULL),
(695, 2, 1365449952, 'scorm', 'lastattemptlock', '0', NULL),
(696, 2, 1365449952, 'scorm', 'lastattemptlock_adv', '1', NULL),
(697, 2, 1365449952, 'scorm', 'auto', '0', NULL),
(698, 2, 1365449952, 'scorm', 'auto_adv', '1', NULL),
(699, 2, 1365449952, 'scorm', 'updatefreq', '0', NULL),
(700, 2, 1365449952, 'scorm', 'updatefreq_adv', '1', NULL),
(701, 2, 1365449952, 'scorm', 'allowtypeexternal', '0', NULL),
(702, 2, 1365449952, 'scorm', 'allowtypelocalsync', '0', NULL),
(703, 2, 1365449952, 'scorm', 'allowtypeimsrepository', '0', NULL),
(704, 2, 1365449952, 'scorm', 'allowtypeexternalaicc', '0', NULL),
(705, 2, 1365449952, 'scorm', 'allowaicchacp', '0', NULL),
(706, 2, 1365449952, 'scorm', 'aicchacptimeout', '30', NULL),
(707, 2, 1365449952, 'scorm', 'aicchacpkeepsessiondata', '1', NULL),
(708, 2, 1365449952, 'scorm', 'forcejavascript', '1', NULL),
(709, 2, 1365449952, 'scorm', 'allowapidebug', '0', NULL),
(710, 2, 1365449952, 'scorm', 'apidebugmask', '.*', NULL),
(711, 2, 1365449952, 'url', 'framesize', '130', NULL),
(712, 2, 1365449952, 'url', 'requiremodintro', '1', NULL),
(713, 2, 1365449952, 'url', 'secretphrase', '', NULL),
(714, 2, 1365449952, 'url', 'rolesinparams', '0', NULL),
(715, 2, 1365449952, 'url', 'displayoptions', '0,1,5,6', NULL),
(716, 2, 1365449952, 'url', 'printheading', '0', NULL),
(717, 2, 1365449952, 'url', 'printheading_adv', '0', NULL),
(718, 2, 1365449952, 'url', 'printintro', '1', NULL),
(719, 2, 1365449952, 'url', 'printintro_adv', '0', NULL),
(720, 2, 1365449952, 'url', 'display', '0', NULL),
(721, 2, 1365449952, 'url', 'display_adv', '0', NULL),
(722, 2, 1365449952, 'url', 'popupwidth', '620', NULL),
(723, 2, 1365449952, 'url', 'popupwidth_adv', '1', NULL),
(724, 2, 1365449952, 'url', 'popupheight', '450', NULL),
(725, 2, 1365449952, 'url', 'popupheight_adv', '1', NULL),
(726, 2, 1365449952, 'workshop', 'grade', '80', NULL),
(727, 2, 1365449952, 'workshop', 'gradinggrade', '20', NULL),
(728, 2, 1365449952, 'workshop', 'gradedecimals', '0', NULL),
(729, 2, 1365449952, 'workshop', 'maxbytes', '0', NULL),
(730, 2, 1365449952, 'workshop', 'strategy', 'accumulative', NULL),
(731, 2, 1365449952, 'workshop', 'examplesmode', '0', NULL),
(732, 2, 1365449952, 'workshopallocation_random', 'numofreviews', '5', NULL),
(733, 2, 1365449952, 'workshopform_numerrors', 'grade0', 'No', NULL),
(734, 2, 1365449952, 'workshopform_numerrors', 'grade1', 'Yes', NULL),
(735, 2, 1365449952, 'workshopeval_best', 'comparison', '5', NULL);
INSERT INTO `mdl_config_log` (`id`, `userid`, `timemodified`, `plugin`, `name`, `value`, `oldvalue`) VALUES
(736, 2, 1365449952, 'assignsubmission_file', 'default', '1', NULL),
(737, 2, 1365449952, 'assignsubmission_file', 'maxbytes', '1048576', NULL),
(738, 2, 1365449952, 'assignsubmission_onlinetext', 'default', '0', NULL),
(739, 2, 1365449952, 'assignsubmission_comments', 'default', '0', NULL),
(740, 2, 1365449952, 'assignfeedback_comments', 'default', '1', NULL),
(741, 2, 1365449952, 'assignfeedback_file', 'default', '0', NULL),
(742, 2, 1365449952, 'assignfeedback_offline', 'default', '0', NULL),
(743, 2, 1365449952, NULL, 'smtphosts', '', NULL),
(744, 2, 1365449952, NULL, 'smtpsecure', '', NULL),
(745, 2, 1365449952, NULL, 'smtpuser', '', NULL),
(746, 2, 1365449952, NULL, 'smtppass', '', NULL),
(747, 2, 1365449952, NULL, 'smtpmaxbulk', '1', NULL),
(748, 2, 1365449952, NULL, 'noreplyaddress', 'noreply@localhost', NULL),
(749, 2, 1365449952, NULL, 'sitemailcharset', '0', NULL),
(750, 2, 1365449952, NULL, 'allowusermailcharset', '0', NULL),
(751, 2, 1365449952, NULL, 'mailnewline', 'LF', NULL),
(752, 2, 1365449952, NULL, 'jabberhost', '', NULL),
(753, 2, 1365449952, NULL, 'jabberserver', '', NULL),
(754, 2, 1365449952, NULL, 'jabberusername', '', NULL),
(755, 2, 1365449952, NULL, 'jabberpassword', '', NULL),
(756, 2, 1365449952, NULL, 'jabberport', '5222', NULL),
(757, 2, 1365449952, 'enrol_cohort', 'roleid', '5', NULL),
(758, 2, 1365449952, 'enrol_cohort', 'unenrolaction', '0', NULL),
(759, 2, 1365449952, 'enrol_database', 'defaultrole', '5', NULL),
(760, 2, 1365449952, 'enrol_database', 'defaultcategory', '1', NULL),
(761, 2, 1365449952, 'enrol_flatfile', 'map_1', 'manager', NULL),
(762, 2, 1365449952, 'enrol_flatfile', 'map_2', 'coursecreator', NULL),
(763, 2, 1365449952, 'enrol_flatfile', 'map_3', 'editingteacher', NULL),
(764, 2, 1365449952, 'enrol_flatfile', 'map_4', 'teacher', NULL),
(765, 2, 1365449952, 'enrol_flatfile', 'map_5', 'student', NULL),
(766, 2, 1365449952, 'enrol_flatfile', 'map_6', 'guest', NULL),
(767, 2, 1365449952, 'enrol_flatfile', 'map_7', 'user', NULL),
(768, 2, 1365449952, 'enrol_flatfile', 'map_8', 'frontpage', NULL),
(769, 2, 1365449952, 'enrol_imsenterprise', 'imsrolemap01', '5', NULL),
(770, 2, 1365449952, 'enrol_imsenterprise', 'imsrolemap02', '3', NULL),
(771, 2, 1365449952, 'enrol_imsenterprise', 'imsrolemap03', '3', NULL),
(772, 2, 1365449952, 'enrol_imsenterprise', 'imsrolemap04', '5', NULL),
(773, 2, 1365449952, 'enrol_imsenterprise', 'imsrolemap05', '0', NULL),
(774, 2, 1365449952, 'enrol_imsenterprise', 'imsrolemap06', '4', NULL),
(775, 2, 1365449952, 'enrol_imsenterprise', 'imsrolemap07', '0', NULL),
(776, 2, 1365449953, 'enrol_imsenterprise', 'imsrolemap08', '4', NULL),
(777, 2, 1365449953, 'enrol_manual', 'roleid', '5', NULL),
(778, 2, 1365449953, 'enrol_meta', 'nosyncroleids', '', NULL),
(779, 2, 1365449953, 'enrol_meta', 'syncall', '1', NULL),
(780, 2, 1365449953, 'enrol_meta', 'unenrolaction', '0', NULL),
(781, 2, 1365449953, 'enrol_mnet', 'roleid', '5', NULL),
(782, 2, 1365449953, 'enrol_mnet', 'roleid_adv', '1', NULL),
(783, 2, 1365449953, 'enrol_paypal', 'roleid', '5', NULL),
(784, 2, 1365449953, 'enrol_self', 'roleid', '5', NULL),
(785, 2, 1365449953, 'filter_urltolink', 'formats', '0', NULL),
(786, 2, 1365449953, 'filter_urltolink', 'embedimages', '1', NULL),
(787, 2, 1365449953, 'filter_emoticon', 'formats', '1,4,0', NULL),
(788, 2, 1365449953, NULL, 'filter_multilang_force_old', '0', NULL),
(789, 2, 1365449953, NULL, 'filter_tex_latexpreamble', '\\usepackage[latin1]{inputenc}\n\\usepackage{amsmath}\n\\usepackage{amsfonts}\n\\RequirePackage{amsmath,amssymb,latexsym}\n', NULL),
(790, 2, 1365449953, NULL, 'filter_tex_latexbackground', '#FFFFFF', NULL),
(791, 2, 1365449953, NULL, 'filter_tex_density', '120', NULL),
(792, 2, 1365449953, NULL, 'filter_tex_pathlatex', '"c:\\texmf\\miktex\\bin\\latex.exe" ', NULL),
(793, 2, 1365449953, NULL, 'filter_tex_pathdvips', '"c:\\texmf\\miktex\\bin\\dvips.exe" ', NULL),
(794, 2, 1365449953, NULL, 'filter_tex_pathconvert', '"c:\\imagemagick\\convert.exe" ', NULL),
(795, 2, 1365449953, NULL, 'filter_tex_convertformat', 'gif', NULL),
(796, 2, 1365449953, NULL, 'filter_censor_badwords', '', NULL),
(797, 2, 1365449953, NULL, 'profileroles', '5,4,3', NULL),
(798, 2, 1365449953, NULL, 'coursecontact', '3', NULL),
(799, 2, 1365449953, NULL, 'frontpage', '1', NULL),
(800, 2, 1365449953, NULL, 'frontpageloggedin', '1', NULL),
(801, 2, 1365449953, NULL, 'maxcategorydepth', '0', NULL),
(802, 2, 1365449953, NULL, 'commentsperpage', '15', NULL),
(803, 2, 1365449953, NULL, 'defaultfrontpageroleid', '8', NULL),
(804, 2, 1365449953, NULL, 'supportname', 'Admin User', NULL),
(805, 2, 1365449953, NULL, 'supportemail', 'admin@admin.com', NULL),
(806, 2, 1365449981, NULL, 'registerauth', 'email', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `mdl_config_plugins`
--

CREATE TABLE IF NOT EXISTS `mdl_config_plugins` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `plugin` varchar(100) NOT NULL DEFAULT 'core',
  `name` varchar(100) NOT NULL DEFAULT '',
  `value` longtext NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_confplug_plunam_uix` (`plugin`,`name`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Moodle modules and plugins configuration variables' AUTO_INCREMENT=877 ;

--
-- Dumping data for table `mdl_config_plugins`
--

INSERT INTO `mdl_config_plugins` (`id`, `plugin`, `name`, `value`) VALUES
(1, 'moodlecourse', 'format', 'weeks'),
(2, 'moodlecourse', 'maxsections', '52'),
(3, 'moodlecourse', 'numsections', '10'),
(4, 'moodlecourse', 'hiddensections', '0'),
(5, 'moodlecourse', 'newsitems', '5'),
(6, 'moodlecourse', 'showgrades', '1'),
(7, 'moodlecourse', 'showreports', '0'),
(8, 'moodlecourse', 'maxbytes', '8388608'),
(9, 'moodlecourse', 'coursedisplay', '0'),
(10, 'moodlecourse', 'groupmode', '0'),
(11, 'moodlecourse', 'groupmodeforce', '0'),
(12, 'moodlecourse', 'visible', '1'),
(13, 'moodlecourse', 'lang', ''),
(14, 'moodlecourse', 'enablecompletion', '0'),
(15, 'moodlecourse', 'completionstartonenrol', '0'),
(16, 'backup', 'loglifetime', '30'),
(17, 'backup', 'backup_general_users', '1'),
(18, 'backup', 'backup_general_users_locked', '0'),
(19, 'backup', 'backup_general_anonymize', '0'),
(20, 'backup', 'backup_general_anonymize_locked', '0'),
(21, 'backup', 'backup_general_role_assignments', '1'),
(22, 'backup', 'backup_general_role_assignments_locked', '0'),
(23, 'backup', 'backup_general_activities', '1'),
(24, 'backup', 'backup_general_activities_locked', '0'),
(25, 'backup', 'backup_general_blocks', '1'),
(26, 'backup', 'backup_general_blocks_locked', '0'),
(27, 'backup', 'backup_general_filters', '1'),
(28, 'backup', 'backup_general_filters_locked', '0'),
(29, 'backup', 'backup_general_comments', '1'),
(30, 'backup', 'backup_general_comments_locked', '0'),
(31, 'backup', 'backup_general_userscompletion', '1'),
(32, 'backup', 'backup_general_userscompletion_locked', '0'),
(33, 'backup', 'backup_general_logs', '0'),
(34, 'backup', 'backup_general_logs_locked', '0'),
(35, 'backup', 'backup_general_histories', '0'),
(36, 'backup', 'backup_general_histories_locked', '0'),
(37, 'backup', 'backup_auto_active', '0'),
(38, 'backup', 'backup_auto_weekdays', '0000000'),
(39, 'backup', 'backup_auto_hour', '0'),
(40, 'backup', 'backup_auto_minute', '0'),
(41, 'backup', 'backup_auto_storage', '0'),
(42, 'backup', 'backup_auto_destination', ''),
(43, 'backup', 'backup_auto_keep', '1'),
(44, 'backup', 'backup_shortname', '0'),
(45, 'backup', 'backup_auto_skip_hidden', '1'),
(46, 'backup', 'backup_auto_skip_modif_days', '30'),
(47, 'backup', 'backup_auto_skip_modif_prev', '0'),
(48, 'backup', 'backup_auto_users', '1'),
(49, 'backup', 'backup_auto_role_assignments', '1'),
(50, 'backup', 'backup_auto_activities', '1'),
(51, 'backup', 'backup_auto_blocks', '1'),
(52, 'backup', 'backup_auto_filters', '1'),
(53, 'backup', 'backup_auto_comments', '1'),
(54, 'backup', 'backup_auto_userscompletion', '1'),
(55, 'backup', 'backup_auto_logs', '0'),
(56, 'backup', 'backup_auto_histories', '0'),
(57, 'block_course_overview', 'defaultmaxcourses', '10'),
(58, 'block_course_overview', 'forcedefaultmaxcourses', '0'),
(59, 'block_course_overview', 'showchildren', '0'),
(60, 'block_course_overview', 'showwelcomearea', '0'),
(61, 'blocks/section_links', 'numsections1', '22'),
(62, 'blocks/section_links', 'incby1', '2'),
(63, 'blocks/section_links', 'numsections2', '40'),
(64, 'blocks/section_links', 'incby2', '5'),
(65, 'enrol_database', 'dbtype', ''),
(66, 'enrol_database', 'dbhost', 'localhost'),
(67, 'enrol_database', 'dbuser', ''),
(68, 'enrol_database', 'dbpass', ''),
(69, 'enrol_database', 'dbname', ''),
(70, 'enrol_database', 'dbencoding', 'utf-8'),
(71, 'enrol_database', 'dbsetupsql', ''),
(72, 'enrol_database', 'dbsybasequoting', '0'),
(73, 'enrol_database', 'debugdb', '0'),
(74, 'enrol_database', 'localcoursefield', 'idnumber'),
(75, 'enrol_database', 'localuserfield', 'idnumber'),
(76, 'enrol_database', 'localrolefield', 'shortname'),
(77, 'enrol_database', 'localcategoryfield', 'id'),
(78, 'enrol_database', 'remoteenroltable', ''),
(79, 'enrol_database', 'remotecoursefield', ''),
(80, 'enrol_database', 'remoteuserfield', ''),
(81, 'enrol_database', 'remoterolefield', ''),
(82, 'enrol_database', 'ignorehiddencourses', '0'),
(83, 'enrol_database', 'unenrolaction', '0'),
(84, 'enrol_database', 'newcoursetable', ''),
(85, 'enrol_database', 'newcoursefullname', 'fullname'),
(86, 'enrol_database', 'newcourseshortname', 'shortname'),
(87, 'enrol_database', 'newcourseidnumber', 'idnumber'),
(88, 'enrol_database', 'newcoursecategory', ''),
(89, 'enrol_database', 'templatecourse', ''),
(90, 'enrol_flatfile', 'location', ''),
(91, 'enrol_flatfile', 'mailstudents', '0'),
(92, 'enrol_flatfile', 'mailteachers', '0'),
(93, 'enrol_flatfile', 'mailadmins', '0'),
(94, 'enrol_guest', 'requirepassword', '0'),
(95, 'enrol_guest', 'usepasswordpolicy', '0'),
(96, 'enrol_guest', 'showhint', '0'),
(97, 'enrol_guest', 'defaultenrol', '1'),
(98, 'enrol_guest', 'status', '1'),
(99, 'enrol_guest', 'status_adv', '0'),
(100, 'enrol_imsenterprise', 'imsfilelocation', ''),
(101, 'enrol_imsenterprise', 'logtolocation', ''),
(102, 'enrol_imsenterprise', 'mailadmins', '0'),
(103, 'enrol_imsenterprise', 'createnewusers', '0'),
(104, 'enrol_imsenterprise', 'imsdeleteusers', '0'),
(105, 'enrol_imsenterprise', 'fixcaseusernames', '0'),
(106, 'enrol_imsenterprise', 'fixcasepersonalnames', '0'),
(107, 'enrol_imsenterprise', 'imssourcedidfallback', '0'),
(108, 'enrol_imsenterprise', 'truncatecoursecodes', '0'),
(109, 'enrol_imsenterprise', 'createnewcourses', '0'),
(110, 'enrol_imsenterprise', 'createnewcategories', '0'),
(111, 'enrol_imsenterprise', 'imsunenrol', '0'),
(112, 'enrol_imsenterprise', 'imsrestricttarget', ''),
(113, 'enrol_imsenterprise', 'imscapitafix', '0'),
(114, 'enrol_manual', 'expiredaction', '1'),
(115, 'enrol_manual', 'expirynotifyhour', '6'),
(116, 'enrol_manual', 'defaultenrol', '1'),
(117, 'enrol_manual', 'status', '0'),
(118, 'enrol_manual', 'enrolperiod', '0'),
(119, 'enrol_manual', 'expirynotify', '0'),
(120, 'enrol_manual', 'expirythreshold', '86400'),
(121, 'enrol_paypal', 'paypalbusiness', ''),
(122, 'enrol_paypal', 'mailstudents', '0'),
(123, 'enrol_paypal', 'mailteachers', '0'),
(124, 'enrol_paypal', 'mailadmins', '0'),
(125, 'enrol_paypal', 'status', '1'),
(126, 'enrol_paypal', 'cost', '0'),
(127, 'enrol_paypal', 'currency', 'USD'),
(128, 'enrol_paypal', 'enrolperiod', '0'),
(129, 'enrol_self', 'requirepassword', '0'),
(130, 'enrol_self', 'usepasswordpolicy', '0'),
(131, 'enrol_self', 'showhint', '0'),
(132, 'enrol_self', 'expiredaction', '1'),
(133, 'enrol_self', 'expirynotifyhour', '6'),
(134, 'enrol_self', 'defaultenrol', '1'),
(135, 'enrol_self', 'status', '1'),
(136, 'enrol_self', 'groupkey', '0'),
(137, 'enrol_self', 'enrolperiod', '0'),
(138, 'enrol_self', 'expirynotify', '0'),
(139, 'enrol_self', 'expirythreshold', '86400'),
(140, 'enrol_self', 'longtimenosee', '0'),
(141, 'enrol_self', 'maxenrolled', '0'),
(142, 'enrol_self', 'sendcoursewelcomemessage', '1'),
(143, 'editor_tinymce', 'customtoolbar', 'fontselect,fontsizeselect,formatselect,|,undo,redo,|,search,replace,|,fullscreen\n\nbold,italic,underline,strikethrough,sub,sup,|,justifyleft,justifycenter,justifyright,|,cleanup,removeformat,pastetext,pasteword,|,forecolor,backcolor,|,ltr,rtl\n\nbullist,numlist,outdent,indent,|,link,unlink,|,image,nonbreaking,charmap,table,|,code'),
(144, 'editor_tinymce', 'fontselectlist', 'Trebuchet=Trebuchet MS,Verdana,Arial,Helvetica,sans-serif;Arial=arial,helvetica,sans-serif;Courier New=courier new,courier,monospace;Georgia=georgia,times new roman,times,serif;Tahoma=tahoma,arial,helvetica,sans-serif;Times New Roman=times new roman,times,serif;Verdana=verdana,arial,helvetica,sans-serif;Impact=impact;Wingdings=wingdings'),
(145, 'editor_tinymce', 'customconfig', ''),
(146, 'tinymce_dragmath', 'requiretex', '1'),
(147, 'tinymce_moodleemoticon', 'requireemoticon', '1'),
(148, 'tinymce_spellchecker', 'spellengine', 'GoogleSpell'),
(149, 'tinymce_spellchecker', 'spelllanguagelist', '+English=en,Danish=da,Dutch=nl,Finnish=fi,French=fr,German=de,Italian=it,Polish=pl,Portuguese=pt,Spanish=es,Swedish=sv'),
(150, 'cachestore_memcache', 'testservers', ''),
(151, 'cachestore_memcached', 'testservers', ''),
(152, 'cachestore_mongodb', 'testserver', ''),
(153, 'theme_afterburner', 'logo', ''),
(154, 'theme_afterburner', 'footnote', ''),
(155, 'theme_afterburner', 'customcss', ''),
(156, 'theme_arialist', 'logo', ''),
(157, 'theme_arialist', 'tagline', ''),
(158, 'theme_arialist', 'linkcolor', '#f25f0f'),
(159, 'theme_arialist', 'regionwidth', '250'),
(160, 'theme_arialist', 'customcss', ''),
(161, 'theme_brick', 'logo', ''),
(162, 'theme_brick', 'linkcolor', '#06365b'),
(163, 'theme_brick', 'linkhover', '#5487ad'),
(164, 'theme_brick', 'maincolor', '#8e2800'),
(165, 'theme_brick', 'maincolorlink', '#fff0a5'),
(166, 'theme_brick', 'headingcolor', '#5c3500'),
(167, 'theme_formal_white', 'fontsizereference', '13'),
(168, 'theme_formal_white', 'noframe', '0'),
(169, 'theme_formal_white', 'framemargin', '15'),
(170, 'theme_formal_white', 'headercontent', '1'),
(171, 'theme_formal_white', 'customlogourl', ''),
(172, 'theme_formal_white', 'frontpagelogourl', ''),
(173, 'theme_formal_white', 'headerbgc', '#E3DFD4'),
(174, 'theme_formal_white', 'creditstomoodleorg', '2'),
(175, 'theme_formal_white', 'blockcolumnwidth', '200'),
(176, 'theme_formal_white', 'blockpadding', '8'),
(177, 'theme_formal_white', 'blockcontentbgc', '#F6F6F6'),
(178, 'theme_formal_white', 'lblockcolumnbgc', '#E3DFD4'),
(179, 'theme_formal_white', 'rblockcolumnbgc', ''),
(180, 'theme_formal_white', 'footnote', ''),
(181, 'theme_formal_white', 'customcss', ''),
(182, 'theme_fusion', 'linkcolor', '#2d83d5'),
(183, 'theme_fusion', 'tagline', ''),
(184, 'theme_fusion', 'footertext', ''),
(185, 'theme_fusion', 'customcss', ''),
(186, 'theme_magazine', 'background', ''),
(187, 'theme_magazine', 'logo', ''),
(188, 'theme_magazine', 'linkcolor', '#32529a'),
(189, 'theme_magazine', 'linkhover', '#4e2300'),
(190, 'theme_magazine', 'maincolor', '#002f2f'),
(191, 'theme_magazine', 'maincoloraccent', '#092323'),
(192, 'theme_magazine', 'headingcolor', '#4e0000'),
(193, 'theme_magazine', 'blockcolor', '#002f2f'),
(194, 'theme_magazine', 'forumback', '#e6e2af'),
(195, 'theme_mymobile', 'colourswatch', 'light'),
(196, 'theme_mymobile', 'showmobileintro', ''),
(197, 'theme_mymobile', 'showsitetopic', 'topicshow'),
(198, 'theme_mymobile', 'showfullsizeimages', 'ithumb'),
(199, 'theme_mymobile', 'usetableview', 'tabshow'),
(200, 'theme_mymobile', 'customcss', ''),
(201, 'theme_nimble', 'tagline', ''),
(202, 'theme_nimble', 'footerline', ''),
(203, 'theme_nimble', 'backgroundcolor', '#454545'),
(204, 'theme_nimble', 'linkcolor', '#2a65b1'),
(205, 'theme_nimble', 'linkhover', '#222222'),
(206, 'theme_nonzero', 'regionprewidth', '200'),
(207, 'theme_nonzero', 'regionpostwidth', '200'),
(208, 'theme_nonzero', 'customcss', ''),
(209, 'theme_overlay', 'linkcolor', '#428ab5'),
(210, 'theme_overlay', 'headercolor', '#2a4c7b'),
(211, 'theme_overlay', 'footertext', ''),
(212, 'theme_overlay', 'customcss', ''),
(213, 'theme_sky_high', 'logo', ''),
(214, 'theme_sky_high', 'regionwidth', '240'),
(215, 'theme_sky_high', 'footnote', ''),
(216, 'theme_sky_high', 'customcss', ''),
(217, 'theme_splash', 'logo', ''),
(218, 'theme_splash', 'tagline', 'Virtual learning center'),
(219, 'theme_splash', 'hide_tagline', '0'),
(220, 'theme_splash', 'footnote', ''),
(221, 'theme_splash', 'customcss', ''),
(222, 'qtype_calculated', 'version', '2012112900'),
(223, 'qtype_calculatedmulti', 'version', '2012112900'),
(224, 'qtype_calculatedsimple', 'version', '2012112900'),
(225, 'qtype_description', 'version', '2012112900'),
(226, 'qtype_essay', 'version', '2012112900'),
(227, 'qtype_match', 'version', '2012112900'),
(228, 'qtype_missingtype', 'version', '2012112900'),
(229, 'qtype_multianswer', 'version', '2012112900'),
(230, 'qtype_multichoice', 'version', '2012112900'),
(231, 'qtype_numerical', 'version', '2012112900'),
(232, 'qtype_random', 'version', '2012112900'),
(233, 'qtype_randomsamatch', 'version', '2012112900'),
(234, 'qtype_shortanswer', 'version', '2012112900'),
(235, 'qtype_truefalse', 'version', '2012112900'),
(245, 'auth_cas', 'version', '2012112900'),
(247, 'auth_db', 'version', '2012112900'),
(249, 'auth_email', 'version', '2012112900'),
(250, 'auth_fc', 'version', '2012112900'),
(252, 'auth_imap', 'version', '2012112900'),
(254, 'auth_ldap', 'version', '2012112900'),
(256, 'auth_manual', 'version', '2012112900'),
(257, 'auth_mnet', 'version', '2012112900'),
(259, 'auth_nntp', 'version', '2012112900'),
(261, 'auth_nologin', 'version', '2012112900'),
(262, 'auth_none', 'version', '2012112900'),
(263, 'auth_pam', 'version', '2012112900'),
(265, 'auth_pop3', 'version', '2012112900'),
(267, 'auth_radius', 'version', '2012112900'),
(269, 'auth_shibboleth', 'version', '2012112900'),
(271, 'auth_webservice', 'version', '2012112900'),
(272, 'enrol_authorize', 'version', '2012112900'),
(273, 'enrol_category', 'version', '2012112900'),
(275, 'enrol_cohort', 'version', '2012112900'),
(276, 'enrol_database', 'version', '2012112900'),
(278, 'enrol_flatfile', 'version', '2012112900'),
(279, 'enrol_guest', 'version', '2012112900'),
(280, 'enrol_imsenterprise', 'version', '2012112900'),
(282, 'enrol_ldap', 'version', '2012112900'),
(284, 'enrol_manual', 'version', '2012112900'),
(286, 'enrol_meta', 'version', '2012112900'),
(288, 'enrol_mnet', 'version', '2012112900'),
(289, 'enrol_paypal', 'version', '2012112900'),
(290, 'enrol_self', 'version', '2012112900'),
(292, 'message_email', 'version', '2012112900'),
(294, 'message', 'email_provider_enrol_authorize_authorize_enrolment_permitted', 'permitted'),
(295, 'message', 'message_provider_enrol_authorize_authorize_enrolment_loggedin', 'email'),
(296, 'message', 'message_provider_enrol_authorize_authorize_enrolment_loggedoff', 'email'),
(297, 'message', 'email_provider_enrol_flatfile_flatfile_enrolment_permitted', 'permitted'),
(298, 'message', 'message_provider_enrol_flatfile_flatfile_enrolment_loggedin', 'email'),
(299, 'message', 'message_provider_enrol_flatfile_flatfile_enrolment_loggedoff', 'email'),
(300, 'message', 'email_provider_enrol_imsenterprise_imsenterprise_enrolment_permitted', 'permitted'),
(301, 'message', 'message_provider_enrol_imsenterprise_imsenterprise_enrolment_loggedin', 'email'),
(302, 'message', 'message_provider_enrol_imsenterprise_imsenterprise_enrolment_loggedoff', 'email'),
(303, 'message', 'email_provider_enrol_manual_expiry_notification_permitted', 'permitted'),
(304, 'message', 'message_provider_enrol_manual_expiry_notification_loggedin', 'email'),
(305, 'message', 'message_provider_enrol_manual_expiry_notification_loggedoff', 'email'),
(306, 'message', 'email_provider_enrol_paypal_paypal_enrolment_permitted', 'permitted'),
(307, 'message', 'message_provider_enrol_paypal_paypal_enrolment_loggedin', 'email'),
(308, 'message', 'message_provider_enrol_paypal_paypal_enrolment_loggedoff', 'email'),
(309, 'message', 'email_provider_enrol_self_expiry_notification_permitted', 'permitted'),
(310, 'message', 'message_provider_enrol_self_expiry_notification_loggedin', 'email'),
(311, 'message', 'message_provider_enrol_self_expiry_notification_loggedoff', 'email'),
(312, 'message', 'email_provider_mod_assign_assign_notification_permitted', 'permitted'),
(313, 'message', 'message_provider_mod_assign_assign_notification_loggedin', 'email'),
(314, 'message', 'message_provider_mod_assign_assign_notification_loggedoff', 'email'),
(315, 'message', 'email_provider_mod_assignment_assignment_updates_permitted', 'permitted'),
(316, 'message', 'message_provider_mod_assignment_assignment_updates_loggedin', 'email'),
(317, 'message', 'message_provider_mod_assignment_assignment_updates_loggedoff', 'email'),
(318, 'message', 'email_provider_mod_feedback_submission_permitted', 'permitted'),
(319, 'message', 'message_provider_mod_feedback_submission_loggedin', 'email'),
(320, 'message', 'message_provider_mod_feedback_submission_loggedoff', 'email'),
(321, 'message', 'email_provider_mod_feedback_message_permitted', 'permitted'),
(322, 'message', 'message_provider_mod_feedback_message_loggedin', 'email'),
(323, 'message', 'message_provider_mod_feedback_message_loggedoff', 'email'),
(324, 'message', 'email_provider_mod_forum_posts_permitted', 'permitted'),
(325, 'message', 'message_provider_mod_forum_posts_loggedin', 'email'),
(326, 'message', 'message_provider_mod_forum_posts_loggedoff', 'email'),
(327, 'message', 'email_provider_mod_lesson_graded_essay_permitted', 'permitted'),
(328, 'message', 'message_provider_mod_lesson_graded_essay_loggedin', 'email'),
(329, 'message', 'message_provider_mod_lesson_graded_essay_loggedoff', 'email'),
(330, 'message', 'email_provider_mod_quiz_submission_permitted', 'permitted'),
(331, 'message', 'message_provider_mod_quiz_submission_loggedin', 'email'),
(332, 'message', 'message_provider_mod_quiz_submission_loggedoff', 'email'),
(333, 'message', 'email_provider_mod_quiz_confirmation_permitted', 'permitted'),
(334, 'message', 'message_provider_mod_quiz_confirmation_loggedin', 'email'),
(335, 'message', 'message_provider_mod_quiz_confirmation_loggedoff', 'email'),
(336, 'message', 'email_provider_mod_quiz_attempt_overdue_permitted', 'permitted'),
(337, 'message', 'message_provider_mod_quiz_attempt_overdue_loggedin', 'email'),
(338, 'message', 'message_provider_mod_quiz_attempt_overdue_loggedoff', 'email'),
(339, 'message', 'email_provider_moodle_notices_permitted', 'permitted'),
(340, 'message', 'message_provider_moodle_notices_loggedin', 'email'),
(341, 'message', 'message_provider_moodle_notices_loggedoff', 'email'),
(342, 'message', 'email_provider_moodle_errors_permitted', 'permitted'),
(343, 'message', 'message_provider_moodle_errors_loggedin', 'email'),
(344, 'message', 'message_provider_moodle_errors_loggedoff', 'email'),
(345, 'message', 'email_provider_moodle_availableupdate_permitted', 'permitted'),
(346, 'message', 'message_provider_moodle_availableupdate_loggedin', 'email'),
(347, 'message', 'message_provider_moodle_availableupdate_loggedoff', 'email'),
(348, 'message', 'email_provider_moodle_instantmessage_permitted', 'permitted'),
(349, 'message', 'message_provider_moodle_instantmessage_loggedoff', 'popup,email'),
(350, 'message', 'email_provider_moodle_backup_permitted', 'permitted'),
(351, 'message', 'message_provider_moodle_backup_loggedin', 'email'),
(352, 'message', 'message_provider_moodle_backup_loggedoff', 'email'),
(353, 'message', 'email_provider_moodle_courserequested_permitted', 'permitted'),
(354, 'message', 'message_provider_moodle_courserequested_loggedin', 'email'),
(355, 'message', 'message_provider_moodle_courserequested_loggedoff', 'email'),
(356, 'message', 'email_provider_moodle_courserequestapproved_permitted', 'permitted'),
(357, 'message', 'message_provider_moodle_courserequestapproved_loggedin', 'email'),
(358, 'message', 'message_provider_moodle_courserequestapproved_loggedoff', 'email'),
(359, 'message', 'email_provider_moodle_courserequestrejected_permitted', 'permitted'),
(360, 'message', 'message_provider_moodle_courserequestrejected_loggedin', 'email'),
(361, 'message', 'message_provider_moodle_courserequestrejected_loggedoff', 'email'),
(362, 'message_jabber', 'version', '2012112900'),
(364, 'message', 'jabber_provider_enrol_authorize_authorize_enrolment_permitted', 'permitted'),
(365, 'message', 'jabber_provider_enrol_flatfile_flatfile_enrolment_permitted', 'permitted'),
(366, 'message', 'jabber_provider_enrol_imsenterprise_imsenterprise_enrolment_permitted', 'permitted'),
(367, 'message', 'jabber_provider_enrol_manual_expiry_notification_permitted', 'permitted'),
(368, 'message', 'jabber_provider_enrol_paypal_paypal_enrolment_permitted', 'permitted'),
(369, 'message', 'jabber_provider_enrol_self_expiry_notification_permitted', 'permitted'),
(370, 'message', 'jabber_provider_mod_assign_assign_notification_permitted', 'permitted'),
(371, 'message', 'jabber_provider_mod_assignment_assignment_updates_permitted', 'permitted'),
(372, 'message', 'jabber_provider_mod_feedback_submission_permitted', 'permitted'),
(373, 'message', 'jabber_provider_mod_feedback_message_permitted', 'permitted'),
(374, 'message', 'jabber_provider_mod_forum_posts_permitted', 'permitted'),
(375, 'message', 'jabber_provider_mod_lesson_graded_essay_permitted', 'permitted'),
(376, 'message', 'jabber_provider_mod_quiz_submission_permitted', 'permitted'),
(377, 'message', 'jabber_provider_mod_quiz_confirmation_permitted', 'permitted'),
(378, 'message', 'jabber_provider_mod_quiz_attempt_overdue_permitted', 'permitted'),
(379, 'message', 'jabber_provider_moodle_notices_permitted', 'permitted'),
(380, 'message', 'jabber_provider_moodle_errors_permitted', 'permitted'),
(381, 'message', 'jabber_provider_moodle_availableupdate_permitted', 'permitted'),
(382, 'message', 'jabber_provider_moodle_instantmessage_permitted', 'permitted'),
(383, 'message', 'jabber_provider_moodle_backup_permitted', 'permitted'),
(384, 'message', 'jabber_provider_moodle_courserequested_permitted', 'permitted'),
(385, 'message', 'jabber_provider_moodle_courserequestapproved_permitted', 'permitted'),
(386, 'message', 'jabber_provider_moodle_courserequestrejected_permitted', 'permitted'),
(387, 'message_popup', 'version', '2012112900'),
(389, 'message', 'popup_provider_enrol_authorize_authorize_enrolment_permitted', 'permitted'),
(390, 'message', 'popup_provider_enrol_flatfile_flatfile_enrolment_permitted', 'permitted'),
(391, 'message', 'popup_provider_enrol_imsenterprise_imsenterprise_enrolment_permitted', 'permitted'),
(392, 'message', 'popup_provider_enrol_manual_expiry_notification_permitted', 'permitted'),
(393, 'message', 'popup_provider_enrol_paypal_paypal_enrolment_permitted', 'permitted'),
(394, 'message', 'popup_provider_enrol_self_expiry_notification_permitted', 'permitted'),
(395, 'message', 'popup_provider_mod_assign_assign_notification_permitted', 'permitted'),
(396, 'message', 'popup_provider_mod_assignment_assignment_updates_permitted', 'permitted'),
(397, 'message', 'popup_provider_mod_feedback_submission_permitted', 'permitted'),
(398, 'message', 'popup_provider_mod_feedback_message_permitted', 'permitted'),
(399, 'message', 'popup_provider_mod_forum_posts_permitted', 'permitted'),
(400, 'message', 'popup_provider_mod_lesson_graded_essay_permitted', 'permitted'),
(401, 'message', 'popup_provider_mod_quiz_submission_permitted', 'permitted'),
(402, 'message', 'popup_provider_mod_quiz_confirmation_permitted', 'permitted'),
(403, 'message', 'popup_provider_mod_quiz_attempt_overdue_permitted', 'permitted'),
(404, 'message', 'popup_provider_moodle_notices_permitted', 'permitted'),
(405, 'message', 'popup_provider_moodle_errors_permitted', 'permitted'),
(406, 'message', 'popup_provider_moodle_availableupdate_permitted', 'permitted'),
(407, 'message', 'popup_provider_moodle_instantmessage_permitted', 'permitted'),
(408, 'message', 'message_provider_moodle_instantmessage_loggedin', 'popup'),
(409, 'message', 'popup_provider_moodle_backup_permitted', 'permitted'),
(410, 'message', 'popup_provider_moodle_courserequested_permitted', 'permitted'),
(411, 'message', 'popup_provider_moodle_courserequestapproved_permitted', 'permitted'),
(412, 'message', 'popup_provider_moodle_courserequestrejected_permitted', 'permitted'),
(414, 'filter_activitynames', 'version', '2012112900'),
(416, 'filter_algebra', 'version', '2012112900'),
(417, 'filter_censor', 'version', '2012112900'),
(418, 'filter_data', 'version', '2012112900'),
(420, 'filter_emailprotect', 'version', '2012112900'),
(421, 'filter_emoticon', 'version', '2012112900'),
(422, 'filter_glossary', 'version', '2012112900'),
(424, 'filter_mediaplugin', 'version', '2012112900'),
(426, 'filter_multilang', 'version', '2012112900'),
(427, 'filter_tex', 'version', '2012112900'),
(429, 'filter_tidy', 'version', '2012112900'),
(430, 'filter_urltolink', 'version', '2012112900'),
(431, 'editor_textarea', 'version', '2012112900'),
(432, 'editor_tinymce', 'version', '2012112900'),
(433, 'format_scorm', 'version', '2012112900'),
(434, 'format_social', 'version', '2012112900'),
(435, 'format_topics', 'version', '2012112900'),
(436, 'format_weeks', 'version', '2012112900'),
(437, 'profilefield_checkbox', 'version', '2012112900'),
(438, 'profilefield_datetime', 'version', '2012112900'),
(439, 'profilefield_menu', 'version', '2012112900'),
(440, 'profilefield_text', 'version', '2012112900'),
(441, 'profilefield_textarea', 'version', '2012112900'),
(442, 'report_backups', 'version', '2012112900'),
(443, 'report_completion', 'version', '2012112900'),
(445, 'report_configlog', 'version', '2012112900'),
(446, 'report_courseoverview', 'version', '2012112900'),
(447, 'report_log', 'version', '2012112900'),
(449, 'report_loglive', 'version', '2012112900'),
(450, 'report_outline', 'version', '2012112900'),
(452, 'report_participation', 'version', '2012112900'),
(454, 'report_progress', 'version', '2012112900'),
(456, 'report_questioninstances', 'version', '2012112900'),
(457, 'report_security', 'version', '2012112900'),
(458, 'report_stats', 'version', '2012112900'),
(460, 'gradeexport_ods', 'version', '2012112900'),
(461, 'gradeexport_txt', 'version', '2012112900'),
(462, 'gradeexport_xls', 'version', '2012112900'),
(463, 'gradeexport_xml', 'version', '2012112900'),
(464, 'gradeimport_csv', 'version', '2012112900'),
(465, 'gradeimport_xml', 'version', '2012112900'),
(466, 'gradereport_grader', 'version', '2012112900'),
(467, 'gradereport_outcomes', 'version', '2012112900'),
(468, 'gradereport_overview', 'version', '2012112900'),
(469, 'gradereport_user', 'version', '2012112900'),
(470, 'gradingform_guide', 'version', '2012112900'),
(471, 'gradingform_rubric', 'version', '2012112900'),
(472, 'mnetservice_enrol', 'version', '2012112900'),
(473, 'webservice_amf', 'version', '2012112900'),
(474, 'webservice_rest', 'version', '2012112900'),
(475, 'webservice_soap', 'version', '2012112900'),
(476, 'webservice_xmlrpc', 'version', '2012112900'),
(477, 'repository_alfresco', 'version', '2012112900'),
(478, 'repository_boxnet', 'version', '2012112900'),
(479, 'repository_coursefiles', 'version', '2012112900'),
(480, 'repository_dropbox', 'version', '2012112900'),
(481, 'repository_equella', 'version', '2012112900'),
(482, 'repository_filesystem', 'version', '2012112900'),
(483, 'repository_flickr', 'version', '2012112900'),
(484, 'repository_flickr_public', 'version', '2012112900'),
(485, 'repository_googledocs', 'version', '2012112900'),
(486, 'repository_local', 'version', '2012112900'),
(488, 'local', 'enablecourseinstances', '0'),
(489, 'local', 'enableuserinstances', '0'),
(490, 'repository_merlot', 'version', '2012112900'),
(491, 'repository_picasa', 'version', '2012112900'),
(492, 'repository_recent', 'version', '2012112900'),
(494, 'recent', 'enablecourseinstances', '0'),
(495, 'recent', 'enableuserinstances', '0'),
(496, 'repository_s3', 'version', '2012112900'),
(497, 'repository_upload', 'version', '2012112900'),
(499, 'upload', 'enablecourseinstances', '0'),
(500, 'upload', 'enableuserinstances', '0'),
(501, 'repository_url', 'version', '2012112900'),
(503, 'url', 'enablecourseinstances', '0'),
(504, 'url', 'enableuserinstances', '0'),
(505, 'repository_user', 'version', '2012112900'),
(507, 'user', 'enablecourseinstances', '0'),
(508, 'user', 'enableuserinstances', '0'),
(509, 'repository_webdav', 'version', '2012112900'),
(510, 'repository_wikimedia', 'version', '2012112900'),
(512, 'wikimedia', 'enablecourseinstances', '0'),
(513, 'wikimedia', 'enableuserinstances', '0'),
(514, 'repository_youtube', 'version', '2012112900'),
(516, 'youtube', 'enablecourseinstances', '0'),
(517, 'youtube', 'enableuserinstances', '0'),
(518, 'portfolio_boxnet', 'version', '2012112900'),
(519, 'portfolio_download', 'version', '2012112900'),
(520, 'portfolio_flickr', 'version', '2012112900'),
(521, 'portfolio_googledocs', 'version', '2012112900'),
(522, 'portfolio_mahara', 'version', '2012112900'),
(523, 'portfolio_picasa', 'version', '2012112900'),
(524, 'qbehaviour_adaptive', 'version', '2012112900'),
(525, 'qbehaviour_adaptivenopenalty', 'version', '2012112900'),
(526, 'qbehaviour_deferredcbm', 'version', '2012112900'),
(527, 'qbehaviour_deferredfeedback', 'version', '2012112900'),
(528, 'qbehaviour_immediatecbm', 'version', '2012112900'),
(529, 'qbehaviour_immediatefeedback', 'version', '2012112900'),
(530, 'qbehaviour_informationitem', 'version', '2012112900'),
(531, 'qbehaviour_interactive', 'version', '2012112900'),
(532, 'qbehaviour_interactivecountback', 'version', '2012112900'),
(533, 'qbehaviour_manualgraded', 'version', '2012112900'),
(534, 'qbehaviour_missing', 'version', '2012112900'),
(535, 'qformat_aiken', 'version', '2012112900'),
(536, 'qformat_blackboard', 'version', '2012112900'),
(537, 'qformat_blackboard_six', 'version', '2012112900'),
(538, 'qformat_examview', 'version', '2012112900'),
(539, 'qformat_gift', 'version', '2012112900'),
(540, 'qformat_learnwise', 'version', '2012112900'),
(541, 'qformat_missingword', 'version', '2012112900'),
(542, 'qformat_multianswer', 'version', '2012112900'),
(543, 'qformat_webct', 'version', '2012112900'),
(544, 'qformat_xhtml', 'version', '2012112900'),
(545, 'qformat_xml', 'version', '2012112900'),
(546, 'tool_assignmentupgrade', 'version', '2012112900'),
(547, 'tool_capability', 'version', '2012112900'),
(548, 'tool_customlang', 'version', '2012112900'),
(550, 'tool_dbtransfer', 'version', '2012112900'),
(551, 'tool_generator', 'version', '2012112900'),
(552, 'tool_health', 'version', '2012112900'),
(553, 'tool_innodb', 'version', '2012112900'),
(554, 'tool_langimport', 'version', '2012112900'),
(555, 'tool_multilangupgrade', 'version', '2012112900'),
(556, 'tool_phpunit', 'version', '2012112900'),
(557, 'tool_profiling', 'version', '2012112900'),
(558, 'tool_qeupgradehelper', 'version', '2012112900'),
(560, 'tool_replace', 'version', '2012112900'),
(561, 'tool_spamcleaner', 'version', '2012112900'),
(562, 'tool_timezoneimport', 'version', '2012112900'),
(563, 'tool_unsuproles', 'version', '2012112900'),
(565, 'tool_uploaduser', 'version', '2012112900'),
(566, 'tool_xmldb', 'version', '2012112900'),
(567, 'cachestore_file', 'version', '2012112900'),
(568, 'cachestore_memcache', 'version', '2012112900'),
(569, 'cachestore_memcached', 'version', '2012112900'),
(570, 'cachestore_mongodb', 'version', '2012112900'),
(571, 'cachestore_session', 'version', '2012112900'),
(572, 'cachestore_static', 'version', '2012112900'),
(573, 'theme_afterburner', 'version', '2012112900'),
(574, 'theme_anomaly', 'version', '2012112900'),
(575, 'theme_arialist', 'version', '2012112900'),
(576, 'theme_base', 'version', '2012112901'),
(577, 'theme_binarius', 'version', '2012112900'),
(578, 'theme_boxxie', 'version', '2012112900'),
(579, 'theme_brick', 'version', '2012112900'),
(580, 'theme_canvas', 'version', '2012112900'),
(581, 'theme_formal_white', 'version', '2012112900'),
(583, 'theme_formfactor', 'version', '2012112900'),
(584, 'theme_fusion', 'version', '2012112900'),
(585, 'theme_leatherbound', 'version', '2012112900'),
(586, 'theme_magazine', 'version', '2012112900'),
(587, 'theme_mymobile', 'version', '2012112900'),
(588, 'theme_nimble', 'version', '2012112900'),
(589, 'theme_nonzero', 'version', '2012112900'),
(590, 'theme_overlay', 'version', '2012112900'),
(591, 'theme_serenity', 'version', '2012112900'),
(592, 'theme_sky_high', 'version', '2012112900'),
(593, 'theme_splash', 'version', '2012112900'),
(594, 'theme_standard', 'version', '2012112900'),
(595, 'theme_standardold', 'version', '2012112900'),
(596, 'assignsubmission_comments', 'version', '2012112900'),
(598, 'assignsubmission_file', 'sortorder', '1'),
(599, 'assignsubmission_comments', 'sortorder', '2'),
(600, 'assignsubmission_onlinetext', 'sortorder', '0'),
(601, 'assignsubmission_file', 'version', '2012112900'),
(602, 'assignsubmission_onlinetext', 'version', '2012112900'),
(604, 'assignfeedback_comments', 'version', '2012112900'),
(606, 'assignfeedback_comments', 'sortorder', '0'),
(607, 'assignfeedback_file', 'sortorder', '2'),
(608, 'assignfeedback_offline', 'sortorder', '1'),
(609, 'assignfeedback_file', 'version', '2012112900'),
(611, 'assignfeedback_offline', 'version', '2012112900'),
(612, 'assignment_offline', 'version', '2012112900'),
(613, 'assignment_online', 'version', '2012112900'),
(614, 'assignment_upload', 'version', '2012112900'),
(615, 'assignment_uploadsingle', 'version', '2012112900'),
(616, 'booktool_exportimscp', 'version', '2012112900'),
(617, 'booktool_importhtml', 'version', '2012112900'),
(618, 'booktool_print', 'version', '2012112900'),
(619, 'datafield_checkbox', 'version', '2012112900'),
(620, 'datafield_date', 'version', '2012112900'),
(621, 'datafield_file', 'version', '2012112900'),
(622, 'datafield_latlong', 'version', '2012112900'),
(623, 'datafield_menu', 'version', '2012112900'),
(624, 'datafield_multimenu', 'version', '2012112900'),
(625, 'datafield_number', 'version', '2012112900'),
(626, 'datafield_picture', 'version', '2012112900'),
(627, 'datafield_radiobutton', 'version', '2012112900'),
(628, 'datafield_text', 'version', '2012112900'),
(629, 'datafield_textarea', 'version', '2012112900'),
(630, 'datafield_url', 'version', '2012112900'),
(631, 'datapreset_imagegallery', 'version', '2012112900'),
(632, 'quiz_grading', 'version', '2012112900'),
(633, 'quiz_overview', 'version', '2012112900'),
(634, 'quiz_responses', 'version', '2012112900'),
(635, 'quiz_statistics', 'version', '2012112900'),
(637, 'quizaccess_delaybetweenattempts', 'version', '2012112900'),
(638, 'quizaccess_ipaddress', 'version', '2012112900'),
(639, 'quizaccess_numattempts', 'version', '2012112900'),
(640, 'quizaccess_openclosedate', 'version', '2012112900'),
(641, 'quizaccess_password', 'version', '2012112900'),
(642, 'quizaccess_safebrowser', 'version', '2012112900'),
(643, 'quizaccess_securewindow', 'version', '2012112900'),
(644, 'quizaccess_timelimit', 'version', '2012112900'),
(645, 'scormreport_basic', 'version', '2012112900'),
(646, 'scormreport_graphs', 'version', '2012112900'),
(647, 'scormreport_interactions', 'version', '2012112900'),
(648, 'workshopform_accumulative', 'version', '2012112900'),
(650, 'workshopform_comments', 'version', '2012112900'),
(652, 'workshopform_numerrors', 'version', '2012112900'),
(654, 'workshopform_rubric', 'version', '2012112900'),
(656, 'workshopallocation_manual', 'version', '2012112900'),
(657, 'workshopallocation_random', 'version', '2012112900'),
(658, 'workshopallocation_scheduled', 'version', '2012112901'),
(659, 'workshopeval_best', 'version', '2012112900'),
(660, 'tinymce_dragmath', 'version', '2012112900'),
(661, 'tinymce_moodleemoticon', 'version', '2012112900'),
(662, 'tinymce_moodleimage', 'version', '2012112900'),
(663, 'tinymce_moodlemedia', 'version', '2012112900'),
(664, 'tinymce_moodlenolink', 'version', '2012112900'),
(665, 'tinymce_spellchecker', 'version', '2012112900'),
(667, 'assign', 'feedback_plugin_for_gradebook', 'assignfeedback_comments'),
(668, 'assign', 'showrecentsubmissions', '0'),
(669, 'assign', 'submissionreceipts', '1'),
(670, 'assign', 'submissionstatement', 'This assignment is my own work, except where I have acknowledged the use of the works of other people.'),
(671, 'assign', 'requiresubmissionstatement', '0'),
(672, 'book', 'requiremodintro', '1'),
(673, 'book', 'numberingoptions', '0,1,2,3'),
(674, 'book', 'numbering', '1'),
(675, 'folder', 'requiremodintro', '1'),
(676, 'imscp', 'requiremodintro', '1'),
(677, 'imscp', 'keepold', '1'),
(678, 'imscp', 'keepold_adv', '0'),
(679, 'page', 'requiremodintro', '1'),
(680, 'page', 'displayoptions', '5'),
(681, 'page', 'printheading', '1'),
(682, 'page', 'printheading_adv', '0'),
(683, 'page', 'printintro', '0'),
(684, 'page', 'printintro_adv', '0'),
(685, 'page', 'display', '5'),
(686, 'page', 'display_adv', '1'),
(687, 'page', 'popupwidth', '620'),
(688, 'page', 'popupwidth_adv', '1'),
(689, 'page', 'popupheight', '450'),
(690, 'page', 'popupheight_adv', '1'),
(691, 'quiz', 'timelimit', '0'),
(692, 'quiz', 'timelimit_adv', '0'),
(693, 'quiz', 'overduehandling', 'autoabandon'),
(694, 'quiz', 'overduehandling_adv', '0'),
(695, 'quiz', 'graceperiod', '86400'),
(696, 'quiz', 'graceperiod_adv', '0'),
(697, 'quiz', 'graceperiodmin', '60'),
(698, 'quiz', 'attempts', '0'),
(699, 'quiz', 'attempts_adv', '0'),
(700, 'quiz', 'grademethod', '1'),
(701, 'quiz', 'grademethod_adv', '0'),
(702, 'quiz', 'maximumgrade', '10'),
(703, 'quiz', 'shufflequestions', '0'),
(704, 'quiz', 'shufflequestions_adv', '0'),
(705, 'quiz', 'questionsperpage', '1'),
(706, 'quiz', 'questionsperpage_adv', '0'),
(707, 'quiz', 'navmethod', 'free'),
(708, 'quiz', 'navmethod_adv', '1'),
(709, 'quiz', 'shuffleanswers', '1'),
(710, 'quiz', 'shuffleanswers_adv', '0'),
(711, 'quiz', 'preferredbehaviour', 'deferredfeedback'),
(712, 'quiz', 'attemptonlast', '0'),
(713, 'quiz', 'attemptonlast_adv', '1'),
(714, 'quiz', 'reviewattempt', '69904'),
(715, 'quiz', 'reviewcorrectness', '69904'),
(716, 'quiz', 'reviewmarks', '69904'),
(717, 'quiz', 'reviewspecificfeedback', '69904'),
(718, 'quiz', 'reviewgeneralfeedback', '69904'),
(719, 'quiz', 'reviewrightanswer', '69904'),
(720, 'quiz', 'reviewoverallfeedback', '4368'),
(721, 'quiz', 'showuserpicture', '0'),
(722, 'quiz', 'showuserpicture_adv', '0'),
(723, 'quiz', 'decimalpoints', '2'),
(724, 'quiz', 'decimalpoints_adv', '0'),
(725, 'quiz', 'questiondecimalpoints', '-1'),
(726, 'quiz', 'questiondecimalpoints_adv', '1'),
(727, 'quiz', 'showblocks', '0'),
(728, 'quiz', 'showblocks_adv', '1'),
(729, 'quiz', 'password', ''),
(730, 'quiz', 'password_adv', '1'),
(731, 'quiz', 'subnet', ''),
(732, 'quiz', 'subnet_adv', '1'),
(733, 'quiz', 'delay1', '0'),
(734, 'quiz', 'delay1_adv', '1'),
(735, 'quiz', 'delay2', '0'),
(736, 'quiz', 'delay2_adv', '1'),
(737, 'quiz', 'browsersecurity', '-'),
(738, 'quiz', 'browsersecurity_adv', '1'),
(739, 'resource', 'framesize', '130'),
(740, 'resource', 'requiremodintro', '1'),
(741, 'resource', 'displayoptions', '0,1,4,5,6'),
(742, 'resource', 'printheading', '0'),
(743, 'resource', 'printheading_adv', '0'),
(744, 'resource', 'printintro', '1'),
(745, 'resource', 'printintro_adv', '0'),
(746, 'resource', 'display', '0'),
(747, 'resource', 'display_adv', '0'),
(748, 'resource', 'showsize', '0'),
(749, 'resource', 'showsize_adv', '0'),
(750, 'resource', 'showtype', '0'),
(751, 'resource', 'showtype_adv', '0'),
(752, 'resource', 'popupwidth', '620'),
(753, 'resource', 'popupwidth_adv', '1'),
(754, 'resource', 'popupheight', '450'),
(755, 'resource', 'popupheight_adv', '1'),
(756, 'resource', 'filterfiles', '0'),
(757, 'resource', 'filterfiles_adv', '1'),
(758, 'scorm', 'displaycoursestructure', '0'),
(759, 'scorm', 'displaycoursestructure_adv', '0'),
(760, 'scorm', 'popup', '0'),
(761, 'scorm', 'popup_adv', '0'),
(762, 'scorm', 'framewidth', '100'),
(763, 'scorm', 'framewidth_adv', '1'),
(764, 'scorm', 'frameheight', '500'),
(765, 'scorm', 'frameheight_adv', '1'),
(766, 'scorm', 'winoptgrp_adv', '1'),
(767, 'scorm', 'resizable', '0'),
(768, 'scorm', 'scrollbars', '0'),
(769, 'scorm', 'directories', '0'),
(770, 'scorm', 'location', '0'),
(771, 'scorm', 'menubar', '0'),
(772, 'scorm', 'toolbar', '0'),
(773, 'scorm', 'status', '0'),
(774, 'scorm', 'skipview', '0'),
(775, 'scorm', 'skipview_adv', '1'),
(776, 'scorm', 'hidebrowse', '0'),
(777, 'scorm', 'hidebrowse_adv', '1'),
(778, 'scorm', 'hidetoc', '0'),
(779, 'scorm', 'hidetoc_adv', '1'),
(780, 'scorm', 'hidenav', '0'),
(781, 'scorm', 'hidenav_adv', '0'),
(782, 'scorm', 'grademethod', '1'),
(783, 'scorm', 'grademethod_adv', '0'),
(784, 'scorm', 'maxgrade', '100'),
(785, 'scorm', 'maxgrade_adv', '0'),
(786, 'scorm', 'maxattempt', '0'),
(787, 'scorm', 'maxattempt_adv', '0'),
(788, 'scorm', 'whatgrade', '0'),
(789, 'scorm', 'whatgrade_adv', '0'),
(790, 'scorm', 'displayattemptstatus', '1'),
(791, 'scorm', 'displayattemptstatus_adv', '0'),
(792, 'scorm', 'forcecompleted', '0'),
(793, 'scorm', 'forcecompleted_adv', '1'),
(794, 'scorm', 'forcenewattempt', '0'),
(795, 'scorm', 'forcenewattempt_adv', '1'),
(796, 'scorm', 'lastattemptlock', '0'),
(797, 'scorm', 'lastattemptlock_adv', '1'),
(798, 'scorm', 'auto', '0'),
(799, 'scorm', 'auto_adv', '1'),
(800, 'scorm', 'updatefreq', '0'),
(801, 'scorm', 'updatefreq_adv', '1'),
(802, 'scorm', 'allowtypeexternal', '0'),
(803, 'scorm', 'allowtypelocalsync', '0'),
(804, 'scorm', 'allowtypeimsrepository', '0'),
(805, 'scorm', 'allowtypeexternalaicc', '0'),
(806, 'scorm', 'allowaicchacp', '0'),
(807, 'scorm', 'aicchacptimeout', '30'),
(808, 'scorm', 'aicchacpkeepsessiondata', '1'),
(809, 'scorm', 'forcejavascript', '1'),
(810, 'scorm', 'allowapidebug', '0'),
(811, 'scorm', 'apidebugmask', '.*'),
(812, 'url', 'framesize', '130'),
(813, 'url', 'requiremodintro', '1'),
(814, 'url', 'secretphrase', ''),
(815, 'url', 'rolesinparams', '0'),
(816, 'url', 'displayoptions', '0,1,5,6'),
(817, 'url', 'printheading', '0'),
(818, 'url', 'printheading_adv', '0'),
(819, 'url', 'printintro', '1'),
(820, 'url', 'printintro_adv', '0'),
(821, 'url', 'display', '0'),
(822, 'url', 'display_adv', '0'),
(823, 'url', 'popupwidth', '620'),
(824, 'url', 'popupwidth_adv', '1'),
(825, 'url', 'popupheight', '450'),
(826, 'url', 'popupheight_adv', '1'),
(827, 'workshop', 'grade', '80'),
(828, 'workshop', 'gradinggrade', '20'),
(829, 'workshop', 'gradedecimals', '0'),
(830, 'workshop', 'maxbytes', '0'),
(831, 'workshop', 'strategy', 'accumulative'),
(832, 'workshop', 'examplesmode', '0'),
(833, 'workshopallocation_random', 'numofreviews', '5'),
(834, 'workshopform_numerrors', 'grade0', 'No'),
(835, 'workshopform_numerrors', 'grade1', 'Yes'),
(836, 'workshopeval_best', 'comparison', '5'),
(837, 'assignsubmission_file', 'default', '1'),
(838, 'assignsubmission_file', 'maxbytes', '1048576'),
(839, 'assignsubmission_onlinetext', 'default', '0'),
(840, 'assignsubmission_comments', 'default', '0'),
(841, 'assignfeedback_comments', 'default', '1'),
(842, 'assignfeedback_file', 'default', '0'),
(843, 'assignfeedback_offline', 'default', '0'),
(844, 'enrol_cohort', 'roleid', '5'),
(845, 'enrol_cohort', 'unenrolaction', '0'),
(846, 'enrol_database', 'defaultrole', '5'),
(847, 'enrol_database', 'defaultcategory', '1'),
(848, 'enrol_flatfile', 'map_1', 'manager'),
(849, 'enrol_flatfile', 'map_2', 'coursecreator'),
(850, 'enrol_flatfile', 'map_3', 'editingteacher'),
(851, 'enrol_flatfile', 'map_4', 'teacher'),
(852, 'enrol_flatfile', 'map_5', 'student'),
(853, 'enrol_flatfile', 'map_6', 'guest'),
(854, 'enrol_flatfile', 'map_7', 'user'),
(855, 'enrol_flatfile', 'map_8', 'frontpage'),
(856, 'enrol_imsenterprise', 'imsrolemap01', '5'),
(857, 'enrol_imsenterprise', 'imsrolemap02', '3'),
(858, 'enrol_imsenterprise', 'imsrolemap03', '3'),
(859, 'enrol_imsenterprise', 'imsrolemap04', '5'),
(860, 'enrol_imsenterprise', 'imsrolemap05', '0'),
(861, 'enrol_imsenterprise', 'imsrolemap06', '4'),
(862, 'enrol_imsenterprise', 'imsrolemap07', '0'),
(863, 'enrol_imsenterprise', 'imsrolemap08', '4'),
(864, 'enrol_manual', 'roleid', '5'),
(865, 'enrol_meta', 'nosyncroleids', ''),
(866, 'enrol_meta', 'syncall', '1'),
(867, 'enrol_meta', 'unenrolaction', '0'),
(868, 'enrol_mnet', 'roleid', '5'),
(869, 'enrol_mnet', 'roleid_adv', '1'),
(870, 'enrol_paypal', 'roleid', '5'),
(871, 'enrol_self', 'roleid', '5'),
(872, 'filter_urltolink', 'formats', '0'),
(873, 'filter_urltolink', 'embedimages', '1'),
(874, 'filter_emoticon', 'formats', '1,4,0'),
(876, 'enrol_ldap', 'objectclass', '(objectClass=*)');

-- --------------------------------------------------------

--
-- Table structure for table `mdl_context`
--

CREATE TABLE IF NOT EXISTS `mdl_context` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `contextlevel` bigint(10) NOT NULL DEFAULT '0',
  `instanceid` bigint(10) NOT NULL DEFAULT '0',
  `path` varchar(255) DEFAULT NULL,
  `depth` tinyint(2) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_cont_conins_uix` (`contextlevel`,`instanceid`),
  KEY `mdl_cont_ins_ix` (`instanceid`),
  KEY `mdl_cont_pat_ix` (`path`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='one of these must be set' AUTO_INCREMENT=60 ;

--
-- Dumping data for table `mdl_context`
--

INSERT INTO `mdl_context` (`id`, `contextlevel`, `instanceid`, `path`, `depth`) VALUES
(1, 10, 0, '/1', 1),
(2, 50, 1, '/1/2', 2),
(3, 40, 1, '/1/3', 2),
(4, 30, 1, '/1/4', 2),
(5, 30, 2, '/1/5', 2),
(6, 80, 1, '/1/2/6', 3),
(7, 80, 2, '/1/2/7', 3),
(8, 80, 3, '/1/2/8', 3),
(9, 80, 4, '/1/9', 2),
(10, 80, 5, '/1/10', 2),
(11, 80, 6, '/1/11', 2),
(12, 80, 7, '/1/12', 2),
(13, 80, 8, '/1/13', 2),
(14, 80, 9, '/1/14', 2),
(20, 30, 3, '/1/20', 2),
(21, 30, 4, '/1/21', 2),
(22, 30, 5, '/1/22', 2),
(43, 50, 5, '/1/3/43', 3),
(44, 80, 22, '/1/3/43/44', 4),
(45, 80, 23, '/1/3/43/45', 4),
(46, 80, 24, '/1/3/43/46', 4),
(47, 80, 25, '/1/3/43/47', 4),
(48, 70, 11, '/1/3/43/48', 4),
(50, 70, 13, '/1/3/43/50', 4),
(51, 70, 14, '/1/3/43/51', 4),
(52, 70, 15, '/1/3/43/52', 4),
(53, 50, 6, '/1/3/53', 3),
(54, 80, 26, '/1/3/53/54', 4),
(55, 80, 27, '/1/3/53/55', 4),
(56, 80, 28, '/1/3/53/56', 4),
(57, 80, 29, '/1/3/53/57', 4),
(58, 70, 16, '/1/3/53/58', 4),
(59, 70, 17, '/1/3/53/59', 4);

-- --------------------------------------------------------

--
-- Table structure for table `mdl_context_temp`
--

CREATE TABLE IF NOT EXISTS `mdl_context_temp` (
  `id` bigint(10) NOT NULL,
  `path` varchar(255) NOT NULL DEFAULT '',
  `depth` tinyint(2) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Used by build_context_path() in upgrade and cron to keep con';

-- --------------------------------------------------------

--
-- Table structure for table `mdl_course`
--

CREATE TABLE IF NOT EXISTS `mdl_course` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `category` bigint(10) NOT NULL DEFAULT '0',
  `sortorder` bigint(10) NOT NULL DEFAULT '0',
  `fullname` varchar(254) NOT NULL DEFAULT '',
  `shortname` varchar(255) NOT NULL DEFAULT '',
  `idnumber` varchar(100) NOT NULL DEFAULT '',
  `summary` longtext,
  `summaryformat` tinyint(2) NOT NULL DEFAULT '0',
  `format` varchar(21) NOT NULL DEFAULT 'topics',
  `showgrades` tinyint(2) NOT NULL DEFAULT '1',
  `sectioncache` longtext,
  `modinfo` longtext,
  `newsitems` mediumint(5) NOT NULL DEFAULT '1',
  `startdate` bigint(10) NOT NULL DEFAULT '0',
  `marker` bigint(10) NOT NULL DEFAULT '0',
  `maxbytes` bigint(10) NOT NULL DEFAULT '0',
  `legacyfiles` smallint(4) NOT NULL DEFAULT '0',
  `showreports` smallint(4) NOT NULL DEFAULT '0',
  `visible` tinyint(1) NOT NULL DEFAULT '1',
  `visibleold` tinyint(1) NOT NULL DEFAULT '1',
  `groupmode` smallint(4) NOT NULL DEFAULT '0',
  `groupmodeforce` smallint(4) NOT NULL DEFAULT '0',
  `defaultgroupingid` bigint(10) NOT NULL DEFAULT '0',
  `lang` varchar(30) NOT NULL DEFAULT '',
  `theme` varchar(50) NOT NULL DEFAULT '',
  `timecreated` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `requested` tinyint(1) NOT NULL DEFAULT '0',
  `enablecompletion` tinyint(1) NOT NULL DEFAULT '0',
  `completionstartonenrol` tinyint(1) NOT NULL DEFAULT '0',
  `completionnotify` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_cour_cat_ix` (`category`),
  KEY `mdl_cour_idn_ix` (`idnumber`),
  KEY `mdl_cour_sho_ix` (`shortname`),
  KEY `mdl_cour_sor_ix` (`sortorder`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Central course table' AUTO_INCREMENT=7 ;

--
-- Dumping data for table `mdl_course`
--

INSERT INTO `mdl_course` (`id`, `category`, `sortorder`, `fullname`, `shortname`, `idnumber`, `summary`, `summaryformat`, `format`, `showgrades`, `sectioncache`, `modinfo`, `newsitems`, `startdate`, `marker`, `maxbytes`, `legacyfiles`, `showreports`, `visible`, `visibleold`, `groupmode`, `groupmodeforce`, `defaultgroupingid`, `lang`, `theme`, `timecreated`, `timemodified`, `requested`, `enablecompletion`, `completionstartonenrol`, `completionnotify`) VALUES
(1, 0, 1, 'ssss', 'sss', '', '', 0, 'site', 1, 'a:2:{i:0;O:8:"stdClass":2:{s:2:"id";s:2:"12";s:4:"name";N;}i:1;O:8:"stdClass":2:{s:2:"id";s:2:"13";s:4:"name";N;}}', 'a:0:{}', 3, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, '', '', 1365445898, 1365449981, 0, 0, 0, 0),
(5, 1, 10002, 'W', 'W', '', '', 1, 'weeks', 1, 'a:11:{i:0;O:8:"stdClass":2:{s:2:"id";s:2:"36";s:4:"name";N;}i:1;O:8:"stdClass":2:{s:2:"id";s:2:"37";s:4:"name";N;}i:2;O:8:"stdClass":2:{s:2:"id";s:2:"38";s:4:"name";N;}i:3;O:8:"stdClass":2:{s:2:"id";s:2:"39";s:4:"name";N;}i:4;O:8:"stdClass":2:{s:2:"id";s:2:"40";s:4:"name";N;}i:5;O:8:"stdClass":2:{s:2:"id";s:2:"41";s:4:"name";N;}i:6;O:8:"stdClass":2:{s:2:"id";s:2:"42";s:4:"name";N;}i:7;O:8:"stdClass":2:{s:2:"id";s:2:"43";s:4:"name";N;}i:8;O:8:"stdClass":2:{s:2:"id";s:2:"44";s:4:"name";N;}i:9;O:8:"stdClass":2:{s:2:"id";s:2:"45";s:4:"name";N;}i:10;O:8:"stdClass":2:{s:2:"id";s:2:"46";s:4:"name";N;}}', 'a:4:{i:11;O:8:"stdClass":10:{s:2:"id";s:1:"4";s:2:"cm";s:2:"11";s:3:"mod";s:5:"forum";s:7:"section";s:1:"0";s:9:"sectionid";s:2:"36";s:6:"module";s:1:"9";s:5:"added";s:10:"1365625815";s:7:"visible";s:1:"1";s:10:"visibleold";s:1:"1";s:4:"name";s:10:"News forum";}i:13;O:8:"stdClass":10:{s:2:"id";s:1:"3";s:2:"cm";s:2:"13";s:3:"mod";s:11:"attforblock";s:7:"section";s:1:"1";s:9:"sectionid";s:2:"37";s:6:"module";s:2:"23";s:5:"added";s:10:"1365626092";s:7:"visible";s:1:"1";s:10:"visibleold";s:1:"1";s:4:"name";s:10:"Attendance";}i:14;O:8:"stdClass":10:{s:2:"id";s:1:"4";s:2:"cm";s:2:"14";s:3:"mod";s:11:"attforblock";s:7:"section";s:1:"3";s:9:"sectionid";s:2:"39";s:6:"module";s:2:"23";s:5:"added";s:10:"1365626287";s:7:"visible";s:1:"1";s:10:"visibleold";s:1:"1";s:4:"name";s:10:"Attendance";}i:15;O:8:"stdClass":10:{s:2:"id";s:1:"5";s:2:"cm";s:2:"15";s:3:"mod";s:11:"attforblock";s:7:"section";s:1:"6";s:9:"sectionid";s:2:"42";s:6:"module";s:2:"23";s:5:"added";s:10:"1365654231";s:7:"visible";s:1:"1";s:10:"visibleold";s:1:"1";s:4:"name";s:10:"Attendance";}}', 5, 1365631200, 0, 8388608, 0, 0, 1, 1, 0, 0, 0, '', '', 1365625776, 1365625776, 0, 0, 0, 0),
(6, 1, 10001, 'T', 't', '', '', 1, 'weeks', 1, 'a:11:{i:0;O:8:"stdClass":2:{s:2:"id";s:2:"47";s:4:"name";N;}i:1;O:8:"stdClass":2:{s:2:"id";s:2:"48";s:4:"name";N;}i:2;O:8:"stdClass":2:{s:2:"id";s:2:"49";s:4:"name";N;}i:3;O:8:"stdClass":2:{s:2:"id";s:2:"50";s:4:"name";N;}i:4;O:8:"stdClass":2:{s:2:"id";s:2:"51";s:4:"name";N;}i:5;O:8:"stdClass":2:{s:2:"id";s:2:"52";s:4:"name";N;}i:6;O:8:"stdClass":2:{s:2:"id";s:2:"53";s:4:"name";N;}i:7;O:8:"stdClass":2:{s:2:"id";s:2:"54";s:4:"name";N;}i:8;O:8:"stdClass":2:{s:2:"id";s:2:"55";s:4:"name";N;}i:9;O:8:"stdClass":2:{s:2:"id";s:2:"56";s:4:"name";N;}i:10;O:8:"stdClass":2:{s:2:"id";s:2:"57";s:4:"name";N;}}', 'a:2:{i:16;O:8:"stdClass":10:{s:2:"id";s:1:"5";s:2:"cm";s:2:"16";s:3:"mod";s:5:"forum";s:7:"section";s:1:"0";s:9:"sectionid";s:2:"47";s:6:"module";s:1:"9";s:5:"added";s:10:"1365654317";s:7:"visible";s:1:"1";s:10:"visibleold";s:1:"1";s:4:"name";s:10:"News forum";}i:17;O:8:"stdClass":10:{s:2:"id";s:1:"6";s:2:"cm";s:2:"17";s:3:"mod";s:11:"attforblock";s:7:"section";s:1:"1";s:9:"sectionid";s:2:"48";s:6:"module";s:2:"23";s:5:"added";s:10:"1365654336";s:7:"visible";s:1:"1";s:10:"visibleold";s:1:"1";s:4:"name";s:10:"Attendance";}}', 5, 1365717600, 0, 2097152, 0, 0, 1, 1, 0, 0, 0, '', '', 1365654241, 1365654241, 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `mdl_course_categories`
--

CREATE TABLE IF NOT EXISTS `mdl_course_categories` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  `idnumber` varchar(100) DEFAULT NULL,
  `description` longtext,
  `descriptionformat` tinyint(2) NOT NULL DEFAULT '0',
  `parent` bigint(10) NOT NULL DEFAULT '0',
  `sortorder` bigint(10) NOT NULL DEFAULT '0',
  `coursecount` bigint(10) NOT NULL DEFAULT '0',
  `visible` tinyint(1) NOT NULL DEFAULT '1',
  `visibleold` tinyint(1) NOT NULL DEFAULT '1',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `depth` bigint(10) NOT NULL DEFAULT '0',
  `path` varchar(255) NOT NULL DEFAULT '',
  `theme` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_courcate_par_ix` (`parent`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Course categories' AUTO_INCREMENT=2 ;

--
-- Dumping data for table `mdl_course_categories`
--

INSERT INTO `mdl_course_categories` (`id`, `name`, `idnumber`, `description`, `descriptionformat`, `parent`, `sortorder`, `coursecount`, `visible`, `visibleold`, `timemodified`, `depth`, `path`, `theme`) VALUES
(1, 'Miscellaneous', NULL, NULL, 0, 0, 10000, 2, 1, 1, 1365445898, 1, '/1', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `mdl_course_completions`
--

CREATE TABLE IF NOT EXISTS `mdl_course_completions` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `course` bigint(10) NOT NULL DEFAULT '0',
  `timeenrolled` bigint(10) NOT NULL DEFAULT '0',
  `timestarted` bigint(10) NOT NULL DEFAULT '0',
  `timecompleted` bigint(10) DEFAULT NULL,
  `reaggregate` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_courcomp_usecou_uix` (`userid`,`course`),
  KEY `mdl_courcomp_use_ix` (`userid`),
  KEY `mdl_courcomp_cou_ix` (`course`),
  KEY `mdl_courcomp_tim_ix` (`timecompleted`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Course completion records' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_course_completion_aggr_methd`
--

CREATE TABLE IF NOT EXISTS `mdl_course_completion_aggr_methd` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `course` bigint(10) NOT NULL DEFAULT '0',
  `criteriatype` bigint(10) DEFAULT NULL,
  `method` tinyint(1) NOT NULL DEFAULT '0',
  `value` decimal(10,5) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_courcompaggrmeth_coucr_uix` (`course`,`criteriatype`),
  KEY `mdl_courcompaggrmeth_cou_ix` (`course`),
  KEY `mdl_courcompaggrmeth_cri_ix` (`criteriatype`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Course completion aggregation methods for criteria' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_course_completion_criteria`
--

CREATE TABLE IF NOT EXISTS `mdl_course_completion_criteria` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `course` bigint(10) NOT NULL DEFAULT '0',
  `criteriatype` bigint(10) NOT NULL DEFAULT '0',
  `module` varchar(100) DEFAULT NULL,
  `moduleinstance` bigint(10) DEFAULT NULL,
  `courseinstance` bigint(10) DEFAULT NULL,
  `enrolperiod` bigint(10) DEFAULT NULL,
  `timeend` bigint(10) DEFAULT NULL,
  `gradepass` decimal(10,5) DEFAULT NULL,
  `role` bigint(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_courcompcrit_cou_ix` (`course`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Course completion criteria' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_course_completion_crit_compl`
--

CREATE TABLE IF NOT EXISTS `mdl_course_completion_crit_compl` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `course` bigint(10) NOT NULL DEFAULT '0',
  `criteriaid` bigint(10) NOT NULL DEFAULT '0',
  `gradefinal` decimal(10,5) DEFAULT NULL,
  `unenroled` bigint(10) DEFAULT NULL,
  `timecompleted` bigint(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_courcompcritcomp_useco_uix` (`userid`,`course`,`criteriaid`),
  KEY `mdl_courcompcritcomp_use_ix` (`userid`),
  KEY `mdl_courcompcritcomp_cou_ix` (`course`),
  KEY `mdl_courcompcritcomp_cri_ix` (`criteriaid`),
  KEY `mdl_courcompcritcomp_tim_ix` (`timecompleted`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Course completion user records' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_course_format_options`
--

CREATE TABLE IF NOT EXISTS `mdl_course_format_options` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `courseid` bigint(10) NOT NULL,
  `format` varchar(21) NOT NULL DEFAULT '',
  `sectionid` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(100) NOT NULL DEFAULT '',
  `value` longtext,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_courformopti_couforsec_uix` (`courseid`,`format`,`sectionid`,`name`),
  KEY `mdl_courformopti_cou_ix` (`courseid`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Stores format-specific options for the course or course sect' AUTO_INCREMENT=17 ;

--
-- Dumping data for table `mdl_course_format_options`
--

INSERT INTO `mdl_course_format_options` (`id`, `courseid`, `format`, `sectionid`, `name`, `value`) VALUES
(1, 1, 'site', 0, 'numsections', '1'),
(11, 5, 'weeks', 0, 'numsections', '10'),
(12, 5, 'weeks', 0, 'hiddensections', '0'),
(13, 5, 'weeks', 0, 'coursedisplay', '0'),
(14, 6, 'weeks', 0, 'numsections', '10'),
(15, 6, 'weeks', 0, 'hiddensections', '0'),
(16, 6, 'weeks', 0, 'coursedisplay', '0');

-- --------------------------------------------------------

--
-- Table structure for table `mdl_course_modules`
--

CREATE TABLE IF NOT EXISTS `mdl_course_modules` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `course` bigint(10) NOT NULL DEFAULT '0',
  `module` bigint(10) NOT NULL DEFAULT '0',
  `instance` bigint(10) NOT NULL DEFAULT '0',
  `section` bigint(10) NOT NULL DEFAULT '0',
  `idnumber` varchar(100) DEFAULT NULL,
  `added` bigint(10) NOT NULL DEFAULT '0',
  `score` smallint(4) NOT NULL DEFAULT '0',
  `indent` mediumint(5) NOT NULL DEFAULT '0',
  `visible` tinyint(1) NOT NULL DEFAULT '1',
  `visibleold` tinyint(1) NOT NULL DEFAULT '1',
  `groupmode` smallint(4) NOT NULL DEFAULT '0',
  `groupingid` bigint(10) NOT NULL DEFAULT '0',
  `groupmembersonly` smallint(4) NOT NULL DEFAULT '0',
  `completion` tinyint(1) NOT NULL DEFAULT '0',
  `completiongradeitemnumber` bigint(10) DEFAULT NULL,
  `completionview` tinyint(1) NOT NULL DEFAULT '0',
  `completionexpected` bigint(10) NOT NULL DEFAULT '0',
  `availablefrom` bigint(10) NOT NULL DEFAULT '0',
  `availableuntil` bigint(10) NOT NULL DEFAULT '0',
  `showavailability` tinyint(1) NOT NULL DEFAULT '0',
  `showdescription` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_courmodu_vis_ix` (`visible`),
  KEY `mdl_courmodu_cou_ix` (`course`),
  KEY `mdl_courmodu_mod_ix` (`module`),
  KEY `mdl_courmodu_ins_ix` (`instance`),
  KEY `mdl_courmodu_idncou_ix` (`idnumber`,`course`),
  KEY `mdl_courmodu_gro_ix` (`groupingid`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='course_modules table retrofitted from MySQL' AUTO_INCREMENT=18 ;

--
-- Dumping data for table `mdl_course_modules`
--

INSERT INTO `mdl_course_modules` (`id`, `course`, `module`, `instance`, `section`, `idnumber`, `added`, `score`, `indent`, `visible`, `visibleold`, `groupmode`, `groupingid`, `groupmembersonly`, `completion`, `completiongradeitemnumber`, `completionview`, `completionexpected`, `availablefrom`, `availableuntil`, `showavailability`, `showdescription`) VALUES
(11, 5, 9, 4, 36, NULL, 1365625815, 0, 0, 1, 1, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 0),
(13, 5, 23, 3, 37, NULL, 1365626092, 0, 0, 1, 1, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 0),
(14, 5, 23, 4, 39, NULL, 1365626287, 0, 0, 1, 1, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 0),
(15, 5, 23, 5, 42, NULL, 1365654231, 0, 0, 1, 1, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 0),
(16, 6, 9, 5, 47, NULL, 1365654317, 0, 0, 1, 1, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 0),
(17, 6, 23, 6, 48, NULL, 1365654336, 0, 0, 1, 1, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `mdl_course_modules_availability`
--

CREATE TABLE IF NOT EXISTS `mdl_course_modules_availability` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `coursemoduleid` bigint(10) NOT NULL,
  `sourcecmid` bigint(10) DEFAULT NULL,
  `requiredcompletion` tinyint(1) DEFAULT NULL,
  `gradeitemid` bigint(10) DEFAULT NULL,
  `grademin` decimal(10,5) DEFAULT NULL,
  `grademax` decimal(10,5) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_courmoduavai_cou_ix` (`coursemoduleid`),
  KEY `mdl_courmoduavai_sou_ix` (`sourcecmid`),
  KEY `mdl_courmoduavai_gra_ix` (`gradeitemid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Table stores conditions that affect whether a module/activit' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_course_modules_avail_fields`
--

CREATE TABLE IF NOT EXISTS `mdl_course_modules_avail_fields` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `coursemoduleid` bigint(10) NOT NULL,
  `userfield` varchar(50) DEFAULT NULL,
  `customfieldid` bigint(10) DEFAULT NULL,
  `operator` varchar(20) NOT NULL DEFAULT '',
  `value` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `mdl_courmoduavaifiel_cou_ix` (`coursemoduleid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Stores user field conditions that affect whether an activity' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_course_modules_completion`
--

CREATE TABLE IF NOT EXISTS `mdl_course_modules_completion` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `coursemoduleid` bigint(10) NOT NULL,
  `userid` bigint(10) NOT NULL,
  `completionstate` tinyint(1) NOT NULL,
  `viewed` tinyint(1) DEFAULT NULL,
  `timemodified` bigint(10) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_courmoducomp_usecou_uix` (`userid`,`coursemoduleid`),
  KEY `mdl_courmoducomp_cou_ix` (`coursemoduleid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Stores the completion state (completed or not completed, etc' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_course_published`
--

CREATE TABLE IF NOT EXISTS `mdl_course_published` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `huburl` varchar(255) DEFAULT NULL,
  `courseid` bigint(10) NOT NULL,
  `timepublished` bigint(10) NOT NULL,
  `enrollable` tinyint(1) NOT NULL DEFAULT '1',
  `hubcourseid` bigint(10) NOT NULL,
  `status` tinyint(1) DEFAULT '0',
  `timechecked` bigint(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Information about how and when an local courses were publish' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_course_request`
--

CREATE TABLE IF NOT EXISTS `mdl_course_request` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `fullname` varchar(254) NOT NULL DEFAULT '',
  `shortname` varchar(100) NOT NULL DEFAULT '',
  `summary` longtext NOT NULL,
  `summaryformat` tinyint(2) NOT NULL DEFAULT '0',
  `category` bigint(10) NOT NULL DEFAULT '0',
  `reason` longtext NOT NULL,
  `requester` bigint(10) NOT NULL DEFAULT '0',
  `password` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `mdl_courrequ_sho_ix` (`shortname`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='course requests' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_course_sections`
--

CREATE TABLE IF NOT EXISTS `mdl_course_sections` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `course` bigint(10) NOT NULL DEFAULT '0',
  `section` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) DEFAULT NULL,
  `summary` longtext,
  `summaryformat` tinyint(2) NOT NULL DEFAULT '0',
  `sequence` longtext,
  `visible` tinyint(1) NOT NULL DEFAULT '1',
  `availablefrom` bigint(10) NOT NULL DEFAULT '0',
  `availableuntil` bigint(10) NOT NULL DEFAULT '0',
  `showavailability` tinyint(1) NOT NULL DEFAULT '0',
  `groupingid` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_coursect_cousec_uix` (`course`,`section`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='to define the sections for each course' AUTO_INCREMENT=58 ;

--
-- Dumping data for table `mdl_course_sections`
--

INSERT INTO `mdl_course_sections` (`id`, `course`, `section`, `name`, `summary`, `summaryformat`, `sequence`, `visible`, `availablefrom`, `availableuntil`, `showavailability`, `groupingid`) VALUES
(12, 1, 0, NULL, '', 1, '', 1, 0, 0, 0, 0),
(13, 1, 1, NULL, '', 1, '', 1, 0, 0, 0, 0),
(36, 5, 0, NULL, '', 1, '11', 1, 0, 0, 0, 0),
(37, 5, 1, NULL, '', 1, '13', 1, 0, 0, 0, 0),
(38, 5, 2, NULL, '', 1, '', 1, 0, 0, 0, 0),
(39, 5, 3, NULL, '', 1, '14', 1, 0, 0, 0, 0),
(40, 5, 4, NULL, '', 1, '', 1, 0, 0, 0, 0),
(41, 5, 5, NULL, '', 1, '', 1, 0, 0, 0, 0),
(42, 5, 6, NULL, '', 1, '15', 1, 0, 0, 0, 0),
(43, 5, 7, NULL, '', 1, '', 1, 0, 0, 0, 0),
(44, 5, 8, NULL, '', 1, '', 1, 0, 0, 0, 0),
(45, 5, 9, NULL, '', 1, '', 1, 0, 0, 0, 0),
(46, 5, 10, NULL, '', 1, '', 1, 0, 0, 0, 0),
(47, 6, 0, NULL, '', 1, '16', 1, 0, 0, 0, 0),
(48, 6, 1, NULL, '', 1, '17', 1, 0, 0, 0, 0),
(49, 6, 2, NULL, '', 1, '', 1, 0, 0, 0, 0),
(50, 6, 3, NULL, '', 1, '', 1, 0, 0, 0, 0),
(51, 6, 4, NULL, '', 1, '', 1, 0, 0, 0, 0),
(52, 6, 5, NULL, '', 1, '', 1, 0, 0, 0, 0),
(53, 6, 6, NULL, '', 1, '', 1, 0, 0, 0, 0),
(54, 6, 7, NULL, '', 1, '', 1, 0, 0, 0, 0),
(55, 6, 8, NULL, '', 1, '', 1, 0, 0, 0, 0),
(56, 6, 9, NULL, '', 1, '', 1, 0, 0, 0, 0),
(57, 6, 10, NULL, '', 1, '', 1, 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `mdl_course_sections_availability`
--

CREATE TABLE IF NOT EXISTS `mdl_course_sections_availability` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `coursesectionid` bigint(10) NOT NULL,
  `sourcecmid` bigint(10) DEFAULT NULL,
  `requiredcompletion` tinyint(1) DEFAULT NULL,
  `gradeitemid` bigint(10) DEFAULT NULL,
  `grademin` decimal(10,5) DEFAULT NULL,
  `grademax` decimal(10,5) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_coursectavai_cou_ix` (`coursesectionid`),
  KEY `mdl_coursectavai_sou_ix` (`sourcecmid`),
  KEY `mdl_coursectavai_gra_ix` (`gradeitemid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Completion or grade conditions that affect if a section is c' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_course_sections_avail_fields`
--

CREATE TABLE IF NOT EXISTS `mdl_course_sections_avail_fields` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `coursesectionid` bigint(10) NOT NULL,
  `userfield` varchar(50) DEFAULT NULL,
  `customfieldid` bigint(10) DEFAULT NULL,
  `operator` varchar(20) NOT NULL DEFAULT '',
  `value` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `mdl_coursectavaifiel_cou_ix` (`coursesectionid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Stores user field conditions that affect whether an activity' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_data`
--

CREATE TABLE IF NOT EXISTS `mdl_data` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `course` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `intro` longtext NOT NULL,
  `introformat` smallint(4) NOT NULL DEFAULT '0',
  `comments` smallint(4) NOT NULL DEFAULT '0',
  `timeavailablefrom` bigint(10) NOT NULL DEFAULT '0',
  `timeavailableto` bigint(10) NOT NULL DEFAULT '0',
  `timeviewfrom` bigint(10) NOT NULL DEFAULT '0',
  `timeviewto` bigint(10) NOT NULL DEFAULT '0',
  `requiredentries` int(8) NOT NULL DEFAULT '0',
  `requiredentriestoview` int(8) NOT NULL DEFAULT '0',
  `maxentries` int(8) NOT NULL DEFAULT '0',
  `rssarticles` smallint(4) NOT NULL DEFAULT '0',
  `singletemplate` longtext,
  `listtemplate` longtext,
  `listtemplateheader` longtext,
  `listtemplatefooter` longtext,
  `addtemplate` longtext,
  `rsstemplate` longtext,
  `rsstitletemplate` longtext,
  `csstemplate` longtext,
  `jstemplate` longtext,
  `asearchtemplate` longtext,
  `approval` smallint(4) NOT NULL DEFAULT '0',
  `scale` bigint(10) NOT NULL DEFAULT '0',
  `assessed` bigint(10) NOT NULL DEFAULT '0',
  `assesstimestart` bigint(10) NOT NULL DEFAULT '0',
  `assesstimefinish` bigint(10) NOT NULL DEFAULT '0',
  `defaultsort` bigint(10) NOT NULL DEFAULT '0',
  `defaultsortdir` smallint(4) NOT NULL DEFAULT '0',
  `editany` smallint(4) NOT NULL DEFAULT '0',
  `notification` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_data_cou_ix` (`course`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='all database activities' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_data_content`
--

CREATE TABLE IF NOT EXISTS `mdl_data_content` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `fieldid` bigint(10) NOT NULL DEFAULT '0',
  `recordid` bigint(10) NOT NULL DEFAULT '0',
  `content` longtext,
  `content1` longtext,
  `content2` longtext,
  `content3` longtext,
  `content4` longtext,
  PRIMARY KEY (`id`),
  KEY `mdl_datacont_rec_ix` (`recordid`),
  KEY `mdl_datacont_fie_ix` (`fieldid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='the content introduced in each record/fields' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_data_fields`
--

CREATE TABLE IF NOT EXISTS `mdl_data_fields` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `dataid` bigint(10) NOT NULL DEFAULT '0',
  `type` varchar(255) NOT NULL DEFAULT '',
  `name` varchar(255) NOT NULL DEFAULT '',
  `description` longtext NOT NULL,
  `param1` longtext,
  `param2` longtext,
  `param3` longtext,
  `param4` longtext,
  `param5` longtext,
  `param6` longtext,
  `param7` longtext,
  `param8` longtext,
  `param9` longtext,
  `param10` longtext,
  PRIMARY KEY (`id`),
  KEY `mdl_datafiel_typdat_ix` (`type`,`dataid`),
  KEY `mdl_datafiel_dat_ix` (`dataid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='every field available' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_data_records`
--

CREATE TABLE IF NOT EXISTS `mdl_data_records` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `groupid` bigint(10) NOT NULL DEFAULT '0',
  `dataid` bigint(10) NOT NULL DEFAULT '0',
  `timecreated` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `approved` smallint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_datareco_dat_ix` (`dataid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='every record introduced' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_enrol`
--

CREATE TABLE IF NOT EXISTS `mdl_enrol` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `enrol` varchar(20) NOT NULL DEFAULT '',
  `status` bigint(10) NOT NULL DEFAULT '0',
  `courseid` bigint(10) NOT NULL,
  `sortorder` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) DEFAULT NULL,
  `enrolperiod` bigint(10) DEFAULT '0',
  `enrolstartdate` bigint(10) DEFAULT '0',
  `enrolenddate` bigint(10) DEFAULT '0',
  `expirynotify` tinyint(1) DEFAULT '0',
  `expirythreshold` bigint(10) DEFAULT '0',
  `notifyall` tinyint(1) DEFAULT '0',
  `password` varchar(50) DEFAULT NULL,
  `cost` varchar(20) DEFAULT NULL,
  `currency` varchar(3) DEFAULT NULL,
  `roleid` bigint(10) DEFAULT '0',
  `customint1` bigint(10) DEFAULT NULL,
  `customint2` bigint(10) DEFAULT NULL,
  `customint3` bigint(10) DEFAULT NULL,
  `customint4` bigint(10) DEFAULT NULL,
  `customint5` bigint(10) DEFAULT NULL,
  `customint6` bigint(10) DEFAULT NULL,
  `customint7` bigint(10) DEFAULT NULL,
  `customint8` bigint(10) DEFAULT NULL,
  `customchar1` varchar(255) DEFAULT NULL,
  `customchar2` varchar(255) DEFAULT NULL,
  `customchar3` varchar(1333) DEFAULT NULL,
  `customdec1` decimal(12,7) DEFAULT NULL,
  `customdec2` decimal(12,7) DEFAULT NULL,
  `customtext1` longtext,
  `customtext2` longtext,
  `customtext3` longtext,
  `customtext4` longtext,
  `timecreated` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_enro_enr_ix` (`enrol`),
  KEY `mdl_enro_cou_ix` (`courseid`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Instances of enrolment plugins used in courses, fields marke' AUTO_INCREMENT=16 ;

--
-- Dumping data for table `mdl_enrol`
--

INSERT INTO `mdl_enrol` (`id`, `enrol`, `status`, `courseid`, `sortorder`, `name`, `enrolperiod`, `enrolstartdate`, `enrolenddate`, `expirynotify`, `expirythreshold`, `notifyall`, `password`, `cost`, `currency`, `roleid`, `customint1`, `customint2`, `customint3`, `customint4`, `customint5`, `customint6`, `customint7`, `customint8`, `customchar1`, `customchar2`, `customchar3`, `customdec1`, `customdec2`, `customtext1`, `customtext2`, `customtext3`, `customtext4`, `timecreated`, `timemodified`) VALUES
(10, 'manual', 0, 5, 0, NULL, 0, 0, 0, 0, 86400, 0, NULL, NULL, NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1365625777, 1365625777),
(11, 'guest', 1, 5, 1, NULL, 0, 0, 0, 0, 0, 0, '', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1365625777, 1365625777),
(12, 'self', 1, 5, 2, NULL, 0, 0, 0, 0, 86400, 0, NULL, NULL, NULL, 5, 0, 0, 0, 1, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1365625777, 1365625777),
(13, 'manual', 0, 6, 0, NULL, 0, 0, 0, 0, 86400, 0, NULL, NULL, NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1365654241, 1365654241),
(14, 'guest', 1, 6, 1, NULL, 0, 0, 0, 0, 0, 0, '', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1365654242, 1365654242),
(15, 'self', 1, 6, 2, NULL, 0, 0, 0, 0, 86400, 0, NULL, NULL, NULL, 5, 0, 0, 0, 1, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1365654242, 1365654242);

-- --------------------------------------------------------

--
-- Table structure for table `mdl_enrol_authorize`
--

CREATE TABLE IF NOT EXISTS `mdl_enrol_authorize` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `paymentmethod` varchar(6) NOT NULL DEFAULT 'cc',
  `refundinfo` smallint(4) NOT NULL DEFAULT '0',
  `ccname` varchar(255) NOT NULL DEFAULT '',
  `courseid` bigint(10) NOT NULL DEFAULT '0',
  `instanceid` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `transid` bigint(20) NOT NULL DEFAULT '0',
  `status` bigint(10) NOT NULL DEFAULT '0',
  `timecreated` bigint(10) NOT NULL DEFAULT '0',
  `settletime` bigint(10) NOT NULL DEFAULT '0',
  `amount` varchar(10) NOT NULL DEFAULT '',
  `currency` varchar(3) NOT NULL DEFAULT 'USD',
  PRIMARY KEY (`id`),
  KEY `mdl_enroauth_cou_ix` (`courseid`),
  KEY `mdl_enroauth_use_ix` (`userid`),
  KEY `mdl_enroauth_sta_ix` (`status`),
  KEY `mdl_enroauth_tra_ix` (`transid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Holds all known information about authorize.net transactions' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_enrol_authorize_refunds`
--

CREATE TABLE IF NOT EXISTS `mdl_enrol_authorize_refunds` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `orderid` bigint(10) NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `amount` varchar(10) NOT NULL DEFAULT '',
  `transid` bigint(20) DEFAULT '0',
  `settletime` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_enroauthrefu_tra_ix` (`transid`),
  KEY `mdl_enroauthrefu_ord_ix` (`orderid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Authorize.net refunds' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_enrol_flatfile`
--

CREATE TABLE IF NOT EXISTS `mdl_enrol_flatfile` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `action` varchar(30) NOT NULL DEFAULT '',
  `roleid` bigint(10) NOT NULL,
  `userid` bigint(10) NOT NULL,
  `courseid` bigint(10) NOT NULL,
  `timestart` bigint(10) NOT NULL DEFAULT '0',
  `timeend` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_enroflat_cou_ix` (`courseid`),
  KEY `mdl_enroflat_use_ix` (`userid`),
  KEY `mdl_enroflat_rol_ix` (`roleid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='enrol_flatfile table retrofitted from MySQL' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_enrol_paypal`
--

CREATE TABLE IF NOT EXISTS `mdl_enrol_paypal` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `business` varchar(255) NOT NULL DEFAULT '',
  `receiver_email` varchar(255) NOT NULL DEFAULT '',
  `receiver_id` varchar(255) NOT NULL DEFAULT '',
  `item_name` varchar(255) NOT NULL DEFAULT '',
  `courseid` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `instanceid` bigint(10) NOT NULL DEFAULT '0',
  `memo` varchar(255) NOT NULL DEFAULT '',
  `tax` varchar(255) NOT NULL DEFAULT '',
  `option_name1` varchar(255) NOT NULL DEFAULT '',
  `option_selection1_x` varchar(255) NOT NULL DEFAULT '',
  `option_name2` varchar(255) NOT NULL DEFAULT '',
  `option_selection2_x` varchar(255) NOT NULL DEFAULT '',
  `payment_status` varchar(255) NOT NULL DEFAULT '',
  `pending_reason` varchar(255) NOT NULL DEFAULT '',
  `reason_code` varchar(30) NOT NULL DEFAULT '',
  `txn_id` varchar(255) NOT NULL DEFAULT '',
  `parent_txn_id` varchar(255) NOT NULL DEFAULT '',
  `payment_type` varchar(30) NOT NULL DEFAULT '',
  `timeupdated` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Holds all known information about PayPal transactions' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_event`
--

CREATE TABLE IF NOT EXISTS `mdl_event` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  `description` longtext NOT NULL,
  `format` smallint(4) NOT NULL DEFAULT '0',
  `courseid` bigint(10) NOT NULL DEFAULT '0',
  `groupid` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `repeatid` bigint(10) NOT NULL DEFAULT '0',
  `modulename` varchar(20) NOT NULL DEFAULT '',
  `instance` bigint(10) NOT NULL DEFAULT '0',
  `eventtype` varchar(20) NOT NULL DEFAULT '',
  `timestart` bigint(10) NOT NULL DEFAULT '0',
  `timeduration` bigint(10) NOT NULL DEFAULT '0',
  `visible` smallint(4) NOT NULL DEFAULT '1',
  `uuid` varchar(255) NOT NULL DEFAULT '',
  `sequence` bigint(10) NOT NULL DEFAULT '1',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `subscriptionid` bigint(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_even_cou_ix` (`courseid`),
  KEY `mdl_even_use_ix` (`userid`),
  KEY `mdl_even_tim_ix` (`timestart`),
  KEY `mdl_even_tim2_ix` (`timeduration`),
  KEY `mdl_even_grocouvisuse_ix` (`groupid`,`courseid`,`visible`,`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='For everything with a time associated to it' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_events_handlers`
--

CREATE TABLE IF NOT EXISTS `mdl_events_handlers` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `eventname` varchar(166) NOT NULL DEFAULT '',
  `component` varchar(166) NOT NULL DEFAULT '',
  `handlerfile` varchar(255) NOT NULL DEFAULT '',
  `handlerfunction` longtext,
  `schedule` varchar(255) DEFAULT NULL,
  `status` bigint(10) NOT NULL DEFAULT '0',
  `internal` tinyint(2) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_evenhand_evecom_uix` (`eventname`,`component`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='This table is for storing which components requests what typ' AUTO_INCREMENT=23 ;

--
-- Dumping data for table `mdl_events_handlers`
--

INSERT INTO `mdl_events_handlers` (`id`, `eventname`, `component`, `handlerfile`, `handlerfunction`, `schedule`, `status`, `internal`) VALUES
(1, 'portfolio_send', 'moodle', '/lib/portfolio.php', 's:22:"portfolio_handle_event";', 'cron', 0, 0),
(2, 'user_logout', 'mod_chat', '/mod/chat/lib.php', 's:16:"chat_user_logout";', 'instant', 0, 1),
(3, 'role_assigned', 'mod_forum', '/mod/forum/lib.php', 's:24:"forum_user_role_assigned";', 'instant', 0, 1),
(4, 'user_unenrolled', 'mod_forum', '/mod/forum/lib.php', 's:21:"forum_user_unenrolled";', 'instant', 0, 1),
(5, 'quiz_attempt_submitted', 'mod_quiz', '/mod/quiz/locallib.php', 's:30:"quiz_attempt_submitted_handler";', 'cron', 0, 1),
(6, 'quiz_attempt_overdue', 'mod_quiz', '/mod/quiz/locallib.php', 's:28:"quiz_attempt_overdue_handler";', 'cron', 0, 1),
(7, 'groups_member_added', 'mod_quiz', '/mod/quiz/locallib.php', 's:32:"quiz_groups_member_added_handler";', 'instant', 0, 1),
(8, 'groups_member_removed', 'mod_quiz', '/mod/quiz/locallib.php', 's:34:"quiz_groups_member_removed_handler";', 'instant', 0, 1),
(9, 'groups_members_removed', 'mod_quiz', '/mod/quiz/locallib.php', 's:35:"quiz_groups_members_removed_handler";', 'instant', 0, 1),
(10, 'groups_group_deleted', 'mod_quiz', '/mod/quiz/locallib.php', 's:33:"quiz_groups_group_deleted_handler";', 'instant', 0, 1),
(11, 'role_assigned', 'enrol_category', '/enrol/category/locallib.php', 'a:2:{i:0;s:22:"enrol_category_handler";i:1;s:13:"role_assigned";}', 'instant', 0, 1),
(12, 'role_unassigned', 'enrol_category', '/enrol/category/locallib.php', 'a:2:{i:0;s:22:"enrol_category_handler";i:1;s:15:"role_unassigned";}', 'instant', 0, 1),
(13, 'cohort_member_added', 'enrol_cohort', '/enrol/cohort/locallib.php', 'a:2:{i:0;s:20:"enrol_cohort_handler";i:1;s:12:"member_added";}', 'instant', 0, 1),
(14, 'cohort_member_removed', 'enrol_cohort', '/enrol/cohort/locallib.php', 'a:2:{i:0;s:20:"enrol_cohort_handler";i:1;s:14:"member_removed";}', 'instant', 0, 1),
(15, 'cohort_deleted', 'enrol_cohort', '/enrol/cohort/locallib.php', 'a:2:{i:0;s:20:"enrol_cohort_handler";i:1;s:7:"deleted";}', 'instant', 0, 1),
(16, 'role_assigned', 'enrol_meta', '/enrol/meta/locallib.php', 'a:2:{i:0;s:18:"enrol_meta_handler";i:1;s:13:"role_assigned";}', 'instant', 0, 1),
(17, 'role_unassigned', 'enrol_meta', '/enrol/meta/locallib.php', 'a:2:{i:0;s:18:"enrol_meta_handler";i:1;s:15:"role_unassigned";}', 'instant', 0, 1),
(18, 'user_enrolled', 'enrol_meta', '/enrol/meta/locallib.php', 'a:2:{i:0;s:18:"enrol_meta_handler";i:1;s:13:"user_enrolled";}', 'instant', 0, 1),
(19, 'user_unenrolled', 'enrol_meta', '/enrol/meta/locallib.php', 'a:2:{i:0;s:18:"enrol_meta_handler";i:1;s:15:"user_unenrolled";}', 'instant', 0, 1),
(20, 'user_enrol_modified', 'enrol_meta', '/enrol/meta/locallib.php', 'a:2:{i:0;s:18:"enrol_meta_handler";i:1;s:19:"user_enrol_modified";}', 'instant', 0, 1),
(21, 'course_deleted', 'enrol_meta', '/enrol/meta/locallib.php', 'a:2:{i:0;s:18:"enrol_meta_handler";i:1;s:14:"course_deleted";}', 'instant', 0, 1),
(22, 'workshop_viewed', 'workshopallocation_scheduled', '/mod/workshop/allocation/scheduled/lib.php', 's:44:"workshopallocation_scheduled_workshop_viewed";', 'instant', 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `mdl_events_queue`
--

CREATE TABLE IF NOT EXISTS `mdl_events_queue` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `eventdata` longtext NOT NULL,
  `stackdump` longtext,
  `userid` bigint(10) DEFAULT NULL,
  `timecreated` bigint(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_evenqueu_use_ix` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='This table is for storing queued events. It stores only one ' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_events_queue_handlers`
--

CREATE TABLE IF NOT EXISTS `mdl_events_queue_handlers` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `queuedeventid` bigint(10) NOT NULL,
  `handlerid` bigint(10) NOT NULL,
  `status` bigint(10) DEFAULT NULL,
  `errormessage` longtext,
  `timemodified` bigint(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_evenqueuhand_que_ix` (`queuedeventid`),
  KEY `mdl_evenqueuhand_han_ix` (`handlerid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='This is the list of queued handlers for processing. The even' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_event_subscriptions`
--

CREATE TABLE IF NOT EXISTS `mdl_event_subscriptions` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `url` varchar(255) NOT NULL DEFAULT '',
  `courseid` bigint(10) NOT NULL DEFAULT '0',
  `groupid` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `eventtype` varchar(20) NOT NULL DEFAULT '',
  `pollinterval` bigint(10) NOT NULL DEFAULT '0',
  `lastupdated` bigint(10) DEFAULT NULL,
  `name` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Tracks subscriptions to remote calendars.' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_external_functions`
--

CREATE TABLE IF NOT EXISTS `mdl_external_functions` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL DEFAULT '',
  `classname` varchar(100) NOT NULL DEFAULT '',
  `methodname` varchar(100) NOT NULL DEFAULT '',
  `classpath` varchar(255) DEFAULT NULL,
  `component` varchar(100) NOT NULL DEFAULT '',
  `capabilities` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_extefunc_nam_uix` (`name`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='list of all external functions' AUTO_INCREMENT=71 ;

--
-- Dumping data for table `mdl_external_functions`
--

INSERT INTO `mdl_external_functions` (`id`, `name`, `classname`, `methodname`, `classpath`, `component`, `capabilities`) VALUES
(1, 'moodle_group_create_groups', 'core_group_external', 'create_groups', 'group/externallib.php', 'moodle', 'moodle/course:managegroups'),
(2, 'core_group_create_groups', 'core_group_external', 'create_groups', 'group/externallib.php', 'moodle', 'moodle/course:managegroups'),
(3, 'moodle_group_get_groups', 'core_group_external', 'get_groups', 'group/externallib.php', 'moodle', 'moodle/course:managegroups'),
(4, 'core_group_get_groups', 'core_group_external', 'get_groups', 'group/externallib.php', 'moodle', 'moodle/course:managegroups'),
(5, 'moodle_group_get_course_groups', 'core_group_external', 'get_course_groups', 'group/externallib.php', 'moodle', 'moodle/course:managegroups'),
(6, 'core_group_get_course_groups', 'core_group_external', 'get_course_groups', 'group/externallib.php', 'moodle', 'moodle/course:managegroups'),
(7, 'moodle_group_delete_groups', 'core_group_external', 'delete_groups', 'group/externallib.php', 'moodle', 'moodle/course:managegroups'),
(8, 'core_group_delete_groups', 'core_group_external', 'delete_groups', 'group/externallib.php', 'moodle', 'moodle/course:managegroups'),
(9, 'moodle_group_get_groupmembers', 'core_group_external', 'get_group_members', 'group/externallib.php', 'moodle', 'moodle/course:managegroups'),
(10, 'core_group_get_group_members', 'core_group_external', 'get_group_members', 'group/externallib.php', 'moodle', 'moodle/course:managegroups'),
(11, 'moodle_group_add_groupmembers', 'core_group_external', 'add_group_members', 'group/externallib.php', 'moodle', 'moodle/course:managegroups'),
(12, 'core_group_add_group_members', 'core_group_external', 'add_group_members', 'group/externallib.php', 'moodle', 'moodle/course:managegroups'),
(13, 'moodle_group_delete_groupmembers', 'core_group_external', 'delete_group_members', 'group/externallib.php', 'moodle', 'moodle/course:managegroups'),
(14, 'core_group_delete_group_members', 'core_group_external', 'delete_group_members', 'group/externallib.php', 'moodle', 'moodle/course:managegroups'),
(15, 'core_group_create_groupings', 'core_group_external', 'create_groupings', 'group/externallib.php', 'moodle', ''),
(16, 'core_group_update_groupings', 'core_group_external', 'update_groupings', 'group/externallib.php', 'moodle', ''),
(17, 'core_group_get_groupings', 'core_group_external', 'get_groupings', 'group/externallib.php', 'moodle', ''),
(18, 'core_group_get_course_groupings', 'core_group_external', 'get_course_groupings', 'group/externallib.php', 'moodle', ''),
(19, 'core_group_delete_groupings', 'core_group_external', 'delete_groupings', 'group/externallib.php', 'moodle', ''),
(20, 'core_group_assign_grouping', 'core_group_external', 'assign_grouping', 'group/externallib.php', 'moodle', ''),
(21, 'core_group_unassign_grouping', 'core_group_external', 'unassign_grouping', 'group/externallib.php', 'moodle', ''),
(22, 'moodle_file_get_files', 'core_files_external', 'get_files', 'files/externallib.php', 'moodle', ''),
(23, 'core_files_get_files', 'core_files_external', 'get_files', 'files/externallib.php', 'moodle', ''),
(24, 'moodle_file_upload', 'core_files_external', 'upload', 'files/externallib.php', 'moodle', ''),
(25, 'core_files_upload', 'core_files_external', 'upload', 'files/externallib.php', 'moodle', ''),
(26, 'moodle_user_create_users', 'core_user_external', 'create_users', 'user/externallib.php', 'moodle', 'moodle/user:create'),
(27, 'core_user_create_users', 'core_user_external', 'create_users', 'user/externallib.php', 'moodle', 'moodle/user:create'),
(28, 'moodle_user_get_users_by_id', 'core_user_external', 'get_users_by_id', 'user/externallib.php', 'moodle', 'moodle/user:viewdetails, moodle/user:viewhiddendetails, moodle/course:useremail, moodle/user:update'),
(29, 'core_user_get_users_by_id', 'core_user_external', 'get_users_by_id', 'user/externallib.php', 'moodle', 'moodle/user:viewdetails, moodle/user:viewhiddendetails, moodle/course:useremail, moodle/user:update'),
(30, 'moodle_user_get_users_by_courseid', 'core_enrol_external', 'get_enrolled_users', 'enrol/externallib.php', 'moodle', 'moodle/user:viewdetails, moodle/user:viewhiddendetails, moodle/course:useremail, moodle/user:update, moodle/site:accessallgroups'),
(31, 'moodle_user_get_course_participants_by_id', 'core_user_external', 'get_course_user_profiles', 'user/externallib.php', 'moodle', 'moodle/user:viewdetails, moodle/user:viewhiddendetails, moodle/course:useremail, moodle/user:update, moodle/site:accessallgroups'),
(32, 'core_user_get_course_user_profiles', 'core_user_external', 'get_course_user_profiles', 'user/externallib.php', 'moodle', 'moodle/user:viewdetails, moodle/user:viewhiddendetails, moodle/course:useremail, moodle/user:update, moodle/site:accessallgroups'),
(33, 'moodle_user_delete_users', 'core_user_external', 'delete_users', 'user/externallib.php', 'moodle', 'moodle/user:delete'),
(34, 'core_user_delete_users', 'core_user_external', 'delete_users', 'user/externallib.php', 'moodle', 'moodle/user:delete'),
(35, 'moodle_user_update_users', 'core_user_external', 'update_users', 'user/externallib.php', 'moodle', 'moodle/user:update'),
(36, 'core_user_update_users', 'core_user_external', 'update_users', 'user/externallib.php', 'moodle', 'moodle/user:update'),
(37, 'core_enrol_get_enrolled_users_with_capability', 'core_enrol_external', 'get_enrolled_users_with_capability', 'enrol/externallib.php', 'moodle', ''),
(38, 'moodle_enrol_get_enrolled_users', 'moodle_enrol_external', 'get_enrolled_users', 'enrol/externallib.php', 'moodle', 'moodle/site:viewparticipants, moodle/course:viewparticipants,\n            moodle/role:review, moodle/site:accessallgroups, moodle/course:enrolreview'),
(39, 'core_enrol_get_enrolled_users', 'core_enrol_external', 'get_enrolled_users', 'enrol/externallib.php', 'moodle', 'moodle/user:viewdetails, moodle/user:viewhiddendetails, moodle/course:useremail, moodle/user:update, moodle/site:accessallgroups'),
(40, 'moodle_enrol_get_users_courses', 'core_enrol_external', 'get_users_courses', 'enrol/externallib.php', 'moodle', 'moodle/course:viewparticipants'),
(41, 'core_enrol_get_users_courses', 'core_enrol_external', 'get_users_courses', 'enrol/externallib.php', 'moodle', 'moodle/course:viewparticipants'),
(42, 'moodle_role_assign', 'core_role_external', 'assign_roles', 'enrol/externallib.php', 'moodle', 'moodle/role:assign'),
(43, 'core_role_assign_roles', 'core_role_external', 'assign_roles', 'enrol/externallib.php', 'moodle', 'moodle/role:assign'),
(44, 'moodle_role_unassign', 'core_role_external', 'unassign_roles', 'enrol/externallib.php', 'moodle', 'moodle/role:assign'),
(45, 'core_role_unassign_roles', 'core_role_external', 'unassign_roles', 'enrol/externallib.php', 'moodle', 'moodle/role:assign'),
(46, 'core_course_get_contents', 'core_course_external', 'get_course_contents', 'course/externallib.php', 'moodle', 'moodle/course:update,moodle/course:viewhiddencourses'),
(47, 'moodle_course_get_courses', 'core_course_external', 'get_courses', 'course/externallib.php', 'moodle', 'moodle/course:view,moodle/course:update,moodle/course:viewhiddencourses'),
(48, 'core_course_get_courses', 'core_course_external', 'get_courses', 'course/externallib.php', 'moodle', 'moodle/course:view,moodle/course:update,moodle/course:viewhiddencourses'),
(49, 'moodle_course_create_courses', 'core_course_external', 'create_courses', 'course/externallib.php', 'moodle', 'moodle/course:create,moodle/course:visibility'),
(50, 'core_course_create_courses', 'core_course_external', 'create_courses', 'course/externallib.php', 'moodle', 'moodle/course:create,moodle/course:visibility'),
(51, 'core_course_delete_courses', 'core_course_external', 'delete_courses', 'course/externallib.php', 'moodle', 'moodle/course:delete'),
(52, 'core_course_duplicate_course', 'core_course_external', 'duplicate_course', 'course/externallib.php', 'moodle', 'moodle/backup:backupcourse,moodle/restore:restorecourse,moodle/course:create'),
(53, 'core_course_get_categories', 'core_course_external', 'get_categories', 'course/externallib.php', 'moodle', 'moodle/category:viewhiddencategories'),
(54, 'core_course_create_categories', 'core_course_external', 'create_categories', 'course/externallib.php', 'moodle', 'moodle/category:manage'),
(55, 'core_course_update_categories', 'core_course_external', 'update_categories', 'course/externallib.php', 'moodle', 'moodle/category:manage'),
(56, 'core_course_delete_categories', 'core_course_external', 'delete_categories', 'course/externallib.php', 'moodle', 'moodle/category:manage'),
(57, 'core_course_import_course', 'core_course_external', 'import_course', 'course/externallib.php', 'moodle', 'moodle/backup:backuptargetimport, moodle/restore:restoretargetimport'),
(58, 'moodle_message_send_instantmessages', 'core_message_external', 'send_instant_messages', 'message/externallib.php', 'moodle', 'moodle/site:sendmessage'),
(59, 'core_message_send_instant_messages', 'core_message_external', 'send_instant_messages', 'message/externallib.php', 'moodle', 'moodle/site:sendmessage'),
(60, 'moodle_notes_create_notes', 'core_notes_external', 'create_notes', 'notes/externallib.php', 'moodle', 'moodle/notes:manage'),
(61, 'core_notes_create_notes', 'core_notes_external', 'create_notes', 'notes/externallib.php', 'moodle', 'moodle/notes:manage'),
(62, 'moodle_webservice_get_siteinfo', 'core_webservice_external', 'get_site_info', 'webservice/externallib.php', 'moodle', ''),
(63, 'core_webservice_get_site_info', 'core_webservice_external', 'get_site_info', 'webservice/externallib.php', 'moodle', ''),
(64, 'core_get_string', 'core_external', 'get_string', 'lib/external/externallib.php', 'moodle', ''),
(65, 'core_get_strings', 'core_external', 'get_strings', 'lib/external/externallib.php', 'moodle', ''),
(66, 'core_get_component_strings', 'core_external', 'get_component_strings', 'lib/external/externallib.php', 'moodle', ''),
(67, 'mod_assign_get_grades', 'mod_assign_external', 'get_grades', 'mod/assign/externallib.php', 'mod_assign', ''),
(68, 'mod_assign_get_assignments', 'mod_assign_external', 'get_assignments', 'mod/assign/externallib.php', 'mod_assign', ''),
(69, 'moodle_enrol_manual_enrol_users', 'enrol_manual_external', 'enrol_users', 'enrol/manual/externallib.php', 'enrol_manual', 'enrol/manual:enrol'),
(70, 'enrol_manual_enrol_users', 'enrol_manual_external', 'enrol_users', 'enrol/manual/externallib.php', 'enrol_manual', 'enrol/manual:enrol');

-- --------------------------------------------------------

--
-- Table structure for table `mdl_external_services`
--

CREATE TABLE IF NOT EXISTS `mdl_external_services` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL DEFAULT '',
  `enabled` tinyint(1) NOT NULL,
  `requiredcapability` varchar(150) DEFAULT NULL,
  `restrictedusers` tinyint(1) NOT NULL,
  `component` varchar(100) DEFAULT NULL,
  `timecreated` bigint(10) NOT NULL,
  `timemodified` bigint(10) DEFAULT NULL,
  `shortname` varchar(255) DEFAULT NULL,
  `downloadfiles` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_exteserv_nam_uix` (`name`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='built in and custom external services' AUTO_INCREMENT=2 ;

--
-- Dumping data for table `mdl_external_services`
--

INSERT INTO `mdl_external_services` (`id`, `name`, `enabled`, `requiredcapability`, `restrictedusers`, `component`, `timecreated`, `timemodified`, `shortname`, `downloadfiles`) VALUES
(1, 'Moodle mobile web service', 0, NULL, 0, 'moodle', 1365445901, NULL, 'moodle_mobile_app', 1);

-- --------------------------------------------------------

--
-- Table structure for table `mdl_external_services_functions`
--

CREATE TABLE IF NOT EXISTS `mdl_external_services_functions` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `externalserviceid` bigint(10) NOT NULL,
  `functionname` varchar(200) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `mdl_exteservfunc_ext_ix` (`externalserviceid`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='lists functions available in each service group' AUTO_INCREMENT=11 ;

--
-- Dumping data for table `mdl_external_services_functions`
--

INSERT INTO `mdl_external_services_functions` (`id`, `externalserviceid`, `functionname`) VALUES
(1, 1, 'moodle_enrol_get_users_courses'),
(2, 1, 'moodle_enrol_get_enrolled_users'),
(3, 1, 'moodle_user_get_users_by_id'),
(4, 1, 'moodle_webservice_get_siteinfo'),
(5, 1, 'moodle_notes_create_notes'),
(6, 1, 'moodle_user_get_course_participants_by_id'),
(7, 1, 'moodle_user_get_users_by_courseid'),
(8, 1, 'moodle_message_send_instantmessages'),
(9, 1, 'core_course_get_contents'),
(10, 1, 'core_get_component_strings');

-- --------------------------------------------------------

--
-- Table structure for table `mdl_external_services_users`
--

CREATE TABLE IF NOT EXISTS `mdl_external_services_users` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `externalserviceid` bigint(10) NOT NULL,
  `userid` bigint(10) NOT NULL,
  `iprestriction` varchar(255) DEFAULT NULL,
  `validuntil` bigint(10) DEFAULT NULL,
  `timecreated` bigint(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_exteservuser_ext_ix` (`externalserviceid`),
  KEY `mdl_exteservuser_use_ix` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='users allowed to use services with restricted users flag' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_external_tokens`
--

CREATE TABLE IF NOT EXISTS `mdl_external_tokens` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `token` varchar(128) NOT NULL DEFAULT '',
  `tokentype` smallint(4) NOT NULL,
  `userid` bigint(10) NOT NULL,
  `externalserviceid` bigint(10) NOT NULL,
  `sid` varchar(128) DEFAULT NULL,
  `contextid` bigint(10) NOT NULL,
  `creatorid` bigint(10) NOT NULL DEFAULT '1',
  `iprestriction` varchar(255) DEFAULT NULL,
  `validuntil` bigint(10) DEFAULT NULL,
  `timecreated` bigint(10) NOT NULL,
  `lastaccess` bigint(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_extetoke_use_ix` (`userid`),
  KEY `mdl_extetoke_ext_ix` (`externalserviceid`),
  KEY `mdl_extetoke_con_ix` (`contextid`),
  KEY `mdl_extetoke_cre_ix` (`creatorid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Security tokens for accessing of external services' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_feedback`
--

CREATE TABLE IF NOT EXISTS `mdl_feedback` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `course` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `intro` longtext NOT NULL,
  `introformat` smallint(4) NOT NULL DEFAULT '0',
  `anonymous` tinyint(1) NOT NULL DEFAULT '1',
  `email_notification` tinyint(1) NOT NULL DEFAULT '1',
  `multiple_submit` tinyint(1) NOT NULL DEFAULT '1',
  `autonumbering` tinyint(1) NOT NULL DEFAULT '1',
  `site_after_submit` varchar(255) NOT NULL DEFAULT '',
  `page_after_submit` longtext NOT NULL,
  `page_after_submitformat` tinyint(2) NOT NULL DEFAULT '0',
  `publish_stats` tinyint(1) NOT NULL DEFAULT '0',
  `timeopen` bigint(10) NOT NULL DEFAULT '0',
  `timeclose` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `completionsubmit` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_feed_cou_ix` (`course`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='all feedbacks' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_feedback_completed`
--

CREATE TABLE IF NOT EXISTS `mdl_feedback_completed` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `feedback` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `random_response` bigint(10) NOT NULL DEFAULT '0',
  `anonymous_response` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_feedcomp_use_ix` (`userid`),
  KEY `mdl_feedcomp_fee_ix` (`feedback`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='filled out feedback' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_feedback_completedtmp`
--

CREATE TABLE IF NOT EXISTS `mdl_feedback_completedtmp` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `feedback` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `guestid` varchar(255) NOT NULL DEFAULT '',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `random_response` bigint(10) NOT NULL DEFAULT '0',
  `anonymous_response` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_feedcomp_use2_ix` (`userid`),
  KEY `mdl_feedcomp_fee2_ix` (`feedback`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='filled out feedback' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_feedback_item`
--

CREATE TABLE IF NOT EXISTS `mdl_feedback_item` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `feedback` bigint(10) NOT NULL DEFAULT '0',
  `template` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `label` varchar(255) NOT NULL DEFAULT '',
  `presentation` longtext NOT NULL,
  `typ` varchar(255) NOT NULL DEFAULT '',
  `hasvalue` tinyint(1) NOT NULL DEFAULT '0',
  `position` smallint(3) NOT NULL DEFAULT '0',
  `required` tinyint(1) NOT NULL DEFAULT '0',
  `dependitem` bigint(10) NOT NULL DEFAULT '0',
  `dependvalue` varchar(255) NOT NULL DEFAULT '',
  `options` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `mdl_feeditem_fee_ix` (`feedback`),
  KEY `mdl_feeditem_tem_ix` (`template`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='feedback_items' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_feedback_sitecourse_map`
--

CREATE TABLE IF NOT EXISTS `mdl_feedback_sitecourse_map` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `feedbackid` bigint(10) NOT NULL DEFAULT '0',
  `courseid` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_feedsitemap_cou_ix` (`courseid`),
  KEY `mdl_feedsitemap_fee_ix` (`feedbackid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='feedback sitecourse map' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_feedback_template`
--

CREATE TABLE IF NOT EXISTS `mdl_feedback_template` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `course` bigint(10) NOT NULL DEFAULT '0',
  `ispublic` tinyint(1) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `mdl_feedtemp_cou_ix` (`course`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='templates of feedbackstructures' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_feedback_tracking`
--

CREATE TABLE IF NOT EXISTS `mdl_feedback_tracking` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `feedback` bigint(10) NOT NULL DEFAULT '0',
  `completed` bigint(10) NOT NULL DEFAULT '0',
  `tmp_completed` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_feedtrac_use_ix` (`userid`),
  KEY `mdl_feedtrac_fee_ix` (`feedback`),
  KEY `mdl_feedtrac_com_ix` (`completed`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='feedback trackingdata' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_feedback_value`
--

CREATE TABLE IF NOT EXISTS `mdl_feedback_value` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `course_id` bigint(10) NOT NULL DEFAULT '0',
  `item` bigint(10) NOT NULL DEFAULT '0',
  `completed` bigint(10) NOT NULL DEFAULT '0',
  `tmp_completed` bigint(10) NOT NULL DEFAULT '0',
  `value` longtext NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_feedvalu_cou_ix` (`course_id`),
  KEY `mdl_feedvalu_ite_ix` (`item`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='values of the completeds' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_feedback_valuetmp`
--

CREATE TABLE IF NOT EXISTS `mdl_feedback_valuetmp` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `course_id` bigint(10) NOT NULL DEFAULT '0',
  `item` bigint(10) NOT NULL DEFAULT '0',
  `completed` bigint(10) NOT NULL DEFAULT '0',
  `tmp_completed` bigint(10) NOT NULL DEFAULT '0',
  `value` longtext NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_feedvalu_cou2_ix` (`course_id`),
  KEY `mdl_feedvalu_ite2_ix` (`item`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='values of the completedstmp' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_files`
--

CREATE TABLE IF NOT EXISTS `mdl_files` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `contenthash` varchar(40) NOT NULL DEFAULT '',
  `pathnamehash` varchar(40) NOT NULL DEFAULT '',
  `contextid` bigint(10) NOT NULL,
  `component` varchar(100) NOT NULL DEFAULT '',
  `filearea` varchar(50) NOT NULL DEFAULT '',
  `itemid` bigint(10) NOT NULL,
  `filepath` varchar(255) NOT NULL DEFAULT '',
  `filename` varchar(255) NOT NULL DEFAULT '',
  `userid` bigint(10) DEFAULT NULL,
  `filesize` bigint(10) NOT NULL,
  `mimetype` varchar(100) DEFAULT NULL,
  `status` bigint(10) NOT NULL DEFAULT '0',
  `source` longtext,
  `author` varchar(255) DEFAULT NULL,
  `license` varchar(255) DEFAULT NULL,
  `timecreated` bigint(10) NOT NULL,
  `timemodified` bigint(10) NOT NULL,
  `sortorder` bigint(10) NOT NULL DEFAULT '0',
  `referencefileid` bigint(10) DEFAULT NULL,
  `referencelastsync` bigint(10) DEFAULT NULL,
  `referencelifetime` bigint(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_file_pat_uix` (`pathnamehash`),
  KEY `mdl_file_comfilconite_ix` (`component`,`filearea`,`contextid`,`itemid`),
  KEY `mdl_file_con_ix` (`contenthash`),
  KEY `mdl_file_con2_ix` (`contextid`),
  KEY `mdl_file_use_ix` (`userid`),
  KEY `mdl_file_ref_ix` (`referencefileid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='description of files, content is stored in sha1 file pool' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_files_reference`
--

CREATE TABLE IF NOT EXISTS `mdl_files_reference` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `repositoryid` bigint(10) NOT NULL,
  `lastsync` bigint(10) DEFAULT NULL,
  `lifetime` bigint(10) DEFAULT NULL,
  `reference` longtext,
  `referencehash` varchar(40) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_filerefe_repref_uix` (`repositoryid`,`referencehash`),
  KEY `mdl_filerefe_rep_ix` (`repositoryid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Store files references' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_filter_active`
--

CREATE TABLE IF NOT EXISTS `mdl_filter_active` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `filter` varchar(32) NOT NULL DEFAULT '',
  `contextid` bigint(10) NOT NULL,
  `active` smallint(4) NOT NULL,
  `sortorder` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_filtacti_confil_uix` (`contextid`,`filter`),
  KEY `mdl_filtacti_con_ix` (`contextid`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Stores information about which filters are active in which c' AUTO_INCREMENT=13 ;

--
-- Dumping data for table `mdl_filter_active`
--

INSERT INTO `mdl_filter_active` (`id`, `filter`, `contextid`, `active`, `sortorder`) VALUES
(1, 'filter/activitynames', 1, 1, 1),
(2, 'filter/mediaplugin', 1, 1, 2),
(3, 'filter/algebra', 1, -9999, 3),
(4, 'filter/urltolink', 1, -9999, 4),
(5, 'filter/data', 1, -9999, 5),
(6, 'filter/emoticon', 1, -9999, 6),
(7, 'filter/emailprotect', 1, -9999, 7),
(8, 'filter/glossary', 1, -9999, 8),
(9, 'filter/tidy', 1, -9999, 9),
(10, 'filter/multilang', 1, -9999, 10),
(11, 'filter/tex', 1, -9999, 11),
(12, 'filter/censor', 1, -9999, 12);

-- --------------------------------------------------------

--
-- Table structure for table `mdl_filter_config`
--

CREATE TABLE IF NOT EXISTS `mdl_filter_config` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `filter` varchar(32) NOT NULL DEFAULT '',
  `contextid` bigint(10) NOT NULL,
  `name` varchar(255) NOT NULL DEFAULT '',
  `value` longtext,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_filtconf_confilnam_uix` (`contextid`,`filter`,`name`),
  KEY `mdl_filtconf_con_ix` (`contextid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Stores per-context configuration settings for filters which ' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_folder`
--

CREATE TABLE IF NOT EXISTS `mdl_folder` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `course` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `intro` longtext,
  `introformat` smallint(4) NOT NULL DEFAULT '0',
  `revision` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_fold_cou_ix` (`course`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='each record is one folder resource' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_forum`
--

CREATE TABLE IF NOT EXISTS `mdl_forum` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `course` bigint(10) NOT NULL DEFAULT '0',
  `type` varchar(20) NOT NULL DEFAULT 'general',
  `name` varchar(255) NOT NULL DEFAULT '',
  `intro` longtext NOT NULL,
  `introformat` smallint(4) NOT NULL DEFAULT '0',
  `assessed` bigint(10) NOT NULL DEFAULT '0',
  `assesstimestart` bigint(10) NOT NULL DEFAULT '0',
  `assesstimefinish` bigint(10) NOT NULL DEFAULT '0',
  `scale` bigint(10) NOT NULL DEFAULT '0',
  `maxbytes` bigint(10) NOT NULL DEFAULT '0',
  `maxattachments` bigint(10) NOT NULL DEFAULT '1',
  `forcesubscribe` tinyint(1) NOT NULL DEFAULT '0',
  `trackingtype` tinyint(2) NOT NULL DEFAULT '1',
  `rsstype` tinyint(2) NOT NULL DEFAULT '0',
  `rssarticles` tinyint(2) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `warnafter` bigint(10) NOT NULL DEFAULT '0',
  `blockafter` bigint(10) NOT NULL DEFAULT '0',
  `blockperiod` bigint(10) NOT NULL DEFAULT '0',
  `completiondiscussions` int(9) NOT NULL DEFAULT '0',
  `completionreplies` int(9) NOT NULL DEFAULT '0',
  `completionposts` int(9) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_foru_cou_ix` (`course`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Forums contain and structure discussion' AUTO_INCREMENT=6 ;

--
-- Dumping data for table `mdl_forum`
--

INSERT INTO `mdl_forum` (`id`, `course`, `type`, `name`, `intro`, `introformat`, `assessed`, `assesstimestart`, `assesstimefinish`, `scale`, `maxbytes`, `maxattachments`, `forcesubscribe`, `trackingtype`, `rsstype`, `rssarticles`, `timemodified`, `warnafter`, `blockafter`, `blockperiod`, `completiondiscussions`, `completionreplies`, `completionposts`) VALUES
(4, 5, 'news', 'News forum', 'General news and announcements', 1, 0, 0, 0, 0, 0, 1, 1, 1, 0, 0, 1365625815, 0, 0, 0, 0, 0, 0),
(5, 6, 'news', 'News forum', 'General news and announcements', 1, 0, 0, 0, 0, 0, 1, 1, 1, 0, 0, 1365654316, 0, 0, 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `mdl_forum_discussions`
--

CREATE TABLE IF NOT EXISTS `mdl_forum_discussions` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `course` bigint(10) NOT NULL DEFAULT '0',
  `forum` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `firstpost` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `groupid` bigint(10) NOT NULL DEFAULT '-1',
  `assessed` tinyint(1) NOT NULL DEFAULT '1',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `usermodified` bigint(10) NOT NULL DEFAULT '0',
  `timestart` bigint(10) NOT NULL DEFAULT '0',
  `timeend` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_forudisc_use_ix` (`userid`),
  KEY `mdl_forudisc_for_ix` (`forum`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Forums are composed of discussions' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_forum_posts`
--

CREATE TABLE IF NOT EXISTS `mdl_forum_posts` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `discussion` bigint(10) NOT NULL DEFAULT '0',
  `parent` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `created` bigint(10) NOT NULL DEFAULT '0',
  `modified` bigint(10) NOT NULL DEFAULT '0',
  `mailed` tinyint(2) NOT NULL DEFAULT '0',
  `subject` varchar(255) NOT NULL DEFAULT '',
  `message` longtext NOT NULL,
  `messageformat` tinyint(2) NOT NULL DEFAULT '0',
  `messagetrust` tinyint(2) NOT NULL DEFAULT '0',
  `attachment` varchar(100) NOT NULL DEFAULT '',
  `totalscore` smallint(4) NOT NULL DEFAULT '0',
  `mailnow` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_forupost_use_ix` (`userid`),
  KEY `mdl_forupost_cre_ix` (`created`),
  KEY `mdl_forupost_mai_ix` (`mailed`),
  KEY `mdl_forupost_dis_ix` (`discussion`),
  KEY `mdl_forupost_par_ix` (`parent`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='All posts are stored in this table' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_forum_queue`
--

CREATE TABLE IF NOT EXISTS `mdl_forum_queue` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `discussionid` bigint(10) NOT NULL DEFAULT '0',
  `postid` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_foruqueu_use_ix` (`userid`),
  KEY `mdl_foruqueu_dis_ix` (`discussionid`),
  KEY `mdl_foruqueu_pos_ix` (`postid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='For keeping track of posts that will be mailed in digest for' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_forum_read`
--

CREATE TABLE IF NOT EXISTS `mdl_forum_read` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `forumid` bigint(10) NOT NULL DEFAULT '0',
  `discussionid` bigint(10) NOT NULL DEFAULT '0',
  `postid` bigint(10) NOT NULL DEFAULT '0',
  `firstread` bigint(10) NOT NULL DEFAULT '0',
  `lastread` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_foruread_usefor_ix` (`userid`,`forumid`),
  KEY `mdl_foruread_usedis_ix` (`userid`,`discussionid`),
  KEY `mdl_foruread_usepos_ix` (`userid`,`postid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Tracks each users read posts' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_forum_subscriptions`
--

CREATE TABLE IF NOT EXISTS `mdl_forum_subscriptions` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `forum` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_forusubs_use_ix` (`userid`),
  KEY `mdl_forusubs_for_ix` (`forum`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Keeps track of who is subscribed to what forum' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_forum_track_prefs`
--

CREATE TABLE IF NOT EXISTS `mdl_forum_track_prefs` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `forumid` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_forutracpref_usefor_ix` (`userid`,`forumid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Tracks each users untracked forums' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_glossary`
--

CREATE TABLE IF NOT EXISTS `mdl_glossary` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `course` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `intro` longtext NOT NULL,
  `introformat` smallint(4) NOT NULL DEFAULT '0',
  `allowduplicatedentries` tinyint(2) NOT NULL DEFAULT '0',
  `displayformat` varchar(50) NOT NULL DEFAULT 'dictionary',
  `mainglossary` tinyint(2) NOT NULL DEFAULT '0',
  `showspecial` tinyint(2) NOT NULL DEFAULT '1',
  `showalphabet` tinyint(2) NOT NULL DEFAULT '1',
  `showall` tinyint(2) NOT NULL DEFAULT '1',
  `allowcomments` tinyint(2) NOT NULL DEFAULT '0',
  `allowprintview` tinyint(2) NOT NULL DEFAULT '1',
  `usedynalink` tinyint(2) NOT NULL DEFAULT '1',
  `defaultapproval` tinyint(2) NOT NULL DEFAULT '1',
  `approvaldisplayformat` varchar(50) NOT NULL DEFAULT 'default',
  `globalglossary` tinyint(2) NOT NULL DEFAULT '0',
  `entbypage` smallint(3) NOT NULL DEFAULT '10',
  `editalways` tinyint(2) NOT NULL DEFAULT '0',
  `rsstype` tinyint(2) NOT NULL DEFAULT '0',
  `rssarticles` tinyint(2) NOT NULL DEFAULT '0',
  `assessed` bigint(10) NOT NULL DEFAULT '0',
  `assesstimestart` bigint(10) NOT NULL DEFAULT '0',
  `assesstimefinish` bigint(10) NOT NULL DEFAULT '0',
  `scale` bigint(10) NOT NULL DEFAULT '0',
  `timecreated` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `completionentries` int(9) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_glos_cou_ix` (`course`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='all glossaries' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_glossary_alias`
--

CREATE TABLE IF NOT EXISTS `mdl_glossary_alias` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `entryid` bigint(10) NOT NULL DEFAULT '0',
  `alias` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `mdl_glosalia_ent_ix` (`entryid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='entries alias' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_glossary_categories`
--

CREATE TABLE IF NOT EXISTS `mdl_glossary_categories` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `glossaryid` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `usedynalink` tinyint(2) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `mdl_gloscate_glo_ix` (`glossaryid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='all categories for glossary entries' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_glossary_entries`
--

CREATE TABLE IF NOT EXISTS `mdl_glossary_entries` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `glossaryid` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `concept` varchar(255) NOT NULL DEFAULT '',
  `definition` longtext NOT NULL,
  `definitionformat` tinyint(2) NOT NULL DEFAULT '0',
  `definitiontrust` tinyint(2) NOT NULL DEFAULT '0',
  `attachment` varchar(100) NOT NULL DEFAULT '',
  `timecreated` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `teacherentry` tinyint(2) NOT NULL DEFAULT '0',
  `sourceglossaryid` bigint(10) NOT NULL DEFAULT '0',
  `usedynalink` tinyint(2) NOT NULL DEFAULT '1',
  `casesensitive` tinyint(2) NOT NULL DEFAULT '0',
  `fullmatch` tinyint(2) NOT NULL DEFAULT '1',
  `approved` tinyint(2) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `mdl_glosentr_use_ix` (`userid`),
  KEY `mdl_glosentr_con_ix` (`concept`),
  KEY `mdl_glosentr_glo_ix` (`glossaryid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='all glossary entries' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_glossary_entries_categories`
--

CREATE TABLE IF NOT EXISTS `mdl_glossary_entries_categories` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `categoryid` bigint(10) NOT NULL DEFAULT '0',
  `entryid` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_glosentrcate_cat_ix` (`categoryid`),
  KEY `mdl_glosentrcate_ent_ix` (`entryid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='categories of each glossary entry' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_glossary_formats`
--

CREATE TABLE IF NOT EXISTS `mdl_glossary_formats` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL DEFAULT '',
  `popupformatname` varchar(50) NOT NULL DEFAULT '',
  `visible` tinyint(2) NOT NULL DEFAULT '1',
  `showgroup` tinyint(2) NOT NULL DEFAULT '1',
  `defaultmode` varchar(50) NOT NULL DEFAULT '',
  `defaulthook` varchar(50) NOT NULL DEFAULT '',
  `sortkey` varchar(50) NOT NULL DEFAULT '',
  `sortorder` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Setting of the display formats' AUTO_INCREMENT=8 ;

--
-- Dumping data for table `mdl_glossary_formats`
--

INSERT INTO `mdl_glossary_formats` (`id`, `name`, `popupformatname`, `visible`, `showgroup`, `defaultmode`, `defaulthook`, `sortkey`, `sortorder`) VALUES
(1, 'continuous', 'continuous', 1, 1, '', '', '', ''),
(2, 'dictionary', 'dictionary', 1, 1, '', '', '', ''),
(3, 'encyclopedia', 'encyclopedia', 1, 1, '', '', '', ''),
(4, 'entrylist', 'entrylist', 1, 1, '', '', '', ''),
(5, 'faq', 'faq', 1, 1, '', '', '', ''),
(6, 'fullwithauthor', 'fullwithauthor', 1, 1, '', '', '', ''),
(7, 'fullwithoutauthor', 'fullwithoutauthor', 1, 1, '', '', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `mdl_grade_categories`
--

CREATE TABLE IF NOT EXISTS `mdl_grade_categories` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `courseid` bigint(10) NOT NULL,
  `parent` bigint(10) DEFAULT NULL,
  `depth` bigint(10) NOT NULL DEFAULT '0',
  `path` varchar(255) DEFAULT NULL,
  `fullname` varchar(255) NOT NULL DEFAULT '',
  `aggregation` bigint(10) NOT NULL DEFAULT '0',
  `keephigh` bigint(10) NOT NULL DEFAULT '0',
  `droplow` bigint(10) NOT NULL DEFAULT '0',
  `aggregateonlygraded` tinyint(1) NOT NULL DEFAULT '0',
  `aggregateoutcomes` tinyint(1) NOT NULL DEFAULT '0',
  `aggregatesubcats` tinyint(1) NOT NULL DEFAULT '0',
  `timecreated` bigint(10) NOT NULL,
  `timemodified` bigint(10) NOT NULL,
  `hidden` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_gradcate_cou_ix` (`courseid`),
  KEY `mdl_gradcate_par_ix` (`parent`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='This table keeps information about categories, used for grou' AUTO_INCREMENT=6 ;

--
-- Dumping data for table `mdl_grade_categories`
--

INSERT INTO `mdl_grade_categories` (`id`, `courseid`, `parent`, `depth`, `path`, `fullname`, `aggregation`, `keephigh`, `droplow`, `aggregateonlygraded`, `aggregateoutcomes`, `aggregatesubcats`, `timecreated`, `timemodified`, `hidden`) VALUES
(4, 5, NULL, 1, '/4/', '?', 11, 0, 0, 1, 0, 0, 1365625831, 1365625831, 0),
(5, 6, NULL, 1, '/5/', '?', 11, 0, 0, 1, 0, 0, 1365654336, 1365654336, 0);

-- --------------------------------------------------------

--
-- Table structure for table `mdl_grade_categories_history`
--

CREATE TABLE IF NOT EXISTS `mdl_grade_categories_history` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `action` bigint(10) NOT NULL DEFAULT '0',
  `oldid` bigint(10) NOT NULL,
  `source` varchar(255) DEFAULT NULL,
  `timemodified` bigint(10) DEFAULT NULL,
  `loggeduser` bigint(10) DEFAULT NULL,
  `courseid` bigint(10) NOT NULL,
  `parent` bigint(10) DEFAULT NULL,
  `depth` bigint(10) NOT NULL DEFAULT '0',
  `path` varchar(255) DEFAULT NULL,
  `fullname` varchar(255) NOT NULL DEFAULT '',
  `aggregation` bigint(10) NOT NULL DEFAULT '0',
  `keephigh` bigint(10) NOT NULL DEFAULT '0',
  `droplow` bigint(10) NOT NULL DEFAULT '0',
  `aggregateonlygraded` tinyint(1) NOT NULL DEFAULT '0',
  `aggregateoutcomes` tinyint(1) NOT NULL DEFAULT '0',
  `aggregatesubcats` tinyint(1) NOT NULL DEFAULT '0',
  `hidden` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_gradcatehist_act_ix` (`action`),
  KEY `mdl_gradcatehist_old_ix` (`oldid`),
  KEY `mdl_gradcatehist_cou_ix` (`courseid`),
  KEY `mdl_gradcatehist_par_ix` (`parent`),
  KEY `mdl_gradcatehist_log_ix` (`loggeduser`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='History of grade_categories' AUTO_INCREMENT=14 ;

--
-- Dumping data for table `mdl_grade_categories_history`
--

INSERT INTO `mdl_grade_categories_history` (`id`, `action`, `oldid`, `source`, `timemodified`, `loggeduser`, `courseid`, `parent`, `depth`, `path`, `fullname`, `aggregation`, `keephigh`, `droplow`, `aggregateonlygraded`, `aggregateoutcomes`, `aggregatesubcats`, `hidden`) VALUES
(1, 1, 1, 'system', 1365531724, 5, 2, NULL, 0, NULL, '?', 11, 0, 0, 1, 0, 0, 0),
(2, 2, 1, 'system', 1365531724, 5, 2, NULL, 1, '/1/', '?', 11, 0, 0, 1, 0, 0, 0),
(3, 1, 2, 'system', 1365622846, 2, 4, NULL, 0, NULL, '?', 11, 0, 0, 1, 0, 0, 0),
(4, 2, 2, 'system', 1365622846, 2, 4, NULL, 1, '/2/', '?', 11, 0, 0, 1, 0, 0, 0),
(5, 1, 3, 'system', 1365622865, 2, 3, NULL, 0, NULL, '?', 11, 0, 0, 1, 0, 0, 0),
(6, 2, 3, 'system', 1365622865, 2, 3, NULL, 1, '/3/', '?', 11, 0, 0, 1, 0, 0, 0),
(7, 3, 2, 'coursedelete', 1365625706, 2, 4, NULL, 1, '/2/', '?', 11, 0, 0, 1, 0, 0, 0),
(8, 3, 3, 'coursedelete', 1365625722, 2, 3, NULL, 1, '/3/', '?', 11, 0, 0, 1, 0, 0, 0),
(9, 3, 1, 'coursedelete', 1365625737, 2, 2, NULL, 1, '/1/', '?', 11, 0, 0, 1, 0, 0, 0),
(10, 1, 4, 'system', 1365625831, 2, 5, NULL, 0, NULL, '?', 11, 0, 0, 1, 0, 0, 0),
(11, 2, 4, 'system', 1365625831, 2, 5, NULL, 1, '/4/', '?', 11, 0, 0, 1, 0, 0, 0),
(12, 1, 5, 'system', 1365654336, 2, 6, NULL, 0, NULL, '?', 11, 0, 0, 1, 0, 0, 0),
(13, 2, 5, 'system', 1365654336, 2, 6, NULL, 1, '/5/', '?', 11, 0, 0, 1, 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `mdl_grade_grades`
--

CREATE TABLE IF NOT EXISTS `mdl_grade_grades` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `itemid` bigint(10) NOT NULL,
  `userid` bigint(10) NOT NULL,
  `rawgrade` decimal(10,5) DEFAULT NULL,
  `rawgrademax` decimal(10,5) NOT NULL DEFAULT '100.00000',
  `rawgrademin` decimal(10,5) NOT NULL DEFAULT '0.00000',
  `rawscaleid` bigint(10) DEFAULT NULL,
  `usermodified` bigint(10) DEFAULT NULL,
  `finalgrade` decimal(10,5) DEFAULT NULL,
  `hidden` bigint(10) NOT NULL DEFAULT '0',
  `locked` bigint(10) NOT NULL DEFAULT '0',
  `locktime` bigint(10) NOT NULL DEFAULT '0',
  `exported` bigint(10) NOT NULL DEFAULT '0',
  `overridden` bigint(10) NOT NULL DEFAULT '0',
  `excluded` bigint(10) NOT NULL DEFAULT '0',
  `feedback` longtext,
  `feedbackformat` bigint(10) NOT NULL DEFAULT '0',
  `information` longtext,
  `informationformat` bigint(10) NOT NULL DEFAULT '0',
  `timecreated` bigint(10) DEFAULT NULL,
  `timemodified` bigint(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_gradgrad_useite_uix` (`userid`,`itemid`),
  KEY `mdl_gradgrad_locloc_ix` (`locked`,`locktime`),
  KEY `mdl_gradgrad_ite_ix` (`itemid`),
  KEY `mdl_gradgrad_use_ix` (`userid`),
  KEY `mdl_gradgrad_raw_ix` (`rawscaleid`),
  KEY `mdl_gradgrad_use2_ix` (`usermodified`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='grade_grades  This table keeps individual grades for each us' AUTO_INCREMENT=28 ;

--
-- Dumping data for table `mdl_grade_grades`
--

INSERT INTO `mdl_grade_grades` (`id`, `itemid`, `userid`, `rawgrade`, `rawgrademax`, `rawgrademin`, `rawscaleid`, `usermodified`, `finalgrade`, `hidden`, `locked`, `locktime`, `exported`, `overridden`, `excluded`, `feedback`, `feedbackformat`, `information`, `informationformat`, `timecreated`, `timemodified`) VALUES
(16, 12, 4, 33.33333, 100.00000, 0.00000, NULL, 2, 33.33333, 0, 0, 0, 0, 0, 0, NULL, 0, NULL, 0, NULL, 1365626253),
(17, 10, 4, NULL, 100.00000, 0.00000, NULL, NULL, 55.55556, 0, 0, 0, 0, 0, 0, NULL, 0, NULL, 0, NULL, NULL),
(18, 12, 3, 100.00000, 100.00000, 0.00000, NULL, 2, 100.00000, 0, 0, 0, 0, 0, 0, NULL, 0, NULL, 0, NULL, 1365626206),
(19, 10, 3, NULL, 100.00000, 0.00000, NULL, NULL, 61.11111, 0, 0, 0, 0, 0, 0, NULL, 0, NULL, 0, NULL, NULL),
(20, 13, 4, 66.66667, 100.00000, 0.00000, NULL, 2, 66.66667, 0, 0, 0, 0, 0, 0, NULL, 0, NULL, 0, NULL, 1365654098),
(21, 13, 3, 50.00000, 100.00000, 0.00000, NULL, 2, 50.00000, 0, 0, 0, 0, 0, 0, NULL, 0, NULL, 0, NULL, 1365654098),
(22, 14, 3, 33.33333, 100.00000, 0.00000, NULL, 2, 33.33333, 0, 0, 0, 0, 0, 0, NULL, 0, NULL, 0, NULL, 1365654423),
(23, 14, 4, 66.66667, 100.00000, 0.00000, NULL, 2, 66.66667, 0, 0, 0, 0, 0, 0, NULL, 0, NULL, 0, NULL, 1365654423),
(24, 16, 12, 100.00000, 100.00000, 0.00000, NULL, 2, 100.00000, 0, 0, 0, 0, 0, 0, NULL, 0, NULL, 0, NULL, 1365654453),
(25, 15, 12, NULL, 100.00000, 0.00000, NULL, NULL, 100.00000, 0, 0, 0, 0, 0, 0, NULL, 0, NULL, 0, NULL, NULL),
(26, 16, 4, 100.00000, 100.00000, 0.00000, NULL, 2, 100.00000, 0, 0, 0, 0, 0, 0, NULL, 0, NULL, 0, NULL, 1365654453),
(27, 15, 4, NULL, 100.00000, 0.00000, NULL, NULL, 100.00000, 0, 0, 0, 0, 0, 0, NULL, 0, NULL, 0, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `mdl_grade_grades_history`
--

CREATE TABLE IF NOT EXISTS `mdl_grade_grades_history` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `action` bigint(10) NOT NULL DEFAULT '0',
  `oldid` bigint(10) NOT NULL,
  `source` varchar(255) DEFAULT NULL,
  `timemodified` bigint(10) DEFAULT NULL,
  `loggeduser` bigint(10) DEFAULT NULL,
  `itemid` bigint(10) NOT NULL,
  `userid` bigint(10) NOT NULL,
  `rawgrade` decimal(10,5) DEFAULT NULL,
  `rawgrademax` decimal(10,5) NOT NULL DEFAULT '100.00000',
  `rawgrademin` decimal(10,5) NOT NULL DEFAULT '0.00000',
  `rawscaleid` bigint(10) DEFAULT NULL,
  `usermodified` bigint(10) DEFAULT NULL,
  `finalgrade` decimal(10,5) DEFAULT NULL,
  `hidden` bigint(10) NOT NULL DEFAULT '0',
  `locked` bigint(10) NOT NULL DEFAULT '0',
  `locktime` bigint(10) NOT NULL DEFAULT '0',
  `exported` bigint(10) NOT NULL DEFAULT '0',
  `overridden` bigint(10) NOT NULL DEFAULT '0',
  `excluded` bigint(10) NOT NULL DEFAULT '0',
  `feedback` longtext,
  `feedbackformat` bigint(10) NOT NULL DEFAULT '0',
  `information` longtext,
  `informationformat` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_gradgradhist_act_ix` (`action`),
  KEY `mdl_gradgradhist_old_ix` (`oldid`),
  KEY `mdl_gradgradhist_ite_ix` (`itemid`),
  KEY `mdl_gradgradhist_use_ix` (`userid`),
  KEY `mdl_gradgradhist_raw_ix` (`rawscaleid`),
  KEY `mdl_gradgradhist_use2_ix` (`usermodified`),
  KEY `mdl_gradgradhist_log_ix` (`loggeduser`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='History table' AUTO_INCREMENT=84 ;

--
-- Dumping data for table `mdl_grade_grades_history`
--

INSERT INTO `mdl_grade_grades_history` (`id`, `action`, `oldid`, `source`, `timemodified`, `loggeduser`, `itemid`, `userid`, `rawgrade`, `rawgrademax`, `rawgrademin`, `rawscaleid`, `usermodified`, `finalgrade`, `hidden`, `locked`, `locktime`, `exported`, `overridden`, `excluded`, `feedback`, `feedbackformat`, `information`, `informationformat`) VALUES
(1, 1, 1, 'mod/attforblock', 1365532473, 5, 2, 3, 100.00000, 100.00000, 0.00000, NULL, 5, 100.00000, 0, 0, 0, 0, 0, 0, NULL, 0, NULL, 0),
(2, 1, 2, 'system', 1365532474, 5, 1, 3, NULL, 100.00000, 0.00000, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, NULL, 0, NULL, 0),
(3, 2, 2, 'aggregation', 1365532474, 5, 1, 3, NULL, 100.00000, 0.00000, NULL, NULL, 100.00000, 0, 0, 0, 0, 0, 0, NULL, 0, NULL, 0),
(4, 1, 3, 'mod/attforblock', 1365532474, 5, 2, 4, 0.00000, 100.00000, 0.00000, NULL, 5, 0.00000, 0, 0, 0, 0, 0, 0, NULL, 0, NULL, 0),
(5, 1, 4, 'system', 1365532474, 5, 1, 4, NULL, 100.00000, 0.00000, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, NULL, 0, NULL, 0),
(6, 2, 4, 'aggregation', 1365532474, 5, 1, 4, NULL, 100.00000, 0.00000, NULL, NULL, 0.00000, 0, 0, 0, 0, 0, 0, NULL, 0, NULL, 0),
(7, 2, 1, 'mod/attforblock', 1365534266, 5, 2, 3, 75.00000, 100.00000, 0.00000, NULL, 5, 75.00000, 0, 0, 0, 0, 0, 0, NULL, 0, NULL, 0),
(8, 2, 2, 'aggregation', 1365534266, 5, 1, 3, NULL, 100.00000, 0.00000, NULL, NULL, 75.00000, 0, 0, 0, 0, 0, 0, NULL, 0, NULL, 0),
(9, 2, 3, 'mod/attforblock', 1365534266, 5, 2, 4, 25.00000, 100.00000, 0.00000, NULL, 5, 25.00000, 0, 0, 0, 0, 0, 0, NULL, 0, NULL, 0),
(10, 2, 4, 'aggregation', 1365534266, 5, 1, 4, NULL, 100.00000, 0.00000, NULL, NULL, 25.00000, 0, 0, 0, 0, 0, 0, NULL, 0, NULL, 0),
(11, 1, 5, 'mod/attforblock', 1365622934, 2, 5, 13, 100.00000, 100.00000, 0.00000, NULL, 2, 100.00000, 0, 0, 0, 0, 0, 0, NULL, 0, NULL, 0),
(12, 1, 6, 'system', 1365622934, 2, 4, 13, NULL, 100.00000, 0.00000, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, NULL, 0, NULL, 0),
(13, 2, 6, 'aggregation', 1365622934, 2, 4, 13, NULL, 100.00000, 0.00000, NULL, NULL, 100.00000, 0, 0, 0, 0, 0, 0, NULL, 0, NULL, 0),
(14, 1, 7, 'mod/attforblock', 1365622934, 2, 5, 14, 100.00000, 100.00000, 0.00000, NULL, 2, 100.00000, 0, 0, 0, 0, 0, 0, NULL, 0, NULL, 0),
(15, 1, 8, 'system', 1365622934, 2, 4, 14, NULL, 100.00000, 0.00000, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, NULL, 0, NULL, 0),
(16, 2, 8, 'aggregation', 1365622934, 2, 4, 14, NULL, 100.00000, 0.00000, NULL, NULL, 100.00000, 0, 0, 0, 0, 0, 0, NULL, 0, NULL, 0),
(17, 1, 9, 'mod/attforblock', 1365622954, 2, 7, 4, 100.00000, 100.00000, 0.00000, NULL, 2, 100.00000, 0, 0, 0, 0, 0, 0, NULL, 0, NULL, 0),
(18, 1, 10, 'system', 1365622954, 2, 6, 4, NULL, 100.00000, 0.00000, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, NULL, 0, NULL, 0),
(19, 2, 10, 'aggregation', 1365622954, 2, 6, 4, NULL, 100.00000, 0.00000, NULL, NULL, 100.00000, 0, 0, 0, 0, 0, 0, NULL, 0, NULL, 0),
(20, 2, 5, 'mod/attforblock', 1365622970, 2, 5, 13, 50.00000, 100.00000, 0.00000, NULL, 2, 50.00000, 0, 0, 0, 0, 0, 0, NULL, 0, NULL, 0),
(21, 2, 6, 'aggregation', 1365622970, 2, 4, 13, NULL, 100.00000, 0.00000, NULL, NULL, 50.00000, 0, 0, 0, 0, 0, 0, NULL, 0, NULL, 0),
(22, 1, 11, 'mod/attforblock', 1365624910, 2, 8, 3, 0.00000, 100.00000, 0.00000, NULL, 2, 0.00000, 0, 0, 0, 0, 0, 0, NULL, 0, NULL, 0),
(23, 1, 12, 'system', 1365624910, 2, 6, 3, NULL, 100.00000, 0.00000, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, NULL, 0, NULL, 0),
(24, 2, 12, 'aggregation', 1365624910, 2, 6, 3, NULL, 100.00000, 0.00000, NULL, NULL, 0.00000, 0, 0, 0, 0, 0, 0, NULL, 0, NULL, 0),
(25, 1, 13, 'mod/attforblock', 1365624910, 2, 8, 4, 0.00000, 100.00000, 0.00000, NULL, 2, 0.00000, 0, 0, 0, 0, 0, 0, NULL, 0, NULL, 0),
(26, 2, 10, 'aggregation', 1365624910, 2, 6, 4, NULL, 100.00000, 0.00000, NULL, NULL, 50.00000, 0, 0, 0, 0, 0, 0, NULL, 0, NULL, 0),
(27, 1, 14, 'mod/attforblock', 1365624912, 2, 9, 13, 0.00000, 100.00000, 0.00000, NULL, 2, 0.00000, 0, 0, 0, 0, 0, 0, NULL, 0, NULL, 0),
(28, 2, 6, 'aggregation', 1365624912, 2, 4, 13, NULL, 100.00000, 0.00000, NULL, NULL, 25.00000, 0, 0, 0, 0, 0, 0, NULL, 0, NULL, 0),
(29, 1, 15, 'mod/attforblock', 1365624912, 2, 9, 14, 0.00000, 100.00000, 0.00000, NULL, 2, 0.00000, 0, 0, 0, 0, 0, 0, NULL, 0, NULL, 0),
(30, 2, 8, 'aggregation', 1365624912, 2, 4, 14, NULL, 100.00000, 0.00000, NULL, NULL, 50.00000, 0, 0, 0, 0, 0, 0, NULL, 0, NULL, 0),
(31, 3, 5, 'coursedelete', 1365625706, 2, 5, 13, 50.00000, 100.00000, 0.00000, NULL, 2, 50.00000, 0, 0, 0, 0, 0, 0, NULL, 0, NULL, 0),
(32, 3, 7, 'coursedelete', 1365625706, 2, 5, 14, 100.00000, 100.00000, 0.00000, NULL, 2, 100.00000, 0, 0, 0, 0, 0, 0, NULL, 0, NULL, 0),
(33, 3, 14, 'coursedelete', 1365625706, 2, 9, 13, 0.00000, 100.00000, 0.00000, NULL, 2, 0.00000, 0, 0, 0, 0, 0, 0, NULL, 0, NULL, 0),
(34, 3, 15, 'coursedelete', 1365625706, 2, 9, 14, 0.00000, 100.00000, 0.00000, NULL, 2, 0.00000, 0, 0, 0, 0, 0, 0, NULL, 0, NULL, 0),
(35, 3, 6, 'coursedelete', 1365625706, 2, 4, 13, NULL, 100.00000, 0.00000, NULL, NULL, 25.00000, 0, 0, 0, 0, 0, 0, NULL, 0, NULL, 0),
(36, 3, 8, 'coursedelete', 1365625706, 2, 4, 14, NULL, 100.00000, 0.00000, NULL, NULL, 50.00000, 0, 0, 0, 0, 0, 0, NULL, 0, NULL, 0),
(37, 3, 9, 'coursedelete', 1365625722, 2, 7, 4, 100.00000, 100.00000, 0.00000, NULL, 2, 100.00000, 0, 0, 0, 0, 0, 0, NULL, 0, NULL, 0),
(38, 3, 11, 'coursedelete', 1365625722, 2, 8, 3, 0.00000, 100.00000, 0.00000, NULL, 2, 0.00000, 0, 0, 0, 0, 0, 0, NULL, 0, NULL, 0),
(39, 3, 13, 'coursedelete', 1365625722, 2, 8, 4, 0.00000, 100.00000, 0.00000, NULL, 2, 0.00000, 0, 0, 0, 0, 0, 0, NULL, 0, NULL, 0),
(40, 3, 10, 'coursedelete', 1365625722, 2, 6, 4, NULL, 100.00000, 0.00000, NULL, NULL, 50.00000, 0, 0, 0, 0, 0, 0, NULL, 0, NULL, 0),
(41, 3, 12, 'coursedelete', 1365625722, 2, 6, 3, NULL, 100.00000, 0.00000, NULL, NULL, 0.00000, 0, 0, 0, 0, 0, 0, NULL, 0, NULL, 0),
(42, 3, 1, 'coursedelete', 1365625737, 2, 2, 3, 75.00000, 100.00000, 0.00000, NULL, 5, 75.00000, 0, 0, 0, 0, 0, 0, NULL, 0, NULL, 0),
(43, 3, 3, 'coursedelete', 1365625737, 2, 2, 4, 25.00000, 100.00000, 0.00000, NULL, 5, 25.00000, 0, 0, 0, 0, 0, 0, NULL, 0, NULL, 0),
(44, 3, 2, 'coursedelete', 1365625737, 2, 1, 3, NULL, 100.00000, 0.00000, NULL, NULL, 75.00000, 0, 0, 0, 0, 0, 0, NULL, 0, NULL, 0),
(45, 3, 4, 'coursedelete', 1365625737, 2, 1, 4, NULL, 100.00000, 0.00000, NULL, NULL, 25.00000, 0, 0, 0, 0, 0, 0, NULL, 0, NULL, 0),
(46, 1, 16, 'mod/attforblock', 1365626182, 2, 12, 4, 100.00000, 100.00000, 0.00000, NULL, 2, 100.00000, 0, 0, 0, 0, 0, 0, NULL, 0, NULL, 0),
(47, 1, 17, 'system', 1365626182, 2, 10, 4, NULL, 100.00000, 0.00000, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, NULL, 0, NULL, 0),
(48, 2, 17, 'aggregation', 1365626182, 2, 10, 4, NULL, 100.00000, 0.00000, NULL, NULL, 100.00000, 0, 0, 0, 0, 0, 0, NULL, 0, NULL, 0),
(49, 2, 16, 'mod/attforblock', 1365626206, 2, 12, 4, 50.00000, 100.00000, 0.00000, NULL, 2, 50.00000, 0, 0, 0, 0, 0, 0, NULL, 0, NULL, 0),
(50, 2, 17, 'aggregation', 1365626206, 2, 10, 4, NULL, 100.00000, 0.00000, NULL, NULL, 50.00000, 0, 0, 0, 0, 0, 0, NULL, 0, NULL, 0),
(51, 1, 18, 'mod/attforblock', 1365626206, 2, 12, 3, 100.00000, 100.00000, 0.00000, NULL, 2, 100.00000, 0, 0, 0, 0, 0, 0, NULL, 0, NULL, 0),
(52, 1, 19, 'system', 1365626206, 2, 10, 3, NULL, 100.00000, 0.00000, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, NULL, 0, NULL, 0),
(53, 2, 19, 'aggregation', 1365626206, 2, 10, 3, NULL, 100.00000, 0.00000, NULL, NULL, 100.00000, 0, 0, 0, 0, 0, 0, NULL, 0, NULL, 0),
(54, 2, 16, 'mod/attforblock', 1365626253, 2, 12, 4, 33.33333, 100.00000, 0.00000, NULL, 2, 33.33333, 0, 0, 0, 0, 0, 0, NULL, 0, NULL, 0),
(55, 2, 17, 'aggregation', 1365626253, 2, 10, 4, NULL, 100.00000, 0.00000, NULL, NULL, 33.33333, 0, 0, 0, 0, 0, 0, NULL, 0, NULL, 0),
(56, 1, 20, 'mod/attforblock', 1365626343, 2, 13, 4, 100.00000, 100.00000, 0.00000, NULL, 2, 100.00000, 0, 0, 0, 0, 0, 0, NULL, 0, NULL, 0),
(57, 2, 17, 'aggregation', 1365626343, 2, 10, 4, NULL, 100.00000, 0.00000, NULL, NULL, 66.66667, 0, 0, 0, 0, 0, 0, NULL, 0, NULL, 0),
(58, 2, 20, 'mod/attforblock', 1365654066, 2, 13, 4, 50.00000, 100.00000, 0.00000, NULL, 2, 50.00000, 0, 0, 0, 0, 0, 0, NULL, 0, NULL, 0),
(59, 2, 17, 'aggregation', 1365654067, 2, 10, 4, NULL, 100.00000, 0.00000, NULL, NULL, 41.66667, 0, 0, 0, 0, 0, 0, NULL, 0, NULL, 0),
(60, 1, 21, 'mod/attforblock', 1365654067, 2, 13, 3, 0.00000, 100.00000, 0.00000, NULL, 2, 0.00000, 0, 0, 0, 0, 0, 0, NULL, 0, NULL, 0),
(61, 2, 19, 'aggregation', 1365654067, 2, 10, 3, NULL, 100.00000, 0.00000, NULL, NULL, 50.00000, 0, 0, 0, 0, 0, 0, NULL, 0, NULL, 0),
(62, 2, 20, 'mod/attforblock', 1365654098, 2, 13, 4, 66.66667, 100.00000, 0.00000, NULL, 2, 66.66667, 0, 0, 0, 0, 0, 0, NULL, 0, NULL, 0),
(63, 2, 17, 'aggregation', 1365654098, 2, 10, 4, NULL, 100.00000, 0.00000, NULL, NULL, 50.00000, 0, 0, 0, 0, 0, 0, NULL, 0, NULL, 0),
(64, 2, 21, 'mod/attforblock', 1365654098, 2, 13, 3, 50.00000, 100.00000, 0.00000, NULL, 2, 50.00000, 0, 0, 0, 0, 0, 0, NULL, 0, NULL, 0),
(65, 2, 19, 'aggregation', 1365654098, 2, 10, 3, NULL, 100.00000, 0.00000, NULL, NULL, 75.00000, 0, 0, 0, 0, 0, 0, NULL, 0, NULL, 0),
(66, 1, 22, 'mod/attforblock', 1365654365, 2, 14, 3, 100.00000, 100.00000, 0.00000, NULL, 2, 100.00000, 0, 0, 0, 0, 0, 0, NULL, 0, NULL, 0),
(67, 2, 19, 'aggregation', 1365654365, 2, 10, 3, NULL, 100.00000, 0.00000, NULL, NULL, 83.33333, 0, 0, 0, 0, 0, 0, NULL, 0, NULL, 0),
(68, 1, 23, 'mod/attforblock', 1365654365, 2, 14, 4, 100.00000, 100.00000, 0.00000, NULL, 2, 100.00000, 0, 0, 0, 0, 0, 0, NULL, 0, NULL, 0),
(69, 2, 17, 'aggregation', 1365654365, 2, 10, 4, NULL, 100.00000, 0.00000, NULL, NULL, 66.66667, 0, 0, 0, 0, 0, 0, NULL, 0, NULL, 0),
(70, 2, 22, 'mod/attforblock', 1365654398, 2, 14, 3, 50.00000, 100.00000, 0.00000, NULL, 2, 50.00000, 0, 0, 0, 0, 0, 0, NULL, 0, NULL, 0),
(71, 2, 19, 'aggregation', 1365654398, 2, 10, 3, NULL, 100.00000, 0.00000, NULL, NULL, 66.66667, 0, 0, 0, 0, 0, 0, NULL, 0, NULL, 0),
(72, 2, 23, 'mod/attforblock', 1365654398, 2, 14, 4, 50.00000, 100.00000, 0.00000, NULL, 2, 50.00000, 0, 0, 0, 0, 0, 0, NULL, 0, NULL, 0),
(73, 2, 17, 'aggregation', 1365654398, 2, 10, 4, NULL, 100.00000, 0.00000, NULL, NULL, 50.00000, 0, 0, 0, 0, 0, 0, NULL, 0, NULL, 0),
(74, 2, 22, 'mod/attforblock', 1365654423, 2, 14, 3, 33.33333, 100.00000, 0.00000, NULL, 2, 33.33333, 0, 0, 0, 0, 0, 0, NULL, 0, NULL, 0),
(75, 2, 19, 'aggregation', 1365654423, 2, 10, 3, NULL, 100.00000, 0.00000, NULL, NULL, 61.11111, 0, 0, 0, 0, 0, 0, NULL, 0, NULL, 0),
(76, 2, 23, 'mod/attforblock', 1365654423, 2, 14, 4, 66.66667, 100.00000, 0.00000, NULL, 2, 66.66667, 0, 0, 0, 0, 0, 0, NULL, 0, NULL, 0),
(77, 2, 17, 'aggregation', 1365654424, 2, 10, 4, NULL, 100.00000, 0.00000, NULL, NULL, 55.55556, 0, 0, 0, 0, 0, 0, NULL, 0, NULL, 0),
(78, 1, 24, 'mod/attforblock', 1365654453, 2, 16, 12, 100.00000, 100.00000, 0.00000, NULL, 2, 100.00000, 0, 0, 0, 0, 0, 0, NULL, 0, NULL, 0),
(79, 1, 25, 'system', 1365654453, 2, 15, 12, NULL, 100.00000, 0.00000, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, NULL, 0, NULL, 0),
(80, 2, 25, 'aggregation', 1365654453, 2, 15, 12, NULL, 100.00000, 0.00000, NULL, NULL, 100.00000, 0, 0, 0, 0, 0, 0, NULL, 0, NULL, 0),
(81, 1, 26, 'mod/attforblock', 1365654453, 2, 16, 4, 100.00000, 100.00000, 0.00000, NULL, 2, 100.00000, 0, 0, 0, 0, 0, 0, NULL, 0, NULL, 0),
(82, 1, 27, 'system', 1365654453, 2, 15, 4, NULL, 100.00000, 0.00000, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, NULL, 0, NULL, 0),
(83, 2, 27, 'aggregation', 1365654453, 2, 15, 4, NULL, 100.00000, 0.00000, NULL, NULL, 100.00000, 0, 0, 0, 0, 0, 0, NULL, 0, NULL, 0);

-- --------------------------------------------------------

--
-- Table structure for table `mdl_grade_import_newitem`
--

CREATE TABLE IF NOT EXISTS `mdl_grade_import_newitem` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `itemname` varchar(255) NOT NULL DEFAULT '',
  `importcode` bigint(10) NOT NULL,
  `importer` bigint(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_gradimponewi_imp_ix` (`importer`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='temporary table for storing new grade_item names from grade ' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_grade_import_values`
--

CREATE TABLE IF NOT EXISTS `mdl_grade_import_values` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `itemid` bigint(10) DEFAULT NULL,
  `newgradeitem` bigint(10) DEFAULT NULL,
  `userid` bigint(10) NOT NULL,
  `finalgrade` decimal(10,5) DEFAULT NULL,
  `feedback` longtext,
  `importcode` bigint(10) NOT NULL,
  `importer` bigint(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_gradimpovalu_ite_ix` (`itemid`),
  KEY `mdl_gradimpovalu_new_ix` (`newgradeitem`),
  KEY `mdl_gradimpovalu_imp_ix` (`importer`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Temporary table for importing grades' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_grade_items`
--

CREATE TABLE IF NOT EXISTS `mdl_grade_items` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `courseid` bigint(10) DEFAULT NULL,
  `categoryid` bigint(10) DEFAULT NULL,
  `itemname` varchar(255) DEFAULT NULL,
  `itemtype` varchar(30) NOT NULL DEFAULT '',
  `itemmodule` varchar(30) DEFAULT NULL,
  `iteminstance` bigint(10) DEFAULT NULL,
  `itemnumber` bigint(10) DEFAULT NULL,
  `iteminfo` longtext,
  `idnumber` varchar(255) DEFAULT NULL,
  `calculation` longtext,
  `gradetype` smallint(4) NOT NULL DEFAULT '1',
  `grademax` decimal(10,5) NOT NULL DEFAULT '100.00000',
  `grademin` decimal(10,5) NOT NULL DEFAULT '0.00000',
  `scaleid` bigint(10) DEFAULT NULL,
  `outcomeid` bigint(10) DEFAULT NULL,
  `gradepass` decimal(10,5) NOT NULL DEFAULT '0.00000',
  `multfactor` decimal(10,5) NOT NULL DEFAULT '1.00000',
  `plusfactor` decimal(10,5) NOT NULL DEFAULT '0.00000',
  `aggregationcoef` decimal(10,5) NOT NULL DEFAULT '0.00000',
  `sortorder` bigint(10) NOT NULL DEFAULT '0',
  `display` bigint(10) NOT NULL DEFAULT '0',
  `decimals` tinyint(1) DEFAULT NULL,
  `hidden` bigint(10) NOT NULL DEFAULT '0',
  `locked` bigint(10) NOT NULL DEFAULT '0',
  `locktime` bigint(10) NOT NULL DEFAULT '0',
  `needsupdate` bigint(10) NOT NULL DEFAULT '0',
  `timecreated` bigint(10) DEFAULT NULL,
  `timemodified` bigint(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_graditem_locloc_ix` (`locked`,`locktime`),
  KEY `mdl_graditem_itenee_ix` (`itemtype`,`needsupdate`),
  KEY `mdl_graditem_gra_ix` (`gradetype`),
  KEY `mdl_graditem_idncou_ix` (`idnumber`,`courseid`),
  KEY `mdl_graditem_cou_ix` (`courseid`),
  KEY `mdl_graditem_cat_ix` (`categoryid`),
  KEY `mdl_graditem_sca_ix` (`scaleid`),
  KEY `mdl_graditem_out_ix` (`outcomeid`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='This table keeps information about gradeable items (ie colum' AUTO_INCREMENT=17 ;

--
-- Dumping data for table `mdl_grade_items`
--

INSERT INTO `mdl_grade_items` (`id`, `courseid`, `categoryid`, `itemname`, `itemtype`, `itemmodule`, `iteminstance`, `itemnumber`, `iteminfo`, `idnumber`, `calculation`, `gradetype`, `grademax`, `grademin`, `scaleid`, `outcomeid`, `gradepass`, `multfactor`, `plusfactor`, `aggregationcoef`, `sortorder`, `display`, `decimals`, `hidden`, `locked`, `locktime`, `needsupdate`, `timecreated`, `timemodified`) VALUES
(10, 5, NULL, NULL, 'course', NULL, 4, NULL, NULL, NULL, NULL, 1, 100.00000, 0.00000, NULL, NULL, 0.00000, 1.00000, 0.00000, 0.00000, 1, 0, NULL, 0, 0, 0, 0, 1365625831, 1365625831),
(12, 5, 4, 'Attendance', 'mod', 'attforblock', 3, 0, NULL, NULL, NULL, 1, 100.00000, 0.00000, NULL, NULL, 0.00000, 1.00000, 0.00000, 0.00000, 2, 0, NULL, 0, 0, 0, 0, 1365626092, 1365626092),
(13, 5, 4, 'Attendance', 'mod', 'attforblock', 4, 0, NULL, NULL, NULL, 1, 100.00000, 0.00000, NULL, NULL, 0.00000, 1.00000, 0.00000, 0.00000, 3, 0, NULL, 0, 0, 0, 0, 1365626287, 1365626287),
(14, 5, 4, 'Attendance', 'mod', 'attforblock', 5, 0, NULL, NULL, NULL, 1, 100.00000, 0.00000, NULL, NULL, 0.00000, 1.00000, 0.00000, 0.00000, 4, 0, NULL, 0, 0, 0, 0, 1365654231, 1365654231),
(15, 6, NULL, NULL, 'course', NULL, 5, NULL, NULL, NULL, NULL, 1, 100.00000, 0.00000, NULL, NULL, 0.00000, 1.00000, 0.00000, 0.00000, 1, 0, NULL, 0, 0, 0, 0, 1365654336, 1365654336),
(16, 6, 5, 'Attendance', 'mod', 'attforblock', 6, 0, NULL, NULL, NULL, 1, 100.00000, 0.00000, NULL, NULL, 0.00000, 1.00000, 0.00000, 0.00000, 2, 0, NULL, 0, 0, 0, 0, 1365654336, 1365654336);

-- --------------------------------------------------------

--
-- Table structure for table `mdl_grade_items_history`
--

CREATE TABLE IF NOT EXISTS `mdl_grade_items_history` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `action` bigint(10) NOT NULL DEFAULT '0',
  `oldid` bigint(10) NOT NULL,
  `source` varchar(255) DEFAULT NULL,
  `timemodified` bigint(10) DEFAULT NULL,
  `loggeduser` bigint(10) DEFAULT NULL,
  `courseid` bigint(10) DEFAULT NULL,
  `categoryid` bigint(10) DEFAULT NULL,
  `itemname` varchar(255) DEFAULT NULL,
  `itemtype` varchar(30) NOT NULL DEFAULT '',
  `itemmodule` varchar(30) DEFAULT NULL,
  `iteminstance` bigint(10) DEFAULT NULL,
  `itemnumber` bigint(10) DEFAULT NULL,
  `iteminfo` longtext,
  `idnumber` varchar(255) DEFAULT NULL,
  `calculation` longtext,
  `gradetype` smallint(4) NOT NULL DEFAULT '1',
  `grademax` decimal(10,5) NOT NULL DEFAULT '100.00000',
  `grademin` decimal(10,5) NOT NULL DEFAULT '0.00000',
  `scaleid` bigint(10) DEFAULT NULL,
  `outcomeid` bigint(10) DEFAULT NULL,
  `gradepass` decimal(10,5) NOT NULL DEFAULT '0.00000',
  `multfactor` decimal(10,5) NOT NULL DEFAULT '1.00000',
  `plusfactor` decimal(10,5) NOT NULL DEFAULT '0.00000',
  `aggregationcoef` decimal(10,5) NOT NULL DEFAULT '0.00000',
  `sortorder` bigint(10) NOT NULL DEFAULT '0',
  `hidden` bigint(10) NOT NULL DEFAULT '0',
  `locked` bigint(10) NOT NULL DEFAULT '0',
  `locktime` bigint(10) NOT NULL DEFAULT '0',
  `needsupdate` bigint(10) NOT NULL DEFAULT '0',
  `display` bigint(10) NOT NULL DEFAULT '0',
  `decimals` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_graditemhist_act_ix` (`action`),
  KEY `mdl_graditemhist_old_ix` (`oldid`),
  KEY `mdl_graditemhist_cou_ix` (`courseid`),
  KEY `mdl_graditemhist_cat_ix` (`categoryid`),
  KEY `mdl_graditemhist_sca_ix` (`scaleid`),
  KEY `mdl_graditemhist_out_ix` (`outcomeid`),
  KEY `mdl_graditemhist_log_ix` (`loggeduser`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='History of grade_items' AUTO_INCREMENT=27 ;

--
-- Dumping data for table `mdl_grade_items_history`
--

INSERT INTO `mdl_grade_items_history` (`id`, `action`, `oldid`, `source`, `timemodified`, `loggeduser`, `courseid`, `categoryid`, `itemname`, `itemtype`, `itemmodule`, `iteminstance`, `itemnumber`, `iteminfo`, `idnumber`, `calculation`, `gradetype`, `grademax`, `grademin`, `scaleid`, `outcomeid`, `gradepass`, `multfactor`, `plusfactor`, `aggregationcoef`, `sortorder`, `hidden`, `locked`, `locktime`, `needsupdate`, `display`, `decimals`) VALUES
(1, 1, 1, 'system', 1365531724, 5, 2, NULL, NULL, 'course', NULL, 1, NULL, NULL, NULL, NULL, 1, 100.00000, 0.00000, NULL, NULL, 0.00000, 1.00000, 0.00000, 0.00000, 1, 0, 0, 0, 1, 0, NULL),
(2, 1, 2, NULL, 1365531724, 5, 2, 1, 'Attendance', 'mod', 'attforblock', 1, 0, NULL, NULL, NULL, 1, 100.00000, 0.00000, NULL, NULL, 0.00000, 1.00000, 0.00000, 0.00000, 2, 0, 0, 0, 1, 0, NULL),
(3, 1, 3, NULL, 1365534053, 5, 2, 1, 'Attendance', 'mod', 'attforblock', 2, 0, NULL, NULL, NULL, 1, 100.00000, 0.00000, NULL, NULL, 0.00000, 1.00000, 0.00000, 0.00000, 3, 0, 0, 0, 1, 0, NULL),
(4, 1, 4, 'system', 1365622846, 2, 4, NULL, NULL, 'course', NULL, 2, NULL, NULL, NULL, NULL, 1, 100.00000, 0.00000, NULL, NULL, 0.00000, 1.00000, 0.00000, 0.00000, 1, 0, 0, 0, 1, 0, NULL),
(5, 1, 5, NULL, 1365622846, 2, 4, 2, 'Attendance', 'mod', 'attforblock', 3, 0, NULL, NULL, NULL, 1, 100.00000, 0.00000, NULL, NULL, 0.00000, 1.00000, 0.00000, 0.00000, 2, 0, 0, 0, 1, 0, NULL),
(6, 1, 6, 'system', 1365622865, 2, 3, NULL, NULL, 'course', NULL, 3, NULL, NULL, NULL, NULL, 1, 100.00000, 0.00000, NULL, NULL, 0.00000, 1.00000, 0.00000, 0.00000, 1, 0, 0, 0, 1, 0, NULL),
(7, 1, 7, NULL, 1365622865, 2, 3, 3, 'Attendance', 'mod', 'attforblock', 4, 0, NULL, NULL, NULL, 1, 100.00000, 0.00000, NULL, NULL, 0.00000, 1.00000, 0.00000, 0.00000, 2, 0, 0, 0, 1, 0, NULL),
(8, 1, 8, NULL, 1365624749, 2, 3, 3, 'Attendance', 'mod', 'attforblock', 1, 0, NULL, NULL, NULL, 1, 100.00000, 0.00000, NULL, NULL, 0.00000, 1.00000, 0.00000, 0.00000, 3, 0, 0, 0, 1, 0, NULL),
(9, 1, 9, NULL, 1365624755, 2, 4, 2, 'Attendance', 'mod', 'attforblock', 2, 0, NULL, NULL, NULL, 1, 100.00000, 0.00000, NULL, NULL, 0.00000, 1.00000, 0.00000, 0.00000, 3, 0, 0, 0, 1, 0, NULL),
(10, 3, 5, 'coursedelete', 1365625706, 2, 4, 2, 'Attendance', 'mod', 'attforblock', 3, 0, NULL, NULL, NULL, 1, 100.00000, 0.00000, NULL, NULL, 0.00000, 1.00000, 0.00000, 0.00000, 2, 0, 0, 0, 1, 0, NULL),
(11, 3, 9, 'coursedelete', 1365625706, 2, 4, 2, 'Attendance', 'mod', 'attforblock', 2, 0, NULL, NULL, NULL, 1, 100.00000, 0.00000, NULL, NULL, 0.00000, 1.00000, 0.00000, 0.00000, 3, 0, 0, 0, 1, 0, NULL),
(12, 3, 4, 'coursedelete', 1365625706, 2, 4, NULL, NULL, 'course', NULL, 2, NULL, NULL, NULL, NULL, 1, 100.00000, 0.00000, NULL, NULL, 0.00000, 1.00000, 0.00000, 0.00000, 1, 0, 0, 0, 0, 0, NULL),
(13, 3, 7, 'coursedelete', 1365625722, 2, 3, 3, 'Attendance', 'mod', 'attforblock', 4, 0, NULL, NULL, NULL, 1, 100.00000, 0.00000, NULL, NULL, 0.00000, 1.00000, 0.00000, 0.00000, 2, 0, 0, 0, 1, 0, NULL),
(14, 3, 8, 'coursedelete', 1365625722, 2, 3, 3, 'Attendance', 'mod', 'attforblock', 1, 0, NULL, NULL, NULL, 1, 100.00000, 0.00000, NULL, NULL, 0.00000, 1.00000, 0.00000, 0.00000, 3, 0, 0, 0, 1, 0, NULL),
(15, 3, 6, 'coursedelete', 1365625722, 2, 3, NULL, NULL, 'course', NULL, 3, NULL, NULL, NULL, NULL, 1, 100.00000, 0.00000, NULL, NULL, 0.00000, 1.00000, 0.00000, 0.00000, 1, 0, 0, 0, 0, 0, NULL),
(16, 3, 2, 'coursedelete', 1365625737, 2, 2, 1, 'Attendance', 'mod', 'attforblock', 1, 0, NULL, NULL, NULL, 1, 100.00000, 0.00000, NULL, NULL, 0.00000, 1.00000, 0.00000, 0.00000, 2, 0, 0, 0, 1, 0, NULL),
(17, 3, 3, 'coursedelete', 1365625737, 2, 2, 1, 'Attendance', 'mod', 'attforblock', 2, 0, NULL, NULL, NULL, 1, 100.00000, 0.00000, NULL, NULL, 0.00000, 1.00000, 0.00000, 0.00000, 3, 0, 0, 0, 1, 0, NULL),
(18, 3, 1, 'coursedelete', 1365625737, 2, 2, NULL, NULL, 'course', NULL, 1, NULL, NULL, NULL, NULL, 1, 100.00000, 0.00000, NULL, NULL, 0.00000, 1.00000, 0.00000, 0.00000, 1, 0, 0, 0, 0, 0, NULL),
(19, 1, 10, 'system', 1365625831, 2, 5, NULL, NULL, 'course', NULL, 4, NULL, NULL, NULL, NULL, 1, 100.00000, 0.00000, NULL, NULL, 0.00000, 1.00000, 0.00000, 0.00000, 1, 0, 0, 0, 1, 0, NULL),
(20, 1, 11, NULL, 1365625831, 2, 5, 4, 'Attendance', 'mod', 'attforblock', 2, 0, NULL, NULL, NULL, 1, 100.00000, 0.00000, NULL, NULL, 0.00000, 1.00000, 0.00000, 0.00000, 2, 0, 0, 0, 1, 0, NULL),
(21, 3, 11, 'mod/attforblock', 1365625921, 2, 5, 4, 'Attendance', 'mod', 'attforblock', 2, 0, NULL, NULL, NULL, 1, 100.00000, 0.00000, NULL, NULL, 0.00000, 1.00000, 0.00000, 0.00000, 2, 0, 0, 0, 1, 0, NULL),
(22, 1, 12, NULL, 1365626092, 2, 5, 4, 'Attendance', 'mod', 'attforblock', 3, 0, NULL, NULL, NULL, 1, 100.00000, 0.00000, NULL, NULL, 0.00000, 1.00000, 0.00000, 0.00000, 2, 0, 0, 0, 1, 0, NULL),
(23, 1, 13, NULL, 1365626287, 2, 5, 4, 'Attendance', 'mod', 'attforblock', 4, 0, NULL, NULL, NULL, 1, 100.00000, 0.00000, NULL, NULL, 0.00000, 1.00000, 0.00000, 0.00000, 3, 0, 0, 0, 1, 0, NULL),
(24, 1, 14, NULL, 1365654232, 2, 5, 4, 'Attendance', 'mod', 'attforblock', 5, 0, NULL, NULL, NULL, 1, 100.00000, 0.00000, NULL, NULL, 0.00000, 1.00000, 0.00000, 0.00000, 4, 0, 0, 0, 1, 0, NULL),
(25, 1, 15, 'system', 1365654336, 2, 6, NULL, NULL, 'course', NULL, 5, NULL, NULL, NULL, NULL, 1, 100.00000, 0.00000, NULL, NULL, 0.00000, 1.00000, 0.00000, 0.00000, 1, 0, 0, 0, 1, 0, NULL),
(26, 1, 16, NULL, 1365654336, 2, 6, 5, 'Attendance', 'mod', 'attforblock', 6, 0, NULL, NULL, NULL, 1, 100.00000, 0.00000, NULL, NULL, 0.00000, 1.00000, 0.00000, 0.00000, 2, 0, 0, 0, 1, 0, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `mdl_grade_letters`
--

CREATE TABLE IF NOT EXISTS `mdl_grade_letters` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `contextid` bigint(10) NOT NULL,
  `lowerboundary` decimal(10,5) NOT NULL,
  `letter` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_gradlett_conlowlet_uix` (`contextid`,`lowerboundary`,`letter`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Repository for grade letters, for courses and other moodle e' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_grade_outcomes`
--

CREATE TABLE IF NOT EXISTS `mdl_grade_outcomes` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `courseid` bigint(10) DEFAULT NULL,
  `shortname` varchar(255) NOT NULL DEFAULT '',
  `fullname` longtext NOT NULL,
  `scaleid` bigint(10) DEFAULT NULL,
  `description` longtext,
  `descriptionformat` tinyint(2) NOT NULL DEFAULT '0',
  `timecreated` bigint(10) DEFAULT NULL,
  `timemodified` bigint(10) DEFAULT NULL,
  `usermodified` bigint(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_gradoutc_cousho_uix` (`courseid`,`shortname`),
  KEY `mdl_gradoutc_cou_ix` (`courseid`),
  KEY `mdl_gradoutc_sca_ix` (`scaleid`),
  KEY `mdl_gradoutc_use_ix` (`usermodified`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='This table describes the outcomes used in the system. An out' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_grade_outcomes_courses`
--

CREATE TABLE IF NOT EXISTS `mdl_grade_outcomes_courses` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `courseid` bigint(10) NOT NULL,
  `outcomeid` bigint(10) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_gradoutccour_couout_uix` (`courseid`,`outcomeid`),
  KEY `mdl_gradoutccour_cou_ix` (`courseid`),
  KEY `mdl_gradoutccour_out_ix` (`outcomeid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='stores what outcomes are used in what courses.' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_grade_outcomes_history`
--

CREATE TABLE IF NOT EXISTS `mdl_grade_outcomes_history` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `action` bigint(10) NOT NULL DEFAULT '0',
  `oldid` bigint(10) NOT NULL,
  `source` varchar(255) DEFAULT NULL,
  `timemodified` bigint(10) DEFAULT NULL,
  `loggeduser` bigint(10) DEFAULT NULL,
  `courseid` bigint(10) DEFAULT NULL,
  `shortname` varchar(255) NOT NULL DEFAULT '',
  `fullname` longtext NOT NULL,
  `scaleid` bigint(10) DEFAULT NULL,
  `description` longtext,
  `descriptionformat` tinyint(2) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_gradoutchist_act_ix` (`action`),
  KEY `mdl_gradoutchist_old_ix` (`oldid`),
  KEY `mdl_gradoutchist_cou_ix` (`courseid`),
  KEY `mdl_gradoutchist_sca_ix` (`scaleid`),
  KEY `mdl_gradoutchist_log_ix` (`loggeduser`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='History table' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_grade_settings`
--

CREATE TABLE IF NOT EXISTS `mdl_grade_settings` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `courseid` bigint(10) NOT NULL,
  `name` varchar(255) NOT NULL DEFAULT '',
  `value` longtext,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_gradsett_counam_uix` (`courseid`,`name`),
  KEY `mdl_gradsett_cou_ix` (`courseid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='gradebook settings' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_gradingform_guide_comments`
--

CREATE TABLE IF NOT EXISTS `mdl_gradingform_guide_comments` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `definitionid` bigint(10) NOT NULL,
  `sortorder` bigint(10) NOT NULL,
  `description` longtext,
  `descriptionformat` tinyint(2) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_gradguidcomm_def_ix` (`definitionid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='frequently used comments used in marking guide' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_gradingform_guide_criteria`
--

CREATE TABLE IF NOT EXISTS `mdl_gradingform_guide_criteria` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `definitionid` bigint(10) NOT NULL,
  `sortorder` bigint(10) NOT NULL,
  `shortname` varchar(255) NOT NULL DEFAULT '',
  `description` longtext,
  `descriptionformat` tinyint(2) DEFAULT NULL,
  `descriptionmarkers` longtext,
  `descriptionmarkersformat` tinyint(2) DEFAULT NULL,
  `maxscore` decimal(10,5) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_gradguidcrit_def_ix` (`definitionid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Stores the rows of the criteria grid.' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_gradingform_guide_fillings`
--

CREATE TABLE IF NOT EXISTS `mdl_gradingform_guide_fillings` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `instanceid` bigint(10) NOT NULL,
  `criterionid` bigint(10) NOT NULL,
  `remark` longtext,
  `remarkformat` tinyint(2) DEFAULT NULL,
  `score` decimal(10,5) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_gradguidfill_inscri_uix` (`instanceid`,`criterionid`),
  KEY `mdl_gradguidfill_ins_ix` (`instanceid`),
  KEY `mdl_gradguidfill_cri_ix` (`criterionid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Stores the data of how the guide is filled by a particular r' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_gradingform_rubric_criteria`
--

CREATE TABLE IF NOT EXISTS `mdl_gradingform_rubric_criteria` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `definitionid` bigint(10) NOT NULL,
  `sortorder` bigint(10) NOT NULL,
  `description` longtext,
  `descriptionformat` tinyint(2) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_gradrubrcrit_def_ix` (`definitionid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Stores the rows of the rubric grid.' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_gradingform_rubric_fillings`
--

CREATE TABLE IF NOT EXISTS `mdl_gradingform_rubric_fillings` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `instanceid` bigint(10) NOT NULL,
  `criterionid` bigint(10) NOT NULL,
  `levelid` bigint(10) DEFAULT NULL,
  `remark` longtext,
  `remarkformat` tinyint(2) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_gradrubrfill_inscri_uix` (`instanceid`,`criterionid`),
  KEY `mdl_gradrubrfill_lev_ix` (`levelid`),
  KEY `mdl_gradrubrfill_ins_ix` (`instanceid`),
  KEY `mdl_gradrubrfill_cri_ix` (`criterionid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Stores the data of how the rubric is filled by a particular ' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_gradingform_rubric_levels`
--

CREATE TABLE IF NOT EXISTS `mdl_gradingform_rubric_levels` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `criterionid` bigint(10) NOT NULL,
  `score` decimal(10,5) NOT NULL,
  `definition` longtext,
  `definitionformat` bigint(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_gradrubrleve_cri_ix` (`criterionid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Stores the columns of the rubric grid.' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_grading_areas`
--

CREATE TABLE IF NOT EXISTS `mdl_grading_areas` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `contextid` bigint(10) NOT NULL,
  `component` varchar(100) NOT NULL DEFAULT '',
  `areaname` varchar(100) NOT NULL DEFAULT '',
  `activemethod` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_gradarea_concomare_uix` (`contextid`,`component`,`areaname`),
  KEY `mdl_gradarea_con_ix` (`contextid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Identifies gradable areas where advanced grading can happen.' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_grading_definitions`
--

CREATE TABLE IF NOT EXISTS `mdl_grading_definitions` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `areaid` bigint(10) NOT NULL,
  `method` varchar(100) NOT NULL DEFAULT '',
  `name` varchar(255) NOT NULL DEFAULT '',
  `description` longtext,
  `descriptionformat` tinyint(2) DEFAULT NULL,
  `status` bigint(10) NOT NULL DEFAULT '0',
  `copiedfromid` bigint(10) DEFAULT NULL,
  `timecreated` bigint(10) NOT NULL,
  `usercreated` bigint(10) NOT NULL,
  `timemodified` bigint(10) NOT NULL,
  `usermodified` bigint(10) NOT NULL,
  `timecopied` bigint(10) DEFAULT '0',
  `options` longtext,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_graddefi_aremet_uix` (`areaid`,`method`),
  KEY `mdl_graddefi_are_ix` (`areaid`),
  KEY `mdl_graddefi_use_ix` (`usermodified`),
  KEY `mdl_graddefi_use2_ix` (`usercreated`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Contains the basic information about an advanced grading for' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_grading_instances`
--

CREATE TABLE IF NOT EXISTS `mdl_grading_instances` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `definitionid` bigint(10) NOT NULL,
  `raterid` bigint(10) NOT NULL,
  `itemid` bigint(10) DEFAULT NULL,
  `rawgrade` decimal(10,5) DEFAULT NULL,
  `status` bigint(10) NOT NULL DEFAULT '0',
  `feedback` longtext,
  `feedbackformat` tinyint(2) DEFAULT NULL,
  `timemodified` bigint(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_gradinst_def_ix` (`definitionid`),
  KEY `mdl_gradinst_rat_ix` (`raterid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Grading form instance is an assessment record for one gradab' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_groupings`
--

CREATE TABLE IF NOT EXISTS `mdl_groupings` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `courseid` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `idnumber` varchar(100) NOT NULL DEFAULT '',
  `description` longtext,
  `descriptionformat` tinyint(2) NOT NULL DEFAULT '0',
  `configdata` longtext,
  `timecreated` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_grou_idn2_ix` (`idnumber`),
  KEY `mdl_grou_cou2_ix` (`courseid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='A grouping is a collection of groups. WAS: groups_groupings' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_groupings_groups`
--

CREATE TABLE IF NOT EXISTS `mdl_groupings_groups` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `groupingid` bigint(10) NOT NULL DEFAULT '0',
  `groupid` bigint(10) NOT NULL DEFAULT '0',
  `timeadded` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_grougrou_gro_ix` (`groupingid`),
  KEY `mdl_grougrou_gro2_ix` (`groupid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Link a grouping to a group (note, groups can be in multiple ' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_groups`
--

CREATE TABLE IF NOT EXISTS `mdl_groups` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `courseid` bigint(10) NOT NULL,
  `idnumber` varchar(100) NOT NULL DEFAULT '',
  `name` varchar(254) NOT NULL DEFAULT '',
  `description` longtext,
  `descriptionformat` tinyint(2) NOT NULL DEFAULT '0',
  `enrolmentkey` varchar(50) DEFAULT NULL,
  `picture` bigint(10) NOT NULL DEFAULT '0',
  `hidepicture` tinyint(1) NOT NULL DEFAULT '0',
  `timecreated` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_grou_idn_ix` (`idnumber`),
  KEY `mdl_grou_cou_ix` (`courseid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Each record represents a group.' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_groups_members`
--

CREATE TABLE IF NOT EXISTS `mdl_groups_members` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `groupid` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `timeadded` bigint(10) NOT NULL DEFAULT '0',
  `component` varchar(100) NOT NULL DEFAULT '',
  `itemid` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_groumemb_gro_ix` (`groupid`),
  KEY `mdl_groumemb_use_ix` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Link a user to a group.' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_imscp`
--

CREATE TABLE IF NOT EXISTS `mdl_imscp` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `course` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `intro` longtext,
  `introformat` smallint(4) NOT NULL DEFAULT '0',
  `revision` bigint(10) NOT NULL DEFAULT '0',
  `keepold` bigint(10) NOT NULL DEFAULT '-1',
  `structure` longtext,
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_imsc_cou_ix` (`course`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='each record is one imscp resource' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_label`
--

CREATE TABLE IF NOT EXISTS `mdl_label` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `course` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `intro` longtext NOT NULL,
  `introformat` smallint(4) DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_labe_cou_ix` (`course`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Defines labels' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_lesson`
--

CREATE TABLE IF NOT EXISTS `mdl_lesson` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `course` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `practice` smallint(3) NOT NULL DEFAULT '0',
  `modattempts` smallint(3) NOT NULL DEFAULT '0',
  `usepassword` smallint(3) NOT NULL DEFAULT '0',
  `password` varchar(32) NOT NULL DEFAULT '',
  `dependency` bigint(10) NOT NULL DEFAULT '0',
  `conditions` longtext NOT NULL,
  `grade` smallint(3) NOT NULL DEFAULT '0',
  `custom` smallint(3) NOT NULL DEFAULT '0',
  `ongoing` smallint(3) NOT NULL DEFAULT '0',
  `usemaxgrade` smallint(3) NOT NULL DEFAULT '0',
  `maxanswers` smallint(3) NOT NULL DEFAULT '4',
  `maxattempts` smallint(3) NOT NULL DEFAULT '5',
  `review` smallint(3) NOT NULL DEFAULT '0',
  `nextpagedefault` smallint(3) NOT NULL DEFAULT '0',
  `feedback` smallint(3) NOT NULL DEFAULT '1',
  `minquestions` smallint(3) NOT NULL DEFAULT '0',
  `maxpages` smallint(3) NOT NULL DEFAULT '0',
  `timed` smallint(3) NOT NULL DEFAULT '0',
  `maxtime` bigint(10) NOT NULL DEFAULT '0',
  `retake` smallint(3) NOT NULL DEFAULT '1',
  `activitylink` bigint(10) NOT NULL DEFAULT '0',
  `mediafile` varchar(255) NOT NULL DEFAULT '',
  `mediaheight` bigint(10) NOT NULL DEFAULT '100',
  `mediawidth` bigint(10) NOT NULL DEFAULT '650',
  `mediaclose` smallint(3) NOT NULL DEFAULT '0',
  `slideshow` smallint(3) NOT NULL DEFAULT '0',
  `width` bigint(10) NOT NULL DEFAULT '640',
  `height` bigint(10) NOT NULL DEFAULT '480',
  `bgcolor` varchar(7) NOT NULL DEFAULT '#FFFFFF',
  `displayleft` smallint(3) NOT NULL DEFAULT '0',
  `displayleftif` smallint(3) NOT NULL DEFAULT '0',
  `progressbar` smallint(3) NOT NULL DEFAULT '0',
  `highscores` smallint(3) NOT NULL DEFAULT '0',
  `maxhighscores` bigint(10) NOT NULL DEFAULT '0',
  `available` bigint(10) NOT NULL DEFAULT '0',
  `deadline` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_less_cou_ix` (`course`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Defines lesson' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_lesson_answers`
--

CREATE TABLE IF NOT EXISTS `mdl_lesson_answers` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `lessonid` bigint(10) NOT NULL DEFAULT '0',
  `pageid` bigint(10) NOT NULL DEFAULT '0',
  `jumpto` bigint(11) NOT NULL DEFAULT '0',
  `grade` smallint(4) NOT NULL DEFAULT '0',
  `score` bigint(10) NOT NULL DEFAULT '0',
  `flags` smallint(3) NOT NULL DEFAULT '0',
  `timecreated` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `answer` longtext,
  `answerformat` tinyint(2) NOT NULL DEFAULT '0',
  `response` longtext,
  `responseformat` tinyint(2) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_lessansw_les_ix` (`lessonid`),
  KEY `mdl_lessansw_pag_ix` (`pageid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Defines lesson_answers' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_lesson_attempts`
--

CREATE TABLE IF NOT EXISTS `mdl_lesson_attempts` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `lessonid` bigint(10) NOT NULL DEFAULT '0',
  `pageid` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `answerid` bigint(10) NOT NULL DEFAULT '0',
  `retry` smallint(3) NOT NULL DEFAULT '0',
  `correct` bigint(10) NOT NULL DEFAULT '0',
  `useranswer` longtext,
  `timeseen` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_lessatte_use_ix` (`userid`),
  KEY `mdl_lessatte_les_ix` (`lessonid`),
  KEY `mdl_lessatte_pag_ix` (`pageid`),
  KEY `mdl_lessatte_ans_ix` (`answerid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Defines lesson_attempts' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_lesson_branch`
--

CREATE TABLE IF NOT EXISTS `mdl_lesson_branch` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `lessonid` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `pageid` bigint(10) NOT NULL DEFAULT '0',
  `retry` bigint(10) NOT NULL DEFAULT '0',
  `flag` smallint(3) NOT NULL DEFAULT '0',
  `timeseen` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_lessbran_use_ix` (`userid`),
  KEY `mdl_lessbran_les_ix` (`lessonid`),
  KEY `mdl_lessbran_pag_ix` (`pageid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='branches for each lesson/user' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_lesson_grades`
--

CREATE TABLE IF NOT EXISTS `mdl_lesson_grades` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `lessonid` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `grade` double NOT NULL DEFAULT '0',
  `late` smallint(3) NOT NULL DEFAULT '0',
  `completed` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_lessgrad_use_ix` (`userid`),
  KEY `mdl_lessgrad_les_ix` (`lessonid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Defines lesson_grades' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_lesson_high_scores`
--

CREATE TABLE IF NOT EXISTS `mdl_lesson_high_scores` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `lessonid` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `gradeid` bigint(10) NOT NULL DEFAULT '0',
  `nickname` varchar(5) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `mdl_lesshighscor_use_ix` (`userid`),
  KEY `mdl_lesshighscor_les_ix` (`lessonid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='high scores for each lesson' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_lesson_pages`
--

CREATE TABLE IF NOT EXISTS `mdl_lesson_pages` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `lessonid` bigint(10) NOT NULL DEFAULT '0',
  `prevpageid` bigint(10) NOT NULL DEFAULT '0',
  `nextpageid` bigint(10) NOT NULL DEFAULT '0',
  `qtype` smallint(3) NOT NULL DEFAULT '0',
  `qoption` smallint(3) NOT NULL DEFAULT '0',
  `layout` smallint(3) NOT NULL DEFAULT '1',
  `display` smallint(3) NOT NULL DEFAULT '1',
  `timecreated` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `title` varchar(255) NOT NULL DEFAULT '',
  `contents` longtext NOT NULL,
  `contentsformat` tinyint(2) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_lesspage_les_ix` (`lessonid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Defines lesson_pages' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_lesson_timer`
--

CREATE TABLE IF NOT EXISTS `mdl_lesson_timer` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `lessonid` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `starttime` bigint(10) NOT NULL DEFAULT '0',
  `lessontime` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_lesstime_use_ix` (`userid`),
  KEY `mdl_lesstime_les_ix` (`lessonid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='lesson timer for each lesson' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_license`
--

CREATE TABLE IF NOT EXISTS `mdl_license` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `shortname` varchar(255) DEFAULT NULL,
  `fullname` longtext,
  `source` varchar(255) DEFAULT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  `version` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='store licenses used by moodle' AUTO_INCREMENT=10 ;

--
-- Dumping data for table `mdl_license`
--

INSERT INTO `mdl_license` (`id`, `shortname`, `fullname`, `source`, `enabled`, `version`) VALUES
(1, 'unknown', 'Unknown license', '', 1, 2010033100),
(2, 'allrightsreserved', 'All rights reserved', 'http://en.wikipedia.org/wiki/All_rights_reserved', 1, 2010033100),
(3, 'public', 'Public Domain', 'http://creativecommons.org/licenses/publicdomain/', 1, 2010033100),
(4, 'cc', 'Creative Commons', 'http://creativecommons.org/licenses/by/3.0/', 1, 2010033100),
(5, 'cc-nd', 'Creative Commons - NoDerivs', 'http://creativecommons.org/licenses/by-nd/3.0/', 1, 2010033100),
(6, 'cc-nc-nd', 'Creative Commons - No Commercial NoDerivs', 'http://creativecommons.org/licenses/by-nc-nd/3.0/', 1, 2010033100),
(7, 'cc-nc', 'Creative Commons - No Commercial', 'http://creativecommons.org/licenses/by-nd/3.0/', 1, 2010033100),
(8, 'cc-nc-sa', 'Creative Commons - No Commercial ShareAlike', 'http://creativecommons.org/licenses/by-nc-sa/3.0/', 1, 2010033100),
(9, 'cc-sa', 'Creative Commons - ShareAlike', 'http://creativecommons.org/licenses/by-sa/3.0/', 1, 2010033100);

-- --------------------------------------------------------

--
-- Table structure for table `mdl_log`
--

CREATE TABLE IF NOT EXISTS `mdl_log` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `time` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `ip` varchar(45) NOT NULL DEFAULT '',
  `course` bigint(10) NOT NULL DEFAULT '0',
  `module` varchar(20) NOT NULL DEFAULT '',
  `cmid` bigint(10) NOT NULL DEFAULT '0',
  `action` varchar(40) NOT NULL DEFAULT '',
  `url` varchar(100) NOT NULL DEFAULT '',
  `info` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `mdl_log_coumodact_ix` (`course`,`module`,`action`),
  KEY `mdl_log_tim_ix` (`time`),
  KEY `mdl_log_act_ix` (`action`),
  KEY `mdl_log_usecou_ix` (`userid`,`course`),
  KEY `mdl_log_cmi_ix` (`cmid`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Every action is logged as far as possible' AUTO_INCREMENT=142 ;

--
-- Dumping data for table `mdl_log`
--

INSERT INTO `mdl_log` (`id`, `time`, `userid`, `ip`, `course`, `module`, `cmid`, `action`, `url`, `info`) VALUES
(1, 1365449937, 2, '0:0:0:0:0:0:0:1', 1, 'user', 0, 'update', 'view.php?id=2&course=1', ''),
(2, 1365449984, 2, '0:0:0:0:0:0:0:1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(3, 1365530604, 2, '0:0:0:0:0:0:0:1', 1, 'user', 0, 'login', 'view.php?id=0&course=1', '2'),
(4, 1365530947, 2, '0:0:0:0:0:0:0:1', 1, 'course', 0, 'new', 'view.php?id=2', 'attendance (ID 2)'),
(5, 1365531073, 2, '0:0:0:0:0:0:0:1', 1, 'user', 0, 'add', 'view.php?id=3&course=1', ''),
(6, 1365531135, 2, '0:0:0:0:0:0:0:1', 1, 'user', 0, 'add', 'view.php?id=4&course=1', ''),
(7, 1365531522, 2, '0:0:0:0:0:0:0:1', 1, 'user', 0, 'add', 'view.php?id=5&course=1', ''),
(8, 1365531615, 5, '0:0:0:0:0:0:0:1', 1, 'user', 0, 'login', 'view.php?id=0&course=1', '5'),
(9, 1365531618, 5, '0:0:0:0:0:0:0:1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(31, 1365609353, 2, '0:0:0:0:0:0:0:1', 1, 'user', 0, 'login', 'view.php?id=0&course=1', '2'),
(32, 1365609358, 2, '0:0:0:0:0:0:0:1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(34, 1365620781, 2, '0:0:0:0:0:0:0:1', 1, 'user', 0, 'login', 'view.php?id=0&course=1', '2'),
(41, 1365622649, 2, '0:0:0:0:0:0:0:1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(42, 1365622715, 2, '0:0:0:0:0:0:0:1', 1, 'course', 0, 'new', 'view.php?id=3', 't2 (ID 3)'),
(43, 1365622728, 2, '0:0:0:0:0:0:0:1', 1, 'course', 0, 'new', 'view.php?id=4', 'i3 (ID 4)'),
(88, 1365625673, 2, '0:0:0:0:0:0:0:1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(89, 1365625703, 2, '0:0:0:0:0:0:0:1', 1, 'course', 0, 'delete', 'view.php?id=4', 'i3 (ID 4)'),
(90, 1365625720, 2, '0:0:0:0:0:0:0:1', 1, 'course', 0, 'delete', 'view.php?id=3', 't2 (ID 3)'),
(91, 1365625735, 2, '0:0:0:0:0:0:0:1', 1, 'course', 0, 'delete', 'view.php?id=2', 'attendance (ID 2)'),
(92, 1365625777, 2, '0:0:0:0:0:0:0:1', 1, 'course', 0, 'new', 'view.php?id=5', 'W (ID 5)'),
(93, 1365625812, 2, '0:0:0:0:0:0:0:1', 5, 'course', 0, 'view', 'view.php?id=5', '5'),
(94, 1365625817, 2, '0:0:0:0:0:0:0:1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(95, 1365625831, 2, '0:0:0:0:0:0:0:1', 5, 'course', 0, 'add mod', '../mod/attforblock/view.php?id=12', 'attforblock 2'),
(96, 1365625831, 2, '0:0:0:0:0:0:0:1', 5, 'attforblock', 12, 'add', 'view.php?id=12', '2'),
(97, 1365625854, 2, '0:0:0:0:0:0:0:1', 5, 'attforblock', 12, 'sessions added', 'manage.php?id=12', '10.04.13&nbsp;(Wed) 22:30, 11.04.13&nbsp;(Thu) 22:30, 12.04.13&nbsp;(Fri) 22:30, 13.04.13&nbsp;(Sat) 22:30'),
(98, 1365625913, 2, '0:0:0:0:0:0:0:1', 5, 'course', 0, 'view', 'view.php?id=5', '5'),
(99, 1365625921, 2, '0:0:0:0:0:0:0:1', 5, 'course', 12, 'delete mod', 'view.php?id=5', 'attforblock 2'),
(100, 1365626078, 2, '0:0:0:0:0:0:0:1', 5, 'course', 0, 'view', 'view.php?id=5', '5'),
(101, 1365626092, 2, '0:0:0:0:0:0:0:1', 5, 'course', 0, 'add mod', '../mod/attforblock/view.php?id=13', 'attforblock 3'),
(102, 1365626092, 2, '0:0:0:0:0:0:0:1', 5, 'attforblock', 13, 'add', 'view.php?id=13', '3'),
(103, 1365626126, 2, '0:0:0:0:0:0:0:1', 5, 'attforblock', 13, 'sessions added', 'manage.php?id=13', '10.04.13&nbsp;(Wed) 22:35, 11.04.13&nbsp;(Thu) 22:35, 12.04.13&nbsp;(Fri) 22:35, 13.04.13&nbsp;(Sat) 22:35'),
(104, 1365626159, 2, '0:0:0:0:0:0:0:1', 5, 'attforblock', 13, 'report viewed', 'manage.php?id=13', 'Admin User'),
(105, 1365626182, 2, '0:0:0:0:0:0:0:1', 5, 'attforblock', 13, 'attendance taked', 'take.php?id=13&sessionid=10&grouptype=0', 'Admin User'),
(106, 1365626206, 2, '0:0:0:0:0:0:0:1', 5, 'attforblock', 13, 'attendance taked', 'take.php?id=13&sessionid=11&grouptype=0', 'Admin User'),
(107, 1365626223, 2, '0:0:0:0:0:0:0:1', 5, 'attforblock', 13, 'attendance taked', 'take.php?id=13&sessionid=12&grouptype=0', 'Admin User'),
(108, 1365626253, 2, '0:0:0:0:0:0:0:1', 5, 'attforblock', 13, 'attendance taked', 'take.php?id=13&sessionid=12&grouptype=0', 'Admin User'),
(109, 1365626270, 2, '0:0:0:0:0:0:0:1', 5, 'course', 0, 'view', 'view.php?id=5', '5'),
(110, 1365626287, 2, '0:0:0:0:0:0:0:1', 5, 'course', 0, 'add mod', '../mod/attforblock/view.php?id=14', 'attforblock 4'),
(111, 1365626287, 2, '0:0:0:0:0:0:0:1', 5, 'attforblock', 14, 'add', 'view.php?id=14', '4'),
(112, 1365626315, 2, '0:0:0:0:0:0:0:1', 5, 'attforblock', 14, 'sessions added', 'manage.php?id=14', '10.04.13&nbsp;(Wed) 22:35, 11.04.13&nbsp;(Thu) 22:35, 12.04.13&nbsp;(Fri) 22:35, 13.04.13&nbsp;(Sat) 22:35'),
(113, 1365626331, 2, '0:0:0:0:0:0:0:1', 5, 'attforblock', 14, 'report viewed', 'manage.php?id=14', 'Admin User'),
(114, 1365626343, 2, '0:0:0:0:0:0:0:1', 5, 'attforblock', 14, 'attendance taked', 'take.php?id=14&sessionid=14&grouptype=0', 'Admin User'),
(115, 1365653844, 0, '127.0.0.1', 1, 'login', 0, 'error', 'index.php', 'admin'),
(116, 1365653919, 2, '127.0.0.1', 1, 'user', 0, 'login', 'view.php?id=0&course=1', '2'),
(117, 1365653920, 2, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(118, 1365653927, 2, '127.0.0.1', 5, 'course', 0, 'view', 'view.php?id=5', '5'),
(119, 1365653933, 2, '127.0.0.1', 5, 'course', 0, 'view', 'view.php?id=5', '5'),
(120, 1365653934, 2, '127.0.0.1', 5, 'course', 0, 'view', 'view.php?id=5', '5'),
(121, 1365654037, 2, '127.0.0.1', 5, 'course', 0, 'view', 'view.php?id=5', '5'),
(122, 1365654067, 2, '127.0.0.1', 5, 'attforblock', 14, 'attendance taked', 'take.php?id=14&sessionid=15&grouptype=0', 'Admin User'),
(123, 1365654099, 2, '127.0.0.1', 5, 'attforblock', 14, 'attendance taked', 'take.php?id=14&sessionid=16&grouptype=0', 'Admin User'),
(124, 1365654168, 2, '127.0.0.1', 5, 'course', 0, 'view', 'view.php?id=5', '5'),
(125, 1365654188, 2, '127.0.0.1', 5, 'attforblock', 13, 'report viewed', 'manage.php?id=13', 'Admin User'),
(126, 1365654196, 2, '127.0.0.1', 5, 'attforblock', 13, 'report viewed', 'manage.php?id=13', 'Admin User'),
(127, 1365654210, 2, '127.0.0.1', 5, 'course', 0, 'view', 'view.php?id=5', '5'),
(128, 1365654232, 2, '127.0.0.1', 5, 'course', 0, 'add mod', '../mod/attforblock/view.php?id=15', 'attforblock 5'),
(129, 1365654232, 2, '127.0.0.1', 5, 'attforblock', 15, 'add', 'view.php?id=15', '5'),
(130, 1365654242, 2, '127.0.0.1', 1, 'course', 0, 'new', 'view.php?id=6', 'T (ID 6)'),
(131, 1365654305, 2, '127.0.0.1', 5, 'attforblock', 15, 'sessions added', 'manage.php?id=15', '11.04.13&nbsp;(Thu) 06:20, 12.04.13&nbsp;(Fri) 06:20, 13.04.13&nbsp;(Sat) 06:20, 15.04.13&nbsp;(Mon) 06:20, 16.04.13&nbsp;(Tue) 06:20, 17.04.13&nbsp;(Wed) 06:20, 18.04.13&nbsp;(Thu) 06:20, 19.04.13&nbsp;(Fri) 06:20, 20.04.13&nbsp;(Sat) 06:20, 22.04.13&...'),
(132, 1365654313, 2, '127.0.0.1', 6, 'course', 0, 'view', 'view.php?id=6', '6'),
(133, 1365654332, 2, '127.0.0.1', 5, 'attforblock', 15, 'report viewed', 'manage.php?id=15', 'Admin User'),
(134, 1365654336, 2, '127.0.0.1', 6, 'course', 0, 'add mod', '../mod/attforblock/view.php?id=17', 'attforblock 6'),
(135, 1365654336, 2, '127.0.0.1', 6, 'attforblock', 17, 'add', 'view.php?id=17', '6'),
(136, 1365654365, 2, '127.0.0.1', 5, 'attforblock', 15, 'attendance taked', 'take.php?id=15&sessionid=17&grouptype=0', 'Admin User'),
(137, 1365654378, 2, '127.0.0.1', 6, 'attforblock', 17, 'sessions added', 'manage.php?id=17', '11.04.13&nbsp;(Thu) 06:25, 12.04.13&nbsp;(Fri) 06:25, 13.04.13&nbsp;(Sat) 06:25, 15.04.13&nbsp;(Mon) 06:25, 16.04.13&nbsp;(Tue) 06:25, 17.04.13&nbsp;(Wed) 06:25, 18.04.13&nbsp;(Thu) 06:25, 19.04.13&nbsp;(Fri) 06:25, 20.04.13&nbsp;(Sat) 06:25, 22.04.13&...'),
(138, 1365654394, 2, '127.0.0.1', 6, 'attforblock', 17, 'report viewed', 'manage.php?id=17', 'Admin User'),
(139, 1365654398, 2, '127.0.0.1', 5, 'attforblock', 15, 'attendance taked', 'take.php?id=15&sessionid=18&grouptype=0', 'Admin User'),
(140, 1365654424, 2, '127.0.0.1', 5, 'attforblock', 15, 'attendance taked', 'take.php?id=15&sessionid=19&grouptype=0', 'Admin User'),
(141, 1365654453, 2, '127.0.0.1', 6, 'attforblock', 17, 'attendance taked', 'take.php?id=17&sessionid=29&grouptype=0', 'Admin User');

-- --------------------------------------------------------

--
-- Table structure for table `mdl_log_display`
--

CREATE TABLE IF NOT EXISTS `mdl_log_display` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `module` varchar(20) NOT NULL DEFAULT '',
  `action` varchar(40) NOT NULL DEFAULT '',
  `mtable` varchar(30) NOT NULL DEFAULT '',
  `field` varchar(200) NOT NULL DEFAULT '',
  `component` varchar(100) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_logdisp_modact_uix` (`module`,`action`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='For a particular module/action, specifies a moodle table/fie' AUTO_INCREMENT=184 ;

--
-- Dumping data for table `mdl_log_display`
--

INSERT INTO `mdl_log_display` (`id`, `module`, `action`, `mtable`, `field`, `component`) VALUES
(1, 'course', 'user report', 'user', 'CONCAT(firstname, '' '', lastname)', 'moodle'),
(2, 'course', 'view', 'course', 'fullname', 'moodle'),
(3, 'course', 'view section', 'course_sections', 'name', 'moodle'),
(4, 'course', 'update', 'course', 'fullname', 'moodle'),
(5, 'course', 'hide', 'course', 'fullname', 'moodle'),
(6, 'course', 'show', 'course', 'fullname', 'moodle'),
(7, 'course', 'move', 'course', 'fullname', 'moodle'),
(8, 'course', 'enrol', 'course', 'fullname', 'moodle'),
(9, 'course', 'unenrol', 'course', 'fullname', 'moodle'),
(10, 'course', 'report log', 'course', 'fullname', 'moodle'),
(11, 'course', 'report live', 'course', 'fullname', 'moodle'),
(12, 'course', 'report outline', 'course', 'fullname', 'moodle'),
(13, 'course', 'report participation', 'course', 'fullname', 'moodle'),
(14, 'course', 'report stats', 'course', 'fullname', 'moodle'),
(15, 'category', 'add', 'course_categories', 'name', 'moodle'),
(16, 'category', 'hide', 'course_categories', 'name', 'moodle'),
(17, 'category', 'move', 'course_categories', 'name', 'moodle'),
(18, 'category', 'show', 'course_categories', 'name', 'moodle'),
(19, 'category', 'update', 'course_categories', 'name', 'moodle'),
(20, 'message', 'write', 'user', 'CONCAT(firstname, '' '', lastname)', 'moodle'),
(21, 'message', 'read', 'user', 'CONCAT(firstname, '' '', lastname)', 'moodle'),
(22, 'message', 'add contact', 'user', 'CONCAT(firstname, '' '', lastname)', 'moodle'),
(23, 'message', 'remove contact', 'user', 'CONCAT(firstname, '' '', lastname)', 'moodle'),
(24, 'message', 'block contact', 'user', 'CONCAT(firstname, '' '', lastname)', 'moodle'),
(25, 'message', 'unblock contact', 'user', 'CONCAT(firstname, '' '', lastname)', 'moodle'),
(26, 'group', 'view', 'groups', 'name', 'moodle'),
(27, 'tag', 'update', 'tag', 'name', 'moodle'),
(28, 'tag', 'flag', 'tag', 'name', 'moodle'),
(29, 'user', 'view', 'user', 'CONCAT(firstname, '' '', lastname)', 'moodle'),
(30, 'assign', 'add', 'assign', 'name', 'mod_assign'),
(31, 'assign', 'delete mod', 'assign', 'name', 'mod_assign'),
(32, 'assign', 'download all submissions', 'assign', 'name', 'mod_assign'),
(33, 'assign', 'grade submission', 'assign', 'name', 'mod_assign'),
(34, 'assign', 'lock submission', 'assign', 'name', 'mod_assign'),
(35, 'assign', 'reveal identities', 'assign', 'name', 'mod_assign'),
(36, 'assign', 'revert submission to draft', 'assign', 'name', 'mod_assign'),
(37, 'assign', 'submission statement accepted', 'assign', 'name', 'mod_assign'),
(38, 'assign', 'submit', 'assign', 'name', 'mod_assign'),
(39, 'assign', 'submit for grading', 'assign', 'name', 'mod_assign'),
(40, 'assign', 'unlock submission', 'assign', 'name', 'mod_assign'),
(41, 'assign', 'update', 'assign', 'name', 'mod_assign'),
(42, 'assign', 'upload', 'assign', 'name', 'mod_assign'),
(43, 'assign', 'view', 'assign', 'name', 'mod_assign'),
(44, 'assign', 'view all', 'course', 'fullname', 'mod_assign'),
(45, 'assign', 'view confirm submit assignment form', 'assign', 'name', 'mod_assign'),
(46, 'assign', 'view grading form', 'assign', 'name', 'mod_assign'),
(47, 'assign', 'view submission', 'assign', 'name', 'mod_assign'),
(48, 'assign', 'view submission grading table', 'assign', 'name', 'mod_assign'),
(49, 'assign', 'view submit assignment form', 'assign', 'name', 'mod_assign'),
(50, 'assign', 'view feedback', 'assign', 'name', 'mod_assign'),
(51, 'assignment', 'view', 'assignment', 'name', 'mod_assignment'),
(52, 'assignment', 'add', 'assignment', 'name', 'mod_assignment'),
(53, 'assignment', 'update', 'assignment', 'name', 'mod_assignment'),
(54, 'assignment', 'view submission', 'assignment', 'name', 'mod_assignment'),
(55, 'assignment', 'upload', 'assignment', 'name', 'mod_assignment'),
(56, 'book', 'add', 'book', 'name', 'mod_book'),
(57, 'book', 'update', 'book', 'name', 'mod_book'),
(58, 'book', 'view', 'book', 'name', 'mod_book'),
(59, 'book', 'add chapter', 'book_chapters', 'title', 'mod_book'),
(60, 'book', 'update chapter', 'book_chapters', 'title', 'mod_book'),
(61, 'book', 'view chapter', 'book_chapters', 'title', 'mod_book'),
(62, 'chat', 'view', 'chat', 'name', 'mod_chat'),
(63, 'chat', 'add', 'chat', 'name', 'mod_chat'),
(64, 'chat', 'update', 'chat', 'name', 'mod_chat'),
(65, 'chat', 'report', 'chat', 'name', 'mod_chat'),
(66, 'chat', 'talk', 'chat', 'name', 'mod_chat'),
(67, 'choice', 'view', 'choice', 'name', 'mod_choice'),
(68, 'choice', 'update', 'choice', 'name', 'mod_choice'),
(69, 'choice', 'add', 'choice', 'name', 'mod_choice'),
(70, 'choice', 'report', 'choice', 'name', 'mod_choice'),
(71, 'choice', 'choose', 'choice', 'name', 'mod_choice'),
(72, 'choice', 'choose again', 'choice', 'name', 'mod_choice'),
(73, 'data', 'view', 'data', 'name', 'mod_data'),
(74, 'data', 'add', 'data', 'name', 'mod_data'),
(75, 'data', 'update', 'data', 'name', 'mod_data'),
(76, 'data', 'record delete', 'data', 'name', 'mod_data'),
(77, 'data', 'fields add', 'data_fields', 'name', 'mod_data'),
(78, 'data', 'fields update', 'data_fields', 'name', 'mod_data'),
(79, 'data', 'templates saved', 'data', 'name', 'mod_data'),
(80, 'data', 'templates def', 'data', 'name', 'mod_data'),
(81, 'feedback', 'startcomplete', 'feedback', 'name', 'mod_feedback'),
(82, 'feedback', 'submit', 'feedback', 'name', 'mod_feedback'),
(83, 'feedback', 'delete', 'feedback', 'name', 'mod_feedback'),
(84, 'feedback', 'view', 'feedback', 'name', 'mod_feedback'),
(85, 'feedback', 'view all', 'course', 'shortname', 'mod_feedback'),
(86, 'folder', 'view', 'folder', 'name', 'mod_folder'),
(87, 'folder', 'view all', 'folder', 'name', 'mod_folder'),
(88, 'folder', 'update', 'folder', 'name', 'mod_folder'),
(89, 'folder', 'add', 'folder', 'name', 'mod_folder'),
(90, 'forum', 'add', 'forum', 'name', 'mod_forum'),
(91, 'forum', 'update', 'forum', 'name', 'mod_forum'),
(92, 'forum', 'add discussion', 'forum_discussions', 'name', 'mod_forum'),
(93, 'forum', 'add post', 'forum_posts', 'subject', 'mod_forum'),
(94, 'forum', 'update post', 'forum_posts', 'subject', 'mod_forum'),
(95, 'forum', 'user report', 'user', 'CONCAT(firstname, '' '', lastname)', 'mod_forum'),
(96, 'forum', 'move discussion', 'forum_discussions', 'name', 'mod_forum'),
(97, 'forum', 'view subscribers', 'forum', 'name', 'mod_forum'),
(98, 'forum', 'view discussion', 'forum_discussions', 'name', 'mod_forum'),
(99, 'forum', 'view forum', 'forum', 'name', 'mod_forum'),
(100, 'forum', 'subscribe', 'forum', 'name', 'mod_forum'),
(101, 'forum', 'unsubscribe', 'forum', 'name', 'mod_forum'),
(102, 'glossary', 'add', 'glossary', 'name', 'mod_glossary'),
(103, 'glossary', 'update', 'glossary', 'name', 'mod_glossary'),
(104, 'glossary', 'view', 'glossary', 'name', 'mod_glossary'),
(105, 'glossary', 'view all', 'glossary', 'name', 'mod_glossary'),
(106, 'glossary', 'add entry', 'glossary', 'name', 'mod_glossary'),
(107, 'glossary', 'update entry', 'glossary', 'name', 'mod_glossary'),
(108, 'glossary', 'add category', 'glossary', 'name', 'mod_glossary'),
(109, 'glossary', 'update category', 'glossary', 'name', 'mod_glossary'),
(110, 'glossary', 'delete category', 'glossary', 'name', 'mod_glossary'),
(111, 'glossary', 'approve entry', 'glossary', 'name', 'mod_glossary'),
(112, 'glossary', 'view entry', 'glossary_entries', 'concept', 'mod_glossary'),
(113, 'imscp', 'view', 'imscp', 'name', 'mod_imscp'),
(114, 'imscp', 'view all', 'imscp', 'name', 'mod_imscp'),
(115, 'imscp', 'update', 'imscp', 'name', 'mod_imscp'),
(116, 'imscp', 'add', 'imscp', 'name', 'mod_imscp'),
(117, 'label', 'add', 'label', 'name', 'mod_label'),
(118, 'label', 'update', 'label', 'name', 'mod_label'),
(119, 'lesson', 'start', 'lesson', 'name', 'mod_lesson'),
(120, 'lesson', 'end', 'lesson', 'name', 'mod_lesson'),
(121, 'lesson', 'view', 'lesson_pages', 'title', 'mod_lesson'),
(122, 'lti', 'view', 'lti', 'name', 'mod_lti'),
(123, 'lti', 'launch', 'lti', 'name', 'mod_lti'),
(124, 'lti', 'view all', 'lti', 'name', 'mod_lti'),
(125, 'page', 'view', 'page', 'name', 'mod_page'),
(126, 'page', 'view all', 'page', 'name', 'mod_page'),
(127, 'page', 'update', 'page', 'name', 'mod_page'),
(128, 'page', 'add', 'page', 'name', 'mod_page'),
(129, 'quiz', 'add', 'quiz', 'name', 'mod_quiz'),
(130, 'quiz', 'update', 'quiz', 'name', 'mod_quiz'),
(131, 'quiz', 'view', 'quiz', 'name', 'mod_quiz'),
(132, 'quiz', 'report', 'quiz', 'name', 'mod_quiz'),
(133, 'quiz', 'attempt', 'quiz', 'name', 'mod_quiz'),
(134, 'quiz', 'submit', 'quiz', 'name', 'mod_quiz'),
(135, 'quiz', 'review', 'quiz', 'name', 'mod_quiz'),
(136, 'quiz', 'editquestions', 'quiz', 'name', 'mod_quiz'),
(137, 'quiz', 'preview', 'quiz', 'name', 'mod_quiz'),
(138, 'quiz', 'start attempt', 'quiz', 'name', 'mod_quiz'),
(139, 'quiz', 'close attempt', 'quiz', 'name', 'mod_quiz'),
(140, 'quiz', 'continue attempt', 'quiz', 'name', 'mod_quiz'),
(141, 'quiz', 'edit override', 'quiz', 'name', 'mod_quiz'),
(142, 'quiz', 'delete override', 'quiz', 'name', 'mod_quiz'),
(143, 'resource', 'view', 'resource', 'name', 'mod_resource'),
(144, 'resource', 'view all', 'resource', 'name', 'mod_resource'),
(145, 'resource', 'update', 'resource', 'name', 'mod_resource'),
(146, 'resource', 'add', 'resource', 'name', 'mod_resource'),
(147, 'scorm', 'view', 'scorm', 'name', 'mod_scorm'),
(148, 'scorm', 'review', 'scorm', 'name', 'mod_scorm'),
(149, 'scorm', 'update', 'scorm', 'name', 'mod_scorm'),
(150, 'scorm', 'add', 'scorm', 'name', 'mod_scorm'),
(151, 'survey', 'add', 'survey', 'name', 'mod_survey'),
(152, 'survey', 'update', 'survey', 'name', 'mod_survey'),
(153, 'survey', 'download', 'survey', 'name', 'mod_survey'),
(154, 'survey', 'view form', 'survey', 'name', 'mod_survey'),
(155, 'survey', 'view graph', 'survey', 'name', 'mod_survey'),
(156, 'survey', 'view report', 'survey', 'name', 'mod_survey'),
(157, 'survey', 'submit', 'survey', 'name', 'mod_survey'),
(158, 'url', 'view', 'url', 'name', 'mod_url'),
(159, 'url', 'view all', 'url', 'name', 'mod_url'),
(160, 'url', 'update', 'url', 'name', 'mod_url'),
(161, 'url', 'add', 'url', 'name', 'mod_url'),
(162, 'workshop', 'add', 'workshop', 'name', 'mod_workshop'),
(163, 'workshop', 'update', 'workshop', 'name', 'mod_workshop'),
(164, 'workshop', 'view', 'workshop', 'name', 'mod_workshop'),
(165, 'workshop', 'view all', 'workshop', 'name', 'mod_workshop'),
(166, 'workshop', 'add submission', 'workshop_submissions', 'title', 'mod_workshop'),
(167, 'workshop', 'update submission', 'workshop_submissions', 'title', 'mod_workshop'),
(168, 'workshop', 'view submission', 'workshop_submissions', 'title', 'mod_workshop'),
(169, 'workshop', 'add assessment', 'workshop_submissions', 'title', 'mod_workshop'),
(170, 'workshop', 'update assessment', 'workshop_submissions', 'title', 'mod_workshop'),
(171, 'workshop', 'add example', 'workshop_submissions', 'title', 'mod_workshop'),
(172, 'workshop', 'update example', 'workshop_submissions', 'title', 'mod_workshop'),
(173, 'workshop', 'view example', 'workshop_submissions', 'title', 'mod_workshop'),
(174, 'workshop', 'add reference assessment', 'workshop_submissions', 'title', 'mod_workshop'),
(175, 'workshop', 'update reference assessment', 'workshop_submissions', 'title', 'mod_workshop'),
(176, 'workshop', 'add example assessment', 'workshop_submissions', 'title', 'mod_workshop'),
(177, 'workshop', 'update example assessment', 'workshop_submissions', 'title', 'mod_workshop'),
(178, 'workshop', 'update aggregate grades', 'workshop', 'name', 'mod_workshop'),
(179, 'workshop', 'update clear aggregated grades', 'workshop', 'name', 'mod_workshop'),
(180, 'workshop', 'update clear assessments', 'workshop', 'name', 'mod_workshop'),
(181, 'book', 'exportimscp', 'book', 'name', 'booktool_exportimscp'),
(182, 'book', 'print', 'book', 'name', 'booktool_print'),
(183, 'book', 'print chapter', 'book_chapters', 'title', 'booktool_print');

-- --------------------------------------------------------

--
-- Table structure for table `mdl_log_queries`
--

CREATE TABLE IF NOT EXISTS `mdl_log_queries` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `qtype` mediumint(5) NOT NULL,
  `sqltext` longtext NOT NULL,
  `sqlparams` longtext,
  `error` mediumint(5) NOT NULL DEFAULT '0',
  `info` longtext,
  `backtrace` longtext,
  `exectime` decimal(10,5) NOT NULL,
  `timelogged` bigint(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Logged database queries.' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_lti`
--

CREATE TABLE IF NOT EXISTS `mdl_lti` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `course` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `intro` longtext,
  `introformat` smallint(4) DEFAULT '0',
  `timecreated` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `typeid` bigint(10) DEFAULT NULL,
  `toolurl` longtext NOT NULL,
  `securetoolurl` longtext,
  `instructorchoicesendname` tinyint(1) DEFAULT NULL,
  `instructorchoicesendemailaddr` tinyint(1) DEFAULT NULL,
  `instructorchoiceallowroster` tinyint(1) DEFAULT NULL,
  `instructorchoiceallowsetting` tinyint(1) DEFAULT NULL,
  `instructorcustomparameters` varchar(255) DEFAULT NULL,
  `instructorchoiceacceptgrades` tinyint(1) DEFAULT NULL,
  `grade` decimal(10,5) NOT NULL DEFAULT '100.00000',
  `launchcontainer` tinyint(2) NOT NULL DEFAULT '1',
  `resourcekey` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `debuglaunch` tinyint(1) NOT NULL DEFAULT '0',
  `showtitlelaunch` tinyint(1) NOT NULL DEFAULT '0',
  `showdescriptionlaunch` tinyint(1) NOT NULL DEFAULT '0',
  `servicesalt` varchar(40) DEFAULT NULL,
  `icon` longtext,
  `secureicon` longtext,
  PRIMARY KEY (`id`),
  KEY `mdl_lti_cou_ix` (`course`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='This table contains Basic LTI activities instances' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_lti_submission`
--

CREATE TABLE IF NOT EXISTS `mdl_lti_submission` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `ltiid` bigint(10) NOT NULL,
  `userid` bigint(10) NOT NULL,
  `datesubmitted` bigint(10) NOT NULL,
  `dateupdated` bigint(10) NOT NULL,
  `gradepercent` decimal(10,5) NOT NULL,
  `originalgrade` decimal(10,5) NOT NULL,
  `launchid` bigint(10) NOT NULL,
  `state` tinyint(2) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_ltisubm_lti_ix` (`ltiid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Keeps track of individual submissions for LTI activities.' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_lti_types`
--

CREATE TABLE IF NOT EXISTS `mdl_lti_types` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT 'basiclti Activity',
  `baseurl` longtext NOT NULL,
  `tooldomain` varchar(255) NOT NULL DEFAULT '',
  `state` tinyint(2) NOT NULL DEFAULT '2',
  `course` bigint(10) NOT NULL,
  `coursevisible` tinyint(1) NOT NULL DEFAULT '0',
  `createdby` bigint(10) NOT NULL,
  `timecreated` bigint(10) NOT NULL,
  `timemodified` bigint(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_ltitype_cou_ix` (`course`),
  KEY `mdl_ltitype_too_ix` (`tooldomain`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Basic LTI pre-configured activities' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_lti_types_config`
--

CREATE TABLE IF NOT EXISTS `mdl_lti_types_config` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `typeid` bigint(10) NOT NULL,
  `name` varchar(100) NOT NULL DEFAULT '',
  `value` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `mdl_ltitypeconf_typ_ix` (`typeid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Basic LTI types configuration' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_message`
--

CREATE TABLE IF NOT EXISTS `mdl_message` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `useridfrom` bigint(10) NOT NULL DEFAULT '0',
  `useridto` bigint(10) NOT NULL DEFAULT '0',
  `subject` longtext,
  `fullmessage` longtext,
  `fullmessageformat` smallint(4) DEFAULT '0',
  `fullmessagehtml` longtext,
  `smallmessage` longtext,
  `notification` tinyint(1) DEFAULT '0',
  `contexturl` longtext,
  `contexturlname` longtext,
  `timecreated` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_mess_use_ix` (`useridfrom`),
  KEY `mdl_mess_use2_ix` (`useridto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Stores all unread messages' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_message_contacts`
--

CREATE TABLE IF NOT EXISTS `mdl_message_contacts` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `contactid` bigint(10) NOT NULL DEFAULT '0',
  `blocked` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_messcont_usecon_uix` (`userid`,`contactid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Maintains lists of relationships between users' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_message_processors`
--

CREATE TABLE IF NOT EXISTS `mdl_message_processors` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(166) NOT NULL DEFAULT '',
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='List of message output plugins' AUTO_INCREMENT=4 ;

--
-- Dumping data for table `mdl_message_processors`
--

INSERT INTO `mdl_message_processors` (`id`, `name`, `enabled`) VALUES
(1, 'email', 1),
(2, 'jabber', 1),
(3, 'popup', 1);

-- --------------------------------------------------------

--
-- Table structure for table `mdl_message_providers`
--

CREATE TABLE IF NOT EXISTS `mdl_message_providers` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL DEFAULT '',
  `component` varchar(200) NOT NULL DEFAULT '',
  `capability` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_messprov_comnam_uix` (`component`,`name`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='This table stores the message providers (modules and core sy' AUTO_INCREMENT=24 ;

--
-- Dumping data for table `mdl_message_providers`
--

INSERT INTO `mdl_message_providers` (`id`, `name`, `component`, `capability`) VALUES
(1, 'notices', 'moodle', 'moodle/site:config'),
(2, 'errors', 'moodle', 'moodle/site:config'),
(3, 'availableupdate', 'moodle', 'moodle/site:config'),
(4, 'instantmessage', 'moodle', NULL),
(5, 'backup', 'moodle', 'moodle/site:config'),
(6, 'courserequested', 'moodle', 'moodle/site:approvecourse'),
(7, 'courserequestapproved', 'moodle', 'moodle/course:request'),
(8, 'courserequestrejected', 'moodle', 'moodle/course:request'),
(9, 'assign_notification', 'mod_assign', NULL),
(10, 'assignment_updates', 'mod_assignment', NULL),
(11, 'submission', 'mod_feedback', NULL),
(12, 'message', 'mod_feedback', NULL),
(13, 'posts', 'mod_forum', NULL),
(14, 'graded_essay', 'mod_lesson', NULL),
(15, 'submission', 'mod_quiz', 'mod/quiz:emailnotifysubmission'),
(16, 'confirmation', 'mod_quiz', 'mod/quiz:emailconfirmsubmission'),
(17, 'attempt_overdue', 'mod_quiz', 'mod/quiz:emailwarnoverdue'),
(18, 'authorize_enrolment', 'enrol_authorize', NULL),
(19, 'flatfile_enrolment', 'enrol_flatfile', NULL),
(20, 'imsenterprise_enrolment', 'enrol_imsenterprise', NULL),
(21, 'expiry_notification', 'enrol_manual', NULL),
(22, 'paypal_enrolment', 'enrol_paypal', NULL),
(23, 'expiry_notification', 'enrol_self', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `mdl_message_read`
--

CREATE TABLE IF NOT EXISTS `mdl_message_read` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `useridfrom` bigint(10) NOT NULL DEFAULT '0',
  `useridto` bigint(10) NOT NULL DEFAULT '0',
  `subject` longtext,
  `fullmessage` longtext,
  `fullmessageformat` smallint(4) DEFAULT '0',
  `fullmessagehtml` longtext,
  `smallmessage` longtext,
  `notification` tinyint(1) DEFAULT '0',
  `contexturl` longtext,
  `contexturlname` longtext,
  `timecreated` bigint(10) NOT NULL DEFAULT '0',
  `timeread` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_messread_use_ix` (`useridfrom`),
  KEY `mdl_messread_use2_ix` (`useridto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Stores all messages that have been read' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_message_working`
--

CREATE TABLE IF NOT EXISTS `mdl_message_working` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `unreadmessageid` bigint(10) NOT NULL,
  `processorid` bigint(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Lists all the messages and processors that need to be proces' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_mnetservice_enrol_courses`
--

CREATE TABLE IF NOT EXISTS `mdl_mnetservice_enrol_courses` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `hostid` bigint(10) NOT NULL,
  `remoteid` bigint(10) NOT NULL,
  `categoryid` bigint(10) NOT NULL,
  `categoryname` varchar(255) NOT NULL DEFAULT '',
  `sortorder` bigint(10) NOT NULL DEFAULT '0',
  `fullname` varchar(254) NOT NULL DEFAULT '',
  `shortname` varchar(100) NOT NULL DEFAULT '',
  `idnumber` varchar(100) NOT NULL DEFAULT '',
  `summary` longtext NOT NULL,
  `summaryformat` smallint(3) DEFAULT '0',
  `startdate` bigint(10) NOT NULL,
  `roleid` bigint(10) NOT NULL,
  `rolename` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_mnetenrocour_hosrem_uix` (`hostid`,`remoteid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Caches the information fetched via XML-RPC about courses on ' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_mnetservice_enrol_enrolments`
--

CREATE TABLE IF NOT EXISTS `mdl_mnetservice_enrol_enrolments` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `hostid` bigint(10) NOT NULL,
  `userid` bigint(10) NOT NULL,
  `remotecourseid` bigint(10) NOT NULL,
  `rolename` varchar(255) NOT NULL DEFAULT '',
  `enroltime` bigint(10) NOT NULL DEFAULT '0',
  `enroltype` varchar(20) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `mdl_mnetenroenro_use_ix` (`userid`),
  KEY `mdl_mnetenroenro_hos_ix` (`hostid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Caches the information about enrolments of our local users i' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_mnet_application`
--

CREATE TABLE IF NOT EXISTS `mdl_mnet_application` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL DEFAULT '',
  `display_name` varchar(50) NOT NULL DEFAULT '',
  `xmlrpc_server_url` varchar(255) NOT NULL DEFAULT '',
  `sso_land_url` varchar(255) NOT NULL DEFAULT '',
  `sso_jump_url` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Information about applications on remote hosts' AUTO_INCREMENT=3 ;

--
-- Dumping data for table `mdl_mnet_application`
--

INSERT INTO `mdl_mnet_application` (`id`, `name`, `display_name`, `xmlrpc_server_url`, `sso_land_url`, `sso_jump_url`) VALUES
(1, 'moodle', 'Moodle', '/mnet/xmlrpc/server.php', '/auth/mnet/land.php', '/auth/mnet/jump.php'),
(2, 'mahara', 'Mahara', '/api/xmlrpc/server.php', '/auth/xmlrpc/land.php', '/auth/xmlrpc/jump.php');

-- --------------------------------------------------------

--
-- Table structure for table `mdl_mnet_host`
--

CREATE TABLE IF NOT EXISTS `mdl_mnet_host` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  `wwwroot` varchar(255) NOT NULL DEFAULT '',
  `ip_address` varchar(45) NOT NULL DEFAULT '',
  `name` varchar(80) NOT NULL DEFAULT '',
  `public_key` longtext NOT NULL,
  `public_key_expires` bigint(10) NOT NULL DEFAULT '0',
  `transport` tinyint(2) NOT NULL DEFAULT '0',
  `portno` mediumint(5) NOT NULL DEFAULT '0',
  `last_connect_time` bigint(10) NOT NULL DEFAULT '0',
  `last_log_id` bigint(10) NOT NULL DEFAULT '0',
  `force_theme` tinyint(1) NOT NULL DEFAULT '0',
  `theme` varchar(100) DEFAULT NULL,
  `applicationid` bigint(10) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `mdl_mnethost_app_ix` (`applicationid`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Information about the local and remote hosts for RPC' AUTO_INCREMENT=3 ;

--
-- Dumping data for table `mdl_mnet_host`
--

INSERT INTO `mdl_mnet_host` (`id`, `deleted`, `wwwroot`, `ip_address`, `name`, `public_key`, `public_key_expires`, `transport`, `portno`, `last_connect_time`, `last_log_id`, `force_theme`, `theme`, `applicationid`) VALUES
(1, 0, 'http://localhost/moodle243', '::1', '', '', 0, 0, 0, 0, 0, 0, NULL, 1),
(2, 0, '', '', 'All Hosts', '', 0, 0, 0, 0, 0, 0, NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `mdl_mnet_host2service`
--

CREATE TABLE IF NOT EXISTS `mdl_mnet_host2service` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `hostid` bigint(10) NOT NULL DEFAULT '0',
  `serviceid` bigint(10) NOT NULL DEFAULT '0',
  `publish` tinyint(1) NOT NULL DEFAULT '0',
  `subscribe` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_mnethost_hosser_uix` (`hostid`,`serviceid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Information about the services for a given host' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_mnet_log`
--

CREATE TABLE IF NOT EXISTS `mdl_mnet_log` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `hostid` bigint(10) NOT NULL DEFAULT '0',
  `remoteid` bigint(10) NOT NULL DEFAULT '0',
  `time` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `ip` varchar(45) NOT NULL DEFAULT '',
  `course` bigint(10) NOT NULL DEFAULT '0',
  `coursename` varchar(40) NOT NULL DEFAULT '',
  `module` varchar(20) NOT NULL DEFAULT '',
  `cmid` bigint(10) NOT NULL DEFAULT '0',
  `action` varchar(40) NOT NULL DEFAULT '',
  `url` varchar(100) NOT NULL DEFAULT '',
  `info` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `mdl_mnetlog_hosusecou_ix` (`hostid`,`userid`,`course`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Store session data from users migrating to other sites' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_mnet_remote_rpc`
--

CREATE TABLE IF NOT EXISTS `mdl_mnet_remote_rpc` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `functionname` varchar(40) NOT NULL DEFAULT '',
  `xmlrpcpath` varchar(80) NOT NULL DEFAULT '',
  `plugintype` varchar(20) NOT NULL DEFAULT '',
  `pluginname` varchar(20) NOT NULL DEFAULT '',
  `enabled` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='This table describes functions that might be called remotely' AUTO_INCREMENT=17 ;

--
-- Dumping data for table `mdl_mnet_remote_rpc`
--

INSERT INTO `mdl_mnet_remote_rpc` (`id`, `functionname`, `xmlrpcpath`, `plugintype`, `pluginname`, `enabled`) VALUES
(1, 'user_authorise', 'auth/mnet/auth.php/user_authorise', 'auth', 'mnet', 1),
(2, 'keepalive_server', 'auth/mnet/auth.php/keepalive_server', 'auth', 'mnet', 1),
(3, 'kill_children', 'auth/mnet/auth.php/kill_children', 'auth', 'mnet', 1),
(4, 'refresh_log', 'auth/mnet/auth.php/refresh_log', 'auth', 'mnet', 1),
(5, 'fetch_user_image', 'auth/mnet/auth.php/fetch_user_image', 'auth', 'mnet', 1),
(6, 'fetch_theme_info', 'auth/mnet/auth.php/fetch_theme_info', 'auth', 'mnet', 1),
(7, 'update_enrolments', 'auth/mnet/auth.php/update_enrolments', 'auth', 'mnet', 1),
(8, 'keepalive_client', 'auth/mnet/auth.php/keepalive_client', 'auth', 'mnet', 1),
(9, 'kill_child', 'auth/mnet/auth.php/kill_child', 'auth', 'mnet', 1),
(10, 'available_courses', 'enrol/mnet/enrol.php/available_courses', 'enrol', 'mnet', 1),
(11, 'user_enrolments', 'enrol/mnet/enrol.php/user_enrolments', 'enrol', 'mnet', 1),
(12, 'enrol_user', 'enrol/mnet/enrol.php/enrol_user', 'enrol', 'mnet', 1),
(13, 'unenrol_user', 'enrol/mnet/enrol.php/unenrol_user', 'enrol', 'mnet', 1),
(14, 'course_enrolments', 'enrol/mnet/enrol.php/course_enrolments', 'enrol', 'mnet', 1),
(15, 'send_content_intent', 'portfolio/mahara/lib.php/send_content_intent', 'portfolio', 'mahara', 1),
(16, 'send_content_ready', 'portfolio/mahara/lib.php/send_content_ready', 'portfolio', 'mahara', 1);

-- --------------------------------------------------------

--
-- Table structure for table `mdl_mnet_remote_service2rpc`
--

CREATE TABLE IF NOT EXISTS `mdl_mnet_remote_service2rpc` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `serviceid` bigint(10) NOT NULL DEFAULT '0',
  `rpcid` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_mnetremoserv_rpcser_uix` (`rpcid`,`serviceid`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Group functions or methods under a service' AUTO_INCREMENT=17 ;

--
-- Dumping data for table `mdl_mnet_remote_service2rpc`
--

INSERT INTO `mdl_mnet_remote_service2rpc` (`id`, `serviceid`, `rpcid`) VALUES
(1, 1, 1),
(2, 1, 2),
(3, 1, 3),
(4, 1, 4),
(5, 1, 5),
(6, 1, 6),
(7, 1, 7),
(8, 2, 8),
(9, 2, 9),
(10, 3, 10),
(11, 3, 11),
(12, 3, 12),
(13, 3, 13),
(14, 3, 14),
(15, 4, 15),
(16, 4, 16);

-- --------------------------------------------------------

--
-- Table structure for table `mdl_mnet_rpc`
--

CREATE TABLE IF NOT EXISTS `mdl_mnet_rpc` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `functionname` varchar(40) NOT NULL DEFAULT '',
  `xmlrpcpath` varchar(80) NOT NULL DEFAULT '',
  `plugintype` varchar(20) NOT NULL DEFAULT '',
  `pluginname` varchar(20) NOT NULL DEFAULT '',
  `enabled` tinyint(1) NOT NULL DEFAULT '0',
  `help` longtext NOT NULL,
  `profile` longtext NOT NULL,
  `filename` varchar(100) NOT NULL DEFAULT '',
  `classname` varchar(150) DEFAULT NULL,
  `static` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_mnetrpc_enaxml_ix` (`enabled`,`xmlrpcpath`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Functions or methods that we may publish or subscribe to' AUTO_INCREMENT=16 ;

--
-- Dumping data for table `mdl_mnet_rpc`
--

INSERT INTO `mdl_mnet_rpc` (`id`, `functionname`, `xmlrpcpath`, `plugintype`, `pluginname`, `enabled`, `help`, `profile`, `filename`, `classname`, `static`) VALUES
(1, 'user_authorise', 'auth/mnet/auth.php/user_authorise', 'auth', 'mnet', 1, 'Return user data for the provided token, compare with user_agent string.', 'a:2:{s:10:"parameters";a:2:{i:0;a:3:{s:4:"name";s:5:"token";s:4:"type";s:6:"string";s:11:"description";s:37:"The unique ID provided by remotehost.";}i:1;a:3:{s:4:"name";s:9:"useragent";s:4:"type";s:6:"string";s:11:"description";s:0:"";}}s:6:"return";a:2:{s:4:"type";s:5:"array";s:11:"description";s:44:"$userdata Array of user info for remote host";}}', 'auth.php', 'auth_plugin_mnet', 0),
(2, 'keepalive_server', 'auth/mnet/auth.php/keepalive_server', 'auth', 'mnet', 1, 'Receives an array of usernames from a remote machine and prods their\nsessions to keep them alive', 'a:2:{s:10:"parameters";a:1:{i:0;a:3:{s:4:"name";s:5:"array";s:4:"type";s:5:"array";s:11:"description";s:21:"An array of usernames";}}s:6:"return";a:2:{s:4:"type";s:6:"string";s:11:"description";s:28:""All ok" or an error message";}}', 'auth.php', 'auth_plugin_mnet', 0),
(3, 'kill_children', 'auth/mnet/auth.php/kill_children', 'auth', 'mnet', 1, 'The IdP uses this function to kill child sessions on other hosts', 'a:2:{s:10:"parameters";a:2:{i:0;a:3:{s:4:"name";s:8:"username";s:4:"type";s:6:"string";s:11:"description";s:28:"Username for session to kill";}i:1;a:3:{s:4:"name";s:9:"useragent";s:4:"type";s:6:"string";s:11:"description";s:0:"";}}s:6:"return";a:2:{s:4:"type";s:6:"string";s:11:"description";s:39:"A plaintext report of what has happened";}}', 'auth.php', 'auth_plugin_mnet', 0),
(4, 'refresh_log', 'auth/mnet/auth.php/refresh_log', 'auth', 'mnet', 1, 'Receives an array of log entries from an SP and adds them to the mnet_log\ntable', 'a:2:{s:10:"parameters";a:1:{i:0;a:3:{s:4:"name";s:5:"array";s:4:"type";s:5:"array";s:11:"description";s:21:"An array of usernames";}}s:6:"return";a:2:{s:4:"type";s:6:"string";s:11:"description";s:28:""All ok" or an error message";}}', 'auth.php', 'auth_plugin_mnet', 0),
(5, 'fetch_user_image', 'auth/mnet/auth.php/fetch_user_image', 'auth', 'mnet', 1, 'Returns the user''s profile image info\nIf the user exists and has a profile picture, the returned array will contain keys:\n f1          - the content of the default 100x100px image\n f1_mimetype - the mimetype of the f1 file\n f2          - the content of the 35x35px variant of the image\n f2_mimetype - the mimetype of the f2 file\nThe mimetype information was added in Moodle 2.0. In Moodle 1.x, images are always jpegs.', 'a:2:{s:10:"parameters";a:1:{i:0;a:3:{s:4:"name";s:8:"username";s:4:"type";s:3:"int";s:11:"description";s:18:"The id of the user";}}s:6:"return";a:2:{s:4:"type";s:5:"array";s:11:"description";s:84:"false if user not found, empty array if no picture exists, array with data otherwise";}}', 'auth.php', 'auth_plugin_mnet', 0),
(6, 'fetch_theme_info', 'auth/mnet/auth.php/fetch_theme_info', 'auth', 'mnet', 1, 'Returns the theme information and logo url as strings.', 'a:2:{s:10:"parameters";a:0:{}s:6:"return";a:2:{s:4:"type";s:6:"string";s:11:"description";s:14:"The theme info";}}', 'auth.php', 'auth_plugin_mnet', 0),
(7, 'update_enrolments', 'auth/mnet/auth.php/update_enrolments', 'auth', 'mnet', 1, 'Invoke this function _on_ the IDP to update it with enrolment info local to\nthe SP right after calling user_authorise()\nNormally called by the SP after calling user_authorise()', 'a:2:{s:10:"parameters";a:2:{i:0;a:3:{s:4:"name";s:8:"username";s:4:"type";s:6:"string";s:11:"description";s:12:"The username";}i:1;a:3:{s:4:"name";s:7:"courses";s:4:"type";s:5:"array";s:11:"description";s:0:"";}}s:6:"return";a:2:{s:4:"type";s:4:"bool";s:11:"description";s:0:"";}}', 'auth.php', 'auth_plugin_mnet', 0),
(8, 'keepalive_client', 'auth/mnet/auth.php/keepalive_client', 'auth', 'mnet', 1, 'Poll the IdP server to let it know that a user it has authenticated is still\nonline', 'a:2:{s:10:"parameters";a:0:{}s:6:"return";a:2:{s:4:"type";s:4:"void";s:11:"description";s:0:"";}}', 'auth.php', 'auth_plugin_mnet', 0),
(9, 'kill_child', 'auth/mnet/auth.php/kill_child', 'auth', 'mnet', 1, 'When the IdP requests that child sessions are terminated,\nthis function will be called on each of the child hosts. The machine that\ncalls the function (over xmlrpc) provides us with the mnethostid we need.', 'a:2:{s:10:"parameters";a:2:{i:0;a:3:{s:4:"name";s:8:"username";s:4:"type";s:6:"string";s:11:"description";s:28:"Username for session to kill";}i:1;a:3:{s:4:"name";s:9:"useragent";s:4:"type";s:6:"string";s:11:"description";s:0:"";}}s:6:"return";a:2:{s:4:"type";s:4:"bool";s:11:"description";s:15:"True on success";}}', 'auth.php', 'auth_plugin_mnet', 0),
(10, 'available_courses', 'enrol/mnet/enrol.php/available_courses', 'enrol', 'mnet', 1, 'Returns list of courses that we offer to the caller for remote enrolment of their users\nSince Moodle 2.0, courses are made available for MNet peers by creating an instance\nof enrol_mnet plugin for the course. Hidden courses are not returned. If there are two\ninstances - one specific for the host and one for ''All hosts'', the setting of the specific\none is used. The id of the peer is kept in customint1, no other custom fields are used.', 'a:2:{s:10:"parameters";a:0:{}s:6:"return";a:2:{s:4:"type";s:5:"array";s:11:"description";s:0:"";}}', 'enrol.php', 'enrol_mnet_mnetservice_enrol', 0),
(11, 'user_enrolments', 'enrol/mnet/enrol.php/user_enrolments', 'enrol', 'mnet', 1, 'This method has never been implemented in Moodle MNet API', 'a:2:{s:10:"parameters";a:0:{}s:6:"return";a:2:{s:4:"type";s:5:"array";s:11:"description";s:11:"empty array";}}', 'enrol.php', 'enrol_mnet_mnetservice_enrol', 0),
(12, 'enrol_user', 'enrol/mnet/enrol.php/enrol_user', 'enrol', 'mnet', 1, 'Enrol remote user to our course\nIf we do not have local record for the remote user in our database,\nit gets created here.', 'a:2:{s:10:"parameters";a:2:{i:0;a:3:{s:4:"name";s:8:"userdata";s:4:"type";s:5:"array";s:11:"description";s:14:"user details {";}i:1;a:3:{s:4:"name";s:8:"courseid";s:4:"type";s:3:"int";s:11:"description";s:19:"our local course id";}}s:6:"return";a:2:{s:4:"type";s:4:"bool";s:11:"description";s:69:"true if the enrolment has been successful, throws exception otherwise";}}', 'enrol.php', 'enrol_mnet_mnetservice_enrol', 0),
(13, 'unenrol_user', 'enrol/mnet/enrol.php/unenrol_user', 'enrol', 'mnet', 1, 'Unenrol remote user from our course\nOnly users enrolled via enrol_mnet plugin can be unenrolled remotely. If the\nremote user is enrolled into the local course via some other enrol plugin\n(enrol_manual for example), the remote host can''t touch such enrolment. Please\ndo not report this behaviour as bug, it is a feature ;-)', 'a:2:{s:10:"parameters";a:2:{i:0;a:3:{s:4:"name";s:8:"username";s:4:"type";s:6:"string";s:11:"description";s:18:"of the remote user";}i:1;a:3:{s:4:"name";s:8:"courseid";s:4:"type";s:3:"int";s:11:"description";s:0:"";}}s:6:"return";a:2:{s:4:"type";s:4:"bool";s:11:"description";s:71:"true if the unenrolment has been successful, throws exception otherwise";}}', 'enrol.php', 'enrol_mnet_mnetservice_enrol', 0),
(14, 'course_enrolments', 'enrol/mnet/enrol.php/course_enrolments', 'enrol', 'mnet', 1, 'Returns a list of users from the client server who are enrolled in our course\nSuitable instance of enrol_mnet must be created in the course. This method will not\nreturn any information about the enrolments in courses that are not available for\nremote enrolment, even if their users are enrolled into them via other plugin\n(note the difference from {@link self::user_enrolments()}).\nThis method will return enrolment information for users from hosts regardless\nthe enrolment plugin. It does not matter if the user was enrolled remotely by\ntheir admin or locally. Once the course is available for remote enrolments, we\nwill tell them everything about their users.\nIn Moodle 1.x the returned array used to be indexed by username. The side effect\nof MDL-19219 fix is that we do not need to use such index and therefore we can\nreturn all enrolment records. MNet clients 1.x will only use the last record for\nthe student, if she is enrolled via multiple plugins.', 'a:2:{s:10:"parameters";a:2:{i:0;a:3:{s:4:"name";s:8:"courseid";s:4:"type";s:3:"int";s:11:"description";s:16:"ID of our course";}i:1;a:3:{s:4:"name";s:5:"roles";s:4:"type";s:5:"array";s:11:"description";s:0:"";}}s:6:"return";a:2:{s:4:"type";s:5:"array";s:11:"description";s:0:"";}}', 'enrol.php', 'enrol_mnet_mnetservice_enrol', 0),
(15, 'fetch_file', 'portfolio/mahara/lib.php/fetch_file', 'portfolio', 'mahara', 1, 'xmlrpc (mnet) function to get the file.\nreads in the file and returns it base_64 encoded\nso that it can be enrypted by mnet.', 'a:2:{s:10:"parameters";a:1:{i:0;a:3:{s:4:"name";s:5:"token";s:4:"type";s:6:"string";s:11:"description";s:56:"the token recieved previously during send_content_intent";}}s:6:"return";a:2:{s:4:"type";s:4:"void";s:11:"description";s:0:"";}}', 'lib.php', 'portfolio_plugin_mahara', 1);

-- --------------------------------------------------------

--
-- Table structure for table `mdl_mnet_service`
--

CREATE TABLE IF NOT EXISTS `mdl_mnet_service` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(40) NOT NULL DEFAULT '',
  `description` varchar(40) NOT NULL DEFAULT '',
  `apiversion` varchar(10) NOT NULL DEFAULT '',
  `offer` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='A service is a group of functions' AUTO_INCREMENT=5 ;

--
-- Dumping data for table `mdl_mnet_service`
--

INSERT INTO `mdl_mnet_service` (`id`, `name`, `description`, `apiversion`, `offer`) VALUES
(1, 'sso_idp', '', '1', 1),
(2, 'sso_sp', '', '1', 1),
(3, 'mnet_enrol', '', '1', 1),
(4, 'pf', '', '1', 1);

-- --------------------------------------------------------

--
-- Table structure for table `mdl_mnet_service2rpc`
--

CREATE TABLE IF NOT EXISTS `mdl_mnet_service2rpc` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `serviceid` bigint(10) NOT NULL DEFAULT '0',
  `rpcid` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_mnetserv_rpcser_uix` (`rpcid`,`serviceid`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Group functions or methods under a service' AUTO_INCREMENT=16 ;

--
-- Dumping data for table `mdl_mnet_service2rpc`
--

INSERT INTO `mdl_mnet_service2rpc` (`id`, `serviceid`, `rpcid`) VALUES
(1, 1, 1),
(2, 1, 2),
(3, 1, 3),
(4, 1, 4),
(5, 1, 5),
(6, 1, 6),
(7, 1, 7),
(8, 2, 8),
(9, 2, 9),
(10, 3, 10),
(11, 3, 11),
(12, 3, 12),
(13, 3, 13),
(14, 3, 14),
(15, 4, 15);

-- --------------------------------------------------------

--
-- Table structure for table `mdl_mnet_session`
--

CREATE TABLE IF NOT EXISTS `mdl_mnet_session` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `username` varchar(100) NOT NULL DEFAULT '',
  `token` varchar(40) NOT NULL DEFAULT '',
  `mnethostid` bigint(10) NOT NULL DEFAULT '0',
  `useragent` varchar(40) NOT NULL DEFAULT '',
  `confirm_timeout` bigint(10) NOT NULL DEFAULT '0',
  `session_id` varchar(40) NOT NULL DEFAULT '',
  `expires` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_mnetsess_tok_uix` (`token`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Store session data from users migrating to other sites' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_mnet_sso_access_control`
--

CREATE TABLE IF NOT EXISTS `mdl_mnet_sso_access_control` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `username` varchar(100) NOT NULL DEFAULT '',
  `mnet_host_id` bigint(10) NOT NULL DEFAULT '0',
  `accessctrl` varchar(20) NOT NULL DEFAULT 'allow',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_mnetssoaccecont_mneuse_uix` (`mnet_host_id`,`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Users by host permitted (or not) to login from a remote prov' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_modules`
--

CREATE TABLE IF NOT EXISTS `mdl_modules` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL DEFAULT '',
  `version` bigint(10) NOT NULL DEFAULT '0',
  `cron` bigint(10) NOT NULL DEFAULT '0',
  `lastcron` bigint(10) NOT NULL DEFAULT '0',
  `search` varchar(255) NOT NULL DEFAULT '',
  `visible` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `mdl_modu_nam_ix` (`name`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='modules available in the site' AUTO_INCREMENT=24 ;

--
-- Dumping data for table `mdl_modules`
--

INSERT INTO `mdl_modules` (`id`, `name`, `version`, `cron`, `lastcron`, `search`, `visible`) VALUES
(1, 'assign', 2012112900, 60, 0, '', 1),
(2, 'assignment', 2012112900, 60, 0, '', 0),
(3, 'book', 2012112900, 0, 0, '', 1),
(4, 'chat', 2012112900, 300, 0, '', 1),
(5, 'choice', 2012112900, 0, 0, '', 1),
(6, 'data', 2012112901, 0, 0, '', 1),
(7, 'feedback', 2012112900, 0, 0, '', 0),
(8, 'folder', 2012112900, 0, 0, '', 1),
(9, 'forum', 2012112901, 60, 0, '', 1),
(10, 'glossary', 2012112900, 0, 0, '', 1),
(11, 'imscp', 2012112900, 0, 0, '', 1),
(12, 'label', 2012112900, 0, 0, '', 1),
(13, 'lesson', 2012112900, 0, 0, '', 1),
(14, 'lti', 2012112900, 0, 0, '', 1),
(15, 'page', 2012112900, 0, 0, '', 1),
(16, 'quiz', 2012112900, 60, 0, '', 1),
(17, 'resource', 2012112900, 0, 0, '', 1),
(18, 'scorm', 2012112900, 300, 0, '', 1),
(19, 'survey', 2012112900, 0, 0, '', 1),
(20, 'url', 2012112900, 0, 0, '', 1),
(21, 'wiki', 2012112900, 0, 0, '', 1),
(22, 'workshop', 2012112901, 60, 0, '', 1),
(23, 'attforblock', 2012120700, 0, 0, '', 1);

-- --------------------------------------------------------

--
-- Table structure for table `mdl_my_pages`
--

CREATE TABLE IF NOT EXISTS `mdl_my_pages` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `userid` bigint(10) DEFAULT '0',
  `name` varchar(200) NOT NULL DEFAULT '',
  `private` tinyint(1) NOT NULL DEFAULT '1',
  `sortorder` mediumint(6) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_mypage_usepri_ix` (`userid`,`private`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Extra user pages for the My Moodle system' AUTO_INCREMENT=3 ;

--
-- Dumping data for table `mdl_my_pages`
--

INSERT INTO `mdl_my_pages` (`id`, `userid`, `name`, `private`, `sortorder`) VALUES
(1, NULL, '__default', 0, 0),
(2, NULL, '__default', 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `mdl_page`
--

CREATE TABLE IF NOT EXISTS `mdl_page` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `course` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `intro` longtext,
  `introformat` smallint(4) NOT NULL DEFAULT '0',
  `content` longtext,
  `contentformat` smallint(4) NOT NULL DEFAULT '0',
  `legacyfiles` smallint(4) NOT NULL DEFAULT '0',
  `legacyfileslast` bigint(10) DEFAULT NULL,
  `display` smallint(4) NOT NULL DEFAULT '0',
  `displayoptions` longtext,
  `revision` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_page_cou_ix` (`course`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Each record is one page and its config data' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_portfolio_instance`
--

CREATE TABLE IF NOT EXISTS `mdl_portfolio_instance` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `plugin` varchar(50) NOT NULL DEFAULT '',
  `name` varchar(255) NOT NULL DEFAULT '',
  `visible` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='base table (not including config data) for instances of port' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_portfolio_instance_config`
--

CREATE TABLE IF NOT EXISTS `mdl_portfolio_instance_config` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `instance` bigint(10) NOT NULL,
  `name` varchar(255) NOT NULL DEFAULT '',
  `value` longtext,
  PRIMARY KEY (`id`),
  KEY `mdl_portinstconf_nam_ix` (`name`),
  KEY `mdl_portinstconf_ins_ix` (`instance`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='config for portfolio plugin instances' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_portfolio_instance_user`
--

CREATE TABLE IF NOT EXISTS `mdl_portfolio_instance_user` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `instance` bigint(10) NOT NULL,
  `userid` bigint(10) NOT NULL,
  `name` varchar(255) NOT NULL DEFAULT '',
  `value` longtext,
  PRIMARY KEY (`id`),
  KEY `mdl_portinstuser_ins_ix` (`instance`),
  KEY `mdl_portinstuser_use_ix` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='user data for portfolio instances.' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_portfolio_log`
--

CREATE TABLE IF NOT EXISTS `mdl_portfolio_log` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `userid` bigint(10) NOT NULL,
  `time` bigint(10) NOT NULL,
  `portfolio` bigint(10) NOT NULL,
  `caller_class` varchar(150) NOT NULL DEFAULT '',
  `caller_file` varchar(255) NOT NULL DEFAULT '',
  `caller_component` varchar(255) DEFAULT NULL,
  `caller_sha1` varchar(255) NOT NULL DEFAULT '',
  `tempdataid` bigint(10) NOT NULL DEFAULT '0',
  `returnurl` varchar(255) NOT NULL DEFAULT '',
  `continueurl` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `mdl_portlog_use_ix` (`userid`),
  KEY `mdl_portlog_por_ix` (`portfolio`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='log of portfolio transfers (used to later check for duplicat' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_portfolio_mahara_queue`
--

CREATE TABLE IF NOT EXISTS `mdl_portfolio_mahara_queue` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `transferid` bigint(10) NOT NULL,
  `token` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `mdl_portmahaqueu_tok_ix` (`token`),
  KEY `mdl_portmahaqueu_tra_ix` (`transferid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='maps mahara tokens to transfer ids' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_portfolio_tempdata`
--

CREATE TABLE IF NOT EXISTS `mdl_portfolio_tempdata` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `data` longtext,
  `expirytime` bigint(10) NOT NULL,
  `userid` bigint(10) NOT NULL,
  `instance` bigint(10) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_porttemp_use_ix` (`userid`),
  KEY `mdl_porttemp_ins_ix` (`instance`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='stores temporary data for portfolio exports. the id of this ' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_post`
--

CREATE TABLE IF NOT EXISTS `mdl_post` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `module` varchar(20) NOT NULL DEFAULT '',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `courseid` bigint(10) NOT NULL DEFAULT '0',
  `groupid` bigint(10) NOT NULL DEFAULT '0',
  `moduleid` bigint(10) NOT NULL DEFAULT '0',
  `coursemoduleid` bigint(10) NOT NULL DEFAULT '0',
  `subject` varchar(128) NOT NULL DEFAULT '',
  `summary` longtext,
  `content` longtext,
  `uniquehash` varchar(255) NOT NULL DEFAULT '',
  `rating` bigint(10) NOT NULL DEFAULT '0',
  `format` bigint(10) NOT NULL DEFAULT '0',
  `summaryformat` tinyint(2) NOT NULL DEFAULT '0',
  `attachment` varchar(100) DEFAULT NULL,
  `publishstate` varchar(20) NOT NULL DEFAULT 'draft',
  `lastmodified` bigint(10) NOT NULL DEFAULT '0',
  `created` bigint(10) NOT NULL DEFAULT '0',
  `usermodified` bigint(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_post_iduse_uix` (`id`,`userid`),
  KEY `mdl_post_las_ix` (`lastmodified`),
  KEY `mdl_post_mod_ix` (`module`),
  KEY `mdl_post_sub_ix` (`subject`),
  KEY `mdl_post_use_ix` (`usermodified`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Generic post table to hold data blog entries etc in differen' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_profiling`
--

CREATE TABLE IF NOT EXISTS `mdl_profiling` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `runid` varchar(32) NOT NULL DEFAULT '',
  `url` varchar(255) NOT NULL DEFAULT '',
  `data` longtext NOT NULL,
  `totalexecutiontime` bigint(10) NOT NULL,
  `totalcputime` bigint(10) NOT NULL,
  `totalcalls` bigint(10) NOT NULL,
  `totalmemory` bigint(10) NOT NULL,
  `runreference` tinyint(2) NOT NULL DEFAULT '0',
  `runcomment` varchar(255) NOT NULL DEFAULT '',
  `timecreated` bigint(10) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_prof_run_uix` (`runid`),
  KEY `mdl_prof_urlrun_ix` (`url`,`runreference`),
  KEY `mdl_prof_timrun_ix` (`timecreated`,`runreference`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Stores the results of all the profiling runs' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_qtype_essay_options`
--

CREATE TABLE IF NOT EXISTS `mdl_qtype_essay_options` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `questionid` bigint(10) NOT NULL,
  `responseformat` varchar(16) NOT NULL DEFAULT 'editor',
  `responsefieldlines` smallint(4) NOT NULL DEFAULT '15',
  `attachments` smallint(4) NOT NULL DEFAULT '0',
  `graderinfo` longtext,
  `graderinfoformat` smallint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_qtypessaopti_que_uix` (`questionid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Extra options for essay questions.' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_question`
--

CREATE TABLE IF NOT EXISTS `mdl_question` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `category` bigint(10) NOT NULL DEFAULT '0',
  `parent` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `questiontext` longtext NOT NULL,
  `questiontextformat` tinyint(2) NOT NULL DEFAULT '0',
  `generalfeedback` longtext NOT NULL,
  `generalfeedbackformat` tinyint(2) NOT NULL DEFAULT '0',
  `defaultmark` decimal(12,7) NOT NULL DEFAULT '1.0000000',
  `penalty` decimal(12,7) NOT NULL DEFAULT '0.3333333',
  `qtype` varchar(20) NOT NULL DEFAULT '',
  `length` bigint(10) NOT NULL DEFAULT '1',
  `stamp` varchar(255) NOT NULL DEFAULT '',
  `version` varchar(255) NOT NULL DEFAULT '',
  `hidden` tinyint(1) NOT NULL DEFAULT '0',
  `timecreated` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `createdby` bigint(10) DEFAULT NULL,
  `modifiedby` bigint(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_ques_cat_ix` (`category`),
  KEY `mdl_ques_par_ix` (`parent`),
  KEY `mdl_ques_cre_ix` (`createdby`),
  KEY `mdl_ques_mod_ix` (`modifiedby`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='The questions themselves' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_question_answers`
--

CREATE TABLE IF NOT EXISTS `mdl_question_answers` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `question` bigint(10) NOT NULL DEFAULT '0',
  `answer` longtext NOT NULL,
  `answerformat` tinyint(2) NOT NULL DEFAULT '0',
  `fraction` decimal(12,7) NOT NULL DEFAULT '0.0000000',
  `feedback` longtext NOT NULL,
  `feedbackformat` tinyint(2) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_quesansw_que_ix` (`question`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Answers, with a fractional grade (0-1) and feedback' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_question_attempts`
--

CREATE TABLE IF NOT EXISTS `mdl_question_attempts` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `questionusageid` bigint(10) NOT NULL,
  `slot` bigint(10) NOT NULL,
  `behaviour` varchar(32) NOT NULL DEFAULT '',
  `questionid` bigint(10) NOT NULL,
  `variant` bigint(10) NOT NULL DEFAULT '1',
  `maxmark` decimal(12,7) NOT NULL,
  `minfraction` decimal(12,7) NOT NULL,
  `flagged` tinyint(1) NOT NULL DEFAULT '0',
  `questionsummary` longtext,
  `rightanswer` longtext,
  `responsesummary` longtext,
  `timemodified` bigint(10) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_quesatte_queslo_uix` (`questionusageid`,`slot`),
  KEY `mdl_quesatte_que_ix` (`questionid`),
  KEY `mdl_quesatte_que2_ix` (`questionusageid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Each row here corresponds to an attempt at one question, as ' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_question_attempt_steps`
--

CREATE TABLE IF NOT EXISTS `mdl_question_attempt_steps` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `questionattemptid` bigint(10) NOT NULL,
  `sequencenumber` bigint(10) NOT NULL,
  `state` varchar(13) NOT NULL DEFAULT '',
  `fraction` decimal(12,7) DEFAULT NULL,
  `timecreated` bigint(10) NOT NULL,
  `userid` bigint(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_quesattestep_queseq_uix` (`questionattemptid`,`sequencenumber`),
  KEY `mdl_quesattestep_que_ix` (`questionattemptid`),
  KEY `mdl_quesattestep_use_ix` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Stores one step in in a question attempt. As well as the dat' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_question_attempt_step_data`
--

CREATE TABLE IF NOT EXISTS `mdl_question_attempt_step_data` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `attemptstepid` bigint(10) NOT NULL,
  `name` varchar(32) NOT NULL DEFAULT '',
  `value` longtext,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_quesattestepdata_attna_uix` (`attemptstepid`,`name`),
  KEY `mdl_quesattestepdata_att_ix` (`attemptstepid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Each question_attempt_step has an associative array of the d' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_question_calculated`
--

CREATE TABLE IF NOT EXISTS `mdl_question_calculated` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `question` bigint(10) NOT NULL DEFAULT '0',
  `answer` bigint(10) NOT NULL DEFAULT '0',
  `tolerance` varchar(20) NOT NULL DEFAULT '0.0',
  `tolerancetype` bigint(10) NOT NULL DEFAULT '1',
  `correctanswerlength` bigint(10) NOT NULL DEFAULT '2',
  `correctanswerformat` bigint(10) NOT NULL DEFAULT '2',
  PRIMARY KEY (`id`),
  KEY `mdl_quescalc_ans_ix` (`answer`),
  KEY `mdl_quescalc_que_ix` (`question`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Options for questions of type calculated' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_question_calculated_options`
--

CREATE TABLE IF NOT EXISTS `mdl_question_calculated_options` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `question` bigint(10) NOT NULL DEFAULT '0',
  `synchronize` tinyint(2) NOT NULL DEFAULT '0',
  `single` smallint(4) NOT NULL DEFAULT '0',
  `shuffleanswers` smallint(4) NOT NULL DEFAULT '0',
  `correctfeedback` longtext,
  `correctfeedbackformat` tinyint(2) NOT NULL DEFAULT '0',
  `partiallycorrectfeedback` longtext,
  `partiallycorrectfeedbackformat` tinyint(2) NOT NULL DEFAULT '0',
  `incorrectfeedback` longtext,
  `incorrectfeedbackformat` tinyint(2) NOT NULL DEFAULT '0',
  `answernumbering` varchar(10) NOT NULL DEFAULT 'abc',
  `shownumcorrect` tinyint(2) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_quescalcopti_que_ix` (`question`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Options for questions of type calculated' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_question_categories`
--

CREATE TABLE IF NOT EXISTS `mdl_question_categories` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  `contextid` bigint(10) NOT NULL DEFAULT '0',
  `info` longtext NOT NULL,
  `infoformat` tinyint(2) NOT NULL DEFAULT '0',
  `stamp` varchar(255) NOT NULL DEFAULT '',
  `parent` bigint(10) NOT NULL DEFAULT '0',
  `sortorder` bigint(10) NOT NULL DEFAULT '999',
  PRIMARY KEY (`id`),
  KEY `mdl_quescate_con_ix` (`contextid`),
  KEY `mdl_quescate_par_ix` (`parent`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Categories are for grouping questions' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_question_datasets`
--

CREATE TABLE IF NOT EXISTS `mdl_question_datasets` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `question` bigint(10) NOT NULL DEFAULT '0',
  `datasetdefinition` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_quesdata_quedat_ix` (`question`,`datasetdefinition`),
  KEY `mdl_quesdata_que_ix` (`question`),
  KEY `mdl_quesdata_dat_ix` (`datasetdefinition`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Many-many relation between questions and dataset definitions' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_question_dataset_definitions`
--

CREATE TABLE IF NOT EXISTS `mdl_question_dataset_definitions` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `category` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `type` bigint(10) NOT NULL DEFAULT '0',
  `options` varchar(255) NOT NULL DEFAULT '',
  `itemcount` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_quesdatadefi_cat_ix` (`category`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Organises and stores properties for dataset items' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_question_dataset_items`
--

CREATE TABLE IF NOT EXISTS `mdl_question_dataset_items` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `definition` bigint(10) NOT NULL DEFAULT '0',
  `itemnumber` bigint(10) NOT NULL DEFAULT '0',
  `value` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `mdl_quesdataitem_def_ix` (`definition`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Individual dataset items' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_question_hints`
--

CREATE TABLE IF NOT EXISTS `mdl_question_hints` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `questionid` bigint(10) NOT NULL,
  `hint` longtext NOT NULL,
  `hintformat` smallint(4) NOT NULL DEFAULT '0',
  `shownumcorrect` tinyint(1) DEFAULT NULL,
  `clearwrong` tinyint(1) DEFAULT NULL,
  `options` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_queshint_que_ix` (`questionid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Stores the the part of the question definition that gives di' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_question_match`
--

CREATE TABLE IF NOT EXISTS `mdl_question_match` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `question` bigint(10) NOT NULL DEFAULT '0',
  `subquestions` varchar(255) NOT NULL DEFAULT '',
  `shuffleanswers` smallint(4) NOT NULL DEFAULT '1',
  `correctfeedback` longtext NOT NULL,
  `correctfeedbackformat` tinyint(2) NOT NULL DEFAULT '0',
  `partiallycorrectfeedback` longtext NOT NULL,
  `partiallycorrectfeedbackformat` tinyint(2) NOT NULL DEFAULT '0',
  `incorrectfeedback` longtext NOT NULL,
  `incorrectfeedbackformat` tinyint(2) NOT NULL DEFAULT '0',
  `shownumcorrect` tinyint(2) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_quesmatc_que_ix` (`question`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Defines fixed matching questions' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_question_match_sub`
--

CREATE TABLE IF NOT EXISTS `mdl_question_match_sub` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `code` bigint(10) NOT NULL DEFAULT '0',
  `question` bigint(10) NOT NULL DEFAULT '0',
  `questiontext` longtext NOT NULL,
  `questiontextformat` tinyint(2) NOT NULL DEFAULT '0',
  `answertext` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `mdl_quesmatcsub_que_ix` (`question`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Defines the subquestions that make up a matching question' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_question_multianswer`
--

CREATE TABLE IF NOT EXISTS `mdl_question_multianswer` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `question` bigint(10) NOT NULL DEFAULT '0',
  `sequence` longtext NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_quesmult_que_ix` (`question`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Options for multianswer questions' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_question_multichoice`
--

CREATE TABLE IF NOT EXISTS `mdl_question_multichoice` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `question` bigint(10) NOT NULL DEFAULT '0',
  `layout` smallint(4) NOT NULL DEFAULT '0',
  `answers` varchar(255) NOT NULL DEFAULT '',
  `single` smallint(4) NOT NULL DEFAULT '0',
  `shuffleanswers` smallint(4) NOT NULL DEFAULT '1',
  `correctfeedback` longtext NOT NULL,
  `correctfeedbackformat` tinyint(2) NOT NULL DEFAULT '0',
  `partiallycorrectfeedback` longtext NOT NULL,
  `partiallycorrectfeedbackformat` tinyint(2) NOT NULL DEFAULT '0',
  `incorrectfeedback` longtext NOT NULL,
  `incorrectfeedbackformat` tinyint(2) NOT NULL DEFAULT '0',
  `answernumbering` varchar(10) NOT NULL DEFAULT 'abc',
  `shownumcorrect` tinyint(2) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_quesmult_que2_ix` (`question`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Options for multiple choice questions' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_question_numerical`
--

CREATE TABLE IF NOT EXISTS `mdl_question_numerical` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `question` bigint(10) NOT NULL DEFAULT '0',
  `answer` bigint(10) NOT NULL DEFAULT '0',
  `tolerance` varchar(255) NOT NULL DEFAULT '0.0',
  PRIMARY KEY (`id`),
  KEY `mdl_quesnume_ans_ix` (`answer`),
  KEY `mdl_quesnume_que_ix` (`question`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Options for numerical questions.' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_question_numerical_options`
--

CREATE TABLE IF NOT EXISTS `mdl_question_numerical_options` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `question` bigint(10) NOT NULL DEFAULT '0',
  `showunits` smallint(4) NOT NULL DEFAULT '0',
  `unitsleft` smallint(4) NOT NULL DEFAULT '0',
  `unitgradingtype` smallint(4) NOT NULL DEFAULT '0',
  `unitpenalty` decimal(12,7) NOT NULL DEFAULT '0.1000000',
  PRIMARY KEY (`id`),
  KEY `mdl_quesnumeopti_que_ix` (`question`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Options for questions of type numerical This table is also u' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_question_numerical_units`
--

CREATE TABLE IF NOT EXISTS `mdl_question_numerical_units` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `question` bigint(10) NOT NULL DEFAULT '0',
  `multiplier` decimal(40,20) NOT NULL DEFAULT '1.00000000000000000000',
  `unit` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_quesnumeunit_queuni_uix` (`question`,`unit`),
  KEY `mdl_quesnumeunit_que_ix` (`question`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Optional unit options for numerical questions. This table is' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_question_randomsamatch`
--

CREATE TABLE IF NOT EXISTS `mdl_question_randomsamatch` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `question` bigint(10) NOT NULL DEFAULT '0',
  `choose` bigint(10) NOT NULL DEFAULT '4',
  PRIMARY KEY (`id`),
  KEY `mdl_quesrand_que_ix` (`question`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Info about a random short-answer matching question' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_question_sessions`
--

CREATE TABLE IF NOT EXISTS `mdl_question_sessions` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `attemptid` bigint(10) NOT NULL DEFAULT '0',
  `questionid` bigint(10) NOT NULL DEFAULT '0',
  `newest` bigint(10) NOT NULL DEFAULT '0',
  `newgraded` bigint(10) NOT NULL DEFAULT '0',
  `sumpenalty` decimal(12,7) NOT NULL DEFAULT '0.0000000',
  `manualcomment` longtext NOT NULL,
  `manualcommentformat` tinyint(2) NOT NULL DEFAULT '0',
  `flagged` tinyint(2) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_quessess_attque_uix` (`attemptid`,`questionid`),
  KEY `mdl_quessess_att_ix` (`attemptid`),
  KEY `mdl_quessess_que_ix` (`questionid`),
  KEY `mdl_quessess_new_ix` (`newest`),
  KEY `mdl_quessess_new2_ix` (`newgraded`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Gives ids of the newest open and newest graded states' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_question_shortanswer`
--

CREATE TABLE IF NOT EXISTS `mdl_question_shortanswer` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `question` bigint(10) NOT NULL DEFAULT '0',
  `answers` varchar(255) NOT NULL DEFAULT '',
  `usecase` tinyint(2) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_quesshor_que_ix` (`question`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Options for short answer questions' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_question_states`
--

CREATE TABLE IF NOT EXISTS `mdl_question_states` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `attempt` bigint(10) NOT NULL DEFAULT '0',
  `question` bigint(10) NOT NULL DEFAULT '0',
  `seq_number` mediumint(6) NOT NULL DEFAULT '0',
  `answer` longtext NOT NULL,
  `timestamp` bigint(10) NOT NULL DEFAULT '0',
  `event` smallint(4) NOT NULL DEFAULT '0',
  `grade` decimal(12,7) NOT NULL DEFAULT '0.0000000',
  `raw_grade` decimal(12,7) NOT NULL DEFAULT '0.0000000',
  `penalty` decimal(12,7) NOT NULL DEFAULT '0.0000000',
  PRIMARY KEY (`id`),
  KEY `mdl_quesstat_att_ix` (`attempt`),
  KEY `mdl_quesstat_que_ix` (`question`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Stores user responses to an attempt, and percentage grades' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_question_truefalse`
--

CREATE TABLE IF NOT EXISTS `mdl_question_truefalse` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `question` bigint(10) NOT NULL DEFAULT '0',
  `trueanswer` bigint(10) NOT NULL DEFAULT '0',
  `falseanswer` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_questrue_que_ix` (`question`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Options for True-False questions' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_question_usages`
--

CREATE TABLE IF NOT EXISTS `mdl_question_usages` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `contextid` bigint(10) NOT NULL,
  `component` varchar(255) NOT NULL DEFAULT '',
  `preferredbehaviour` varchar(32) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `mdl_quesusag_con_ix` (`contextid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='This table''s main purpose it to assign a unique id to each a' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_quiz`
--

CREATE TABLE IF NOT EXISTS `mdl_quiz` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `course` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `intro` longtext NOT NULL,
  `introformat` smallint(4) NOT NULL DEFAULT '0',
  `timeopen` bigint(10) NOT NULL DEFAULT '0',
  `timeclose` bigint(10) NOT NULL DEFAULT '0',
  `timelimit` bigint(10) NOT NULL DEFAULT '0',
  `overduehandling` varchar(16) NOT NULL DEFAULT 'autoabandon',
  `graceperiod` bigint(10) NOT NULL DEFAULT '0',
  `preferredbehaviour` varchar(32) NOT NULL DEFAULT '',
  `attempts` mediumint(6) NOT NULL DEFAULT '0',
  `attemptonlast` smallint(4) NOT NULL DEFAULT '0',
  `grademethod` smallint(4) NOT NULL DEFAULT '1',
  `decimalpoints` smallint(4) NOT NULL DEFAULT '2',
  `questiondecimalpoints` smallint(4) NOT NULL DEFAULT '-1',
  `reviewattempt` mediumint(6) NOT NULL DEFAULT '0',
  `reviewcorrectness` mediumint(6) NOT NULL DEFAULT '0',
  `reviewmarks` mediumint(6) NOT NULL DEFAULT '0',
  `reviewspecificfeedback` mediumint(6) NOT NULL DEFAULT '0',
  `reviewgeneralfeedback` mediumint(6) NOT NULL DEFAULT '0',
  `reviewrightanswer` mediumint(6) NOT NULL DEFAULT '0',
  `reviewoverallfeedback` mediumint(6) NOT NULL DEFAULT '0',
  `questionsperpage` bigint(10) NOT NULL DEFAULT '0',
  `navmethod` varchar(16) NOT NULL DEFAULT 'free',
  `shufflequestions` smallint(4) NOT NULL DEFAULT '0',
  `shuffleanswers` smallint(4) NOT NULL DEFAULT '0',
  `questions` longtext NOT NULL,
  `sumgrades` decimal(10,5) NOT NULL DEFAULT '0.00000',
  `grade` decimal(10,5) NOT NULL DEFAULT '0.00000',
  `timecreated` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `password` varchar(255) NOT NULL DEFAULT '',
  `subnet` varchar(255) NOT NULL DEFAULT '',
  `browsersecurity` varchar(32) NOT NULL DEFAULT '',
  `delay1` bigint(10) NOT NULL DEFAULT '0',
  `delay2` bigint(10) NOT NULL DEFAULT '0',
  `showuserpicture` smallint(4) NOT NULL DEFAULT '0',
  `showblocks` smallint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_quiz_cou_ix` (`course`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='The settings for each quiz.' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_quiz_attempts`
--

CREATE TABLE IF NOT EXISTS `mdl_quiz_attempts` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `quiz` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `attempt` mediumint(6) NOT NULL DEFAULT '0',
  `uniqueid` bigint(10) NOT NULL DEFAULT '0',
  `layout` longtext NOT NULL,
  `currentpage` bigint(10) NOT NULL DEFAULT '0',
  `preview` smallint(3) NOT NULL DEFAULT '0',
  `state` varchar(16) NOT NULL DEFAULT 'inprogress',
  `timestart` bigint(10) NOT NULL DEFAULT '0',
  `timefinish` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `timecheckstate` bigint(10) DEFAULT '0',
  `sumgrades` decimal(10,5) DEFAULT NULL,
  `needsupgradetonewqe` smallint(3) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_quizatte_quiuseatt_uix` (`quiz`,`userid`,`attempt`),
  UNIQUE KEY `mdl_quizatte_uni_uix` (`uniqueid`),
  KEY `mdl_quizatte_statim_ix` (`state`,`timecheckstate`),
  KEY `mdl_quizatte_qui_ix` (`quiz`),
  KEY `mdl_quizatte_use_ix` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Stores users attempts at quizzes.' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_quiz_feedback`
--

CREATE TABLE IF NOT EXISTS `mdl_quiz_feedback` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `quizid` bigint(10) NOT NULL DEFAULT '0',
  `feedbacktext` longtext NOT NULL,
  `feedbacktextformat` tinyint(2) NOT NULL DEFAULT '0',
  `mingrade` decimal(10,5) NOT NULL DEFAULT '0.00000',
  `maxgrade` decimal(10,5) NOT NULL DEFAULT '0.00000',
  PRIMARY KEY (`id`),
  KEY `mdl_quizfeed_qui_ix` (`quizid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Feedback given to students based on which grade band their o' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_quiz_grades`
--

CREATE TABLE IF NOT EXISTS `mdl_quiz_grades` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `quiz` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `grade` decimal(10,5) NOT NULL DEFAULT '0.00000',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_quizgrad_use_ix` (`userid`),
  KEY `mdl_quizgrad_qui_ix` (`quiz`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Stores the overall grade for each user on the quiz, based on' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_quiz_overrides`
--

CREATE TABLE IF NOT EXISTS `mdl_quiz_overrides` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `quiz` bigint(10) NOT NULL DEFAULT '0',
  `groupid` bigint(10) DEFAULT NULL,
  `userid` bigint(10) DEFAULT NULL,
  `timeopen` bigint(10) DEFAULT NULL,
  `timeclose` bigint(10) DEFAULT NULL,
  `timelimit` bigint(10) DEFAULT NULL,
  `attempts` mediumint(6) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_quizover_qui_ix` (`quiz`),
  KEY `mdl_quizover_gro_ix` (`groupid`),
  KEY `mdl_quizover_use_ix` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='The overrides to quiz settings on a per-user and per-group b' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_quiz_overview_regrades`
--

CREATE TABLE IF NOT EXISTS `mdl_quiz_overview_regrades` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `questionusageid` bigint(10) NOT NULL,
  `slot` bigint(10) NOT NULL,
  `newfraction` decimal(12,7) DEFAULT NULL,
  `oldfraction` decimal(12,7) DEFAULT NULL,
  `regraded` smallint(4) NOT NULL,
  `timemodified` bigint(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='This table records which question attempts need regrading an' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_quiz_question_instances`
--

CREATE TABLE IF NOT EXISTS `mdl_quiz_question_instances` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `quiz` bigint(10) NOT NULL DEFAULT '0',
  `question` bigint(10) NOT NULL DEFAULT '0',
  `grade` decimal(12,7) NOT NULL DEFAULT '0.0000000',
  PRIMARY KEY (`id`),
  KEY `mdl_quizquesinst_qui_ix` (`quiz`),
  KEY `mdl_quizquesinst_que_ix` (`question`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Stores the maximum possible grade (weight) for each question' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_quiz_question_response_stats`
--

CREATE TABLE IF NOT EXISTS `mdl_quiz_question_response_stats` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `quizstatisticsid` bigint(10) NOT NULL,
  `questionid` bigint(10) NOT NULL,
  `subqid` varchar(100) NOT NULL DEFAULT '',
  `aid` varchar(100) DEFAULT NULL,
  `response` longtext,
  `rcount` bigint(10) DEFAULT NULL,
  `credit` decimal(15,5) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Quiz question responses.' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_quiz_question_statistics`
--

CREATE TABLE IF NOT EXISTS `mdl_quiz_question_statistics` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `quizstatisticsid` bigint(10) NOT NULL,
  `questionid` bigint(10) NOT NULL,
  `slot` bigint(10) DEFAULT NULL,
  `subquestion` smallint(4) NOT NULL,
  `s` bigint(10) NOT NULL DEFAULT '0',
  `effectiveweight` decimal(15,5) DEFAULT NULL,
  `negcovar` tinyint(2) NOT NULL DEFAULT '0',
  `discriminationindex` decimal(15,5) DEFAULT NULL,
  `discriminativeefficiency` decimal(15,5) DEFAULT NULL,
  `sd` decimal(15,10) DEFAULT NULL,
  `facility` decimal(15,10) DEFAULT NULL,
  `subquestions` longtext,
  `maxmark` decimal(12,7) DEFAULT NULL,
  `positions` longtext,
  `randomguessscore` decimal(12,7) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Default comment for the table, please edit me' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_quiz_reports`
--

CREATE TABLE IF NOT EXISTS `mdl_quiz_reports` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `displayorder` bigint(10) NOT NULL,
  `capability` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_quizrepo_nam_uix` (`name`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Lists all the installed quiz reports and their display order' AUTO_INCREMENT=5 ;

--
-- Dumping data for table `mdl_quiz_reports`
--

INSERT INTO `mdl_quiz_reports` (`id`, `name`, `displayorder`, `capability`) VALUES
(1, 'overview', 10000, NULL),
(2, 'responses', 9000, NULL),
(3, 'grading', 6000, NULL),
(4, 'statistics', 8000, 'quiz/statistics:view');

-- --------------------------------------------------------

--
-- Table structure for table `mdl_quiz_statistics`
--

CREATE TABLE IF NOT EXISTS `mdl_quiz_statistics` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `quizid` bigint(10) NOT NULL,
  `groupid` bigint(10) NOT NULL,
  `allattempts` smallint(4) NOT NULL,
  `timemodified` bigint(10) NOT NULL,
  `firstattemptscount` bigint(10) NOT NULL,
  `allattemptscount` bigint(10) NOT NULL,
  `firstattemptsavg` decimal(15,5) DEFAULT NULL,
  `allattemptsavg` decimal(15,5) DEFAULT NULL,
  `median` decimal(15,5) DEFAULT NULL,
  `standarddeviation` decimal(15,5) DEFAULT NULL,
  `skewness` decimal(15,10) DEFAULT NULL,
  `kurtosis` decimal(15,5) DEFAULT NULL,
  `cic` decimal(15,10) DEFAULT NULL,
  `errorratio` decimal(15,10) DEFAULT NULL,
  `standarderror` decimal(15,10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='table to cache results from analysis done in statistics repo' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_rating`
--

CREATE TABLE IF NOT EXISTS `mdl_rating` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `contextid` bigint(10) NOT NULL,
  `component` varchar(100) NOT NULL DEFAULT '',
  `ratingarea` varchar(50) NOT NULL DEFAULT '',
  `itemid` bigint(10) NOT NULL,
  `scaleid` bigint(10) NOT NULL,
  `rating` bigint(10) NOT NULL,
  `userid` bigint(10) NOT NULL,
  `timecreated` bigint(10) NOT NULL,
  `timemodified` bigint(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_rati_comratconite_ix` (`component`,`ratingarea`,`contextid`,`itemid`),
  KEY `mdl_rati_con_ix` (`contextid`),
  KEY `mdl_rati_use_ix` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='moodle ratings' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_registration_hubs`
--

CREATE TABLE IF NOT EXISTS `mdl_registration_hubs` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `token` varchar(255) NOT NULL DEFAULT '',
  `hubname` varchar(255) NOT NULL DEFAULT '',
  `huburl` varchar(255) NOT NULL DEFAULT '',
  `confirmed` tinyint(1) NOT NULL DEFAULT '0',
  `secret` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='hub where the site is registered on with their associated to' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_repository`
--

CREATE TABLE IF NOT EXISTS `mdl_repository` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `type` varchar(255) NOT NULL DEFAULT '',
  `visible` tinyint(1) DEFAULT '1',
  `sortorder` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='This table contains one entry for every configured external ' AUTO_INCREMENT=8 ;

--
-- Dumping data for table `mdl_repository`
--

INSERT INTO `mdl_repository` (`id`, `type`, `visible`, `sortorder`) VALUES
(1, 'local', 1, 1),
(2, 'recent', 1, 2),
(3, 'upload', 1, 3),
(4, 'url', 1, 4),
(5, 'user', 1, 5),
(6, 'wikimedia', 1, 6),
(7, 'youtube', 1, 7);

-- --------------------------------------------------------

--
-- Table structure for table `mdl_repository_instances`
--

CREATE TABLE IF NOT EXISTS `mdl_repository_instances` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  `typeid` bigint(10) NOT NULL,
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `contextid` bigint(10) NOT NULL,
  `username` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `timecreated` bigint(10) DEFAULT NULL,
  `timemodified` bigint(10) DEFAULT NULL,
  `readonly` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='This table contains one entry for every configured external ' AUTO_INCREMENT=8 ;

--
-- Dumping data for table `mdl_repository_instances`
--

INSERT INTO `mdl_repository_instances` (`id`, `name`, `typeid`, `userid`, `contextid`, `username`, `password`, `timecreated`, `timemodified`, `readonly`) VALUES
(1, '', 1, 0, 1, NULL, NULL, 1365445974, 1365445974, 0),
(2, '', 2, 0, 1, NULL, NULL, 1365445976, 1365445976, 0),
(3, '', 3, 0, 1, NULL, NULL, 1365445977, 1365445977, 0),
(4, '', 4, 0, 1, NULL, NULL, 1365445977, 1365445977, 0),
(5, '', 5, 0, 1, NULL, NULL, 1365445977, 1365445977, 0),
(6, '', 6, 0, 1, NULL, NULL, 1365445978, 1365445978, 0),
(7, '', 7, 0, 1, NULL, NULL, 1365445978, 1365445978, 0);

-- --------------------------------------------------------

--
-- Table structure for table `mdl_repository_instance_config`
--

CREATE TABLE IF NOT EXISTS `mdl_repository_instance_config` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `instanceid` bigint(10) NOT NULL,
  `name` varchar(255) NOT NULL DEFAULT '',
  `value` longtext,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='The config for intances' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_resource`
--

CREATE TABLE IF NOT EXISTS `mdl_resource` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `course` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `intro` longtext,
  `introformat` smallint(4) NOT NULL DEFAULT '0',
  `tobemigrated` smallint(4) NOT NULL DEFAULT '0',
  `legacyfiles` smallint(4) NOT NULL DEFAULT '0',
  `legacyfileslast` bigint(10) DEFAULT NULL,
  `display` smallint(4) NOT NULL DEFAULT '0',
  `displayoptions` longtext,
  `filterfiles` smallint(4) NOT NULL DEFAULT '0',
  `revision` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_reso_cou_ix` (`course`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Each record is one resource and its config data' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_resource_old`
--

CREATE TABLE IF NOT EXISTS `mdl_resource_old` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `course` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `type` varchar(30) NOT NULL DEFAULT '',
  `reference` varchar(255) NOT NULL DEFAULT '',
  `intro` longtext,
  `introformat` smallint(4) NOT NULL DEFAULT '0',
  `alltext` longtext NOT NULL,
  `popup` longtext NOT NULL,
  `options` varchar(255) NOT NULL DEFAULT '',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `oldid` bigint(10) NOT NULL,
  `cmid` bigint(10) DEFAULT NULL,
  `newmodule` varchar(50) DEFAULT NULL,
  `newid` bigint(10) DEFAULT NULL,
  `migrated` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_resoold_old_uix` (`oldid`),
  KEY `mdl_resoold_cmi_ix` (`cmid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='backup of all old resource instances from 1.9' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_role`
--

CREATE TABLE IF NOT EXISTS `mdl_role` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  `shortname` varchar(100) NOT NULL DEFAULT '',
  `description` longtext NOT NULL,
  `sortorder` bigint(10) NOT NULL DEFAULT '0',
  `archetype` varchar(30) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_role_sor_uix` (`sortorder`),
  UNIQUE KEY `mdl_role_sho_uix` (`shortname`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='moodle roles' AUTO_INCREMENT=9 ;

--
-- Dumping data for table `mdl_role`
--

INSERT INTO `mdl_role` (`id`, `name`, `shortname`, `description`, `sortorder`, `archetype`) VALUES
(1, '', 'manager', '', 1, 'manager'),
(2, '', 'coursecreator', '', 2, 'coursecreator'),
(3, '', 'editingteacher', '', 3, 'editingteacher'),
(4, '', 'teacher', '', 4, 'teacher'),
(5, '', 'student', '', 5, 'student'),
(6, '', 'guest', '', 6, 'guest'),
(7, '', 'user', '', 7, 'user'),
(8, '', 'frontpage', '', 8, 'frontpage');

-- --------------------------------------------------------

--
-- Table structure for table `mdl_role_allow_assign`
--

CREATE TABLE IF NOT EXISTS `mdl_role_allow_assign` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `roleid` bigint(10) NOT NULL DEFAULT '0',
  `allowassign` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_rolealloassi_rolall_uix` (`roleid`,`allowassign`),
  KEY `mdl_rolealloassi_rol_ix` (`roleid`),
  KEY `mdl_rolealloassi_all_ix` (`allowassign`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='this defines what role can assign what role' AUTO_INCREMENT=8 ;

--
-- Dumping data for table `mdl_role_allow_assign`
--

INSERT INTO `mdl_role_allow_assign` (`id`, `roleid`, `allowassign`) VALUES
(1, 1, 1),
(2, 1, 2),
(3, 1, 3),
(4, 1, 4),
(5, 1, 5),
(6, 3, 4),
(7, 3, 5);

-- --------------------------------------------------------

--
-- Table structure for table `mdl_role_allow_override`
--

CREATE TABLE IF NOT EXISTS `mdl_role_allow_override` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `roleid` bigint(10) NOT NULL DEFAULT '0',
  `allowoverride` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_rolealloover_rolall_uix` (`roleid`,`allowoverride`),
  KEY `mdl_rolealloover_rol_ix` (`roleid`),
  KEY `mdl_rolealloover_all_ix` (`allowoverride`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='this defines what role can override what role' AUTO_INCREMENT=12 ;

--
-- Dumping data for table `mdl_role_allow_override`
--

INSERT INTO `mdl_role_allow_override` (`id`, `roleid`, `allowoverride`) VALUES
(1, 1, 1),
(2, 1, 2),
(3, 1, 3),
(4, 1, 4),
(5, 1, 5),
(6, 1, 6),
(7, 1, 7),
(8, 1, 8),
(9, 3, 4),
(10, 3, 5),
(11, 3, 6);

-- --------------------------------------------------------

--
-- Table structure for table `mdl_role_allow_switch`
--

CREATE TABLE IF NOT EXISTS `mdl_role_allow_switch` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `roleid` bigint(10) NOT NULL,
  `allowswitch` bigint(10) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_rolealloswit_rolall_uix` (`roleid`,`allowswitch`),
  KEY `mdl_rolealloswit_rol_ix` (`roleid`),
  KEY `mdl_rolealloswit_all_ix` (`allowswitch`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='This table stores which which other roles a user is allowed ' AUTO_INCREMENT=10 ;

--
-- Dumping data for table `mdl_role_allow_switch`
--

INSERT INTO `mdl_role_allow_switch` (`id`, `roleid`, `allowswitch`) VALUES
(1, 1, 3),
(2, 1, 4),
(3, 1, 5),
(4, 1, 6),
(5, 3, 4),
(6, 3, 5),
(7, 3, 6),
(8, 4, 5),
(9, 4, 6);

-- --------------------------------------------------------

--
-- Table structure for table `mdl_role_assignments`
--

CREATE TABLE IF NOT EXISTS `mdl_role_assignments` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `roleid` bigint(10) NOT NULL DEFAULT '0',
  `contextid` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `modifierid` bigint(10) NOT NULL DEFAULT '0',
  `component` varchar(100) NOT NULL DEFAULT '',
  `itemid` bigint(10) NOT NULL DEFAULT '0',
  `sortorder` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_roleassi_sor_ix` (`sortorder`),
  KEY `mdl_roleassi_rolcon_ix` (`roleid`,`contextid`),
  KEY `mdl_roleassi_useconrol_ix` (`userid`,`contextid`,`roleid`),
  KEY `mdl_roleassi_comiteuse_ix` (`component`,`itemid`,`userid`),
  KEY `mdl_roleassi_rol_ix` (`roleid`),
  KEY `mdl_roleassi_con_ix` (`contextid`),
  KEY `mdl_roleassi_use_ix` (`userid`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='assigning roles in different context' AUTO_INCREMENT=16 ;

--
-- Dumping data for table `mdl_role_assignments`
--

INSERT INTO `mdl_role_assignments` (`id`, `roleid`, `contextid`, `userid`, `timemodified`, `modifierid`, `component`, `itemid`, `sortorder`) VALUES
(10, 5, 43, 3, 1365625788, 2, '', 0, 0),
(11, 5, 43, 4, 1365625795, 2, '', 0, 0),
(12, 3, 43, 32, 1365625803, 2, '', 0, 0),
(13, 5, 53, 12, 1365654269, 2, '', 0, 0),
(14, 5, 53, 4, 1365654285, 2, '', 0, 0),
(15, 3, 53, 24, 1365654289, 2, '', 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `mdl_role_capabilities`
--

CREATE TABLE IF NOT EXISTS `mdl_role_capabilities` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `contextid` bigint(10) NOT NULL DEFAULT '0',
  `roleid` bigint(10) NOT NULL DEFAULT '0',
  `capability` varchar(255) NOT NULL DEFAULT '',
  `permission` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `modifierid` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_rolecapa_rolconcap_uix` (`roleid`,`contextid`,`capability`),
  KEY `mdl_rolecapa_rol_ix` (`roleid`),
  KEY `mdl_rolecapa_con_ix` (`contextid`),
  KEY `mdl_rolecapa_mod_ix` (`modifierid`),
  KEY `mdl_rolecapa_cap_ix` (`capability`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='permission has to be signed, overriding a capability for a p' AUTO_INCREMENT=1121 ;

--
-- Dumping data for table `mdl_role_capabilities`
--

INSERT INTO `mdl_role_capabilities` (`id`, `contextid`, `roleid`, `capability`, `permission`, `timemodified`, `modifierid`) VALUES
(1, 1, 1, 'moodle/site:readallmessages', 1, 1365445898, 0),
(2, 1, 3, 'moodle/site:readallmessages', 1, 1365445898, 0),
(3, 1, 1, 'moodle/site:sendmessage', 1, 1365445898, 0),
(4, 1, 7, 'moodle/site:sendmessage', 1, 1365445898, 0),
(5, 1, 1, 'moodle/site:approvecourse', 1, 1365445898, 0),
(6, 1, 3, 'moodle/backup:backupcourse', 1, 1365445898, 0),
(7, 1, 1, 'moodle/backup:backupcourse', 1, 1365445898, 0),
(8, 1, 3, 'moodle/backup:backupsection', 1, 1365445898, 0),
(9, 1, 1, 'moodle/backup:backupsection', 1, 1365445898, 0),
(10, 1, 3, 'moodle/backup:backupactivity', 1, 1365445898, 0),
(11, 1, 1, 'moodle/backup:backupactivity', 1, 1365445898, 0),
(12, 1, 3, 'moodle/backup:backuptargethub', 1, 1365445898, 0),
(13, 1, 1, 'moodle/backup:backuptargethub', 1, 1365445898, 0),
(14, 1, 3, 'moodle/backup:backuptargetimport', 1, 1365445898, 0),
(15, 1, 1, 'moodle/backup:backuptargetimport', 1, 1365445898, 0),
(16, 1, 3, 'moodle/backup:downloadfile', 1, 1365445898, 0),
(17, 1, 1, 'moodle/backup:downloadfile', 1, 1365445898, 0),
(18, 1, 3, 'moodle/backup:configure', 1, 1365445898, 0),
(19, 1, 1, 'moodle/backup:configure', 1, 1365445898, 0),
(20, 1, 1, 'moodle/backup:userinfo', 1, 1365445898, 0),
(21, 1, 1, 'moodle/backup:anonymise', 1, 1365445898, 0),
(22, 1, 3, 'moodle/restore:restorecourse', 1, 1365445898, 0),
(23, 1, 1, 'moodle/restore:restorecourse', 1, 1365445898, 0),
(24, 1, 3, 'moodle/restore:restoresection', 1, 1365445898, 0),
(25, 1, 1, 'moodle/restore:restoresection', 1, 1365445898, 0),
(26, 1, 3, 'moodle/restore:restoreactivity', 1, 1365445898, 0),
(27, 1, 1, 'moodle/restore:restoreactivity', 1, 1365445898, 0),
(28, 1, 3, 'moodle/restore:restoretargethub', 1, 1365445898, 0),
(29, 1, 1, 'moodle/restore:restoretargethub', 1, 1365445898, 0),
(30, 1, 3, 'moodle/restore:restoretargetimport', 1, 1365445898, 0),
(31, 1, 1, 'moodle/restore:restoretargetimport', 1, 1365445898, 0),
(32, 1, 3, 'moodle/restore:uploadfile', 1, 1365445898, 0),
(33, 1, 1, 'moodle/restore:uploadfile', 1, 1365445898, 0),
(34, 1, 3, 'moodle/restore:configure', 1, 1365445898, 0),
(35, 1, 1, 'moodle/restore:configure', 1, 1365445898, 0),
(36, 1, 2, 'moodle/restore:rolldates', 1, 1365445898, 0),
(37, 1, 1, 'moodle/restore:rolldates', 1, 1365445898, 0),
(38, 1, 1, 'moodle/restore:userinfo', 1, 1365445898, 0),
(39, 1, 1, 'moodle/restore:createuser', 1, 1365445898, 0),
(40, 1, 3, 'moodle/site:manageblocks', 1, 1365445898, 0),
(41, 1, 1, 'moodle/site:manageblocks', 1, 1365445898, 0),
(42, 1, 4, 'moodle/site:accessallgroups', 1, 1365445898, 0),
(43, 1, 3, 'moodle/site:accessallgroups', 1, 1365445898, 0),
(44, 1, 1, 'moodle/site:accessallgroups', 1, 1365445898, 0),
(45, 1, 4, 'moodle/site:viewfullnames', 1, 1365445898, 0),
(46, 1, 3, 'moodle/site:viewfullnames', 1, 1365445898, 0),
(47, 1, 1, 'moodle/site:viewfullnames', 1, 1365445898, 0),
(48, 1, 4, 'moodle/site:viewuseridentity', 1, 1365445898, 0),
(49, 1, 3, 'moodle/site:viewuseridentity', 1, 1365445898, 0),
(50, 1, 1, 'moodle/site:viewuseridentity', 1, 1365445898, 0),
(51, 1, 4, 'moodle/site:viewreports', 1, 1365445898, 0),
(52, 1, 3, 'moodle/site:viewreports', 1, 1365445898, 0),
(53, 1, 1, 'moodle/site:viewreports', 1, 1365445898, 0),
(54, 1, 3, 'moodle/site:trustcontent', 1, 1365445899, 0),
(55, 1, 1, 'moodle/site:trustcontent', 1, 1365445899, 0),
(56, 1, 1, 'moodle/site:uploadusers', 1, 1365445899, 0),
(57, 1, 3, 'moodle/filter:manage', 1, 1365445899, 0),
(58, 1, 1, 'moodle/filter:manage', 1, 1365445899, 0),
(59, 1, 1, 'moodle/user:create', 1, 1365445899, 0),
(60, 1, 1, 'moodle/user:delete', 1, 1365445899, 0),
(61, 1, 1, 'moodle/user:update', 1, 1365445899, 0),
(62, 1, 6, 'moodle/user:viewdetails', 1, 1365445899, 0),
(63, 1, 5, 'moodle/user:viewdetails', 1, 1365445899, 0),
(64, 1, 4, 'moodle/user:viewdetails', 1, 1365445899, 0),
(65, 1, 3, 'moodle/user:viewdetails', 1, 1365445899, 0),
(66, 1, 1, 'moodle/user:viewdetails', 1, 1365445899, 0),
(67, 1, 1, 'moodle/user:viewalldetails', 1, 1365445899, 0),
(68, 1, 4, 'moodle/user:viewhiddendetails', 1, 1365445899, 0),
(69, 1, 3, 'moodle/user:viewhiddendetails', 1, 1365445899, 0),
(70, 1, 1, 'moodle/user:viewhiddendetails', 1, 1365445899, 0),
(71, 1, 1, 'moodle/user:loginas', 1, 1365445899, 0),
(72, 1, 1, 'moodle/user:managesyspages', 1, 1365445899, 0),
(73, 1, 7, 'moodle/user:manageownblocks', 1, 1365445899, 0),
(74, 1, 7, 'moodle/user:manageownfiles', 1, 1365445899, 0),
(75, 1, 1, 'moodle/my:configsyspages', 1, 1365445899, 0),
(76, 1, 3, 'moodle/role:assign', 1, 1365445899, 0),
(77, 1, 1, 'moodle/role:assign', 1, 1365445899, 0),
(78, 1, 4, 'moodle/role:review', 1, 1365445899, 0),
(79, 1, 3, 'moodle/role:review', 1, 1365445899, 0),
(80, 1, 1, 'moodle/role:review', 1, 1365445899, 0),
(81, 1, 1, 'moodle/role:override', 1, 1365445899, 0),
(82, 1, 3, 'moodle/role:safeoverride', 1, 1365445899, 0),
(83, 1, 1, 'moodle/role:manage', 1, 1365445899, 0),
(84, 1, 3, 'moodle/role:switchroles', 1, 1365445899, 0),
(85, 1, 1, 'moodle/role:switchroles', 1, 1365445899, 0),
(86, 1, 1, 'moodle/category:manage', 1, 1365445899, 0),
(87, 1, 2, 'moodle/category:viewhiddencategories', 1, 1365445899, 0),
(88, 1, 1, 'moodle/category:viewhiddencategories', 1, 1365445899, 0),
(89, 1, 1, 'moodle/cohort:manage', 1, 1365445899, 0),
(90, 1, 1, 'moodle/cohort:assign', 1, 1365445899, 0),
(91, 1, 3, 'moodle/cohort:view', 1, 1365445899, 0),
(92, 1, 1, 'moodle/cohort:view', 1, 1365445899, 0),
(93, 1, 2, 'moodle/course:create', 1, 1365445899, 0),
(94, 1, 1, 'moodle/course:create', 1, 1365445899, 0),
(95, 1, 7, 'moodle/course:request', 1, 1365445899, 0),
(96, 1, 1, 'moodle/course:delete', 1, 1365445899, 0),
(97, 1, 3, 'moodle/course:update', 1, 1365445899, 0),
(98, 1, 1, 'moodle/course:update', 1, 1365445899, 0),
(99, 1, 1, 'moodle/course:view', 1, 1365445899, 0),
(100, 1, 3, 'moodle/course:enrolreview', 1, 1365445899, 0),
(101, 1, 1, 'moodle/course:enrolreview', 1, 1365445899, 0),
(102, 1, 3, 'moodle/course:enrolconfig', 1, 1365445899, 0),
(103, 1, 1, 'moodle/course:enrolconfig', 1, 1365445899, 0),
(104, 1, 4, 'moodle/course:bulkmessaging', 1, 1365445899, 0),
(105, 1, 3, 'moodle/course:bulkmessaging', 1, 1365445899, 0),
(106, 1, 1, 'moodle/course:bulkmessaging', 1, 1365445899, 0),
(107, 1, 4, 'moodle/course:viewhiddenuserfields', 1, 1365445899, 0),
(108, 1, 3, 'moodle/course:viewhiddenuserfields', 1, 1365445899, 0),
(109, 1, 1, 'moodle/course:viewhiddenuserfields', 1, 1365445899, 0),
(110, 1, 2, 'moodle/course:viewhiddencourses', 1, 1365445899, 0),
(111, 1, 4, 'moodle/course:viewhiddencourses', 1, 1365445899, 0),
(112, 1, 3, 'moodle/course:viewhiddencourses', 1, 1365445899, 0),
(113, 1, 1, 'moodle/course:viewhiddencourses', 1, 1365445899, 0),
(114, 1, 3, 'moodle/course:visibility', 1, 1365445899, 0),
(115, 1, 1, 'moodle/course:visibility', 1, 1365445899, 0),
(116, 1, 3, 'moodle/course:managefiles', 1, 1365445899, 0),
(117, 1, 1, 'moodle/course:managefiles', 1, 1365445899, 0),
(118, 1, 3, 'moodle/course:manageactivities', 1, 1365445899, 0),
(119, 1, 1, 'moodle/course:manageactivities', 1, 1365445899, 0),
(120, 1, 3, 'moodle/course:activityvisibility', 1, 1365445899, 0),
(121, 1, 1, 'moodle/course:activityvisibility', 1, 1365445899, 0),
(122, 1, 4, 'moodle/course:viewhiddenactivities', 1, 1365445899, 0),
(123, 1, 3, 'moodle/course:viewhiddenactivities', 1, 1365445899, 0),
(124, 1, 1, 'moodle/course:viewhiddenactivities', 1, 1365445899, 0),
(125, 1, 5, 'moodle/course:viewparticipants', 1, 1365445899, 0),
(126, 1, 4, 'moodle/course:viewparticipants', 1, 1365445899, 0),
(127, 1, 3, 'moodle/course:viewparticipants', 1, 1365445899, 0),
(128, 1, 1, 'moodle/course:viewparticipants', 1, 1365445899, 0),
(129, 1, 3, 'moodle/course:changefullname', 1, 1365445899, 0),
(130, 1, 1, 'moodle/course:changefullname', 1, 1365445899, 0),
(131, 1, 3, 'moodle/course:changeshortname', 1, 1365445899, 0),
(132, 1, 1, 'moodle/course:changeshortname', 1, 1365445899, 0),
(133, 1, 3, 'moodle/course:changeidnumber', 1, 1365445899, 0),
(134, 1, 1, 'moodle/course:changeidnumber', 1, 1365445899, 0),
(135, 1, 3, 'moodle/course:changecategory', 1, 1365445899, 0),
(136, 1, 1, 'moodle/course:changecategory', 1, 1365445899, 0),
(137, 1, 3, 'moodle/course:changesummary', 1, 1365445899, 0),
(138, 1, 1, 'moodle/course:changesummary', 1, 1365445899, 0),
(139, 1, 1, 'moodle/site:viewparticipants', 1, 1365445899, 0),
(140, 1, 5, 'moodle/course:isincompletionreports', 1, 1365445899, 0),
(141, 1, 5, 'moodle/course:viewscales', 1, 1365445899, 0),
(142, 1, 4, 'moodle/course:viewscales', 1, 1365445899, 0),
(143, 1, 3, 'moodle/course:viewscales', 1, 1365445899, 0),
(144, 1, 1, 'moodle/course:viewscales', 1, 1365445899, 0),
(145, 1, 3, 'moodle/course:managescales', 1, 1365445899, 0),
(146, 1, 1, 'moodle/course:managescales', 1, 1365445899, 0),
(147, 1, 3, 'moodle/course:managegroups', 1, 1365445899, 0),
(148, 1, 1, 'moodle/course:managegroups', 1, 1365445899, 0),
(149, 1, 3, 'moodle/course:reset', 1, 1365445899, 0),
(150, 1, 1, 'moodle/course:reset', 1, 1365445899, 0),
(151, 1, 6, 'moodle/blog:view', 1, 1365445899, 0),
(152, 1, 7, 'moodle/blog:view', 1, 1365445899, 0),
(153, 1, 5, 'moodle/blog:view', 1, 1365445899, 0),
(154, 1, 4, 'moodle/blog:view', 1, 1365445899, 0),
(155, 1, 3, 'moodle/blog:view', 1, 1365445899, 0),
(156, 1, 1, 'moodle/blog:view', 1, 1365445899, 0),
(157, 1, 6, 'moodle/blog:search', 1, 1365445899, 0),
(158, 1, 7, 'moodle/blog:search', 1, 1365445899, 0),
(159, 1, 5, 'moodle/blog:search', 1, 1365445899, 0),
(160, 1, 4, 'moodle/blog:search', 1, 1365445899, 0),
(161, 1, 3, 'moodle/blog:search', 1, 1365445899, 0),
(162, 1, 1, 'moodle/blog:search', 1, 1365445899, 0),
(163, 1, 1, 'moodle/blog:viewdrafts', 1, 1365445899, 0),
(164, 1, 7, 'moodle/blog:create', 1, 1365445899, 0),
(165, 1, 1, 'moodle/blog:create', 1, 1365445899, 0),
(166, 1, 4, 'moodle/blog:manageentries', 1, 1365445899, 0),
(167, 1, 3, 'moodle/blog:manageentries', 1, 1365445899, 0),
(168, 1, 1, 'moodle/blog:manageentries', 1, 1365445899, 0),
(169, 1, 5, 'moodle/blog:manageexternal', 1, 1365445899, 0),
(170, 1, 7, 'moodle/blog:manageexternal', 1, 1365445899, 0),
(171, 1, 4, 'moodle/blog:manageexternal', 1, 1365445899, 0),
(172, 1, 3, 'moodle/blog:manageexternal', 1, 1365445899, 0),
(173, 1, 1, 'moodle/blog:manageexternal', 1, 1365445899, 0),
(174, 1, 5, 'moodle/blog:associatecourse', 1, 1365445899, 0),
(175, 1, 7, 'moodle/blog:associatecourse', 1, 1365445899, 0),
(176, 1, 4, 'moodle/blog:associatecourse', 1, 1365445899, 0),
(177, 1, 3, 'moodle/blog:associatecourse', 1, 1365445899, 0),
(178, 1, 1, 'moodle/blog:associatecourse', 1, 1365445899, 0),
(179, 1, 5, 'moodle/blog:associatemodule', 1, 1365445899, 0),
(180, 1, 7, 'moodle/blog:associatemodule', 1, 1365445899, 0),
(181, 1, 4, 'moodle/blog:associatemodule', 1, 1365445899, 0),
(182, 1, 3, 'moodle/blog:associatemodule', 1, 1365445899, 0),
(183, 1, 1, 'moodle/blog:associatemodule', 1, 1365445899, 0),
(184, 1, 7, 'moodle/calendar:manageownentries', 1, 1365445899, 0),
(185, 1, 1, 'moodle/calendar:manageownentries', 1, 1365445899, 0),
(186, 1, 4, 'moodle/calendar:managegroupentries', 1, 1365445899, 0),
(187, 1, 3, 'moodle/calendar:managegroupentries', 1, 1365445899, 0),
(188, 1, 1, 'moodle/calendar:managegroupentries', 1, 1365445899, 0),
(189, 1, 4, 'moodle/calendar:manageentries', 1, 1365445899, 0),
(190, 1, 3, 'moodle/calendar:manageentries', 1, 1365445899, 0),
(191, 1, 1, 'moodle/calendar:manageentries', 1, 1365445899, 0),
(192, 1, 1, 'moodle/user:editprofile', 1, 1365445899, 0),
(193, 1, 6, 'moodle/user:editownprofile', -1000, 1365445899, 0),
(194, 1, 7, 'moodle/user:editownprofile', 1, 1365445899, 0),
(195, 1, 1, 'moodle/user:editownprofile', 1, 1365445899, 0),
(196, 1, 6, 'moodle/user:changeownpassword', -1000, 1365445900, 0),
(197, 1, 7, 'moodle/user:changeownpassword', 1, 1365445900, 0),
(198, 1, 1, 'moodle/user:changeownpassword', 1, 1365445900, 0),
(199, 1, 5, 'moodle/user:readuserposts', 1, 1365445900, 0),
(200, 1, 4, 'moodle/user:readuserposts', 1, 1365445900, 0),
(201, 1, 3, 'moodle/user:readuserposts', 1, 1365445900, 0),
(202, 1, 1, 'moodle/user:readuserposts', 1, 1365445900, 0),
(203, 1, 5, 'moodle/user:readuserblogs', 1, 1365445900, 0),
(204, 1, 4, 'moodle/user:readuserblogs', 1, 1365445900, 0),
(205, 1, 3, 'moodle/user:readuserblogs', 1, 1365445900, 0),
(206, 1, 1, 'moodle/user:readuserblogs', 1, 1365445900, 0),
(207, 1, 1, 'moodle/user:editmessageprofile', 1, 1365445900, 0),
(208, 1, 6, 'moodle/user:editownmessageprofile', -1000, 1365445900, 0),
(209, 1, 7, 'moodle/user:editownmessageprofile', 1, 1365445900, 0),
(210, 1, 1, 'moodle/user:editownmessageprofile', 1, 1365445900, 0),
(211, 1, 3, 'moodle/question:managecategory', 1, 1365445900, 0),
(212, 1, 1, 'moodle/question:managecategory', 1, 1365445900, 0),
(213, 1, 3, 'moodle/question:add', 1, 1365445900, 0),
(214, 1, 1, 'moodle/question:add', 1, 1365445900, 0),
(215, 1, 3, 'moodle/question:editmine', 1, 1365445900, 0),
(216, 1, 1, 'moodle/question:editmine', 1, 1365445900, 0),
(217, 1, 3, 'moodle/question:editall', 1, 1365445900, 0),
(218, 1, 1, 'moodle/question:editall', 1, 1365445900, 0),
(219, 1, 3, 'moodle/question:viewmine', 1, 1365445900, 0),
(220, 1, 1, 'moodle/question:viewmine', 1, 1365445900, 0),
(221, 1, 3, 'moodle/question:viewall', 1, 1365445900, 0),
(222, 1, 1, 'moodle/question:viewall', 1, 1365445900, 0),
(223, 1, 3, 'moodle/question:usemine', 1, 1365445900, 0),
(224, 1, 1, 'moodle/question:usemine', 1, 1365445900, 0),
(225, 1, 3, 'moodle/question:useall', 1, 1365445900, 0),
(226, 1, 1, 'moodle/question:useall', 1, 1365445900, 0),
(227, 1, 3, 'moodle/question:movemine', 1, 1365445900, 0),
(228, 1, 1, 'moodle/question:movemine', 1, 1365445900, 0),
(229, 1, 3, 'moodle/question:moveall', 1, 1365445900, 0),
(230, 1, 1, 'moodle/question:moveall', 1, 1365445900, 0),
(231, 1, 1, 'moodle/question:config', 1, 1365445900, 0),
(232, 1, 5, 'moodle/question:flag', 1, 1365445900, 0),
(233, 1, 4, 'moodle/question:flag', 1, 1365445900, 0),
(234, 1, 3, 'moodle/question:flag', 1, 1365445900, 0),
(235, 1, 1, 'moodle/question:flag', 1, 1365445900, 0),
(236, 1, 4, 'moodle/site:doclinks', 1, 1365445900, 0),
(237, 1, 3, 'moodle/site:doclinks', 1, 1365445900, 0),
(238, 1, 1, 'moodle/site:doclinks', 1, 1365445900, 0),
(239, 1, 3, 'moodle/course:sectionvisibility', 1, 1365445900, 0),
(240, 1, 1, 'moodle/course:sectionvisibility', 1, 1365445900, 0),
(241, 1, 3, 'moodle/course:useremail', 1, 1365445900, 0),
(242, 1, 1, 'moodle/course:useremail', 1, 1365445900, 0),
(243, 1, 3, 'moodle/course:viewhiddensections', 1, 1365445900, 0),
(244, 1, 1, 'moodle/course:viewhiddensections', 1, 1365445900, 0),
(245, 1, 3, 'moodle/course:setcurrentsection', 1, 1365445900, 0),
(246, 1, 1, 'moodle/course:setcurrentsection', 1, 1365445900, 0),
(247, 1, 3, 'moodle/course:movesections', 1, 1365445900, 0),
(248, 1, 1, 'moodle/course:movesections', 1, 1365445900, 0),
(249, 1, 4, 'moodle/grade:viewall', 1, 1365445900, 0),
(250, 1, 3, 'moodle/grade:viewall', 1, 1365445900, 0),
(251, 1, 1, 'moodle/grade:viewall', 1, 1365445900, 0),
(252, 1, 5, 'moodle/grade:view', 1, 1365445900, 0),
(253, 1, 4, 'moodle/grade:viewhidden', 1, 1365445900, 0),
(254, 1, 3, 'moodle/grade:viewhidden', 1, 1365445900, 0),
(255, 1, 1, 'moodle/grade:viewhidden', 1, 1365445900, 0),
(256, 1, 3, 'moodle/grade:import', 1, 1365445900, 0),
(257, 1, 1, 'moodle/grade:import', 1, 1365445900, 0),
(258, 1, 4, 'moodle/grade:export', 1, 1365445900, 0),
(259, 1, 3, 'moodle/grade:export', 1, 1365445900, 0),
(260, 1, 1, 'moodle/grade:export', 1, 1365445900, 0),
(261, 1, 3, 'moodle/grade:manage', 1, 1365445900, 0),
(262, 1, 1, 'moodle/grade:manage', 1, 1365445900, 0),
(263, 1, 3, 'moodle/grade:edit', 1, 1365445900, 0),
(264, 1, 1, 'moodle/grade:edit', 1, 1365445900, 0),
(265, 1, 3, 'moodle/grade:managegradingforms', 1, 1365445900, 0),
(266, 1, 1, 'moodle/grade:managegradingforms', 1, 1365445900, 0),
(267, 1, 1, 'moodle/grade:sharegradingforms', 1, 1365445900, 0),
(268, 1, 1, 'moodle/grade:managesharedforms', 1, 1365445900, 0),
(269, 1, 3, 'moodle/grade:manageoutcomes', 1, 1365445900, 0),
(270, 1, 1, 'moodle/grade:manageoutcomes', 1, 1365445900, 0),
(271, 1, 3, 'moodle/grade:manageletters', 1, 1365445900, 0),
(272, 1, 1, 'moodle/grade:manageletters', 1, 1365445900, 0),
(273, 1, 3, 'moodle/grade:hide', 1, 1365445900, 0),
(274, 1, 1, 'moodle/grade:hide', 1, 1365445900, 0),
(275, 1, 3, 'moodle/grade:lock', 1, 1365445900, 0),
(276, 1, 1, 'moodle/grade:lock', 1, 1365445900, 0),
(277, 1, 3, 'moodle/grade:unlock', 1, 1365445900, 0),
(278, 1, 1, 'moodle/grade:unlock', 1, 1365445900, 0),
(279, 1, 7, 'moodle/my:manageblocks', 1, 1365445900, 0),
(280, 1, 4, 'moodle/notes:view', 1, 1365445900, 0),
(281, 1, 3, 'moodle/notes:view', 1, 1365445900, 0),
(282, 1, 1, 'moodle/notes:view', 1, 1365445900, 0),
(283, 1, 4, 'moodle/notes:manage', 1, 1365445900, 0),
(284, 1, 3, 'moodle/notes:manage', 1, 1365445900, 0),
(285, 1, 1, 'moodle/notes:manage', 1, 1365445900, 0),
(286, 1, 4, 'moodle/tag:manage', 1, 1365445900, 0),
(287, 1, 3, 'moodle/tag:manage', 1, 1365445900, 0),
(288, 1, 1, 'moodle/tag:manage', 1, 1365445900, 0),
(289, 1, 1, 'moodle/tag:create', 1, 1365445900, 0),
(290, 1, 7, 'moodle/tag:create', 1, 1365445900, 0),
(291, 1, 1, 'moodle/tag:edit', 1, 1365445900, 0),
(292, 1, 7, 'moodle/tag:edit', 1, 1365445900, 0),
(293, 1, 1, 'moodle/tag:flag', 1, 1365445900, 0),
(294, 1, 7, 'moodle/tag:flag', 1, 1365445900, 0),
(295, 1, 4, 'moodle/tag:editblocks', 1, 1365445900, 0),
(296, 1, 3, 'moodle/tag:editblocks', 1, 1365445900, 0),
(297, 1, 1, 'moodle/tag:editblocks', 1, 1365445900, 0),
(298, 1, 6, 'moodle/block:view', 1, 1365445900, 0),
(299, 1, 7, 'moodle/block:view', 1, 1365445900, 0),
(300, 1, 5, 'moodle/block:view', 1, 1365445900, 0),
(301, 1, 4, 'moodle/block:view', 1, 1365445900, 0),
(302, 1, 3, 'moodle/block:view', 1, 1365445900, 0),
(303, 1, 3, 'moodle/block:edit', 1, 1365445900, 0),
(304, 1, 1, 'moodle/block:edit', 1, 1365445900, 0),
(305, 1, 7, 'moodle/portfolio:export', 1, 1365445900, 0),
(306, 1, 5, 'moodle/portfolio:export', 1, 1365445900, 0),
(307, 1, 4, 'moodle/portfolio:export', 1, 1365445900, 0),
(308, 1, 3, 'moodle/portfolio:export', 1, 1365445900, 0),
(309, 1, 8, 'moodle/comment:view', 1, 1365445900, 0),
(310, 1, 6, 'moodle/comment:view', 1, 1365445900, 0),
(311, 1, 7, 'moodle/comment:view', 1, 1365445900, 0),
(312, 1, 5, 'moodle/comment:view', 1, 1365445900, 0),
(313, 1, 4, 'moodle/comment:view', 1, 1365445900, 0),
(314, 1, 3, 'moodle/comment:view', 1, 1365445900, 0),
(315, 1, 1, 'moodle/comment:view', 1, 1365445900, 0),
(316, 1, 7, 'moodle/comment:post', 1, 1365445900, 0),
(317, 1, 5, 'moodle/comment:post', 1, 1365445900, 0),
(318, 1, 4, 'moodle/comment:post', 1, 1365445900, 0),
(319, 1, 3, 'moodle/comment:post', 1, 1365445900, 0),
(320, 1, 1, 'moodle/comment:post', 1, 1365445900, 0),
(321, 1, 3, 'moodle/comment:delete', 1, 1365445900, 0),
(322, 1, 1, 'moodle/comment:delete', 1, 1365445900, 0),
(323, 1, 1, 'moodle/webservice:createtoken', 1, 1365445900, 0),
(324, 1, 7, 'moodle/webservice:createmobiletoken', 1, 1365445900, 0),
(325, 1, 7, 'moodle/rating:view', 1, 1365445900, 0),
(326, 1, 5, 'moodle/rating:view', 1, 1365445900, 0),
(327, 1, 4, 'moodle/rating:view', 1, 1365445900, 0),
(328, 1, 3, 'moodle/rating:view', 1, 1365445900, 0),
(329, 1, 1, 'moodle/rating:view', 1, 1365445900, 0),
(330, 1, 7, 'moodle/rating:viewany', 1, 1365445900, 0),
(331, 1, 5, 'moodle/rating:viewany', 1, 1365445900, 0),
(332, 1, 4, 'moodle/rating:viewany', 1, 1365445900, 0),
(333, 1, 3, 'moodle/rating:viewany', 1, 1365445900, 0),
(334, 1, 1, 'moodle/rating:viewany', 1, 1365445900, 0),
(335, 1, 7, 'moodle/rating:viewall', 1, 1365445900, 0),
(336, 1, 5, 'moodle/rating:viewall', 1, 1365445900, 0),
(337, 1, 4, 'moodle/rating:viewall', 1, 1365445900, 0),
(338, 1, 3, 'moodle/rating:viewall', 1, 1365445900, 0),
(339, 1, 1, 'moodle/rating:viewall', 1, 1365445900, 0),
(340, 1, 7, 'moodle/rating:rate', 1, 1365445900, 0),
(341, 1, 5, 'moodle/rating:rate', 1, 1365445900, 0),
(342, 1, 4, 'moodle/rating:rate', 1, 1365445900, 0),
(343, 1, 3, 'moodle/rating:rate', 1, 1365445900, 0),
(344, 1, 1, 'moodle/rating:rate', 1, 1365445900, 0),
(345, 1, 1, 'moodle/course:publish', 1, 1365445900, 0),
(346, 1, 4, 'moodle/course:markcomplete', 1, 1365445900, 0),
(347, 1, 3, 'moodle/course:markcomplete', 1, 1365445900, 0),
(348, 1, 1, 'moodle/course:markcomplete', 1, 1365445900, 0),
(349, 1, 1, 'moodle/community:add', 1, 1365445900, 0),
(350, 1, 4, 'moodle/community:add', 1, 1365445900, 0),
(351, 1, 3, 'moodle/community:add', 1, 1365445900, 0),
(352, 1, 1, 'moodle/community:download', 1, 1365445900, 0),
(353, 1, 3, 'moodle/community:download', 1, 1365445900, 0),
(354, 1, 6, 'mod/assign:view', 1, 1365445916, 0),
(355, 1, 5, 'mod/assign:view', 1, 1365445916, 0),
(356, 1, 4, 'mod/assign:view', 1, 1365445916, 0),
(357, 1, 3, 'mod/assign:view', 1, 1365445916, 0),
(358, 1, 1, 'mod/assign:view', 1, 1365445916, 0),
(359, 1, 5, 'mod/assign:submit', 1, 1365445916, 0),
(360, 1, 4, 'mod/assign:grade', 1, 1365445916, 0),
(361, 1, 3, 'mod/assign:grade', 1, 1365445916, 0),
(362, 1, 1, 'mod/assign:grade', 1, 1365445916, 0),
(363, 1, 4, 'mod/assign:exportownsubmission', 1, 1365445916, 0),
(364, 1, 3, 'mod/assign:exportownsubmission', 1, 1365445916, 0),
(365, 1, 1, 'mod/assign:exportownsubmission', 1, 1365445916, 0),
(366, 1, 5, 'mod/assign:exportownsubmission', 1, 1365445916, 0),
(367, 1, 3, 'mod/assign:addinstance', 1, 1365445916, 0),
(368, 1, 1, 'mod/assign:addinstance', 1, 1365445916, 0),
(369, 1, 4, 'mod/assign:grantextension', 1, 1365445916, 0),
(370, 1, 3, 'mod/assign:grantextension', 1, 1365445916, 0),
(371, 1, 1, 'mod/assign:grantextension', 1, 1365445916, 0),
(372, 1, 3, 'mod/assign:revealidentities', 1, 1365445916, 0),
(373, 1, 1, 'mod/assign:revealidentities', 1, 1365445916, 0),
(374, 1, 6, 'mod/assignment:view', 1, 1365445917, 0),
(375, 1, 5, 'mod/assignment:view', 1, 1365445917, 0),
(376, 1, 4, 'mod/assignment:view', 1, 1365445917, 0),
(377, 1, 3, 'mod/assignment:view', 1, 1365445917, 0),
(378, 1, 1, 'mod/assignment:view', 1, 1365445917, 0),
(379, 1, 3, 'mod/assignment:addinstance', 1, 1365445917, 0),
(380, 1, 1, 'mod/assignment:addinstance', 1, 1365445917, 0),
(381, 1, 5, 'mod/assignment:submit', 1, 1365445917, 0),
(382, 1, 4, 'mod/assignment:grade', 1, 1365445917, 0),
(383, 1, 3, 'mod/assignment:grade', 1, 1365445917, 0),
(384, 1, 1, 'mod/assignment:grade', 1, 1365445917, 0),
(385, 1, 4, 'mod/assignment:exportownsubmission', 1, 1365445917, 0),
(386, 1, 3, 'mod/assignment:exportownsubmission', 1, 1365445917, 0),
(387, 1, 1, 'mod/assignment:exportownsubmission', 1, 1365445917, 0),
(388, 1, 5, 'mod/assignment:exportownsubmission', 1, 1365445917, 0),
(389, 1, 3, 'mod/book:addinstance', 1, 1365445918, 0),
(390, 1, 1, 'mod/book:addinstance', 1, 1365445918, 0),
(391, 1, 6, 'mod/book:read', 1, 1365445918, 0),
(392, 1, 8, 'mod/book:read', 1, 1365445918, 0),
(393, 1, 5, 'mod/book:read', 1, 1365445918, 0),
(394, 1, 4, 'mod/book:read', 1, 1365445918, 0),
(395, 1, 3, 'mod/book:read', 1, 1365445918, 0),
(396, 1, 1, 'mod/book:read', 1, 1365445918, 0),
(397, 1, 4, 'mod/book:viewhiddenchapters', 1, 1365445918, 0),
(398, 1, 3, 'mod/book:viewhiddenchapters', 1, 1365445918, 0),
(399, 1, 1, 'mod/book:viewhiddenchapters', 1, 1365445918, 0),
(400, 1, 3, 'mod/book:edit', 1, 1365445918, 0),
(401, 1, 1, 'mod/book:edit', 1, 1365445918, 0),
(402, 1, 3, 'mod/chat:addinstance', 1, 1365445919, 0),
(403, 1, 1, 'mod/chat:addinstance', 1, 1365445919, 0),
(404, 1, 5, 'mod/chat:chat', 1, 1365445919, 0),
(405, 1, 4, 'mod/chat:chat', 1, 1365445919, 0),
(406, 1, 3, 'mod/chat:chat', 1, 1365445919, 0),
(407, 1, 1, 'mod/chat:chat', 1, 1365445919, 0),
(408, 1, 5, 'mod/chat:readlog', 1, 1365445919, 0),
(409, 1, 4, 'mod/chat:readlog', 1, 1365445919, 0),
(410, 1, 3, 'mod/chat:readlog', 1, 1365445919, 0),
(411, 1, 1, 'mod/chat:readlog', 1, 1365445919, 0),
(412, 1, 4, 'mod/chat:deletelog', 1, 1365445919, 0),
(413, 1, 3, 'mod/chat:deletelog', 1, 1365445919, 0),
(414, 1, 1, 'mod/chat:deletelog', 1, 1365445919, 0),
(415, 1, 4, 'mod/chat:exportparticipatedsession', 1, 1365445919, 0),
(416, 1, 3, 'mod/chat:exportparticipatedsession', 1, 1365445919, 0),
(417, 1, 1, 'mod/chat:exportparticipatedsession', 1, 1365445919, 0),
(418, 1, 4, 'mod/chat:exportsession', 1, 1365445919, 0),
(419, 1, 3, 'mod/chat:exportsession', 1, 1365445919, 0),
(420, 1, 1, 'mod/chat:exportsession', 1, 1365445919, 0),
(421, 1, 3, 'mod/choice:addinstance', 1, 1365445919, 0),
(422, 1, 1, 'mod/choice:addinstance', 1, 1365445919, 0),
(423, 1, 5, 'mod/choice:choose', 1, 1365445919, 0),
(424, 1, 4, 'mod/choice:choose', 1, 1365445919, 0),
(425, 1, 3, 'mod/choice:choose', 1, 1365445919, 0),
(426, 1, 4, 'mod/choice:readresponses', 1, 1365445919, 0),
(427, 1, 3, 'mod/choice:readresponses', 1, 1365445919, 0),
(428, 1, 1, 'mod/choice:readresponses', 1, 1365445919, 0),
(429, 1, 4, 'mod/choice:deleteresponses', 1, 1365445919, 0),
(430, 1, 3, 'mod/choice:deleteresponses', 1, 1365445919, 0),
(431, 1, 1, 'mod/choice:deleteresponses', 1, 1365445919, 0),
(432, 1, 4, 'mod/choice:downloadresponses', 1, 1365445919, 0),
(433, 1, 3, 'mod/choice:downloadresponses', 1, 1365445919, 0),
(434, 1, 1, 'mod/choice:downloadresponses', 1, 1365445919, 0),
(435, 1, 3, 'mod/data:addinstance', 1, 1365445921, 0),
(436, 1, 1, 'mod/data:addinstance', 1, 1365445921, 0),
(437, 1, 8, 'mod/data:viewentry', 1, 1365445921, 0),
(438, 1, 6, 'mod/data:viewentry', 1, 1365445921, 0),
(439, 1, 5, 'mod/data:viewentry', 1, 1365445921, 0),
(440, 1, 4, 'mod/data:viewentry', 1, 1365445921, 0),
(441, 1, 3, 'mod/data:viewentry', 1, 1365445921, 0),
(442, 1, 1, 'mod/data:viewentry', 1, 1365445921, 0),
(443, 1, 5, 'mod/data:writeentry', 1, 1365445921, 0),
(444, 1, 4, 'mod/data:writeentry', 1, 1365445921, 0),
(445, 1, 3, 'mod/data:writeentry', 1, 1365445921, 0),
(446, 1, 1, 'mod/data:writeentry', 1, 1365445921, 0),
(447, 1, 5, 'mod/data:comment', 1, 1365445921, 0),
(448, 1, 4, 'mod/data:comment', 1, 1365445921, 0),
(449, 1, 3, 'mod/data:comment', 1, 1365445921, 0),
(450, 1, 1, 'mod/data:comment', 1, 1365445921, 0),
(451, 1, 4, 'mod/data:rate', 1, 1365445921, 0),
(452, 1, 3, 'mod/data:rate', 1, 1365445921, 0),
(453, 1, 1, 'mod/data:rate', 1, 1365445921, 0),
(454, 1, 4, 'mod/data:viewrating', 1, 1365445921, 0),
(455, 1, 3, 'mod/data:viewrating', 1, 1365445921, 0),
(456, 1, 1, 'mod/data:viewrating', 1, 1365445921, 0),
(457, 1, 4, 'mod/data:viewanyrating', 1, 1365445921, 0),
(458, 1, 3, 'mod/data:viewanyrating', 1, 1365445921, 0),
(459, 1, 1, 'mod/data:viewanyrating', 1, 1365445921, 0),
(460, 1, 4, 'mod/data:viewallratings', 1, 1365445921, 0),
(461, 1, 3, 'mod/data:viewallratings', 1, 1365445921, 0),
(462, 1, 1, 'mod/data:viewallratings', 1, 1365445921, 0),
(463, 1, 4, 'mod/data:approve', 1, 1365445921, 0),
(464, 1, 3, 'mod/data:approve', 1, 1365445921, 0),
(465, 1, 1, 'mod/data:approve', 1, 1365445921, 0),
(466, 1, 4, 'mod/data:manageentries', 1, 1365445921, 0),
(467, 1, 3, 'mod/data:manageentries', 1, 1365445921, 0),
(468, 1, 1, 'mod/data:manageentries', 1, 1365445921, 0),
(469, 1, 4, 'mod/data:managecomments', 1, 1365445921, 0),
(470, 1, 3, 'mod/data:managecomments', 1, 1365445921, 0),
(471, 1, 1, 'mod/data:managecomments', 1, 1365445921, 0),
(472, 1, 3, 'mod/data:managetemplates', 1, 1365445921, 0),
(473, 1, 1, 'mod/data:managetemplates', 1, 1365445921, 0),
(474, 1, 4, 'mod/data:viewalluserpresets', 1, 1365445921, 0),
(475, 1, 3, 'mod/data:viewalluserpresets', 1, 1365445921, 0),
(476, 1, 1, 'mod/data:viewalluserpresets', 1, 1365445921, 0),
(477, 1, 1, 'mod/data:manageuserpresets', 1, 1365445921, 0),
(478, 1, 1, 'mod/data:exportentry', 1, 1365445921, 0),
(479, 1, 4, 'mod/data:exportentry', 1, 1365445921, 0),
(480, 1, 3, 'mod/data:exportentry', 1, 1365445921, 0),
(481, 1, 1, 'mod/data:exportownentry', 1, 1365445921, 0),
(482, 1, 4, 'mod/data:exportownentry', 1, 1365445921, 0),
(483, 1, 3, 'mod/data:exportownentry', 1, 1365445921, 0),
(484, 1, 5, 'mod/data:exportownentry', 1, 1365445921, 0),
(485, 1, 1, 'mod/data:exportallentries', 1, 1365445921, 0),
(486, 1, 4, 'mod/data:exportallentries', 1, 1365445921, 0),
(487, 1, 3, 'mod/data:exportallentries', 1, 1365445921, 0),
(488, 1, 1, 'mod/data:exportuserinfo', 1, 1365445921, 0),
(489, 1, 4, 'mod/data:exportuserinfo', 1, 1365445921, 0),
(490, 1, 3, 'mod/data:exportuserinfo', 1, 1365445921, 0),
(491, 1, 3, 'mod/feedback:addinstance', 1, 1365445922, 0),
(492, 1, 1, 'mod/feedback:addinstance', 1, 1365445922, 0),
(493, 1, 6, 'mod/feedback:view', 1, 1365445922, 0),
(494, 1, 5, 'mod/feedback:view', 1, 1365445922, 0),
(495, 1, 4, 'mod/feedback:view', 1, 1365445922, 0),
(496, 1, 3, 'mod/feedback:view', 1, 1365445922, 0),
(497, 1, 1, 'mod/feedback:view', 1, 1365445922, 0),
(498, 1, 5, 'mod/feedback:complete', 1, 1365445922, 0),
(499, 1, 5, 'mod/feedback:viewanalysepage', 1, 1365445922, 0),
(500, 1, 3, 'mod/feedback:viewanalysepage', 1, 1365445922, 0),
(501, 1, 1, 'mod/feedback:viewanalysepage', 1, 1365445922, 0),
(502, 1, 3, 'mod/feedback:deletesubmissions', 1, 1365445922, 0),
(503, 1, 1, 'mod/feedback:deletesubmissions', 1, 1365445922, 0),
(504, 1, 1, 'mod/feedback:mapcourse', 1, 1365445922, 0),
(505, 1, 3, 'mod/feedback:edititems', 1, 1365445922, 0),
(506, 1, 1, 'mod/feedback:edititems', 1, 1365445922, 0),
(507, 1, 3, 'mod/feedback:createprivatetemplate', 1, 1365445922, 0),
(508, 1, 1, 'mod/feedback:createprivatetemplate', 1, 1365445922, 0),
(509, 1, 3, 'mod/feedback:createpublictemplate', 1, 1365445922, 0),
(510, 1, 1, 'mod/feedback:createpublictemplate', 1, 1365445922, 0),
(511, 1, 3, 'mod/feedback:deletetemplate', 1, 1365445922, 0),
(512, 1, 1, 'mod/feedback:deletetemplate', 1, 1365445922, 0),
(513, 1, 4, 'mod/feedback:viewreports', 1, 1365445922, 0),
(514, 1, 3, 'mod/feedback:viewreports', 1, 1365445922, 0),
(515, 1, 1, 'mod/feedback:viewreports', 1, 1365445922, 0),
(516, 1, 4, 'mod/feedback:receivemail', 1, 1365445922, 0),
(517, 1, 3, 'mod/feedback:receivemail', 1, 1365445922, 0),
(518, 1, 3, 'mod/folder:addinstance', 1, 1365445923, 0),
(519, 1, 1, 'mod/folder:addinstance', 1, 1365445923, 0),
(520, 1, 6, 'mod/folder:view', 1, 1365445923, 0),
(521, 1, 7, 'mod/folder:view', 1, 1365445923, 0),
(522, 1, 3, 'mod/folder:managefiles', 1, 1365445923, 0),
(523, 1, 3, 'mod/forum:addinstance', 1, 1365445924, 0),
(524, 1, 1, 'mod/forum:addinstance', 1, 1365445924, 0),
(525, 1, 8, 'mod/forum:viewdiscussion', 1, 1365445924, 0),
(526, 1, 6, 'mod/forum:viewdiscussion', 1, 1365445924, 0),
(527, 1, 5, 'mod/forum:viewdiscussion', 1, 1365445924, 0),
(528, 1, 4, 'mod/forum:viewdiscussion', 1, 1365445924, 0),
(529, 1, 3, 'mod/forum:viewdiscussion', 1, 1365445924, 0),
(530, 1, 1, 'mod/forum:viewdiscussion', 1, 1365445924, 0),
(531, 1, 4, 'mod/forum:viewhiddentimedposts', 1, 1365445924, 0),
(532, 1, 3, 'mod/forum:viewhiddentimedposts', 1, 1365445924, 0),
(533, 1, 1, 'mod/forum:viewhiddentimedposts', 1, 1365445924, 0),
(534, 1, 5, 'mod/forum:startdiscussion', 1, 1365445924, 0),
(535, 1, 4, 'mod/forum:startdiscussion', 1, 1365445924, 0),
(536, 1, 3, 'mod/forum:startdiscussion', 1, 1365445924, 0),
(537, 1, 1, 'mod/forum:startdiscussion', 1, 1365445924, 0),
(538, 1, 5, 'mod/forum:replypost', 1, 1365445924, 0),
(539, 1, 4, 'mod/forum:replypost', 1, 1365445924, 0),
(540, 1, 3, 'mod/forum:replypost', 1, 1365445924, 0),
(541, 1, 1, 'mod/forum:replypost', 1, 1365445924, 0),
(542, 1, 4, 'mod/forum:addnews', 1, 1365445924, 0),
(543, 1, 3, 'mod/forum:addnews', 1, 1365445924, 0),
(544, 1, 1, 'mod/forum:addnews', 1, 1365445924, 0),
(545, 1, 4, 'mod/forum:replynews', 1, 1365445924, 0),
(546, 1, 3, 'mod/forum:replynews', 1, 1365445924, 0),
(547, 1, 1, 'mod/forum:replynews', 1, 1365445924, 0),
(548, 1, 5, 'mod/forum:viewrating', 1, 1365445924, 0),
(549, 1, 4, 'mod/forum:viewrating', 1, 1365445924, 0),
(550, 1, 3, 'mod/forum:viewrating', 1, 1365445924, 0),
(551, 1, 1, 'mod/forum:viewrating', 1, 1365445924, 0),
(552, 1, 4, 'mod/forum:viewanyrating', 1, 1365445924, 0),
(553, 1, 3, 'mod/forum:viewanyrating', 1, 1365445924, 0),
(554, 1, 1, 'mod/forum:viewanyrating', 1, 1365445924, 0),
(555, 1, 4, 'mod/forum:viewallratings', 1, 1365445924, 0),
(556, 1, 3, 'mod/forum:viewallratings', 1, 1365445924, 0),
(557, 1, 1, 'mod/forum:viewallratings', 1, 1365445924, 0),
(558, 1, 4, 'mod/forum:rate', 1, 1365445924, 0),
(559, 1, 3, 'mod/forum:rate', 1, 1365445924, 0),
(560, 1, 1, 'mod/forum:rate', 1, 1365445924, 0),
(561, 1, 5, 'mod/forum:createattachment', 1, 1365445924, 0),
(562, 1, 4, 'mod/forum:createattachment', 1, 1365445924, 0),
(563, 1, 3, 'mod/forum:createattachment', 1, 1365445924, 0),
(564, 1, 1, 'mod/forum:createattachment', 1, 1365445924, 0),
(565, 1, 5, 'mod/forum:deleteownpost', 1, 1365445924, 0),
(566, 1, 4, 'mod/forum:deleteownpost', 1, 1365445924, 0),
(567, 1, 3, 'mod/forum:deleteownpost', 1, 1365445924, 0),
(568, 1, 1, 'mod/forum:deleteownpost', 1, 1365445924, 0),
(569, 1, 4, 'mod/forum:deleteanypost', 1, 1365445924, 0),
(570, 1, 3, 'mod/forum:deleteanypost', 1, 1365445924, 0),
(571, 1, 1, 'mod/forum:deleteanypost', 1, 1365445924, 0),
(572, 1, 4, 'mod/forum:splitdiscussions', 1, 1365445924, 0),
(573, 1, 3, 'mod/forum:splitdiscussions', 1, 1365445924, 0),
(574, 1, 1, 'mod/forum:splitdiscussions', 1, 1365445924, 0),
(575, 1, 4, 'mod/forum:movediscussions', 1, 1365445924, 0),
(576, 1, 3, 'mod/forum:movediscussions', 1, 1365445924, 0),
(577, 1, 1, 'mod/forum:movediscussions', 1, 1365445924, 0),
(578, 1, 4, 'mod/forum:editanypost', 1, 1365445924, 0),
(579, 1, 3, 'mod/forum:editanypost', 1, 1365445924, 0),
(580, 1, 1, 'mod/forum:editanypost', 1, 1365445924, 0),
(581, 1, 4, 'mod/forum:viewqandawithoutposting', 1, 1365445924, 0),
(582, 1, 3, 'mod/forum:viewqandawithoutposting', 1, 1365445924, 0),
(583, 1, 1, 'mod/forum:viewqandawithoutposting', 1, 1365445924, 0),
(584, 1, 4, 'mod/forum:viewsubscribers', 1, 1365445924, 0),
(585, 1, 3, 'mod/forum:viewsubscribers', 1, 1365445924, 0),
(586, 1, 1, 'mod/forum:viewsubscribers', 1, 1365445924, 0),
(587, 1, 4, 'mod/forum:managesubscriptions', 1, 1365445924, 0),
(588, 1, 3, 'mod/forum:managesubscriptions', 1, 1365445924, 0),
(589, 1, 1, 'mod/forum:managesubscriptions', 1, 1365445924, 0),
(590, 1, 4, 'mod/forum:postwithoutthrottling', 1, 1365445924, 0),
(591, 1, 3, 'mod/forum:postwithoutthrottling', 1, 1365445924, 0),
(592, 1, 1, 'mod/forum:postwithoutthrottling', 1, 1365445924, 0),
(593, 1, 4, 'mod/forum:exportdiscussion', 1, 1365445924, 0),
(594, 1, 3, 'mod/forum:exportdiscussion', 1, 1365445924, 0),
(595, 1, 1, 'mod/forum:exportdiscussion', 1, 1365445924, 0),
(596, 1, 4, 'mod/forum:exportpost', 1, 1365445924, 0),
(597, 1, 3, 'mod/forum:exportpost', 1, 1365445924, 0),
(598, 1, 1, 'mod/forum:exportpost', 1, 1365445924, 0),
(599, 1, 4, 'mod/forum:exportownpost', 1, 1365445924, 0),
(600, 1, 3, 'mod/forum:exportownpost', 1, 1365445924, 0),
(601, 1, 1, 'mod/forum:exportownpost', 1, 1365445924, 0),
(602, 1, 5, 'mod/forum:exportownpost', 1, 1365445924, 0),
(603, 1, 4, 'mod/forum:addquestion', 1, 1365445924, 0),
(604, 1, 3, 'mod/forum:addquestion', 1, 1365445924, 0),
(605, 1, 1, 'mod/forum:addquestion', 1, 1365445924, 0),
(606, 1, 5, 'mod/forum:allowforcesubscribe', 1, 1365445924, 0),
(607, 1, 4, 'mod/forum:allowforcesubscribe', 1, 1365445924, 0),
(608, 1, 3, 'mod/forum:allowforcesubscribe', 1, 1365445924, 0),
(609, 1, 8, 'mod/forum:allowforcesubscribe', 1, 1365445924, 0),
(610, 1, 3, 'mod/glossary:addinstance', 1, 1365445925, 0),
(611, 1, 1, 'mod/glossary:addinstance', 1, 1365445925, 0),
(612, 1, 8, 'mod/glossary:view', 1, 1365445925, 0),
(613, 1, 6, 'mod/glossary:view', 1, 1365445925, 0),
(614, 1, 5, 'mod/glossary:view', 1, 1365445925, 0),
(615, 1, 4, 'mod/glossary:view', 1, 1365445925, 0),
(616, 1, 3, 'mod/glossary:view', 1, 1365445925, 0),
(617, 1, 1, 'mod/glossary:view', 1, 1365445925, 0),
(618, 1, 5, 'mod/glossary:write', 1, 1365445925, 0),
(619, 1, 4, 'mod/glossary:write', 1, 1365445925, 0),
(620, 1, 3, 'mod/glossary:write', 1, 1365445925, 0),
(621, 1, 1, 'mod/glossary:write', 1, 1365445925, 0),
(622, 1, 4, 'mod/glossary:manageentries', 1, 1365445925, 0),
(623, 1, 3, 'mod/glossary:manageentries', 1, 1365445925, 0),
(624, 1, 1, 'mod/glossary:manageentries', 1, 1365445925, 0),
(625, 1, 4, 'mod/glossary:managecategories', 1, 1365445925, 0),
(626, 1, 3, 'mod/glossary:managecategories', 1, 1365445925, 0),
(627, 1, 1, 'mod/glossary:managecategories', 1, 1365445925, 0),
(628, 1, 5, 'mod/glossary:comment', 1, 1365445925, 0),
(629, 1, 4, 'mod/glossary:comment', 1, 1365445925, 0),
(630, 1, 3, 'mod/glossary:comment', 1, 1365445925, 0),
(631, 1, 1, 'mod/glossary:comment', 1, 1365445925, 0),
(632, 1, 4, 'mod/glossary:managecomments', 1, 1365445925, 0),
(633, 1, 3, 'mod/glossary:managecomments', 1, 1365445925, 0),
(634, 1, 1, 'mod/glossary:managecomments', 1, 1365445925, 0),
(635, 1, 4, 'mod/glossary:import', 1, 1365445925, 0),
(636, 1, 3, 'mod/glossary:import', 1, 1365445925, 0),
(637, 1, 1, 'mod/glossary:import', 1, 1365445925, 0),
(638, 1, 4, 'mod/glossary:export', 1, 1365445925, 0),
(639, 1, 3, 'mod/glossary:export', 1, 1365445925, 0),
(640, 1, 1, 'mod/glossary:export', 1, 1365445925, 0),
(641, 1, 4, 'mod/glossary:approve', 1, 1365445925, 0),
(642, 1, 3, 'mod/glossary:approve', 1, 1365445925, 0),
(643, 1, 1, 'mod/glossary:approve', 1, 1365445925, 0),
(644, 1, 4, 'mod/glossary:rate', 1, 1365445925, 0),
(645, 1, 3, 'mod/glossary:rate', 1, 1365445925, 0),
(646, 1, 1, 'mod/glossary:rate', 1, 1365445925, 0),
(647, 1, 4, 'mod/glossary:viewrating', 1, 1365445925, 0),
(648, 1, 3, 'mod/glossary:viewrating', 1, 1365445925, 0),
(649, 1, 1, 'mod/glossary:viewrating', 1, 1365445925, 0),
(650, 1, 4, 'mod/glossary:viewanyrating', 1, 1365445925, 0),
(651, 1, 3, 'mod/glossary:viewanyrating', 1, 1365445925, 0),
(652, 1, 1, 'mod/glossary:viewanyrating', 1, 1365445925, 0),
(653, 1, 4, 'mod/glossary:viewallratings', 1, 1365445925, 0),
(654, 1, 3, 'mod/glossary:viewallratings', 1, 1365445925, 0),
(655, 1, 1, 'mod/glossary:viewallratings', 1, 1365445925, 0),
(656, 1, 4, 'mod/glossary:exportentry', 1, 1365445925, 0),
(657, 1, 3, 'mod/glossary:exportentry', 1, 1365445925, 0),
(658, 1, 1, 'mod/glossary:exportentry', 1, 1365445925, 0),
(659, 1, 4, 'mod/glossary:exportownentry', 1, 1365445925, 0),
(660, 1, 3, 'mod/glossary:exportownentry', 1, 1365445925, 0),
(661, 1, 1, 'mod/glossary:exportownentry', 1, 1365445925, 0),
(662, 1, 5, 'mod/glossary:exportownentry', 1, 1365445925, 0),
(663, 1, 6, 'mod/imscp:view', 1, 1365445926, 0),
(664, 1, 7, 'mod/imscp:view', 1, 1365445926, 0),
(665, 1, 3, 'mod/imscp:addinstance', 1, 1365445926, 0),
(666, 1, 1, 'mod/imscp:addinstance', 1, 1365445926, 0),
(667, 1, 3, 'mod/label:addinstance', 1, 1365445926, 0),
(668, 1, 1, 'mod/label:addinstance', 1, 1365445926, 0),
(669, 1, 3, 'mod/lesson:addinstance', 1, 1365445927, 0),
(670, 1, 1, 'mod/lesson:addinstance', 1, 1365445927, 0),
(671, 1, 3, 'mod/lesson:edit', 1, 1365445927, 0),
(672, 1, 1, 'mod/lesson:edit', 1, 1365445927, 0),
(673, 1, 4, 'mod/lesson:manage', 1, 1365445927, 0),
(674, 1, 3, 'mod/lesson:manage', 1, 1365445927, 0),
(675, 1, 1, 'mod/lesson:manage', 1, 1365445927, 0),
(676, 1, 6, 'mod/lti:view', 1, 1365445928, 0),
(677, 1, 5, 'mod/lti:view', 1, 1365445928, 0),
(678, 1, 4, 'mod/lti:view', 1, 1365445928, 0),
(679, 1, 3, 'mod/lti:view', 1, 1365445928, 0),
(680, 1, 1, 'mod/lti:view', 1, 1365445928, 0),
(681, 1, 3, 'mod/lti:addinstance', 1, 1365445928, 0),
(682, 1, 1, 'mod/lti:addinstance', 1, 1365445928, 0),
(683, 1, 4, 'mod/lti:grade', 1, 1365445928, 0),
(684, 1, 3, 'mod/lti:grade', 1, 1365445928, 0),
(685, 1, 1, 'mod/lti:grade', 1, 1365445928, 0),
(686, 1, 4, 'mod/lti:manage', 1, 1365445928, 0),
(687, 1, 3, 'mod/lti:manage', 1, 1365445928, 0),
(688, 1, 1, 'mod/lti:manage', 1, 1365445928, 0),
(689, 1, 4, 'mod/lti:addcoursetool', 1, 1365445928, 0),
(690, 1, 3, 'mod/lti:addcoursetool', 1, 1365445928, 0),
(691, 1, 1, 'mod/lti:addcoursetool', 1, 1365445928, 0),
(692, 1, 4, 'mod/lti:requesttooladd', 1, 1365445928, 0),
(693, 1, 3, 'mod/lti:requesttooladd', 1, 1365445928, 0),
(694, 1, 1, 'mod/lti:requesttooladd', 1, 1365445928, 0),
(695, 1, 6, 'mod/page:view', 1, 1365445928, 0),
(696, 1, 7, 'mod/page:view', 1, 1365445928, 0),
(697, 1, 3, 'mod/page:addinstance', 1, 1365445928, 0),
(698, 1, 1, 'mod/page:addinstance', 1, 1365445928, 0),
(699, 1, 6, 'mod/quiz:view', 1, 1365445929, 0),
(700, 1, 5, 'mod/quiz:view', 1, 1365445929, 0),
(701, 1, 4, 'mod/quiz:view', 1, 1365445929, 0),
(702, 1, 3, 'mod/quiz:view', 1, 1365445929, 0),
(703, 1, 1, 'mod/quiz:view', 1, 1365445929, 0),
(704, 1, 3, 'mod/quiz:addinstance', 1, 1365445929, 0),
(705, 1, 1, 'mod/quiz:addinstance', 1, 1365445929, 0),
(706, 1, 5, 'mod/quiz:attempt', 1, 1365445929, 0),
(707, 1, 5, 'mod/quiz:reviewmyattempts', 1, 1365445929, 0),
(708, 1, 3, 'mod/quiz:manage', 1, 1365445929, 0),
(709, 1, 1, 'mod/quiz:manage', 1, 1365445929, 0),
(710, 1, 3, 'mod/quiz:manageoverrides', 1, 1365445929, 0),
(711, 1, 1, 'mod/quiz:manageoverrides', 1, 1365445929, 0),
(712, 1, 4, 'mod/quiz:preview', 1, 1365445929, 0),
(713, 1, 3, 'mod/quiz:preview', 1, 1365445929, 0),
(714, 1, 1, 'mod/quiz:preview', 1, 1365445929, 0),
(715, 1, 4, 'mod/quiz:grade', 1, 1365445929, 0),
(716, 1, 3, 'mod/quiz:grade', 1, 1365445929, 0),
(717, 1, 1, 'mod/quiz:grade', 1, 1365445929, 0),
(718, 1, 4, 'mod/quiz:regrade', 1, 1365445929, 0),
(719, 1, 3, 'mod/quiz:regrade', 1, 1365445929, 0),
(720, 1, 1, 'mod/quiz:regrade', 1, 1365445929, 0),
(721, 1, 4, 'mod/quiz:viewreports', 1, 1365445929, 0),
(722, 1, 3, 'mod/quiz:viewreports', 1, 1365445929, 0),
(723, 1, 1, 'mod/quiz:viewreports', 1, 1365445929, 0),
(724, 1, 3, 'mod/quiz:deleteattempts', 1, 1365445929, 0),
(725, 1, 1, 'mod/quiz:deleteattempts', 1, 1365445929, 0),
(726, 1, 6, 'mod/resource:view', 1, 1365445930, 0),
(727, 1, 7, 'mod/resource:view', 1, 1365445930, 0),
(728, 1, 3, 'mod/resource:addinstance', 1, 1365445930, 0),
(729, 1, 1, 'mod/resource:addinstance', 1, 1365445930, 0),
(730, 1, 3, 'mod/scorm:addinstance', 1, 1365445931, 0),
(731, 1, 1, 'mod/scorm:addinstance', 1, 1365445931, 0),
(732, 1, 4, 'mod/scorm:viewreport', 1, 1365445931, 0),
(733, 1, 3, 'mod/scorm:viewreport', 1, 1365445931, 0),
(734, 1, 1, 'mod/scorm:viewreport', 1, 1365445931, 0),
(735, 1, 5, 'mod/scorm:skipview', 1, 1365445931, 0),
(736, 1, 5, 'mod/scorm:savetrack', 1, 1365445931, 0),
(737, 1, 4, 'mod/scorm:savetrack', 1, 1365445931, 0),
(738, 1, 3, 'mod/scorm:savetrack', 1, 1365445931, 0),
(739, 1, 1, 'mod/scorm:savetrack', 1, 1365445931, 0),
(740, 1, 5, 'mod/scorm:viewscores', 1, 1365445931, 0),
(741, 1, 4, 'mod/scorm:viewscores', 1, 1365445932, 0),
(742, 1, 3, 'mod/scorm:viewscores', 1, 1365445932, 0),
(743, 1, 1, 'mod/scorm:viewscores', 1, 1365445932, 0),
(744, 1, 4, 'mod/scorm:deleteresponses', 1, 1365445932, 0),
(745, 1, 3, 'mod/scorm:deleteresponses', 1, 1365445932, 0),
(746, 1, 1, 'mod/scorm:deleteresponses', 1, 1365445932, 0),
(747, 1, 3, 'mod/survey:addinstance', 1, 1365445932, 0),
(748, 1, 1, 'mod/survey:addinstance', 1, 1365445932, 0),
(749, 1, 5, 'mod/survey:participate', 1, 1365445932, 0),
(750, 1, 4, 'mod/survey:participate', 1, 1365445932, 0),
(751, 1, 3, 'mod/survey:participate', 1, 1365445932, 0),
(752, 1, 1, 'mod/survey:participate', 1, 1365445932, 0),
(753, 1, 4, 'mod/survey:readresponses', 1, 1365445932, 0),
(754, 1, 3, 'mod/survey:readresponses', 1, 1365445932, 0),
(755, 1, 1, 'mod/survey:readresponses', 1, 1365445932, 0),
(756, 1, 4, 'mod/survey:download', 1, 1365445932, 0),
(757, 1, 3, 'mod/survey:download', 1, 1365445933, 0),
(758, 1, 1, 'mod/survey:download', 1, 1365445933, 0),
(759, 1, 6, 'mod/url:view', 1, 1365445933, 0),
(760, 1, 7, 'mod/url:view', 1, 1365445933, 0),
(761, 1, 3, 'mod/url:addinstance', 1, 1365445933, 0),
(762, 1, 1, 'mod/url:addinstance', 1, 1365445933, 0),
(763, 1, 3, 'mod/wiki:addinstance', 1, 1365445934, 0),
(764, 1, 1, 'mod/wiki:addinstance', 1, 1365445934, 0),
(765, 1, 6, 'mod/wiki:viewpage', 1, 1365445934, 0),
(766, 1, 5, 'mod/wiki:viewpage', 1, 1365445934, 0),
(767, 1, 4, 'mod/wiki:viewpage', 1, 1365445934, 0),
(768, 1, 3, 'mod/wiki:viewpage', 1, 1365445934, 0),
(769, 1, 1, 'mod/wiki:viewpage', 1, 1365445934, 0),
(770, 1, 5, 'mod/wiki:editpage', 1, 1365445934, 0),
(771, 1, 4, 'mod/wiki:editpage', 1, 1365445934, 0),
(772, 1, 3, 'mod/wiki:editpage', 1, 1365445934, 0),
(773, 1, 1, 'mod/wiki:editpage', 1, 1365445934, 0),
(774, 1, 5, 'mod/wiki:createpage', 1, 1365445934, 0),
(775, 1, 4, 'mod/wiki:createpage', 1, 1365445934, 0),
(776, 1, 3, 'mod/wiki:createpage', 1, 1365445934, 0),
(777, 1, 1, 'mod/wiki:createpage', 1, 1365445934, 0),
(778, 1, 5, 'mod/wiki:viewcomment', 1, 1365445934, 0),
(779, 1, 4, 'mod/wiki:viewcomment', 1, 1365445934, 0),
(780, 1, 3, 'mod/wiki:viewcomment', 1, 1365445934, 0),
(781, 1, 1, 'mod/wiki:viewcomment', 1, 1365445934, 0),
(782, 1, 5, 'mod/wiki:editcomment', 1, 1365445934, 0),
(783, 1, 4, 'mod/wiki:editcomment', 1, 1365445934, 0),
(784, 1, 3, 'mod/wiki:editcomment', 1, 1365445934, 0),
(785, 1, 1, 'mod/wiki:editcomment', 1, 1365445934, 0),
(786, 1, 4, 'mod/wiki:managecomment', 1, 1365445934, 0),
(787, 1, 3, 'mod/wiki:managecomment', 1, 1365445934, 0),
(788, 1, 1, 'mod/wiki:managecomment', 1, 1365445934, 0),
(789, 1, 4, 'mod/wiki:managefiles', 1, 1365445934, 0),
(790, 1, 3, 'mod/wiki:managefiles', 1, 1365445934, 0),
(791, 1, 1, 'mod/wiki:managefiles', 1, 1365445934, 0),
(792, 1, 4, 'mod/wiki:overridelock', 1, 1365445934, 0),
(793, 1, 3, 'mod/wiki:overridelock', 1, 1365445934, 0),
(794, 1, 1, 'mod/wiki:overridelock', 1, 1365445934, 0),
(795, 1, 4, 'mod/wiki:managewiki', 1, 1365445934, 0),
(796, 1, 3, 'mod/wiki:managewiki', 1, 1365445934, 0),
(797, 1, 1, 'mod/wiki:managewiki', 1, 1365445934, 0),
(798, 1, 6, 'mod/workshop:view', 1, 1365445935, 0),
(799, 1, 5, 'mod/workshop:view', 1, 1365445935, 0),
(800, 1, 4, 'mod/workshop:view', 1, 1365445935, 0),
(801, 1, 3, 'mod/workshop:view', 1, 1365445935, 0),
(802, 1, 1, 'mod/workshop:view', 1, 1365445935, 0),
(803, 1, 3, 'mod/workshop:addinstance', 1, 1365445935, 0),
(804, 1, 1, 'mod/workshop:addinstance', 1, 1365445935, 0),
(805, 1, 4, 'mod/workshop:switchphase', 1, 1365445935, 0),
(806, 1, 3, 'mod/workshop:switchphase', 1, 1365445935, 0),
(807, 1, 1, 'mod/workshop:switchphase', 1, 1365445935, 0),
(808, 1, 3, 'mod/workshop:editdimensions', 1, 1365445935, 0),
(809, 1, 1, 'mod/workshop:editdimensions', 1, 1365445935, 0),
(810, 1, 5, 'mod/workshop:submit', 1, 1365445935, 0),
(811, 1, 5, 'mod/workshop:peerassess', 1, 1365445935, 0),
(812, 1, 4, 'mod/workshop:manageexamples', 1, 1365445935, 0),
(813, 1, 3, 'mod/workshop:manageexamples', 1, 1365445935, 0),
(814, 1, 1, 'mod/workshop:manageexamples', 1, 1365445935, 0),
(815, 1, 4, 'mod/workshop:allocate', 1, 1365445935, 0),
(816, 1, 3, 'mod/workshop:allocate', 1, 1365445935, 0),
(817, 1, 1, 'mod/workshop:allocate', 1, 1365445935, 0),
(818, 1, 4, 'mod/workshop:publishsubmissions', 1, 1365445935, 0),
(819, 1, 3, 'mod/workshop:publishsubmissions', 1, 1365445935, 0),
(820, 1, 1, 'mod/workshop:publishsubmissions', 1, 1365445935, 0),
(821, 1, 5, 'mod/workshop:viewauthornames', 1, 1365445935, 0),
(822, 1, 4, 'mod/workshop:viewauthornames', 1, 1365445935, 0),
(823, 1, 3, 'mod/workshop:viewauthornames', 1, 1365445935, 0),
(824, 1, 1, 'mod/workshop:viewauthornames', 1, 1365445935, 0),
(825, 1, 4, 'mod/workshop:viewreviewernames', 1, 1365445935, 0),
(826, 1, 3, 'mod/workshop:viewreviewernames', 1, 1365445935, 0),
(827, 1, 1, 'mod/workshop:viewreviewernames', 1, 1365445935, 0),
(828, 1, 4, 'mod/workshop:viewallsubmissions', 1, 1365445935, 0),
(829, 1, 3, 'mod/workshop:viewallsubmissions', 1, 1365445935, 0),
(830, 1, 1, 'mod/workshop:viewallsubmissions', 1, 1365445935, 0),
(831, 1, 5, 'mod/workshop:viewpublishedsubmissions', 1, 1365445935, 0),
(832, 1, 4, 'mod/workshop:viewpublishedsubmissions', 1, 1365445935, 0),
(833, 1, 3, 'mod/workshop:viewpublishedsubmissions', 1, 1365445935, 0),
(834, 1, 1, 'mod/workshop:viewpublishedsubmissions', 1, 1365445935, 0),
(835, 1, 5, 'mod/workshop:viewauthorpublished', 1, 1365445935, 0),
(836, 1, 4, 'mod/workshop:viewauthorpublished', 1, 1365445935, 0),
(837, 1, 3, 'mod/workshop:viewauthorpublished', 1, 1365445935, 0),
(838, 1, 1, 'mod/workshop:viewauthorpublished', 1, 1365445935, 0),
(839, 1, 4, 'mod/workshop:viewallassessments', 1, 1365445935, 0),
(840, 1, 3, 'mod/workshop:viewallassessments', 1, 1365445935, 0),
(841, 1, 1, 'mod/workshop:viewallassessments', 1, 1365445935, 0),
(842, 1, 4, 'mod/workshop:overridegrades', 1, 1365445935, 0),
(843, 1, 3, 'mod/workshop:overridegrades', 1, 1365445935, 0),
(844, 1, 1, 'mod/workshop:overridegrades', 1, 1365445935, 0),
(845, 1, 4, 'mod/workshop:ignoredeadlines', 1, 1365445935, 0),
(846, 1, 3, 'mod/workshop:ignoredeadlines', 1, 1365445935, 0),
(847, 1, 1, 'mod/workshop:ignoredeadlines', 1, 1365445935, 0),
(848, 1, 1, 'enrol/authorize:config', 1, 1365445939, 0),
(849, 1, 1, 'enrol/authorize:manage', 1, 1365445940, 0),
(850, 1, 3, 'enrol/authorize:manage', 1, 1365445940, 0),
(851, 1, 1, 'enrol/authorize:unenrol', 1, 1365445940, 0),
(852, 1, 1, 'enrol/authorize:managepayments', 1, 1365445940, 0),
(853, 1, 1, 'enrol/authorize:uploadcsv', 1, 1365445940, 0),
(854, 1, 3, 'enrol/cohort:config', 1, 1365445944, 0),
(855, 1, 1, 'enrol/cohort:config', 1, 1365445944, 0),
(856, 1, 1, 'enrol/cohort:unenrol', 1, 1365445944, 0),
(857, 1, 1, 'enrol/database:unenrol', 1, 1365445944, 0),
(858, 1, 1, 'enrol/guest:config', 1, 1365445945, 0),
(859, 1, 3, 'enrol/guest:config', 1, 1365445945, 0),
(860, 1, 1, 'enrol/ldap:manage', 1, 1365445947, 0),
(861, 1, 1, 'enrol/manual:config', 1, 1365445947, 0),
(862, 1, 1, 'enrol/manual:enrol', 1, 1365445947, 0),
(863, 1, 3, 'enrol/manual:enrol', 1, 1365445947, 0),
(864, 1, 1, 'enrol/manual:manage', 1, 1365445947, 0),
(865, 1, 3, 'enrol/manual:manage', 1, 1365445947, 0),
(866, 1, 1, 'enrol/manual:unenrol', 1, 1365445947, 0),
(867, 1, 3, 'enrol/manual:unenrol', 1, 1365445947, 0),
(868, 1, 1, 'enrol/meta:config', 1, 1365445948, 0),
(869, 1, 3, 'enrol/meta:config', 1, 1365445948, 0),
(870, 1, 1, 'enrol/meta:selectaslinked', 1, 1365445948, 0),
(871, 1, 1, 'enrol/meta:unenrol', 1, 1365445948, 0),
(872, 1, 1, 'enrol/paypal:config', 1, 1365445949, 0),
(873, 1, 1, 'enrol/paypal:manage', 1, 1365445949, 0),
(874, 1, 3, 'enrol/paypal:manage', 1, 1365445949, 0),
(875, 1, 1, 'enrol/paypal:unenrol', 1, 1365445949, 0),
(876, 1, 3, 'enrol/self:config', 1, 1365445949, 0),
(877, 1, 1, 'enrol/self:config', 1, 1365445949, 0),
(878, 1, 3, 'enrol/self:manage', 1, 1365445949, 0),
(879, 1, 1, 'enrol/self:manage', 1, 1365445949, 0),
(880, 1, 5, 'enrol/self:unenrolself', 1, 1365445949, 0),
(881, 1, 3, 'enrol/self:unenrol', 1, 1365445949, 0),
(882, 1, 1, 'enrol/self:unenrol', 1, 1365445949, 0),
(883, 1, 3, 'block/activity_modules:addinstance', 1, 1365445951, 0),
(884, 1, 1, 'block/activity_modules:addinstance', 1, 1365445951, 0),
(885, 1, 7, 'block/admin_bookmarks:myaddinstance', 1, 1365445951, 0),
(886, 1, 3, 'block/admin_bookmarks:addinstance', 1, 1365445951, 0),
(887, 1, 1, 'block/admin_bookmarks:addinstance', 1, 1365445951, 0),
(888, 1, 3, 'block/blog_menu:addinstance', 1, 1365445951, 0),
(889, 1, 1, 'block/blog_menu:addinstance', 1, 1365445951, 0),
(890, 1, 3, 'block/blog_recent:addinstance', 1, 1365445951, 0),
(891, 1, 1, 'block/blog_recent:addinstance', 1, 1365445951, 0),
(892, 1, 3, 'block/blog_tags:addinstance', 1, 1365445951, 0),
(893, 1, 1, 'block/blog_tags:addinstance', 1, 1365445951, 0),
(894, 1, 7, 'block/calendar_month:myaddinstance', 1, 1365445952, 0),
(895, 1, 3, 'block/calendar_month:addinstance', 1, 1365445952, 0),
(896, 1, 1, 'block/calendar_month:addinstance', 1, 1365445952, 0),
(897, 1, 7, 'block/calendar_upcoming:myaddinstance', 1, 1365445952, 0);
INSERT INTO `mdl_role_capabilities` (`id`, `contextid`, `roleid`, `capability`, `permission`, `timemodified`, `modifierid`) VALUES
(898, 1, 3, 'block/calendar_upcoming:addinstance', 1, 1365445952, 0),
(899, 1, 1, 'block/calendar_upcoming:addinstance', 1, 1365445952, 0),
(900, 1, 7, 'block/comments:myaddinstance', 1, 1365445952, 0),
(901, 1, 3, 'block/comments:addinstance', 1, 1365445952, 0),
(902, 1, 1, 'block/comments:addinstance', 1, 1365445952, 0),
(903, 1, 7, 'block/community:myaddinstance', 1, 1365445952, 0),
(904, 1, 3, 'block/community:addinstance', 1, 1365445952, 0),
(905, 1, 1, 'block/community:addinstance', 1, 1365445952, 0),
(906, 1, 3, 'block/completionstatus:addinstance', 1, 1365445952, 0),
(907, 1, 1, 'block/completionstatus:addinstance', 1, 1365445952, 0),
(908, 1, 7, 'block/course_list:myaddinstance', 1, 1365445953, 0),
(909, 1, 3, 'block/course_list:addinstance', 1, 1365445953, 0),
(910, 1, 1, 'block/course_list:addinstance', 1, 1365445953, 0),
(911, 1, 7, 'block/course_overview:myaddinstance', 1, 1365445953, 0),
(912, 1, 3, 'block/course_summary:addinstance', 1, 1365445953, 0),
(913, 1, 1, 'block/course_summary:addinstance', 1, 1365445953, 0),
(914, 1, 3, 'block/feedback:addinstance', 1, 1365445953, 0),
(915, 1, 1, 'block/feedback:addinstance', 1, 1365445953, 0),
(916, 1, 7, 'block/glossary_random:myaddinstance', 1, 1365445954, 0),
(917, 1, 3, 'block/glossary_random:addinstance', 1, 1365445954, 0),
(918, 1, 1, 'block/glossary_random:addinstance', 1, 1365445954, 0),
(919, 1, 7, 'block/html:myaddinstance', 1, 1365445954, 0),
(920, 1, 3, 'block/html:addinstance', 1, 1365445954, 0),
(921, 1, 1, 'block/html:addinstance', 1, 1365445954, 0),
(922, 1, 3, 'block/login:addinstance', 1, 1365445954, 0),
(923, 1, 1, 'block/login:addinstance', 1, 1365445954, 0),
(924, 1, 7, 'block/mentees:myaddinstance', 1, 1365445954, 0),
(925, 1, 3, 'block/mentees:addinstance', 1, 1365445954, 0),
(926, 1, 1, 'block/mentees:addinstance', 1, 1365445954, 0),
(927, 1, 7, 'block/messages:myaddinstance', 1, 1365445954, 0),
(928, 1, 3, 'block/messages:addinstance', 1, 1365445954, 0),
(929, 1, 1, 'block/messages:addinstance', 1, 1365445954, 0),
(930, 1, 7, 'block/mnet_hosts:myaddinstance', 1, 1365445954, 0),
(931, 1, 3, 'block/mnet_hosts:addinstance', 1, 1365445954, 0),
(932, 1, 1, 'block/mnet_hosts:addinstance', 1, 1365445954, 0),
(933, 1, 7, 'block/myprofile:myaddinstance', 1, 1365445954, 0),
(934, 1, 3, 'block/myprofile:addinstance', 1, 1365445954, 0),
(935, 1, 1, 'block/myprofile:addinstance', 1, 1365445954, 0),
(936, 1, 7, 'block/navigation:myaddinstance', 1, 1365445954, 0),
(937, 1, 3, 'block/navigation:addinstance', 1, 1365445954, 0),
(938, 1, 1, 'block/navigation:addinstance', 1, 1365445954, 0),
(939, 1, 7, 'block/news_items:myaddinstance', 1, 1365445955, 0),
(940, 1, 3, 'block/news_items:addinstance', 1, 1365445955, 0),
(941, 1, 1, 'block/news_items:addinstance', 1, 1365445955, 0),
(942, 1, 7, 'block/online_users:myaddinstance', 1, 1365445955, 0),
(943, 1, 3, 'block/online_users:addinstance', 1, 1365445955, 0),
(944, 1, 1, 'block/online_users:addinstance', 1, 1365445955, 0),
(945, 1, 7, 'block/online_users:viewlist', 1, 1365445955, 0),
(946, 1, 6, 'block/online_users:viewlist', 1, 1365445955, 0),
(947, 1, 5, 'block/online_users:viewlist', 1, 1365445955, 0),
(948, 1, 4, 'block/online_users:viewlist', 1, 1365445955, 0),
(949, 1, 3, 'block/online_users:viewlist', 1, 1365445955, 0),
(950, 1, 1, 'block/online_users:viewlist', 1, 1365445955, 0),
(951, 1, 3, 'block/participants:addinstance', 1, 1365445955, 0),
(952, 1, 1, 'block/participants:addinstance', 1, 1365445955, 0),
(953, 1, 7, 'block/private_files:myaddinstance', 1, 1365445955, 0),
(954, 1, 3, 'block/private_files:addinstance', 1, 1365445955, 0),
(955, 1, 1, 'block/private_files:addinstance', 1, 1365445955, 0),
(956, 1, 3, 'block/quiz_results:addinstance', 1, 1365445955, 0),
(957, 1, 1, 'block/quiz_results:addinstance', 1, 1365445955, 0),
(958, 1, 3, 'block/recent_activity:addinstance', 1, 1365445955, 0),
(959, 1, 1, 'block/recent_activity:addinstance', 1, 1365445955, 0),
(960, 1, 7, 'block/rss_client:myaddinstance', 1, 1365445956, 0),
(961, 1, 3, 'block/rss_client:addinstance', 1, 1365445956, 0),
(962, 1, 1, 'block/rss_client:addinstance', 1, 1365445956, 0),
(963, 1, 4, 'block/rss_client:manageownfeeds', 1, 1365445956, 0),
(964, 1, 3, 'block/rss_client:manageownfeeds', 1, 1365445956, 0),
(965, 1, 1, 'block/rss_client:manageownfeeds', 1, 1365445956, 0),
(966, 1, 1, 'block/rss_client:manageanyfeeds', 1, 1365445956, 0),
(967, 1, 3, 'block/search_forums:addinstance', 1, 1365445956, 0),
(968, 1, 1, 'block/search_forums:addinstance', 1, 1365445956, 0),
(969, 1, 3, 'block/section_links:addinstance', 1, 1365445956, 0),
(970, 1, 1, 'block/section_links:addinstance', 1, 1365445956, 0),
(971, 1, 3, 'block/selfcompletion:addinstance', 1, 1365445956, 0),
(972, 1, 1, 'block/selfcompletion:addinstance', 1, 1365445956, 0),
(973, 1, 7, 'block/settings:myaddinstance', 1, 1365445956, 0),
(974, 1, 3, 'block/settings:addinstance', 1, 1365445956, 0),
(975, 1, 1, 'block/settings:addinstance', 1, 1365445956, 0),
(976, 1, 3, 'block/site_main_menu:addinstance', 1, 1365445956, 0),
(977, 1, 1, 'block/site_main_menu:addinstance', 1, 1365445956, 0),
(978, 1, 3, 'block/social_activities:addinstance', 1, 1365445957, 0),
(979, 1, 1, 'block/social_activities:addinstance', 1, 1365445957, 0),
(980, 1, 3, 'block/tag_flickr:addinstance', 1, 1365445957, 0),
(981, 1, 1, 'block/tag_flickr:addinstance', 1, 1365445957, 0),
(982, 1, 3, 'block/tag_youtube:addinstance', 1, 1365445957, 0),
(983, 1, 1, 'block/tag_youtube:addinstance', 1, 1365445957, 0),
(984, 1, 7, 'block/tags:myaddinstance', 1, 1365445957, 0),
(985, 1, 3, 'block/tags:addinstance', 1, 1365445957, 0),
(986, 1, 1, 'block/tags:addinstance', 1, 1365445957, 0),
(987, 1, 4, 'report/completion:view', 1, 1365445962, 0),
(988, 1, 3, 'report/completion:view', 1, 1365445962, 0),
(989, 1, 1, 'report/completion:view', 1, 1365445962, 0),
(990, 1, 4, 'report/courseoverview:view', 1, 1365445962, 0),
(991, 1, 3, 'report/courseoverview:view', 1, 1365445962, 0),
(992, 1, 1, 'report/courseoverview:view', 1, 1365445962, 0),
(993, 1, 4, 'report/log:view', 1, 1365445962, 0),
(994, 1, 3, 'report/log:view', 1, 1365445962, 0),
(995, 1, 1, 'report/log:view', 1, 1365445962, 0),
(996, 1, 4, 'report/log:viewtoday', 1, 1365445962, 0),
(997, 1, 3, 'report/log:viewtoday', 1, 1365445962, 0),
(998, 1, 1, 'report/log:viewtoday', 1, 1365445962, 0),
(999, 1, 4, 'report/loglive:view', 1, 1365445962, 0),
(1000, 1, 3, 'report/loglive:view', 1, 1365445962, 0),
(1001, 1, 1, 'report/loglive:view', 1, 1365445962, 0),
(1002, 1, 4, 'report/outline:view', 1, 1365445963, 0),
(1003, 1, 3, 'report/outline:view', 1, 1365445963, 0),
(1004, 1, 1, 'report/outline:view', 1, 1365445963, 0),
(1005, 1, 4, 'report/participation:view', 1, 1365445963, 0),
(1006, 1, 3, 'report/participation:view', 1, 1365445963, 0),
(1007, 1, 1, 'report/participation:view', 1, 1365445963, 0),
(1008, 1, 4, 'report/progress:view', 1, 1365445963, 0),
(1009, 1, 3, 'report/progress:view', 1, 1365445963, 0),
(1010, 1, 1, 'report/progress:view', 1, 1365445963, 0),
(1011, 1, 1, 'report/security:view', 1, 1365445963, 0),
(1012, 1, 4, 'report/stats:view', 1, 1365445963, 0),
(1013, 1, 3, 'report/stats:view', 1, 1365445963, 0),
(1014, 1, 1, 'report/stats:view', 1, 1365445963, 0),
(1015, 1, 4, 'gradeexport/ods:view', 1, 1365445963, 0),
(1016, 1, 3, 'gradeexport/ods:view', 1, 1365445963, 0),
(1017, 1, 1, 'gradeexport/ods:view', 1, 1365445963, 0),
(1018, 1, 1, 'gradeexport/ods:publish', 1, 1365445963, 0),
(1019, 1, 4, 'gradeexport/txt:view', 1, 1365445964, 0),
(1020, 1, 3, 'gradeexport/txt:view', 1, 1365445964, 0),
(1021, 1, 1, 'gradeexport/txt:view', 1, 1365445964, 0),
(1022, 1, 1, 'gradeexport/txt:publish', 1, 1365445964, 0),
(1023, 1, 4, 'gradeexport/xls:view', 1, 1365445964, 0),
(1024, 1, 3, 'gradeexport/xls:view', 1, 1365445964, 0),
(1025, 1, 1, 'gradeexport/xls:view', 1, 1365445964, 0),
(1026, 1, 1, 'gradeexport/xls:publish', 1, 1365445964, 0),
(1027, 1, 4, 'gradeexport/xml:view', 1, 1365445964, 0),
(1028, 1, 3, 'gradeexport/xml:view', 1, 1365445964, 0),
(1029, 1, 1, 'gradeexport/xml:view', 1, 1365445964, 0),
(1030, 1, 1, 'gradeexport/xml:publish', 1, 1365445964, 0),
(1031, 1, 3, 'gradeimport/csv:view', 1, 1365445964, 0),
(1032, 1, 1, 'gradeimport/csv:view', 1, 1365445964, 0),
(1033, 1, 3, 'gradeimport/xml:view', 1, 1365445964, 0),
(1034, 1, 1, 'gradeimport/xml:view', 1, 1365445964, 0),
(1035, 1, 1, 'gradeimport/xml:publish', 1, 1365445964, 0),
(1036, 1, 4, 'gradereport/grader:view', 1, 1365445964, 0),
(1037, 1, 3, 'gradereport/grader:view', 1, 1365445964, 0),
(1038, 1, 1, 'gradereport/grader:view', 1, 1365445964, 0),
(1039, 1, 4, 'gradereport/outcomes:view', 1, 1365445965, 0),
(1040, 1, 3, 'gradereport/outcomes:view', 1, 1365445965, 0),
(1041, 1, 1, 'gradereport/outcomes:view', 1, 1365445965, 0),
(1042, 1, 5, 'gradereport/overview:view', 1, 1365445965, 0),
(1043, 1, 1, 'gradereport/overview:view', 1, 1365445965, 0),
(1044, 1, 5, 'gradereport/user:view', 1, 1365445965, 0),
(1045, 1, 4, 'gradereport/user:view', 1, 1365445965, 0),
(1046, 1, 3, 'gradereport/user:view', 1, 1365445965, 0),
(1047, 1, 1, 'gradereport/user:view', 1, 1365445965, 0),
(1048, 1, 7, 'repository/alfresco:view', 1, 1365445972, 0),
(1049, 1, 7, 'repository/boxnet:view', 1, 1365445972, 0),
(1050, 1, 2, 'repository/coursefiles:view', 1, 1365445972, 0),
(1051, 1, 4, 'repository/coursefiles:view', 1, 1365445972, 0),
(1052, 1, 3, 'repository/coursefiles:view', 1, 1365445972, 0),
(1053, 1, 1, 'repository/coursefiles:view', 1, 1365445972, 0),
(1054, 1, 7, 'repository/dropbox:view', 1, 1365445972, 0),
(1055, 1, 7, 'repository/equella:view', 1, 1365445973, 0),
(1056, 1, 2, 'repository/filesystem:view', 1, 1365445973, 0),
(1057, 1, 4, 'repository/filesystem:view', 1, 1365445973, 0),
(1058, 1, 3, 'repository/filesystem:view', 1, 1365445973, 0),
(1059, 1, 1, 'repository/filesystem:view', 1, 1365445973, 0),
(1060, 1, 7, 'repository/flickr:view', 1, 1365445973, 0),
(1061, 1, 7, 'repository/flickr_public:view', 1, 1365445974, 0),
(1062, 1, 7, 'repository/googledocs:view', 1, 1365445974, 0),
(1063, 1, 2, 'repository/local:view', 1, 1365445975, 0),
(1064, 1, 4, 'repository/local:view', 1, 1365445975, 0),
(1065, 1, 3, 'repository/local:view', 1, 1365445975, 0),
(1066, 1, 1, 'repository/local:view', 1, 1365445975, 0),
(1067, 1, 7, 'repository/merlot:view', 1, 1365445975, 0),
(1068, 1, 7, 'repository/picasa:view', 1, 1365445975, 0),
(1069, 1, 7, 'repository/recent:view', 1, 1365445976, 0),
(1070, 1, 7, 'repository/s3:view', 1, 1365445977, 0),
(1071, 1, 7, 'repository/upload:view', 1, 1365445977, 0),
(1072, 1, 7, 'repository/url:view', 1, 1365445977, 0),
(1073, 1, 7, 'repository/user:view', 1, 1365445977, 0),
(1074, 1, 2, 'repository/webdav:view', 1, 1365445977, 0),
(1075, 1, 4, 'repository/webdav:view', 1, 1365445977, 0),
(1076, 1, 3, 'repository/webdav:view', 1, 1365445977, 0),
(1077, 1, 1, 'repository/webdav:view', 1, 1365445977, 0),
(1078, 1, 7, 'repository/wikimedia:view', 1, 1365445978, 0),
(1079, 1, 7, 'repository/youtube:view', 1, 1365445978, 0),
(1080, 1, 1, 'tool/customlang:view', 1, 1365446001, 0),
(1081, 1, 1, 'tool/customlang:edit', 1, 1365446001, 0),
(1082, 1, 3, 'booktool/importhtml:import', 1, 1365446010, 0),
(1083, 1, 1, 'booktool/importhtml:import', 1, 1365446010, 0),
(1084, 1, 6, 'booktool/print:print', 1, 1365446010, 0),
(1085, 1, 8, 'booktool/print:print', 1, 1365446011, 0),
(1086, 1, 5, 'booktool/print:print', 1, 1365446011, 0),
(1087, 1, 4, 'booktool/print:print', 1, 1365446011, 0),
(1088, 1, 3, 'booktool/print:print', 1, 1365446011, 0),
(1089, 1, 1, 'booktool/print:print', 1, 1365446011, 0),
(1090, 1, 4, 'quiz/grading:viewstudentnames', 1, 1365446012, 0),
(1091, 1, 3, 'quiz/grading:viewstudentnames', 1, 1365446012, 0),
(1092, 1, 1, 'quiz/grading:viewstudentnames', 1, 1365446012, 0),
(1093, 1, 4, 'quiz/grading:viewidnumber', 1, 1365446012, 0),
(1094, 1, 3, 'quiz/grading:viewidnumber', 1, 1365446012, 0),
(1095, 1, 1, 'quiz/grading:viewidnumber', 1, 1365446012, 0),
(1096, 1, 4, 'quiz/statistics:view', 1, 1365446013, 0),
(1097, 1, 3, 'quiz/statistics:view', 1, 1365446013, 0),
(1098, 1, 1, 'quiz/statistics:view', 1, 1365446013, 0),
(1099, 1, 5, 'mod/attforblock:view', 1, 1365530674, 2),
(1100, 1, 4, 'mod/attforblock:view', 1, 1365530674, 2),
(1101, 1, 3, 'mod/attforblock:view', 1, 1365530674, 2),
(1102, 1, 1, 'mod/attforblock:view', 1, 1365530674, 2),
(1103, 1, 3, 'mod/attforblock:addinstance', 1, 1365530674, 2),
(1104, 1, 1, 'mod/attforblock:addinstance', 1, 1365530674, 2),
(1105, 1, 4, 'mod/attforblock:viewreports', 1, 1365530674, 2),
(1106, 1, 3, 'mod/attforblock:viewreports', 1, 1365530674, 2),
(1107, 1, 1, 'mod/attforblock:viewreports', 1, 1365530674, 2),
(1108, 1, 4, 'mod/attforblock:takeattendances', 1, 1365530674, 2),
(1109, 1, 3, 'mod/attforblock:takeattendances', 1, 1365530674, 2),
(1110, 1, 1, 'mod/attforblock:takeattendances', 1, 1365530674, 2),
(1111, 1, 4, 'mod/attforblock:changeattendances', 1, 1365530675, 2),
(1112, 1, 3, 'mod/attforblock:changeattendances', 1, 1365530675, 2),
(1113, 1, 1, 'mod/attforblock:changeattendances', 1, 1365530675, 2),
(1114, 1, 3, 'mod/attforblock:manageattendances', 1, 1365530675, 2),
(1115, 1, 1, 'mod/attforblock:manageattendances', 1, 1365530675, 2),
(1116, 1, 3, 'mod/attforblock:changepreferences', 1, 1365530675, 2),
(1117, 1, 1, 'mod/attforblock:changepreferences', 1, 1365530675, 2),
(1118, 1, 3, 'mod/attforblock:export', 1, 1365530675, 2),
(1119, 1, 1, 'mod/attforblock:export', 1, 1365530675, 2),
(1120, 1, 5, 'mod/attforblock:canbelisted', 1, 1365530675, 2);

-- --------------------------------------------------------

--
-- Table structure for table `mdl_role_context_levels`
--

CREATE TABLE IF NOT EXISTS `mdl_role_context_levels` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `roleid` bigint(10) NOT NULL,
  `contextlevel` bigint(10) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_rolecontleve_conrol_uix` (`contextlevel`,`roleid`),
  KEY `mdl_rolecontleve_rol_ix` (`roleid`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Lists which roles can be assigned at which context levels. T' AUTO_INCREMENT=12 ;

--
-- Dumping data for table `mdl_role_context_levels`
--

INSERT INTO `mdl_role_context_levels` (`id`, `roleid`, `contextlevel`) VALUES
(1, 1, 10),
(4, 2, 10),
(2, 1, 40),
(5, 2, 40),
(3, 1, 50),
(6, 3, 50),
(8, 4, 50),
(10, 5, 50),
(7, 3, 70),
(9, 4, 70),
(11, 5, 70);

-- --------------------------------------------------------

--
-- Table structure for table `mdl_role_names`
--

CREATE TABLE IF NOT EXISTS `mdl_role_names` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `roleid` bigint(10) NOT NULL DEFAULT '0',
  `contextid` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_rolename_rolcon_uix` (`roleid`,`contextid`),
  KEY `mdl_rolename_rol_ix` (`roleid`),
  KEY `mdl_rolename_con_ix` (`contextid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='role names in native strings' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_role_sortorder`
--

CREATE TABLE IF NOT EXISTS `mdl_role_sortorder` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `userid` bigint(10) NOT NULL,
  `roleid` bigint(10) NOT NULL,
  `contextid` bigint(10) NOT NULL,
  `sortoder` bigint(10) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_rolesort_userolcon_uix` (`userid`,`roleid`,`contextid`),
  KEY `mdl_rolesort_use_ix` (`userid`),
  KEY `mdl_rolesort_rol_ix` (`roleid`),
  KEY `mdl_rolesort_con_ix` (`contextid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='sort order of course managers in a course' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_scale`
--

CREATE TABLE IF NOT EXISTS `mdl_scale` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `courseid` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `scale` longtext NOT NULL,
  `description` longtext NOT NULL,
  `descriptionformat` tinyint(2) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_scal_cou_ix` (`courseid`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Defines grading scales' AUTO_INCREMENT=2 ;

--
-- Dumping data for table `mdl_scale`
--

INSERT INTO `mdl_scale` (`id`, `courseid`, `userid`, `name`, `scale`, `description`, `descriptionformat`, `timemodified`) VALUES
(1, 0, 0, 'Separate and Connected ways of knowing', 'Mostly separate knowing,Separate and connected,Mostly connected knowing', 'The scale based on the theory of separate and connected knowing. This theory describes two different ways that we can evaluate and learn about the things we see and hear.<ul><li><strong>Separate knowers</strong> remain as objective as possible without including feelings and emotions. In a discussion with other people, they like to defend their own ideas, using logic to find holes in opponent''s ideas.</li><li><strong>Connected knowers</strong> are more sensitive to other people. They are skilled at empathy and tends to listen and ask questions until they feel they can connect and "understand things from their point of view". They learn by trying to share the experiences that led to the knowledge they find in other people.</li></ul>', 0, 1365531648);

-- --------------------------------------------------------

--
-- Table structure for table `mdl_scale_history`
--

CREATE TABLE IF NOT EXISTS `mdl_scale_history` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `action` bigint(10) NOT NULL DEFAULT '0',
  `oldid` bigint(10) NOT NULL,
  `source` varchar(255) DEFAULT NULL,
  `timemodified` bigint(10) DEFAULT NULL,
  `loggeduser` bigint(10) DEFAULT NULL,
  `courseid` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `scale` longtext NOT NULL,
  `description` longtext NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_scalhist_act_ix` (`action`),
  KEY `mdl_scalhist_old_ix` (`oldid`),
  KEY `mdl_scalhist_cou_ix` (`courseid`),
  KEY `mdl_scalhist_log_ix` (`loggeduser`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='History table' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_scorm`
--

CREATE TABLE IF NOT EXISTS `mdl_scorm` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `course` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `scormtype` varchar(50) NOT NULL DEFAULT 'local',
  `reference` varchar(255) NOT NULL DEFAULT '',
  `intro` longtext NOT NULL,
  `introformat` smallint(4) NOT NULL DEFAULT '0',
  `version` varchar(9) NOT NULL DEFAULT '',
  `maxgrade` double NOT NULL DEFAULT '0',
  `grademethod` tinyint(2) NOT NULL DEFAULT '0',
  `whatgrade` bigint(10) NOT NULL DEFAULT '0',
  `maxattempt` bigint(10) NOT NULL DEFAULT '1',
  `forcecompleted` tinyint(1) NOT NULL DEFAULT '1',
  `forcenewattempt` tinyint(1) NOT NULL DEFAULT '0',
  `lastattemptlock` tinyint(1) NOT NULL DEFAULT '0',
  `displayattemptstatus` tinyint(1) NOT NULL DEFAULT '1',
  `displaycoursestructure` tinyint(1) NOT NULL DEFAULT '1',
  `updatefreq` tinyint(1) NOT NULL DEFAULT '0',
  `sha1hash` varchar(40) DEFAULT NULL,
  `md5hash` varchar(32) NOT NULL DEFAULT '',
  `revision` bigint(10) NOT NULL DEFAULT '0',
  `launch` bigint(10) NOT NULL DEFAULT '0',
  `skipview` tinyint(1) NOT NULL DEFAULT '1',
  `hidebrowse` tinyint(1) NOT NULL DEFAULT '0',
  `hidetoc` tinyint(1) NOT NULL DEFAULT '0',
  `hidenav` tinyint(1) NOT NULL DEFAULT '0',
  `auto` tinyint(1) NOT NULL DEFAULT '0',
  `popup` tinyint(1) NOT NULL DEFAULT '0',
  `options` varchar(255) NOT NULL DEFAULT '',
  `width` bigint(10) NOT NULL DEFAULT '100',
  `height` bigint(10) NOT NULL DEFAULT '600',
  `timeopen` bigint(10) NOT NULL DEFAULT '0',
  `timeclose` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `completionstatusrequired` tinyint(1) DEFAULT NULL,
  `completionscorerequired` tinyint(2) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_scor_cou_ix` (`course`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='each table is one SCORM module and its configuration' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_scorm_aicc_session`
--

CREATE TABLE IF NOT EXISTS `mdl_scorm_aicc_session` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `scormid` bigint(10) NOT NULL DEFAULT '0',
  `hacpsession` varchar(255) NOT NULL DEFAULT '',
  `scoid` bigint(10) DEFAULT '0',
  `scormmode` varchar(50) DEFAULT NULL,
  `scormstatus` varchar(255) DEFAULT NULL,
  `attempt` bigint(10) DEFAULT NULL,
  `lessonstatus` varchar(255) DEFAULT NULL,
  `sessiontime` varchar(255) DEFAULT NULL,
  `timecreated` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_scoraiccsess_sco_ix` (`scormid`),
  KEY `mdl_scoraiccsess_use_ix` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Used by AICC HACP to store session information' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_scorm_scoes`
--

CREATE TABLE IF NOT EXISTS `mdl_scorm_scoes` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `scorm` bigint(10) NOT NULL DEFAULT '0',
  `manifest` varchar(255) NOT NULL DEFAULT '',
  `organization` varchar(255) NOT NULL DEFAULT '',
  `parent` varchar(255) NOT NULL DEFAULT '',
  `identifier` varchar(255) NOT NULL DEFAULT '',
  `launch` longtext NOT NULL,
  `scormtype` varchar(5) NOT NULL DEFAULT '',
  `title` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `mdl_scorscoe_sco_ix` (`scorm`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='each SCO part of the SCORM module' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_scorm_scoes_data`
--

CREATE TABLE IF NOT EXISTS `mdl_scorm_scoes_data` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `scoid` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `value` longtext NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_scorscoedata_sco_ix` (`scoid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Contains variable data get from packages' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_scorm_scoes_track`
--

CREATE TABLE IF NOT EXISTS `mdl_scorm_scoes_track` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `scormid` bigint(10) NOT NULL DEFAULT '0',
  `scoid` bigint(10) NOT NULL DEFAULT '0',
  `attempt` bigint(10) NOT NULL DEFAULT '1',
  `element` varchar(255) NOT NULL DEFAULT '',
  `value` longtext NOT NULL,
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_scorscoetrac_usescosco_uix` (`userid`,`scormid`,`scoid`,`attempt`,`element`),
  KEY `mdl_scorscoetrac_use_ix` (`userid`),
  KEY `mdl_scorscoetrac_ele_ix` (`element`),
  KEY `mdl_scorscoetrac_sco_ix` (`scormid`),
  KEY `mdl_scorscoetrac_sco2_ix` (`scoid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='to track SCOes' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_scorm_seq_mapinfo`
--

CREATE TABLE IF NOT EXISTS `mdl_scorm_seq_mapinfo` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `scoid` bigint(10) NOT NULL DEFAULT '0',
  `objectiveid` bigint(10) NOT NULL DEFAULT '0',
  `targetobjectiveid` bigint(10) NOT NULL DEFAULT '0',
  `readsatisfiedstatus` tinyint(1) NOT NULL DEFAULT '1',
  `readnormalizedmeasure` tinyint(1) NOT NULL DEFAULT '1',
  `writesatisfiedstatus` tinyint(1) NOT NULL DEFAULT '0',
  `writenormalizedmeasure` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_scorseqmapi_scoidobj_uix` (`scoid`,`id`,`objectiveid`),
  KEY `mdl_scorseqmapi_sco_ix` (`scoid`),
  KEY `mdl_scorseqmapi_obj_ix` (`objectiveid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='SCORM2004 objective mapinfo description' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_scorm_seq_objective`
--

CREATE TABLE IF NOT EXISTS `mdl_scorm_seq_objective` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `scoid` bigint(10) NOT NULL DEFAULT '0',
  `primaryobj` tinyint(1) NOT NULL DEFAULT '0',
  `objectiveid` varchar(255) NOT NULL DEFAULT '',
  `satisfiedbymeasure` tinyint(1) NOT NULL DEFAULT '1',
  `minnormalizedmeasure` float(11,4) NOT NULL DEFAULT '0.0000',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_scorseqobje_scoid_uix` (`scoid`,`id`),
  KEY `mdl_scorseqobje_sco_ix` (`scoid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='SCORM2004 objective description' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_scorm_seq_rolluprule`
--

CREATE TABLE IF NOT EXISTS `mdl_scorm_seq_rolluprule` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `scoid` bigint(10) NOT NULL DEFAULT '0',
  `childactivityset` varchar(15) NOT NULL DEFAULT '',
  `minimumcount` bigint(10) NOT NULL DEFAULT '0',
  `minimumpercent` float(11,4) NOT NULL DEFAULT '0.0000',
  `conditioncombination` varchar(3) NOT NULL DEFAULT 'all',
  `action` varchar(15) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_scorseqroll_scoid_uix` (`scoid`,`id`),
  KEY `mdl_scorseqroll_sco_ix` (`scoid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='SCORM2004 sequencing rule' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_scorm_seq_rolluprulecond`
--

CREATE TABLE IF NOT EXISTS `mdl_scorm_seq_rolluprulecond` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `scoid` bigint(10) NOT NULL DEFAULT '0',
  `rollupruleid` bigint(10) NOT NULL DEFAULT '0',
  `operator` varchar(5) NOT NULL DEFAULT 'noOp',
  `cond` varchar(25) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_scorseqroll_scorolid_uix` (`scoid`,`rollupruleid`,`id`),
  KEY `mdl_scorseqroll_sco2_ix` (`scoid`),
  KEY `mdl_scorseqroll_rol_ix` (`rollupruleid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='SCORM2004 sequencing rule' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_scorm_seq_rulecond`
--

CREATE TABLE IF NOT EXISTS `mdl_scorm_seq_rulecond` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `scoid` bigint(10) NOT NULL DEFAULT '0',
  `ruleconditionsid` bigint(10) NOT NULL DEFAULT '0',
  `refrencedobjective` varchar(255) NOT NULL DEFAULT '',
  `measurethreshold` float(11,4) NOT NULL DEFAULT '0.0000',
  `operator` varchar(5) NOT NULL DEFAULT 'noOp',
  `cond` varchar(30) NOT NULL DEFAULT 'always',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_scorseqrule_idscorul_uix` (`id`,`scoid`,`ruleconditionsid`),
  KEY `mdl_scorseqrule_sco2_ix` (`scoid`),
  KEY `mdl_scorseqrule_rul_ix` (`ruleconditionsid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='SCORM2004 rule condition' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_scorm_seq_ruleconds`
--

CREATE TABLE IF NOT EXISTS `mdl_scorm_seq_ruleconds` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `scoid` bigint(10) NOT NULL DEFAULT '0',
  `conditioncombination` varchar(3) NOT NULL DEFAULT 'all',
  `ruletype` tinyint(2) NOT NULL DEFAULT '0',
  `action` varchar(25) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_scorseqrule_scoid_uix` (`scoid`,`id`),
  KEY `mdl_scorseqrule_sco_ix` (`scoid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='SCORM2004 rule conditions' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_sessions`
--

CREATE TABLE IF NOT EXISTS `mdl_sessions` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `state` bigint(10) NOT NULL DEFAULT '0',
  `sid` varchar(128) NOT NULL DEFAULT '',
  `userid` bigint(10) NOT NULL,
  `sessdata` longtext,
  `timecreated` bigint(10) NOT NULL,
  `timemodified` bigint(10) NOT NULL,
  `firstip` varchar(45) DEFAULT NULL,
  `lastip` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_sess_sid_uix` (`sid`),
  KEY `mdl_sess_sta_ix` (`state`),
  KEY `mdl_sess_tim_ix` (`timecreated`),
  KEY `mdl_sess_tim2_ix` (`timemodified`),
  KEY `mdl_sess_use_ix` (`userid`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Database based session storage - now recommended' AUTO_INCREMENT=12 ;

--
-- Dumping data for table `mdl_sessions`
--

INSERT INTO `mdl_sessions` (`id`, `state`, `sid`, `userid`, `sessdata`, `timecreated`, `timemodified`, `firstip`, `lastip`) VALUES
(4, 0, 'a85mmah250ftnncqfd0qinslo7', 2, 'U0VTU0lPTnxPOjg6InN0ZENsYXNzIjo2OntzOjIxOiJjYWxlbmRhcnNob3dldmVudHR5cGUiO2k6MTU7czoxMDoibG9naW5jb3VudCI7aTowO3M6MjI6ImFkbWluX2NyaXRpY2FsX3dhcm5pbmciO2I6MDtzOjIxOiJsb2FkX25hdmlnYXRpb25fYWRtaW4iO2I6MTtzOjE0OiJ1c2VyX2ZpbHRlcmluZyI7YTowOnt9czo4OiJuYXZjYWNoZSI7Tzo4OiJzdGRDbGFzcyI6MTp7czoxMDoibmF2aWdhdGlvbiI7YTozOntzOjE2OiJ1c2VyYmxvZ29wdGlvbnMyIjthOjM6e2k6MDtpOjEzNjU1MzE1NTM7aToxO3M6MToiMiI7aToyO3M6NzAzOiJhOjI6e3M6NDoidmlldyI7YToyOntzOjY6InN0cmluZyI7czoyMjoiVmlldyBhbGwgb2YgbXkgZW50cmllcyI7czo0OiJsaW5rIjtPOjEwOiJtb29kbGVfdXJsIjo5OntzOjk6IgAqAHNjaGVtZSI7czo0OiJodHRwIjtzOjc6IgAqAGhvc3QiO3M6OToibG9jYWxob3N0IjtzOjc6IgAqAHBvcnQiO3M6MDoiIjtzOjc6IgAqAHVzZXIiO3M6MDoiIjtzOjc6IgAqAHBhc3MiO3M6MDoiIjtzOjc6IgAqAHBhdGgiO3M6MjU6Ii9tb29kbGUyNDMvYmxvZy9pbmRleC5waHAiO3M6MTY6IgAqAHNsYXNoYXJndW1lbnQiO3M6MDoiIjtzOjk6IgAqAGFuY2hvciI7TjtzOjk6IgAqAHBhcmFtcyI7YToxOntzOjY6InVzZXJpZCI7czoxOiIyIjt9fX1zOjM6ImFkZCI7YToyOntzOjY6InN0cmluZyI7czoxNToiQWRkIGEgbmV3IGVudHJ5IjtzOjQ6ImxpbmsiO086MTA6Im1vb2RsZV91cmwiOjk6e3M6OToiACoAc2NoZW1lIjtzOjQ6Imh0dHAiO3M6NzoiACoAaG9zdCI7czo5OiJsb2NhbGhvc3QiO3M6NzoiACoAcG9ydCI7czowOiIiO3M6NzoiACoAdXNlciI7czowOiIiO3M6NzoiACoAcGFzcyI7czowOiIiO3M6NzoiACoAcGF0aCI7czoyNDoiL21vb2RsZTI0My9ibG9nL2VkaXQucGhwIjtzOjE2OiIAKgBzbGFzaGFyZ3VtZW50IjtzOjA6IiI7czo5OiIAKgBhbmNob3IiO047czo5OiIAKgBwYXJhbXMiO2E6MTp7czo2OiJhY3Rpb24iO3M6MzoiYWRkIjt9fX19Ijt9czoxNjoiY29udGV4dGhhc3JlcG9zNSI7YTozOntpOjA7aToxMzY1NTMxNTUzO2k6MTtzOjE6IjIiO2k6MjtzOjQ6ImI6MDsiO31zOjE3OiJjb250ZXh0aGFzcmVwb3MxNSI7YTozOntpOjA7aToxMzY1NTMxNTUzO2k6MTtzOjE6IjIiO2k6MjtzOjQ6ImI6MDsiO319fX1VU0VSfE86ODoic3RkQ2xhc3MiOjU5OntzOjI6ImlkIjtzOjE6IjIiO3M6NDoiYXV0aCI7czo2OiJtYW51YWwiO3M6OToiY29uZmlybWVkIjtzOjE6IjEiO3M6MTI6InBvbGljeWFncmVlZCI7czoxOiIwIjtzOjc6ImRlbGV0ZWQiO3M6MToiMCI7czo5OiJzdXNwZW5kZWQiO3M6MToiMCI7czoxMDoibW5ldGhvc3RpZCI7czoxOiIxIjtzOjg6InVzZXJuYW1lIjtzOjU6ImFkbWluIjtzOjg6InBhc3N3b3JkIjtzOjMyOiJlMTQ4ZTM2ZWMyZWZmMmU4NDc2MzVhZjkzZDdiZDIwNSI7czo4OiJpZG51bWJlciI7czowOiIiO3M6OToiZmlyc3RuYW1lIjtzOjU6IkFkbWluIjtzOjg6Imxhc3RuYW1lIjtzOjQ6IlVzZXIiO3M6NToiZW1haWwiO3M6MTU6ImFkbWluQGFkbWluLmNvbSI7czo5OiJlbWFpbHN0b3AiO3M6MToiMCI7czozOiJpY3EiO3M6MDoiIjtzOjU6InNreXBlIjtzOjA6IiI7czo1OiJ5YWhvbyI7czowOiIiO3M6MzoiYWltIjtzOjA6IiI7czozOiJtc24iO3M6MDoiIjtzOjY6InBob25lMSI7czowOiIiO3M6NjoicGhvbmUyIjtzOjA6IiI7czoxMToiaW5zdGl0dXRpb24iO3M6MDoiIjtzOjEwOiJkZXBhcnRtZW50IjtzOjA6IiI7czo3OiJhZGRyZXNzIjtzOjA6IiI7czo0OiJjaXR5IjtzOjM6InNzcyI7czo3OiJjb3VudHJ5IjtzOjI6IkFRIjtzOjQ6ImxhbmciO3M6MjoiZW4iO3M6NToidGhlbWUiO3M6MDoiIjtzOjg6InRpbWV6b25lIjtzOjI6Ijk5IjtzOjExOiJmaXJzdGFjY2VzcyI7czoxMDoiMTM2NTQ0OTg4MyI7czoxMDoibGFzdGFjY2VzcyI7aToxMzY1NTMxNTE5O3M6OToibGFzdGxvZ2luIjtzOjEwOiIxMzY1NDQ5ODgzIjtzOjEyOiJjdXJyZW50bG9naW4iO2k6MTM2NTUzMDYwNDtzOjY6Imxhc3RpcCI7czoxNToiMDowOjA6MDowOjA6MDoxIjtzOjY6InNlY3JldCI7czowOiIiO3M6NzoicGljdHVyZSI7czoxOiIwIjtzOjM6InVybCI7czowOiIiO3M6MTc6ImRlc2NyaXB0aW9uZm9ybWF0IjtzOjE6IjAiO3M6MTA6Im1haWxmb3JtYXQiO3M6MToiMSI7czoxMDoibWFpbGRpZ2VzdCI7czoxOiIwIjtzOjExOiJtYWlsZGlzcGxheSI7czoxOiIxIjtzOjEwOiJodG1sZWRpdG9yIjtzOjE6IjEiO3M6MTM6ImF1dG9zdWJzY3JpYmUiO3M6MToiMSI7czoxMToidHJhY2tmb3J1bXMiO3M6MToiMCI7czoxMToidGltZWNyZWF0ZWQiO3M6MToiMCI7czoxMjoidGltZW1vZGlmaWVkIjtzOjEwOiIxMzY1NDQ5OTM3IjtzOjEyOiJ0cnVzdGJpdG1hc2siO3M6MToiMCI7czo4OiJpbWFnZWFsdCI7TjtzOjE2OiJsYXN0Y291cnNlYWNjZXNzIjthOjA6e31zOjE5OiJjdXJyZW50Y291cnNlYWNjZXNzIjthOjE6e2k6MjtpOjEzNjU1MzE1Mzg7fXM6MTE6Imdyb3VwbWVtYmVyIjthOjA6e31zOjc6InByb2ZpbGUiO2E6MTp7czoyOiJ0MSI7czowOiIiO31zOjc6InNlc3NrZXkiO3M6MTA6IkxnQjFFQVlTc3giO3M6MTA6InByZWZlcmVuY2UiO2E6Mzp7czoxODoiZW1haWxfYm91bmNlX2NvdW50IjtzOjE6IjEiO3M6MTY6ImVtYWlsX3NlbmRfY291bnQiO3M6MToiMSI7czoxMToiX2xhc3Rsb2FkZWQiO2k6MTM2NTUzMTU1Nzt9czoxNzoibWVzc2FnZV9sYXN0cG9wdXAiO2k6MDtzOjU6ImVucm9sIjthOjI6e3M6ODoiZW5yb2xsZWQiO2E6MDp7fXM6OToidGVtcGd1ZXN0IjthOjA6e319czoyNToiYWpheF91cGRhdGFibGVfdXNlcl9wcmVmcyI7YToxMDp7czoyMzoiZG9ja2VkX2Jsb2NrX2luc3RhbmNlXzQiO3M6MzoiaW50IjtzOjIzOiJkb2NrZWRfYmxvY2tfaW5zdGFuY2VfNiI7czozOiJpbnQiO3M6MjM6ImRvY2tlZF9ibG9ja19pbnN0YW5jZV81IjtzOjM6ImludCI7czoxMjoiYmxvY2s0aGlkZGVuIjtzOjQ6ImJvb2wiO3M6MTI6ImJsb2NrNmhpZGRlbiI7czo0OiJib29sIjtzOjEyOiJibG9jazVoaWRkZW4iO3M6NDoiYm9vbCI7czoyNzoiZmlsZXBpY2tlcl9yZWNlbnRyZXBvc2l0b3J5IjtzOjM6ImludCI7czoyNDoiZmlsZXBpY2tlcl9yZWNlbnRsaWNlbnNlIjtzOjc6InNhZmVkaXIiO3M6MjU6ImZpbGVwaWNrZXJfcmVjZW50dmlld21vZGUiO3M6MzoiaW50IjtzOjEzOiJ1c2Vtb2RjaG9vc2VyIjtzOjQ6ImJvb2wiO31zOjc6ImVkaXRpbmciO2k6MTtzOjY6ImFjY2VzcyI7YTo3OntzOjI6InJhIjthOjI6e3M6MjoiLzEiO2E6MTp7aTo3O2k6Nzt9czo0OiIvMS8yIjthOjE6e2k6ODtpOjg7fX1zOjQ6InJkZWYiO2E6Mjp7czo0OiIvMTo3IjthOjY5OntzOjM1OiJibG9jay9hZG1pbl9ib29rbWFya3M6bXlhZGRpbnN0YW5jZSI7aToxO3M6MzQ6ImJsb2NrL2NhbGVuZGFyX21vbnRoOm15YWRkaW5zdGFuY2UiO2k6MTtzOjM3OiJibG9jay9jYWxlbmRhcl91cGNvbWluZzpteWFkZGluc3RhbmNlIjtpOjE7czoyODoiYmxvY2svY29tbWVudHM6bXlhZGRpbnN0YW5jZSI7aToxO3M6Mjk6ImJsb2NrL2NvbW11bml0eTpteWFkZGluc3RhbmNlIjtpOjE7czozMToiYmxvY2svY291cnNlX2xpc3Q6bXlhZGRpbnN0YW5jZSI7aToxO3M6MzU6ImJsb2NrL2NvdXJzZV9vdmVydmlldzpteWFkZGluc3RhbmNlIjtpOjE7czozNToiYmxvY2svZ2xvc3NhcnlfcmFuZG9tOm15YWRkaW5zdGFuY2UiO2k6MTtzOjI0OiJibG9jay9odG1sOm15YWRkaW5zdGFuY2UiO2k6MTtzOjI3OiJibG9jay9tZW50ZWVzOm15YWRkaW5zdGFuY2UiO2k6MTtzOjI4OiJibG9jay9tZXNzYWdlczpteWFkZGluc3RhbmNlIjtpOjE7czozMDoiYmxvY2svbW5ldF9ob3N0czpteWFkZGluc3RhbmNlIjtpOjE7czoyOToiYmxvY2svbXlwcm9maWxlOm15YWRkaW5zdGFuY2UiO2k6MTtzOjMwOiJibG9jay9uYXZpZ2F0aW9uOm15YWRkaW5zdGFuY2UiO2k6MTtzOjMwOiJibG9jay9uZXdzX2l0ZW1zOm15YWRkaW5zdGFuY2UiO2k6MTtzOjMyOiJibG9jay9vbmxpbmVfdXNlcnM6bXlhZGRpbnN0YW5jZSI7aToxO3M6Mjc6ImJsb2NrL29ubGluZV91c2Vyczp2aWV3bGlzdCI7aToxO3M6MzM6ImJsb2NrL3ByaXZhdGVfZmlsZXM6bXlhZGRpbnN0YW5jZSI7aToxO3M6MzA6ImJsb2NrL3Jzc19jbGllbnQ6bXlhZGRpbnN0YW5jZSI7aToxO3M6Mjg6ImJsb2NrL3NldHRpbmdzOm15YWRkaW5zdGFuY2UiO2k6MTtzOjI0OiJibG9jay90YWdzOm15YWRkaW5zdGFuY2UiO2k6MTtzOjE1OiJtb2QvZm9sZGVyOnZpZXciO2k6MTtzOjE0OiJtb2QvaW1zY3A6dmlldyI7aToxO3M6MTM6Im1vZC9wYWdlOnZpZXciO2k6MTtzOjE3OiJtb2QvcmVzb3VyY2U6dmlldyI7aToxO3M6MTI6Im1vZC91cmw6dmlldyI7aToxO3M6MTc6Im1vb2RsZS9ibG9jazp2aWV3IjtpOjE7czoyNzoibW9vZGxlL2Jsb2c6YXNzb2NpYXRlY291cnNlIjtpOjE7czoyNzoibW9vZGxlL2Jsb2c6YXNzb2NpYXRlbW9kdWxlIjtpOjE7czoxODoibW9vZGxlL2Jsb2c6Y3JlYXRlIjtpOjE7czoyNjoibW9vZGxlL2Jsb2c6bWFuYWdlZXh0ZXJuYWwiO2k6MTtzOjE4OiJtb29kbGUvYmxvZzpzZWFyY2giO2k6MTtzOjE2OiJtb29kbGUvYmxvZzp2aWV3IjtpOjE7czozMjoibW9vZGxlL2NhbGVuZGFyOm1hbmFnZW93bmVudHJpZXMiO2k6MTtzOjE5OiJtb29kbGUvY29tbWVudDpwb3N0IjtpOjE7czoxOToibW9vZGxlL2NvbW1lbnQ6dmlldyI7aToxO3M6MjE6Im1vb2RsZS9jb3Vyc2U6cmVxdWVzdCI7aToxO3M6MjI6Im1vb2RsZS9teTptYW5hZ2VibG9ja3MiO2k6MTtzOjIzOiJtb29kbGUvcG9ydGZvbGlvOmV4cG9ydCI7aToxO3M6MTg6Im1vb2RsZS9yYXRpbmc6cmF0ZSI7aToxO3M6MTg6Im1vb2RsZS9yYXRpbmc6dmlldyI7aToxO3M6MjE6Im1vb2RsZS9yYXRpbmc6dmlld2FsbCI7aToxO3M6MjE6Im1vb2RsZS9yYXRpbmc6dmlld2FueSI7aToxO3M6MjM6Im1vb2RsZS9zaXRlOnNlbmRtZXNzYWdlIjtpOjE7czoxNzoibW9vZGxlL3RhZzpjcmVhdGUiO2k6MTtzOjE1OiJtb29kbGUvdGFnOmVkaXQiO2k6MTtzOjE1OiJtb29kbGUvdGFnOmZsYWciO2k6MTtzOjI5OiJtb29kbGUvdXNlcjpjaGFuZ2Vvd25wYXNzd29yZCI7aToxO3M6MzM6Im1vb2RsZS91c2VyOmVkaXRvd25tZXNzYWdlcHJvZmlsZSI7aToxO3M6MjY6Im1vb2RsZS91c2VyOmVkaXRvd25wcm9maWxlIjtpOjE7czoyNzoibW9vZGxlL3VzZXI6bWFuYWdlb3duYmxvY2tzIjtpOjE7czoyNjoibW9vZGxlL3VzZXI6bWFuYWdlb3duZmlsZXMiO2k6MTtzOjM1OiJtb29kbGUvd2Vic2VydmljZTpjcmVhdGVtb2JpbGV0b2tlbiI7aToxO3M6MjQ6InJlcG9zaXRvcnkvYWxmcmVzY286dmlldyI7aToxO3M6MjI6InJlcG9zaXRvcnkvYm94bmV0OnZpZXciO2k6MTtzOjIzOiJyZXBvc2l0b3J5L2Ryb3Bib3g6dmlldyI7aToxO3M6MjM6InJlcG9zaXRvcnkvZXF1ZWxsYTp2aWV3IjtpOjE7czoyMjoicmVwb3NpdG9yeS9mbGlja3I6dmlldyI7aToxO3M6Mjk6InJlcG9zaXRvcnkvZmxpY2tyX3B1YmxpYzp2aWV3IjtpOjE7czoyNjoicmVwb3NpdG9yeS9nb29nbGVkb2NzOnZpZXciO2k6MTtzOjIyOiJyZXBvc2l0b3J5L21lcmxvdDp2aWV3IjtpOjE7czoyMjoicmVwb3NpdG9yeS9waWNhc2E6dmlldyI7aToxO3M6MjI6InJlcG9zaXRvcnkvcmVjZW50OnZpZXciO2k6MTtzOjE4OiJyZXBvc2l0b3J5L3MzOnZpZXciO2k6MTtzOjIyOiJyZXBvc2l0b3J5L3VwbG9hZDp2aWV3IjtpOjE7czoxOToicmVwb3NpdG9yeS91cmw6dmlldyI7aToxO3M6MjA6InJlcG9zaXRvcnkvdXNlcjp2aWV3IjtpOjE7czoyNToicmVwb3NpdG9yeS93aWtpbWVkaWE6dmlldyI7aToxO3M6MjM6InJlcG9zaXRvcnkveW91dHViZTp2aWV3IjtpOjE7fXM6NDoiLzE6OCI7YTo3OntzOjIwOiJib29rdG9vbC9wcmludDpwcmludCI7aToxO3M6MTM6Im1vZC9ib29rOnJlYWQiO2k6MTtzOjE4OiJtb2QvZGF0YTp2aWV3ZW50cnkiO2k6MTtzOjI5OiJtb2QvZm9ydW06YWxsb3dmb3JjZXN1YnNjcmliZSI7aToxO3M6MjQ6Im1vZC9mb3J1bTp2aWV3ZGlzY3Vzc2lvbiI7aToxO3M6MTc6Im1vZC9nbG9zc2FyeTp2aWV3IjtpOjE7czoxOToibW9vZGxlL2NvbW1lbnQ6dmlldyI7aToxO319czoxMDoicmRlZl9jb3VudCI7aToyO3M6ODoicmRlZl9sY2MiO2k6MjtzOjY6ImxvYWRlZCI7YTowOnt9czo0OiJ0aW1lIjtpOjEzNjU1MzE1NTM7czozOiJyc3ciO2E6MDp7fX19', 1365530608, 1365531557, '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:1'),
(6, 0, 'alvcrp7k0vbk4pcksk5for65s2', 5, 'U0VTU0lPTnxPOjg6InN0ZENsYXNzIjo3OntzOjg6Im5hdmNhY2hlIjtPOjg6InN0ZENsYXNzIjoxOntzOjEwOiJuYXZpZ2F0aW9uIjthOjM6e3M6MTY6InVzZXJibG9nb3B0aW9uczUiO2E6Mzp7aTowO2k6MTM2NTUzNDI3NDtpOjE7czoxOiI1IjtpOjI7czo3MDM6ImE6Mjp7czo0OiJ2aWV3IjthOjI6e3M6Njoic3RyaW5nIjtzOjIyOiJWaWV3IGFsbCBvZiBteSBlbnRyaWVzIjtzOjQ6ImxpbmsiO086MTA6Im1vb2RsZV91cmwiOjk6e3M6OToiACoAc2NoZW1lIjtzOjQ6Imh0dHAiO3M6NzoiACoAaG9zdCI7czo5OiJsb2NhbGhvc3QiO3M6NzoiACoAcG9ydCI7czowOiIiO3M6NzoiACoAdXNlciI7czowOiIiO3M6NzoiACoAcGFzcyI7czowOiIiO3M6NzoiACoAcGF0aCI7czoyNToiL21vb2RsZTI0My9ibG9nL2luZGV4LnBocCI7czoxNjoiACoAc2xhc2hhcmd1bWVudCI7czowOiIiO3M6OToiACoAYW5jaG9yIjtOO3M6OToiACoAcGFyYW1zIjthOjE6e3M6NjoidXNlcmlkIjtzOjE6IjUiO319fXM6MzoiYWRkIjthOjI6e3M6Njoic3RyaW5nIjtzOjE1OiJBZGQgYSBuZXcgZW50cnkiO3M6NDoibGluayI7TzoxMDoibW9vZGxlX3VybCI6OTp7czo5OiIAKgBzY2hlbWUiO3M6NDoiaHR0cCI7czo3OiIAKgBob3N0IjtzOjk6ImxvY2FsaG9zdCI7czo3OiIAKgBwb3J0IjtzOjA6IiI7czo3OiIAKgB1c2VyIjtzOjA6IiI7czo3OiIAKgBwYXNzIjtzOjA6IiI7czo3OiIAKgBwYXRoIjtzOjI0OiIvbW9vZGxlMjQzL2Jsb2cvZWRpdC5waHAiO3M6MTY6IgAqAHNsYXNoYXJndW1lbnQiO3M6MDoiIjtzOjk6IgAqAGFuY2hvciI7TjtzOjk6IgAqAHBhcmFtcyI7YToxOntzOjY6ImFjdGlvbiI7czozOiJhZGQiO319fX0iO31zOjE3OiJjb250ZXh0aGFzcmVwb3MyMiI7YTozOntpOjA7aToxMzY1NTM0Mjc0O2k6MTtzOjE6IjUiO2k6MjtzOjQ6ImI6MDsiO31zOjE3OiJjb250ZXh0aGFzcmVwb3MxNSI7YTozOntpOjA7aToxMzY1NTM0Mjc0O2k6MTtzOjE6IjUiO2k6MjtzOjQ6ImI6MDsiO319fXM6MjE6ImNhbGVuZGFyc2hvd2V2ZW50dHlwZSI7aToxNTtzOjEwOiJsb2dpbmNvdW50IjtpOjA7czoyMToibG9hZF9uYXZpZ2F0aW9uX2FkbWluIjtiOjA7czoxNDoiZnJvbWRpc2N1c3Npb24iO3M6NDc6Imh0dHA6Ly9sb2NhbGhvc3QvbW9vZGxlMjQzL2NvdXJzZS92aWV3LnBocD9pZD0yIjtzOjE0OiJhdHRzZXNzaW9udHlwZSI7YToxOntpOjI7aTotMTt9czoxNzoiYXR0Y3VycmVudGF0dHZpZXciO2E6MTp7aToyO2k6NTt9fVVTRVJ8Tzo4OiJzdGRDbGFzcyI6NTk6e3M6MjoiaWQiO3M6MToiNSI7czo0OiJhdXRoIjtzOjY6Im1hbnVhbCI7czo5OiJjb25maXJtZWQiO3M6MToiMSI7czoxMjoicG9saWN5YWdyZWVkIjtzOjE6IjAiO3M6NzoiZGVsZXRlZCI7czoxOiIwIjtzOjk6InN1c3BlbmRlZCI7czoxOiIwIjtzOjEwOiJtbmV0aG9zdGlkIjtzOjE6IjEiO3M6ODoidXNlcm5hbWUiO3M6ODoidGVhY2hlcjEiO3M6ODoicGFzc3dvcmQiO3M6MzI6ImUxNDhlMzZlYzJlZmYyZTg0NzYzNWFmOTNkN2JkMjA1IjtzOjg6ImlkbnVtYmVyIjtzOjA6IiI7czo5OiJmaXJzdG5hbWUiO3M6MjoidDEiO3M6ODoibGFzdG5hbWUiO3M6MToiMSI7czo1OiJlbWFpbCI7czoxODoidGVhY2hlcjFAbG9jYWwuY29tIjtzOjk6ImVtYWlsc3RvcCI7czoxOiIwIjtzOjM6ImljcSI7czowOiIiO3M6NToic2t5cGUiO3M6MDoiIjtzOjU6InlhaG9vIjtzOjA6IiI7czozOiJhaW0iO3M6MDoiIjtzOjM6Im1zbiI7czowOiIiO3M6NjoicGhvbmUxIjtzOjA6IiI7czo2OiJwaG9uZTIiO3M6MDoiIjtzOjExOiJpbnN0aXR1dGlvbiI7czowOiIiO3M6MTA6ImRlcGFydG1lbnQiO3M6MDoiIjtzOjc6ImFkZHJlc3MiO3M6MDoiIjtzOjQ6ImNpdHkiO3M6NDoiZmZmZiI7czo3OiJjb3VudHJ5IjtzOjI6IkJTIjtzOjQ6ImxhbmciO3M6MjoiZW4iO3M6NToidGhlbWUiO3M6MDoiIjtzOjg6InRpbWV6b25lIjtzOjI6Ijk5IjtzOjExOiJmaXJzdGFjY2VzcyI7aToxMzY1NTMxNjE1O3M6MTA6Imxhc3RhY2Nlc3MiO2k6MTM2NTUzNDIzMTtzOjk6Imxhc3Rsb2dpbiI7czoxOiIwIjtzOjEyOiJjdXJyZW50bG9naW4iO2k6MTM2NTUzMTYxNTtzOjY6Imxhc3RpcCI7czoxNToiMDowOjA6MDowOjA6MDoxIjtzOjY6InNlY3JldCI7czowOiIiO3M6NzoicGljdHVyZSI7czoxOiIwIjtzOjM6InVybCI7czowOiIiO3M6MTc6ImRlc2NyaXB0aW9uZm9ybWF0IjtzOjE6IjEiO3M6MTA6Im1haWxmb3JtYXQiO3M6MToiMSI7czoxMDoibWFpbGRpZ2VzdCI7czoxOiIwIjtzOjExOiJtYWlsZGlzcGxheSI7czoxOiIyIjtzOjEwOiJodG1sZWRpdG9yIjtzOjE6IjEiO3M6MTM6ImF1dG9zdWJzY3JpYmUiO3M6MToiMSI7czoxMToidHJhY2tmb3J1bXMiO3M6MToiMCI7czoxMToidGltZWNyZWF0ZWQiO3M6MTA6IjEzNjU1MzE1MjIiO3M6MTI6InRpbWVtb2RpZmllZCI7czoxMDoiMTM2NTUzMTUyMiI7czoxMjoidHJ1c3RiaXRtYXNrIjtzOjE6IjAiO3M6ODoiaW1hZ2VhbHQiO3M6MDoiIjtzOjE2OiJsYXN0Y291cnNlYWNjZXNzIjthOjA6e31zOjE5OiJjdXJyZW50Y291cnNlYWNjZXNzIjthOjE6e2k6MjtpOjEzNjU1MzQyMzE7fXM6MTE6Imdyb3VwbWVtYmVyIjthOjA6e31zOjc6InByb2ZpbGUiO2E6MTp7czoyOiJ0MSI7czowOiIiO31zOjc6InNlc3NrZXkiO3M6MTA6Ikp5M3N3eVdZUGciO3M6MTA6InByZWZlcmVuY2UiO2E6NDp7czoyNDoiYXV0aF9mb3JjZXBhc3N3b3JkY2hhbmdlIjtzOjE6IjAiO3M6MTg6ImVtYWlsX2JvdW5jZV9jb3VudCI7czoxOiIxIjtzOjE2OiJlbWFpbF9zZW5kX2NvdW50IjtzOjE6IjEiO3M6MTE6Il9sYXN0bG9hZGVkIjtpOjEzNjU1MzQyNzM7fXM6NjoiYWNjZXNzIjthOjc6e3M6MjoicmEiO2E6Mzp7czoyOiIvMSI7YToxOntpOjc7aTo3O31zOjQ6Ii8xLzIiO2E6MTp7aTo4O2k6ODt9czo3OiIvMS8zLzE1IjthOjE6e2k6MztpOjM7fX1zOjQ6InJkZWYiO2E6Mzp7czo0OiIvMTozIjthOjM0NDp7czozNDoiYmxvY2svYWN0aXZpdHlfbW9kdWxlczphZGRpbnN0YW5jZSI7aToxO3M6MzM6ImJsb2NrL2FkbWluX2Jvb2ttYXJrczphZGRpbnN0YW5jZSI7aToxO3M6Mjc6ImJsb2NrL2Jsb2dfbWVudTphZGRpbnN0YW5jZSI7aToxO3M6Mjk6ImJsb2NrL2Jsb2dfcmVjZW50OmFkZGluc3RhbmNlIjtpOjE7czoyNzoiYmxvY2svYmxvZ190YWdzOmFkZGluc3RhbmNlIjtpOjE7czozMjoiYmxvY2svY2FsZW5kYXJfbW9udGg6YWRkaW5zdGFuY2UiO2k6MTtzOjM1OiJibG9jay9jYWxlbmRhcl91cGNvbWluZzphZGRpbnN0YW5jZSI7aToxO3M6MjY6ImJsb2NrL2NvbW1lbnRzOmFkZGluc3RhbmNlIjtpOjE7czoyNzoiYmxvY2svY29tbXVuaXR5OmFkZGluc3RhbmNlIjtpOjE7czozNDoiYmxvY2svY29tcGxldGlvbnN0YXR1czphZGRpbnN0YW5jZSI7aToxO3M6Mjk6ImJsb2NrL2NvdXJzZV9saXN0OmFkZGluc3RhbmNlIjtpOjE7czozMjoiYmxvY2svY291cnNlX3N1bW1hcnk6YWRkaW5zdGFuY2UiO2k6MTtzOjI2OiJibG9jay9mZWVkYmFjazphZGRpbnN0YW5jZSI7aToxO3M6MzM6ImJsb2NrL2dsb3NzYXJ5X3JhbmRvbTphZGRpbnN0YW5jZSI7aToxO3M6MjI6ImJsb2NrL2h0bWw6YWRkaW5zdGFuY2UiO2k6MTtzOjIzOiJibG9jay9sb2dpbjphZGRpbnN0YW5jZSI7aToxO3M6MjU6ImJsb2NrL21lbnRlZXM6YWRkaW5zdGFuY2UiO2k6MTtzOjI2OiJibG9jay9tZXNzYWdlczphZGRpbnN0YW5jZSI7aToxO3M6Mjg6ImJsb2NrL21uZXRfaG9zdHM6YWRkaW5zdGFuY2UiO2k6MTtzOjI3OiJibG9jay9teXByb2ZpbGU6YWRkaW5zdGFuY2UiO2k6MTtzOjI4OiJibG9jay9uYXZpZ2F0aW9uOmFkZGluc3RhbmNlIjtpOjE7czoyODoiYmxvY2svbmV3c19pdGVtczphZGRpbnN0YW5jZSI7aToxO3M6MzA6ImJsb2NrL29ubGluZV91c2VyczphZGRpbnN0YW5jZSI7aToxO3M6Mjc6ImJsb2NrL29ubGluZV91c2Vyczp2aWV3bGlzdCI7aToxO3M6MzA6ImJsb2NrL3BhcnRpY2lwYW50czphZGRpbnN0YW5jZSI7aToxO3M6MzE6ImJsb2NrL3ByaXZhdGVfZmlsZXM6YWRkaW5zdGFuY2UiO2k6MTtzOjMwOiJibG9jay9xdWl6X3Jlc3VsdHM6YWRkaW5zdGFuY2UiO2k6MTtzOjMzOiJibG9jay9yZWNlbnRfYWN0aXZpdHk6YWRkaW5zdGFuY2UiO2k6MTtzOjI4OiJibG9jay9yc3NfY2xpZW50OmFkZGluc3RhbmNlIjtpOjE7czozMToiYmxvY2svcnNzX2NsaWVudDptYW5hZ2Vvd25mZWVkcyI7aToxO3M6MzE6ImJsb2NrL3NlYXJjaF9mb3J1bXM6YWRkaW5zdGFuY2UiO2k6MTtzOjMxOiJibG9jay9zZWN0aW9uX2xpbmtzOmFkZGluc3RhbmNlIjtpOjE7czozMjoiYmxvY2svc2VsZmNvbXBsZXRpb246YWRkaW5zdGFuY2UiO2k6MTtzOjI2OiJibG9jay9zZXR0aW5nczphZGRpbnN0YW5jZSI7aToxO3M6MzI6ImJsb2NrL3NpdGVfbWFpbl9tZW51OmFkZGluc3RhbmNlIjtpOjE7czozNToiYmxvY2svc29jaWFsX2FjdGl2aXRpZXM6YWRkaW5zdGFuY2UiO2k6MTtzOjIyOiJibG9jay90YWdzOmFkZGluc3RhbmNlIjtpOjE7czoyODoiYmxvY2svdGFnX2ZsaWNrcjphZGRpbnN0YW5jZSI7aToxO3M6Mjk6ImJsb2NrL3RhZ195b3V0dWJlOmFkZGluc3RhbmNlIjtpOjE7czoyNjoiYm9va3Rvb2wvaW1wb3J0aHRtbDppbXBvcnQiO2k6MTtzOjIwOiJib29rdG9vbC9wcmludDpwcmludCI7aToxO3M6MjI6ImVucm9sL2F1dGhvcml6ZTptYW5hZ2UiO2k6MTtzOjE5OiJlbnJvbC9jb2hvcnQ6Y29uZmlnIjtpOjE7czoxODoiZW5yb2wvZ3Vlc3Q6Y29uZmlnIjtpOjE7czoxODoiZW5yb2wvbWFudWFsOmVucm9sIjtpOjE7czoxOToiZW5yb2wvbWFudWFsOm1hbmFnZSI7aToxO3M6MjA6ImVucm9sL21hbnVhbDp1bmVucm9sIjtpOjE7czoxNzoiZW5yb2wvbWV0YTpjb25maWciO2k6MTtzOjE5OiJlbnJvbC9wYXlwYWw6bWFuYWdlIjtpOjE7czoxNzoiZW5yb2wvc2VsZjpjb25maWciO2k6MTtzOjE3OiJlbnJvbC9zZWxmOm1hbmFnZSI7aToxO3M6MTg6ImVucm9sL3NlbGY6dW5lbnJvbCI7aToxO3M6MjA6ImdyYWRlZXhwb3J0L29kczp2aWV3IjtpOjE7czoyMDoiZ3JhZGVleHBvcnQvdHh0OnZpZXciO2k6MTtzOjIwOiJncmFkZWV4cG9ydC94bHM6dmlldyI7aToxO3M6MjA6ImdyYWRlZXhwb3J0L3htbDp2aWV3IjtpOjE7czoyMDoiZ3JhZGVpbXBvcnQvY3N2OnZpZXciO2k6MTtzOjIwOiJncmFkZWltcG9ydC94bWw6dmlldyI7aToxO3M6MjM6ImdyYWRlcmVwb3J0L2dyYWRlcjp2aWV3IjtpOjE7czoyNToiZ3JhZGVyZXBvcnQvb3V0Y29tZXM6dmlldyI7aToxO3M6MjE6ImdyYWRlcmVwb3J0L3VzZXI6dmlldyI7aToxO3M6MjI6Im1vZC9hc3NpZ246YWRkaW5zdGFuY2UiO2k6MTtzOjMwOiJtb2QvYXNzaWduOmV4cG9ydG93bnN1Ym1pc3Npb24iO2k6MTtzOjE2OiJtb2QvYXNzaWduOmdyYWRlIjtpOjE7czoyNToibW9kL2Fzc2lnbjpncmFudGV4dGVuc2lvbiI7aToxO3M6Mjc6Im1vZC9hc3NpZ246cmV2ZWFsaWRlbnRpdGllcyI7aToxO3M6MTU6Im1vZC9hc3NpZ246dmlldyI7aToxO3M6MjY6Im1vZC9hc3NpZ25tZW50OmFkZGluc3RhbmNlIjtpOjE7czozNDoibW9kL2Fzc2lnbm1lbnQ6ZXhwb3J0b3duc3VibWlzc2lvbiI7aToxO3M6MjA6Im1vZC9hc3NpZ25tZW50OmdyYWRlIjtpOjE7czoxOToibW9kL2Fzc2lnbm1lbnQ6dmlldyI7aToxO3M6Mjc6Im1vZC9hdHRmb3JibG9jazphZGRpbnN0YW5jZSI7aToxO3M6MzM6Im1vZC9hdHRmb3JibG9jazpjaGFuZ2VhdHRlbmRhbmNlcyI7aToxO3M6MzM6Im1vZC9hdHRmb3JibG9jazpjaGFuZ2VwcmVmZXJlbmNlcyI7aToxO3M6MjI6Im1vZC9hdHRmb3JibG9jazpleHBvcnQiO2k6MTtzOjMzOiJtb2QvYXR0Zm9yYmxvY2s6bWFuYWdlYXR0ZW5kYW5jZXMiO2k6MTtzOjMxOiJtb2QvYXR0Zm9yYmxvY2s6dGFrZWF0dGVuZGFuY2VzIjtpOjE7czoyMDoibW9kL2F0dGZvcmJsb2NrOnZpZXciO2k6MTtzOjI3OiJtb2QvYXR0Zm9yYmxvY2s6dmlld3JlcG9ydHMiO2k6MTtzOjIwOiJtb2QvYm9vazphZGRpbnN0YW5jZSI7aToxO3M6MTM6Im1vZC9ib29rOmVkaXQiO2k6MTtzOjEzOiJtb2QvYm9vazpyZWFkIjtpOjE7czoyNzoibW9kL2Jvb2s6dmlld2hpZGRlbmNoYXB0ZXJzIjtpOjE7czoyMDoibW9kL2NoYXQ6YWRkaW5zdGFuY2UiO2k6MTtzOjEzOiJtb2QvY2hhdDpjaGF0IjtpOjE7czoxODoibW9kL2NoYXQ6ZGVsZXRlbG9nIjtpOjE7czozNDoibW9kL2NoYXQ6ZXhwb3J0cGFydGljaXBhdGVkc2Vzc2lvbiI7aToxO3M6MjI6Im1vZC9jaGF0OmV4cG9ydHNlc3Npb24iO2k6MTtzOjE2OiJtb2QvY2hhdDpyZWFkbG9nIjtpOjE7czoyMjoibW9kL2Nob2ljZTphZGRpbnN0YW5jZSI7aToxO3M6MTc6Im1vZC9jaG9pY2U6Y2hvb3NlIjtpOjE7czoyNjoibW9kL2Nob2ljZTpkZWxldGVyZXNwb25zZXMiO2k6MTtzOjI4OiJtb2QvY2hvaWNlOmRvd25sb2FkcmVzcG9uc2VzIjtpOjE7czoyNDoibW9kL2Nob2ljZTpyZWFkcmVzcG9uc2VzIjtpOjE7czoyMDoibW9kL2RhdGE6YWRkaW5zdGFuY2UiO2k6MTtzOjE2OiJtb2QvZGF0YTphcHByb3ZlIjtpOjE7czoxNjoibW9kL2RhdGE6Y29tbWVudCI7aToxO3M6MjU6Im1vZC9kYXRhOmV4cG9ydGFsbGVudHJpZXMiO2k6MTtzOjIwOiJtb2QvZGF0YTpleHBvcnRlbnRyeSI7aToxO3M6MjM6Im1vZC9kYXRhOmV4cG9ydG93bmVudHJ5IjtpOjE7czoyMzoibW9kL2RhdGE6ZXhwb3J0dXNlcmluZm8iO2k6MTtzOjIzOiJtb2QvZGF0YTptYW5hZ2Vjb21tZW50cyI7aToxO3M6MjI6Im1vZC9kYXRhOm1hbmFnZWVudHJpZXMiO2k6MTtzOjI0OiJtb2QvZGF0YTptYW5hZ2V0ZW1wbGF0ZXMiO2k6MTtzOjEzOiJtb2QvZGF0YTpyYXRlIjtpOjE7czoyMzoibW9kL2RhdGE6dmlld2FsbHJhdGluZ3MiO2k6MTtzOjI3OiJtb2QvZGF0YTp2aWV3YWxsdXNlcnByZXNldHMiO2k6MTtzOjIyOiJtb2QvZGF0YTp2aWV3YW55cmF0aW5nIjtpOjE7czoxODoibW9kL2RhdGE6dmlld2VudHJ5IjtpOjE7czoxOToibW9kL2RhdGE6dmlld3JhdGluZyI7aToxO3M6MTk6Im1vZC9kYXRhOndyaXRlZW50cnkiO2k6MTtzOjI0OiJtb2QvZmVlZGJhY2s6YWRkaW5zdGFuY2UiO2k6MTtzOjM0OiJtb2QvZmVlZGJhY2s6Y3JlYXRlcHJpdmF0ZXRlbXBsYXRlIjtpOjE7czozMzoibW9kL2ZlZWRiYWNrOmNyZWF0ZXB1YmxpY3RlbXBsYXRlIjtpOjE7czozMDoibW9kL2ZlZWRiYWNrOmRlbGV0ZXN1Ym1pc3Npb25zIjtpOjE7czoyNzoibW9kL2ZlZWRiYWNrOmRlbGV0ZXRlbXBsYXRlIjtpOjE7czoyMjoibW9kL2ZlZWRiYWNrOmVkaXRpdGVtcyI7aToxO3M6MjQ6Im1vZC9mZWVkYmFjazpyZWNlaXZlbWFpbCI7aToxO3M6MTc6Im1vZC9mZWVkYmFjazp2aWV3IjtpOjE7czoyODoibW9kL2ZlZWRiYWNrOnZpZXdhbmFseXNlcGFnZSI7aToxO3M6MjQ6Im1vZC9mZWVkYmFjazp2aWV3cmVwb3J0cyI7aToxO3M6MjI6Im1vZC9mb2xkZXI6YWRkaW5zdGFuY2UiO2k6MTtzOjIyOiJtb2QvZm9sZGVyOm1hbmFnZWZpbGVzIjtpOjE7czoyMToibW9kL2ZvcnVtOmFkZGluc3RhbmNlIjtpOjE7czoxNzoibW9kL2ZvcnVtOmFkZG5ld3MiO2k6MTtzOjIxOiJtb2QvZm9ydW06YWRkcXVlc3Rpb24iO2k6MTtzOjI5OiJtb2QvZm9ydW06YWxsb3dmb3JjZXN1YnNjcmliZSI7aToxO3M6MjY6Im1vZC9mb3J1bTpjcmVhdGVhdHRhY2htZW50IjtpOjE7czoyMzoibW9kL2ZvcnVtOmRlbGV0ZWFueXBvc3QiO2k6MTtzOjIzOiJtb2QvZm9ydW06ZGVsZXRlb3ducG9zdCI7aToxO3M6MjE6Im1vZC9mb3J1bTplZGl0YW55cG9zdCI7aToxO3M6MjY6Im1vZC9mb3J1bTpleHBvcnRkaXNjdXNzaW9uIjtpOjE7czoyMzoibW9kL2ZvcnVtOmV4cG9ydG93bnBvc3QiO2k6MTtzOjIwOiJtb2QvZm9ydW06ZXhwb3J0cG9zdCI7aToxO3M6Mjk6Im1vZC9mb3J1bTptYW5hZ2VzdWJzY3JpcHRpb25zIjtpOjE7czoyNToibW9kL2ZvcnVtOm1vdmVkaXNjdXNzaW9ucyI7aToxO3M6MzE6Im1vZC9mb3J1bTpwb3N0d2l0aG91dHRocm90dGxpbmciO2k6MTtzOjE0OiJtb2QvZm9ydW06cmF0ZSI7aToxO3M6MTk6Im1vZC9mb3J1bTpyZXBseW5ld3MiO2k6MTtzOjE5OiJtb2QvZm9ydW06cmVwbHlwb3N0IjtpOjE7czoyNjoibW9kL2ZvcnVtOnNwbGl0ZGlzY3Vzc2lvbnMiO2k6MTtzOjI1OiJtb2QvZm9ydW06c3RhcnRkaXNjdXNzaW9uIjtpOjE7czoyNDoibW9kL2ZvcnVtOnZpZXdhbGxyYXRpbmdzIjtpOjE7czoyMzoibW9kL2ZvcnVtOnZpZXdhbnlyYXRpbmciO2k6MTtzOjI0OiJtb2QvZm9ydW06dmlld2Rpc2N1c3Npb24iO2k6MTtzOjMwOiJtb2QvZm9ydW06dmlld2hpZGRlbnRpbWVkcG9zdHMiO2k6MTtzOjMzOiJtb2QvZm9ydW06dmlld3FhbmRhd2l0aG91dHBvc3RpbmciO2k6MTtzOjIwOiJtb2QvZm9ydW06dmlld3JhdGluZyI7aToxO3M6MjU6Im1vZC9mb3J1bTp2aWV3c3Vic2NyaWJlcnMiO2k6MTtzOjI0OiJtb2QvZ2xvc3Nhcnk6YWRkaW5zdGFuY2UiO2k6MTtzOjIwOiJtb2QvZ2xvc3Nhcnk6YXBwcm92ZSI7aToxO3M6MjA6Im1vZC9nbG9zc2FyeTpjb21tZW50IjtpOjE7czoxOToibW9kL2dsb3NzYXJ5OmV4cG9ydCI7aToxO3M6MjQ6Im1vZC9nbG9zc2FyeTpleHBvcnRlbnRyeSI7aToxO3M6Mjc6Im1vZC9nbG9zc2FyeTpleHBvcnRvd25lbnRyeSI7aToxO3M6MTk6Im1vZC9nbG9zc2FyeTppbXBvcnQiO2k6MTtzOjI5OiJtb2QvZ2xvc3Nhcnk6bWFuYWdlY2F0ZWdvcmllcyI7aToxO3M6Mjc6Im1vZC9nbG9zc2FyeTptYW5hZ2Vjb21tZW50cyI7aToxO3M6MjY6Im1vZC9nbG9zc2FyeTptYW5hZ2VlbnRyaWVzIjtpOjE7czoxNzoibW9kL2dsb3NzYXJ5OnJhdGUiO2k6MTtzOjE3OiJtb2QvZ2xvc3Nhcnk6dmlldyI7aToxO3M6Mjc6Im1vZC9nbG9zc2FyeTp2aWV3YWxscmF0aW5ncyI7aToxO3M6MjY6Im1vZC9nbG9zc2FyeTp2aWV3YW55cmF0aW5nIjtpOjE7czoyMzoibW9kL2dsb3NzYXJ5OnZpZXdyYXRpbmciO2k6MTtzOjE4OiJtb2QvZ2xvc3Nhcnk6d3JpdGUiO2k6MTtzOjIxOiJtb2QvaW1zY3A6YWRkaW5zdGFuY2UiO2k6MTtzOjIxOiJtb2QvbGFiZWw6YWRkaW5zdGFuY2UiO2k6MTtzOjIyOiJtb2QvbGVzc29uOmFkZGluc3RhbmNlIjtpOjE7czoxNToibW9kL2xlc3NvbjplZGl0IjtpOjE7czoxNzoibW9kL2xlc3NvbjptYW5hZ2UiO2k6MTtzOjIxOiJtb2QvbHRpOmFkZGNvdXJzZXRvb2wiO2k6MTtzOjE5OiJtb2QvbHRpOmFkZGluc3RhbmNlIjtpOjE7czoxMzoibW9kL2x0aTpncmFkZSI7aToxO3M6MTQ6Im1vZC9sdGk6bWFuYWdlIjtpOjE7czoyMjoibW9kL2x0aTpyZXF1ZXN0dG9vbGFkZCI7aToxO3M6MTI6Im1vZC9sdGk6dmlldyI7aToxO3M6MjA6Im1vZC9wYWdlOmFkZGluc3RhbmNlIjtpOjE7czoyMDoibW9kL3F1aXo6YWRkaW5zdGFuY2UiO2k6MTtzOjIzOiJtb2QvcXVpejpkZWxldGVhdHRlbXB0cyI7aToxO3M6MTQ6Im1vZC9xdWl6OmdyYWRlIjtpOjE7czoxNToibW9kL3F1aXo6bWFuYWdlIjtpOjE7czoyNDoibW9kL3F1aXo6bWFuYWdlb3ZlcnJpZGVzIjtpOjE7czoxNjoibW9kL3F1aXo6cHJldmlldyI7aToxO3M6MTY6Im1vZC9xdWl6OnJlZ3JhZGUiO2k6MTtzOjEzOiJtb2QvcXVpejp2aWV3IjtpOjE7czoyMDoibW9kL3F1aXo6dmlld3JlcG9ydHMiO2k6MTtzOjI0OiJtb2QvcmVzb3VyY2U6YWRkaW5zdGFuY2UiO2k6MTtzOjIxOiJtb2Qvc2Nvcm06YWRkaW5zdGFuY2UiO2k6MTtzOjI1OiJtb2Qvc2Nvcm06ZGVsZXRlcmVzcG9uc2VzIjtpOjE7czoxOToibW9kL3Njb3JtOnNhdmV0cmFjayI7aToxO3M6MjA6Im1vZC9zY29ybTp2aWV3cmVwb3J0IjtpOjE7czoyMDoibW9kL3Njb3JtOnZpZXdzY29yZXMiO2k6MTtzOjIyOiJtb2Qvc3VydmV5OmFkZGluc3RhbmNlIjtpOjE7czoxOToibW9kL3N1cnZleTpkb3dubG9hZCI7aToxO3M6MjI6Im1vZC9zdXJ2ZXk6cGFydGljaXBhdGUiO2k6MTtzOjI0OiJtb2Qvc3VydmV5OnJlYWRyZXNwb25zZXMiO2k6MTtzOjE5OiJtb2QvdXJsOmFkZGluc3RhbmNlIjtpOjE7czoyMDoibW9kL3dpa2k6YWRkaW5zdGFuY2UiO2k6MTtzOjE5OiJtb2Qvd2lraTpjcmVhdGVwYWdlIjtpOjE7czoyMDoibW9kL3dpa2k6ZWRpdGNvbW1lbnQiO2k6MTtzOjE3OiJtb2Qvd2lraTplZGl0cGFnZSI7aToxO3M6MjI6Im1vZC93aWtpOm1hbmFnZWNvbW1lbnQiO2k6MTtzOjIwOiJtb2Qvd2lraTptYW5hZ2VmaWxlcyI7aToxO3M6MTk6Im1vZC93aWtpOm1hbmFnZXdpa2kiO2k6MTtzOjIxOiJtb2Qvd2lraTpvdmVycmlkZWxvY2siO2k6MTtzOjIwOiJtb2Qvd2lraTp2aWV3Y29tbWVudCI7aToxO3M6MTc6Im1vZC93aWtpOnZpZXdwYWdlIjtpOjE7czoyNDoibW9kL3dvcmtzaG9wOmFkZGluc3RhbmNlIjtpOjE7czoyMToibW9kL3dvcmtzaG9wOmFsbG9jYXRlIjtpOjE7czoyNzoibW9kL3dvcmtzaG9wOmVkaXRkaW1lbnNpb25zIjtpOjE7czoyODoibW9kL3dvcmtzaG9wOmlnbm9yZWRlYWRsaW5lcyI7aToxO3M6Mjc6Im1vZC93b3Jrc2hvcDptYW5hZ2VleGFtcGxlcyI7aToxO3M6Mjc6Im1vZC93b3Jrc2hvcDpvdmVycmlkZWdyYWRlcyI7aToxO3M6MzE6Im1vZC93b3Jrc2hvcDpwdWJsaXNoc3VibWlzc2lvbnMiO2k6MTtzOjI0OiJtb2Qvd29ya3Nob3A6c3dpdGNocGhhc2UiO2k6MTtzOjE3OiJtb2Qvd29ya3Nob3A6dmlldyI7aToxO3M6MzE6Im1vZC93b3Jrc2hvcDp2aWV3YWxsYXNzZXNzbWVudHMiO2k6MTtzOjMxOiJtb2Qvd29ya3Nob3A6dmlld2FsbHN1Ym1pc3Npb25zIjtpOjE7czoyODoibW9kL3dvcmtzaG9wOnZpZXdhdXRob3JuYW1lcyI7aToxO3M6MzI6Im1vZC93b3Jrc2hvcDp2aWV3YXV0aG9ycHVibGlzaGVkIjtpOjE7czozNzoibW9kL3dvcmtzaG9wOnZpZXdwdWJsaXNoZWRzdWJtaXNzaW9ucyI7aToxO3M6MzA6Im1vZC93b3Jrc2hvcDp2aWV3cmV2aWV3ZXJuYW1lcyI7aToxO3M6Mjg6Im1vb2RsZS9iYWNrdXA6YmFja3VwYWN0aXZpdHkiO2k6MTtzOjI2OiJtb29kbGUvYmFja3VwOmJhY2t1cGNvdXJzZSI7aToxO3M6Mjc6Im1vb2RsZS9iYWNrdXA6YmFja3Vwc2VjdGlvbiI7aToxO3M6Mjk6Im1vb2RsZS9iYWNrdXA6YmFja3VwdGFyZ2V0aHViIjtpOjE7czozMjoibW9vZGxlL2JhY2t1cDpiYWNrdXB0YXJnZXRpbXBvcnQiO2k6MTtzOjIzOiJtb29kbGUvYmFja3VwOmNvbmZpZ3VyZSI7aToxO3M6MjY6Im1vb2RsZS9iYWNrdXA6ZG93bmxvYWRmaWxlIjtpOjE7czoxNzoibW9vZGxlL2Jsb2NrOmVkaXQiO2k6MTtzOjE3OiJtb29kbGUvYmxvY2s6dmlldyI7aToxO3M6Mjc6Im1vb2RsZS9ibG9nOmFzc29jaWF0ZWNvdXJzZSI7aToxO3M6Mjc6Im1vb2RsZS9ibG9nOmFzc29jaWF0ZW1vZHVsZSI7aToxO3M6MjU6Im1vb2RsZS9ibG9nOm1hbmFnZWVudHJpZXMiO2k6MTtzOjI2OiJtb29kbGUvYmxvZzptYW5hZ2VleHRlcm5hbCI7aToxO3M6MTg6Im1vb2RsZS9ibG9nOnNlYXJjaCI7aToxO3M6MTY6Im1vb2RsZS9ibG9nOnZpZXciO2k6MTtzOjI5OiJtb29kbGUvY2FsZW5kYXI6bWFuYWdlZW50cmllcyI7aToxO3M6MzQ6Im1vb2RsZS9jYWxlbmRhcjptYW5hZ2Vncm91cGVudHJpZXMiO2k6MTtzOjE4OiJtb29kbGUvY29ob3J0OnZpZXciO2k6MTtzOjIxOiJtb29kbGUvY29tbWVudDpkZWxldGUiO2k6MTtzOjE5OiJtb29kbGUvY29tbWVudDpwb3N0IjtpOjE7czoxOToibW9vZGxlL2NvbW1lbnQ6dmlldyI7aToxO3M6MjA6Im1vb2RsZS9jb21tdW5pdHk6YWRkIjtpOjE7czoyNToibW9vZGxlL2NvbW11bml0eTpkb3dubG9hZCI7aToxO3M6MzI6Im1vb2RsZS9jb3Vyc2U6YWN0aXZpdHl2aXNpYmlsaXR5IjtpOjE7czoyNzoibW9vZGxlL2NvdXJzZTpidWxrbWVzc2FnaW5nIjtpOjE7czoyODoibW9vZGxlL2NvdXJzZTpjaGFuZ2VjYXRlZ29yeSI7aToxO3M6Mjg6Im1vb2RsZS9jb3Vyc2U6Y2hhbmdlZnVsbG5hbWUiO2k6MTtzOjI4OiJtb29kbGUvY291cnNlOmNoYW5nZWlkbnVtYmVyIjtpOjE7czoyOToibW9vZGxlL2NvdXJzZTpjaGFuZ2VzaG9ydG5hbWUiO2k6MTtzOjI3OiJtb29kbGUvY291cnNlOmNoYW5nZXN1bW1hcnkiO2k6MTtzOjI1OiJtb29kbGUvY291cnNlOmVucm9sY29uZmlnIjtpOjE7czoyNToibW9vZGxlL2NvdXJzZTplbnJvbHJldmlldyI7aToxO3M6MzA6Im1vb2RsZS9jb3Vyc2U6bWFuYWdlYWN0aXZpdGllcyI7aToxO3M6MjU6Im1vb2RsZS9jb3Vyc2U6bWFuYWdlZmlsZXMiO2k6MTtzOjI2OiJtb29kbGUvY291cnNlOm1hbmFnZWdyb3VwcyI7aToxO3M6MjY6Im1vb2RsZS9jb3Vyc2U6bWFuYWdlc2NhbGVzIjtpOjE7czoyNjoibW9vZGxlL2NvdXJzZTptYXJrY29tcGxldGUiO2k6MTtzOjI2OiJtb29kbGUvY291cnNlOm1vdmVzZWN0aW9ucyI7aToxO3M6MTk6Im1vb2RsZS9jb3Vyc2U6cmVzZXQiO2k6MTtzOjMxOiJtb29kbGUvY291cnNlOnNlY3Rpb252aXNpYmlsaXR5IjtpOjE7czozMToibW9vZGxlL2NvdXJzZTpzZXRjdXJyZW50c2VjdGlvbiI7aToxO3M6MjA6Im1vb2RsZS9jb3Vyc2U6dXBkYXRlIjtpOjE7czoyMzoibW9vZGxlL2NvdXJzZTp1c2VyZW1haWwiO2k6MTtzOjM0OiJtb29kbGUvY291cnNlOnZpZXdoaWRkZW5hY3Rpdml0aWVzIjtpOjE7czozMToibW9vZGxlL2NvdXJzZTp2aWV3aGlkZGVuY291cnNlcyI7aToxO3M6MzI6Im1vb2RsZS9jb3Vyc2U6dmlld2hpZGRlbnNlY3Rpb25zIjtpOjE7czozNDoibW9vZGxlL2NvdXJzZTp2aWV3aGlkZGVudXNlcmZpZWxkcyI7aToxO3M6MzA6Im1vb2RsZS9jb3Vyc2U6dmlld3BhcnRpY2lwYW50cyI7aToxO3M6MjQ6Im1vb2RsZS9jb3Vyc2U6dmlld3NjYWxlcyI7aToxO3M6MjQ6Im1vb2RsZS9jb3Vyc2U6dmlzaWJpbGl0eSI7aToxO3M6MjA6Im1vb2RsZS9maWx0ZXI6bWFuYWdlIjtpOjE7czoxNzoibW9vZGxlL2dyYWRlOmVkaXQiO2k6MTtzOjE5OiJtb29kbGUvZ3JhZGU6ZXhwb3J0IjtpOjE7czoxNzoibW9vZGxlL2dyYWRlOmhpZGUiO2k6MTtzOjE5OiJtb29kbGUvZ3JhZGU6aW1wb3J0IjtpOjE7czoxNzoibW9vZGxlL2dyYWRlOmxvY2siO2k6MTtzOjE5OiJtb29kbGUvZ3JhZGU6bWFuYWdlIjtpOjE7czozMToibW9vZGxlL2dyYWRlOm1hbmFnZWdyYWRpbmdmb3JtcyI7aToxO3M6MjY6Im1vb2RsZS9ncmFkZTptYW5hZ2VsZXR0ZXJzIjtpOjE7czoyNzoibW9vZGxlL2dyYWRlOm1hbmFnZW91dGNvbWVzIjtpOjE7czoxOToibW9vZGxlL2dyYWRlOnVubG9jayI7aToxO3M6MjA6Im1vb2RsZS9ncmFkZTp2aWV3YWxsIjtpOjE7czoyMzoibW9vZGxlL2dyYWRlOnZpZXdoaWRkZW4iO2k6MTtzOjE5OiJtb29kbGUvbm90ZXM6bWFuYWdlIjtpOjE7czoxNzoibW9vZGxlL25vdGVzOnZpZXciO2k6MTtzOjIzOiJtb29kbGUvcG9ydGZvbGlvOmV4cG9ydCI7aToxO3M6MTk6Im1vb2RsZS9xdWVzdGlvbjphZGQiO2k6MTtzOjIzOiJtb29kbGUvcXVlc3Rpb246ZWRpdGFsbCI7aToxO3M6MjQ6Im1vb2RsZS9xdWVzdGlvbjplZGl0bWluZSI7aToxO3M6MjA6Im1vb2RsZS9xdWVzdGlvbjpmbGFnIjtpOjE7czozMDoibW9vZGxlL3F1ZXN0aW9uOm1hbmFnZWNhdGVnb3J5IjtpOjE7czoyMzoibW9vZGxlL3F1ZXN0aW9uOm1vdmVhbGwiO2k6MTtzOjI0OiJtb29kbGUvcXVlc3Rpb246bW92ZW1pbmUiO2k6MTtzOjIyOiJtb29kbGUvcXVlc3Rpb246dXNlYWxsIjtpOjE7czoyMzoibW9vZGxlL3F1ZXN0aW9uOnVzZW1pbmUiO2k6MTtzOjIzOiJtb29kbGUvcXVlc3Rpb246dmlld2FsbCI7aToxO3M6MjQ6Im1vb2RsZS9xdWVzdGlvbjp2aWV3bWluZSI7aToxO3M6MTg6Im1vb2RsZS9yYXRpbmc6cmF0ZSI7aToxO3M6MTg6Im1vb2RsZS9yYXRpbmc6dmlldyI7aToxO3M6MjE6Im1vb2RsZS9yYXRpbmc6dmlld2FsbCI7aToxO3M6MjE6Im1vb2RsZS9yYXRpbmc6dmlld2FueSI7aToxO3M6MjQ6Im1vb2RsZS9yZXN0b3JlOmNvbmZpZ3VyZSI7aToxO3M6MzA6Im1vb2RsZS9yZXN0b3JlOnJlc3RvcmVhY3Rpdml0eSI7aToxO3M6Mjg6Im1vb2RsZS9yZXN0b3JlOnJlc3RvcmVjb3Vyc2UiO2k6MTtzOjI5OiJtb29kbGUvcmVzdG9yZTpyZXN0b3Jlc2VjdGlvbiI7aToxO3M6MzE6Im1vb2RsZS9yZXN0b3JlOnJlc3RvcmV0YXJnZXRodWIiO2k6MTtzOjM0OiJtb29kbGUvcmVzdG9yZTpyZXN0b3JldGFyZ2V0aW1wb3J0IjtpOjE7czoyNToibW9vZGxlL3Jlc3RvcmU6dXBsb2FkZmlsZSI7aToxO3M6MTg6Im1vb2RsZS9yb2xlOmFzc2lnbiI7aToxO3M6MTg6Im1vb2RsZS9yb2xlOnJldmlldyI7aToxO3M6MjQ6Im1vb2RsZS9yb2xlOnNhZmVvdmVycmlkZSI7aToxO3M6MjM6Im1vb2RsZS9yb2xlOnN3aXRjaHJvbGVzIjtpOjE7czoyNzoibW9vZGxlL3NpdGU6YWNjZXNzYWxsZ3JvdXBzIjtpOjE7czoyMDoibW9vZGxlL3NpdGU6ZG9jbGlua3MiO2k6MTtzOjI0OiJtb29kbGUvc2l0ZTptYW5hZ2VibG9ja3MiO2k6MTtzOjI3OiJtb29kbGUvc2l0ZTpyZWFkYWxsbWVzc2FnZXMiO2k6MTtzOjI0OiJtb29kbGUvc2l0ZTp0cnVzdGNvbnRlbnQiO2k6MTtzOjI1OiJtb29kbGUvc2l0ZTp2aWV3ZnVsbG5hbWVzIjtpOjE7czoyMzoibW9vZGxlL3NpdGU6dmlld3JlcG9ydHMiO2k6MTtzOjI4OiJtb29kbGUvc2l0ZTp2aWV3dXNlcmlkZW50aXR5IjtpOjE7czoyMToibW9vZGxlL3RhZzplZGl0YmxvY2tzIjtpOjE7czoxNzoibW9vZGxlL3RhZzptYW5hZ2UiO2k6MTtzOjI1OiJtb29kbGUvdXNlcjpyZWFkdXNlcmJsb2dzIjtpOjE7czoyNToibW9vZGxlL3VzZXI6cmVhZHVzZXJwb3N0cyI7aToxO3M6MjM6Im1vb2RsZS91c2VyOnZpZXdkZXRhaWxzIjtpOjE7czoyOToibW9vZGxlL3VzZXI6dmlld2hpZGRlbmRldGFpbHMiO2k6MTtzOjI1OiJxdWl6L2dyYWRpbmc6dmlld2lkbnVtYmVyIjtpOjE7czoyOToicXVpei9ncmFkaW5nOnZpZXdzdHVkZW50bmFtZXMiO2k6MTtzOjIwOiJxdWl6L3N0YXRpc3RpY3M6dmlldyI7aToxO3M6MjI6InJlcG9ydC9jb21wbGV0aW9uOnZpZXciO2k6MTtzOjI2OiJyZXBvcnQvY291cnNlb3ZlcnZpZXc6dmlldyI7aToxO3M6MTU6InJlcG9ydC9sb2c6dmlldyI7aToxO3M6MjA6InJlcG9ydC9sb2c6dmlld3RvZGF5IjtpOjE7czoxOToicmVwb3J0L2xvZ2xpdmU6dmlldyI7aToxO3M6MTk6InJlcG9ydC9vdXRsaW5lOnZpZXciO2k6MTtzOjI1OiJyZXBvcnQvcGFydGljaXBhdGlvbjp2aWV3IjtpOjE7czoyMDoicmVwb3J0L3Byb2dyZXNzOnZpZXciO2k6MTtzOjE3OiJyZXBvcnQvc3RhdHM6dmlldyI7aToxO3M6Mjc6InJlcG9zaXRvcnkvY291cnNlZmlsZXM6dmlldyI7aToxO3M6MjY6InJlcG9zaXRvcnkvZmlsZXN5c3RlbTp2aWV3IjtpOjE7czoyMToicmVwb3NpdG9yeS9sb2NhbDp2aWV3IjtpOjE7czoyMjoicmVwb3NpdG9yeS93ZWJkYXY6dmlldyI7aToxO31zOjQ6Ii8xOjciO2E6Njk6e3M6MzU6ImJsb2NrL2FkbWluX2Jvb2ttYXJrczpteWFkZGluc3RhbmNlIjtpOjE7czozNDoiYmxvY2svY2FsZW5kYXJfbW9udGg6bXlhZGRpbnN0YW5jZSI7aToxO3M6Mzc6ImJsb2NrL2NhbGVuZGFyX3VwY29taW5nOm15YWRkaW5zdGFuY2UiO2k6MTtzOjI4OiJibG9jay9jb21tZW50czpteWFkZGluc3RhbmNlIjtpOjE7czoyOToiYmxvY2svY29tbXVuaXR5Om15YWRkaW5zdGFuY2UiO2k6MTtzOjMxOiJibG9jay9jb3Vyc2VfbGlzdDpteWFkZGluc3RhbmNlIjtpOjE7czozNToiYmxvY2svY291cnNlX292ZXJ2aWV3Om15YWRkaW5zdGFuY2UiO2k6MTtzOjM1OiJibG9jay9nbG9zc2FyeV9yYW5kb206bXlhZGRpbnN0YW5jZSI7aToxO3M6MjQ6ImJsb2NrL2h0bWw6bXlhZGRpbnN0YW5jZSI7aToxO3M6Mjc6ImJsb2NrL21lbnRlZXM6bXlhZGRpbnN0YW5jZSI7aToxO3M6Mjg6ImJsb2NrL21lc3NhZ2VzOm15YWRkaW5zdGFuY2UiO2k6MTtzOjMwOiJibG9jay9tbmV0X2hvc3RzOm15YWRkaW5zdGFuY2UiO2k6MTtzOjI5OiJibG9jay9teXByb2ZpbGU6bXlhZGRpbnN0YW5jZSI7aToxO3M6MzA6ImJsb2NrL25hdmlnYXRpb246bXlhZGRpbnN0YW5jZSI7aToxO3M6MzA6ImJsb2NrL25ld3NfaXRlbXM6bXlhZGRpbnN0YW5jZSI7aToxO3M6MzI6ImJsb2NrL29ubGluZV91c2VyczpteWFkZGluc3RhbmNlIjtpOjE7czoyNzoiYmxvY2svb25saW5lX3VzZXJzOnZpZXdsaXN0IjtpOjE7czozMzoiYmxvY2svcHJpdmF0ZV9maWxlczpteWFkZGluc3RhbmNlIjtpOjE7czozMDoiYmxvY2svcnNzX2NsaWVudDpteWFkZGluc3RhbmNlIjtpOjE7czoyODoiYmxvY2svc2V0dGluZ3M6bXlhZGRpbnN0YW5jZSI7aToxO3M6MjQ6ImJsb2NrL3RhZ3M6bXlhZGRpbnN0YW5jZSI7aToxO3M6MTU6Im1vZC9mb2xkZXI6dmlldyI7aToxO3M6MTQ6Im1vZC9pbXNjcDp2aWV3IjtpOjE7czoxMzoibW9kL3BhZ2U6dmlldyI7aToxO3M6MTc6Im1vZC9yZXNvdXJjZTp2aWV3IjtpOjE7czoxMjoibW9kL3VybDp2aWV3IjtpOjE7czoxNzoibW9vZGxlL2Jsb2NrOnZpZXciO2k6MTtzOjI3OiJtb29kbGUvYmxvZzphc3NvY2lhdGVjb3Vyc2UiO2k6MTtzOjI3OiJtb29kbGUvYmxvZzphc3NvY2lhdGVtb2R1bGUiO2k6MTtzOjE4OiJtb29kbGUvYmxvZzpjcmVhdGUiO2k6MTtzOjI2OiJtb29kbGUvYmxvZzptYW5hZ2VleHRlcm5hbCI7aToxO3M6MTg6Im1vb2RsZS9ibG9nOnNlYXJjaCI7aToxO3M6MTY6Im1vb2RsZS9ibG9nOnZpZXciO2k6MTtzOjMyOiJtb29kbGUvY2FsZW5kYXI6bWFuYWdlb3duZW50cmllcyI7aToxO3M6MTk6Im1vb2RsZS9jb21tZW50OnBvc3QiO2k6MTtzOjE5OiJtb29kbGUvY29tbWVudDp2aWV3IjtpOjE7czoyMToibW9vZGxlL2NvdXJzZTpyZXF1ZXN0IjtpOjE7czoyMjoibW9vZGxlL215Om1hbmFnZWJsb2NrcyI7aToxO3M6MjM6Im1vb2RsZS9wb3J0Zm9saW86ZXhwb3J0IjtpOjE7czoxODoibW9vZGxlL3JhdGluZzpyYXRlIjtpOjE7czoxODoibW9vZGxlL3JhdGluZzp2aWV3IjtpOjE7czoyMToibW9vZGxlL3JhdGluZzp2aWV3YWxsIjtpOjE7czoyMToibW9vZGxlL3JhdGluZzp2aWV3YW55IjtpOjE7czoyMzoibW9vZGxlL3NpdGU6c2VuZG1lc3NhZ2UiO2k6MTtzOjE3OiJtb29kbGUvdGFnOmNyZWF0ZSI7aToxO3M6MTU6Im1vb2RsZS90YWc6ZWRpdCI7aToxO3M6MTU6Im1vb2RsZS90YWc6ZmxhZyI7aToxO3M6Mjk6Im1vb2RsZS91c2VyOmNoYW5nZW93bnBhc3N3b3JkIjtpOjE7czozMzoibW9vZGxlL3VzZXI6ZWRpdG93bm1lc3NhZ2Vwcm9maWxlIjtpOjE7czoyNjoibW9vZGxlL3VzZXI6ZWRpdG93bnByb2ZpbGUiO2k6MTtzOjI3OiJtb29kbGUvdXNlcjptYW5hZ2Vvd25ibG9ja3MiO2k6MTtzOjI2OiJtb29kbGUvdXNlcjptYW5hZ2Vvd25maWxlcyI7aToxO3M6MzU6Im1vb2RsZS93ZWJzZXJ2aWNlOmNyZWF0ZW1vYmlsZXRva2VuIjtpOjE7czoyNDoicmVwb3NpdG9yeS9hbGZyZXNjbzp2aWV3IjtpOjE7czoyMjoicmVwb3NpdG9yeS9ib3huZXQ6dmlldyI7aToxO3M6MjM6InJlcG9zaXRvcnkvZHJvcGJveDp2aWV3IjtpOjE7czoyMzoicmVwb3NpdG9yeS9lcXVlbGxhOnZpZXciO2k6MTtzOjIyOiJyZXBvc2l0b3J5L2ZsaWNrcjp2aWV3IjtpOjE7czoyOToicmVwb3NpdG9yeS9mbGlja3JfcHVibGljOnZpZXciO2k6MTtzOjI2OiJyZXBvc2l0b3J5L2dvb2dsZWRvY3M6dmlldyI7aToxO3M6MjI6InJlcG9zaXRvcnkvbWVybG90OnZpZXciO2k6MTtzOjIyOiJyZXBvc2l0b3J5L3BpY2FzYTp2aWV3IjtpOjE7czoyMjoicmVwb3NpdG9yeS9yZWNlbnQ6dmlldyI7aToxO3M6MTg6InJlcG9zaXRvcnkvczM6dmlldyI7aToxO3M6MjI6InJlcG9zaXRvcnkvdXBsb2FkOnZpZXciO2k6MTtzOjE5OiJyZXBvc2l0b3J5L3VybDp2aWV3IjtpOjE7czoyMDoicmVwb3NpdG9yeS91c2VyOnZpZXciO2k6MTtzOjI1OiJyZXBvc2l0b3J5L3dpa2ltZWRpYTp2aWV3IjtpOjE7czoyMzoicmVwb3NpdG9yeS95b3V0dWJlOnZpZXciO2k6MTt9czo0OiIvMTo4IjthOjc6e3M6MjA6ImJvb2t0b29sL3ByaW50OnByaW50IjtpOjE7czoxMzoibW9kL2Jvb2s6cmVhZCI7aToxO3M6MTg6Im1vZC9kYXRhOnZpZXdlbnRyeSI7aToxO3M6Mjk6Im1vZC9mb3J1bTphbGxvd2ZvcmNlc3Vic2NyaWJlIjtpOjE7czoyNDoibW9kL2ZvcnVtOnZpZXdkaXNjdXNzaW9uIjtpOjE7czoxNzoibW9kL2dsb3NzYXJ5OnZpZXciO2k6MTtzOjE5OiJtb29kbGUvY29tbWVudDp2aWV3IjtpOjE7fX1zOjEwOiJyZGVmX2NvdW50IjtpOjM7czo4OiJyZGVmX2xjYyI7aTozO3M6NjoibG9hZGVkIjthOjI6e2k6MTtpOjE7aToyO2k6MTt9czo0OiJ0aW1lIjtpOjEzNjU1MzE2MTg7czozOiJyc3ciO2E6MDp7fX1zOjU6ImVucm9sIjthOjI6e3M6ODoiZW5yb2xsZWQiO2E6MTp7aToyO2k6MjE0NzQ4MzY0Nzt9czo5OiJ0ZW1wZ3Vlc3QiO2E6MDp7fX1zOjE3OiJtZXNzYWdlX2xhc3Rwb3B1cCI7aTowO3M6MjU6ImFqYXhfdXBkYXRhYmxlX3VzZXJfcHJlZnMiO2E6MTk6e3M6MjM6ImRvY2tlZF9ibG9ja19pbnN0YW5jZV8xIjtzOjM6ImludCI7czoyMzoiZG9ja2VkX2Jsb2NrX2luc3RhbmNlXzQiO3M6MzoiaW50IjtzOjIzOiJkb2NrZWRfYmxvY2tfaW5zdGFuY2VfNSI7czozOiJpbnQiO3M6MjM6ImRvY2tlZF9ibG9ja19pbnN0YW5jZV8zIjtzOjM6ImludCI7czoxMjoiYmxvY2s0aGlkZGVuIjtzOjQ6ImJvb2wiO3M6MTI6ImJsb2NrNWhpZGRlbiI7czo0OiJib29sIjtzOjEyOiJibG9jazNoaWRkZW4iO3M6NDoiYm9vbCI7czoyNDoiZG9ja2VkX2Jsb2NrX2luc3RhbmNlXzEwIjtzOjM6ImludCI7czoyNDoiZG9ja2VkX2Jsb2NrX2luc3RhbmNlXzExIjtzOjM6ImludCI7czoyNDoiZG9ja2VkX2Jsb2NrX2luc3RhbmNlXzEyIjtzOjM6ImludCI7czoyNDoiZG9ja2VkX2Jsb2NrX2luc3RhbmNlXzEzIjtzOjM6ImludCI7czoxMzoiYmxvY2sxMGhpZGRlbiI7czo0OiJib29sIjtzOjEzOiJibG9jazExaGlkZGVuIjtzOjQ6ImJvb2wiO3M6MTM6ImJsb2NrMTJoaWRkZW4iO3M6NDoiYm9vbCI7czoxMzoiYmxvY2sxM2hpZGRlbiI7czo0OiJib29sIjtzOjEzOiJ1c2Vtb2RjaG9vc2VyIjtzOjQ6ImJvb2wiO3M6Mjc6ImZpbGVwaWNrZXJfcmVjZW50cmVwb3NpdG9yeSI7czozOiJpbnQiO3M6MjQ6ImZpbGVwaWNrZXJfcmVjZW50bGljZW5zZSI7czo3OiJzYWZlZGlyIjtzOjI1OiJmaWxlcGlja2VyX3JlY2VudHZpZXdtb2RlIjtzOjM6ImludCI7fXM6NzoiZWRpdGluZyI7aToxO30=', 1365531617, 1365534274, '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:1'),
(9, 0, 'm20m1ed1gppk2ifkqh5mqsbro7', 2, 'VVNFUnxPOjg6InN0ZENsYXNzIjo1OTp7czoyOiJpZCI7czoxOiIyIjtzOjQ6ImF1dGgiO3M6NjoibWFudWFsIjtzOjk6ImNvbmZpcm1lZCI7czoxOiIxIjtzOjEyOiJwb2xpY3lhZ3JlZWQiO3M6MToiMCI7czo3OiJkZWxldGVkIjtzOjE6IjAiO3M6OToic3VzcGVuZGVkIjtzOjE6IjAiO3M6MTA6Im1uZXRob3N0aWQiO3M6MToiMSI7czo4OiJ1c2VybmFtZSI7czo1OiJhZG1pbiI7czo4OiJwYXNzd29yZCI7czozMjoiZTE0OGUzNmVjMmVmZjJlODQ3NjM1YWY5M2Q3YmQyMDUiO3M6ODoiaWRudW1iZXIiO3M6MDoiIjtzOjk6ImZpcnN0bmFtZSI7czo1OiJBZG1pbiI7czo4OiJsYXN0bmFtZSI7czo0OiJVc2VyIjtzOjU6ImVtYWlsIjtzOjE1OiJhZG1pbkBhZG1pbi5jb20iO3M6OToiZW1haWxzdG9wIjtzOjE6IjAiO3M6MzoiaWNxIjtzOjA6IiI7czo1OiJza3lwZSI7czowOiIiO3M6NToieWFob28iO3M6MDoiIjtzOjM6ImFpbSI7czowOiIiO3M6MzoibXNuIjtzOjA6IiI7czo2OiJwaG9uZTEiO3M6MDoiIjtzOjY6InBob25lMiI7czowOiIiO3M6MTE6Imluc3RpdHV0aW9uIjtzOjA6IiI7czoxMDoiZGVwYXJ0bWVudCI7czowOiIiO3M6NzoiYWRkcmVzcyI7czowOiIiO3M6NDoiY2l0eSI7czozOiJzc3MiO3M6NzoiY291bnRyeSI7czoyOiJBUSI7czo0OiJsYW5nIjtzOjI6ImVuIjtzOjU6InRoZW1lIjtzOjA6IiI7czo4OiJ0aW1lem9uZSI7czoyOiI5OSI7czoxMToiZmlyc3RhY2Nlc3MiO3M6MTA6IjEzNjU0NDk4ODMiO3M6MTA6Imxhc3RhY2Nlc3MiO2k6MTM2NTYyNjMyMjtzOjk6Imxhc3Rsb2dpbiI7czoxMDoiMTM2NTYwOTM1MyI7czoxMjoiY3VycmVudGxvZ2luIjtpOjEzNjU2MjA3ODE7czo2OiJsYXN0aXAiO3M6MTU6IjA6MDowOjA6MDowOjA6MSI7czo2OiJzZWNyZXQiO3M6MDoiIjtzOjc6InBpY3R1cmUiO3M6MToiMCI7czozOiJ1cmwiO3M6MDoiIjtzOjE3OiJkZXNjcmlwdGlvbmZvcm1hdCI7czoxOiIwIjtzOjEwOiJtYWlsZm9ybWF0IjtzOjE6IjEiO3M6MTA6Im1haWxkaWdlc3QiO3M6MToiMCI7czoxMToibWFpbGRpc3BsYXkiO3M6MToiMSI7czoxMDoiaHRtbGVkaXRvciI7czoxOiIxIjtzOjEzOiJhdXRvc3Vic2NyaWJlIjtzOjE6IjEiO3M6MTE6InRyYWNrZm9ydW1zIjtzOjE6IjAiO3M6MTE6InRpbWVjcmVhdGVkIjtzOjE6IjAiO3M6MTI6InRpbWVtb2RpZmllZCI7czoxMDoiMTM2NTQ0OTkzNyI7czoxMjoidHJ1c3RiaXRtYXNrIjtzOjE6IjAiO3M6ODoiaW1hZ2VhbHQiO047czoxNjoibGFzdGNvdXJzZWFjY2VzcyI7YToxOntpOjI7czoxMDoiMTM2NTYwOTM4MiI7fXM6MTk6ImN1cnJlbnRjb3Vyc2VhY2Nlc3MiO2E6NDp7aToyO2k6MTM2NTYyMjY0MDtpOjM7aToxMzY1NjI1NjQ5O2k6NDtpOjEzNjU2MjU1OTE7aTo1O2k6MTM2NTYyNjMyMjt9czoxMToiZ3JvdXBtZW1iZXIiO2E6MDp7fXM6NzoicHJvZmlsZSI7YToxOntzOjI6InQxIjtzOjA6IiI7fXM6Nzoic2Vzc2tleSI7czoxMDoid0NCUlpsMEhBVyI7czoxMDoicHJlZmVyZW5jZSI7YTozOntzOjE4OiJlbWFpbF9ib3VuY2VfY291bnQiO3M6MToiMSI7czoxNjoiZW1haWxfc2VuZF9jb3VudCI7czoxOiIxIjtzOjExOiJfbGFzdGxvYWRlZCI7aToxMzY1NjI2MzQ5O31zOjc6ImVkaXRpbmciO2k6MTtzOjE3OiJtZXNzYWdlX2xhc3Rwb3B1cCI7aTowO3M6MjU6ImFqYXhfdXBkYXRhYmxlX3VzZXJfcHJlZnMiO2E6NDY6e3M6MjM6ImRvY2tlZF9ibG9ja19pbnN0YW5jZV80IjtzOjM6ImludCI7czoyMzoiZG9ja2VkX2Jsb2NrX2luc3RhbmNlXzUiO3M6MzoiaW50IjtzOjI0OiJkb2NrZWRfYmxvY2tfaW5zdGFuY2VfMTAiO3M6MzoiaW50IjtzOjI0OiJkb2NrZWRfYmxvY2tfaW5zdGFuY2VfMTEiO3M6MzoiaW50IjtzOjI0OiJkb2NrZWRfYmxvY2tfaW5zdGFuY2VfMTIiO3M6MzoiaW50IjtzOjI0OiJkb2NrZWRfYmxvY2tfaW5zdGFuY2VfMTMiO3M6MzoiaW50IjtzOjEyOiJibG9jazRoaWRkZW4iO3M6NDoiYm9vbCI7czoxMjoiYmxvY2s1aGlkZGVuIjtzOjQ6ImJvb2wiO3M6MTM6ImJsb2NrMTBoaWRkZW4iO3M6NDoiYm9vbCI7czoxMzoiYmxvY2sxMWhpZGRlbiI7czo0OiJib29sIjtzOjEzOiJibG9jazEyaGlkZGVuIjtzOjQ6ImJvb2wiO3M6MTM6ImJsb2NrMTNoaWRkZW4iO3M6NDoiYm9vbCI7czoxMzoidXNlbW9kY2hvb3NlciI7czo0OiJib29sIjtzOjIzOiJkb2NrZWRfYmxvY2tfaW5zdGFuY2VfMSI7czozOiJpbnQiO3M6MjM6ImRvY2tlZF9ibG9ja19pbnN0YW5jZV8zIjtzOjM6ImludCI7czoxMjoiYmxvY2sxaGlkZGVuIjtzOjQ6ImJvb2wiO3M6MTI6ImJsb2NrM2hpZGRlbiI7czo0OiJib29sIjtzOjIzOiJkb2NrZWRfYmxvY2tfaW5zdGFuY2VfNiI7czozOiJpbnQiO3M6MTI6ImJsb2NrNmhpZGRlbiI7czo0OiJib29sIjtzOjI3OiJmaWxlcGlja2VyX3JlY2VudHJlcG9zaXRvcnkiO3M6MzoiaW50IjtzOjI0OiJmaWxlcGlja2VyX3JlY2VudGxpY2Vuc2UiO3M6Nzoic2FmZWRpciI7czoyNToiZmlsZXBpY2tlcl9yZWNlbnR2aWV3bW9kZSI7czozOiJpbnQiO3M6MjQ6ImRvY2tlZF9ibG9ja19pbnN0YW5jZV8xNCI7czozOiJpbnQiO3M6MjQ6ImRvY2tlZF9ibG9ja19pbnN0YW5jZV8xNSI7czozOiJpbnQiO3M6MjQ6ImRvY2tlZF9ibG9ja19pbnN0YW5jZV8xNiI7czozOiJpbnQiO3M6MjQ6ImRvY2tlZF9ibG9ja19pbnN0YW5jZV8xNyI7czozOiJpbnQiO3M6MTM6ImJsb2NrMTRoaWRkZW4iO3M6NDoiYm9vbCI7czoxMzoiYmxvY2sxNWhpZGRlbiI7czo0OiJib29sIjtzOjEzOiJibG9jazE2aGlkZGVuIjtzOjQ6ImJvb2wiO3M6MTM6ImJsb2NrMTdoaWRkZW4iO3M6NDoiYm9vbCI7czoyNDoiZG9ja2VkX2Jsb2NrX2luc3RhbmNlXzE4IjtzOjM6ImludCI7czoyNDoiZG9ja2VkX2Jsb2NrX2luc3RhbmNlXzE5IjtzOjM6ImludCI7czoyNDoiZG9ja2VkX2Jsb2NrX2luc3RhbmNlXzIwIjtzOjM6ImludCI7czoyNDoiZG9ja2VkX2Jsb2NrX2luc3RhbmNlXzIxIjtzOjM6ImludCI7czoxMzoiYmxvY2sxOGhpZGRlbiI7czo0OiJib29sIjtzOjEzOiJibG9jazE5aGlkZGVuIjtzOjQ6ImJvb2wiO3M6MTM6ImJsb2NrMjBoaWRkZW4iO3M6NDoiYm9vbCI7czoxMzoiYmxvY2syMWhpZGRlbiI7czo0OiJib29sIjtzOjI0OiJkb2NrZWRfYmxvY2tfaW5zdGFuY2VfMjIiO3M6MzoiaW50IjtzOjI0OiJkb2NrZWRfYmxvY2tfaW5zdGFuY2VfMjMiO3M6MzoiaW50IjtzOjI0OiJkb2NrZWRfYmxvY2tfaW5zdGFuY2VfMjQiO3M6MzoiaW50IjtzOjI0OiJkb2NrZWRfYmxvY2tfaW5zdGFuY2VfMjUiO3M6MzoiaW50IjtzOjEzOiJibG9jazIyaGlkZGVuIjtzOjQ6ImJvb2wiO3M6MTM6ImJsb2NrMjNoaWRkZW4iO3M6NDoiYm9vbCI7czoxMzoiYmxvY2syNGhpZGRlbiI7czo0OiJib29sIjtzOjEzOiJibG9jazI1aGlkZGVuIjtzOjQ6ImJvb2wiO31zOjU6ImVucm9sIjthOjI6e3M6ODoiZW5yb2xsZWQiO2E6MDp7fXM6OToidGVtcGd1ZXN0IjthOjA6e319czo2OiJhY2Nlc3MiO2E6Nzp7czoyOiJyYSI7YToyOntzOjI6Ii8xIjthOjE6e2k6NztpOjc7fXM6NDoiLzEvMiI7YToxOntpOjg7aTo4O319czo0OiJyZGVmIjthOjI6e3M6NDoiLzE6NyI7YTo2OTp7czozNToiYmxvY2svYWRtaW5fYm9va21hcmtzOm15YWRkaW5zdGFuY2UiO2k6MTtzOjM0OiJibG9jay9jYWxlbmRhcl9tb250aDpteWFkZGluc3RhbmNlIjtpOjE7czozNzoiYmxvY2svY2FsZW5kYXJfdXBjb21pbmc6bXlhZGRpbnN0YW5jZSI7aToxO3M6Mjg6ImJsb2NrL2NvbW1lbnRzOm15YWRkaW5zdGFuY2UiO2k6MTtzOjI5OiJibG9jay9jb21tdW5pdHk6bXlhZGRpbnN0YW5jZSI7aToxO3M6MzE6ImJsb2NrL2NvdXJzZV9saXN0Om15YWRkaW5zdGFuY2UiO2k6MTtzOjM1OiJibG9jay9jb3Vyc2Vfb3ZlcnZpZXc6bXlhZGRpbnN0YW5jZSI7aToxO3M6MzU6ImJsb2NrL2dsb3NzYXJ5X3JhbmRvbTpteWFkZGluc3RhbmNlIjtpOjE7czoyNDoiYmxvY2svaHRtbDpteWFkZGluc3RhbmNlIjtpOjE7czoyNzoiYmxvY2svbWVudGVlczpteWFkZGluc3RhbmNlIjtpOjE7czoyODoiYmxvY2svbWVzc2FnZXM6bXlhZGRpbnN0YW5jZSI7aToxO3M6MzA6ImJsb2NrL21uZXRfaG9zdHM6bXlhZGRpbnN0YW5jZSI7aToxO3M6Mjk6ImJsb2NrL215cHJvZmlsZTpteWFkZGluc3RhbmNlIjtpOjE7czozMDoiYmxvY2svbmF2aWdhdGlvbjpteWFkZGluc3RhbmNlIjtpOjE7czozMDoiYmxvY2svbmV3c19pdGVtczpteWFkZGluc3RhbmNlIjtpOjE7czozMjoiYmxvY2svb25saW5lX3VzZXJzOm15YWRkaW5zdGFuY2UiO2k6MTtzOjI3OiJibG9jay9vbmxpbmVfdXNlcnM6dmlld2xpc3QiO2k6MTtzOjMzOiJibG9jay9wcml2YXRlX2ZpbGVzOm15YWRkaW5zdGFuY2UiO2k6MTtzOjMwOiJibG9jay9yc3NfY2xpZW50Om15YWRkaW5zdGFuY2UiO2k6MTtzOjI4OiJibG9jay9zZXR0aW5nczpteWFkZGluc3RhbmNlIjtpOjE7czoyNDoiYmxvY2svdGFnczpteWFkZGluc3RhbmNlIjtpOjE7czoxNToibW9kL2ZvbGRlcjp2aWV3IjtpOjE7czoxNDoibW9kL2ltc2NwOnZpZXciO2k6MTtzOjEzOiJtb2QvcGFnZTp2aWV3IjtpOjE7czoxNzoibW9kL3Jlc291cmNlOnZpZXciO2k6MTtzOjEyOiJtb2QvdXJsOnZpZXciO2k6MTtzOjE3OiJtb29kbGUvYmxvY2s6dmlldyI7aToxO3M6Mjc6Im1vb2RsZS9ibG9nOmFzc29jaWF0ZWNvdXJzZSI7aToxO3M6Mjc6Im1vb2RsZS9ibG9nOmFzc29jaWF0ZW1vZHVsZSI7aToxO3M6MTg6Im1vb2RsZS9ibG9nOmNyZWF0ZSI7aToxO3M6MjY6Im1vb2RsZS9ibG9nOm1hbmFnZWV4dGVybmFsIjtpOjE7czoxODoibW9vZGxlL2Jsb2c6c2VhcmNoIjtpOjE7czoxNjoibW9vZGxlL2Jsb2c6dmlldyI7aToxO3M6MzI6Im1vb2RsZS9jYWxlbmRhcjptYW5hZ2Vvd25lbnRyaWVzIjtpOjE7czoxOToibW9vZGxlL2NvbW1lbnQ6cG9zdCI7aToxO3M6MTk6Im1vb2RsZS9jb21tZW50OnZpZXciO2k6MTtzOjIxOiJtb29kbGUvY291cnNlOnJlcXVlc3QiO2k6MTtzOjIyOiJtb29kbGUvbXk6bWFuYWdlYmxvY2tzIjtpOjE7czoyMzoibW9vZGxlL3BvcnRmb2xpbzpleHBvcnQiO2k6MTtzOjE4OiJtb29kbGUvcmF0aW5nOnJhdGUiO2k6MTtzOjE4OiJtb29kbGUvcmF0aW5nOnZpZXciO2k6MTtzOjIxOiJtb29kbGUvcmF0aW5nOnZpZXdhbGwiO2k6MTtzOjIxOiJtb29kbGUvcmF0aW5nOnZpZXdhbnkiO2k6MTtzOjIzOiJtb29kbGUvc2l0ZTpzZW5kbWVzc2FnZSI7aToxO3M6MTc6Im1vb2RsZS90YWc6Y3JlYXRlIjtpOjE7czoxNToibW9vZGxlL3RhZzplZGl0IjtpOjE7czoxNToibW9vZGxlL3RhZzpmbGFnIjtpOjE7czoyOToibW9vZGxlL3VzZXI6Y2hhbmdlb3ducGFzc3dvcmQiO2k6MTtzOjMzOiJtb29kbGUvdXNlcjplZGl0b3dubWVzc2FnZXByb2ZpbGUiO2k6MTtzOjI2OiJtb29kbGUvdXNlcjplZGl0b3ducHJvZmlsZSI7aToxO3M6Mjc6Im1vb2RsZS91c2VyOm1hbmFnZW93bmJsb2NrcyI7aToxO3M6MjY6Im1vb2RsZS91c2VyOm1hbmFnZW93bmZpbGVzIjtpOjE7czozNToibW9vZGxlL3dlYnNlcnZpY2U6Y3JlYXRlbW9iaWxldG9rZW4iO2k6MTtzOjI0OiJyZXBvc2l0b3J5L2FsZnJlc2NvOnZpZXciO2k6MTtzOjIyOiJyZXBvc2l0b3J5L2JveG5ldDp2aWV3IjtpOjE7czoyMzoicmVwb3NpdG9yeS9kcm9wYm94OnZpZXciO2k6MTtzOjIzOiJyZXBvc2l0b3J5L2VxdWVsbGE6dmlldyI7aToxO3M6MjI6InJlcG9zaXRvcnkvZmxpY2tyOnZpZXciO2k6MTtzOjI5OiJyZXBvc2l0b3J5L2ZsaWNrcl9wdWJsaWM6dmlldyI7aToxO3M6MjY6InJlcG9zaXRvcnkvZ29vZ2xlZG9jczp2aWV3IjtpOjE7czoyMjoicmVwb3NpdG9yeS9tZXJsb3Q6dmlldyI7aToxO3M6MjI6InJlcG9zaXRvcnkvcGljYXNhOnZpZXciO2k6MTtzOjIyOiJyZXBvc2l0b3J5L3JlY2VudDp2aWV3IjtpOjE7czoxODoicmVwb3NpdG9yeS9zMzp2aWV3IjtpOjE7czoyMjoicmVwb3NpdG9yeS91cGxvYWQ6dmlldyI7aToxO3M6MTk6InJlcG9zaXRvcnkvdXJsOnZpZXciO2k6MTtzOjIwOiJyZXBvc2l0b3J5L3VzZXI6dmlldyI7aToxO3M6MjU6InJlcG9zaXRvcnkvd2lraW1lZGlhOnZpZXciO2k6MTtzOjIzOiJyZXBvc2l0b3J5L3lvdXR1YmU6dmlldyI7aToxO31zOjQ6Ii8xOjgiO2E6Nzp7czoyMDoiYm9va3Rvb2wvcHJpbnQ6cHJpbnQiO2k6MTtzOjEzOiJtb2QvYm9vazpyZWFkIjtpOjE7czoxODoibW9kL2RhdGE6dmlld2VudHJ5IjtpOjE7czoyOToibW9kL2ZvcnVtOmFsbG93Zm9yY2VzdWJzY3JpYmUiO2k6MTtzOjI0OiJtb2QvZm9ydW06dmlld2Rpc2N1c3Npb24iO2k6MTtzOjE3OiJtb2QvZ2xvc3Nhcnk6dmlldyI7aToxO3M6MTk6Im1vb2RsZS9jb21tZW50OnZpZXciO2k6MTt9fXM6MTA6InJkZWZfY291bnQiO2k6MjtzOjg6InJkZWZfbGNjIjtpOjI7czo2OiJsb2FkZWQiO2E6MDp7fXM6NDoidGltZSI7aToxMzY1NjI1ODA1O3M6MzoicnN3IjthOjA6e319fVNFU1NJT058Tzo4OiJzdGRDbGFzcyI6ODp7czoxMDoibG9naW5jb3VudCI7aTowO3M6MTQ6ImZyb21kaXNjdXNzaW9uIjtzOjQ3OiJodHRwOi8vbG9jYWxob3N0L21vb2RsZTI0My9jb3Vyc2Uvdmlldy5waHA/aWQ9NSI7czoyMjoiYWRtaW5fY3JpdGljYWxfd2FybmluZyI7aTowO3M6MjE6ImxvYWRfbmF2aWdhdGlvbl9hZG1pbiI7YjoxO3M6MjE6ImNhbGVuZGFyc2hvd2V2ZW50dHlwZSI7aToxNTtzOjE0OiJhdHRzZXNzaW9udHlwZSI7YTo0OntpOjI7aTotMTtpOjQ7aTotMTtpOjM7aTotMTtpOjU7aTotMTt9czoxNzoiYXR0Y3VycmVudGF0dHZpZXciO2E6MTp7aTozO2k6NTt9czo4OiJuYXZjYWNoZSI7Tzo4OiJzdGRDbGFzcyI6MTp7czoxMDoibmF2aWdhdGlvbiI7YTozOntzOjE2OiJ1c2VyYmxvZ29wdGlvbnMyIjthOjM6e2k6MDtpOjEzNjU2MjYyODk7aToxO3M6MToiMiI7aToyO3M6NzAzOiJhOjI6e3M6NDoidmlldyI7YToyOntzOjY6InN0cmluZyI7czoyMjoiVmlldyBhbGwgb2YgbXkgZW50cmllcyI7czo0OiJsaW5rIjtPOjEwOiJtb29kbGVfdXJsIjo5OntzOjk6IgAqAHNjaGVtZSI7czo0OiJodHRwIjtzOjc6IgAqAGhvc3QiO3M6OToibG9jYWxob3N0IjtzOjc6IgAqAHBvcnQiO3M6MDoiIjtzOjc6IgAqAHVzZXIiO3M6MDoiIjtzOjc6IgAqAHBhc3MiO3M6MDoiIjtzOjc6IgAqAHBhdGgiO3M6MjU6Ii9tb29kbGUyNDMvYmxvZy9pbmRleC5waHAiO3M6MTY6IgAqAHNsYXNoYXJndW1lbnQiO3M6MDoiIjtzOjk6IgAqAGFuY2hvciI7TjtzOjk6IgAqAHBhcmFtcyI7YToxOntzOjY6InVzZXJpZCI7czoxOiIyIjt9fX1zOjM6ImFkZCI7YToyOntzOjY6InN0cmluZyI7czoxNToiQWRkIGEgbmV3IGVudHJ5IjtzOjQ6ImxpbmsiO086MTA6Im1vb2RsZV91cmwiOjk6e3M6OToiACoAc2NoZW1lIjtzOjQ6Imh0dHAiO3M6NzoiACoAaG9zdCI7czo5OiJsb2NhbGhvc3QiO3M6NzoiACoAcG9ydCI7czowOiIiO3M6NzoiACoAdXNlciI7czowOiIiO3M6NzoiACoAcGFzcyI7czowOiIiO3M6NzoiACoAcGF0aCI7czoyNDoiL21vb2RsZTI0My9ibG9nL2VkaXQucGhwIjtzOjE2OiIAKgBzbGFzaGFyZ3VtZW50IjtzOjA6IiI7czo5OiIAKgBhbmNob3IiO047czo5OiIAKgBwYXJhbXMiO2E6MTp7czo2OiJhY3Rpb24iO3M6MzoiYWRkIjt9fX19Ijt9czoxNjoiY29udGV4dGhhc3JlcG9zNSI7YTozOntpOjA7aToxMzY1NjI2Mjg5O2k6MTtzOjE6IjIiO2k6MjtzOjQ6ImI6MDsiO31zOjE3OiJjb250ZXh0aGFzcmVwb3M0MyI7YTozOntpOjA7aToxMzY1NjI2Mjg5O2k6MTtzOjE6IjIiO2k6MjtzOjQ6ImI6MDsiO319fX0=', 1365620781, 1365626353, '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:1');
INSERT INTO `mdl_sessions` (`id`, `state`, `sid`, `userid`, `sessdata`, `timecreated`, `timemodified`, `firstip`, `lastip`) VALUES
(11, 0, 'hpr8lmjt00aa80j0kk7mibp257', 2, 'U0VTU0lPTnxPOjg6InN0ZENsYXNzIjo4OntzOjIxOiJjYWxlbmRhcnNob3dldmVudHR5cGUiO2k6MTU7czoxMDoibG9naW5jb3VudCI7aTowO3M6MjI6ImFkbWluX2NyaXRpY2FsX3dhcm5pbmciO2k6MDtzOjIxOiJsb2FkX25hdmlnYXRpb25fYWRtaW4iO2I6MTtzOjE0OiJmcm9tZGlzY3Vzc2lvbiI7czo0MjoiaHR0cDovL2xvY2FsaG9zdC9tMTIzL2NvdXJzZS92aWV3LnBocD9pZD02IjtzOjE0OiJhdHRzZXNzaW9udHlwZSI7YToyOntpOjU7aTotMTtpOjY7aTotMTt9czoxNzoiYXR0Y3VycmVudGF0dHZpZXciO2E6MTp7aTo1O2k6NTt9czo4OiJuYXZjYWNoZSI7Tzo4OiJzdGRDbGFzcyI6MTp7czoxMDoibmF2aWdhdGlvbiI7YTo0OntzOjE2OiJ1c2VyYmxvZ29wdGlvbnMyIjthOjM6e2k6MDtpOjEzNjU2NTQzMzg7aToxO3M6MToiMiI7aToyO3M6NjkzOiJhOjI6e3M6NDoidmlldyI7YToyOntzOjY6InN0cmluZyI7czoyMjoiVmlldyBhbGwgb2YgbXkgZW50cmllcyI7czo0OiJsaW5rIjtPOjEwOiJtb29kbGVfdXJsIjo5OntzOjk6IgAqAHNjaGVtZSI7czo0OiJodHRwIjtzOjc6IgAqAGhvc3QiO3M6OToibG9jYWxob3N0IjtzOjc6IgAqAHBvcnQiO3M6MDoiIjtzOjc6IgAqAHVzZXIiO3M6MDoiIjtzOjc6IgAqAHBhc3MiO3M6MDoiIjtzOjc6IgAqAHBhdGgiO3M6MjA6Ii9tMTIzL2Jsb2cvaW5kZXgucGhwIjtzOjE2OiIAKgBzbGFzaGFyZ3VtZW50IjtzOjA6IiI7czo5OiIAKgBhbmNob3IiO047czo5OiIAKgBwYXJhbXMiO2E6MTp7czo2OiJ1c2VyaWQiO3M6MToiMiI7fX19czozOiJhZGQiO2E6Mjp7czo2OiJzdHJpbmciO3M6MTU6IkFkZCBhIG5ldyBlbnRyeSI7czo0OiJsaW5rIjtPOjEwOiJtb29kbGVfdXJsIjo5OntzOjk6IgAqAHNjaGVtZSI7czo0OiJodHRwIjtzOjc6IgAqAGhvc3QiO3M6OToibG9jYWxob3N0IjtzOjc6IgAqAHBvcnQiO3M6MDoiIjtzOjc6IgAqAHVzZXIiO3M6MDoiIjtzOjc6IgAqAHBhc3MiO3M6MDoiIjtzOjc6IgAqAHBhdGgiO3M6MTk6Ii9tMTIzL2Jsb2cvZWRpdC5waHAiO3M6MTY6IgAqAHNsYXNoYXJndW1lbnQiO3M6MDoiIjtzOjk6IgAqAGFuY2hvciI7TjtzOjk6IgAqAHBhcmFtcyI7YToxOntzOjY6ImFjdGlvbiI7czozOiJhZGQiO319fX0iO31zOjE2OiJjb250ZXh0aGFzcmVwb3M1IjthOjM6e2k6MDtpOjEzNjU2NTQzMzg7aToxO3M6MToiMiI7aToyO3M6NDoiYjowOyI7fXM6MTc6ImNvbnRleHRoYXNyZXBvczUzIjthOjM6e2k6MDtpOjEzNjU2NTQzMzg7aToxO3M6MToiMiI7aToyO3M6NDoiYjowOyI7fXM6MTc6ImNvbnRleHRoYXNyZXBvczQzIjthOjM6e2k6MDtpOjEzNjU2NTQzNTQ7aToxO3M6MToiMiI7aToyO3M6NDoiYjowOyI7fX19fVVTRVJ8Tzo4OiJzdGRDbGFzcyI6NTk6e3M6MjoiaWQiO3M6MToiMiI7czo0OiJhdXRoIjtzOjY6Im1hbnVhbCI7czo5OiJjb25maXJtZWQiO3M6MToiMSI7czoxMjoicG9saWN5YWdyZWVkIjtzOjE6IjAiO3M6NzoiZGVsZXRlZCI7czoxOiIwIjtzOjk6InN1c3BlbmRlZCI7czoxOiIwIjtzOjEwOiJtbmV0aG9zdGlkIjtzOjE6IjEiO3M6ODoidXNlcm5hbWUiO3M6NjoiYWRtaW4xIjtzOjg6InBhc3N3b3JkIjtzOjMyOiI5OGRkMmI3MDdjYzNlZjJkYmMyZjk4Mjg1YmIzNzExNCI7czo4OiJpZG51bWJlciI7czowOiIiO3M6OToiZmlyc3RuYW1lIjtzOjU6IkFkbWluIjtzOjg6Imxhc3RuYW1lIjtzOjQ6IlVzZXIiO3M6NToiZW1haWwiO3M6MjU6InN1ZGhhbnNodS52ZXJtYUBnbWFpbC5jb20iO3M6OToiZW1haWxzdG9wIjtzOjE6IjAiO3M6MzoiaWNxIjtzOjA6IiI7czo1OiJza3lwZSI7czowOiIiO3M6NToieWFob28iO3M6MDoiIjtzOjM6ImFpbSI7czowOiIiO3M6MzoibXNuIjtzOjA6IiI7czo2OiJwaG9uZTEiO3M6MDoiIjtzOjY6InBob25lMiI7czowOiIiO3M6MTE6Imluc3RpdHV0aW9uIjtzOjA6IiI7czoxMDoiZGVwYXJ0bWVudCI7czowOiIiO3M6NzoiYWRkcmVzcyI7czowOiIiO3M6NDoiY2l0eSI7czo5OiJOZXcgRGVsaGkiO3M6NzoiY291bnRyeSI7czoyOiJJTiI7czo0OiJsYW5nIjtzOjI6ImVuIjtzOjU6InRoZW1lIjtzOjA6IiI7czo4OiJ0aW1lem9uZSI7czoyOiI5OSI7czoxMToiZmlyc3RhY2Nlc3MiO3M6MTA6IjEzNjI4NTMwMTEiO3M6MTA6Imxhc3RhY2Nlc3MiO2k6MTM2NTY1NDUwMTtzOjk6Imxhc3Rsb2dpbiI7czoxMDoiMTM2NTIyMTY4MyI7czoxMjoiY3VycmVudGxvZ2luIjtpOjEzNjU2NTM5MTk7czo2OiJsYXN0aXAiO3M6OToiMTI3LjAuMC4xIjtzOjY6InNlY3JldCI7czowOiIiO3M6NzoicGljdHVyZSI7czoxOiIwIjtzOjM6InVybCI7czowOiIiO3M6MTc6ImRlc2NyaXB0aW9uZm9ybWF0IjtzOjE6IjAiO3M6MTA6Im1haWxmb3JtYXQiO3M6MToiMSI7czoxMDoibWFpbGRpZ2VzdCI7czoxOiIwIjtzOjExOiJtYWlsZGlzcGxheSI7czoxOiIxIjtzOjEwOiJodG1sZWRpdG9yIjtzOjE6IjEiO3M6MTM6ImF1dG9zdWJzY3JpYmUiO3M6MToiMSI7czoxMToidHJhY2tmb3J1bXMiO3M6MToiMCI7czoxMToidGltZWNyZWF0ZWQiO3M6MToiMCI7czoxMjoidGltZW1vZGlmaWVkIjtzOjEwOiIxMzYyODUzOTU0IjtzOjEyOiJ0cnVzdGJpdG1hc2siO3M6MToiMCI7czo4OiJpbWFnZWFsdCI7czowOiIiO3M6MTY6Imxhc3Rjb3Vyc2VhY2Nlc3MiO2E6MTp7aTo1O3M6MTA6IjEzNjU2MjYzMjIiO31zOjE5OiJjdXJyZW50Y291cnNlYWNjZXNzIjthOjI6e2k6NTtpOjEzNjU2NTQ0Mjc7aTo2O2k6MTM2NTY1NDQ0Njt9czoxMToiZ3JvdXBtZW1iZXIiO2E6MDp7fXM6NzoicHJvZmlsZSI7YToyMTp7czo2OiJnZW5kZXIiO3M6NDoiTWFsZSI7czozOiJkb2IiO3M6MToiMCI7czo1OiJDYXN0ZSI7czowOiIiO3M6ODoicmVsaWdpb24iO3M6MDoiIjtzOjc6ImNvbnRhY3QiO3M6MDoiIjtzOjY6ImZhdGhlciI7czowOiIiO3M6NzoicG9zdGluZyI7czowOiIiO3M6ODoiZGlzdHJpY3QiO3M6MDoiIjtzOjc6InBpbmNvZGUiO3M6MDoiIjtzOjEyOiJob3NwaXRhbG5hbWUiO3M6MDoiIjtzOjEyOiJob3NwaXRhbGNpdHkiO3M6MDoiIjtzOjE2OiJob3NwaXRhbGRpc3RyaWN0IjtzOjA6IiI7czoxMzoiaG9zcGl0YWxzdGF0ZSI7czowOiIiO3M6MjM6ImNvbnRhY3RwZXJzb25vZmhvc3BpdGFsIjtzOjA6IiI7czoyOToiY29udGFjdHBlcnNvbm51bWJlcmluaG9zcGl0YWwiO3M6MDoiIjtzOjU6InN0YXRlIjtzOjA6IiI7czoxMToiam9pbmluZ2RhdGUiO3M6MToiMCI7czo3OiJiYXRjaG5vIjtzOjA6IiI7czo5OiJiYXRjaGlkbm8iO3M6MDoiIjtzOjk6InBlcm1hbmVudCI7czowOiIiO3M6OToicGVybWFjaXR5IjtzOjA6IiI7fXM6Nzoic2Vzc2tleSI7czoxMDoiYklaSHl5NzFaZiI7czoxMDoicHJlZmVyZW5jZSI7YTozOntzOjE4OiJlbWFpbF9ib3VuY2VfY291bnQiO3M6MToiMSI7czoxNjoiZW1haWxfc2VuZF9jb3VudCI7czoxOiIxIjtzOjExOiJfbGFzdGxvYWRlZCI7aToxMzY1NjU0NTAxO31zOjE3OiJtZXNzYWdlX2xhc3Rwb3B1cCI7aTowO3M6MjU6ImFqYXhfdXBkYXRhYmxlX3VzZXJfcHJlZnMiO2E6Mjk6e3M6MjM6ImRvY2tlZF9ibG9ja19pbnN0YW5jZV8xIjtzOjM6ImludCI7czoyMzoiZG9ja2VkX2Jsb2NrX2luc3RhbmNlXzQiO3M6MzoiaW50IjtzOjIzOiJkb2NrZWRfYmxvY2tfaW5zdGFuY2VfNSI7czozOiJpbnQiO3M6MjM6ImRvY2tlZF9ibG9ja19pbnN0YW5jZV8zIjtzOjM6ImludCI7czoxMjoiYmxvY2s0aGlkZGVuIjtzOjQ6ImJvb2wiO3M6MTI6ImJsb2NrNWhpZGRlbiI7czo0OiJib29sIjtzOjEyOiJibG9jazNoaWRkZW4iO3M6NDoiYm9vbCI7czoyNDoiZG9ja2VkX2Jsb2NrX2luc3RhbmNlXzIyIjtzOjM6ImludCI7czoyNDoiZG9ja2VkX2Jsb2NrX2luc3RhbmNlXzIzIjtzOjM6ImludCI7czoyNDoiZG9ja2VkX2Jsb2NrX2luc3RhbmNlXzI0IjtzOjM6ImludCI7czoyNDoiZG9ja2VkX2Jsb2NrX2luc3RhbmNlXzI1IjtzOjM6ImludCI7czoxMzoiYmxvY2syMmhpZGRlbiI7czo0OiJib29sIjtzOjEzOiJibG9jazIzaGlkZGVuIjtzOjQ6ImJvb2wiO3M6MTM6ImJsb2NrMjRoaWRkZW4iO3M6NDoiYm9vbCI7czoxMzoiYmxvY2syNWhpZGRlbiI7czo0OiJib29sIjtzOjEzOiJ1c2Vtb2RjaG9vc2VyIjtzOjQ6ImJvb2wiO3M6MjM6ImRvY2tlZF9ibG9ja19pbnN0YW5jZV82IjtzOjM6ImludCI7czoxMjoiYmxvY2s2aGlkZGVuIjtzOjQ6ImJvb2wiO3M6Mjc6ImZpbGVwaWNrZXJfcmVjZW50cmVwb3NpdG9yeSI7czozOiJpbnQiO3M6MjQ6ImZpbGVwaWNrZXJfcmVjZW50bGljZW5zZSI7czo3OiJzYWZlZGlyIjtzOjI1OiJmaWxlcGlja2VyX3JlY2VudHZpZXdtb2RlIjtzOjM6ImludCI7czoyNDoiZG9ja2VkX2Jsb2NrX2luc3RhbmNlXzI2IjtzOjM6ImludCI7czoyNDoiZG9ja2VkX2Jsb2NrX2luc3RhbmNlXzI3IjtzOjM6ImludCI7czoyNDoiZG9ja2VkX2Jsb2NrX2luc3RhbmNlXzI4IjtzOjM6ImludCI7czoyNDoiZG9ja2VkX2Jsb2NrX2luc3RhbmNlXzI5IjtzOjM6ImludCI7czoxMzoiYmxvY2syNmhpZGRlbiI7czo0OiJib29sIjtzOjEzOiJibG9jazI3aGlkZGVuIjtzOjQ6ImJvb2wiO3M6MTM6ImJsb2NrMjhoaWRkZW4iO3M6NDoiYm9vbCI7czoxMzoiYmxvY2syOWhpZGRlbiI7czo0OiJib29sIjt9czo3OiJlZGl0aW5nIjtpOjE7czo1OiJlbnJvbCI7YToyOntzOjg6ImVucm9sbGVkIjthOjA6e31zOjk6InRlbXBndWVzdCI7YTowOnt9fXM6NjoiYWNjZXNzIjthOjc6e3M6MjoicmEiO2E6Mjp7czoyOiIvMSI7YToxOntpOjc7aTo3O31zOjQ6Ii8xLzIiO2E6MTp7aTo4O2k6ODt9fXM6NDoicmRlZiI7YToyOntzOjQ6Ii8xOjciO2E6Njk6e3M6MzU6ImJsb2NrL2FkbWluX2Jvb2ttYXJrczpteWFkZGluc3RhbmNlIjtpOjE7czozNDoiYmxvY2svY2FsZW5kYXJfbW9udGg6bXlhZGRpbnN0YW5jZSI7aToxO3M6Mzc6ImJsb2NrL2NhbGVuZGFyX3VwY29taW5nOm15YWRkaW5zdGFuY2UiO2k6MTtzOjI4OiJibG9jay9jb21tZW50czpteWFkZGluc3RhbmNlIjtpOjE7czoyOToiYmxvY2svY29tbXVuaXR5Om15YWRkaW5zdGFuY2UiO2k6MTtzOjMxOiJibG9jay9jb3Vyc2VfbGlzdDpteWFkZGluc3RhbmNlIjtpOjE7czozNToiYmxvY2svY291cnNlX292ZXJ2aWV3Om15YWRkaW5zdGFuY2UiO2k6MTtzOjM1OiJibG9jay9nbG9zc2FyeV9yYW5kb206bXlhZGRpbnN0YW5jZSI7aToxO3M6MjQ6ImJsb2NrL2h0bWw6bXlhZGRpbnN0YW5jZSI7aToxO3M6Mjc6ImJsb2NrL21lbnRlZXM6bXlhZGRpbnN0YW5jZSI7aToxO3M6Mjg6ImJsb2NrL21lc3NhZ2VzOm15YWRkaW5zdGFuY2UiO2k6MTtzOjMwOiJibG9jay9tbmV0X2hvc3RzOm15YWRkaW5zdGFuY2UiO2k6MTtzOjI5OiJibG9jay9teXByb2ZpbGU6bXlhZGRpbnN0YW5jZSI7aToxO3M6MzA6ImJsb2NrL25hdmlnYXRpb246bXlhZGRpbnN0YW5jZSI7aToxO3M6MzA6ImJsb2NrL25ld3NfaXRlbXM6bXlhZGRpbnN0YW5jZSI7aToxO3M6MzI6ImJsb2NrL29ubGluZV91c2VyczpteWFkZGluc3RhbmNlIjtpOjE7czoyNzoiYmxvY2svb25saW5lX3VzZXJzOnZpZXdsaXN0IjtpOjE7czozMzoiYmxvY2svcHJpdmF0ZV9maWxlczpteWFkZGluc3RhbmNlIjtpOjE7czozMDoiYmxvY2svcnNzX2NsaWVudDpteWFkZGluc3RhbmNlIjtpOjE7czoyODoiYmxvY2svc2V0dGluZ3M6bXlhZGRpbnN0YW5jZSI7aToxO3M6MjQ6ImJsb2NrL3RhZ3M6bXlhZGRpbnN0YW5jZSI7aToxO3M6MTU6Im1vZC9mb2xkZXI6dmlldyI7aToxO3M6MTQ6Im1vZC9pbXNjcDp2aWV3IjtpOjE7czoxMzoibW9kL3BhZ2U6dmlldyI7aToxO3M6MTc6Im1vZC9yZXNvdXJjZTp2aWV3IjtpOjE7czoxMjoibW9kL3VybDp2aWV3IjtpOjE7czoxNzoibW9vZGxlL2Jsb2NrOnZpZXciO2k6MTtzOjI3OiJtb29kbGUvYmxvZzphc3NvY2lhdGVjb3Vyc2UiO2k6MTtzOjI3OiJtb29kbGUvYmxvZzphc3NvY2lhdGVtb2R1bGUiO2k6MTtzOjE4OiJtb29kbGUvYmxvZzpjcmVhdGUiO2k6MTtzOjI2OiJtb29kbGUvYmxvZzptYW5hZ2VleHRlcm5hbCI7aToxO3M6MTg6Im1vb2RsZS9ibG9nOnNlYXJjaCI7aToxO3M6MTY6Im1vb2RsZS9ibG9nOnZpZXciO2k6MTtzOjMyOiJtb29kbGUvY2FsZW5kYXI6bWFuYWdlb3duZW50cmllcyI7aToxO3M6MTk6Im1vb2RsZS9jb21tZW50OnBvc3QiO2k6MTtzOjE5OiJtb29kbGUvY29tbWVudDp2aWV3IjtpOjE7czoyMToibW9vZGxlL2NvdXJzZTpyZXF1ZXN0IjtpOjE7czoyMjoibW9vZGxlL215Om1hbmFnZWJsb2NrcyI7aToxO3M6MjM6Im1vb2RsZS9wb3J0Zm9saW86ZXhwb3J0IjtpOjE7czoxODoibW9vZGxlL3JhdGluZzpyYXRlIjtpOjE7czoxODoibW9vZGxlL3JhdGluZzp2aWV3IjtpOjE7czoyMToibW9vZGxlL3JhdGluZzp2aWV3YWxsIjtpOjE7czoyMToibW9vZGxlL3JhdGluZzp2aWV3YW55IjtpOjE7czoyMzoibW9vZGxlL3NpdGU6c2VuZG1lc3NhZ2UiO2k6MTtzOjE3OiJtb29kbGUvdGFnOmNyZWF0ZSI7aToxO3M6MTU6Im1vb2RsZS90YWc6ZWRpdCI7aToxO3M6MTU6Im1vb2RsZS90YWc6ZmxhZyI7aToxO3M6Mjk6Im1vb2RsZS91c2VyOmNoYW5nZW93bnBhc3N3b3JkIjtpOjE7czozMzoibW9vZGxlL3VzZXI6ZWRpdG93bm1lc3NhZ2Vwcm9maWxlIjtpOjE7czoyNjoibW9vZGxlL3VzZXI6ZWRpdG93bnByb2ZpbGUiO2k6MTtzOjI3OiJtb29kbGUvdXNlcjptYW5hZ2Vvd25ibG9ja3MiO2k6MTtzOjI2OiJtb29kbGUvdXNlcjptYW5hZ2Vvd25maWxlcyI7aToxO3M6MzU6Im1vb2RsZS93ZWJzZXJ2aWNlOmNyZWF0ZW1vYmlsZXRva2VuIjtpOjE7czoyNDoicmVwb3NpdG9yeS9hbGZyZXNjbzp2aWV3IjtpOjE7czoyMjoicmVwb3NpdG9yeS9ib3huZXQ6dmlldyI7aToxO3M6MjM6InJlcG9zaXRvcnkvZHJvcGJveDp2aWV3IjtpOjE7czoyMzoicmVwb3NpdG9yeS9lcXVlbGxhOnZpZXciO2k6MTtzOjIyOiJyZXBvc2l0b3J5L2ZsaWNrcjp2aWV3IjtpOjE7czoyOToicmVwb3NpdG9yeS9mbGlja3JfcHVibGljOnZpZXciO2k6MTtzOjI2OiJyZXBvc2l0b3J5L2dvb2dsZWRvY3M6dmlldyI7aToxO3M6MjI6InJlcG9zaXRvcnkvbWVybG90OnZpZXciO2k6MTtzOjIyOiJyZXBvc2l0b3J5L3BpY2FzYTp2aWV3IjtpOjE7czoyMjoicmVwb3NpdG9yeS9yZWNlbnQ6dmlldyI7aToxO3M6MTg6InJlcG9zaXRvcnkvczM6dmlldyI7aToxO3M6MjI6InJlcG9zaXRvcnkvdXBsb2FkOnZpZXciO2k6MTtzOjE5OiJyZXBvc2l0b3J5L3VybDp2aWV3IjtpOjE7czoyMDoicmVwb3NpdG9yeS91c2VyOnZpZXciO2k6MTtzOjI1OiJyZXBvc2l0b3J5L3dpa2ltZWRpYTp2aWV3IjtpOjE7czoyMzoicmVwb3NpdG9yeS95b3V0dWJlOnZpZXciO2k6MTt9czo0OiIvMTo4IjthOjc6e3M6MjA6ImJvb2t0b29sL3ByaW50OnByaW50IjtpOjE7czoxMzoibW9kL2Jvb2s6cmVhZCI7aToxO3M6MTg6Im1vZC9kYXRhOnZpZXdlbnRyeSI7aToxO3M6Mjk6Im1vZC9mb3J1bTphbGxvd2ZvcmNlc3Vic2NyaWJlIjtpOjE7czoyNDoibW9kL2ZvcnVtOnZpZXdkaXNjdXNzaW9uIjtpOjE7czoxNzoibW9kL2dsb3NzYXJ5OnZpZXciO2k6MTtzOjE5OiJtb29kbGUvY29tbWVudDp2aWV3IjtpOjE7fX1zOjEwOiJyZGVmX2NvdW50IjtpOjI7czo4OiJyZGVmX2xjYyI7aToyO3M6NjoibG9hZGVkIjthOjA6e31zOjQ6InRpbWUiO2k6MTM2NTY1NDI5MjtzOjM6InJzdyI7YTowOnt9fX0=', 1365653919, 1365654505, '127.0.0.1', '127.0.0.1');

-- --------------------------------------------------------

--
-- Table structure for table `mdl_stats_daily`
--

CREATE TABLE IF NOT EXISTS `mdl_stats_daily` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `courseid` bigint(10) NOT NULL DEFAULT '0',
  `timeend` bigint(10) NOT NULL DEFAULT '0',
  `roleid` bigint(10) NOT NULL DEFAULT '0',
  `stattype` varchar(20) NOT NULL DEFAULT 'activity',
  `stat1` bigint(10) NOT NULL DEFAULT '0',
  `stat2` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_statdail_cou_ix` (`courseid`),
  KEY `mdl_statdail_tim_ix` (`timeend`),
  KEY `mdl_statdail_rol_ix` (`roleid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='to accumulate daily stats' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_stats_monthly`
--

CREATE TABLE IF NOT EXISTS `mdl_stats_monthly` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `courseid` bigint(10) NOT NULL DEFAULT '0',
  `timeend` bigint(10) NOT NULL DEFAULT '0',
  `roleid` bigint(10) NOT NULL DEFAULT '0',
  `stattype` varchar(20) NOT NULL DEFAULT 'activity',
  `stat1` bigint(10) NOT NULL DEFAULT '0',
  `stat2` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_statmont_cou_ix` (`courseid`),
  KEY `mdl_statmont_tim_ix` (`timeend`),
  KEY `mdl_statmont_rol_ix` (`roleid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='To accumulate monthly stats' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_stats_user_daily`
--

CREATE TABLE IF NOT EXISTS `mdl_stats_user_daily` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `courseid` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `roleid` bigint(10) NOT NULL DEFAULT '0',
  `timeend` bigint(10) NOT NULL DEFAULT '0',
  `statsreads` bigint(10) NOT NULL DEFAULT '0',
  `statswrites` bigint(10) NOT NULL DEFAULT '0',
  `stattype` varchar(30) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `mdl_statuserdail_cou_ix` (`courseid`),
  KEY `mdl_statuserdail_use_ix` (`userid`),
  KEY `mdl_statuserdail_rol_ix` (`roleid`),
  KEY `mdl_statuserdail_tim_ix` (`timeend`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='To accumulate daily stats per course/user' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_stats_user_monthly`
--

CREATE TABLE IF NOT EXISTS `mdl_stats_user_monthly` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `courseid` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `roleid` bigint(10) NOT NULL DEFAULT '0',
  `timeend` bigint(10) NOT NULL DEFAULT '0',
  `statsreads` bigint(10) NOT NULL DEFAULT '0',
  `statswrites` bigint(10) NOT NULL DEFAULT '0',
  `stattype` varchar(30) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `mdl_statusermont_cou_ix` (`courseid`),
  KEY `mdl_statusermont_use_ix` (`userid`),
  KEY `mdl_statusermont_rol_ix` (`roleid`),
  KEY `mdl_statusermont_tim_ix` (`timeend`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='To accumulate monthly stats per course/user' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_stats_user_weekly`
--

CREATE TABLE IF NOT EXISTS `mdl_stats_user_weekly` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `courseid` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `roleid` bigint(10) NOT NULL DEFAULT '0',
  `timeend` bigint(10) NOT NULL DEFAULT '0',
  `statsreads` bigint(10) NOT NULL DEFAULT '0',
  `statswrites` bigint(10) NOT NULL DEFAULT '0',
  `stattype` varchar(30) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `mdl_statuserweek_cou_ix` (`courseid`),
  KEY `mdl_statuserweek_use_ix` (`userid`),
  KEY `mdl_statuserweek_rol_ix` (`roleid`),
  KEY `mdl_statuserweek_tim_ix` (`timeend`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='To accumulate weekly stats per course/user' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_stats_weekly`
--

CREATE TABLE IF NOT EXISTS `mdl_stats_weekly` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `courseid` bigint(10) NOT NULL DEFAULT '0',
  `timeend` bigint(10) NOT NULL DEFAULT '0',
  `roleid` bigint(10) NOT NULL DEFAULT '0',
  `stattype` varchar(20) NOT NULL DEFAULT 'activity',
  `stat1` bigint(10) NOT NULL DEFAULT '0',
  `stat2` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_statweek_cou_ix` (`courseid`),
  KEY `mdl_statweek_tim_ix` (`timeend`),
  KEY `mdl_statweek_rol_ix` (`roleid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='To accumulate weekly stats' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_survey`
--

CREATE TABLE IF NOT EXISTS `mdl_survey` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `course` bigint(10) NOT NULL DEFAULT '0',
  `template` bigint(10) NOT NULL DEFAULT '0',
  `days` mediumint(6) NOT NULL DEFAULT '0',
  `timecreated` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `intro` longtext NOT NULL,
  `introformat` smallint(4) NOT NULL DEFAULT '0',
  `questions` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `mdl_surv_cou_ix` (`course`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Each record is one SURVEY module with its configuration' AUTO_INCREMENT=6 ;

--
-- Dumping data for table `mdl_survey`
--

INSERT INTO `mdl_survey` (`id`, `course`, `template`, `days`, `timecreated`, `timemodified`, `name`, `intro`, `introformat`, `questions`) VALUES
(1, 0, 0, 0, 985017600, 985017600, 'collesaname', 'collesaintro', 0, '25,26,27,28,29,30,43,44'),
(2, 0, 0, 0, 985017600, 985017600, 'collespname', 'collespintro', 0, '31,32,33,34,35,36,43,44'),
(3, 0, 0, 0, 985017600, 985017600, 'collesapname', 'collesapintro', 0, '37,38,39,40,41,42,43,44'),
(4, 0, 0, 0, 985017600, 985017600, 'attlsname', 'attlsintro', 0, '65,67,68'),
(5, 0, 0, 0, 985017600, 985017600, 'ciqname', 'ciqintro', 0, '69,70,71,72,73');

-- --------------------------------------------------------

--
-- Table structure for table `mdl_survey_analysis`
--

CREATE TABLE IF NOT EXISTS `mdl_survey_analysis` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `survey` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `notes` longtext NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_survanal_use_ix` (`userid`),
  KEY `mdl_survanal_sur_ix` (`survey`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='text about each survey submission' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_survey_answers`
--

CREATE TABLE IF NOT EXISTS `mdl_survey_answers` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `survey` bigint(10) NOT NULL DEFAULT '0',
  `question` bigint(10) NOT NULL DEFAULT '0',
  `time` bigint(10) NOT NULL DEFAULT '0',
  `answer1` longtext NOT NULL,
  `answer2` longtext NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_survansw_use_ix` (`userid`),
  KEY `mdl_survansw_sur_ix` (`survey`),
  KEY `mdl_survansw_que_ix` (`question`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='the answers to each questions filled by the users' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_survey_questions`
--

CREATE TABLE IF NOT EXISTS `mdl_survey_questions` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `text` varchar(255) NOT NULL DEFAULT '',
  `shorttext` varchar(30) NOT NULL DEFAULT '',
  `multi` varchar(100) NOT NULL DEFAULT '',
  `intro` varchar(50) NOT NULL DEFAULT '',
  `type` smallint(3) NOT NULL DEFAULT '0',
  `options` longtext,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='the questions conforming one survey' AUTO_INCREMENT=74 ;

--
-- Dumping data for table `mdl_survey_questions`
--

INSERT INTO `mdl_survey_questions` (`id`, `text`, `shorttext`, `multi`, `intro`, `type`, `options`) VALUES
(1, 'colles1', 'colles1short', '', '', 1, 'scaletimes5'),
(2, 'colles2', 'colles2short', '', '', 1, 'scaletimes5'),
(3, 'colles3', 'colles3short', '', '', 1, 'scaletimes5'),
(4, 'colles4', 'colles4short', '', '', 1, 'scaletimes5'),
(5, 'colles5', 'colles5short', '', '', 1, 'scaletimes5'),
(6, 'colles6', 'colles6short', '', '', 1, 'scaletimes5'),
(7, 'colles7', 'colles7short', '', '', 1, 'scaletimes5'),
(8, 'colles8', 'colles8short', '', '', 1, 'scaletimes5'),
(9, 'colles9', 'colles9short', '', '', 1, 'scaletimes5'),
(10, 'colles10', 'colles10short', '', '', 1, 'scaletimes5'),
(11, 'colles11', 'colles11short', '', '', 1, 'scaletimes5'),
(12, 'colles12', 'colles12short', '', '', 1, 'scaletimes5'),
(13, 'colles13', 'colles13short', '', '', 1, 'scaletimes5'),
(14, 'colles14', 'colles14short', '', '', 1, 'scaletimes5'),
(15, 'colles15', 'colles15short', '', '', 1, 'scaletimes5'),
(16, 'colles16', 'colles16short', '', '', 1, 'scaletimes5'),
(17, 'colles17', 'colles17short', '', '', 1, 'scaletimes5'),
(18, 'colles18', 'colles18short', '', '', 1, 'scaletimes5'),
(19, 'colles19', 'colles19short', '', '', 1, 'scaletimes5'),
(20, 'colles20', 'colles20short', '', '', 1, 'scaletimes5'),
(21, 'colles21', 'colles21short', '', '', 1, 'scaletimes5'),
(22, 'colles22', 'colles22short', '', '', 1, 'scaletimes5'),
(23, 'colles23', 'colles23short', '', '', 1, 'scaletimes5'),
(24, 'colles24', 'colles24short', '', '', 1, 'scaletimes5'),
(25, 'collesm1', 'collesm1short', '1,2,3,4', 'collesmintro', 1, 'scaletimes5'),
(26, 'collesm2', 'collesm2short', '5,6,7,8', 'collesmintro', 1, 'scaletimes5'),
(27, 'collesm3', 'collesm3short', '9,10,11,12', 'collesmintro', 1, 'scaletimes5'),
(28, 'collesm4', 'collesm4short', '13,14,15,16', 'collesmintro', 1, 'scaletimes5'),
(29, 'collesm5', 'collesm5short', '17,18,19,20', 'collesmintro', 1, 'scaletimes5'),
(30, 'collesm6', 'collesm6short', '21,22,23,24', 'collesmintro', 1, 'scaletimes5'),
(31, 'collesm1', 'collesm1short', '1,2,3,4', 'collesmintro', 2, 'scaletimes5'),
(32, 'collesm2', 'collesm2short', '5,6,7,8', 'collesmintro', 2, 'scaletimes5'),
(33, 'collesm3', 'collesm3short', '9,10,11,12', 'collesmintro', 2, 'scaletimes5'),
(34, 'collesm4', 'collesm4short', '13,14,15,16', 'collesmintro', 2, 'scaletimes5'),
(35, 'collesm5', 'collesm5short', '17,18,19,20', 'collesmintro', 2, 'scaletimes5'),
(36, 'collesm6', 'collesm6short', '21,22,23,24', 'collesmintro', 2, 'scaletimes5'),
(37, 'collesm1', 'collesm1short', '1,2,3,4', 'collesmintro', 3, 'scaletimes5'),
(38, 'collesm2', 'collesm2short', '5,6,7,8', 'collesmintro', 3, 'scaletimes5'),
(39, 'collesm3', 'collesm3short', '9,10,11,12', 'collesmintro', 3, 'scaletimes5'),
(40, 'collesm4', 'collesm4short', '13,14,15,16', 'collesmintro', 3, 'scaletimes5'),
(41, 'collesm5', 'collesm5short', '17,18,19,20', 'collesmintro', 3, 'scaletimes5'),
(42, 'collesm6', 'collesm6short', '21,22,23,24', 'collesmintro', 3, 'scaletimes5'),
(43, 'howlong', '', '', '', 1, 'howlongoptions'),
(44, 'othercomments', '', '', '', 0, NULL),
(45, 'attls1', 'attls1short', '', '', 1, 'scaleagree5'),
(46, 'attls2', 'attls2short', '', '', 1, 'scaleagree5'),
(47, 'attls3', 'attls3short', '', '', 1, 'scaleagree5'),
(48, 'attls4', 'attls4short', '', '', 1, 'scaleagree5'),
(49, 'attls5', 'attls5short', '', '', 1, 'scaleagree5'),
(50, 'attls6', 'attls6short', '', '', 1, 'scaleagree5'),
(51, 'attls7', 'attls7short', '', '', 1, 'scaleagree5'),
(52, 'attls8', 'attls8short', '', '', 1, 'scaleagree5'),
(53, 'attls9', 'attls9short', '', '', 1, 'scaleagree5'),
(54, 'attls10', 'attls10short', '', '', 1, 'scaleagree5'),
(55, 'attls11', 'attls11short', '', '', 1, 'scaleagree5'),
(56, 'attls12', 'attls12short', '', '', 1, 'scaleagree5'),
(57, 'attls13', 'attls13short', '', '', 1, 'scaleagree5'),
(58, 'attls14', 'attls14short', '', '', 1, 'scaleagree5'),
(59, 'attls15', 'attls15short', '', '', 1, 'scaleagree5'),
(60, 'attls16', 'attls16short', '', '', 1, 'scaleagree5'),
(61, 'attls17', 'attls17short', '', '', 1, 'scaleagree5'),
(62, 'attls18', 'attls18short', '', '', 1, 'scaleagree5'),
(63, 'attls19', 'attls19short', '', '', 1, 'scaleagree5'),
(64, 'attls20', 'attls20short', '', '', 1, 'scaleagree5'),
(65, 'attlsm1', 'attlsm1', '45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64', 'attlsmintro', 1, 'scaleagree5'),
(66, '-', '-', '-', '-', 0, '-'),
(67, 'attlsm2', 'attlsm2', '63,62,59,57,55,49,52,50,48,47', 'attlsmintro', -1, 'scaleagree5'),
(68, 'attlsm3', 'attlsm3', '46,54,45,51,60,53,56,58,61,64', 'attlsmintro', -1, 'scaleagree5'),
(69, 'ciq1', 'ciq1short', '', '', 0, NULL),
(70, 'ciq2', 'ciq2short', '', '', 0, NULL),
(71, 'ciq3', 'ciq3short', '', '', 0, NULL),
(72, 'ciq4', 'ciq4short', '', '', 0, NULL),
(73, 'ciq5', 'ciq5short', '', '', 0, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `mdl_tag`
--

CREATE TABLE IF NOT EXISTS `mdl_tag` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `userid` bigint(10) NOT NULL,
  `name` varchar(255) NOT NULL DEFAULT '',
  `rawname` varchar(255) NOT NULL DEFAULT '',
  `tagtype` varchar(255) DEFAULT NULL,
  `description` longtext,
  `descriptionformat` tinyint(2) NOT NULL DEFAULT '0',
  `flag` smallint(4) DEFAULT '0',
  `timemodified` bigint(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_tag_nam_uix` (`name`),
  UNIQUE KEY `mdl_tag_idnam_uix` (`id`,`name`),
  KEY `mdl_tag_use_ix` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Tag table - this generic table will replace the old "tags" t' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_tag_correlation`
--

CREATE TABLE IF NOT EXISTS `mdl_tag_correlation` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `tagid` bigint(10) NOT NULL,
  `correlatedtags` longtext NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_tagcorr_tag_ix` (`tagid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='The rationale for the ''tag_correlation'' table is performance' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_tag_instance`
--

CREATE TABLE IF NOT EXISTS `mdl_tag_instance` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `tagid` bigint(10) NOT NULL,
  `itemtype` varchar(255) NOT NULL DEFAULT '',
  `itemid` bigint(10) NOT NULL,
  `tiuserid` bigint(10) NOT NULL DEFAULT '0',
  `ordering` bigint(10) DEFAULT NULL,
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_taginst_iteitetagtiu_uix` (`itemtype`,`itemid`,`tagid`,`tiuserid`),
  KEY `mdl_taginst_tag_ix` (`tagid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='tag_instance table holds the information of associations bet' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_temp_enroled_template`
--

CREATE TABLE IF NOT EXISTS `mdl_temp_enroled_template` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `courseid` bigint(10) NOT NULL DEFAULT '0',
  `roleid` bigint(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_tempenrotemp_use_ix` (`userid`),
  KEY `mdl_tempenrotemp_cou_ix` (`courseid`),
  KEY `mdl_tempenrotemp_rol_ix` (`roleid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Temporary storage for course enrolments' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_temp_log_template`
--

CREATE TABLE IF NOT EXISTS `mdl_temp_log_template` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `course` bigint(10) NOT NULL DEFAULT '0',
  `action` varchar(40) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `mdl_templogtemp_act_ix` (`action`),
  KEY `mdl_templogtemp_cou_ix` (`course`),
  KEY `mdl_templogtemp_use_ix` (`userid`),
  KEY `mdl_templogtemp_usecouact_ix` (`userid`,`course`,`action`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Temporary storage for daily logs' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_timezone`
--

CREATE TABLE IF NOT EXISTS `mdl_timezone` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL DEFAULT '',
  `year` bigint(11) NOT NULL DEFAULT '0',
  `tzrule` varchar(20) NOT NULL DEFAULT '',
  `gmtoff` bigint(11) NOT NULL DEFAULT '0',
  `dstoff` bigint(11) NOT NULL DEFAULT '0',
  `dst_month` tinyint(2) NOT NULL DEFAULT '0',
  `dst_startday` smallint(3) NOT NULL DEFAULT '0',
  `dst_weekday` smallint(3) NOT NULL DEFAULT '0',
  `dst_skipweeks` smallint(3) NOT NULL DEFAULT '0',
  `dst_time` varchar(6) NOT NULL DEFAULT '00:00',
  `std_month` tinyint(2) NOT NULL DEFAULT '0',
  `std_startday` smallint(3) NOT NULL DEFAULT '0',
  `std_weekday` smallint(3) NOT NULL DEFAULT '0',
  `std_skipweeks` smallint(3) NOT NULL DEFAULT '0',
  `std_time` varchar(6) NOT NULL DEFAULT '00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Rules for calculating local wall clock time for users' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_tool_customlang`
--

CREATE TABLE IF NOT EXISTS `mdl_tool_customlang` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `lang` varchar(20) NOT NULL DEFAULT '',
  `componentid` bigint(10) NOT NULL,
  `stringid` varchar(255) NOT NULL DEFAULT '',
  `original` longtext NOT NULL,
  `master` longtext,
  `local` longtext,
  `timemodified` bigint(10) NOT NULL,
  `timecustomized` bigint(10) DEFAULT NULL,
  `outdated` smallint(3) DEFAULT '0',
  `modified` smallint(3) DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_toolcust_lancomstr_uix` (`lang`,`componentid`,`stringid`),
  KEY `mdl_toolcust_com_ix` (`componentid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Contains the working checkout of all strings and their custo' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_tool_customlang_components`
--

CREATE TABLE IF NOT EXISTS `mdl_tool_customlang_components` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  `version` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Contains the list of all installed plugins that provide thei' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_upgrade_log`
--

CREATE TABLE IF NOT EXISTS `mdl_upgrade_log` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `type` bigint(10) NOT NULL,
  `plugin` varchar(100) DEFAULT NULL,
  `version` varchar(100) DEFAULT NULL,
  `targetversion` varchar(100) DEFAULT NULL,
  `info` varchar(255) NOT NULL DEFAULT '',
  `details` longtext,
  `backtrace` longtext,
  `userid` bigint(10) NOT NULL,
  `timemodified` bigint(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_upgrlog_tim_ix` (`timemodified`),
  KEY `mdl_upgrlog_typtim_ix` (`type`,`timemodified`),
  KEY `mdl_upgrlog_use_ix` (`userid`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Upgrade logging' AUTO_INCREMENT=866 ;

--
-- Dumping data for table `mdl_upgrade_log`
--

INSERT INTO `mdl_upgrade_log` (`id`, `type`, `plugin`, `version`, `targetversion`, `info`, `details`, `backtrace`, `userid`, `timemodified`) VALUES
(1, 0, 'core', '2012120303', '2012120303', 'Upgrade savepoint reached', NULL, '', 0, 1365445901),
(2, 0, 'core', '2012120303', '2012120303', 'Core installed', NULL, '', 0, 1365445908),
(3, 0, 'qtype_calculated', NULL, '2012112900', 'Starting plugin installation', NULL, '', 0, 1365445909),
(4, 0, 'qtype_calculated', '2012112900', '2012112900', 'Upgrade savepoint reached', NULL, '', 0, 1365445910),
(5, 0, 'qtype_calculated', '2012112900', '2012112900', 'Plugin installed', NULL, '', 0, 1365445911),
(6, 0, 'qtype_calculatedmulti', NULL, '2012112900', 'Starting plugin installation', NULL, '', 0, 1365445911),
(7, 0, 'qtype_calculatedmulti', '2012112900', '2012112900', 'Upgrade savepoint reached', NULL, '', 0, 1365445911),
(8, 0, 'qtype_calculatedmulti', '2012112900', '2012112900', 'Plugin installed', NULL, '', 0, 1365445911),
(9, 0, 'qtype_calculatedsimple', NULL, '2012112900', 'Starting plugin installation', NULL, '', 0, 1365445911),
(10, 0, 'qtype_calculatedsimple', '2012112900', '2012112900', 'Upgrade savepoint reached', NULL, '', 0, 1365445911),
(11, 0, 'qtype_calculatedsimple', '2012112900', '2012112900', 'Plugin installed', NULL, '', 0, 1365445911),
(12, 0, 'qtype_description', NULL, '2012112900', 'Starting plugin installation', NULL, '', 0, 1365445911),
(13, 0, 'qtype_description', '2012112900', '2012112900', 'Upgrade savepoint reached', NULL, '', 0, 1365445911),
(14, 0, 'qtype_description', '2012112900', '2012112900', 'Plugin installed', NULL, '', 0, 1365445911),
(15, 0, 'qtype_essay', NULL, '2012112900', 'Starting plugin installation', NULL, '', 0, 1365445911),
(16, 0, 'qtype_essay', '2012112900', '2012112900', 'Upgrade savepoint reached', NULL, '', 0, 1365445913),
(17, 0, 'qtype_essay', '2012112900', '2012112900', 'Plugin installed', NULL, '', 0, 1365445913),
(18, 0, 'qtype_match', NULL, '2012112900', 'Starting plugin installation', NULL, '', 0, 1365445913),
(19, 0, 'qtype_match', '2012112900', '2012112900', 'Upgrade savepoint reached', NULL, '', 0, 1365445913),
(20, 0, 'qtype_match', '2012112900', '2012112900', 'Plugin installed', NULL, '', 0, 1365445913),
(21, 0, 'qtype_missingtype', NULL, '2012112900', 'Starting plugin installation', NULL, '', 0, 1365445913),
(22, 0, 'qtype_missingtype', '2012112900', '2012112900', 'Upgrade savepoint reached', NULL, '', 0, 1365445913),
(23, 0, 'qtype_missingtype', '2012112900', '2012112900', 'Plugin installed', NULL, '', 0, 1365445913),
(24, 0, 'qtype_multianswer', NULL, '2012112900', 'Starting plugin installation', NULL, '', 0, 1365445913),
(25, 0, 'qtype_multianswer', '2012112900', '2012112900', 'Upgrade savepoint reached', NULL, '', 0, 1365445913),
(26, 0, 'qtype_multianswer', '2012112900', '2012112900', 'Plugin installed', NULL, '', 0, 1365445914),
(27, 0, 'qtype_multichoice', NULL, '2012112900', 'Starting plugin installation', NULL, '', 0, 1365445914),
(28, 0, 'qtype_multichoice', '2012112900', '2012112900', 'Upgrade savepoint reached', NULL, '', 0, 1365445914),
(29, 0, 'qtype_multichoice', '2012112900', '2012112900', 'Plugin installed', NULL, '', 0, 1365445914),
(30, 0, 'qtype_numerical', NULL, '2012112900', 'Starting plugin installation', NULL, '', 0, 1365445914),
(31, 0, 'qtype_numerical', '2012112900', '2012112900', 'Upgrade savepoint reached', NULL, '', 0, 1365445914),
(32, 0, 'qtype_numerical', '2012112900', '2012112900', 'Plugin installed', NULL, '', 0, 1365445914),
(33, 0, 'qtype_random', NULL, '2012112900', 'Starting plugin installation', NULL, '', 0, 1365445915),
(34, 0, 'qtype_random', '2012112900', '2012112900', 'Upgrade savepoint reached', NULL, '', 0, 1365445915),
(35, 0, 'qtype_random', '2012112900', '2012112900', 'Plugin installed', NULL, '', 0, 1365445915),
(36, 0, 'qtype_randomsamatch', NULL, '2012112900', 'Starting plugin installation', NULL, '', 0, 1365445915),
(37, 0, 'qtype_randomsamatch', '2012112900', '2012112900', 'Upgrade savepoint reached', NULL, '', 0, 1365445915),
(38, 0, 'qtype_randomsamatch', '2012112900', '2012112900', 'Plugin installed', NULL, '', 0, 1365445915),
(39, 0, 'qtype_shortanswer', NULL, '2012112900', 'Starting plugin installation', NULL, '', 0, 1365445915),
(40, 0, 'qtype_shortanswer', '2012112900', '2012112900', 'Upgrade savepoint reached', NULL, '', 0, 1365445915),
(41, 0, 'qtype_shortanswer', '2012112900', '2012112900', 'Plugin installed', NULL, '', 0, 1365445915),
(42, 0, 'qtype_truefalse', NULL, '2012112900', 'Starting plugin installation', NULL, '', 0, 1365445915),
(43, 0, 'qtype_truefalse', '2012112900', '2012112900', 'Upgrade savepoint reached', NULL, '', 0, 1365445915),
(44, 0, 'qtype_truefalse', '2012112900', '2012112900', 'Plugin installed', NULL, '', 0, 1365445916),
(45, 0, 'mod_assign', NULL, '2012112900', 'Starting plugin installation', NULL, '', 0, 1365445916),
(46, 0, 'mod_assign', '2012112900', '2012112900', 'Plugin installed', NULL, '', 0, 1365445917),
(47, 0, 'mod_assignment', NULL, '2012112900', 'Starting plugin installation', NULL, '', 0, 1365445917),
(48, 0, 'mod_assignment', '2012112900', '2012112900', 'Plugin installed', NULL, '', 0, 1365445918),
(49, 0, 'mod_book', NULL, '2012112900', 'Starting plugin installation', NULL, '', 0, 1365445918),
(50, 0, 'mod_book', '2012112900', '2012112900', 'Plugin installed', NULL, '', 0, 1365445918),
(51, 0, 'mod_chat', NULL, '2012112900', 'Starting plugin installation', NULL, '', 0, 1365445918),
(52, 0, 'mod_chat', '2012112900', '2012112900', 'Plugin installed', NULL, '', 0, 1365445919),
(53, 0, 'mod_choice', NULL, '2012112900', 'Starting plugin installation', NULL, '', 0, 1365445919),
(54, 0, 'mod_choice', '2012112900', '2012112900', 'Plugin installed', NULL, '', 0, 1365445920),
(55, 0, 'mod_data', NULL, '2012112901', 'Starting plugin installation', NULL, '', 0, 1365445920),
(56, 0, 'mod_data', '2012112901', '2012112901', 'Plugin installed', NULL, '', 0, 1365445921),
(57, 0, 'mod_feedback', NULL, '2012112900', 'Starting plugin installation', NULL, '', 0, 1365445921),
(58, 0, 'mod_feedback', '2012112900', '2012112900', 'Plugin installed', NULL, '', 0, 1365445923),
(59, 0, 'mod_folder', NULL, '2012112900', 'Starting plugin installation', NULL, '', 0, 1365445923),
(60, 0, 'mod_folder', '2012112900', '2012112900', 'Plugin installed', NULL, '', 0, 1365445923),
(61, 0, 'mod_forum', NULL, '2012112901', 'Starting plugin installation', NULL, '', 0, 1365445923),
(62, 0, 'mod_forum', '2012112901', '2012112901', 'Plugin installed', NULL, '', 0, 1365445925),
(63, 0, 'mod_glossary', NULL, '2012112900', 'Starting plugin installation', NULL, '', 0, 1365445925),
(64, 0, 'mod_glossary', '2012112900', '2012112900', 'Plugin installed', NULL, '', 0, 1365445926),
(65, 0, 'mod_imscp', NULL, '2012112900', 'Starting plugin installation', NULL, '', 0, 1365445926),
(66, 0, 'mod_imscp', '2012112900', '2012112900', 'Plugin installed', NULL, '', 0, 1365445926),
(67, 0, 'mod_label', NULL, '2012112900', 'Starting plugin installation', NULL, '', 0, 1365445926),
(68, 0, 'mod_label', '2012112900', '2012112900', 'Plugin installed', NULL, '', 0, 1365445926),
(69, 0, 'mod_lesson', NULL, '2012112900', 'Starting plugin installation', NULL, '', 0, 1365445926),
(70, 0, 'mod_lesson', '2012112900', '2012112900', 'Plugin installed', NULL, '', 0, 1365445927),
(71, 0, 'mod_lti', NULL, '2012112900', 'Starting plugin installation', NULL, '', 0, 1365445927),
(72, 0, 'mod_lti', '2012112900', '2012112900', 'Plugin installed', NULL, '', 0, 1365445928),
(73, 0, 'mod_page', NULL, '2012112900', 'Starting plugin installation', NULL, '', 0, 1365445928),
(74, 0, 'mod_page', '2012112900', '2012112900', 'Plugin installed', NULL, '', 0, 1365445928),
(75, 0, 'mod_quiz', NULL, '2012112900', 'Starting plugin installation', NULL, '', 0, 1365445928),
(76, 0, 'mod_quiz', '2012112900', '2012112900', 'Plugin installed', NULL, '', 0, 1365445929),
(77, 0, 'mod_resource', NULL, '2012112900', 'Starting plugin installation', NULL, '', 0, 1365445929),
(78, 0, 'mod_resource', '2012112900', '2012112900', 'Plugin installed', NULL, '', 0, 1365445930),
(79, 0, 'mod_scorm', NULL, '2012112900', 'Starting plugin installation', NULL, '', 0, 1365445930),
(80, 0, 'mod_scorm', '2012112900', '2012112900', 'Plugin installed', NULL, '', 0, 1365445932),
(81, 0, 'mod_survey', NULL, '2012112900', 'Starting plugin installation', NULL, '', 0, 1365445932),
(82, 0, 'mod_survey', '2012112900', '2012112900', 'Plugin installed', NULL, '', 0, 1365445933),
(83, 0, 'mod_url', NULL, '2012112900', 'Starting plugin installation', NULL, '', 0, 1365445933),
(84, 0, 'mod_url', '2012112900', '2012112900', 'Plugin installed', NULL, '', 0, 1365445933),
(85, 0, 'mod_wiki', NULL, '2012112900', 'Starting plugin installation', NULL, '', 0, 1365445933),
(86, 0, 'mod_wiki', '2012112900', '2012112900', 'Plugin installed', NULL, '', 0, 1365445934),
(87, 0, 'mod_workshop', NULL, '2012112901', 'Starting plugin installation', NULL, '', 0, 1365445934),
(88, 0, 'mod_workshop', '2012112901', '2012112901', 'Plugin installed', NULL, '', 0, 1365445935),
(89, 0, 'auth_cas', NULL, '2012112900', 'Starting plugin installation', NULL, '', 0, 1365445935),
(90, 0, 'auth_cas', '2012112900', '2012112900', 'Upgrade savepoint reached', NULL, '', 0, 1365445936),
(91, 0, 'auth_cas', '2012112900', '2012112900', 'Plugin installed', NULL, '', 0, 1365445936),
(92, 0, 'auth_db', NULL, '2012112900', 'Starting plugin installation', NULL, '', 0, 1365445936),
(93, 0, 'auth_db', '2012112900', '2012112900', 'Upgrade savepoint reached', NULL, '', 0, 1365445936),
(94, 0, 'auth_db', '2012112900', '2012112900', 'Plugin installed', NULL, '', 0, 1365445936),
(95, 0, 'auth_email', NULL, '2012112900', 'Starting plugin installation', NULL, '', 0, 1365445936),
(96, 0, 'auth_email', '2012112900', '2012112900', 'Upgrade savepoint reached', NULL, '', 0, 1365445936),
(97, 0, 'auth_email', '2012112900', '2012112900', 'Plugin installed', NULL, '', 0, 1365445936),
(98, 0, 'auth_fc', NULL, '2012112900', 'Starting plugin installation', NULL, '', 0, 1365445936),
(99, 0, 'auth_fc', '2012112900', '2012112900', 'Upgrade savepoint reached', NULL, '', 0, 1365445936),
(100, 0, 'auth_fc', '2012112900', '2012112900', 'Plugin installed', NULL, '', 0, 1365445936),
(101, 0, 'auth_imap', NULL, '2012112900', 'Starting plugin installation', NULL, '', 0, 1365445936),
(102, 0, 'auth_imap', '2012112900', '2012112900', 'Upgrade savepoint reached', NULL, '', 0, 1365445936),
(103, 0, 'auth_imap', '2012112900', '2012112900', 'Plugin installed', NULL, '', 0, 1365445936),
(104, 0, 'auth_ldap', NULL, '2012112900', 'Starting plugin installation', NULL, '', 0, 1365445936),
(105, 0, 'auth_ldap', '2012112900', '2012112900', 'Upgrade savepoint reached', NULL, '', 0, 1365445937),
(106, 0, 'auth_ldap', '2012112900', '2012112900', 'Plugin installed', NULL, '', 0, 1365445937),
(107, 0, 'auth_manual', NULL, '2012112900', 'Starting plugin installation', NULL, '', 0, 1365445937),
(108, 0, 'auth_manual', '2012112900', '2012112900', 'Upgrade savepoint reached', NULL, '', 0, 1365445937),
(109, 0, 'auth_manual', '2012112900', '2012112900', 'Plugin installed', NULL, '', 0, 1365445937),
(110, 0, 'auth_mnet', NULL, '2012112900', 'Starting plugin installation', NULL, '', 0, 1365445937),
(111, 0, 'auth_mnet', '2012112900', '2012112900', 'Upgrade savepoint reached', NULL, '', 0, 1365445937),
(112, 0, 'auth_mnet', '2012112900', '2012112900', 'Plugin installed', NULL, '', 0, 1365445937),
(113, 0, 'auth_nntp', NULL, '2012112900', 'Starting plugin installation', NULL, '', 0, 1365445937),
(114, 0, 'auth_nntp', '2012112900', '2012112900', 'Upgrade savepoint reached', NULL, '', 0, 1365445937),
(115, 0, 'auth_nntp', '2012112900', '2012112900', 'Plugin installed', NULL, '', 0, 1365445938),
(116, 0, 'auth_nologin', NULL, '2012112900', 'Starting plugin installation', NULL, '', 0, 1365445938),
(117, 0, 'auth_nologin', '2012112900', '2012112900', 'Upgrade savepoint reached', NULL, '', 0, 1365445938),
(118, 0, 'auth_nologin', '2012112900', '2012112900', 'Plugin installed', NULL, '', 0, 1365445938),
(119, 0, 'auth_none', NULL, '2012112900', 'Starting plugin installation', NULL, '', 0, 1365445938),
(120, 0, 'auth_none', '2012112900', '2012112900', 'Upgrade savepoint reached', NULL, '', 0, 1365445938),
(121, 0, 'auth_none', '2012112900', '2012112900', 'Plugin installed', NULL, '', 0, 1365445938),
(122, 0, 'auth_pam', NULL, '2012112900', 'Starting plugin installation', NULL, '', 0, 1365445938),
(123, 0, 'auth_pam', '2012112900', '2012112900', 'Upgrade savepoint reached', NULL, '', 0, 1365445938),
(124, 0, 'auth_pam', '2012112900', '2012112900', 'Plugin installed', NULL, '', 0, 1365445938),
(125, 0, 'auth_pop3', NULL, '2012112900', 'Starting plugin installation', NULL, '', 0, 1365445938),
(126, 0, 'auth_pop3', '2012112900', '2012112900', 'Upgrade savepoint reached', NULL, '', 0, 1365445938),
(127, 0, 'auth_pop3', '2012112900', '2012112900', 'Plugin installed', NULL, '', 0, 1365445939),
(128, 0, 'auth_radius', NULL, '2012112900', 'Starting plugin installation', NULL, '', 0, 1365445939),
(129, 0, 'auth_radius', '2012112900', '2012112900', 'Upgrade savepoint reached', NULL, '', 0, 1365445939),
(130, 0, 'auth_radius', '2012112900', '2012112900', 'Plugin installed', NULL, '', 0, 1365445939),
(131, 0, 'auth_shibboleth', NULL, '2012112900', 'Starting plugin installation', NULL, '', 0, 1365445939),
(132, 0, 'auth_shibboleth', '2012112900', '2012112900', 'Upgrade savepoint reached', NULL, '', 0, 1365445939),
(133, 0, 'auth_shibboleth', '2012112900', '2012112900', 'Plugin installed', NULL, '', 0, 1365445939),
(134, 0, 'auth_webservice', NULL, '2012112900', 'Starting plugin installation', NULL, '', 0, 1365445939),
(135, 0, 'auth_webservice', '2012112900', '2012112900', 'Upgrade savepoint reached', NULL, '', 0, 1365445939),
(136, 0, 'auth_webservice', '2012112900', '2012112900', 'Plugin installed', NULL, '', 0, 1365445939),
(137, 0, 'enrol_authorize', NULL, '2012112900', 'Starting plugin installation', NULL, '', 0, 1365445939),
(138, 0, 'enrol_authorize', '2012112900', '2012112900', 'Upgrade savepoint reached', NULL, '', 0, 1365445939),
(139, 0, 'enrol_authorize', '2012112900', '2012112900', 'Plugin installed', NULL, '', 0, 1365445941),
(140, 0, 'enrol_category', NULL, '2012112900', 'Starting plugin installation', NULL, '', 0, 1365445943),
(141, 0, 'enrol_category', '2012112900', '2012112900', 'Upgrade savepoint reached', NULL, '', 0, 1365445943),
(142, 0, 'enrol_category', '2012112900', '2012112900', 'Plugin installed', NULL, '', 0, 1365445944),
(143, 0, 'enrol_cohort', NULL, '2012112900', 'Starting plugin installation', NULL, '', 0, 1365445944),
(144, 0, 'enrol_cohort', '2012112900', '2012112900', 'Upgrade savepoint reached', NULL, '', 0, 1365445944),
(145, 0, 'enrol_cohort', '2012112900', '2012112900', 'Plugin installed', NULL, '', 0, 1365445944),
(146, 0, 'enrol_database', NULL, '2012112900', 'Starting plugin installation', NULL, '', 0, 1365445944),
(147, 0, 'enrol_database', '2012112900', '2012112900', 'Upgrade savepoint reached', NULL, '', 0, 1365445944),
(148, 0, 'enrol_database', '2012112900', '2012112900', 'Plugin installed', NULL, '', 0, 1365445944),
(149, 0, 'enrol_flatfile', NULL, '2012112900', 'Starting plugin installation', NULL, '', 0, 1365445944),
(150, 0, 'enrol_flatfile', '2012112900', '2012112900', 'Upgrade savepoint reached', NULL, '', 0, 1365445944),
(151, 0, 'enrol_flatfile', '2012112900', '2012112900', 'Plugin installed', NULL, '', 0, 1365445945),
(152, 0, 'enrol_guest', NULL, '2012112900', 'Starting plugin installation', NULL, '', 0, 1365445945),
(153, 0, 'enrol_guest', '2012112900', '2012112900', 'Upgrade savepoint reached', NULL, '', 0, 1365445945),
(154, 0, 'enrol_guest', '2012112900', '2012112900', 'Plugin installed', NULL, '', 0, 1365445945),
(155, 0, 'enrol_imsenterprise', NULL, '2012112900', 'Starting plugin installation', NULL, '', 0, 1365445945),
(156, 0, 'enrol_imsenterprise', '2012112900', '2012112900', 'Upgrade savepoint reached', NULL, '', 0, 1365445945),
(157, 0, 'enrol_imsenterprise', '2012112900', '2012112900', 'Plugin installed', NULL, '', 0, 1365445946),
(158, 0, 'enrol_ldap', NULL, '2012112900', 'Starting plugin installation', NULL, '', 0, 1365445947),
(159, 0, 'enrol_ldap', '2012112900', '2012112900', 'Upgrade savepoint reached', NULL, '', 0, 1365445947),
(160, 0, 'enrol_ldap', '2012112900', '2012112900', 'Plugin installed', NULL, '', 0, 1365445947),
(161, 0, 'enrol_manual', NULL, '2012112900', 'Starting plugin installation', NULL, '', 0, 1365445947),
(162, 0, 'enrol_manual', '2012112900', '2012112900', 'Upgrade savepoint reached', NULL, '', 0, 1365445947),
(163, 0, 'enrol_manual', '2012112900', '2012112900', 'Plugin installed', NULL, '', 0, 1365445947),
(164, 0, 'enrol_meta', NULL, '2012112900', 'Starting plugin installation', NULL, '', 0, 1365445947),
(165, 0, 'enrol_meta', '2012112900', '2012112900', 'Upgrade savepoint reached', NULL, '', 0, 1365445947),
(166, 0, 'enrol_meta', '2012112900', '2012112900', 'Plugin installed', NULL, '', 0, 1365445948),
(167, 0, 'enrol_mnet', NULL, '2012112900', 'Starting plugin installation', NULL, '', 0, 1365445948),
(168, 0, 'enrol_mnet', '2012112900', '2012112900', 'Upgrade savepoint reached', NULL, '', 0, 1365445948),
(169, 0, 'enrol_mnet', '2012112900', '2012112900', 'Plugin installed', NULL, '', 0, 1365445948),
(170, 0, 'enrol_paypal', NULL, '2012112900', 'Starting plugin installation', NULL, '', 0, 1365445948),
(171, 0, 'enrol_paypal', '2012112900', '2012112900', 'Upgrade savepoint reached', NULL, '', 0, 1365445949),
(172, 0, 'enrol_paypal', '2012112900', '2012112900', 'Plugin installed', NULL, '', 0, 1365445949),
(173, 0, 'enrol_self', NULL, '2012112900', 'Starting plugin installation', NULL, '', 0, 1365445949),
(174, 0, 'enrol_self', '2012112900', '2012112900', 'Upgrade savepoint reached', NULL, '', 0, 1365445949),
(175, 0, 'enrol_self', '2012112900', '2012112900', 'Plugin installed', NULL, '', 0, 1365445949),
(176, 0, 'message_email', NULL, '2012112900', 'Starting plugin installation', NULL, '', 0, 1365445949),
(177, 0, 'message_email', '2012112900', '2012112900', 'Upgrade savepoint reached', NULL, '', 0, 1365445949),
(178, 0, 'message_email', '2012112900', '2012112900', 'Plugin installed', NULL, '', 0, 1365445949),
(179, 0, 'message_jabber', NULL, '2012112900', 'Starting plugin installation', NULL, '', 0, 1365445949),
(180, 0, 'message_jabber', '2012112900', '2012112900', 'Upgrade savepoint reached', NULL, '', 0, 1365445949),
(181, 0, 'message_jabber', '2012112900', '2012112900', 'Plugin installed', NULL, '', 0, 1365445950),
(182, 0, 'message_popup', NULL, '2012112900', 'Starting plugin installation', NULL, '', 0, 1365445950),
(183, 0, 'message_popup', '2012112900', '2012112900', 'Upgrade savepoint reached', NULL, '', 0, 1365445950),
(184, 0, 'message_popup', '2012112900', '2012112900', 'Plugin installed', NULL, '', 0, 1365445951),
(185, 0, 'block_activity_modules', NULL, '2012112900', 'Starting plugin installation', NULL, '', 0, 1365445951),
(186, 0, 'block_activity_modules', '2012112900', '2012112900', 'Plugin installed', NULL, '', 0, 1365445951),
(187, 0, 'block_admin_bookmarks', NULL, '2012112900', 'Starting plugin installation', NULL, '', 0, 1365445951),
(188, 0, 'block_admin_bookmarks', '2012112900', '2012112900', 'Plugin installed', NULL, '', 0, 1365445951),
(189, 0, 'block_blog_menu', NULL, '2012112900', 'Starting plugin installation', NULL, '', 0, 1365445951),
(190, 0, 'block_blog_menu', '2012112900', '2012112900', 'Plugin installed', NULL, '', 0, 1365445951),
(191, 0, 'block_blog_recent', NULL, '2012112900', 'Starting plugin installation', NULL, '', 0, 1365445951),
(192, 0, 'block_blog_recent', '2012112900', '2012112900', 'Plugin installed', NULL, '', 0, 1365445951),
(193, 0, 'block_blog_tags', NULL, '2012112900', 'Starting plugin installation', NULL, '', 0, 1365445951),
(194, 0, 'block_blog_tags', '2012112900', '2012112900', 'Plugin installed', NULL, '', 0, 1365445952),
(195, 0, 'block_calendar_month', NULL, '2012112900', 'Starting plugin installation', NULL, '', 0, 1365445952),
(196, 0, 'block_calendar_month', '2012112900', '2012112900', 'Plugin installed', NULL, '', 0, 1365445952),
(197, 0, 'block_calendar_upcoming', NULL, '2012112900', 'Starting plugin installation', NULL, '', 0, 1365445952),
(198, 0, 'block_calendar_upcoming', '2012112900', '2012112900', 'Plugin installed', NULL, '', 0, 1365445952),
(199, 0, 'block_comments', NULL, '2012112900', 'Starting plugin installation', NULL, '', 0, 1365445952),
(200, 0, 'block_comments', '2012112900', '2012112900', 'Plugin installed', NULL, '', 0, 1365445952),
(201, 0, 'block_community', NULL, '2012112900', 'Starting plugin installation', NULL, '', 0, 1365445952),
(202, 0, 'block_community', '2012112900', '2012112900', 'Plugin installed', NULL, '', 0, 1365445952),
(203, 0, 'block_completionstatus', NULL, '2012112901', 'Starting plugin installation', NULL, '', 0, 1365445952),
(204, 0, 'block_completionstatus', '2012112901', '2012112901', 'Plugin installed', NULL, '', 0, 1365445953),
(205, 0, 'block_course_list', NULL, '2012112900', 'Starting plugin installation', NULL, '', 0, 1365445953),
(206, 0, 'block_course_list', '2012112900', '2012112900', 'Plugin installed', NULL, '', 0, 1365445953),
(207, 0, 'block_course_overview', NULL, '2012121000', 'Starting plugin installation', NULL, '', 0, 1365445953),
(208, 0, 'block_course_overview', '2012121000', '2012121000', 'Plugin installed', NULL, '', 0, 1365445953),
(209, 0, 'block_course_summary', NULL, '2012112901', 'Starting plugin installation', NULL, '', 0, 1365445953),
(210, 0, 'block_course_summary', '2012112901', '2012112901', 'Plugin installed', NULL, '', 0, 1365445953),
(211, 0, 'block_feedback', NULL, '2012112900', 'Starting plugin installation', NULL, '', 0, 1365445953),
(212, 0, 'block_feedback', '2012112900', '2012112900', 'Plugin installed', NULL, '', 0, 1365445953),
(213, 0, 'block_glossary_random', NULL, '2012112902', 'Starting plugin installation', NULL, '', 0, 1365445954),
(214, 0, 'block_glossary_random', '2012112902', '2012112902', 'Plugin installed', NULL, '', 0, 1365445954),
(215, 0, 'block_html', NULL, '2012112900', 'Starting plugin installation', NULL, '', 0, 1365445954),
(216, 0, 'block_html', '2012112900', '2012112900', 'Plugin installed', NULL, '', 0, 1365445954),
(217, 0, 'block_login', NULL, '2012112900', 'Starting plugin installation', NULL, '', 0, 1365445954),
(218, 0, 'block_login', '2012112900', '2012112900', 'Plugin installed', NULL, '', 0, 1365445954),
(219, 0, 'block_mentees', NULL, '2012112902', 'Starting plugin installation', NULL, '', 0, 1365445954),
(220, 0, 'block_mentees', '2012112902', '2012112902', 'Plugin installed', NULL, '', 0, 1365445954),
(221, 0, 'block_messages', NULL, '2012112900', 'Starting plugin installation', NULL, '', 0, 1365445954),
(222, 0, 'block_messages', '2012112900', '2012112900', 'Plugin installed', NULL, '', 0, 1365445954),
(223, 0, 'block_mnet_hosts', NULL, '2012112900', 'Starting plugin installation', NULL, '', 0, 1365445954),
(224, 0, 'block_mnet_hosts', '2012112900', '2012112900', 'Plugin installed', NULL, '', 0, 1365445954),
(225, 0, 'block_myprofile', NULL, '2012112900', 'Starting plugin installation', NULL, '', 0, 1365445954),
(226, 0, 'block_myprofile', '2012112900', '2012112900', 'Plugin installed', NULL, '', 0, 1365445954),
(227, 0, 'block_navigation', NULL, '2012112901', 'Starting plugin installation', NULL, '', 0, 1365445954),
(228, 0, 'block_navigation', '2012112901', '2012112901', 'Plugin installed', NULL, '', 0, 1365445954),
(229, 0, 'block_news_items', NULL, '2012112902', 'Starting plugin installation', NULL, '', 0, 1365445955),
(230, 0, 'block_news_items', '2012112902', '2012112902', 'Plugin installed', NULL, '', 0, 1365445955),
(231, 0, 'block_online_users', NULL, '2012112902', 'Starting plugin installation', NULL, '', 0, 1365445955),
(232, 0, 'block_online_users', '2012112902', '2012112902', 'Plugin installed', NULL, '', 0, 1365445955),
(233, 0, 'block_participants', NULL, '2012112900', 'Starting plugin installation', NULL, '', 0, 1365445955),
(234, 0, 'block_participants', '2012112900', '2012112900', 'Plugin installed', NULL, '', 0, 1365445955),
(235, 0, 'block_private_files', NULL, '2012112900', 'Starting plugin installation', NULL, '', 0, 1365445955),
(236, 0, 'block_private_files', '2012112900', '2012112900', 'Plugin installed', NULL, '', 0, 1365445955),
(237, 0, 'block_quiz_results', NULL, '2012112900', 'Starting plugin installation', NULL, '', 0, 1365445955),
(238, 0, 'block_quiz_results', '2012112900', '2012112900', 'Plugin installed', NULL, '', 0, 1365445955),
(239, 0, 'block_recent_activity', NULL, '2012112900', 'Starting plugin installation', NULL, '', 0, 1365445955),
(240, 0, 'block_recent_activity', '2012112900', '2012112900', 'Plugin installed', NULL, '', 0, 1365445956),
(241, 0, 'block_rss_client', NULL, '2012112900', 'Starting plugin installation', NULL, '', 0, 1365445956),
(242, 0, 'block_rss_client', '2012112900', '2012112900', 'Plugin installed', NULL, '', 0, 1365445956),
(243, 0, 'block_search_forums', NULL, '2012112900', 'Starting plugin installation', NULL, '', 0, 1365445956),
(244, 0, 'block_search_forums', '2012112900', '2012112900', 'Plugin installed', NULL, '', 0, 1365445956),
(245, 0, 'block_section_links', NULL, '2012112900', 'Starting plugin installation', NULL, '', 0, 1365445956),
(246, 0, 'block_section_links', '2012112900', '2012112900', 'Plugin installed', NULL, '', 0, 1365445956),
(247, 0, 'block_selfcompletion', NULL, '2012112901', 'Starting plugin installation', NULL, '', 0, 1365445956),
(248, 0, 'block_selfcompletion', '2012112901', '2012112901', 'Plugin installed', NULL, '', 0, 1365445956),
(249, 0, 'block_settings', NULL, '2012112900', 'Starting plugin installation', NULL, '', 0, 1365445956),
(250, 0, 'block_settings', '2012112900', '2012112900', 'Plugin installed', NULL, '', 0, 1365445956),
(251, 0, 'block_site_main_menu', NULL, '2012112900', 'Starting plugin installation', NULL, '', 0, 1365445956),
(252, 0, 'block_site_main_menu', '2012112900', '2012112900', 'Plugin installed', NULL, '', 0, 1365445956),
(253, 0, 'block_social_activities', NULL, '2012112900', 'Starting plugin installation', NULL, '', 0, 1365445957),
(254, 0, 'block_social_activities', '2012112900', '2012112900', 'Plugin installed', NULL, '', 0, 1365445957),
(255, 0, 'block_tag_flickr', NULL, '2012112900', 'Starting plugin installation', NULL, '', 0, 1365445957),
(256, 0, 'block_tag_flickr', '2012112900', '2012112900', 'Plugin installed', NULL, '', 0, 1365445957),
(257, 0, 'block_tag_youtube', NULL, '2012112900', 'Starting plugin installation', NULL, '', 0, 1365445957),
(258, 0, 'block_tag_youtube', '2012112900', '2012112900', 'Plugin installed', NULL, '', 0, 1365445957),
(259, 0, 'block_tags', NULL, '2012112900', 'Starting plugin installation', NULL, '', 0, 1365445957),
(260, 0, 'block_tags', '2012112900', '2012112900', 'Plugin installed', NULL, '', 0, 1365445957),
(261, 0, 'filter_activitynames', NULL, '2012112900', 'Starting plugin installation', NULL, '', 0, 1365445957),
(262, 0, 'filter_activitynames', '2012112900', '2012112900', 'Upgrade savepoint reached', NULL, '', 0, 1365445957),
(263, 0, 'filter_activitynames', '2012112900', '2012112900', 'Plugin installed', NULL, '', 0, 1365445958),
(264, 0, 'filter_algebra', NULL, '2012112900', 'Starting plugin installation', NULL, '', 0, 1365445958),
(265, 0, 'filter_algebra', '2012112900', '2012112900', 'Upgrade savepoint reached', NULL, '', 0, 1365445958),
(266, 0, 'filter_algebra', '2012112900', '2012112900', 'Plugin installed', NULL, '', 0, 1365445958),
(267, 0, 'filter_censor', NULL, '2012112900', 'Starting plugin installation', NULL, '', 0, 1365445958),
(268, 0, 'filter_censor', '2012112900', '2012112900', 'Upgrade savepoint reached', NULL, '', 0, 1365445958),
(269, 0, 'filter_censor', '2012112900', '2012112900', 'Plugin installed', NULL, '', 0, 1365445958),
(270, 0, 'filter_data', NULL, '2012112900', 'Starting plugin installation', NULL, '', 0, 1365445958),
(271, 0, 'filter_data', '2012112900', '2012112900', 'Upgrade savepoint reached', NULL, '', 0, 1365445958),
(272, 0, 'filter_data', '2012112900', '2012112900', 'Plugin installed', NULL, '', 0, 1365445958),
(273, 0, 'filter_emailprotect', NULL, '2012112900', 'Starting plugin installation', NULL, '', 0, 1365445958),
(274, 0, 'filter_emailprotect', '2012112900', '2012112900', 'Upgrade savepoint reached', NULL, '', 0, 1365445958),
(275, 0, 'filter_emailprotect', '2012112900', '2012112900', 'Plugin installed', NULL, '', 0, 1365445958),
(276, 0, 'filter_emoticon', NULL, '2012112900', 'Starting plugin installation', NULL, '', 0, 1365445958),
(277, 0, 'filter_emoticon', '2012112900', '2012112900', 'Upgrade savepoint reached', NULL, '', 0, 1365445958),
(278, 0, 'filter_emoticon', '2012112900', '2012112900', 'Plugin installed', NULL, '', 0, 1365445959),
(279, 0, 'filter_glossary', NULL, '2012112900', 'Starting plugin installation', NULL, '', 0, 1365445959),
(280, 0, 'filter_glossary', '2012112900', '2012112900', 'Upgrade savepoint reached', NULL, '', 0, 1365445959),
(281, 0, 'filter_glossary', '2012112900', '2012112900', 'Plugin installed', NULL, '', 0, 1365445959),
(282, 0, 'filter_mediaplugin', NULL, '2012112900', 'Starting plugin installation', NULL, '', 0, 1365445959),
(283, 0, 'filter_mediaplugin', '2012112900', '2012112900', 'Upgrade savepoint reached', NULL, '', 0, 1365445959),
(284, 0, 'filter_mediaplugin', '2012112900', '2012112900', 'Plugin installed', NULL, '', 0, 1365445959),
(285, 0, 'filter_multilang', NULL, '2012112900', 'Starting plugin installation', NULL, '', 0, 1365445959),
(286, 0, 'filter_multilang', '2012112900', '2012112900', 'Upgrade savepoint reached', NULL, '', 0, 1365445959),
(287, 0, 'filter_multilang', '2012112900', '2012112900', 'Plugin installed', NULL, '', 0, 1365445959),
(288, 0, 'filter_tex', NULL, '2012112900', 'Starting plugin installation', NULL, '', 0, 1365445959),
(289, 0, 'filter_tex', '2012112900', '2012112900', 'Upgrade savepoint reached', NULL, '', 0, 1365445959),
(290, 0, 'filter_tex', '2012112900', '2012112900', 'Plugin installed', NULL, '', 0, 1365445959),
(291, 0, 'filter_tidy', NULL, '2012112900', 'Starting plugin installation', NULL, '', 0, 1365445959),
(292, 0, 'filter_tidy', '2012112900', '2012112900', 'Upgrade savepoint reached', NULL, '', 0, 1365445959),
(293, 0, 'filter_tidy', '2012112900', '2012112900', 'Plugin installed', NULL, '', 0, 1365445959),
(294, 0, 'filter_urltolink', NULL, '2012112900', 'Starting plugin installation', NULL, '', 0, 1365445959),
(295, 0, 'filter_urltolink', '2012112900', '2012112900', 'Upgrade savepoint reached', NULL, '', 0, 1365445959),
(296, 0, 'filter_urltolink', '2012112900', '2012112900', 'Plugin installed', NULL, '', 0, 1365445959),
(297, 0, 'editor_textarea', NULL, '2012112900', 'Starting plugin installation', NULL, '', 0, 1365445959),
(298, 0, 'editor_textarea', '2012112900', '2012112900', 'Upgrade savepoint reached', NULL, '', 0, 1365445959),
(299, 0, 'editor_textarea', '2012112900', '2012112900', 'Plugin installed', NULL, '', 0, 1365445959),
(300, 0, 'editor_tinymce', NULL, '2012112900', 'Starting plugin installation', NULL, '', 0, 1365445960),
(301, 0, 'editor_tinymce', '2012112900', '2012112900', 'Upgrade savepoint reached', NULL, '', 0, 1365445960),
(302, 0, 'editor_tinymce', '2012112900', '2012112900', 'Plugin installed', NULL, '', 0, 1365445960),
(303, 0, 'format_scorm', NULL, '2012112900', 'Starting plugin installation', NULL, '', 0, 1365445960),
(304, 0, 'format_scorm', '2012112900', '2012112900', 'Upgrade savepoint reached', NULL, '', 0, 1365445960),
(305, 0, 'format_scorm', '2012112900', '2012112900', 'Plugin installed', NULL, '', 0, 1365445960),
(306, 0, 'format_social', NULL, '2012112900', 'Starting plugin installation', NULL, '', 0, 1365445960),
(307, 0, 'format_social', '2012112900', '2012112900', 'Upgrade savepoint reached', NULL, '', 0, 1365445960),
(308, 0, 'format_social', '2012112900', '2012112900', 'Plugin installed', NULL, '', 0, 1365445960),
(309, 0, 'format_topics', NULL, '2012112900', 'Starting plugin installation', NULL, '', 0, 1365445960),
(310, 0, 'format_topics', '2012112900', '2012112900', 'Upgrade savepoint reached', NULL, '', 0, 1365445960),
(311, 0, 'format_topics', '2012112900', '2012112900', 'Plugin installed', NULL, '', 0, 1365445960),
(312, 0, 'format_weeks', NULL, '2012112900', 'Starting plugin installation', NULL, '', 0, 1365445960),
(313, 0, 'format_weeks', '2012112900', '2012112900', 'Upgrade savepoint reached', NULL, '', 0, 1365445960),
(314, 0, 'format_weeks', '2012112900', '2012112900', 'Plugin installed', NULL, '', 0, 1365445961),
(315, 0, 'profilefield_checkbox', NULL, '2012112900', 'Starting plugin installation', NULL, '', 0, 1365445961),
(316, 0, 'profilefield_checkbox', '2012112900', '2012112900', 'Upgrade savepoint reached', NULL, '', 0, 1365445961),
(317, 0, 'profilefield_checkbox', '2012112900', '2012112900', 'Plugin installed', NULL, '', 0, 1365445961),
(318, 0, 'profilefield_datetime', NULL, '2012112900', 'Starting plugin installation', NULL, '', 0, 1365445961),
(319, 0, 'profilefield_datetime', '2012112900', '2012112900', 'Upgrade savepoint reached', NULL, '', 0, 1365445961),
(320, 0, 'profilefield_datetime', '2012112900', '2012112900', 'Plugin installed', NULL, '', 0, 1365445961),
(321, 0, 'profilefield_menu', NULL, '2012112900', 'Starting plugin installation', NULL, '', 0, 1365445961),
(322, 0, 'profilefield_menu', '2012112900', '2012112900', 'Upgrade savepoint reached', NULL, '', 0, 1365445961),
(323, 0, 'profilefield_menu', '2012112900', '2012112900', 'Plugin installed', NULL, '', 0, 1365445961),
(324, 0, 'profilefield_text', NULL, '2012112900', 'Starting plugin installation', NULL, '', 0, 1365445961),
(325, 0, 'profilefield_text', '2012112900', '2012112900', 'Upgrade savepoint reached', NULL, '', 0, 1365445962),
(326, 0, 'profilefield_text', '2012112900', '2012112900', 'Plugin installed', NULL, '', 0, 1365445962),
(327, 0, 'profilefield_textarea', NULL, '2012112900', 'Starting plugin installation', NULL, '', 0, 1365445962),
(328, 0, 'profilefield_textarea', '2012112900', '2012112900', 'Upgrade savepoint reached', NULL, '', 0, 1365445962),
(329, 0, 'profilefield_textarea', '2012112900', '2012112900', 'Plugin installed', NULL, '', 0, 1365445962),
(330, 0, 'report_backups', NULL, '2012112900', 'Starting plugin installation', NULL, '', 0, 1365445962),
(331, 0, 'report_backups', '2012112900', '2012112900', 'Upgrade savepoint reached', NULL, '', 0, 1365445962),
(332, 0, 'report_backups', '2012112900', '2012112900', 'Plugin installed', NULL, '', 0, 1365445962),
(333, 0, 'report_completion', NULL, '2012112900', 'Starting plugin installation', NULL, '', 0, 1365445962),
(334, 0, 'report_completion', '2012112900', '2012112900', 'Upgrade savepoint reached', NULL, '', 0, 1365445962),
(335, 0, 'report_completion', '2012112900', '2012112900', 'Plugin installed', NULL, '', 0, 1365445962),
(336, 0, 'report_configlog', NULL, '2012112900', 'Starting plugin installation', NULL, '', 0, 1365445962),
(337, 0, 'report_configlog', '2012112900', '2012112900', 'Upgrade savepoint reached', NULL, '', 0, 1365445962),
(338, 0, 'report_configlog', '2012112900', '2012112900', 'Plugin installed', NULL, '', 0, 1365445962),
(339, 0, 'report_courseoverview', NULL, '2012112900', 'Starting plugin installation', NULL, '', 0, 1365445962),
(340, 0, 'report_courseoverview', '2012112900', '2012112900', 'Upgrade savepoint reached', NULL, '', 0, 1365445962),
(341, 0, 'report_courseoverview', '2012112900', '2012112900', 'Plugin installed', NULL, '', 0, 1365445962),
(342, 0, 'report_log', NULL, '2012112900', 'Starting plugin installation', NULL, '', 0, 1365445962),
(343, 0, 'report_log', '2012112900', '2012112900', 'Upgrade savepoint reached', NULL, '', 0, 1365445962),
(344, 0, 'report_log', '2012112900', '2012112900', 'Plugin installed', NULL, '', 0, 1365445962),
(345, 0, 'report_loglive', NULL, '2012112900', 'Starting plugin installation', NULL, '', 0, 1365445962),
(346, 0, 'report_loglive', '2012112900', '2012112900', 'Upgrade savepoint reached', NULL, '', 0, 1365445962),
(347, 0, 'report_loglive', '2012112900', '2012112900', 'Plugin installed', NULL, '', 0, 1365445962),
(348, 0, 'report_outline', NULL, '2012112900', 'Starting plugin installation', NULL, '', 0, 1365445962),
(349, 0, 'report_outline', '2012112900', '2012112900', 'Upgrade savepoint reached', NULL, '', 0, 1365445962),
(350, 0, 'report_outline', '2012112900', '2012112900', 'Plugin installed', NULL, '', 0, 1365445963),
(351, 0, 'report_participation', NULL, '2012112900', 'Starting plugin installation', NULL, '', 0, 1365445963),
(352, 0, 'report_participation', '2012112900', '2012112900', 'Upgrade savepoint reached', NULL, '', 0, 1365445963),
(353, 0, 'report_participation', '2012112900', '2012112900', 'Plugin installed', NULL, '', 0, 1365445963),
(354, 0, 'report_progress', NULL, '2012112900', 'Starting plugin installation', NULL, '', 0, 1365445963),
(355, 0, 'report_progress', '2012112900', '2012112900', 'Upgrade savepoint reached', NULL, '', 0, 1365445963),
(356, 0, 'report_progress', '2012112900', '2012112900', 'Plugin installed', NULL, '', 0, 1365445963),
(357, 0, 'report_questioninstances', NULL, '2012112900', 'Starting plugin installation', NULL, '', 0, 1365445963),
(358, 0, 'report_questioninstances', '2012112900', '2012112900', 'Upgrade savepoint reached', NULL, '', 0, 1365445963),
(359, 0, 'report_questioninstances', '2012112900', '2012112900', 'Plugin installed', NULL, '', 0, 1365445963),
(360, 0, 'report_security', NULL, '2012112900', 'Starting plugin installation', NULL, '', 0, 1365445963),
(361, 0, 'report_security', '2012112900', '2012112900', 'Upgrade savepoint reached', NULL, '', 0, 1365445963),
(362, 0, 'report_security', '2012112900', '2012112900', 'Plugin installed', NULL, '', 0, 1365445963),
(363, 0, 'report_stats', NULL, '2012112900', 'Starting plugin installation', NULL, '', 0, 1365445963),
(364, 0, 'report_stats', '2012112900', '2012112900', 'Upgrade savepoint reached', NULL, '', 0, 1365445963),
(365, 0, 'report_stats', '2012112900', '2012112900', 'Plugin installed', NULL, '', 0, 1365445963),
(366, 0, 'gradeexport_ods', NULL, '2012112900', 'Starting plugin installation', NULL, '', 0, 1365445963),
(367, 0, 'gradeexport_ods', '2012112900', '2012112900', 'Upgrade savepoint reached', NULL, '', 0, 1365445963),
(368, 0, 'gradeexport_ods', '2012112900', '2012112900', 'Plugin installed', NULL, '', 0, 1365445963),
(369, 0, 'gradeexport_txt', NULL, '2012112900', 'Starting plugin installation', NULL, '', 0, 1365445964),
(370, 0, 'gradeexport_txt', '2012112900', '2012112900', 'Upgrade savepoint reached', NULL, '', 0, 1365445964),
(371, 0, 'gradeexport_txt', '2012112900', '2012112900', 'Plugin installed', NULL, '', 0, 1365445964),
(372, 0, 'gradeexport_xls', NULL, '2012112900', 'Starting plugin installation', NULL, '', 0, 1365445964),
(373, 0, 'gradeexport_xls', '2012112900', '2012112900', 'Upgrade savepoint reached', NULL, '', 0, 1365445964),
(374, 0, 'gradeexport_xls', '2012112900', '2012112900', 'Plugin installed', NULL, '', 0, 1365445964),
(375, 0, 'gradeexport_xml', NULL, '2012112900', 'Starting plugin installation', NULL, '', 0, 1365445964),
(376, 0, 'gradeexport_xml', '2012112900', '2012112900', 'Upgrade savepoint reached', NULL, '', 0, 1365445964),
(377, 0, 'gradeexport_xml', '2012112900', '2012112900', 'Plugin installed', NULL, '', 0, 1365445964),
(378, 0, 'gradeimport_csv', NULL, '2012112900', 'Starting plugin installation', NULL, '', 0, 1365445964),
(379, 0, 'gradeimport_csv', '2012112900', '2012112900', 'Upgrade savepoint reached', NULL, '', 0, 1365445964),
(380, 0, 'gradeimport_csv', '2012112900', '2012112900', 'Plugin installed', NULL, '', 0, 1365445964),
(381, 0, 'gradeimport_xml', NULL, '2012112900', 'Starting plugin installation', NULL, '', 0, 1365445964),
(382, 0, 'gradeimport_xml', '2012112900', '2012112900', 'Upgrade savepoint reached', NULL, '', 0, 1365445964),
(383, 0, 'gradeimport_xml', '2012112900', '2012112900', 'Plugin installed', NULL, '', 0, 1365445964),
(384, 0, 'gradereport_grader', NULL, '2012112900', 'Starting plugin installation', NULL, '', 0, 1365445964),
(385, 0, 'gradereport_grader', '2012112900', '2012112900', 'Upgrade savepoint reached', NULL, '', 0, 1365445964),
(386, 0, 'gradereport_grader', '2012112900', '2012112900', 'Plugin installed', NULL, '', 0, 1365445964),
(387, 0, 'gradereport_outcomes', NULL, '2012112900', 'Starting plugin installation', NULL, '', 0, 1365445965),
(388, 0, 'gradereport_outcomes', '2012112900', '2012112900', 'Upgrade savepoint reached', NULL, '', 0, 1365445965),
(389, 0, 'gradereport_outcomes', '2012112900', '2012112900', 'Plugin installed', NULL, '', 0, 1365445965),
(390, 0, 'gradereport_overview', NULL, '2012112900', 'Starting plugin installation', NULL, '', 0, 1365445965),
(391, 0, 'gradereport_overview', '2012112900', '2012112900', 'Upgrade savepoint reached', NULL, '', 0, 1365445965),
(392, 0, 'gradereport_overview', '2012112900', '2012112900', 'Plugin installed', NULL, '', 0, 1365445965),
(393, 0, 'gradereport_user', NULL, '2012112900', 'Starting plugin installation', NULL, '', 0, 1365445965),
(394, 0, 'gradereport_user', '2012112900', '2012112900', 'Upgrade savepoint reached', NULL, '', 0, 1365445965),
(395, 0, 'gradereport_user', '2012112900', '2012112900', 'Plugin installed', NULL, '', 0, 1365445965),
(396, 0, 'gradingform_guide', NULL, '2012112900', 'Starting plugin installation', NULL, '', 0, 1365445965),
(397, 0, 'gradingform_guide', '2012112900', '2012112900', 'Upgrade savepoint reached', NULL, '', 0, 1365445970),
(398, 0, 'gradingform_guide', '2012112900', '2012112900', 'Plugin installed', NULL, '', 0, 1365445970),
(399, 0, 'gradingform_rubric', NULL, '2012112900', 'Starting plugin installation', NULL, '', 0, 1365445970),
(400, 0, 'gradingform_rubric', '2012112900', '2012112900', 'Upgrade savepoint reached', NULL, '', 0, 1365445970),
(401, 0, 'gradingform_rubric', '2012112900', '2012112900', 'Plugin installed', NULL, '', 0, 1365445970),
(402, 0, 'mnetservice_enrol', NULL, '2012112900', 'Starting plugin installation', NULL, '', 0, 1365445971),
(403, 0, 'mnetservice_enrol', '2012112900', '2012112900', 'Upgrade savepoint reached', NULL, '', 0, 1365445971),
(404, 0, 'mnetservice_enrol', '2012112900', '2012112900', 'Plugin installed', NULL, '', 0, 1365445971),
(405, 0, 'webservice_amf', NULL, '2012112900', 'Starting plugin installation', NULL, '', 0, 1365445971),
(406, 0, 'webservice_amf', '2012112900', '2012112900', 'Upgrade savepoint reached', NULL, '', 0, 1365445971),
(407, 0, 'webservice_amf', '2012112900', '2012112900', 'Plugin installed', NULL, '', 0, 1365445971),
(408, 0, 'webservice_rest', NULL, '2012112900', 'Starting plugin installation', NULL, '', 0, 1365445971),
(409, 0, 'webservice_rest', '2012112900', '2012112900', 'Upgrade savepoint reached', NULL, '', 0, 1365445971),
(410, 0, 'webservice_rest', '2012112900', '2012112900', 'Plugin installed', NULL, '', 0, 1365445971),
(411, 0, 'webservice_soap', NULL, '2012112900', 'Starting plugin installation', NULL, '', 0, 1365445971),
(412, 0, 'webservice_soap', '2012112900', '2012112900', 'Upgrade savepoint reached', NULL, '', 0, 1365445971),
(413, 0, 'webservice_soap', '2012112900', '2012112900', 'Plugin installed', NULL, '', 0, 1365445971),
(414, 0, 'webservice_xmlrpc', NULL, '2012112900', 'Starting plugin installation', NULL, '', 0, 1365445971),
(415, 0, 'webservice_xmlrpc', '2012112900', '2012112900', 'Upgrade savepoint reached', NULL, '', 0, 1365445971),
(416, 0, 'webservice_xmlrpc', '2012112900', '2012112900', 'Plugin installed', NULL, '', 0, 1365445971),
(417, 0, 'repository_alfresco', NULL, '2012112900', 'Starting plugin installation', NULL, '', 0, 1365445971),
(418, 0, 'repository_alfresco', '2012112900', '2012112900', 'Upgrade savepoint reached', NULL, '', 0, 1365445972),
(419, 0, 'repository_alfresco', '2012112900', '2012112900', 'Plugin installed', NULL, '', 0, 1365445972),
(420, 0, 'repository_boxnet', NULL, '2012112900', 'Starting plugin installation', NULL, '', 0, 1365445972),
(421, 0, 'repository_boxnet', '2012112900', '2012112900', 'Upgrade savepoint reached', NULL, '', 0, 1365445972),
(422, 0, 'repository_boxnet', '2012112900', '2012112900', 'Plugin installed', NULL, '', 0, 1365445972),
(423, 0, 'repository_coursefiles', NULL, '2012112900', 'Starting plugin installation', NULL, '', 0, 1365445972),
(424, 0, 'repository_coursefiles', '2012112900', '2012112900', 'Upgrade savepoint reached', NULL, '', 0, 1365445972),
(425, 0, 'repository_coursefiles', '2012112900', '2012112900', 'Plugin installed', NULL, '', 0, 1365445972),
(426, 0, 'repository_dropbox', NULL, '2012112900', 'Starting plugin installation', NULL, '', 0, 1365445972),
(427, 0, 'repository_dropbox', '2012112900', '2012112900', 'Upgrade savepoint reached', NULL, '', 0, 1365445972),
(428, 0, 'repository_dropbox', '2012112900', '2012112900', 'Plugin installed', NULL, '', 0, 1365445973),
(429, 0, 'repository_equella', NULL, '2012112900', 'Starting plugin installation', NULL, '', 0, 1365445973),
(430, 0, 'repository_equella', '2012112900', '2012112900', 'Upgrade savepoint reached', NULL, '', 0, 1365445973),
(431, 0, 'repository_equella', '2012112900', '2012112900', 'Plugin installed', NULL, '', 0, 1365445973),
(432, 0, 'repository_filesystem', NULL, '2012112900', 'Starting plugin installation', NULL, '', 0, 1365445973),
(433, 0, 'repository_filesystem', '2012112900', '2012112900', 'Upgrade savepoint reached', NULL, '', 0, 1365445973),
(434, 0, 'repository_filesystem', '2012112900', '2012112900', 'Plugin installed', NULL, '', 0, 1365445973),
(435, 0, 'repository_flickr', NULL, '2012112900', 'Starting plugin installation', NULL, '', 0, 1365445973),
(436, 0, 'repository_flickr', '2012112900', '2012112900', 'Upgrade savepoint reached', NULL, '', 0, 1365445973),
(437, 0, 'repository_flickr', '2012112900', '2012112900', 'Plugin installed', NULL, '', 0, 1365445974),
(438, 0, 'repository_flickr_public', NULL, '2012112900', 'Starting plugin installation', NULL, '', 0, 1365445974),
(439, 0, 'repository_flickr_public', '2012112900', '2012112900', 'Upgrade savepoint reached', NULL, '', 0, 1365445974),
(440, 0, 'repository_flickr_public', '2012112900', '2012112900', 'Plugin installed', NULL, '', 0, 1365445974),
(441, 0, 'repository_googledocs', NULL, '2012112900', 'Starting plugin installation', NULL, '', 0, 1365445974),
(442, 0, 'repository_googledocs', '2012112900', '2012112900', 'Upgrade savepoint reached', NULL, '', 0, 1365445974),
(443, 0, 'repository_googledocs', '2012112900', '2012112900', 'Plugin installed', NULL, '', 0, 1365445974),
(444, 0, 'repository_local', NULL, '2012112900', 'Starting plugin installation', NULL, '', 0, 1365445974),
(445, 0, 'repository_local', '2012112900', '2012112900', 'Upgrade savepoint reached', NULL, '', 0, 1365445974),
(446, 0, 'repository_local', '2012112900', '2012112900', 'Plugin installed', NULL, '', 0, 1365445975),
(447, 0, 'repository_merlot', NULL, '2012112900', 'Starting plugin installation', NULL, '', 0, 1365445975),
(448, 0, 'repository_merlot', '2012112900', '2012112900', 'Upgrade savepoint reached', NULL, '', 0, 1365445975),
(449, 0, 'repository_merlot', '2012112900', '2012112900', 'Plugin installed', NULL, '', 0, 1365445975),
(450, 0, 'repository_picasa', NULL, '2012112900', 'Starting plugin installation', NULL, '', 0, 1365445975),
(451, 0, 'repository_picasa', '2012112900', '2012112900', 'Upgrade savepoint reached', NULL, '', 0, 1365445975),
(452, 0, 'repository_picasa', '2012112900', '2012112900', 'Plugin installed', NULL, '', 0, 1365445976),
(453, 0, 'repository_recent', NULL, '2012112900', 'Starting plugin installation', NULL, '', 0, 1365445976),
(454, 0, 'repository_recent', '2012112900', '2012112900', 'Upgrade savepoint reached', NULL, '', 0, 1365445976),
(455, 0, 'repository_recent', '2012112900', '2012112900', 'Plugin installed', NULL, '', 0, 1365445976),
(456, 0, 'repository_s3', NULL, '2012112900', 'Starting plugin installation', NULL, '', 0, 1365445977),
(457, 0, 'repository_s3', '2012112900', '2012112900', 'Upgrade savepoint reached', NULL, '', 0, 1365445977),
(458, 0, 'repository_s3', '2012112900', '2012112900', 'Plugin installed', NULL, '', 0, 1365445977),
(459, 0, 'repository_upload', NULL, '2012112900', 'Starting plugin installation', NULL, '', 0, 1365445977),
(460, 0, 'repository_upload', '2012112900', '2012112900', 'Upgrade savepoint reached', NULL, '', 0, 1365445977),
(461, 0, 'repository_upload', '2012112900', '2012112900', 'Plugin installed', NULL, '', 0, 1365445977),
(462, 0, 'repository_url', NULL, '2012112900', 'Starting plugin installation', NULL, '', 0, 1365445977),
(463, 0, 'repository_url', '2012112900', '2012112900', 'Upgrade savepoint reached', NULL, '', 0, 1365445977),
(464, 0, 'repository_url', '2012112900', '2012112900', 'Plugin installed', NULL, '', 0, 1365445977),
(465, 0, 'repository_user', NULL, '2012112900', 'Starting plugin installation', NULL, '', 0, 1365445977),
(466, 0, 'repository_user', '2012112900', '2012112900', 'Upgrade savepoint reached', NULL, '', 0, 1365445977),
(467, 0, 'repository_user', '2012112900', '2012112900', 'Plugin installed', NULL, '', 0, 1365445977),
(468, 0, 'repository_webdav', NULL, '2012112900', 'Starting plugin installation', NULL, '', 0, 1365445977),
(469, 0, 'repository_webdav', '2012112900', '2012112900', 'Upgrade savepoint reached', NULL, '', 0, 1365445977),
(470, 0, 'repository_webdav', '2012112900', '2012112900', 'Plugin installed', NULL, '', 0, 1365445978),
(471, 0, 'repository_wikimedia', NULL, '2012112900', 'Starting plugin installation', NULL, '', 0, 1365445978),
(472, 0, 'repository_wikimedia', '2012112900', '2012112900', 'Upgrade savepoint reached', NULL, '', 0, 1365445978),
(473, 0, 'repository_wikimedia', '2012112900', '2012112900', 'Plugin installed', NULL, '', 0, 1365445978),
(474, 0, 'repository_youtube', NULL, '2012112900', 'Starting plugin installation', NULL, '', 0, 1365445978),
(475, 0, 'repository_youtube', '2012112900', '2012112900', 'Upgrade savepoint reached', NULL, '', 0, 1365445978),
(476, 0, 'repository_youtube', '2012112900', '2012112900', 'Plugin installed', NULL, '', 0, 1365445979),
(477, 0, 'portfolio_boxnet', NULL, '2012112900', 'Starting plugin installation', NULL, '', 0, 1365445979),
(478, 0, 'portfolio_boxnet', '2012112900', '2012112900', 'Upgrade savepoint reached', NULL, '', 0, 1365445979),
(479, 0, 'portfolio_boxnet', '2012112900', '2012112900', 'Plugin installed', NULL, '', 0, 1365445980),
(480, 0, 'portfolio_download', NULL, '2012112900', 'Starting plugin installation', NULL, '', 0, 1365445980),
(481, 0, 'portfolio_download', '2012112900', '2012112900', 'Upgrade savepoint reached', NULL, '', 0, 1365445980),
(482, 0, 'portfolio_download', '2012112900', '2012112900', 'Plugin installed', NULL, '', 0, 1365445980);
INSERT INTO `mdl_upgrade_log` (`id`, `type`, `plugin`, `version`, `targetversion`, `info`, `details`, `backtrace`, `userid`, `timemodified`) VALUES
(483, 0, 'portfolio_flickr', NULL, '2012112900', 'Starting plugin installation', NULL, '', 0, 1365445980),
(484, 0, 'portfolio_flickr', '2012112900', '2012112900', 'Upgrade savepoint reached', NULL, '', 0, 1365445980),
(485, 0, 'portfolio_flickr', '2012112900', '2012112900', 'Plugin installed', NULL, '', 0, 1365445980),
(486, 0, 'portfolio_googledocs', NULL, '2012112900', 'Starting plugin installation', NULL, '', 0, 1365445980),
(487, 0, 'portfolio_googledocs', '2012112900', '2012112900', 'Upgrade savepoint reached', NULL, '', 0, 1365445980),
(488, 0, 'portfolio_googledocs', '2012112900', '2012112900', 'Plugin installed', NULL, '', 0, 1365445980),
(489, 0, 'portfolio_mahara', NULL, '2012112900', 'Starting plugin installation', NULL, '', 0, 1365445980),
(490, 0, 'portfolio_mahara', '2012112900', '2012112900', 'Upgrade savepoint reached', NULL, '', 0, 1365445995),
(491, 0, 'portfolio_mahara', '2012112900', '2012112900', 'Plugin installed', NULL, '', 0, 1365445996),
(492, 0, 'portfolio_picasa', NULL, '2012112900', 'Starting plugin installation', NULL, '', 0, 1365445996),
(493, 0, 'portfolio_picasa', '2012112900', '2012112900', 'Upgrade savepoint reached', NULL, '', 0, 1365445996),
(494, 0, 'portfolio_picasa', '2012112900', '2012112900', 'Plugin installed', NULL, '', 0, 1365445997),
(495, 0, 'qbehaviour_adaptive', NULL, '2012112900', 'Starting plugin installation', NULL, '', 0, 1365445997),
(496, 0, 'qbehaviour_adaptive', '2012112900', '2012112900', 'Upgrade savepoint reached', NULL, '', 0, 1365445997),
(497, 0, 'qbehaviour_adaptive', '2012112900', '2012112900', 'Plugin installed', NULL, '', 0, 1365445997),
(498, 0, 'qbehaviour_adaptivenopenalty', NULL, '2012112900', 'Starting plugin installation', NULL, '', 0, 1365445997),
(499, 0, 'qbehaviour_adaptivenopenalty', '2012112900', '2012112900', 'Upgrade savepoint reached', NULL, '', 0, 1365445997),
(500, 0, 'qbehaviour_adaptivenopenalty', '2012112900', '2012112900', 'Plugin installed', NULL, '', 0, 1365445997),
(501, 0, 'qbehaviour_deferredcbm', NULL, '2012112900', 'Starting plugin installation', NULL, '', 0, 1365445997),
(502, 0, 'qbehaviour_deferredcbm', '2012112900', '2012112900', 'Upgrade savepoint reached', NULL, '', 0, 1365445997),
(503, 0, 'qbehaviour_deferredcbm', '2012112900', '2012112900', 'Plugin installed', NULL, '', 0, 1365445997),
(504, 0, 'qbehaviour_deferredfeedback', NULL, '2012112900', 'Starting plugin installation', NULL, '', 0, 1365445997),
(505, 0, 'qbehaviour_deferredfeedback', '2012112900', '2012112900', 'Upgrade savepoint reached', NULL, '', 0, 1365445997),
(506, 0, 'qbehaviour_deferredfeedback', '2012112900', '2012112900', 'Plugin installed', NULL, '', 0, 1365445997),
(507, 0, 'qbehaviour_immediatecbm', NULL, '2012112900', 'Starting plugin installation', NULL, '', 0, 1365445997),
(508, 0, 'qbehaviour_immediatecbm', '2012112900', '2012112900', 'Upgrade savepoint reached', NULL, '', 0, 1365445997),
(509, 0, 'qbehaviour_immediatecbm', '2012112900', '2012112900', 'Plugin installed', NULL, '', 0, 1365445997),
(510, 0, 'qbehaviour_immediatefeedback', NULL, '2012112900', 'Starting plugin installation', NULL, '', 0, 1365445997),
(511, 0, 'qbehaviour_immediatefeedback', '2012112900', '2012112900', 'Upgrade savepoint reached', NULL, '', 0, 1365445997),
(512, 0, 'qbehaviour_immediatefeedback', '2012112900', '2012112900', 'Plugin installed', NULL, '', 0, 1365445997),
(513, 0, 'qbehaviour_informationitem', NULL, '2012112900', 'Starting plugin installation', NULL, '', 0, 1365445997),
(514, 0, 'qbehaviour_informationitem', '2012112900', '2012112900', 'Upgrade savepoint reached', NULL, '', 0, 1365445997),
(515, 0, 'qbehaviour_informationitem', '2012112900', '2012112900', 'Plugin installed', NULL, '', 0, 1365445997),
(516, 0, 'qbehaviour_interactive', NULL, '2012112900', 'Starting plugin installation', NULL, '', 0, 1365445997),
(517, 0, 'qbehaviour_interactive', '2012112900', '2012112900', 'Upgrade savepoint reached', NULL, '', 0, 1365445997),
(518, 0, 'qbehaviour_interactive', '2012112900', '2012112900', 'Plugin installed', NULL, '', 0, 1365445998),
(519, 0, 'qbehaviour_interactivecountback', NULL, '2012112900', 'Starting plugin installation', NULL, '', 0, 1365445998),
(520, 0, 'qbehaviour_interactivecountback', '2012112900', '2012112900', 'Upgrade savepoint reached', NULL, '', 0, 1365445998),
(521, 0, 'qbehaviour_interactivecountback', '2012112900', '2012112900', 'Plugin installed', NULL, '', 0, 1365445998),
(522, 0, 'qbehaviour_manualgraded', NULL, '2012112900', 'Starting plugin installation', NULL, '', 0, 1365445998),
(523, 0, 'qbehaviour_manualgraded', '2012112900', '2012112900', 'Upgrade savepoint reached', NULL, '', 0, 1365445998),
(524, 0, 'qbehaviour_manualgraded', '2012112900', '2012112900', 'Plugin installed', NULL, '', 0, 1365445998),
(525, 0, 'qbehaviour_missing', NULL, '2012112900', 'Starting plugin installation', NULL, '', 0, 1365445998),
(526, 0, 'qbehaviour_missing', '2012112900', '2012112900', 'Upgrade savepoint reached', NULL, '', 0, 1365445998),
(527, 0, 'qbehaviour_missing', '2012112900', '2012112900', 'Plugin installed', NULL, '', 0, 1365445998),
(528, 0, 'qformat_aiken', NULL, '2012112900', 'Starting plugin installation', NULL, '', 0, 1365445998),
(529, 0, 'qformat_aiken', '2012112900', '2012112900', 'Upgrade savepoint reached', NULL, '', 0, 1365445998),
(530, 0, 'qformat_aiken', '2012112900', '2012112900', 'Plugin installed', NULL, '', 0, 1365445998),
(531, 0, 'qformat_blackboard', NULL, '2012112900', 'Starting plugin installation', NULL, '', 0, 1365445998),
(532, 0, 'qformat_blackboard', '2012112900', '2012112900', 'Upgrade savepoint reached', NULL, '', 0, 1365445998),
(533, 0, 'qformat_blackboard', '2012112900', '2012112900', 'Plugin installed', NULL, '', 0, 1365445998),
(534, 0, 'qformat_blackboard_six', NULL, '2012112900', 'Starting plugin installation', NULL, '', 0, 1365445998),
(535, 0, 'qformat_blackboard_six', '2012112900', '2012112900', 'Upgrade savepoint reached', NULL, '', 0, 1365445998),
(536, 0, 'qformat_blackboard_six', '2012112900', '2012112900', 'Plugin installed', NULL, '', 0, 1365445998),
(537, 0, 'qformat_examview', NULL, '2012112900', 'Starting plugin installation', NULL, '', 0, 1365445998),
(538, 0, 'qformat_examview', '2012112900', '2012112900', 'Upgrade savepoint reached', NULL, '', 0, 1365445998),
(539, 0, 'qformat_examview', '2012112900', '2012112900', 'Plugin installed', NULL, '', 0, 1365445999),
(540, 0, 'qformat_gift', NULL, '2012112900', 'Starting plugin installation', NULL, '', 0, 1365445999),
(541, 0, 'qformat_gift', '2012112900', '2012112900', 'Upgrade savepoint reached', NULL, '', 0, 1365445999),
(542, 0, 'qformat_gift', '2012112900', '2012112900', 'Plugin installed', NULL, '', 0, 1365445999),
(543, 0, 'qformat_learnwise', NULL, '2012112900', 'Starting plugin installation', NULL, '', 0, 1365445999),
(544, 0, 'qformat_learnwise', '2012112900', '2012112900', 'Upgrade savepoint reached', NULL, '', 0, 1365445999),
(545, 0, 'qformat_learnwise', '2012112900', '2012112900', 'Plugin installed', NULL, '', 0, 1365445999),
(546, 0, 'qformat_missingword', NULL, '2012112900', 'Starting plugin installation', NULL, '', 0, 1365445999),
(547, 0, 'qformat_missingword', '2012112900', '2012112900', 'Upgrade savepoint reached', NULL, '', 0, 1365445999),
(548, 0, 'qformat_missingword', '2012112900', '2012112900', 'Plugin installed', NULL, '', 0, 1365445999),
(549, 0, 'qformat_multianswer', NULL, '2012112900', 'Starting plugin installation', NULL, '', 0, 1365445999),
(550, 0, 'qformat_multianswer', '2012112900', '2012112900', 'Upgrade savepoint reached', NULL, '', 0, 1365445999),
(551, 0, 'qformat_multianswer', '2012112900', '2012112900', 'Plugin installed', NULL, '', 0, 1365446000),
(552, 0, 'qformat_webct', NULL, '2012112900', 'Starting plugin installation', NULL, '', 0, 1365446000),
(553, 0, 'qformat_webct', '2012112900', '2012112900', 'Upgrade savepoint reached', NULL, '', 0, 1365446000),
(554, 0, 'qformat_webct', '2012112900', '2012112900', 'Plugin installed', NULL, '', 0, 1365446000),
(555, 0, 'qformat_xhtml', NULL, '2012112900', 'Starting plugin installation', NULL, '', 0, 1365446000),
(556, 0, 'qformat_xhtml', '2012112900', '2012112900', 'Upgrade savepoint reached', NULL, '', 0, 1365446000),
(557, 0, 'qformat_xhtml', '2012112900', '2012112900', 'Plugin installed', NULL, '', 0, 1365446000),
(558, 0, 'qformat_xml', NULL, '2012112900', 'Starting plugin installation', NULL, '', 0, 1365446000),
(559, 0, 'qformat_xml', '2012112900', '2012112900', 'Upgrade savepoint reached', NULL, '', 0, 1365446000),
(560, 0, 'qformat_xml', '2012112900', '2012112900', 'Plugin installed', NULL, '', 0, 1365446000),
(561, 0, 'tool_assignmentupgrade', NULL, '2012112900', 'Starting plugin installation', NULL, '', 0, 1365446000),
(562, 0, 'tool_assignmentupgrade', '2012112900', '2012112900', 'Upgrade savepoint reached', NULL, '', 0, 1365446000),
(563, 0, 'tool_assignmentupgrade', '2012112900', '2012112900', 'Plugin installed', NULL, '', 0, 1365446000),
(564, 0, 'tool_capability', NULL, '2012112900', 'Starting plugin installation', NULL, '', 0, 1365446000),
(565, 0, 'tool_capability', '2012112900', '2012112900', 'Upgrade savepoint reached', NULL, '', 0, 1365446000),
(566, 0, 'tool_capability', '2012112900', '2012112900', 'Plugin installed', NULL, '', 0, 1365446000),
(567, 0, 'tool_customlang', NULL, '2012112900', 'Starting plugin installation', NULL, '', 0, 1365446000),
(568, 0, 'tool_customlang', '2012112900', '2012112900', 'Upgrade savepoint reached', NULL, '', 0, 1365446001),
(569, 0, 'tool_customlang', '2012112900', '2012112900', 'Plugin installed', NULL, '', 0, 1365446001),
(570, 0, 'tool_dbtransfer', NULL, '2012112900', 'Starting plugin installation', NULL, '', 0, 1365446001),
(571, 0, 'tool_dbtransfer', '2012112900', '2012112900', 'Upgrade savepoint reached', NULL, '', 0, 1365446001),
(572, 0, 'tool_dbtransfer', '2012112900', '2012112900', 'Plugin installed', NULL, '', 0, 1365446001),
(573, 0, 'tool_generator', NULL, '2012112900', 'Starting plugin installation', NULL, '', 0, 1365446001),
(574, 0, 'tool_generator', '2012112900', '2012112900', 'Upgrade savepoint reached', NULL, '', 0, 1365446001),
(575, 0, 'tool_generator', '2012112900', '2012112900', 'Plugin installed', NULL, '', 0, 1365446001),
(576, 0, 'tool_health', NULL, '2012112900', 'Starting plugin installation', NULL, '', 0, 1365446001),
(577, 0, 'tool_health', '2012112900', '2012112900', 'Upgrade savepoint reached', NULL, '', 0, 1365446001),
(578, 0, 'tool_health', '2012112900', '2012112900', 'Plugin installed', NULL, '', 0, 1365446002),
(579, 0, 'tool_innodb', NULL, '2012112900', 'Starting plugin installation', NULL, '', 0, 1365446002),
(580, 0, 'tool_innodb', '2012112900', '2012112900', 'Upgrade savepoint reached', NULL, '', 0, 1365446002),
(581, 0, 'tool_innodb', '2012112900', '2012112900', 'Plugin installed', NULL, '', 0, 1365446002),
(582, 0, 'tool_langimport', NULL, '2012112900', 'Starting plugin installation', NULL, '', 0, 1365446002),
(583, 0, 'tool_langimport', '2012112900', '2012112900', 'Upgrade savepoint reached', NULL, '', 0, 1365446002),
(584, 0, 'tool_langimport', '2012112900', '2012112900', 'Plugin installed', NULL, '', 0, 1365446002),
(585, 0, 'tool_multilangupgrade', NULL, '2012112900', 'Starting plugin installation', NULL, '', 0, 1365446002),
(586, 0, 'tool_multilangupgrade', '2012112900', '2012112900', 'Upgrade savepoint reached', NULL, '', 0, 1365446002),
(587, 0, 'tool_multilangupgrade', '2012112900', '2012112900', 'Plugin installed', NULL, '', 0, 1365446002),
(588, 0, 'tool_phpunit', NULL, '2012112900', 'Starting plugin installation', NULL, '', 0, 1365446002),
(589, 0, 'tool_phpunit', '2012112900', '2012112900', 'Upgrade savepoint reached', NULL, '', 0, 1365446002),
(590, 0, 'tool_phpunit', '2012112900', '2012112900', 'Plugin installed', NULL, '', 0, 1365446002),
(591, 0, 'tool_profiling', NULL, '2012112900', 'Starting plugin installation', NULL, '', 0, 1365446002),
(592, 0, 'tool_profiling', '2012112900', '2012112900', 'Upgrade savepoint reached', NULL, '', 0, 1365446002),
(593, 0, 'tool_profiling', '2012112900', '2012112900', 'Plugin installed', NULL, '', 0, 1365446002),
(594, 0, 'tool_qeupgradehelper', NULL, '2012112900', 'Starting plugin installation', NULL, '', 0, 1365446002),
(595, 0, 'tool_qeupgradehelper', '2012112900', '2012112900', 'Upgrade savepoint reached', NULL, '', 0, 1365446002),
(596, 0, 'tool_qeupgradehelper', '2012112900', '2012112900', 'Plugin installed', NULL, '', 0, 1365446003),
(597, 0, 'tool_replace', NULL, '2012112900', 'Starting plugin installation', NULL, '', 0, 1365446003),
(598, 0, 'tool_replace', '2012112900', '2012112900', 'Upgrade savepoint reached', NULL, '', 0, 1365446003),
(599, 0, 'tool_replace', '2012112900', '2012112900', 'Plugin installed', NULL, '', 0, 1365446003),
(600, 0, 'tool_spamcleaner', NULL, '2012112900', 'Starting plugin installation', NULL, '', 0, 1365446003),
(601, 0, 'tool_spamcleaner', '2012112900', '2012112900', 'Upgrade savepoint reached', NULL, '', 0, 1365446003),
(602, 0, 'tool_spamcleaner', '2012112900', '2012112900', 'Plugin installed', NULL, '', 0, 1365446003),
(603, 0, 'tool_timezoneimport', NULL, '2012112900', 'Starting plugin installation', NULL, '', 0, 1365446003),
(604, 0, 'tool_timezoneimport', '2012112900', '2012112900', 'Upgrade savepoint reached', NULL, '', 0, 1365446003),
(605, 0, 'tool_timezoneimport', '2012112900', '2012112900', 'Plugin installed', NULL, '', 0, 1365446003),
(606, 0, 'tool_unsuproles', NULL, '2012112900', 'Starting plugin installation', NULL, '', 0, 1365446003),
(607, 0, 'tool_unsuproles', '2012112900', '2012112900', 'Upgrade savepoint reached', NULL, '', 0, 1365446003),
(608, 0, 'tool_unsuproles', '2012112900', '2012112900', 'Plugin installed', NULL, '', 0, 1365446003),
(609, 0, 'tool_uploaduser', NULL, '2012112900', 'Starting plugin installation', NULL, '', 0, 1365446003),
(610, 0, 'tool_uploaduser', '2012112900', '2012112900', 'Upgrade savepoint reached', NULL, '', 0, 1365446003),
(611, 0, 'tool_uploaduser', '2012112900', '2012112900', 'Plugin installed', NULL, '', 0, 1365446003),
(612, 0, 'tool_xmldb', NULL, '2012112900', 'Starting plugin installation', NULL, '', 0, 1365446003),
(613, 0, 'tool_xmldb', '2012112900', '2012112900', 'Upgrade savepoint reached', NULL, '', 0, 1365446003),
(614, 0, 'tool_xmldb', '2012112900', '2012112900', 'Plugin installed', NULL, '', 0, 1365446004),
(615, 0, 'cachestore_file', NULL, '2012112900', 'Starting plugin installation', NULL, '', 0, 1365446004),
(616, 0, 'cachestore_file', '2012112900', '2012112900', 'Upgrade savepoint reached', NULL, '', 0, 1365446004),
(617, 0, 'cachestore_file', '2012112900', '2012112900', 'Plugin installed', NULL, '', 0, 1365446004),
(618, 0, 'cachestore_memcache', NULL, '2012112900', 'Starting plugin installation', NULL, '', 0, 1365446004),
(619, 0, 'cachestore_memcache', '2012112900', '2012112900', 'Upgrade savepoint reached', NULL, '', 0, 1365446004),
(620, 0, 'cachestore_memcache', '2012112900', '2012112900', 'Plugin installed', NULL, '', 0, 1365446004),
(621, 0, 'cachestore_memcached', NULL, '2012112900', 'Starting plugin installation', NULL, '', 0, 1365446004),
(622, 0, 'cachestore_memcached', '2012112900', '2012112900', 'Upgrade savepoint reached', NULL, '', 0, 1365446004),
(623, 0, 'cachestore_memcached', '2012112900', '2012112900', 'Plugin installed', NULL, '', 0, 1365446004),
(624, 0, 'cachestore_mongodb', NULL, '2012112900', 'Starting plugin installation', NULL, '', 0, 1365446004),
(625, 0, 'cachestore_mongodb', '2012112900', '2012112900', 'Upgrade savepoint reached', NULL, '', 0, 1365446004),
(626, 0, 'cachestore_mongodb', '2012112900', '2012112900', 'Plugin installed', NULL, '', 0, 1365446004),
(627, 0, 'cachestore_session', NULL, '2012112900', 'Starting plugin installation', NULL, '', 0, 1365446004),
(628, 0, 'cachestore_session', '2012112900', '2012112900', 'Upgrade savepoint reached', NULL, '', 0, 1365446004),
(629, 0, 'cachestore_session', '2012112900', '2012112900', 'Plugin installed', NULL, '', 0, 1365446004),
(630, 0, 'cachestore_static', NULL, '2012112900', 'Starting plugin installation', NULL, '', 0, 1365446004),
(631, 0, 'cachestore_static', '2012112900', '2012112900', 'Upgrade savepoint reached', NULL, '', 0, 1365446004),
(632, 0, 'cachestore_static', '2012112900', '2012112900', 'Plugin installed', NULL, '', 0, 1365446004),
(633, 0, 'theme_afterburner', NULL, '2012112900', 'Starting plugin installation', NULL, '', 0, 1365446004),
(634, 0, 'theme_afterburner', '2012112900', '2012112900', 'Upgrade savepoint reached', NULL, '', 0, 1365446004),
(635, 0, 'theme_afterburner', '2012112900', '2012112900', 'Plugin installed', NULL, '', 0, 1365446004),
(636, 0, 'theme_anomaly', NULL, '2012112900', 'Starting plugin installation', NULL, '', 0, 1365446004),
(637, 0, 'theme_anomaly', '2012112900', '2012112900', 'Upgrade savepoint reached', NULL, '', 0, 1365446004),
(638, 0, 'theme_anomaly', '2012112900', '2012112900', 'Plugin installed', NULL, '', 0, 1365446005),
(639, 0, 'theme_arialist', NULL, '2012112900', 'Starting plugin installation', NULL, '', 0, 1365446005),
(640, 0, 'theme_arialist', '2012112900', '2012112900', 'Upgrade savepoint reached', NULL, '', 0, 1365446005),
(641, 0, 'theme_arialist', '2012112900', '2012112900', 'Plugin installed', NULL, '', 0, 1365446005),
(642, 0, 'theme_base', NULL, '2012112901', 'Starting plugin installation', NULL, '', 0, 1365446005),
(643, 0, 'theme_base', '2012112901', '2012112901', 'Upgrade savepoint reached', NULL, '', 0, 1365446005),
(644, 0, 'theme_base', '2012112901', '2012112901', 'Plugin installed', NULL, '', 0, 1365446005),
(645, 0, 'theme_binarius', NULL, '2012112900', 'Starting plugin installation', NULL, '', 0, 1365446005),
(646, 0, 'theme_binarius', '2012112900', '2012112900', 'Upgrade savepoint reached', NULL, '', 0, 1365446005),
(647, 0, 'theme_binarius', '2012112900', '2012112900', 'Plugin installed', NULL, '', 0, 1365446005),
(648, 0, 'theme_boxxie', NULL, '2012112900', 'Starting plugin installation', NULL, '', 0, 1365446005),
(649, 0, 'theme_boxxie', '2012112900', '2012112900', 'Upgrade savepoint reached', NULL, '', 0, 1365446005),
(650, 0, 'theme_boxxie', '2012112900', '2012112900', 'Plugin installed', NULL, '', 0, 1365446005),
(651, 0, 'theme_brick', NULL, '2012112900', 'Starting plugin installation', NULL, '', 0, 1365446005),
(652, 0, 'theme_brick', '2012112900', '2012112900', 'Upgrade savepoint reached', NULL, '', 0, 1365446005),
(653, 0, 'theme_brick', '2012112900', '2012112900', 'Plugin installed', NULL, '', 0, 1365446005),
(654, 0, 'theme_canvas', NULL, '2012112900', 'Starting plugin installation', NULL, '', 0, 1365446005),
(655, 0, 'theme_canvas', '2012112900', '2012112900', 'Upgrade savepoint reached', NULL, '', 0, 1365446005),
(656, 0, 'theme_canvas', '2012112900', '2012112900', 'Plugin installed', NULL, '', 0, 1365446005),
(657, 0, 'theme_formal_white', NULL, '2012112900', 'Starting plugin installation', NULL, '', 0, 1365446005),
(658, 0, 'theme_formal_white', '2012112900', '2012112900', 'Upgrade savepoint reached', NULL, '', 0, 1365446005),
(659, 0, 'theme_formal_white', '2012112900', '2012112900', 'Plugin installed', NULL, '', 0, 1365446005),
(660, 0, 'theme_formfactor', NULL, '2012112900', 'Starting plugin installation', NULL, '', 0, 1365446005),
(661, 0, 'theme_formfactor', '2012112900', '2012112900', 'Upgrade savepoint reached', NULL, '', 0, 1365446005),
(662, 0, 'theme_formfactor', '2012112900', '2012112900', 'Plugin installed', NULL, '', 0, 1365446006),
(663, 0, 'theme_fusion', NULL, '2012112900', 'Starting plugin installation', NULL, '', 0, 1365446006),
(664, 0, 'theme_fusion', '2012112900', '2012112900', 'Upgrade savepoint reached', NULL, '', 0, 1365446006),
(665, 0, 'theme_fusion', '2012112900', '2012112900', 'Plugin installed', NULL, '', 0, 1365446006),
(666, 0, 'theme_leatherbound', NULL, '2012112900', 'Starting plugin installation', NULL, '', 0, 1365446006),
(667, 0, 'theme_leatherbound', '2012112900', '2012112900', 'Upgrade savepoint reached', NULL, '', 0, 1365446006),
(668, 0, 'theme_leatherbound', '2012112900', '2012112900', 'Plugin installed', NULL, '', 0, 1365446006),
(669, 0, 'theme_magazine', NULL, '2012112900', 'Starting plugin installation', NULL, '', 0, 1365446006),
(670, 0, 'theme_magazine', '2012112900', '2012112900', 'Upgrade savepoint reached', NULL, '', 0, 1365446006),
(671, 0, 'theme_magazine', '2012112900', '2012112900', 'Plugin installed', NULL, '', 0, 1365446006),
(672, 0, 'theme_mymobile', NULL, '2012112900', 'Starting plugin installation', NULL, '', 0, 1365446006),
(673, 0, 'theme_mymobile', '2012112900', '2012112900', 'Upgrade savepoint reached', NULL, '', 0, 1365446006),
(674, 0, 'theme_mymobile', '2012112900', '2012112900', 'Plugin installed', NULL, '', 0, 1365446006),
(675, 0, 'theme_nimble', NULL, '2012112900', 'Starting plugin installation', NULL, '', 0, 1365446006),
(676, 0, 'theme_nimble', '2012112900', '2012112900', 'Upgrade savepoint reached', NULL, '', 0, 1365446006),
(677, 0, 'theme_nimble', '2012112900', '2012112900', 'Plugin installed', NULL, '', 0, 1365446007),
(678, 0, 'theme_nonzero', NULL, '2012112900', 'Starting plugin installation', NULL, '', 0, 1365446007),
(679, 0, 'theme_nonzero', '2012112900', '2012112900', 'Upgrade savepoint reached', NULL, '', 0, 1365446007),
(680, 0, 'theme_nonzero', '2012112900', '2012112900', 'Plugin installed', NULL, '', 0, 1365446007),
(681, 0, 'theme_overlay', NULL, '2012112900', 'Starting plugin installation', NULL, '', 0, 1365446007),
(682, 0, 'theme_overlay', '2012112900', '2012112900', 'Upgrade savepoint reached', NULL, '', 0, 1365446007),
(683, 0, 'theme_overlay', '2012112900', '2012112900', 'Plugin installed', NULL, '', 0, 1365446007),
(684, 0, 'theme_serenity', NULL, '2012112900', 'Starting plugin installation', NULL, '', 0, 1365446007),
(685, 0, 'theme_serenity', '2012112900', '2012112900', 'Upgrade savepoint reached', NULL, '', 0, 1365446007),
(686, 0, 'theme_serenity', '2012112900', '2012112900', 'Plugin installed', NULL, '', 0, 1365446007),
(687, 0, 'theme_sky_high', NULL, '2012112900', 'Starting plugin installation', NULL, '', 0, 1365446007),
(688, 0, 'theme_sky_high', '2012112900', '2012112900', 'Upgrade savepoint reached', NULL, '', 0, 1365446007),
(689, 0, 'theme_sky_high', '2012112900', '2012112900', 'Plugin installed', NULL, '', 0, 1365446007),
(690, 0, 'theme_splash', NULL, '2012112900', 'Starting plugin installation', NULL, '', 0, 1365446007),
(691, 0, 'theme_splash', '2012112900', '2012112900', 'Upgrade savepoint reached', NULL, '', 0, 1365446007),
(692, 0, 'theme_splash', '2012112900', '2012112900', 'Plugin installed', NULL, '', 0, 1365446007),
(693, 0, 'theme_standard', NULL, '2012112900', 'Starting plugin installation', NULL, '', 0, 1365446008),
(694, 0, 'theme_standard', '2012112900', '2012112900', 'Upgrade savepoint reached', NULL, '', 0, 1365446008),
(695, 0, 'theme_standard', '2012112900', '2012112900', 'Plugin installed', NULL, '', 0, 1365446008),
(696, 0, 'theme_standardold', NULL, '2012112900', 'Starting plugin installation', NULL, '', 0, 1365446008),
(697, 0, 'theme_standardold', '2012112900', '2012112900', 'Upgrade savepoint reached', NULL, '', 0, 1365446008),
(698, 0, 'theme_standardold', '2012112900', '2012112900', 'Plugin installed', NULL, '', 0, 1365446008),
(699, 0, 'assignsubmission_comments', NULL, '2012112900', 'Starting plugin installation', NULL, '', 0, 1365446008),
(700, 0, 'assignsubmission_comments', '2012112900', '2012112900', 'Upgrade savepoint reached', NULL, '', 0, 1365446008),
(701, 0, 'assignsubmission_comments', '2012112900', '2012112900', 'Plugin installed', NULL, '', 0, 1365446008),
(702, 0, 'assignsubmission_file', NULL, '2012112900', 'Starting plugin installation', NULL, '', 0, 1365446008),
(703, 0, 'assignsubmission_file', '2012112900', '2012112900', 'Upgrade savepoint reached', NULL, '', 0, 1365446008),
(704, 0, 'assignsubmission_file', '2012112900', '2012112900', 'Plugin installed', NULL, '', 0, 1365446008),
(705, 0, 'assignsubmission_onlinetext', NULL, '2012112900', 'Starting plugin installation', NULL, '', 0, 1365446008),
(706, 0, 'assignsubmission_onlinetext', '2012112900', '2012112900', 'Upgrade savepoint reached', NULL, '', 0, 1365446008),
(707, 0, 'assignsubmission_onlinetext', '2012112900', '2012112900', 'Plugin installed', NULL, '', 0, 1365446009),
(708, 0, 'assignfeedback_comments', NULL, '2012112900', 'Starting plugin installation', NULL, '', 0, 1365446009),
(709, 0, 'assignfeedback_comments', '2012112900', '2012112900', 'Upgrade savepoint reached', NULL, '', 0, 1365446009),
(710, 0, 'assignfeedback_comments', '2012112900', '2012112900', 'Plugin installed', NULL, '', 0, 1365446009),
(711, 0, 'assignfeedback_file', NULL, '2012112900', 'Starting plugin installation', NULL, '', 0, 1365446009),
(712, 0, 'assignfeedback_file', '2012112900', '2012112900', 'Upgrade savepoint reached', NULL, '', 0, 1365446009),
(713, 0, 'assignfeedback_file', '2012112900', '2012112900', 'Plugin installed', NULL, '', 0, 1365446010),
(714, 0, 'assignfeedback_offline', NULL, '2012112900', 'Starting plugin installation', NULL, '', 0, 1365446010),
(715, 0, 'assignfeedback_offline', '2012112900', '2012112900', 'Upgrade savepoint reached', NULL, '', 0, 1365446010),
(716, 0, 'assignfeedback_offline', '2012112900', '2012112900', 'Plugin installed', NULL, '', 0, 1365446010),
(717, 0, 'assignment_offline', NULL, '2012112900', 'Starting plugin installation', NULL, '', 0, 1365446010),
(718, 0, 'assignment_offline', '2012112900', '2012112900', 'Upgrade savepoint reached', NULL, '', 0, 1365446010),
(719, 0, 'assignment_offline', '2012112900', '2012112900', 'Plugin installed', NULL, '', 0, 1365446010),
(720, 0, 'assignment_online', NULL, '2012112900', 'Starting plugin installation', NULL, '', 0, 1365446010),
(721, 0, 'assignment_online', '2012112900', '2012112900', 'Upgrade savepoint reached', NULL, '', 0, 1365446010),
(722, 0, 'assignment_online', '2012112900', '2012112900', 'Plugin installed', NULL, '', 0, 1365446010),
(723, 0, 'assignment_upload', NULL, '2012112900', 'Starting plugin installation', NULL, '', 0, 1365446010),
(724, 0, 'assignment_upload', '2012112900', '2012112900', 'Upgrade savepoint reached', NULL, '', 0, 1365446010),
(725, 0, 'assignment_upload', '2012112900', '2012112900', 'Plugin installed', NULL, '', 0, 1365446010),
(726, 0, 'assignment_uploadsingle', NULL, '2012112900', 'Starting plugin installation', NULL, '', 0, 1365446010),
(727, 0, 'assignment_uploadsingle', '2012112900', '2012112900', 'Upgrade savepoint reached', NULL, '', 0, 1365446010),
(728, 0, 'assignment_uploadsingle', '2012112900', '2012112900', 'Plugin installed', NULL, '', 0, 1365446010),
(729, 0, 'booktool_exportimscp', NULL, '2012112900', 'Starting plugin installation', NULL, '', 0, 1365446010),
(730, 0, 'booktool_exportimscp', '2012112900', '2012112900', 'Upgrade savepoint reached', NULL, '', 0, 1365446010),
(731, 0, 'booktool_exportimscp', '2012112900', '2012112900', 'Plugin installed', NULL, '', 0, 1365446010),
(732, 0, 'booktool_importhtml', NULL, '2012112900', 'Starting plugin installation', NULL, '', 0, 1365446010),
(733, 0, 'booktool_importhtml', '2012112900', '2012112900', 'Upgrade savepoint reached', NULL, '', 0, 1365446010),
(734, 0, 'booktool_importhtml', '2012112900', '2012112900', 'Plugin installed', NULL, '', 0, 1365446010),
(735, 0, 'booktool_print', NULL, '2012112900', 'Starting plugin installation', NULL, '', 0, 1365446010),
(736, 0, 'booktool_print', '2012112900', '2012112900', 'Upgrade savepoint reached', NULL, '', 0, 1365446010),
(737, 0, 'booktool_print', '2012112900', '2012112900', 'Plugin installed', NULL, '', 0, 1365446011),
(738, 0, 'datafield_checkbox', NULL, '2012112900', 'Starting plugin installation', NULL, '', 0, 1365446011),
(739, 0, 'datafield_checkbox', '2012112900', '2012112900', 'Upgrade savepoint reached', NULL, '', 0, 1365446011),
(740, 0, 'datafield_checkbox', '2012112900', '2012112900', 'Plugin installed', NULL, '', 0, 1365446011),
(741, 0, 'datafield_date', NULL, '2012112900', 'Starting plugin installation', NULL, '', 0, 1365446011),
(742, 0, 'datafield_date', '2012112900', '2012112900', 'Upgrade savepoint reached', NULL, '', 0, 1365446011),
(743, 0, 'datafield_date', '2012112900', '2012112900', 'Plugin installed', NULL, '', 0, 1365446011),
(744, 0, 'datafield_file', NULL, '2012112900', 'Starting plugin installation', NULL, '', 0, 1365446011),
(745, 0, 'datafield_file', '2012112900', '2012112900', 'Upgrade savepoint reached', NULL, '', 0, 1365446011),
(746, 0, 'datafield_file', '2012112900', '2012112900', 'Plugin installed', NULL, '', 0, 1365446011),
(747, 0, 'datafield_latlong', NULL, '2012112900', 'Starting plugin installation', NULL, '', 0, 1365446011),
(748, 0, 'datafield_latlong', '2012112900', '2012112900', 'Upgrade savepoint reached', NULL, '', 0, 1365446011),
(749, 0, 'datafield_latlong', '2012112900', '2012112900', 'Plugin installed', NULL, '', 0, 1365446011),
(750, 0, 'datafield_menu', NULL, '2012112900', 'Starting plugin installation', NULL, '', 0, 1365446011),
(751, 0, 'datafield_menu', '2012112900', '2012112900', 'Upgrade savepoint reached', NULL, '', 0, 1365446011),
(752, 0, 'datafield_menu', '2012112900', '2012112900', 'Plugin installed', NULL, '', 0, 1365446011),
(753, 0, 'datafield_multimenu', NULL, '2012112900', 'Starting plugin installation', NULL, '', 0, 1365446011),
(754, 0, 'datafield_multimenu', '2012112900', '2012112900', 'Upgrade savepoint reached', NULL, '', 0, 1365446011),
(755, 0, 'datafield_multimenu', '2012112900', '2012112900', 'Plugin installed', NULL, '', 0, 1365446011),
(756, 0, 'datafield_number', NULL, '2012112900', 'Starting plugin installation', NULL, '', 0, 1365446011),
(757, 0, 'datafield_number', '2012112900', '2012112900', 'Upgrade savepoint reached', NULL, '', 0, 1365446011),
(758, 0, 'datafield_number', '2012112900', '2012112900', 'Plugin installed', NULL, '', 0, 1365446011),
(759, 0, 'datafield_picture', NULL, '2012112900', 'Starting plugin installation', NULL, '', 0, 1365446011),
(760, 0, 'datafield_picture', '2012112900', '2012112900', 'Upgrade savepoint reached', NULL, '', 0, 1365446011),
(761, 0, 'datafield_picture', '2012112900', '2012112900', 'Plugin installed', NULL, '', 0, 1365446011),
(762, 0, 'datafield_radiobutton', NULL, '2012112900', 'Starting plugin installation', NULL, '', 0, 1365446011),
(763, 0, 'datafield_radiobutton', '2012112900', '2012112900', 'Upgrade savepoint reached', NULL, '', 0, 1365446011),
(764, 0, 'datafield_radiobutton', '2012112900', '2012112900', 'Plugin installed', NULL, '', 0, 1365446012),
(765, 0, 'datafield_text', NULL, '2012112900', 'Starting plugin installation', NULL, '', 0, 1365446012),
(766, 0, 'datafield_text', '2012112900', '2012112900', 'Upgrade savepoint reached', NULL, '', 0, 1365446012),
(767, 0, 'datafield_text', '2012112900', '2012112900', 'Plugin installed', NULL, '', 0, 1365446012),
(768, 0, 'datafield_textarea', NULL, '2012112900', 'Starting plugin installation', NULL, '', 0, 1365446012),
(769, 0, 'datafield_textarea', '2012112900', '2012112900', 'Upgrade savepoint reached', NULL, '', 0, 1365446012),
(770, 0, 'datafield_textarea', '2012112900', '2012112900', 'Plugin installed', NULL, '', 0, 1365446012),
(771, 0, 'datafield_url', NULL, '2012112900', 'Starting plugin installation', NULL, '', 0, 1365446012),
(772, 0, 'datafield_url', '2012112900', '2012112900', 'Upgrade savepoint reached', NULL, '', 0, 1365446012),
(773, 0, 'datafield_url', '2012112900', '2012112900', 'Plugin installed', NULL, '', 0, 1365446012),
(774, 0, 'datapreset_imagegallery', NULL, '2012112900', 'Starting plugin installation', NULL, '', 0, 1365446012),
(775, 0, 'datapreset_imagegallery', '2012112900', '2012112900', 'Upgrade savepoint reached', NULL, '', 0, 1365446012),
(776, 0, 'datapreset_imagegallery', '2012112900', '2012112900', 'Plugin installed', NULL, '', 0, 1365446012),
(777, 0, 'quiz_grading', NULL, '2012112900', 'Starting plugin installation', NULL, '', 0, 1365446012),
(778, 0, 'quiz_grading', '2012112900', '2012112900', 'Upgrade savepoint reached', NULL, '', 0, 1365446012),
(779, 0, 'quiz_grading', '2012112900', '2012112900', 'Plugin installed', NULL, '', 0, 1365446012),
(780, 0, 'quiz_overview', NULL, '2012112900', 'Starting plugin installation', NULL, '', 0, 1365446012),
(781, 0, 'quiz_overview', '2012112900', '2012112900', 'Upgrade savepoint reached', NULL, '', 0, 1365446012),
(782, 0, 'quiz_overview', '2012112900', '2012112900', 'Plugin installed', NULL, '', 0, 1365446013),
(783, 0, 'quiz_responses', NULL, '2012112900', 'Starting plugin installation', NULL, '', 0, 1365446013),
(784, 0, 'quiz_responses', '2012112900', '2012112900', 'Upgrade savepoint reached', NULL, '', 0, 1365446013),
(785, 0, 'quiz_responses', '2012112900', '2012112900', 'Plugin installed', NULL, '', 0, 1365446013),
(786, 0, 'quiz_statistics', NULL, '2012112900', 'Starting plugin installation', NULL, '', 0, 1365446013),
(787, 0, 'quiz_statistics', '2012112900', '2012112900', 'Upgrade savepoint reached', NULL, '', 0, 1365446013),
(788, 0, 'quiz_statistics', '2012112900', '2012112900', 'Plugin installed', NULL, '', 0, 1365446014),
(789, 0, 'quizaccess_delaybetweenattempts', NULL, '2012112900', 'Starting plugin installation', NULL, '', 0, 1365446014),
(790, 0, 'quizaccess_delaybetweenattempts', '2012112900', '2012112900', 'Upgrade savepoint reached', NULL, '', 0, 1365446014),
(791, 0, 'quizaccess_delaybetweenattempts', '2012112900', '2012112900', 'Plugin installed', NULL, '', 0, 1365446014),
(792, 0, 'quizaccess_ipaddress', NULL, '2012112900', 'Starting plugin installation', NULL, '', 0, 1365446014),
(793, 0, 'quizaccess_ipaddress', '2012112900', '2012112900', 'Upgrade savepoint reached', NULL, '', 0, 1365446014),
(794, 0, 'quizaccess_ipaddress', '2012112900', '2012112900', 'Plugin installed', NULL, '', 0, 1365446014),
(795, 0, 'quizaccess_numattempts', NULL, '2012112900', 'Starting plugin installation', NULL, '', 0, 1365446014),
(796, 0, 'quizaccess_numattempts', '2012112900', '2012112900', 'Upgrade savepoint reached', NULL, '', 0, 1365446014),
(797, 0, 'quizaccess_numattempts', '2012112900', '2012112900', 'Plugin installed', NULL, '', 0, 1365446014),
(798, 0, 'quizaccess_openclosedate', NULL, '2012112900', 'Starting plugin installation', NULL, '', 0, 1365446014),
(799, 0, 'quizaccess_openclosedate', '2012112900', '2012112900', 'Upgrade savepoint reached', NULL, '', 0, 1365446014),
(800, 0, 'quizaccess_openclosedate', '2012112900', '2012112900', 'Plugin installed', NULL, '', 0, 1365446014),
(801, 0, 'quizaccess_password', NULL, '2012112900', 'Starting plugin installation', NULL, '', 0, 1365446014),
(802, 0, 'quizaccess_password', '2012112900', '2012112900', 'Upgrade savepoint reached', NULL, '', 0, 1365446014),
(803, 0, 'quizaccess_password', '2012112900', '2012112900', 'Plugin installed', NULL, '', 0, 1365446014),
(804, 0, 'quizaccess_safebrowser', NULL, '2012112900', 'Starting plugin installation', NULL, '', 0, 1365446014),
(805, 0, 'quizaccess_safebrowser', '2012112900', '2012112900', 'Upgrade savepoint reached', NULL, '', 0, 1365446014),
(806, 0, 'quizaccess_safebrowser', '2012112900', '2012112900', 'Plugin installed', NULL, '', 0, 1365446014),
(807, 0, 'quizaccess_securewindow', NULL, '2012112900', 'Starting plugin installation', NULL, '', 0, 1365446014),
(808, 0, 'quizaccess_securewindow', '2012112900', '2012112900', 'Upgrade savepoint reached', NULL, '', 0, 1365446014),
(809, 0, 'quizaccess_securewindow', '2012112900', '2012112900', 'Plugin installed', NULL, '', 0, 1365446015),
(810, 0, 'quizaccess_timelimit', NULL, '2012112900', 'Starting plugin installation', NULL, '', 0, 1365446015),
(811, 0, 'quizaccess_timelimit', '2012112900', '2012112900', 'Upgrade savepoint reached', NULL, '', 0, 1365446015),
(812, 0, 'quizaccess_timelimit', '2012112900', '2012112900', 'Plugin installed', NULL, '', 0, 1365446015),
(813, 0, 'scormreport_basic', NULL, '2012112900', 'Starting plugin installation', NULL, '', 0, 1365446015),
(814, 0, 'scormreport_basic', '2012112900', '2012112900', 'Upgrade savepoint reached', NULL, '', 0, 1365446015),
(815, 0, 'scormreport_basic', '2012112900', '2012112900', 'Plugin installed', NULL, '', 0, 1365446015),
(816, 0, 'scormreport_graphs', NULL, '2012112900', 'Starting plugin installation', NULL, '', 0, 1365446015),
(817, 0, 'scormreport_graphs', '2012112900', '2012112900', 'Upgrade savepoint reached', NULL, '', 0, 1365446015),
(818, 0, 'scormreport_graphs', '2012112900', '2012112900', 'Plugin installed', NULL, '', 0, 1365446015),
(819, 0, 'scormreport_interactions', NULL, '2012112900', 'Starting plugin installation', NULL, '', 0, 1365446015),
(820, 0, 'scormreport_interactions', '2012112900', '2012112900', 'Upgrade savepoint reached', NULL, '', 0, 1365446015),
(821, 0, 'scormreport_interactions', '2012112900', '2012112900', 'Plugin installed', NULL, '', 0, 1365446015),
(822, 0, 'workshopform_accumulative', NULL, '2012112900', 'Starting plugin installation', NULL, '', 0, 1365446015),
(823, 0, 'workshopform_accumulative', '2012112900', '2012112900', 'Upgrade savepoint reached', NULL, '', 0, 1365446015),
(824, 0, 'workshopform_accumulative', '2012112900', '2012112900', 'Plugin installed', NULL, '', 0, 1365446015),
(825, 0, 'workshopform_comments', NULL, '2012112900', 'Starting plugin installation', NULL, '', 0, 1365446015),
(826, 0, 'workshopform_comments', '2012112900', '2012112900', 'Upgrade savepoint reached', NULL, '', 0, 1365446016),
(827, 0, 'workshopform_comments', '2012112900', '2012112900', 'Plugin installed', NULL, '', 0, 1365446016),
(828, 0, 'workshopform_numerrors', NULL, '2012112900', 'Starting plugin installation', NULL, '', 0, 1365446016),
(829, 0, 'workshopform_numerrors', '2012112900', '2012112900', 'Upgrade savepoint reached', NULL, '', 0, 1365446016),
(830, 0, 'workshopform_numerrors', '2012112900', '2012112900', 'Plugin installed', NULL, '', 0, 1365446016),
(831, 0, 'workshopform_rubric', NULL, '2012112900', 'Starting plugin installation', NULL, '', 0, 1365446016),
(832, 0, 'workshopform_rubric', '2012112900', '2012112900', 'Upgrade savepoint reached', NULL, '', 0, 1365446017),
(833, 0, 'workshopform_rubric', '2012112900', '2012112900', 'Plugin installed', NULL, '', 0, 1365446017),
(834, 0, 'workshopallocation_manual', NULL, '2012112900', 'Starting plugin installation', NULL, '', 0, 1365446017),
(835, 0, 'workshopallocation_manual', '2012112900', '2012112900', 'Upgrade savepoint reached', NULL, '', 0, 1365446017),
(836, 0, 'workshopallocation_manual', '2012112900', '2012112900', 'Plugin installed', NULL, '', 0, 1365446017),
(837, 0, 'workshopallocation_random', NULL, '2012112900', 'Starting plugin installation', NULL, '', 0, 1365446017),
(838, 0, 'workshopallocation_random', '2012112900', '2012112900', 'Upgrade savepoint reached', NULL, '', 0, 1365446017),
(839, 0, 'workshopallocation_random', '2012112900', '2012112900', 'Plugin installed', NULL, '', 0, 1365446017),
(840, 0, 'workshopallocation_scheduled', NULL, '2012112901', 'Starting plugin installation', NULL, '', 0, 1365446017),
(841, 0, 'workshopallocation_scheduled', '2012112901', '2012112901', 'Upgrade savepoint reached', NULL, '', 0, 1365446017),
(842, 0, 'workshopallocation_scheduled', '2012112901', '2012112901', 'Plugin installed', NULL, '', 0, 1365446017),
(843, 0, 'workshopeval_best', NULL, '2012112900', 'Starting plugin installation', NULL, '', 0, 1365446017),
(844, 0, 'workshopeval_best', '2012112900', '2012112900', 'Upgrade savepoint reached', NULL, '', 0, 1365446017),
(845, 0, 'workshopeval_best', '2012112900', '2012112900', 'Plugin installed', NULL, '', 0, 1365446018),
(846, 0, 'tinymce_dragmath', NULL, '2012112900', 'Starting plugin installation', NULL, '', 0, 1365446018),
(847, 0, 'tinymce_dragmath', '2012112900', '2012112900', 'Upgrade savepoint reached', NULL, '', 0, 1365446018),
(848, 0, 'tinymce_dragmath', '2012112900', '2012112900', 'Plugin installed', NULL, '', 0, 1365446018),
(849, 0, 'tinymce_moodleemoticon', NULL, '2012112900', 'Starting plugin installation', NULL, '', 0, 1365446018),
(850, 0, 'tinymce_moodleemoticon', '2012112900', '2012112900', 'Upgrade savepoint reached', NULL, '', 0, 1365446018),
(851, 0, 'tinymce_moodleemoticon', '2012112900', '2012112900', 'Plugin installed', NULL, '', 0, 1365446018),
(852, 0, 'tinymce_moodleimage', NULL, '2012112900', 'Starting plugin installation', NULL, '', 0, 1365446018),
(853, 0, 'tinymce_moodleimage', '2012112900', '2012112900', 'Upgrade savepoint reached', NULL, '', 0, 1365446018),
(854, 0, 'tinymce_moodleimage', '2012112900', '2012112900', 'Plugin installed', NULL, '', 0, 1365446018),
(855, 0, 'tinymce_moodlemedia', NULL, '2012112900', 'Starting plugin installation', NULL, '', 0, 1365446018),
(856, 0, 'tinymce_moodlemedia', '2012112900', '2012112900', 'Upgrade savepoint reached', NULL, '', 0, 1365446018),
(857, 0, 'tinymce_moodlemedia', '2012112900', '2012112900', 'Plugin installed', NULL, '', 0, 1365446018),
(858, 0, 'tinymce_moodlenolink', NULL, '2012112900', 'Starting plugin installation', NULL, '', 0, 1365446018),
(859, 0, 'tinymce_moodlenolink', '2012112900', '2012112900', 'Upgrade savepoint reached', NULL, '', 0, 1365446018),
(860, 0, 'tinymce_moodlenolink', '2012112900', '2012112900', 'Plugin installed', NULL, '', 0, 1365446018),
(861, 0, 'tinymce_spellchecker', NULL, '2012112900', 'Starting plugin installation', NULL, '', 0, 1365446018),
(862, 0, 'tinymce_spellchecker', '2012112900', '2012112900', 'Upgrade savepoint reached', NULL, '', 0, 1365446018),
(863, 0, 'tinymce_spellchecker', '2012112900', '2012112900', 'Plugin installed', NULL, '', 0, 1365446019),
(864, 0, 'mod_attforblock', NULL, '2012120700', 'Starting plugin installation', NULL, '', 2, 1365530673),
(865, 0, 'mod_attforblock', '2012120700', '2012120700', 'Plugin installed', NULL, '', 2, 1365530676);

-- --------------------------------------------------------

--
-- Table structure for table `mdl_url`
--

CREATE TABLE IF NOT EXISTS `mdl_url` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `course` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `intro` longtext,
  `introformat` smallint(4) NOT NULL DEFAULT '0',
  `externalurl` longtext NOT NULL,
  `display` smallint(4) NOT NULL DEFAULT '0',
  `displayoptions` longtext,
  `parameters` longtext,
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_url_cou_ix` (`course`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='each record is one url resource' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_user`
--

CREATE TABLE IF NOT EXISTS `mdl_user` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `auth` varchar(20) NOT NULL DEFAULT 'manual',
  `confirmed` tinyint(1) NOT NULL DEFAULT '0',
  `policyagreed` tinyint(1) NOT NULL DEFAULT '0',
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  `suspended` tinyint(1) NOT NULL DEFAULT '0',
  `mnethostid` bigint(10) NOT NULL DEFAULT '0',
  `username` varchar(100) NOT NULL DEFAULT '',
  `password` varchar(32) NOT NULL DEFAULT '',
  `idnumber` varchar(255) NOT NULL DEFAULT '',
  `firstname` varchar(100) NOT NULL DEFAULT '',
  `lastname` varchar(100) NOT NULL DEFAULT '',
  `email` varchar(100) NOT NULL DEFAULT '',
  `emailstop` tinyint(1) NOT NULL DEFAULT '0',
  `icq` varchar(15) NOT NULL DEFAULT '',
  `skype` varchar(50) NOT NULL DEFAULT '',
  `yahoo` varchar(50) NOT NULL DEFAULT '',
  `aim` varchar(50) NOT NULL DEFAULT '',
  `msn` varchar(50) NOT NULL DEFAULT '',
  `phone1` varchar(20) NOT NULL DEFAULT '',
  `phone2` varchar(20) NOT NULL DEFAULT '',
  `institution` varchar(40) NOT NULL DEFAULT '',
  `department` varchar(30) NOT NULL DEFAULT '',
  `address` varchar(70) NOT NULL DEFAULT '',
  `city` varchar(120) NOT NULL DEFAULT '',
  `country` varchar(2) NOT NULL DEFAULT '',
  `lang` varchar(30) NOT NULL DEFAULT 'en',
  `theme` varchar(50) NOT NULL DEFAULT '',
  `timezone` varchar(100) NOT NULL DEFAULT '99',
  `firstaccess` bigint(10) NOT NULL DEFAULT '0',
  `lastaccess` bigint(10) NOT NULL DEFAULT '0',
  `lastlogin` bigint(10) NOT NULL DEFAULT '0',
  `currentlogin` bigint(10) NOT NULL DEFAULT '0',
  `lastip` varchar(45) NOT NULL DEFAULT '',
  `secret` varchar(15) NOT NULL DEFAULT '',
  `picture` bigint(10) NOT NULL DEFAULT '0',
  `url` varchar(255) NOT NULL DEFAULT '',
  `description` longtext,
  `descriptionformat` tinyint(2) NOT NULL DEFAULT '0',
  `mailformat` tinyint(1) NOT NULL DEFAULT '1',
  `maildigest` tinyint(1) NOT NULL DEFAULT '0',
  `maildisplay` tinyint(2) NOT NULL DEFAULT '2',
  `htmleditor` tinyint(1) NOT NULL DEFAULT '1',
  `autosubscribe` tinyint(1) NOT NULL DEFAULT '1',
  `trackforums` tinyint(1) NOT NULL DEFAULT '0',
  `timecreated` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `trustbitmask` bigint(10) NOT NULL DEFAULT '0',
  `imagealt` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_user_mneuse_uix` (`mnethostid`,`username`),
  KEY `mdl_user_del_ix` (`deleted`),
  KEY `mdl_user_con_ix` (`confirmed`),
  KEY `mdl_user_fir_ix` (`firstname`),
  KEY `mdl_user_las_ix` (`lastname`),
  KEY `mdl_user_cit_ix` (`city`),
  KEY `mdl_user_cou_ix` (`country`),
  KEY `mdl_user_las2_ix` (`lastaccess`),
  KEY `mdl_user_ema_ix` (`email`),
  KEY `mdl_user_aut_ix` (`auth`),
  KEY `mdl_user_idn_ix` (`idnumber`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='One record for each person' AUTO_INCREMENT=34 ;

--
-- Dumping data for table `mdl_user`
--

INSERT INTO `mdl_user` (`id`, `auth`, `confirmed`, `policyagreed`, `deleted`, `suspended`, `mnethostid`, `username`, `password`, `idnumber`, `firstname`, `lastname`, `email`, `emailstop`, `icq`, `skype`, `yahoo`, `aim`, `msn`, `phone1`, `phone2`, `institution`, `department`, `address`, `city`, `country`, `lang`, `theme`, `timezone`, `firstaccess`, `lastaccess`, `lastlogin`, `currentlogin`, `lastip`, `secret`, `picture`, `url`, `description`, `descriptionformat`, `mailformat`, `maildigest`, `maildisplay`, `htmleditor`, `autosubscribe`, `trackforums`, `timecreated`, `timemodified`, `trustbitmask`, `imagealt`) VALUES
(1, 'manual', 1, 0, 0, 0, 1, 'guest11', '6ab5613d24e1e29b08668b85563bbafe', '', 'Guest user', ' ', 'root@localhost', 0, '', '', '', '', '', '', '', '', '', '', '', '', 'en', '', '99', 0, 0, 0, 0, '', '', 0, '', 'This user is a special user that allows read-only access to some courses.', 0, 1, 0, 2, 1, 1, 0, 0, 1362852582, 0, ''),
(2, 'manual', 1, 0, 0, 0, 1, 'admin1', '98dd2b707cc3ef2dbc2f98285bb37114', '', 'Admin', 'User', 'sudhanshu.verma@gmail.com', 0, '', '', '', '', '', '', '', '', '', '', 'New Delhi', 'IN', 'en', '', '99', 1362853011, 1365654501, 1365221683, 1365653919, '127.0.0.1', '', 0, '', '', 0, 1, 0, 1, 1, 1, 0, 0, 1362853954, 0, ''),
(3, 'manual', 1, 0, 0, 0, 1, 'user1', '1b01cc13cbcb6be0bcc6072e3237ad31', '', 'user1', '1', 'user1@gmail.com', 0, '', '', '', '', '', '', '', '', '', '', 'New Delhi', 'IN', 'en', '', '99', 0, 0, 0, 0, '', '', 0, '', '', 1, 1, 0, 2, 1, 1, 0, 1363545734, 1363804728, 0, ''),
(4, 'manual', 1, 0, 0, 0, 1, 'user2', 'c87160ffd8436537d198bb2147fe7d55', '', 'user2', '2', 'user2@gmail.com', 0, '', '', '', '', '', '', '', '', '', '', 'New Delhi', 'IN', 'en', '', '99', 0, 0, 0, 0, '', '', 0, '', '', 1, 1, 0, 2, 1, 1, 0, 1363545735, 1363545735, 0, ''),
(5, 'manual', 1, 0, 0, 0, 1, 'user3', '591f6f0c01f12cc522793dd9ac5fe0da', '', 'user3', '3', 'user3@gmail.com', 0, '', '', '', '', '', '', '', '', '', '', 'New Delhi', 'IN', 'en', '', '99', 0, 0, 0, 0, '', '', 0, '', '', 1, 1, 0, 2, 1, 1, 0, 1363545735, 1363545735, 0, ''),
(6, 'manual', 1, 0, 0, 0, 1, 'user4', '80c66ead14af48410b7d013b8480212d', '', 'user4', '4', 'user4@gmail.com', 0, '', '', '', '', '', '', '', '', '', '', 'New Delhi', 'IN', 'en', '', '99', 0, 0, 0, 0, '', '', 0, '', '', 1, 1, 0, 2, 1, 1, 0, 1363545735, 1363545735, 0, ''),
(7, 'manual', 1, 0, 0, 0, 1, 'user5', 'b666fb57186ab3d91493ed1830759783', '', 'user5', '5', 'user5@gmail.com', 0, '', '', '', '', '', '', '', '', '', '', 'New Delhi', 'IN', 'en', '', '99', 0, 0, 0, 0, '', '', 0, '', '', 1, 1, 0, 2, 1, 1, 0, 1363545735, 1363545735, 0, ''),
(8, 'manual', 1, 0, 0, 0, 1, 'user6', 'a62242cb30a33312c1be3a2ece3de780', '', 'user6', '6', 'user6@gmail.com', 0, '', '', '', '', '', '', '', '', '', '', 'New Delhi', 'IN', 'en', '', '99', 0, 0, 0, 0, '', '', 0, '', '', 1, 1, 0, 2, 1, 1, 0, 1363545735, 1363545735, 0, ''),
(9, 'manual', 1, 0, 0, 0, 1, 'user7', '4736f021a6c9e655b4fe0bbb6bd07f04', '', 'user7', '7', 'user7@gmail.com', 0, '', '', '', '', '', '', '', '', '', '', 'New Delhi', 'IN', 'en', '', '99', 0, 0, 0, 0, '', '', 0, '', '', 1, 1, 0, 2, 1, 1, 0, 1363545735, 1363545735, 0, ''),
(10, 'manual', 1, 0, 0, 0, 1, 'user8', 'ea89c2e08495a237f9f0ee4730397b70', '', 'user8', '8', 'user8@gmail.com', 0, '', '', '', '', '', '', '', '', '', '', 'New Delhi', 'IN', 'en', '', '99', 0, 0, 0, 0, '', '', 0, '', '', 1, 1, 0, 2, 1, 1, 0, 1363545736, 1363545736, 0, ''),
(11, 'manual', 1, 0, 0, 0, 1, 'user9', 'e80dc8ddb980f29107cd9805baf15215', '', 'user9', '9', 'user9@gmail.com', 0, '', '', '', '', '', '', '', '', '', '', 'New Delhi', 'IN', 'en', '', '99', 0, 0, 0, 0, '', '', 0, '', '', 1, 1, 0, 2, 1, 1, 0, 1363545736, 1363545736, 0, ''),
(12, 'manual', 1, 0, 0, 0, 1, 'user10', '5f47e52a0f5a04e1a8e28e84e289ace0', '', 'user10', '10', 'user10@gmail.com', 0, '', '', '', '', '', '', '', '', '', '', 'New Delhi', 'IN', 'en', '', '99', 0, 0, 0, 0, '', '', 0, '', '', 1, 1, 0, 2, 1, 1, 0, 1363545736, 1363848935, 0, ''),
(13, 'manual', 1, 0, 0, 0, 1, 'user11', '54517f49b67b77a467c29207b4bcd1f1', '', 'user11', '11', 'user11@gmail.com', 0, '', '', '', '', '', '', '', '', '', '', 'New Delhi', 'IN', 'en', '', '99', 0, 0, 0, 0, '', '', 0, '', '', 1, 1, 0, 2, 1, 1, 0, 1363545736, 1363545736, 0, ''),
(14, 'manual', 1, 0, 0, 0, 1, 'user12', '8be14389b074890a4eaeefe6b0d9afad', '', 'user12', '12', 'user12@gmail.com', 0, '', '', '', '', '', '', '', '', '', '', 'New Delhi', 'IN', 'en', '', '99', 0, 0, 0, 0, '', '', 0, '', '', 1, 1, 0, 2, 1, 1, 0, 1363545736, 1363545736, 0, ''),
(15, 'manual', 1, 0, 0, 0, 1, 'user13', '6541c26940bde9fea0803fb537e6372f', '', 'user13', '13', 'user13@gmail.com', 0, '', '', '', '', '', '', '', '', '', '', 'New Delhi', 'IN', 'en', '', '99', 0, 0, 0, 0, '', '', 0, '', '', 1, 1, 0, 2, 1, 1, 0, 1363545736, 1363545736, 0, ''),
(16, 'manual', 1, 0, 0, 0, 1, 'user14', 'dc3cb78a4ca37ee6d3f79ac5cfc5cc6d', '', 'user14', '14', 'user14@gmail.com', 0, '', '', '', '', '', '', '', '', '', '', 'New Delhi', 'IN', 'en', '', '99', 0, 0, 0, 0, '', '', 0, '', '', 1, 1, 0, 2, 1, 1, 0, 1363545736, 1363545736, 0, ''),
(17, 'manual', 1, 0, 0, 0, 1, 'user15', '82220b6523fe9db89e2f4880a97a47d7', '', 'user15', '15', 'user15@gmail.com', 0, '', '', '', '', '', '', '', '', '', '', 'New Delhi', 'IN', 'en', '', '99', 0, 0, 0, 0, '', '', 0, '', '', 1, 1, 0, 2, 1, 1, 0, 1363545736, 1363545736, 0, ''),
(18, 'manual', 1, 0, 0, 0, 1, 'user16', 'ec9ae9f0f2c8c96d8c857d47114bea8c', '', 'user16', '16', 'user16@gmail.com', 0, '', '', '', '', '', '', '', '', '', '', 'New Delhi', 'IN', 'en', '', '99', 0, 0, 0, 0, '', '', 0, '', '', 1, 1, 0, 2, 1, 1, 0, 1363545736, 1363545736, 0, ''),
(19, 'manual', 1, 0, 0, 0, 1, 'user17', '42bf95baf8a886a628843799fd8c74ce', '', 'user17', '17', 'user17@gmail.com', 0, '', '', '', '', '', '', '', '', '', '', 'New Delhi', 'IN', 'en', '', '99', 0, 0, 0, 0, '', '', 0, '', '', 1, 1, 0, 2, 1, 1, 0, 1363545736, 1363545736, 0, ''),
(20, 'manual', 1, 0, 0, 0, 1, 'user18', '987ad61468f4038fc4f52e303ee9e07c', '', 'user18', '18', 'user18@gmail.com', 0, '', '', '', '', '', '', '', '', '', '', 'New Delhi', 'IN', 'en', '', '99', 0, 0, 0, 0, '', '', 0, '', '', 1, 1, 0, 2, 1, 1, 0, 1363545737, 1363545737, 0, ''),
(21, 'manual', 1, 0, 0, 0, 1, 'user19', 'f54ec54954613459605e2de7ba4d587e', '', 'user19', '19', 'user19@gmail.com', 0, '', '', '', '', '', '', '', '', '', '', 'New Delhi', 'IN', 'en', '', '99', 0, 0, 0, 0, '', '', 0, '', '', 1, 1, 0, 2, 1, 1, 0, 1363545737, 1363545737, 0, ''),
(22, 'manual', 1, 0, 0, 0, 1, 'user20', 'd2003708fc154311b749c7b965b54fbf', '', 'user20', '20', 'user20@gmail.com', 0, '', '', '', '', '', '', '', '', '', '', 'New Delhi', 'IN', 'en', '', '99', 0, 0, 0, 0, '', '', 0, '', '', 1, 1, 0, 2, 1, 1, 0, 1363545737, 1363545737, 0, ''),
(23, 'manual', 1, 0, 0, 0, 1, 'user21', 'd4a338800abcf04fc23947018dcc5c7c', '', 'user21', '21', 'user21@gmail.com', 0, '', '', '', '', '', '', '', '', '', '', 'New Delhi', 'IN', 'en', '', '99', 0, 0, 0, 0, '', '', 0, '', '', 1, 1, 0, 2, 1, 1, 0, 1363545737, 1363545737, 0, ''),
(24, 'manual', 1, 0, 0, 0, 1, 'user22', '1991a99eef7cc9b981c59d653af00a58', '', 'user22', '22', 'user22@gmail.com', 0, '', '', '', '', '', '', '', '', '', '', 'New Delhi', 'IN', 'en', '', '99', 0, 0, 0, 0, '', '', 0, '', '', 1, 1, 0, 2, 1, 1, 0, 1363545737, 1363545737, 0, ''),
(25, 'manual', 1, 0, 0, 0, 1, 'user23', '855cdbb274787fda0b67ec37ac4e69a0', '', 'user23', '23', 'user23@gmail.com', 0, '', '', '', '', '', '', '', '', '', '', 'New Delhi', 'IN', 'en', '', '99', 0, 0, 0, 0, '', '', 0, '', '', 1, 1, 0, 2, 1, 1, 0, 1363545737, 1363545737, 0, ''),
(26, 'manual', 1, 0, 0, 0, 1, 'user24', 'd65da00c69f38d73bd7cd6ad44df311a', '', 'user24', '24', 'user24@gmail.com', 0, '', '', '', '', '', '', '', '', '', '', 'New Delhi', 'IN', 'en', '', '99', 0, 0, 0, 0, '', '', 0, '', '', 1, 1, 0, 2, 1, 1, 0, 1363545737, 1363545737, 0, ''),
(27, 'manual', 1, 0, 0, 0, 1, 'user25', 'fc5a9603dc2465cbc6cf762e42be3928', '', 'user25', '25', 'user25@gmail.com', 0, '', '', '', '', '', '', '', '', '', '', 'New Delhi', 'IN', 'en', '', '99', 0, 0, 0, 0, '', '', 0, '', '', 1, 1, 0, 2, 1, 1, 0, 1363545737, 1363545737, 0, ''),
(28, 'manual', 1, 0, 0, 0, 1, 'user26', 'df1ce7aab82da7395d00c35d6779c9df', '', 'user26', '26', 'user26@gmail.com', 0, '', '', '', '', '', '', '', '', '', '', 'New Delhi', 'IN', 'en', '', '99', 0, 0, 0, 0, '', '', 0, '', '', 1, 1, 0, 2, 1, 1, 0, 1363545737, 1363545737, 0, ''),
(29, 'manual', 1, 0, 0, 0, 1, 'user27', '8ed31402b0f098ded6cb503b5d332e13', '', 'user27', '27', 'user27@gmail.com', 0, '', '', '', '', '', '', '', '', '', '', 'New Delhi', 'IN', 'en', '', '99', 0, 0, 0, 0, '', '', 0, '', '', 1, 1, 0, 2, 1, 1, 0, 1363545737, 1363545737, 0, ''),
(30, 'manual', 1, 0, 0, 0, 1, 'user28', 'f2c84ca86405507b71c589c48144ce9f', '', 'user28', '28', 'user28@gmail.com', 0, '', '', '', '', '', '', '', '', '', '', 'New Delhi', 'IN', 'en', '', '99', 0, 0, 0, 0, '', '', 0, '', '', 1, 1, 0, 2, 1, 1, 0, 1363545738, 1363545738, 0, ''),
(31, 'manual', 1, 0, 0, 0, 1, 'user29', '79a2233ae9d09e336dfbe4d6f81a614d', '', 'user29', '29', 'user29@gmail.com', 0, '', '', '', '', '', '', '', '', '', '', 'New Delhi', 'IN', 'en', '', '99', 0, 0, 0, 0, '', '', 0, '', '', 1, 1, 0, 2, 1, 1, 0, 1363545738, 1363545738, 0, ''),
(32, 'manual', 1, 0, 0, 0, 1, 'user30', '8f5919b79784c8378a4ff9f8e0e5d6bc', '', 'user30', '30', 'user30@gmail.com', 0, '', '', '', '', '', '', '', '', '', '', 'New Delhi', 'IN', 'en', '', '99', 0, 0, 0, 0, '', '', 0, '', '', 1, 1, 0, 2, 1, 1, 0, 1363545738, 1363545738, 0, ''),
(33, 'manual', 1, 0, 0, 0, 1, 'sudhanshu', '6221f40141c062ead2331114d82a7418', '', 'Sudhanshu', 'Verma', 'nitanshuverma@gmail.com', 0, '', '', '', '', '', '', '', '', '', '', 'New Delhi', 'IN', 'en', '', '99', 0, 0, 0, 0, '', '', 0, '', '', 1, 1, 0, 2, 1, 1, 0, 1363983350, 1363983350, 0, '');

-- --------------------------------------------------------

--
-- Table structure for table `mdl_user_enrolments`
--

CREATE TABLE IF NOT EXISTS `mdl_user_enrolments` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `status` bigint(10) NOT NULL DEFAULT '0',
  `enrolid` bigint(10) NOT NULL,
  `userid` bigint(10) NOT NULL,
  `timestart` bigint(10) NOT NULL DEFAULT '0',
  `timeend` bigint(10) NOT NULL DEFAULT '2147483647',
  `modifierid` bigint(10) NOT NULL DEFAULT '0',
  `timecreated` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_userenro_enruse_uix` (`enrolid`,`userid`),
  KEY `mdl_userenro_enr_ix` (`enrolid`),
  KEY `mdl_userenro_use_ix` (`userid`),
  KEY `mdl_userenro_mod_ix` (`modifierid`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Users participating in courses (aka enrolled users) - everyb' AUTO_INCREMENT=16 ;

--
-- Dumping data for table `mdl_user_enrolments`
--

INSERT INTO `mdl_user_enrolments` (`id`, `status`, `enrolid`, `userid`, `timestart`, `timeend`, `modifierid`, `timecreated`, `timemodified`) VALUES
(10, 0, 10, 3, 1365544800, 0, 2, 1365625788, 1365625788),
(11, 0, 10, 4, 1365544800, 0, 2, 1365625795, 1365625795),
(12, 0, 10, 32, 1365544800, 0, 2, 1365625803, 1365625803),
(13, 0, 13, 12, 1365631200, 0, 2, 1365654269, 1365654269),
(14, 0, 13, 4, 1365631200, 0, 2, 1365654285, 1365654285),
(15, 0, 13, 24, 1365631200, 0, 2, 1365654289, 1365654289);

-- --------------------------------------------------------

--
-- Table structure for table `mdl_user_info_category`
--

CREATE TABLE IF NOT EXISTS `mdl_user_info_category` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  `sortorder` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Customisable fields categories' AUTO_INCREMENT=2 ;

--
-- Dumping data for table `mdl_user_info_category`
--

INSERT INTO `mdl_user_info_category` (`id`, `name`, `sortorder`) VALUES
(1, 'Other fields', 1);

-- --------------------------------------------------------

--
-- Table structure for table `mdl_user_info_data`
--

CREATE TABLE IF NOT EXISTS `mdl_user_info_data` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `fieldid` bigint(10) NOT NULL DEFAULT '0',
  `data` longtext NOT NULL,
  `dataformat` tinyint(2) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_userinfodata_usefie_ix` (`userid`,`fieldid`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Data for the customisable user fields' AUTO_INCREMENT=67 ;

--
-- Dumping data for table `mdl_user_info_data`
--

INSERT INTO `mdl_user_info_data` (`id`, `userid`, `fieldid`, `data`, `dataformat`) VALUES
(1, 3, 1, 'Female', 0),
(2, 3, 2, '1362594900', 0),
(4, 3, 4, 'Hindu', 0),
(5, 3, 5, 'Hindu', 0),
(6, 3, 6, '9810606079', 0),
(7, 3, 7, 'Ayodhya Prasad Verma', 0),
(8, 3, 8, 'IT', 0),
(9, 3, 9, '<p>K-244 katra barabanki</p>', 1),
(10, 3, 10, 'BARABANKI', 0),
(11, 3, 11, '225001', 0),
(12, 3, 12, 'SHARDA', 0),
(13, 3, 13, 'BARABANKI', 0),
(14, 3, 14, 'BARABANKI', 0),
(15, 3, 15, 'UP', 0),
(16, 3, 16, 'Sudhanshu Verma', 0),
(17, 3, 17, '9810606079', 0),
(18, 3, 18, 'UP', 0),
(19, 12, 1, 'Male', 0),
(20, 12, 2, '1363848600', 0),
(21, 12, 4, 'SC', 0),
(22, 12, 5, 'Buddhist', 0),
(23, 12, 6, '9810606079', 0),
(24, 12, 7, 'Neetu sabarwal', 0),
(25, 12, 8, 'sdgsdgsdgs', 0),
(26, 12, 9, '<p>Rz 60/6 tuglakabad extension new delhi</p>', 1),
(27, 12, 10, 'BARABANkI', 0),
(28, 12, 11, '225001', 0),
(29, 12, 12, 'fdgdfgdfgdfgdf', 0),
(30, 12, 13, 'dsgsdfgdsfgdfg', 0),
(31, 12, 14, 'dfgdfgdfg', 0),
(32, 12, 15, 'dfgdfgdfg', 0),
(33, 12, 16, 'dgsdgsdg', 0),
(34, 12, 17, 'dsgsdgsdgh', 0),
(35, 12, 18, 'UP', 0),
(36, 12, 19, '1363820400', 0),
(37, 12, 20, '<p>Highschool,</p>\r\n<p>Intermediate</p>', 1),
(38, 12, 21, '102', 0),
(39, 12, 22, '12656', 0),
(40, 12, 23, 'sdgfsdgdsg', 0),
(41, 12, 24, 'gdfgdfgdfg', 0),
(42, 33, 1, 'Male', 0),
(43, 33, 2, '1363983000', 0),
(44, 33, 4, 'SC', 0),
(45, 33, 5, 'Buddhist', 0),
(46, 33, 6, '', 0),
(47, 33, 7, '', 0),
(48, 33, 8, '', 0),
(49, 33, 9, '', 1),
(50, 33, 10, '', 0),
(51, 33, 11, '', 0),
(52, 33, 12, '', 0),
(53, 33, 13, '', 0),
(54, 33, 14, '', 0),
(55, 33, 15, '', 0),
(56, 33, 16, '', 0),
(57, 33, 17, '', 0),
(58, 33, 18, 'UP', 0),
(59, 33, 19, '0', 0),
(60, 33, 20, '', 1),
(61, 33, 21, '', 0),
(62, 33, 22, '', 0),
(63, 33, 23, '', 0),
(64, 33, 24, '', 0),
(65, 4, 21, '102', 0),
(66, 6, 21, '103', 0);

-- --------------------------------------------------------

--
-- Table structure for table `mdl_user_info_field`
--

CREATE TABLE IF NOT EXISTS `mdl_user_info_field` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `shortname` varchar(255) NOT NULL DEFAULT 'shortname',
  `name` longtext NOT NULL,
  `datatype` varchar(255) NOT NULL DEFAULT '',
  `description` longtext,
  `descriptionformat` tinyint(2) NOT NULL DEFAULT '0',
  `categoryid` bigint(10) NOT NULL DEFAULT '0',
  `sortorder` bigint(10) NOT NULL DEFAULT '0',
  `required` tinyint(2) NOT NULL DEFAULT '0',
  `locked` tinyint(2) NOT NULL DEFAULT '0',
  `visible` smallint(4) NOT NULL DEFAULT '0',
  `forceunique` tinyint(2) NOT NULL DEFAULT '0',
  `signup` tinyint(2) NOT NULL DEFAULT '0',
  `defaultdata` longtext,
  `defaultdataformat` tinyint(2) NOT NULL DEFAULT '0',
  `param1` longtext,
  `param2` longtext,
  `param3` longtext,
  `param4` longtext,
  `param5` longtext,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Customisable user profile fields' AUTO_INCREMENT=25 ;

--
-- Dumping data for table `mdl_user_info_field`
--

INSERT INTO `mdl_user_info_field` (`id`, `shortname`, `name`, `datatype`, `description`, `descriptionformat`, `categoryid`, `sortorder`, `required`, `locked`, `visible`, `forceunique`, `signup`, `defaultdata`, `defaultdataformat`, `param1`, `param2`, `param3`, `param4`, `param5`) VALUES
(1, 'gender', 'Gender', 'menu', '<p>Gender1</p>', 1, 1, 1, 1, 0, 2, 0, 1, 'Male', 0, 'Male\nFemale', '', '', '', ''),
(2, 'dob', 'DOB', 'datetime', '<p>Date of birth.</p>', 1, 1, 2, 1, 1, 2, 0, 1, '0', 0, '1970', '2033', '1', '', ''),
(4, 'Caste', 'Caste', 'menu', '<p>Caste</p>', 1, 1, 3, 1, 0, 2, 0, 1, '', 0, 'SC\nST\nOBC\nGeneral\nOthers', '', '', '', ''),
(5, 'religion', 'Religion', 'menu', '<p>Religion</p>', 1, 1, 4, 1, 0, 2, 0, 1, '', 0, 'Buddhist\nChristian\nHindu\nMuslim\nSikh\nOthers', '', '', '', ''),
(6, 'contact', 'Contact Number (10 digit is mandatory. Only Numbers are allowed, no spaces, no dash)', 'text', '<p>Contact Number numeric</p>', 1, 1, 5, 1, 0, 2, 0, 1, '', 0, '30', '2048', '0', '', ''),
(7, 'father', 'Father''s/Husband Name', 'text', '<p>Father''s Name or Husband''s Name</p>', 1, 1, 6, 1, 0, 2, 0, 1, '', 0, '25', '2048', '0', '', ''),
(8, 'posting', 'Department of Posting', 'text', '<p>Department of Posting</p>', 1, 2, 6, 0, 0, 2, 0, 1, '', 0, '25', '2048', '0', '', ''),
(9, 'address3', 'Address of Communication', 'textarea', '<p>Address of Communication</p>', 1, 1, 7, 0, 0, 2, 0, 0, '', 1, '', '', '', '', ''),
(10, 'district', 'Permanent Address District', 'text', '<p>District</p>', 1, 1, 8, 1, 0, 2, 0, 1, '', 0, '25', '2048', '0', '', ''),
(11, 'pincode', 'Permanent Address Pin Code (Only Numbers are allowed, no spaces, no dash)', 'text', '<p>Pin Code numeric</p>', 1, 1, 9, 1, 0, 2, 0, 1, '', 0, '25', '2048', '0', '', ''),
(12, 'hospitalname', 'Hospital Name', 'text', '<p>Hospital Name</p>', 1, 2, 1, 0, 0, 2, 0, 1, '', 0, '30', '2048', '0', '', ''),
(13, 'hospitalcity', 'HospitalCity', 'text', '<p>Hospital City</p>', 1, 2, 8, 0, 0, 2, 0, 1, '', 0, '25', '2048', '0', '', ''),
(14, 'hospitaldistrict', 'HospitalDistrict', 'text', '<p>Hospital District</p>', 1, 2, 4, 0, 0, 2, 0, 1, '', 0, '25', '2048', '0', '', ''),
(15, 'hospitalstate', 'Hospital State', 'text', '<p>Hospital State</p>', 1, 2, 5, 0, 0, 2, 0, 1, '', 0, '25', '2048', '0', '', ''),
(16, 'contactpersonofhospital', 'Contact Person in Hospital', 'text', '<p>Contact Person Name in Hospital</p>', 1, 2, 2, 0, 0, 2, 0, 1, '', 0, '25', '2048', '0', '', ''),
(17, 'contactpersonnumberinhospital', 'Contact Person Number in Hospital (Only numbers are allowed)', 'text', '<p>Contact Person Number in Hospital numeric</p>', 1, 2, 3, 0, 0, 2, 0, 1, '', 0, '25', '2048', '0', '', ''),
(18, 'state', 'State', 'menu', '<p>This is state name.</p>', 1, 1, 10, 1, 0, 2, 0, 1, '', 0, 'UP\nKarnataka', '', '', '', ''),
(19, 'joiningdate', 'Date of joining of hospital.', 'datetime', '<p>Date of joining of hospital.</p>', 1, 2, 7, 0, 0, 2, 0, 1, '0', 0, '2000', '2032', '', '', ''),
(20, 'education', 'Education (e.g B.Sc, B.Com, 10+2 etc)', 'textarea', '<p>Education</p>', 1, 1, 11, 1, 0, 2, 0, 1, '', 1, '', '', '', '', ''),
(21, 'batchno', 'Batch Number', 'text', '<p>is the batch no field</p>', 1, 1, 12, 1, 0, 2, 0, 1, '', 0, '25', '2048', '0', '', ''),
(22, 'batchidno', 'Batch Id Number', 'text', '<p>Batch Id Number</p>', 1, 1, 13, 1, 0, 2, 0, 1, '', 0, '30', '2048', '0', '', ''),
(23, 'permanent', 'Permanent Address', 'text', '<p>Please put your permanent address</p>', 1, 1, 14, 1, 0, 2, 0, 1, '', 0, '80', '4000', '0', '', ''),
(24, 'permacity', 'Permanent Address City', 'text', '<p><sub>Â </sub></p>', 1, 1, 15, 1, 0, 2, 0, 1, '', 0, '30', '2048', '0', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `mdl_user_lastaccess`
--

CREATE TABLE IF NOT EXISTS `mdl_user_lastaccess` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `courseid` bigint(10) NOT NULL DEFAULT '0',
  `timeaccess` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_userlast_usecou_uix` (`userid`,`courseid`),
  KEY `mdl_userlast_use_ix` (`userid`),
  KEY `mdl_userlast_cou_ix` (`courseid`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='To keep track of course page access times, used in online pa' AUTO_INCREMENT=7 ;

--
-- Dumping data for table `mdl_user_lastaccess`
--

INSERT INTO `mdl_user_lastaccess` (`id`, `userid`, `courseid`, `timeaccess`) VALUES
(5, 2, 5, 1365654427),
(6, 2, 6, 1365654446);

-- --------------------------------------------------------

--
-- Table structure for table `mdl_user_preferences`
--

CREATE TABLE IF NOT EXISTS `mdl_user_preferences` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `value` varchar(1333) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_userpref_usenam_uix` (`userid`,`name`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Allows modules to store arbitrary user preferences' AUTO_INCREMENT=12 ;

--
-- Dumping data for table `mdl_user_preferences`
--

INSERT INTO `mdl_user_preferences` (`id`, `userid`, `name`, `value`) VALUES
(1, 2, 'email_bounce_count', '1'),
(2, 2, 'email_send_count', '1'),
(3, 3, 'auth_forcepasswordchange', '0'),
(4, 3, 'email_bounce_count', '1'),
(5, 3, 'email_send_count', '1'),
(6, 4, 'auth_forcepasswordchange', '0'),
(7, 4, 'email_bounce_count', '1'),
(8, 4, 'email_send_count', '1'),
(9, 5, 'auth_forcepasswordchange', '0'),
(10, 5, 'email_bounce_count', '1'),
(11, 5, 'email_send_count', '1');

-- --------------------------------------------------------

--
-- Table structure for table `mdl_user_private_key`
--

CREATE TABLE IF NOT EXISTS `mdl_user_private_key` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `script` varchar(128) NOT NULL DEFAULT '',
  `value` varchar(128) NOT NULL DEFAULT '',
  `userid` bigint(10) NOT NULL,
  `instance` bigint(10) DEFAULT NULL,
  `iprestriction` varchar(255) DEFAULT NULL,
  `validuntil` bigint(10) DEFAULT NULL,
  `timecreated` bigint(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_userprivkey_scrval_ix` (`script`,`value`),
  KEY `mdl_userprivkey_use_ix` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='access keys used in cookieless scripts - rss, etc.' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_webdav_locks`
--

CREATE TABLE IF NOT EXISTS `mdl_webdav_locks` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `token` varchar(255) NOT NULL DEFAULT '',
  `path` varchar(255) NOT NULL DEFAULT '',
  `expiry` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `recursive` tinyint(1) NOT NULL DEFAULT '0',
  `exclusivelock` tinyint(1) NOT NULL DEFAULT '0',
  `created` bigint(10) NOT NULL DEFAULT '0',
  `modified` bigint(10) NOT NULL DEFAULT '0',
  `owner` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_webdlock_tok_uix` (`token`),
  KEY `mdl_webdlock_pat_ix` (`path`),
  KEY `mdl_webdlock_exp_ix` (`expiry`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Resource locks for WebDAV users' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_wiki`
--

CREATE TABLE IF NOT EXISTS `mdl_wiki` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `course` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT 'Wiki',
  `intro` longtext,
  `introformat` smallint(4) NOT NULL DEFAULT '0',
  `timecreated` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `firstpagetitle` varchar(255) NOT NULL DEFAULT 'First Page',
  `wikimode` varchar(20) NOT NULL DEFAULT 'collaborative',
  `defaultformat` varchar(20) NOT NULL DEFAULT 'creole',
  `forceformat` tinyint(1) NOT NULL DEFAULT '1',
  `editbegin` bigint(10) NOT NULL DEFAULT '0',
  `editend` bigint(10) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_wiki_cou_ix` (`course`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Stores Wiki activity configuration' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_wiki_links`
--

CREATE TABLE IF NOT EXISTS `mdl_wiki_links` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `subwikiid` bigint(10) NOT NULL DEFAULT '0',
  `frompageid` bigint(10) NOT NULL DEFAULT '0',
  `topageid` bigint(10) NOT NULL DEFAULT '0',
  `tomissingpage` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_wikilink_fro_ix` (`frompageid`),
  KEY `mdl_wikilink_sub_ix` (`subwikiid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Page wiki links' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_wiki_locks`
--

CREATE TABLE IF NOT EXISTS `mdl_wiki_locks` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `pageid` bigint(10) NOT NULL DEFAULT '0',
  `sectionname` varchar(255) DEFAULT NULL,
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `lockedat` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Manages page locks' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_wiki_pages`
--

CREATE TABLE IF NOT EXISTS `mdl_wiki_pages` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `subwikiid` bigint(10) NOT NULL DEFAULT '0',
  `title` varchar(255) NOT NULL DEFAULT 'title',
  `cachedcontent` longtext NOT NULL,
  `timecreated` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `timerendered` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `pageviews` bigint(10) NOT NULL DEFAULT '0',
  `readonly` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_wikipage_subtituse_uix` (`subwikiid`,`title`,`userid`),
  KEY `mdl_wikipage_sub_ix` (`subwikiid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Stores wiki pages' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_wiki_subwikis`
--

CREATE TABLE IF NOT EXISTS `mdl_wiki_subwikis` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `wikiid` bigint(10) NOT NULL DEFAULT '0',
  `groupid` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_wikisubw_wikgrouse_uix` (`wikiid`,`groupid`,`userid`),
  KEY `mdl_wikisubw_wik_ix` (`wikiid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Stores subwiki instances' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_wiki_synonyms`
--

CREATE TABLE IF NOT EXISTS `mdl_wiki_synonyms` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `subwikiid` bigint(10) NOT NULL DEFAULT '0',
  `pageid` bigint(10) NOT NULL DEFAULT '0',
  `pagesynonym` varchar(255) NOT NULL DEFAULT 'Pagesynonym',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_wikisyno_pagpag_uix` (`pageid`,`pagesynonym`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Stores wiki pages synonyms' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_wiki_versions`
--

CREATE TABLE IF NOT EXISTS `mdl_wiki_versions` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `pageid` bigint(10) NOT NULL DEFAULT '0',
  `content` longtext NOT NULL,
  `contentformat` varchar(20) NOT NULL DEFAULT 'creole',
  `version` mediumint(5) NOT NULL DEFAULT '0',
  `timecreated` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_wikivers_pag_ix` (`pageid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Stores wiki page history' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_workshop`
--

CREATE TABLE IF NOT EXISTS `mdl_workshop` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `course` bigint(10) NOT NULL,
  `name` varchar(255) NOT NULL DEFAULT '',
  `intro` longtext,
  `introformat` smallint(3) NOT NULL DEFAULT '0',
  `instructauthors` longtext,
  `instructauthorsformat` smallint(3) NOT NULL DEFAULT '0',
  `instructreviewers` longtext,
  `instructreviewersformat` smallint(3) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL,
  `phase` smallint(3) DEFAULT '0',
  `useexamples` tinyint(2) DEFAULT '0',
  `usepeerassessment` tinyint(2) DEFAULT '0',
  `useselfassessment` tinyint(2) DEFAULT '0',
  `grade` decimal(10,5) DEFAULT '80.00000',
  `gradinggrade` decimal(10,5) DEFAULT '20.00000',
  `strategy` varchar(30) NOT NULL DEFAULT '',
  `evaluation` varchar(30) NOT NULL DEFAULT '',
  `gradedecimals` smallint(3) DEFAULT '0',
  `nattachments` smallint(3) DEFAULT '0',
  `latesubmissions` tinyint(2) DEFAULT '0',
  `maxbytes` bigint(10) DEFAULT '100000',
  `examplesmode` smallint(3) DEFAULT '0',
  `submissionstart` bigint(10) DEFAULT '0',
  `submissionend` bigint(10) DEFAULT '0',
  `assessmentstart` bigint(10) DEFAULT '0',
  `assessmentend` bigint(10) DEFAULT '0',
  `phaseswitchassessment` tinyint(2) NOT NULL DEFAULT '0',
  `conclusion` longtext,
  `conclusionformat` smallint(3) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `mdl_work_cou_ix` (`course`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='This table keeps information about the module instances and ' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_workshopallocation_scheduled`
--

CREATE TABLE IF NOT EXISTS `mdl_workshopallocation_scheduled` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `workshopid` bigint(10) NOT NULL,
  `enabled` tinyint(2) NOT NULL DEFAULT '0',
  `submissionend` bigint(10) NOT NULL,
  `timeallocated` bigint(10) DEFAULT NULL,
  `settings` longtext,
  `resultstatus` bigint(10) DEFAULT NULL,
  `resultmessage` varchar(1333) DEFAULT NULL,
  `resultlog` longtext,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_worksche_wor_uix` (`workshopid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Stores the allocation settings for the scheduled allocator' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_workshopeval_best_settings`
--

CREATE TABLE IF NOT EXISTS `mdl_workshopeval_best_settings` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `workshopid` bigint(10) NOT NULL,
  `comparison` smallint(3) DEFAULT '5',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_workbestsett_wor_uix` (`workshopid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Settings for the grading evaluation subplugin Comparison wit' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_workshopform_accumulative`
--

CREATE TABLE IF NOT EXISTS `mdl_workshopform_accumulative` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `workshopid` bigint(10) NOT NULL,
  `sort` bigint(10) DEFAULT '0',
  `description` longtext,
  `descriptionformat` smallint(3) DEFAULT '0',
  `grade` bigint(10) NOT NULL,
  `weight` mediumint(5) DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `mdl_workaccu_wor_ix` (`workshopid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='The assessment dimensions definitions of Accumulative gradin' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_workshopform_comments`
--

CREATE TABLE IF NOT EXISTS `mdl_workshopform_comments` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `workshopid` bigint(10) NOT NULL,
  `sort` bigint(10) DEFAULT '0',
  `description` longtext,
  `descriptionformat` smallint(3) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_workcomm_wor_ix` (`workshopid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='The assessment dimensions definitions of Comments strategy f' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_workshopform_numerrors`
--

CREATE TABLE IF NOT EXISTS `mdl_workshopform_numerrors` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `workshopid` bigint(10) NOT NULL,
  `sort` bigint(10) DEFAULT '0',
  `description` longtext,
  `descriptionformat` smallint(3) DEFAULT '0',
  `descriptiontrust` bigint(10) DEFAULT NULL,
  `grade0` varchar(50) DEFAULT NULL,
  `grade1` varchar(50) DEFAULT NULL,
  `weight` mediumint(5) DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `mdl_worknume_wor_ix` (`workshopid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='The assessment dimensions definitions of Number of errors gr' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_workshopform_numerrors_map`
--

CREATE TABLE IF NOT EXISTS `mdl_workshopform_numerrors_map` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `workshopid` bigint(10) NOT NULL,
  `nonegative` bigint(10) NOT NULL,
  `grade` decimal(10,5) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_worknumemap_wornon_uix` (`workshopid`,`nonegative`),
  KEY `mdl_worknumemap_wor_ix` (`workshopid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='This maps the number of errors to a percentual grade for sub' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_workshopform_rubric`
--

CREATE TABLE IF NOT EXISTS `mdl_workshopform_rubric` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `workshopid` bigint(10) NOT NULL,
  `sort` bigint(10) DEFAULT '0',
  `description` longtext,
  `descriptionformat` smallint(3) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_workrubr_wor_ix` (`workshopid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='The assessment dimensions definitions of Rubric grading stra' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_workshopform_rubric_config`
--

CREATE TABLE IF NOT EXISTS `mdl_workshopform_rubric_config` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `workshopid` bigint(10) NOT NULL,
  `layout` varchar(30) DEFAULT 'list',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_workrubrconf_wor_uix` (`workshopid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Configuration table for the Rubric grading strategy' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_workshopform_rubric_levels`
--

CREATE TABLE IF NOT EXISTS `mdl_workshopform_rubric_levels` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `dimensionid` bigint(10) NOT NULL,
  `grade` decimal(10,5) NOT NULL,
  `definition` longtext,
  `definitionformat` smallint(3) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_workrubrleve_dim_ix` (`dimensionid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='The definition of rubric rating scales' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_workshop_aggregations`
--

CREATE TABLE IF NOT EXISTS `mdl_workshop_aggregations` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `workshopid` bigint(10) NOT NULL,
  `userid` bigint(10) NOT NULL,
  `gradinggrade` decimal(10,5) DEFAULT NULL,
  `timegraded` bigint(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_workaggr_woruse_uix` (`workshopid`,`userid`),
  KEY `mdl_workaggr_wor_ix` (`workshopid`),
  KEY `mdl_workaggr_use_ix` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Aggregated grades for assessment are stored here. The aggreg' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_workshop_assessments`
--

CREATE TABLE IF NOT EXISTS `mdl_workshop_assessments` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `submissionid` bigint(10) NOT NULL,
  `reviewerid` bigint(10) NOT NULL,
  `weight` bigint(10) NOT NULL DEFAULT '1',
  `timecreated` bigint(10) DEFAULT '0',
  `timemodified` bigint(10) DEFAULT '0',
  `grade` decimal(10,5) DEFAULT NULL,
  `gradinggrade` decimal(10,5) DEFAULT NULL,
  `gradinggradeover` decimal(10,5) DEFAULT NULL,
  `gradinggradeoverby` bigint(10) DEFAULT NULL,
  `feedbackauthor` longtext,
  `feedbackauthorformat` smallint(3) DEFAULT '0',
  `feedbackreviewer` longtext,
  `feedbackreviewerformat` smallint(3) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_workasse_sub_ix` (`submissionid`),
  KEY `mdl_workasse_gra_ix` (`gradinggradeoverby`),
  KEY `mdl_workasse_rev_ix` (`reviewerid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Info about the made assessment and automatically calculated ' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_workshop_assessments_old`
--

CREATE TABLE IF NOT EXISTS `mdl_workshop_assessments_old` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `workshopid` bigint(10) NOT NULL DEFAULT '0',
  `submissionid` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `timecreated` bigint(10) NOT NULL DEFAULT '0',
  `timegraded` bigint(10) NOT NULL DEFAULT '0',
  `timeagreed` bigint(10) NOT NULL DEFAULT '0',
  `grade` double NOT NULL DEFAULT '0',
  `gradinggrade` smallint(3) NOT NULL DEFAULT '0',
  `teachergraded` smallint(3) NOT NULL DEFAULT '0',
  `mailed` smallint(3) NOT NULL DEFAULT '0',
  `resubmission` smallint(3) NOT NULL DEFAULT '0',
  `donotuse` smallint(3) NOT NULL DEFAULT '0',
  `generalcomment` longtext,
  `teachercomment` longtext,
  `newplugin` varchar(28) DEFAULT NULL,
  `newid` bigint(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_workasseold_use_ix` (`userid`),
  KEY `mdl_workasseold_mai_ix` (`mailed`),
  KEY `mdl_workasseold_wor_ix` (`workshopid`),
  KEY `mdl_workasseold_sub_ix` (`submissionid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Legacy workshop_assessments table to be dropped later in Moo' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_workshop_comments_old`
--

CREATE TABLE IF NOT EXISTS `mdl_workshop_comments_old` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `workshopid` bigint(10) NOT NULL DEFAULT '0',
  `assessmentid` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `timecreated` bigint(10) NOT NULL DEFAULT '0',
  `mailed` tinyint(2) NOT NULL DEFAULT '0',
  `comments` longtext NOT NULL,
  `newplugin` varchar(28) DEFAULT NULL,
  `newid` bigint(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_workcommold_use_ix` (`userid`),
  KEY `mdl_workcommold_mai_ix` (`mailed`),
  KEY `mdl_workcommold_wor_ix` (`workshopid`),
  KEY `mdl_workcommold_ass_ix` (`assessmentid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Legacy workshop_comments table to be dropped later in Moodle' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_workshop_elements_old`
--

CREATE TABLE IF NOT EXISTS `mdl_workshop_elements_old` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `workshopid` bigint(10) NOT NULL DEFAULT '0',
  `elementno` smallint(3) NOT NULL DEFAULT '0',
  `description` longtext NOT NULL,
  `scale` smallint(3) NOT NULL DEFAULT '0',
  `maxscore` smallint(3) NOT NULL DEFAULT '1',
  `weight` smallint(3) NOT NULL DEFAULT '11',
  `stddev` double NOT NULL DEFAULT '0',
  `totalassessments` bigint(10) NOT NULL DEFAULT '0',
  `newplugin` varchar(28) DEFAULT NULL,
  `newid` bigint(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_workelemold_wor_ix` (`workshopid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Legacy workshop_elements table to be dropped later in Moodle' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_workshop_grades`
--

CREATE TABLE IF NOT EXISTS `mdl_workshop_grades` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `assessmentid` bigint(10) NOT NULL,
  `strategy` varchar(30) NOT NULL DEFAULT '',
  `dimensionid` bigint(10) NOT NULL,
  `grade` decimal(10,5) NOT NULL,
  `peercomment` longtext,
  `peercommentformat` smallint(3) DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_workgrad_assstrdim_uix` (`assessmentid`,`strategy`,`dimensionid`),
  KEY `mdl_workgrad_ass_ix` (`assessmentid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='How the reviewers filled-up the grading forms, given grades ' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_workshop_grades_old`
--

CREATE TABLE IF NOT EXISTS `mdl_workshop_grades_old` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `workshopid` bigint(10) NOT NULL DEFAULT '0',
  `assessmentid` bigint(10) NOT NULL DEFAULT '0',
  `elementno` bigint(10) NOT NULL DEFAULT '0',
  `feedback` longtext NOT NULL,
  `grade` smallint(3) NOT NULL DEFAULT '0',
  `newplugin` varchar(28) DEFAULT NULL,
  `newid` bigint(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_workgradold_wor_ix` (`workshopid`),
  KEY `mdl_workgradold_ass_ix` (`assessmentid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Legacy workshop_grades table to be dropped later in Moodle 2' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_workshop_old`
--

CREATE TABLE IF NOT EXISTS `mdl_workshop_old` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `course` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `description` longtext NOT NULL,
  `wtype` smallint(3) NOT NULL DEFAULT '0',
  `nelements` smallint(3) NOT NULL DEFAULT '1',
  `nattachments` smallint(3) NOT NULL DEFAULT '0',
  `phase` tinyint(2) NOT NULL DEFAULT '0',
  `format` tinyint(2) NOT NULL DEFAULT '0',
  `gradingstrategy` tinyint(2) NOT NULL DEFAULT '1',
  `resubmit` tinyint(2) NOT NULL DEFAULT '0',
  `agreeassessments` tinyint(2) NOT NULL DEFAULT '0',
  `hidegrades` tinyint(2) NOT NULL DEFAULT '0',
  `anonymous` tinyint(2) NOT NULL DEFAULT '0',
  `includeself` tinyint(2) NOT NULL DEFAULT '0',
  `maxbytes` bigint(10) NOT NULL DEFAULT '100000',
  `submissionstart` bigint(10) NOT NULL DEFAULT '0',
  `assessmentstart` bigint(10) NOT NULL DEFAULT '0',
  `submissionend` bigint(10) NOT NULL DEFAULT '0',
  `assessmentend` bigint(10) NOT NULL DEFAULT '0',
  `releasegrades` bigint(10) NOT NULL DEFAULT '0',
  `grade` smallint(3) NOT NULL DEFAULT '0',
  `gradinggrade` smallint(3) NOT NULL DEFAULT '0',
  `ntassessments` smallint(3) NOT NULL DEFAULT '0',
  `assessmentcomps` smallint(3) NOT NULL DEFAULT '2',
  `nsassessments` smallint(3) NOT NULL DEFAULT '0',
  `overallocation` smallint(3) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `teacherweight` smallint(3) NOT NULL DEFAULT '1',
  `showleaguetable` smallint(3) NOT NULL DEFAULT '0',
  `usepassword` smallint(3) NOT NULL DEFAULT '0',
  `password` varchar(32) NOT NULL DEFAULT '',
  `newplugin` varchar(28) DEFAULT NULL,
  `newid` bigint(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_workold_cou_ix` (`course`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Legacy workshop table to be dropped later in Moodle 2.x' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_workshop_rubrics_old`
--

CREATE TABLE IF NOT EXISTS `mdl_workshop_rubrics_old` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `workshopid` bigint(10) NOT NULL DEFAULT '0',
  `elementno` bigint(10) NOT NULL DEFAULT '0',
  `rubricno` smallint(3) NOT NULL DEFAULT '0',
  `description` longtext NOT NULL,
  `newplugin` varchar(28) DEFAULT NULL,
  `newid` bigint(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_workrubrold_wor_ix` (`workshopid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Legacy workshop_rubrics table to be dropped later in Moodle ' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_workshop_stockcomments_old`
--

CREATE TABLE IF NOT EXISTS `mdl_workshop_stockcomments_old` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `workshopid` bigint(10) NOT NULL DEFAULT '0',
  `elementno` bigint(10) NOT NULL DEFAULT '0',
  `comments` longtext NOT NULL,
  `newplugin` varchar(28) DEFAULT NULL,
  `newid` bigint(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_workstocold_wor_ix` (`workshopid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Legacy workshop_stockcomments table to be dropped later in M' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_workshop_submissions`
--

CREATE TABLE IF NOT EXISTS `mdl_workshop_submissions` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `workshopid` bigint(10) NOT NULL,
  `example` tinyint(2) DEFAULT '0',
  `authorid` bigint(10) NOT NULL,
  `timecreated` bigint(10) NOT NULL,
  `timemodified` bigint(10) NOT NULL,
  `title` varchar(255) NOT NULL DEFAULT '',
  `content` longtext,
  `contentformat` smallint(3) NOT NULL DEFAULT '0',
  `contenttrust` smallint(3) NOT NULL DEFAULT '0',
  `attachment` tinyint(2) DEFAULT '0',
  `grade` decimal(10,5) DEFAULT NULL,
  `gradeover` decimal(10,5) DEFAULT NULL,
  `gradeoverby` bigint(10) DEFAULT NULL,
  `feedbackauthor` longtext,
  `feedbackauthorformat` smallint(3) DEFAULT '0',
  `timegraded` bigint(10) DEFAULT NULL,
  `published` tinyint(2) DEFAULT '0',
  `late` tinyint(2) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_worksubm_wor_ix` (`workshopid`),
  KEY `mdl_worksubm_gra_ix` (`gradeoverby`),
  KEY `mdl_worksubm_aut_ix` (`authorid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Info about the submission and the aggregation of the grade f' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_workshop_submissions_old`
--

CREATE TABLE IF NOT EXISTS `mdl_workshop_submissions_old` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `workshopid` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `title` varchar(100) NOT NULL DEFAULT '',
  `timecreated` bigint(10) NOT NULL DEFAULT '0',
  `mailed` tinyint(2) NOT NULL DEFAULT '0',
  `description` longtext NOT NULL,
  `gradinggrade` smallint(3) NOT NULL DEFAULT '0',
  `finalgrade` smallint(3) NOT NULL DEFAULT '0',
  `late` smallint(3) NOT NULL DEFAULT '0',
  `nassessments` bigint(10) NOT NULL DEFAULT '0',
  `newplugin` varchar(28) DEFAULT NULL,
  `newid` bigint(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_worksubmold_use_ix` (`userid`),
  KEY `mdl_worksubmold_mai_ix` (`mailed`),
  KEY `mdl_worksubmold_wor_ix` (`workshopid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Legacy workshop_submissions table to be dropped later in Moo' AUTO_INCREMENT=1 ;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
