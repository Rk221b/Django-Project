-- phpMyAdmin SQL Dump
-- version 4.7.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Sep 29, 2019 at 03:22 PM
-- Server version: 5.6.34-log
-- PHP Version: 7.1.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `eventshala`
--

-- --------------------------------------------------------

--
-- Table structure for table `auth_group`
--

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `auth_group_permissions`
--

CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `auth_permission`
--

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add coordinator', 1, 'add_coordinator'),
(2, 'Can change coordinator', 1, 'change_coordinator'),
(3, 'Can delete coordinator', 1, 'delete_coordinator'),
(4, 'Can view coordinator', 1, 'view_coordinator'),
(5, 'Can add student', 2, 'add_student'),
(6, 'Can change student', 2, 'change_student'),
(7, 'Can delete student', 2, 'delete_student'),
(8, 'Can view student', 2, 'view_student'),
(9, 'Can add event_created_by', 3, 'add_event_created_by'),
(10, 'Can change event_created_by', 3, 'change_event_created_by'),
(11, 'Can delete event_created_by', 3, 'delete_event_created_by'),
(12, 'Can view event_created_by', 3, 'view_event_created_by'),
(13, 'Can add event_participants', 4, 'add_event_participants'),
(14, 'Can change event_participants', 4, 'change_event_participants'),
(15, 'Can delete event_participants', 4, 'delete_event_participants'),
(16, 'Can view event_participants', 4, 'view_event_participants'),
(17, 'Can add log entry', 5, 'add_logentry'),
(18, 'Can change log entry', 5, 'change_logentry'),
(19, 'Can delete log entry', 5, 'delete_logentry'),
(20, 'Can view log entry', 5, 'view_logentry'),
(21, 'Can add permission', 6, 'add_permission'),
(22, 'Can change permission', 6, 'change_permission'),
(23, 'Can delete permission', 6, 'delete_permission'),
(24, 'Can view permission', 6, 'view_permission'),
(25, 'Can add group', 7, 'add_group'),
(26, 'Can change group', 7, 'change_group'),
(27, 'Can delete group', 7, 'delete_group'),
(28, 'Can view group', 7, 'view_group'),
(29, 'Can add user', 8, 'add_user'),
(30, 'Can change user', 8, 'change_user'),
(31, 'Can delete user', 8, 'delete_user'),
(32, 'Can view user', 8, 'view_user'),
(33, 'Can add content type', 9, 'add_contenttype'),
(34, 'Can change content type', 9, 'change_contenttype'),
(35, 'Can delete content type', 9, 'delete_contenttype'),
(36, 'Can view content type', 9, 'view_contenttype'),
(37, 'Can add session', 10, 'add_session'),
(38, 'Can change session', 10, 'change_session'),
(39, 'Can delete session', 10, 'delete_session'),
(40, 'Can view session', 10, 'view_session');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user`
--

CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_groups`
--

CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_user_permissions`
--

CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `django_admin_log`
--

CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `django_content_type`
--

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(5, 'admin', 'logentry'),
(7, 'auth', 'group'),
(6, 'auth', 'permission'),
(8, 'auth', 'user'),
(9, 'contenttypes', 'contenttype'),
(1, 'main', 'coordinator'),
(3, 'main', 'event_created_by'),
(4, 'main', 'event_participants'),
(2, 'main', 'student'),
(10, 'sessions', 'session');

-- --------------------------------------------------------

--
-- Table structure for table `django_migrations`
--

CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2019-09-29 11:00:16.394368'),
(2, 'auth', '0001_initial', '2019-09-29 11:00:16.736868'),
(3, 'admin', '0001_initial', '2019-09-29 11:00:17.386972'),
(4, 'admin', '0002_logentry_remove_auto_add', '2019-09-29 11:00:17.509345'),
(5, 'admin', '0003_logentry_add_action_flag_choices', '2019-09-29 11:00:17.521915'),
(6, 'contenttypes', '0002_remove_content_type_name', '2019-09-29 11:00:17.642027'),
(7, 'auth', '0002_alter_permission_name_max_length', '2019-09-29 11:00:17.714829'),
(8, 'auth', '0003_alter_user_email_max_length', '2019-09-29 11:00:17.801848'),
(9, 'auth', '0004_alter_user_username_opts', '2019-09-29 11:00:17.819614'),
(10, 'auth', '0005_alter_user_last_login_null', '2019-09-29 11:00:17.880299'),
(11, 'auth', '0006_require_contenttypes_0002', '2019-09-29 11:00:17.886654'),
(12, 'auth', '0007_alter_validators_add_error_messages', '2019-09-29 11:00:17.902384'),
(13, 'auth', '0008_alter_user_username_max_length', '2019-09-29 11:00:17.969128'),
(14, 'auth', '0009_alter_user_last_name_max_length', '2019-09-29 11:00:18.042551'),
(15, 'auth', '0010_alter_group_name_max_length', '2019-09-29 11:00:18.122872'),
(16, 'auth', '0011_update_proxy_permissions', '2019-09-29 11:00:18.142279'),
(17, 'main', '0001_initial', '2019-09-29 11:00:18.319195'),
(18, 'main', '0002_auto_20190925_2312', '2019-09-29 11:00:18.332968'),
(19, 'main', '0003_auto_20190926_1708', '2019-09-29 11:00:18.422949'),
(20, 'main', '0004_event_participants_username', '2019-09-29 11:00:18.495176'),
(21, 'main', '0005_auto_20190929_0220', '2019-09-29 11:00:18.618502'),
(22, 'main', '0006_auto_20190929_0221', '2019-09-29 11:00:18.647341'),
(23, 'main', '0007_auto_20190929_0221', '2019-09-29 11:00:18.678259'),
(24, 'main', '0008_auto_20190929_0233', '2019-09-29 11:00:18.695397'),
(25, 'main', '0009_auto_20190929_0233', '2019-09-29 11:00:18.767293'),
(26, 'main', '0010_auto_20190929_1628', '2019-09-29 11:00:18.858875'),
(27, 'sessions', '0001_initial', '2019-09-29 11:00:18.915058');

-- --------------------------------------------------------

--
-- Table structure for table `django_session`
--

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('h5dia22ntfuyem8ckcqwe5s6txtycw12', 'MjlhY2U1NTQ2MzhiMzkyYjc2ZDIzZWZjNTQ2NWMwZjVlYWFlNTNhODp7fQ==', '2019-10-13 15:20:25.110188');

-- --------------------------------------------------------

--
-- Table structure for table `main_coordinator`
--

CREATE TABLE `main_coordinator` (
  `id` int(11) NOT NULL,
  `userName` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `main_coordinator`
--

INSERT INTO `main_coordinator` (`id`, `userName`, `email`, `password`) VALUES
(1, 'coordinator1', 'cd@gmail.com', '1234'),
(2, 'coordinator2', 'cd2@gmail.com', 'qwerty');

-- --------------------------------------------------------

--
-- Table structure for table `main_event_created_by`
--

CREATE TABLE `main_event_created_by` (
  `id` int(11) NOT NULL,
  `eventName` varchar(100) NOT NULL,
  `coordinatedBy` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `main_event_created_by`
--

INSERT INTO `main_event_created_by` (`id`, `eventName`, `coordinatedBy`) VALUES
(1, 'event1', 'coordinator1'),
(2, 'Good Host', 'coordinator2'),
(3, 'event3', 'coordinator1'),
(4, 'Good Host Carnival', 'coordinator2'),
(5, 'Good Host Carnival2', 'coordinator2'),
(7, 'XYZ', 'coordinator2'),
(9, 'ABC', 'coordinator2'),
(10, 'Good Host Carnival3', 'coordinator2'),
(11, 'accv', 'coordinator2'),
(13, 'Holi', 'coordinator1');

-- --------------------------------------------------------

--
-- Table structure for table `main_event_participants`
--

CREATE TABLE `main_event_participants` (
  `id` int(11) NOT NULL,
  `eventName` varchar(100) NOT NULL,
  `coordinatedBy` varchar(100) NOT NULL,
  `stream` varchar(100) NOT NULL,
  `studentName` varchar(100) NOT NULL,
  `userName` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `main_event_participants`
--

INSERT INTO `main_event_participants` (`id`, `eventName`, `coordinatedBy`, `stream`, `studentName`, `userName`) VALUES
(1, 'event1', 'coordinator1', 'computer Sceince', 'Ritik', 'rk1'),
(2, 'event2', 'coordinator2', 'Information Technology', 'Rana', 'rana.u.v'),
(12, 'Good Host Carnival', 'coordinator2', 'computer Sceince', 'Ritik', 'Ritik'),
(13, 'Good Host Carnival', 'coordinator2', 'computer Sceince', 'Ritik', 'Ritik'),
(14, 'Good Host Carnival', 'coordinator2', 'computer Sceince', 'Ritik', 'rk1'),
(15, 'XYZ', 'coordinator2', 'computer Sceince', 'Ritik', 'rk1');

-- --------------------------------------------------------

--
-- Table structure for table `main_student`
--

CREATE TABLE `main_student` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `userName` varchar(100) NOT NULL,
  `stream` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `main_student`
--

INSERT INTO `main_student` (`id`, `name`, `userName`, `stream`, `password`) VALUES
(1, 'Ritik', 'rk1', 'computer Science', 'ritikkapoor'),
(2, 'Rana', 'rana.u.v', 'Information Technology', 'rana');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `auth_group`
--
ALTER TABLE `auth_group`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  ADD KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`);

--
-- Indexes for table `auth_user`
--
ALTER TABLE `auth_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  ADD KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`);

--
-- Indexes for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  ADD KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  ADD KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`);

--
-- Indexes for table `django_content_type`
--
ALTER TABLE `django_content_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`);

--
-- Indexes for table `django_migrations`
--
ALTER TABLE `django_migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `django_session`
--
ALTER TABLE `django_session`
  ADD PRIMARY KEY (`session_key`),
  ADD KEY `django_session_expire_date_a5c62663` (`expire_date`);

--
-- Indexes for table `main_coordinator`
--
ALTER TABLE `main_coordinator`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `main_coordinator_email_42b44b6f_uniq` (`email`),
  ADD UNIQUE KEY `main_coordinator_userName_e4244b17_uniq` (`userName`);

--
-- Indexes for table `main_event_created_by`
--
ALTER TABLE `main_event_created_by`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `main_event_created_by_eventName_d6a7d4f4_uniq` (`eventName`);

--
-- Indexes for table `main_event_participants`
--
ALTER TABLE `main_event_participants`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `main_student`
--
ALTER TABLE `main_student`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `main_student_userName_20e0c0f8_uniq` (`userName`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `auth_group`
--
ALTER TABLE `auth_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `auth_permission`
--
ALTER TABLE `auth_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;
--
-- AUTO_INCREMENT for table `auth_user`
--
ALTER TABLE `auth_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT for table `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;
--
-- AUTO_INCREMENT for table `main_coordinator`
--
ALTER TABLE `main_coordinator`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `main_event_created_by`
--
ALTER TABLE `main_event_created_by`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
--
-- AUTO_INCREMENT for table `main_event_participants`
--
ALTER TABLE `main_event_participants`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;
--
-- AUTO_INCREMENT for table `main_student`
--
ALTER TABLE `main_student`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Constraints for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Constraints for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
