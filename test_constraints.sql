/*
Navicat MySQL Data Transfer

Source Server         : text
Source Server Version : 80032
Source Host           : localhost:3306
Source Database       : test_constraints

Target Server Type    : MYSQL
Target Server Version : 80032
File Encoding         : 65001

Date: 2023-05-08 14:47:23
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `department`
-- ----------------------------
DROP TABLE IF EXISTS `department`;
CREATE TABLE `department` (
  `dpt_name` char(20) NOT NULL,
  `people_num` int DEFAULT '10',
  PRIMARY KEY (`dpt_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of department
-- ----------------------------
INSERT INTO `department` VALUES ('dpt1', '11');
INSERT INTO `department` VALUES ('dpt2', '10');
INSERT INTO `department` VALUES ('dpt3', '20');
INSERT INTO `department` VALUES ('dpt4', '10');

-- ----------------------------
-- Table structure for `employee`
-- ----------------------------
DROP TABLE IF EXISTS `employee`;
CREATE TABLE `employee` (
  `id` int NOT NULL,
  `name` char(20) DEFAULT NULL,
  `age` int NOT NULL,
  `salary` int NOT NULL,
  `phone` int NOT NULL,
  `in_dpt` char(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `phone` (`phone`),
  KEY `emp_fk` (`in_dpt`),
  CONSTRAINT `emp_fk` FOREIGN KEY (`in_dpt`) REFERENCES `department` (`dpt_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of employee
-- ----------------------------
INSERT INTO `employee` VALUES ('1', 'jiadeyang', '18', '30100', '178', 'dpt1');
INSERT INTO `employee` VALUES ('2', 'sunzhimin', '18', '10100', '179', 'dpt2');
INSERT INTO `employee` VALUES ('3', 'shangce', '18', '20100', '156', 'dpt3');
INSERT INTO `employee` VALUES ('4', 'linqing', '19', '40100', '155', 'dpt4');

-- ----------------------------
-- Table structure for `project`
-- ----------------------------
DROP TABLE IF EXISTS `project`;
CREATE TABLE `project` (
  `proj_num` int NOT NULL,
  `proj_name` char(20) NOT NULL,
  `start_data` date NOT NULL,
  `end_data` date DEFAULT NULL,
  `of_dpt` char(20) DEFAULT NULL,
  PRIMARY KEY (`proj_num`,`proj_name`),
  KEY `pj-fk` (`of_dpt`),
  CONSTRAINT `pj-fk` FOREIGN KEY (`of_dpt`) REFERENCES `department` (`dpt_name`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `check_date` CHECK ((`start_data` < `end_data`))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of project
-- ----------------------------
INSERT INTO `project` VALUES ('111', 'studenr1', '2023-04-11', '2023-05-24', 'dpt3');
INSERT INTO `project` VALUES ('2222', 'str', '2023-04-20', '2023-04-27', 'dpt2');
INSERT INTO `project` VALUES ('2222', 'student', '2023-03-08', '2023-03-30', 'dpt1');
