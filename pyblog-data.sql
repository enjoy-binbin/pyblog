/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50636
Source Host           : 127.0.0.1:3306
Source Database       : pyblog

Target Server Type    : MYSQL
Target Server Version : 50636
File Encoding         : 65001

Date: 2018-10-09 17:45:17
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for articles_article
-- ----------------------------
DROP TABLE IF EXISTS `articles_article`;
CREATE TABLE `articles_article` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL,
  `desc` longtext NOT NULL,
  `content` longtext NOT NULL,
  `author` varchar(20) NOT NULL,
  `image` varchar(100) NOT NULL,
  `add_time` datetime(6) NOT NULL,
  `view_nums` int(10) unsigned NOT NULL,
  `category_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `articles_article_category_id_633dad2b_fk_categorys_category_id` (`category_id`),
  CONSTRAINT `articles_article_category_id_633dad2b_fk_categorys_category_id` FOREIGN KEY (`category_id`) REFERENCES `categorys_category` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of articles_article
-- ----------------------------
INSERT INTO `articles_article` VALUES ('17', '源码编译nginx并增加模块', '源码编译nginx并增加模块', '<h3 id=\"1配置yum源\">1、在Centos7下安装nginx<br/> </h3><pre class=\"brush:bash;toolbar:false\">#&nbsp;第一步当然是&nbsp;下载源码包，如果没有wget可以&nbsp;直接&nbsp;yum&nbsp;install&nbsp;wget\r\n&nbsp;&nbsp;&nbsp;&nbsp;wget&nbsp;http://nginx.org/download/nginx-1.12.2.tar.gz\r\n&nbsp;&nbsp;&nbsp;\r\n#&nbsp;考虑到网速问题，如果下载过慢也可以在win上下载后移动到linux上\r\n#&nbsp;个人使用的终端工具为:&nbsp;SecureCRT\r\n#&nbsp;可以在&nbsp;SecureCRT已连接的终端&nbsp;面板上右键&nbsp;连接SFTP标签页\r\n#&nbsp;SFTP命令的话可以自行百度了\r\n&nbsp;&nbsp;&nbsp;&nbsp;pwd,&nbsp;lpwd,&nbsp;ls,&nbsp;lls,&nbsp;cd,&nbsp;lcd,&nbsp;put,&nbsp;get\r\n&nbsp;&nbsp;&nbsp;&nbsp;lcd&nbsp;f:/\r\n&nbsp;&nbsp;&nbsp;&nbsp;put&nbsp;xxx.tar.gz</pre><p><img src=\"/media/article/ueditor/图片_20180914215921_280.png\" title=\"\" alt=\"图片.png\" style=\"width: 733px; height: 309px;\" width=\"733\" height=\"309\"/> </p><h3 id=\"1配置yum源\"><br/></h3><h3 id=\"1配置yum源\">2、源码编译nginx<br/> </h3><pre class=\"brush:bash;toolbar:false\">#&nbsp;依赖问题&nbsp;emmm&nbsp;安装时看哪个报错就安装哪个吧\r\n&nbsp;&nbsp;&nbsp;&nbsp;yum&nbsp;-y&nbsp;install&nbsp;gcc&nbsp;gcc-c++&nbsp;openssl-devel&nbsp;pcre-devel&nbsp;httpd-tools\r\n&nbsp;&nbsp;&nbsp;\r\n#&nbsp;解压，安装，因为是自己实验，with模块就没怎么装了，后面还会演示如何添加模块编译\r\n&nbsp;&nbsp;&nbsp;&nbsp;tar&nbsp;-zxf&nbsp;nginx-1.12.2.tar.gz\r\n&nbsp;&nbsp;&nbsp;&nbsp;cd&nbsp;nginx-1.12.2\r\n&nbsp;&nbsp;&nbsp;&nbsp;useradd&nbsp;nginx\r\n&nbsp;&nbsp;&nbsp;&nbsp;./configure&nbsp;--prefix=/usr/local/nginx&nbsp;--user=nginx&nbsp;--group=nginx&nbsp;--with-http_ssl_module&nbsp;\r\n&nbsp;&nbsp;&nbsp;&nbsp;make&nbsp;&amp;&amp;&nbsp;make&nbsp;install\r\n&nbsp;&nbsp;&nbsp;\r\n#&nbsp;创建软连接\r\n&nbsp;&nbsp;&nbsp;&nbsp;ln&nbsp;-s&nbsp;/usr/local/nginx/sbin/nginx&nbsp;/usr/sbin/nginx</pre><p><br/> </p><h3 id=\"1配置yum源\">3、已编译好的nginx增加模块</h3><pre class=\"brush:bash;toolbar:false\">#&nbsp;查看nginx在编译时安装了哪些模块\r\n&nbsp;&nbsp;&nbsp;&nbsp;nginx&nbsp;-V</pre><p><img src=\"/media/article/ueditor/图片_20180914221051_602.png\" title=\"\" alt=\"图片.png\"/> </p><p><br/> </p><pre class=\"brush:bash;toolbar:false\">#&nbsp;添加新模块时需要重新在&nbsp;nginx-1.12.2里&nbsp;configure，要记得加上之前的配置和模块\r\n&nbsp;&nbsp;&nbsp;&nbsp;cd&nbsp;nginx-1.12.2\r\n&nbsp;&nbsp;&nbsp;&nbsp;./configure&nbsp;--prefix=/usr/local/nginx&nbsp;--user=nginx&nbsp;--group=nginx&nbsp;--with-http_ssl_module&nbsp;--with-http_mp4_module\r\n&nbsp;&nbsp;&nbsp;&nbsp;make\r\n&nbsp;&nbsp;&nbsp;&nbsp;\r\n#&nbsp;这里切记只&nbsp;make&nbsp;而不进行&nbsp;make&nbsp;install，不然就真的覆盖了\r\n#&nbsp;cd&nbsp;进&nbsp;nginx-1.12.2/objs里，对新编译的好的&nbsp;nginx二进制文件进行复制\r\n&nbsp;&nbsp;&nbsp;&nbsp;cd&nbsp;objs\r\n&nbsp;&nbsp;&nbsp;&nbsp;cp&nbsp;nginx&nbsp;/usr/sbin/nginx</pre><p><img src=\"/media/article/ueditor/图片_20180914221718_749.png\" title=\"\" alt=\"图片.png\"/> </p><p><br/> </p><h3 id=\"1配置yum源\">4、之后启动nginx，使用nginx -V 查看，第三方模块可以自己百度，或者日后补充。</h3><div><h3 id=\"1配置yum源\"><img src=\"http://127.0.0.1:8000/media/article/ueditor/图片_20180914222148_567.png\" title=\"\" alt=\"图片.png\"/></h3></div>', '渣神', 'article/2018/09/nginx.jpg', '2018-09-14 21:47:00.000000', '3', '1');

-- ----------------------------
-- Table structure for articles_tag
-- ----------------------------
DROP TABLE IF EXISTS `articles_tag`;
CREATE TABLE `articles_tag` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `article_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `articles_tag_article_id_359d2a80_fk_articles_article_id` (`article_id`),
  CONSTRAINT `articles_tag_article_id_359d2a80_fk_articles_article_id` FOREIGN KEY (`article_id`) REFERENCES `articles_article` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of articles_tag
-- ----------------------------

-- ----------------------------
-- Table structure for auth_group
-- ----------------------------
DROP TABLE IF EXISTS `auth_group`;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_group
-- ----------------------------

-- ----------------------------
-- Table structure for auth_group_permissions
-- ----------------------------
DROP TABLE IF EXISTS `auth_group_permissions`;
CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissi_permission_id_84c5c92e_fk_auth_permission_id` (`permission_id`),
  CONSTRAINT `auth_group_permissi_permission_id_84c5c92e_fk_auth_permission_id` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_group_permissions
-- ----------------------------

-- ----------------------------
-- Table structure for auth_permission
-- ----------------------------
DROP TABLE IF EXISTS `auth_permission`;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permissi_content_type_id_2f476e4b_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=64 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_permission
-- ----------------------------
INSERT INTO `auth_permission` VALUES ('1', 'Can add log entry', '1', 'add_logentry');
INSERT INTO `auth_permission` VALUES ('2', 'Can change log entry', '1', 'change_logentry');
INSERT INTO `auth_permission` VALUES ('3', 'Can delete log entry', '1', 'delete_logentry');
INSERT INTO `auth_permission` VALUES ('4', 'Can add permission', '2', 'add_permission');
INSERT INTO `auth_permission` VALUES ('5', 'Can change permission', '2', 'change_permission');
INSERT INTO `auth_permission` VALUES ('6', 'Can delete permission', '2', 'delete_permission');
INSERT INTO `auth_permission` VALUES ('7', 'Can add group', '3', 'add_group');
INSERT INTO `auth_permission` VALUES ('8', 'Can change group', '3', 'change_group');
INSERT INTO `auth_permission` VALUES ('9', 'Can delete group', '3', 'delete_group');
INSERT INTO `auth_permission` VALUES ('13', 'Can add content type', '5', 'add_contenttype');
INSERT INTO `auth_permission` VALUES ('14', 'Can change content type', '5', 'change_contenttype');
INSERT INTO `auth_permission` VALUES ('15', 'Can delete content type', '5', 'delete_contenttype');
INSERT INTO `auth_permission` VALUES ('16', 'Can add session', '6', 'add_session');
INSERT INTO `auth_permission` VALUES ('17', 'Can change session', '6', 'change_session');
INSERT INTO `auth_permission` VALUES ('18', 'Can delete session', '6', 'delete_session');
INSERT INTO `auth_permission` VALUES ('19', 'Can add 用户', '7', 'add_userprofile');
INSERT INTO `auth_permission` VALUES ('20', 'Can change 用户', '7', 'change_userprofile');
INSERT INTO `auth_permission` VALUES ('21', 'Can delete 用户', '7', 'delete_userprofile');
INSERT INTO `auth_permission` VALUES ('22', 'Can add 文章分类', '8', 'add_category');
INSERT INTO `auth_permission` VALUES ('23', 'Can change 文章分类', '8', 'change_category');
INSERT INTO `auth_permission` VALUES ('24', 'Can delete 文章分类', '8', 'delete_category');
INSERT INTO `auth_permission` VALUES ('25', 'Can add 分类关键字', '9', 'add_keyword');
INSERT INTO `auth_permission` VALUES ('26', 'Can change 分类关键字', '9', 'change_keyword');
INSERT INTO `auth_permission` VALUES ('27', 'Can delete 分类关键字', '9', 'delete_keyword');
INSERT INTO `auth_permission` VALUES ('28', 'Can add 文章', '10', 'add_article');
INSERT INTO `auth_permission` VALUES ('29', 'Can change 文章', '10', 'change_article');
INSERT INTO `auth_permission` VALUES ('30', 'Can delete 文章', '10', 'delete_article');
INSERT INTO `auth_permission` VALUES ('31', 'Can add 文章标签', '11', 'add_tag');
INSERT INTO `auth_permission` VALUES ('32', 'Can change 文章标签', '11', 'change_tag');
INSERT INTO `auth_permission` VALUES ('33', 'Can delete 文章标签', '11', 'delete_tag');
INSERT INTO `auth_permission` VALUES ('34', 'Can view log entry', '1', 'view_logentry');
INSERT INTO `auth_permission` VALUES ('35', 'Can view 文章', '10', 'view_article');
INSERT INTO `auth_permission` VALUES ('36', 'Can view 文章标签', '11', 'view_tag');
INSERT INTO `auth_permission` VALUES ('37', 'Can view group', '3', 'view_group');
INSERT INTO `auth_permission` VALUES ('38', 'Can view permission', '2', 'view_permission');
INSERT INTO `auth_permission` VALUES ('39', 'Can view 文章分类', '8', 'view_category');
INSERT INTO `auth_permission` VALUES ('40', 'Can view 分类关键字', '9', 'view_keyword');
INSERT INTO `auth_permission` VALUES ('41', 'Can view content type', '5', 'view_contenttype');
INSERT INTO `auth_permission` VALUES ('42', 'Can view session', '6', 'view_session');
INSERT INTO `auth_permission` VALUES ('43', 'Can view 用户', '7', 'view_userprofile');
INSERT INTO `auth_permission` VALUES ('44', 'Can add Bookmark', '12', 'add_bookmark');
INSERT INTO `auth_permission` VALUES ('45', 'Can change Bookmark', '12', 'change_bookmark');
INSERT INTO `auth_permission` VALUES ('46', 'Can delete Bookmark', '12', 'delete_bookmark');
INSERT INTO `auth_permission` VALUES ('47', 'Can add User Setting', '13', 'add_usersettings');
INSERT INTO `auth_permission` VALUES ('48', 'Can change User Setting', '13', 'change_usersettings');
INSERT INTO `auth_permission` VALUES ('49', 'Can delete User Setting', '13', 'delete_usersettings');
INSERT INTO `auth_permission` VALUES ('50', 'Can add User Widget', '14', 'add_userwidget');
INSERT INTO `auth_permission` VALUES ('51', 'Can change User Widget', '14', 'change_userwidget');
INSERT INTO `auth_permission` VALUES ('52', 'Can delete User Widget', '14', 'delete_userwidget');
INSERT INTO `auth_permission` VALUES ('53', 'Can add log entry', '15', 'add_log');
INSERT INTO `auth_permission` VALUES ('54', 'Can change log entry', '15', 'change_log');
INSERT INTO `auth_permission` VALUES ('55', 'Can delete log entry', '15', 'delete_log');
INSERT INTO `auth_permission` VALUES ('56', 'Can view Bookmark', '12', 'view_bookmark');
INSERT INTO `auth_permission` VALUES ('57', 'Can view log entry', '15', 'view_log');
INSERT INTO `auth_permission` VALUES ('58', 'Can view User Setting', '13', 'view_usersettings');
INSERT INTO `auth_permission` VALUES ('59', 'Can view User Widget', '14', 'view_userwidget');
INSERT INTO `auth_permission` VALUES ('60', 'Can add 留言板', '16', 'add_guestbook');
INSERT INTO `auth_permission` VALUES ('61', 'Can change 留言板', '16', 'change_guestbook');
INSERT INTO `auth_permission` VALUES ('62', 'Can delete 留言板', '16', 'delete_guestbook');
INSERT INTO `auth_permission` VALUES ('63', 'Can view 留言板', '16', 'view_guestbook');

-- ----------------------------
-- Table structure for auth_user
-- ----------------------------
DROP TABLE IF EXISTS `auth_user`;
CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(30) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_user
-- ----------------------------

-- ----------------------------
-- Table structure for auth_user_groups
-- ----------------------------
DROP TABLE IF EXISTS `auth_user_groups`;
CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_user_groups
-- ----------------------------

-- ----------------------------
-- Table structure for auth_user_user_permissions
-- ----------------------------
DROP TABLE IF EXISTS `auth_user_user_permissions`;
CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_perm_permission_id_1fbb5f2c_fk_auth_permission_id` (`permission_id`),
  CONSTRAINT `auth_user_user_perm_permission_id_1fbb5f2c_fk_auth_permission_id` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_user_user_permissions
-- ----------------------------

-- ----------------------------
-- Table structure for categorys_category
-- ----------------------------
DROP TABLE IF EXISTS `categorys_category`;
CREATE TABLE `categorys_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `title` varchar(50) NOT NULL,
  `desc` longtext,
  `add_time` datetime(6) NOT NULL,
  `article_nums` int(11) NOT NULL,
  `image` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of categorys_category
-- ----------------------------
INSERT INTO `categorys_category` VALUES ('1', '学无止境', 'learn', '越努力越幸运呀，记录学习过程', '2018-05-08 20:57:00.000000', '10', './1_3.jpg');
INSERT INTO `categorys_category` VALUES ('4', 'python学习', 'python', 'python的学习', '2018-05-05 10:25:00.000000', '1', './1_7_knRXAjO.jpg');
INSERT INTO `categorys_category` VALUES ('6', '实例记录', 'demo', 'Hi,大家好,这里是实例分享模块,分享一些自己写的实例代码!\r\n学习的过程中，需要一个人孤独的走， 过程中，遇到的美景，需要自己记录，这算一种对 自己的鼓励， 记录一切，哪怕是微小的东西， 成长的道路上需要一个人耐得住寂寞, 也需 要自己时不时的回头, 看着自己走过的路,踩过的脚印,要知道, 越努力, 真的就会越幸运!', '2018-05-06 23:25:00.000000', '3', './1_9.jpg');
INSERT INTO `categorys_category` VALUES ('8', '随笔心情', 'mood', '日常心情变化加随笔', '2018-05-08 21:00:00.000000', '3', './1_7.jpg');

-- ----------------------------
-- Table structure for categorys_guestbook
-- ----------------------------
DROP TABLE IF EXISTS `categorys_guestbook`;
CREATE TABLE `categorys_guestbook` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(10) NOT NULL,
  `content` varchar(100) NOT NULL,
  `website` varchar(50) DEFAULT NULL,
  `add_time` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of categorys_guestbook
-- ----------------------------
INSERT INTO `categorys_guestbook` VALUES ('24', '11', '111', '', '2018-05-27 14:29:13.888067');

-- ----------------------------
-- Table structure for categorys_keyword
-- ----------------------------
DROP TABLE IF EXISTS `categorys_keyword`;
CREATE TABLE `categorys_keyword` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `category_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `categorys_keyword_category_id_c4bd4ac0_fk_categorys_category_id` (`category_id`),
  CONSTRAINT `categorys_keyword_category_id_c4bd4ac0_fk_categorys_category_id` FOREIGN KEY (`category_id`) REFERENCES `categorys_category` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of categorys_keyword
-- ----------------------------
INSERT INTO `categorys_keyword` VALUES ('1', 'django', '4');
INSERT INTO `categorys_keyword` VALUES ('2', 'scrapy', '4');

-- ----------------------------
-- Table structure for django_admin_log
-- ----------------------------
DROP TABLE IF EXISTS `django_admin_log`;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin__content_type_id_c4bce8eb_fk_django_content_type_id` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin__content_type_id_c4bce8eb_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of django_admin_log
-- ----------------------------

-- ----------------------------
-- Table structure for django_content_type
-- ----------------------------
DROP TABLE IF EXISTS `django_content_type`;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of django_content_type
-- ----------------------------
INSERT INTO `django_content_type` VALUES ('1', 'admin', 'logentry');
INSERT INTO `django_content_type` VALUES ('10', 'articles', 'article');
INSERT INTO `django_content_type` VALUES ('11', 'articles', 'tag');
INSERT INTO `django_content_type` VALUES ('3', 'auth', 'group');
INSERT INTO `django_content_type` VALUES ('2', 'auth', 'permission');
INSERT INTO `django_content_type` VALUES ('8', 'categorys', 'category');
INSERT INTO `django_content_type` VALUES ('16', 'categorys', 'guestbook');
INSERT INTO `django_content_type` VALUES ('9', 'categorys', 'keyword');
INSERT INTO `django_content_type` VALUES ('5', 'contenttypes', 'contenttype');
INSERT INTO `django_content_type` VALUES ('6', 'sessions', 'session');
INSERT INTO `django_content_type` VALUES ('7', 'users', 'userprofile');
INSERT INTO `django_content_type` VALUES ('12', 'xadmin', 'bookmark');
INSERT INTO `django_content_type` VALUES ('15', 'xadmin', 'log');
INSERT INTO `django_content_type` VALUES ('13', 'xadmin', 'usersettings');
INSERT INTO `django_content_type` VALUES ('14', 'xadmin', 'userwidget');

-- ----------------------------
-- Table structure for django_migrations
-- ----------------------------
DROP TABLE IF EXISTS `django_migrations`;
CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of django_migrations
-- ----------------------------
INSERT INTO `django_migrations` VALUES ('1', 'contenttypes', '0001_initial', '2018-04-29 06:26:35.989680');
INSERT INTO `django_migrations` VALUES ('2', 'auth', '0001_initial', '2018-04-29 06:26:45.006528');
INSERT INTO `django_migrations` VALUES ('3', 'admin', '0001_initial', '2018-04-29 06:26:46.974154');
INSERT INTO `django_migrations` VALUES ('4', 'admin', '0002_logentry_remove_auto_add', '2018-04-29 06:26:47.122272');
INSERT INTO `django_migrations` VALUES ('5', 'contenttypes', '0002_remove_content_type_name', '2018-04-29 06:26:48.148674');
INSERT INTO `django_migrations` VALUES ('6', 'auth', '0002_alter_permission_name_max_length', '2018-04-29 06:26:48.923196');
INSERT INTO `django_migrations` VALUES ('7', 'auth', '0003_alter_user_email_max_length', '2018-04-29 06:26:49.690157');
INSERT INTO `django_migrations` VALUES ('8', 'auth', '0004_alter_user_username_opts', '2018-04-29 06:26:49.793506');
INSERT INTO `django_migrations` VALUES ('9', 'auth', '0005_alter_user_last_login_null', '2018-04-29 06:26:50.373849');
INSERT INTO `django_migrations` VALUES ('10', 'auth', '0006_require_contenttypes_0002', '2018-04-29 06:26:50.414390');
INSERT INTO `django_migrations` VALUES ('11', 'auth', '0007_alter_validators_add_error_messages', '2018-04-29 06:26:50.453447');
INSERT INTO `django_migrations` VALUES ('12', 'sessions', '0001_initial', '2018-04-29 06:26:51.098520');
INSERT INTO `django_migrations` VALUES ('13', 'users', '0001_initial', '2018-04-29 06:58:54.186151');
INSERT INTO `django_migrations` VALUES ('14', 'categorys', '0001_initial', '2018-04-30 06:36:10.546037');
INSERT INTO `django_migrations` VALUES ('15', 'articles', '0001_initial', '2018-04-30 06:36:12.871458');
INSERT INTO `django_migrations` VALUES ('16', 'xadmin', '0001_initial', '2018-05-03 12:50:29.504812');
INSERT INTO `django_migrations` VALUES ('17', 'xadmin', '0002_log', '2018-05-03 12:50:32.455881');
INSERT INTO `django_migrations` VALUES ('18', 'xadmin', '0003_auto_20160715_0100', '2018-05-03 12:50:33.753392');
INSERT INTO `django_migrations` VALUES ('19', 'categorys', '0002_auto_20180507_1612', '2018-05-07 16:14:06.719081');
INSERT INTO `django_migrations` VALUES ('20', 'categorys', '0003_auto_20180507_1613', '2018-05-07 16:14:07.278561');
INSERT INTO `django_migrations` VALUES ('21', 'categorys', '0004_category_article_nums', '2018-05-07 22:48:24.604230');
INSERT INTO `django_migrations` VALUES ('22', 'articles', '0002_auto_20180508_2359', '2018-05-08 23:59:47.293003');
INSERT INTO `django_migrations` VALUES ('23', 'categorys', '0005_category_image', '2018-05-08 23:59:48.071555');
INSERT INTO `django_migrations` VALUES ('24', 'categorys', '0006_auto_20180509_0000', '2018-05-09 00:00:37.027276');
INSERT INTO `django_migrations` VALUES ('25', 'categorys', '0007_guestbook', '2018-05-10 00:28:58.234327');
INSERT INTO `django_migrations` VALUES ('26', 'categorys', '0008_guestbook_add_time', '2018-05-10 00:40:07.551492');
INSERT INTO `django_migrations` VALUES ('27', 'articles', '0003_auto_20180525_1903', '2018-05-26 14:33:46.000000');
INSERT INTO `django_migrations` VALUES ('28', 'categorys', '0009_auto_20180526_1433', '2018-05-26 14:33:46.000000');
INSERT INTO `django_migrations` VALUES ('29', 'categorys', '0010_auto_20180526_1435', '2018-05-26 14:35:34.000000');
INSERT INTO `django_migrations` VALUES ('30', 'categorys', '0011_auto_20180526_1436', '2018-05-26 14:36:45.000000');
INSERT INTO `django_migrations` VALUES ('31', 'categorys', '0012_auto_20180526_1438', '2018-05-26 14:38:46.000000');

-- ----------------------------
-- Table structure for django_session
-- ----------------------------
DROP TABLE IF EXISTS `django_session`;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_de54fa62` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of django_session
-- ----------------------------
INSERT INTO `django_session` VALUES ('aefzftge2turpkgf586ylobacwbjq75q', 'NDVmMDUyZGQyZTc3MDlhZjJjMzBhOGI5Yjg1ZjViMTk4MzEwN2E1MDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJhYTJhMDYwODYwMmIxN2JmOTY1Y2I4Yjc1MTZkYjA1YWQxMjE1MDgzIiwibmF2X21lbnUiOiJbe1widGl0bGVcIjogXCJcdTY1ODdcdTdhZTBcdTUyMDZcdTdjN2JcIiwgXCJtZW51c1wiOiBbe1widGl0bGVcIjogXCJcdTY1ODdcdTdhZTBcdTUyMDZcdTdjN2JcIiwgXCJ1cmxcIjogXCIveGFkbWluL2NhdGVnb3J5cy9jYXRlZ29yeS9cIiwgXCJpY29uXCI6IG51bGwsIFwib3JkZXJcIjogNX0sIHtcInRpdGxlXCI6IFwiXHU1MjA2XHU3YzdiXHU1MTczXHU5NTJlXHU1YjU3XCIsIFwidXJsXCI6IFwiL3hhZG1pbi9jYXRlZ29yeXMva2V5d29yZC9cIiwgXCJpY29uXCI6IG51bGwsIFwib3JkZXJcIjogNn0sIHtcInRpdGxlXCI6IFwiXHU3NTU5XHU4YTAwXHU2NzdmXCIsIFwidXJsXCI6IFwiL3hhZG1pbi9jYXRlZ29yeXMvZ3Vlc3Rib29rL1wiLCBcImljb25cIjogbnVsbCwgXCJvcmRlclwiOiA3fV0sIFwiZmlyc3RfdXJsXCI6IFwiL3hhZG1pbi9jYXRlZ29yeXMvY2F0ZWdvcnkvXCJ9LCB7XCJ0aXRsZVwiOiBcIlx1NjU4N1x1N2FlMFx1N2JhMVx1NzQwNlwiLCBcIm1lbnVzXCI6IFt7XCJ0aXRsZVwiOiBcIlx1NjU4N1x1N2FlMFwiLCBcInVybFwiOiBcIi94YWRtaW4vYXJ0aWNsZXMvYXJ0aWNsZS9cIiwgXCJpY29uXCI6IG51bGwsIFwib3JkZXJcIjogOH0sIHtcInRpdGxlXCI6IFwiXHU2NTg3XHU3YWUwXHU2ODA3XHU3YjdlXCIsIFwidXJsXCI6IFwiL3hhZG1pbi9hcnRpY2xlcy90YWcvXCIsIFwiaWNvblwiOiBudWxsLCBcIm9yZGVyXCI6IDl9XSwgXCJmaXJzdF91cmxcIjogXCIveGFkbWluL2FydGljbGVzL2FydGljbGUvXCJ9LCB7XCJ0aXRsZVwiOiBcIlx1NzUyOFx1NjIzN1x1NjRjZFx1NGY1Y1wiLCBcIm1lbnVzXCI6IFt7XCJ0aXRsZVwiOiBcIlx1NzUyOFx1NjIzN1wiLCBcInVybFwiOiBcIi94YWRtaW4vdXNlcnMvdXNlcnByb2ZpbGUvXCIsIFwiaWNvblwiOiBcImZhIGZhLXVzZXJcIiwgXCJvcmRlclwiOiAzfV0sIFwiZmlyc3RfaWNvblwiOiBcImZhIGZhLXVzZXJcIiwgXCJmaXJzdF91cmxcIjogXCIveGFkbWluL3VzZXJzL3VzZXJwcm9maWxlL1wifSwge1widGl0bGVcIjogXCJcdTdiYTFcdTc0MDZcIiwgXCJtZW51c1wiOiBbe1widGl0bGVcIjogXCJcdTY1ZTVcdTVmZDdcdThiYjBcdTVmNTVcIiwgXCJ1cmxcIjogXCIveGFkbWluL3hhZG1pbi9sb2cvXCIsIFwiaWNvblwiOiBcImZhIGZhLWNvZ1wiLCBcIm9yZGVyXCI6IDExfV0sIFwiZmlyc3RfaWNvblwiOiBcImZhIGZhLWNvZ1wiLCBcImZpcnN0X3VybFwiOiBcIi94YWRtaW4veGFkbWluL2xvZy9cIn0sIHtcInRpdGxlXCI6IFwiXHU4YmE0XHU4YmMxXHU1NDhjXHU2Mzg4XHU2NzQzXCIsIFwibWVudXNcIjogW3tcInRpdGxlXCI6IFwiXHU3ZWM0XCIsIFwidXJsXCI6IFwiL3hhZG1pbi9hdXRoL2dyb3VwL1wiLCBcImljb25cIjogXCJmYSBmYS1ncm91cFwiLCBcIm9yZGVyXCI6IDJ9LCB7XCJ0aXRsZVwiOiBcIlx1Njc0M1x1OTY1MFwiLCBcInVybFwiOiBcIi94YWRtaW4vYXV0aC9wZXJtaXNzaW9uL1wiLCBcImljb25cIjogXCJmYSBmYS1sb2NrXCIsIFwib3JkZXJcIjogNH1dLCBcImZpcnN0X2ljb25cIjogXCJmYSBmYS1ncm91cFwiLCBcImZpcnN0X3VybFwiOiBcIi94YWRtaW4vYXV0aC9ncm91cC9cIn1dIiwiTElTVF9RVUVSWSI6W1siYXJ0aWNsZXMiLCJhcnRpY2xlIl0sIiJdfQ==', '2018-06-13 20:31:24.000813');
INSERT INTO `django_session` VALUES ('mqjgdgzyy19dtlo987dn4xxhujs0egjm', 'NDVmMDUyZGQyZTc3MDlhZjJjMzBhOGI5Yjg1ZjViMTk4MzEwN2E1MDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJhYTJhMDYwODYwMmIxN2JmOTY1Y2I4Yjc1MTZkYjA1YWQxMjE1MDgzIiwibmF2X21lbnUiOiJbe1widGl0bGVcIjogXCJcdTY1ODdcdTdhZTBcdTUyMDZcdTdjN2JcIiwgXCJtZW51c1wiOiBbe1widGl0bGVcIjogXCJcdTY1ODdcdTdhZTBcdTUyMDZcdTdjN2JcIiwgXCJ1cmxcIjogXCIveGFkbWluL2NhdGVnb3J5cy9jYXRlZ29yeS9cIiwgXCJpY29uXCI6IG51bGwsIFwib3JkZXJcIjogNX0sIHtcInRpdGxlXCI6IFwiXHU1MjA2XHU3YzdiXHU1MTczXHU5NTJlXHU1YjU3XCIsIFwidXJsXCI6IFwiL3hhZG1pbi9jYXRlZ29yeXMva2V5d29yZC9cIiwgXCJpY29uXCI6IG51bGwsIFwib3JkZXJcIjogNn0sIHtcInRpdGxlXCI6IFwiXHU3NTU5XHU4YTAwXHU2NzdmXCIsIFwidXJsXCI6IFwiL3hhZG1pbi9jYXRlZ29yeXMvZ3Vlc3Rib29rL1wiLCBcImljb25cIjogbnVsbCwgXCJvcmRlclwiOiA3fV0sIFwiZmlyc3RfdXJsXCI6IFwiL3hhZG1pbi9jYXRlZ29yeXMvY2F0ZWdvcnkvXCJ9LCB7XCJ0aXRsZVwiOiBcIlx1NjU4N1x1N2FlMFx1N2JhMVx1NzQwNlwiLCBcIm1lbnVzXCI6IFt7XCJ0aXRsZVwiOiBcIlx1NjU4N1x1N2FlMFwiLCBcInVybFwiOiBcIi94YWRtaW4vYXJ0aWNsZXMvYXJ0aWNsZS9cIiwgXCJpY29uXCI6IG51bGwsIFwib3JkZXJcIjogOH0sIHtcInRpdGxlXCI6IFwiXHU2NTg3XHU3YWUwXHU2ODA3XHU3YjdlXCIsIFwidXJsXCI6IFwiL3hhZG1pbi9hcnRpY2xlcy90YWcvXCIsIFwiaWNvblwiOiBudWxsLCBcIm9yZGVyXCI6IDl9XSwgXCJmaXJzdF91cmxcIjogXCIveGFkbWluL2FydGljbGVzL2FydGljbGUvXCJ9LCB7XCJ0aXRsZVwiOiBcIlx1NzUyOFx1NjIzN1x1NjRjZFx1NGY1Y1wiLCBcIm1lbnVzXCI6IFt7XCJ0aXRsZVwiOiBcIlx1NzUyOFx1NjIzN1wiLCBcInVybFwiOiBcIi94YWRtaW4vdXNlcnMvdXNlcnByb2ZpbGUvXCIsIFwiaWNvblwiOiBcImZhIGZhLXVzZXJcIiwgXCJvcmRlclwiOiAzfV0sIFwiZmlyc3RfaWNvblwiOiBcImZhIGZhLXVzZXJcIiwgXCJmaXJzdF91cmxcIjogXCIveGFkbWluL3VzZXJzL3VzZXJwcm9maWxlL1wifSwge1widGl0bGVcIjogXCJcdTdiYTFcdTc0MDZcIiwgXCJtZW51c1wiOiBbe1widGl0bGVcIjogXCJcdTY1ZTVcdTVmZDdcdThiYjBcdTVmNTVcIiwgXCJ1cmxcIjogXCIveGFkbWluL3hhZG1pbi9sb2cvXCIsIFwiaWNvblwiOiBcImZhIGZhLWNvZ1wiLCBcIm9yZGVyXCI6IDExfV0sIFwiZmlyc3RfaWNvblwiOiBcImZhIGZhLWNvZ1wiLCBcImZpcnN0X3VybFwiOiBcIi94YWRtaW4veGFkbWluL2xvZy9cIn0sIHtcInRpdGxlXCI6IFwiXHU4YmE0XHU4YmMxXHU1NDhjXHU2Mzg4XHU2NzQzXCIsIFwibWVudXNcIjogW3tcInRpdGxlXCI6IFwiXHU3ZWM0XCIsIFwidXJsXCI6IFwiL3hhZG1pbi9hdXRoL2dyb3VwL1wiLCBcImljb25cIjogXCJmYSBmYS1ncm91cFwiLCBcIm9yZGVyXCI6IDJ9LCB7XCJ0aXRsZVwiOiBcIlx1Njc0M1x1OTY1MFwiLCBcInVybFwiOiBcIi94YWRtaW4vYXV0aC9wZXJtaXNzaW9uL1wiLCBcImljb25cIjogXCJmYSBmYS1sb2NrXCIsIFwib3JkZXJcIjogNH1dLCBcImZpcnN0X2ljb25cIjogXCJmYSBmYS1ncm91cFwiLCBcImZpcnN0X3VybFwiOiBcIi94YWRtaW4vYXV0aC9ncm91cC9cIn1dIiwiTElTVF9RVUVSWSI6W1siYXJ0aWNsZXMiLCJhcnRpY2xlIl0sIiJdfQ==', '2018-09-29 12:02:11.837488');
INSERT INTO `django_session` VALUES ('wrghms06fivsostt1t7768cztdohd1fa', 'MDcyNzQ1MjU0NGRmMTIzZGNmMWI4M2YzMjBlM2EwYWU1M2I1ZDU4Zjp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJhYTJhMDYwODYwMmIxN2JmOTY1Y2I4Yjc1MTZkYjA1YWQxMjE1MDgzIn0=', '2018-05-17 13:04:07.861365');
INSERT INTO `django_session` VALUES ('xdi2aykwb15lpssfi1m31j5s1fk442at', 'NDVmMDUyZGQyZTc3MDlhZjJjMzBhOGI5Yjg1ZjViMTk4MzEwN2E1MDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJhYTJhMDYwODYwMmIxN2JmOTY1Y2I4Yjc1MTZkYjA1YWQxMjE1MDgzIiwibmF2X21lbnUiOiJbe1widGl0bGVcIjogXCJcdTY1ODdcdTdhZTBcdTUyMDZcdTdjN2JcIiwgXCJtZW51c1wiOiBbe1widGl0bGVcIjogXCJcdTY1ODdcdTdhZTBcdTUyMDZcdTdjN2JcIiwgXCJ1cmxcIjogXCIveGFkbWluL2NhdGVnb3J5cy9jYXRlZ29yeS9cIiwgXCJpY29uXCI6IG51bGwsIFwib3JkZXJcIjogNX0sIHtcInRpdGxlXCI6IFwiXHU1MjA2XHU3YzdiXHU1MTczXHU5NTJlXHU1YjU3XCIsIFwidXJsXCI6IFwiL3hhZG1pbi9jYXRlZ29yeXMva2V5d29yZC9cIiwgXCJpY29uXCI6IG51bGwsIFwib3JkZXJcIjogNn0sIHtcInRpdGxlXCI6IFwiXHU3NTU5XHU4YTAwXHU2NzdmXCIsIFwidXJsXCI6IFwiL3hhZG1pbi9jYXRlZ29yeXMvZ3Vlc3Rib29rL1wiLCBcImljb25cIjogbnVsbCwgXCJvcmRlclwiOiA3fV0sIFwiZmlyc3RfdXJsXCI6IFwiL3hhZG1pbi9jYXRlZ29yeXMvY2F0ZWdvcnkvXCJ9LCB7XCJ0aXRsZVwiOiBcIlx1NjU4N1x1N2FlMFx1N2JhMVx1NzQwNlwiLCBcIm1lbnVzXCI6IFt7XCJ0aXRsZVwiOiBcIlx1NjU4N1x1N2FlMFwiLCBcInVybFwiOiBcIi94YWRtaW4vYXJ0aWNsZXMvYXJ0aWNsZS9cIiwgXCJpY29uXCI6IG51bGwsIFwib3JkZXJcIjogOH0sIHtcInRpdGxlXCI6IFwiXHU2NTg3XHU3YWUwXHU2ODA3XHU3YjdlXCIsIFwidXJsXCI6IFwiL3hhZG1pbi9hcnRpY2xlcy90YWcvXCIsIFwiaWNvblwiOiBudWxsLCBcIm9yZGVyXCI6IDl9XSwgXCJmaXJzdF91cmxcIjogXCIveGFkbWluL2FydGljbGVzL2FydGljbGUvXCJ9LCB7XCJ0aXRsZVwiOiBcIlx1NzUyOFx1NjIzN1x1NjRjZFx1NGY1Y1wiLCBcIm1lbnVzXCI6IFt7XCJ0aXRsZVwiOiBcIlx1NzUyOFx1NjIzN1wiLCBcInVybFwiOiBcIi94YWRtaW4vdXNlcnMvdXNlcnByb2ZpbGUvXCIsIFwiaWNvblwiOiBcImZhIGZhLXVzZXJcIiwgXCJvcmRlclwiOiAzfV0sIFwiZmlyc3RfaWNvblwiOiBcImZhIGZhLXVzZXJcIiwgXCJmaXJzdF91cmxcIjogXCIveGFkbWluL3VzZXJzL3VzZXJwcm9maWxlL1wifSwge1widGl0bGVcIjogXCJcdTdiYTFcdTc0MDZcIiwgXCJtZW51c1wiOiBbe1widGl0bGVcIjogXCJcdTY1ZTVcdTVmZDdcdThiYjBcdTVmNTVcIiwgXCJ1cmxcIjogXCIveGFkbWluL3hhZG1pbi9sb2cvXCIsIFwiaWNvblwiOiBcImZhIGZhLWNvZ1wiLCBcIm9yZGVyXCI6IDExfV0sIFwiZmlyc3RfaWNvblwiOiBcImZhIGZhLWNvZ1wiLCBcImZpcnN0X3VybFwiOiBcIi94YWRtaW4veGFkbWluL2xvZy9cIn0sIHtcInRpdGxlXCI6IFwiXHU4YmE0XHU4YmMxXHU1NDhjXHU2Mzg4XHU2NzQzXCIsIFwibWVudXNcIjogW3tcInRpdGxlXCI6IFwiXHU3ZWM0XCIsIFwidXJsXCI6IFwiL3hhZG1pbi9hdXRoL2dyb3VwL1wiLCBcImljb25cIjogXCJmYSBmYS1ncm91cFwiLCBcIm9yZGVyXCI6IDJ9LCB7XCJ0aXRsZVwiOiBcIlx1Njc0M1x1OTY1MFwiLCBcInVybFwiOiBcIi94YWRtaW4vYXV0aC9wZXJtaXNzaW9uL1wiLCBcImljb25cIjogXCJmYSBmYS1sb2NrXCIsIFwib3JkZXJcIjogNH1dLCBcImZpcnN0X2ljb25cIjogXCJmYSBmYS1ncm91cFwiLCBcImZpcnN0X3VybFwiOiBcIi94YWRtaW4vYXV0aC9ncm91cC9cIn1dIiwiTElTVF9RVUVSWSI6W1siYXJ0aWNsZXMiLCJhcnRpY2xlIl0sIiJdfQ==', '2018-06-09 14:48:04.000000');
INSERT INTO `django_session` VALUES ('z0aoixxexc0nac9m42b680ch08hvofe5', 'NTExMzkyZTQ5YzE5MzUxMmNjNjNjZDQ5MDNjNTVhMmU5ZjQxNDU3Yjp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJhYTJhMDYwODYwMmIxN2JmOTY1Y2I4Yjc1MTZkYjA1YWQxMjE1MDgzIiwiTElTVF9RVUVSWSI6W1sidXNlcnMiLCJ1c2VycHJvZmlsZSJdLCIiXX0=', '2018-05-24 23:24:36.304731');

-- ----------------------------
-- Table structure for users_userprofile
-- ----------------------------
DROP TABLE IF EXISTS `users_userprofile`;
CREATE TABLE `users_userprofile` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(30) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  `nick_name` varchar(10) NOT NULL,
  `gender` varchar(6) NOT NULL,
  `birthday` datetime(6) DEFAULT NULL,
  `mobile` varchar(11) DEFAULT NULL,
  `image` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of users_userprofile
-- ----------------------------
INSERT INTO `users_userprofile` VALUES ('1', 'pbkdf2_sha256$24000$TfQxE9VoGp2K$wtjCFJ7OKZnld/Kz3+4BWoI0VFM7mKRCoKe8quig7es=', '2018-09-14 17:08:54.883205', '1', 'bin', '', '', 'binloveplay1314@qq.com', '1', '1', '2018-04-30 06:49:20.681215', '', '', null, null, 'image/default.jpg');

-- ----------------------------
-- Table structure for users_userprofile_groups
-- ----------------------------
DROP TABLE IF EXISTS `users_userprofile_groups`;
CREATE TABLE `users_userprofile_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userprofile_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_userprofile_groups_userprofile_id_823cf2fc_uniq` (`userprofile_id`,`group_id`),
  KEY `users_userprofile_groups_group_id_3de53dbf_fk_auth_group_id` (`group_id`),
  CONSTRAINT `users_userprofil_userprofile_id_a4496a80_fk_users_userprofile_id` FOREIGN KEY (`userprofile_id`) REFERENCES `users_userprofile` (`id`),
  CONSTRAINT `users_userprofile_groups_group_id_3de53dbf_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of users_userprofile_groups
-- ----------------------------

-- ----------------------------
-- Table structure for users_userprofile_user_permissions
-- ----------------------------
DROP TABLE IF EXISTS `users_userprofile_user_permissions`;
CREATE TABLE `users_userprofile_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userprofile_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_userprofile_user_permissions_userprofile_id_d0215190_uniq` (`userprofile_id`,`permission_id`),
  KEY `users_userprofile_u_permission_id_393136b6_fk_auth_permission_id` (`permission_id`),
  CONSTRAINT `users_userprofil_userprofile_id_34544737_fk_users_userprofile_id` FOREIGN KEY (`userprofile_id`) REFERENCES `users_userprofile` (`id`),
  CONSTRAINT `users_userprofile_u_permission_id_393136b6_fk_auth_permission_id` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of users_userprofile_user_permissions
-- ----------------------------

-- ----------------------------
-- Table structure for xadmin_bookmark
-- ----------------------------
DROP TABLE IF EXISTS `xadmin_bookmark`;
CREATE TABLE `xadmin_bookmark` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(128) NOT NULL,
  `url_name` varchar(64) NOT NULL,
  `query` varchar(1000) NOT NULL,
  `is_share` tinyint(1) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `xadmin_bookma_content_type_id_60941679_fk_django_content_type_id` (`content_type_id`),
  KEY `xadmin_bookmark_user_id_42d307fc_fk_users_userprofile_id` (`user_id`),
  CONSTRAINT `xadmin_bookma_content_type_id_60941679_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `xadmin_bookmark_user_id_42d307fc_fk_users_userprofile_id` FOREIGN KEY (`user_id`) REFERENCES `users_userprofile` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xadmin_bookmark
-- ----------------------------

-- ----------------------------
-- Table structure for xadmin_log
-- ----------------------------
DROP TABLE IF EXISTS `xadmin_log`;
CREATE TABLE `xadmin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `ip_addr` char(39) DEFAULT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` varchar(32) NOT NULL,
  `message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `xadmin_log_content_type_id_2a6cb852_fk_django_content_type_id` (`content_type_id`),
  KEY `xadmin_log_user_id_bb16a176_fk_users_userprofile_id` (`user_id`),
  CONSTRAINT `xadmin_log_content_type_id_2a6cb852_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `xadmin_log_user_id_bb16a176_fk_users_userprofile_id` FOREIGN KEY (`user_id`) REFERENCES `users_userprofile` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xadmin_log
-- ----------------------------
INSERT INTO `xadmin_log` VALUES ('1', '2018-05-05 10:18:21.988708', '127.0.0.1', '1', 'Category object', 'create', '已添加。', '8', '1');
INSERT INTO `xadmin_log` VALUES ('2', '2018-05-05 10:19:28.700270', '127.0.0.1', '2', 'Category object', 'create', '已添加。', '8', '1');
INSERT INTO `xadmin_log` VALUES ('3', '2018-05-05 10:24:12.843870', '127.0.0.1', null, '', 'delete', '批量删除 2 个 文章分类', null, '1');
INSERT INTO `xadmin_log` VALUES ('4', '2018-05-05 10:24:19.994335', '127.0.0.1', '3', 'Category object', 'create', '已添加。', '8', '1');
INSERT INTO `xadmin_log` VALUES ('5', '2018-05-05 10:25:22.543414', '127.0.0.1', '4', 'Category object', 'create', '已添加。', '8', '1');
INSERT INTO `xadmin_log` VALUES ('6', '2018-05-05 10:29:23.075605', '127.0.0.1', null, '', 'delete', '批量删除 1 个 文章分类', null, '1');
INSERT INTO `xadmin_log` VALUES ('7', '2018-05-05 13:13:00.726317', '127.0.0.1', '1', 'django', 'create', '已添加。', '9', '1');
INSERT INTO `xadmin_log` VALUES ('8', '2018-05-05 13:13:06.445529', '127.0.0.1', '2', 'scrapy', 'create', '已添加。', '9', '1');
INSERT INTO `xadmin_log` VALUES ('9', '2018-05-06 23:25:55.429645', '127.0.0.1', '5', '实例记录', 'create', '已添加。', '8', '1');
INSERT INTO `xadmin_log` VALUES ('10', '2018-05-06 23:28:05.762748', '127.0.0.1', '1', 'html+css+js完成别踩白块', 'create', '已添加。', '10', '1');
INSERT INTO `xadmin_log` VALUES ('11', '2018-05-07 15:19:09.829026', '127.0.0.1', '2', '111', 'create', '已添加。', '10', '1');
INSERT INTO `xadmin_log` VALUES ('12', '2018-05-07 16:14:34.969596', '127.0.0.1', '5', '实例记录', 'change', '已修改 desc 。', '8', '1');
INSERT INTO `xadmin_log` VALUES ('13', '2018-05-07 16:32:52.811476', '127.0.0.1', '2', '111', 'change', '已修改 image 。', '10', '1');
INSERT INTO `xadmin_log` VALUES ('14', '2018-05-07 22:51:39.041218', '127.0.0.1', '2', '1111', 'change', '已修改 title 。', '10', '1');
INSERT INTO `xadmin_log` VALUES ('15', '2018-05-07 22:52:40.939900', '127.0.0.1', '3', '333', 'create', '已添加。', '10', '1');
INSERT INTO `xadmin_log` VALUES ('16', '2018-05-07 22:53:44.180292', '127.0.0.1', '5', '实例记录', 'change', '没有字段被修改。', '8', '1');
INSERT INTO `xadmin_log` VALUES ('17', '2018-05-07 22:53:46.522349', '127.0.0.1', '5', '实例记录', 'change', '没有字段被修改。', '8', '1');
INSERT INTO `xadmin_log` VALUES ('18', '2018-05-07 22:54:13.204953', '127.0.0.1', '3', '333', 'change', '没有字段被修改。', '10', '1');
INSERT INTO `xadmin_log` VALUES ('19', '2018-05-08 20:57:35.153115', '127.0.0.1', null, '', 'delete', '批量删除 2 个 文章', null, '1');
INSERT INTO `xadmin_log` VALUES ('20', '2018-05-08 20:58:53.010295', '127.0.0.1', '6', '', 'create', '已添加。', '8', '1');
INSERT INTO `xadmin_log` VALUES ('21', '2018-05-08 21:00:42.156522', '127.0.0.1', '6', '学无止境', 'change', '已修改 name 。', '8', '1');
INSERT INTO `xadmin_log` VALUES ('22', '2018-05-08 21:01:00.225985', '127.0.0.1', '7', '随笔心情', 'create', '已添加。', '8', '1');
INSERT INTO `xadmin_log` VALUES ('23', '2018-05-09 00:00:54.608746', '127.0.0.1', '8', '随笔心情', 'change', '已修改 image 。', '8', '1');
INSERT INTO `xadmin_log` VALUES ('24', '2018-05-09 00:01:19.990757', '127.0.0.1', '1', '学无止境', 'change', '已修改 image 。', '8', '1');
INSERT INTO `xadmin_log` VALUES ('25', '2018-05-09 00:01:26.284212', '127.0.0.1', '6', '实例记录', 'change', '已修改 image 。', '8', '1');
INSERT INTO `xadmin_log` VALUES ('26', '2018-05-09 00:01:31.729073', '127.0.0.1', '4', 'python学习', 'change', '已修改 image 。', '8', '1');
INSERT INTO `xadmin_log` VALUES ('27', '2018-05-26 14:30:53.000000', '183.36.65.82', null, '', 'delete', '批量删除 10 个 留言板', null, '1');
INSERT INTO `xadmin_log` VALUES ('28', '2018-05-26 14:41:34.000000', '183.36.65.82', '11', '彬彬', 'create', '已添加。', '16', '1');
INSERT INTO `xadmin_log` VALUES ('29', '2018-05-26 14:41:53.000000', '183.36.65.82', '12', '彬彬呀', 'create', '已添加。', '16', '1');
INSERT INTO `xadmin_log` VALUES ('30', '2018-05-26 14:42:17.000000', '183.36.65.82', '13', 'nmz~', 'create', '已添加。', '16', '1');
INSERT INTO `xadmin_log` VALUES ('31', '2018-05-26 14:42:38.000000', '183.36.65.82', '14', 'WJQ', 'create', '已添加。', '16', '1');
INSERT INTO `xadmin_log` VALUES ('32', '2018-05-26 14:42:59.000000', '183.36.65.82', '15', '渣神', 'create', '已添加。', '16', '1');
INSERT INTO `xadmin_log` VALUES ('33', '2018-05-26 14:43:19.000000', '183.36.65.82', '16', '小度', 'create', '已添加。', '16', '1');
INSERT INTO `xadmin_log` VALUES ('34', '2018-05-26 14:43:47.000000', '183.36.65.82', '17', '飞哥', 'create', '已添加。', '16', '1');
INSERT INTO `xadmin_log` VALUES ('35', '2018-05-26 14:44:05.000000', '183.36.65.82', '18', '彬彬', 'create', '已添加。', '16', '1');
INSERT INTO `xadmin_log` VALUES ('36', '2018-05-26 14:44:22.000000', '183.36.65.82', '19', '手机端的彬彬', 'create', '已添加。', '16', '1');
INSERT INTO `xadmin_log` VALUES ('37', '2018-05-26 14:44:39.000000', '183.36.65.82', '20', '彬彬', 'create', '已添加。', '16', '1');
INSERT INTO `xadmin_log` VALUES ('38', '2018-05-26 14:45:07.000000', '183.36.65.82', '21', '渣神', 'create', '已添加。', '16', '1');
INSERT INTO `xadmin_log` VALUES ('39', '2018-05-26 14:45:27.000000', '183.36.65.82', '21', '渣神', 'change', '已修改 content 。', '16', '1');

-- ----------------------------
-- Table structure for xadmin_usersettings
-- ----------------------------
DROP TABLE IF EXISTS `xadmin_usersettings`;
CREATE TABLE `xadmin_usersettings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `key` varchar(256) NOT NULL,
  `value` longtext NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `xadmin_usersettings_user_id_edeabe4a_fk_users_userprofile_id` (`user_id`),
  CONSTRAINT `xadmin_usersettings_user_id_edeabe4a_fk_users_userprofile_id` FOREIGN KEY (`user_id`) REFERENCES `users_userprofile` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xadmin_usersettings
-- ----------------------------
INSERT INTO `xadmin_usersettings` VALUES ('1', 'dashboard:home:pos', '', '1');
INSERT INTO `xadmin_usersettings` VALUES ('2', 'site-theme', '/static/xadmin/css/themes/bootstrap-theme.css', '1');

-- ----------------------------
-- Table structure for xadmin_userwidget
-- ----------------------------
DROP TABLE IF EXISTS `xadmin_userwidget`;
CREATE TABLE `xadmin_userwidget` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `page_id` varchar(256) NOT NULL,
  `widget_type` varchar(50) NOT NULL,
  `value` longtext NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `xadmin_userwidget_user_id_c159233a_fk_users_userprofile_id` (`user_id`),
  CONSTRAINT `xadmin_userwidget_user_id_c159233a_fk_users_userprofile_id` FOREIGN KEY (`user_id`) REFERENCES `users_userprofile` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xadmin_userwidget
-- ----------------------------
