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
INSERT INTO `articles_article` VALUES ('1', '从win移植博客系统(tp搭建)到linux', '从win移植博客系统(tp搭建)到linux', '<p><span style=\"font-size: 16px;line-height: 27px\"></span></p><p>博客网站建立初,我是建立在腾讯云学生优惠服务器内的,学生实名认证后一块钱一个月</p><p>头开始是选用的window server 2012 (没记错的话) 这个系统, 最先开始配置环境的时候,折腾了很久很久, &nbsp;一开始是使用的 整合包 , 然后发现问题很多 , 于是又改回 手动自己手动配置 apache php mysql &nbsp;由于是低端服务器, 环境也比不上自己的 实体笔记本,性能也远远不如笔记本快, 当时配的不要不要的, 时长卡机..最先开始也是自己拿来玩</p><p>后面写了这个博客系统, &nbsp;前台后台也都是我自己一个人写的 , 框架方面用的是 tp 和 bootdrap完成后, 把博客网站挂在了 腾讯云上 想试试,结果发现速度巨慢, 还时常进不去网址, ping是能ping通, 也百度了, 也研究了, 还是解决不了</p><p>后面头一热, 直接重装了 linux centos6.7 &nbsp;因为之前刚学完linux &nbsp;实体机上的虚拟机也是 使用的centos67同时对 服务器感到失望, 所以便舍弃了一切 &nbsp;重装上了linux</p><p><strong>linux上配置环境很简单, 直接yum</strong></p><p style=\"padding: 9.5px;margin: 0 0 10px;font-size: 13px;color: #333;background-color: #f5f5f5;border: 1px solid #ccc;border-radius: 4px;\">yum install -y httpd php php-fpm mysql mysql-server php-mysql</p><p><strong>然后启动服务</strong></p><p style=\"padding: 9.5px;margin: 0 0 10px;font-size: 13px;color: #333;background-color: #f5f5f5;border: 1px solid #ccc;border-radius: 4px;\">service httpd start &nbsp;service mysqld start &nbsp;service php-fpm start</p><p><strong>服务启动成功检查下服务的运行</strong></p><p style=\"padding: 9.5px;margin: 0 0 10px;font-size: 13px;color: #333;background-color: #f5f5f5;border: 1px solid #ccc;border-radius: 4px;\">netstat -tunlp</p><p>这样我们可以看到httpd(也就是apache服务)监听80端口，mysql监听3306端口，php-fpm监听9000端口，并且都已经正常启动</p><p>这时，我们的环境已经基本搭建好了，大家已经可以在浏览器中访问服务器的公网ip，可以看到apache的测试页面，就说明你已经成功了。为了保险起见，也建议大家进入到apache的web根目录：</p><p><strong>/var/www/html 中自己写一个最简单的php页面.</strong></p><p style=\"padding: 9.5px;margin: 0 0 10px;font-size: 13px;color: #333;background-color: #f5f5f5;border: 1px solid #ccc;border-radius: 4px;\">cd /var/www/html &nbsp;vi phpinfo.php &nbsp;&lt;?php &nbsp;&nbsp;phpinfo(); &nbsp;?&gt;</p><p>外网访问 ip/phpinfo.php &nbsp;显示phpinfo 成功即可</p><p><strong>我们要为mysql设置相应的用户去访问管理，之前我们已经启动了mysqld服务，因此此时我们需要给mysql设定一个初始的root密码，可以让root用户去访问数据库</strong></p><p style=\"padding: 9.5px;margin: 0 0 10px;font-size: 13px;color: #333;background-color: #f5f5f5;border: 1px solid #ccc;border-radius: 4px;\">mysqladmin -u root password “XXXXXXXX”</p><p>这样我们就设置好了mysql的密码，可以输入 mysql -u root -p ，然后再输入刚刚设定好的密码，就可以进入到数据库中</p><p>然后移植博客系统, 进行简单的权限设置 &nbsp;网站运行了</p><p>发现速度比window不知道提高了多少, 以前win是时常当机, linux不会, 网站运行速度也很快带宽没变的, 感觉linux上做服务器, 是真的比window好</p><p>然后我使用window系列也有10多年了 &nbsp;实体机也是win8 &nbsp;环境也配的好辛苦, 所以实际上还是使用的window对linux的学习, 只能放在 腾讯云服务器 和 虚拟机上了</p><p>good day . thanks for</p><p><span style=\"font-size: 16px;line-height: 27px\"></span></p><p>博客网站建立初,我是建立在腾讯云学生优惠服务器内的,学生实名认证后一块钱一个月</p><p>头开始是选用的window server 2012 (没记错的话) 这个系统, 最先开始配置环境的时候,折腾了很久很久, &nbsp;一开始是使用的 整合包 , 然后发现问题很多 , 于是又改回 手动自己手动配置 apache php mysql &nbsp;由于是低端服务器, 环境也比不上自己的 实体笔记本,性能也远远不如笔记本快, 当时配的不要不要的, 时长卡机..最先开始也是自己拿来玩</p><p>后面写了这个博客系统, &nbsp;前台后台也都是我自己一个人写的 , 框架方面用的是 tp 和 bootdrap完成后, 把博客网站挂在了 腾讯云上 想试试,结果发现速度巨慢, 还时常进不去网址, ping是能ping通, 也百度了, 也研究了, 还是解决不了</p><p>后面头一热, 直接重装了 linux centos6.7 &nbsp;因为之前刚学完linux &nbsp;实体机上的虚拟机也是 使用的centos67同时对 服务器感到失望, 所以便舍弃了一切 &nbsp;重装上了linux</p><p><strong>linux上配置环境很简单, 直接yum</strong></p><p style=\"padding: 9.5px;margin: 0 0 10px;font-size: 13px;color: #333;background-color: #f5f5f5;border: 1px solid #ccc;border-radius: 4px;\">yum install -y httpd php php-fpm mysql mysql-server php-mysql</p><p><strong>然后启动服务</strong></p><p style=\"padding: 9.5px;margin: 0 0 10px;font-size: 13px;color: #333;background-color: #f5f5f5;border: 1px solid #ccc;border-radius: 4px;\">service httpd start &nbsp;service mysqld start &nbsp;service php-fpm start</p><p><strong>服务启动成功检查下服务的运行</strong></p><p style=\"padding: 9.5px;margin: 0 0 10px;font-size: 13px;color: #333;background-color: #f5f5f5;border: 1px solid #ccc;border-radius: 4px;\">netstat -tunlp</p><p>这样我们可以看到httpd(也就是apache服务)监听80端口，mysql监听3306端口，php-fpm监听9000端口，并且都已经正常启动</p><p>这时，我们的环境已经基本搭建好了，大家已经可以在浏览器中访问服务器的公网ip，可以看到apache的测试页面，就说明你已经成功了。为了保险起见，也建议大家进入到apache的web根目录：</p><p><strong>/var/www/html 中自己写一个最简单的php页面.</strong></p><p style=\"padding: 9.5px;margin: 0 0 10px;font-size: 13px;color: #333;background-color: #f5f5f5;border: 1px solid #ccc;border-radius: 4px;\">cd /var/www/html &nbsp;vi phpinfo.php &nbsp;&lt;?php &nbsp;&nbsp;phpinfo(); &nbsp;?&gt;</p><p>外网访问 ip/phpinfo.php &nbsp;显示phpinfo 成功即可</p><p><strong>我们要为mysql设置相应的用户去访问管理，之前我们已经启动了mysqld服务，因此此时我们需要给mysql设定一个初始的root密码，可以让root用户去访问数据库</strong></p><p style=\"padding: 9.5px;margin: 0 0 10px;font-size: 13px;color: #333;background-color: #f5f5f5;border: 1px solid #ccc;border-radius: 4px;\">mysqladmin -u root password “XXXXXXXX”</p><p>这样我们就设置好了mysql的密码，可以输入 mysql -u root -p ，然后再输入刚刚设定好的密码，就可以进入到数据库中</p><p>然后移植博客系统, 进行简单的权限设置 &nbsp;网站运行了</p><p>发现速度比window不知道提高了多少, 以前win是时常当机, linux不会, 网站运行速度也很快带宽没变的, 感觉linux上做服务器, 是真的比window好</p><p>然后我使用window系列也有10多年了 &nbsp;实体机也是win8 &nbsp;环境也配的好辛苦, 所以实际上还是使用的window对linux的学习, 只能放在 腾讯云服务器 和 虚拟机上了</p><p>good day . thanks for look</p><p><br/> </p><p><br/> </p>', '渣神', 'article/2018/05/20161111212235179.jpg', '2016-08-15 17:15:00.000000', '0', '1');
INSERT INTO `articles_article` VALUES ('2', 'Centos7.2下安装php开发环境', 'Centos7.2下安装php开发环境', '<p>系统 centos7.2 下安装 php开发环境&nbsp; by 飞翔的渣神丶 2016年11月8日<br/>apache2.4.6<br/>php5.6.27<br/>mariadb&nbsp; (mysql的一个分支)<br/> <br/>0. 设置源<br/>&nbsp;&nbsp; &nbsp;rpm -Uvh https://dl.Fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm<br/>&nbsp;&nbsp; &nbsp;rpm -Uvh https://mirror.webtatic.com/yum/el7/webtatic-release.rpm<br/>1. yum 一键安装环境<br/>&nbsp;&nbsp; &nbsp;yum install httpd mariadb-server php56w php56w-mysql php56w-mcrypt php56w-dom php56w-mbstring</p><p>&nbsp;&nbsp;&nbsp;&nbsp;安装gd库<br/> </p><p>&nbsp;&nbsp;&nbsp;&nbsp;yum install php56w-gd</p><p>2. 设置 apache和mysql 开机自启<br/>&nbsp;&nbsp; &nbsp;systemctl start httpd<br/>&nbsp;&nbsp; &nbsp;systemctl enable httpd<br/>&nbsp;&nbsp; &nbsp;*****************说明*********************<br/>&nbsp;&nbsp; &nbsp;mariadb是mysql的一个分支,由mysql创始人带队<br/>&nbsp;&nbsp; &nbsp;由于mysql闭源了,mariadb兼容mysql,且开源<br/>&nbsp;&nbsp; &nbsp;所以现在也开始使用mariadb,mysql转mariadb<br/>&nbsp;&nbsp; &nbsp;******************************************<br/>&nbsp;&nbsp; &nbsp;systemctl start mariadb(mysql)<br/>&nbsp;&nbsp; &nbsp;systemctl enable mariadb(mysqld)<br/>3. 设置mariadb密码<br/>&nbsp;&nbsp; &nbsp;mysql_secure_installation<br/>&nbsp;&nbsp; &nbsp;输入当前密码&nbsp; 默认为空<br/>&nbsp;&nbsp; &nbsp;设置密码 和 确认密码<br/>&nbsp;&nbsp; &nbsp;移除匿名用户 y<br/>&nbsp;&nbsp; &nbsp;禁止root远程登陆 n<br/>&nbsp;&nbsp; &nbsp;删除测试表并访问 n<br/>&nbsp;&nbsp; &nbsp;重新加载权限表 y<br/> <br/>编写测试文件:<br/>cd /var/www/html<br/>vi index.php<br/> <br/>&lt;?php <br/>&nbsp;&nbsp; &nbsp;phpinfo();<br/>?&gt;<br/> <br/> <br/> <br/>扩展1:<br/>&nbsp;&nbsp; &nbsp;修改php.ini文件<br/>&nbsp;&nbsp; &nbsp;cd /<br/>&nbsp;&nbsp; &nbsp;find -name php.ini<br/>&nbsp;&nbsp; &nbsp;cd 进入目录<br/>&nbsp;&nbsp; &nbsp;cp php.ini ./php.ini.bak<br/>&nbsp;&nbsp; &nbsp;vi php.ini<br/>&nbsp;&nbsp;&nbsp; 使用vi的 /string/ 搜索</p><p>&nbsp;&nbsp;&nbsp; 例如&nbsp; /display_errors/</p><p>&nbsp;&nbsp;&nbsp;&nbsp;再按n 后翻一次&nbsp; 找到下面的代码 <br/> </p><p>&nbsp;&nbsp;&nbsp; display_errors = Off<br/>&nbsp;&nbsp; &nbsp;display_startup_errors = Off<br/>&nbsp;&nbsp; &nbsp;off修改为on 提示错误<br/> <br/> <br/> <br/>扩展2:<br/>&nbsp;&nbsp; &nbsp;设置 mariaDB数据库 允许 远程登陆 个人用的是navicat<br/> <br/>&nbsp;&nbsp; &nbsp;host 183.36.65.xxx is not allowed to connect to ... server<br/>&nbsp;&nbsp; &nbsp;本机IP: 183.36.65.xxx 广东省广州市 电信 <br/> <br/>&nbsp;&nbsp; &nbsp;给root允许在所有IP上远程登陆&nbsp; 有所有的权限<br/>&nbsp;&nbsp; &nbsp;mysql -uroot -p<br/>&nbsp;&nbsp; &nbsp;grant all privileges on *.* to root@&#39;%&#39; identified by &#39;自己的密码&#39;;<br/>&nbsp;&nbsp; &nbsp;flush privileges;<br/>&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;<br/>&nbsp;&nbsp; &nbsp; all privileges&nbsp;&nbsp; 所有权限&nbsp; &nbsp;<br/>&nbsp;&nbsp; &nbsp; *.*&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 数据库.表 &nbsp;<br/>&nbsp;&nbsp; &nbsp; root@&#39;%&#39;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 用户@&#39;ip(%表示不限制)&#39; &nbsp;<br/>&nbsp;&nbsp; &nbsp; &#39;自己的密码&#39; 密码<br/> <br/>扩展3:<br/>&nbsp;&nbsp; &nbsp;安装laravel&nbsp; (建议看着文档进行安装)<br/> <br/>&nbsp;&nbsp; &nbsp;先安装 composer<br/>&nbsp;&nbsp; &nbsp;#下载composer安装文件并使用php执行，以便生成一个composer.phar包<br/>&nbsp;&nbsp; &nbsp;curl -sS https://getcomposer.org/installer | php<br/> <br/>&nbsp;&nbsp; &nbsp;# 将生成的composer包放到一个存放命令包的目录，以便系统的$PATH能够搜索到这个命令，这样就可以在命令行直接使用composer命令了。<br/>&nbsp;&nbsp; &nbsp;mv composer.phar /usr/local/bin/composer <br/> <br/>&nbsp;&nbsp; &nbsp;需要注意composer的执行权限<br/>&nbsp;&nbsp; &nbsp;chmod +x /usr/local/bin/composer<br/> <br/>&nbsp;&nbsp; &nbsp;终端上输入　composer&nbsp; 显示提示信息 安装成功<br/> <br/>&nbsp;&nbsp; &nbsp;设置全局配置:&nbsp; composer从中国镜像packagist<br/>&nbsp;&nbsp; &nbsp;composer config -g repo.packagist composer https://packagist.phpcomposer.com<br/> <br/>&nbsp;&nbsp; &nbsp;创建project:<br/>&nbsp;&nbsp; &nbsp;cd 指定项目目录<br/>&nbsp;&nbsp; &nbsp;composer create-project laravel/laravel --prefer-dist<br/>&nbsp;&nbsp; &nbsp;#composer create-project laravel/laravel blog --prefer-dist<br/> <br/>&nbsp;&nbsp; &nbsp;安装 Laravel 之后，可能需要你配置一下目录权限。<br/>&nbsp;&nbsp; &nbsp;web 服务器需要拥有 storage 目录下的所有目录和 bootstrap/cache 目录的写权限。<br/>&nbsp;&nbsp; &nbsp;同理 tp框架下的 runtime目录也需要读写权限<br/> <br/>&nbsp;&nbsp; &nbsp;之后 ip/laravel 后看到欢迎界面&nbsp; 安装成功<br/> <br/>&nbsp;&nbsp; &nbsp;laravel路由失效, 开启 apache的重写<br/>&nbsp;&nbsp; &nbsp;模块文件在 httpd中, 里面有多个配置文件<br/>&nbsp;&nbsp; &nbsp;修改httpd.conf&nbsp; 中的 AllowOverride All&nbsp; &nbsp; &nbsp;&nbsp; <br/> </p>', '渣神', 'article/2018/05/20161111225124414.jpg', '2016-11-11 22:51:00.000000', '0', '1');
INSERT INTO `articles_article` VALUES ('3', '第一次给人培训呢', '第一次给人培训呢', '<h5>由来:<br/> </h5><p>&nbsp;&nbsp;&nbsp; 前几天,老虎跟我讲要给新媒体的人开一次培训,让我讲讲后端开发的东西.</p><p>&nbsp;&nbsp;&nbsp;&nbsp;当时想着, 因为我人比较奇怪, 其实在新媒体这个部门里面 , 并没有多大的存在感, 我是想着借着这次培训, 让他们认识认识我, 也能装逼, 也能顺便锻炼下自己</p><p><br/> </p><h5>然后:</h5><p>&nbsp;&nbsp;&nbsp;&nbsp;答应后,自己想了想才发现有点难度, 主观上, 我感觉我压力有点大, 我他么还没给人搞过这东西, 听说还嘚要严肃?? 想着那些大一师弟师妹们, 应该都不认识我, 哎呦, 我要怎么讲..</p><p>&nbsp;&nbsp;&nbsp;&nbsp;而且给他们讲, 还不知道能不能听的明白, 其实, 大学里, 真的能静下心来敲代码的人 是很少的, 新媒体里面那师弟师妹,我觉得其实他们也不会去搞IT,敲代码. 这要怎么讲!! 但是接了就要搞搞. 认真的搞搞, 锻炼下自己</p><h5>再后来:</h5><p>&nbsp;&nbsp;&nbsp;&nbsp;花了点时间想了想要怎么搞, 在上英语课的时候打了手稿, 卧槽还好去上了课, 被点名回答问题. 那时我在打手稿, 回答问题的时候一脸蒙蔽.&nbsp; 醉醉的..&nbsp; 好在课堂后完成了手稿, 大致是这样的:</p><p>&nbsp;&nbsp;&nbsp;&nbsp;1.先给他们讲下基本的电脑知识, 结合自己大一的时候 计算机协会修机经历, 飞扬网管修网络经历, 给他们讲讲遇到电脑故障, 电脑断网, 要怎么做, 讲讲电脑卡的优化什么的</p><p>&nbsp;&nbsp;&nbsp;&nbsp;2. 弄个C 指针改游戏内存里的数据的外挂. dll注入的方式完成 植物大战僵尸 的 无限太阳</p><p>&nbsp;&nbsp;&nbsp;&nbsp;3. 然后给他们演示前端方面CSS3完成的动画页面, js完成的 贪吃蛇别踩白块五子棋的游戏</p><p>&nbsp;&nbsp;&nbsp;&nbsp;4. 演示下这个博客系统. 讲讲后端是怎么实现代码的</p><p>&nbsp;&nbsp;&nbsp;&nbsp;5. 经验介绍,学习方法, 心灵鸡汤.</p><p><br/> </p><h5>培训:</h5><p>&nbsp;&nbsp;&nbsp;&nbsp;卧槽真的要上台讲的时候, 那之前, 贼鸡巴紧张, 小心肝一直砰砰的的跳.,&nbsp; <br/> </p><p>&nbsp;&nbsp;&nbsp;&nbsp;我上去讲的时候也基本一直看着笔记本....&nbsp; <br/> </p><p>&nbsp;&nbsp;&nbsp;&nbsp;他么的,讲到最后要结束的时候, 笔记本没电了...</p><p>&nbsp;&nbsp;&nbsp;&nbsp;其实我感觉我讲的内容其实 还不错, 为什么他们说我啰嗦. 哎呦好气哦</p><p>&nbsp;&nbsp;&nbsp;&nbsp;然后就一起吃了个夜宵. 花了30 . 好气哦, 讲完的时候我就应该走的, 不太适合社交</p><p>&nbsp;&nbsp;&nbsp;&nbsp;醉醉的</p><p><br/> </p><p>&nbsp;&nbsp;&nbsp;&nbsp;越努力越幸运&nbsp;&nbsp; .&nbsp; 1.01的365次方 ≈ 37.8&nbsp;&nbsp; 0.99的365次方 ≈ 0.026&nbsp;&nbsp; 每天要进步一点点!!! <br/>&nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; <br/> </p><p>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; <br/> </p>', '彬彬', 'article/2018/05/1_3.jpg', '2016-11-06 00:17:00.000000', '0', '8');
INSERT INTO `articles_article` VALUES ('4', '献给迷惘的自己,php进阶', '献给迷惘的自己,php进阶', '<p>在网络上见着的一篇文章,略有感概,以此激励自己</p><p><br/> </p><p>转载自：PHPchina （UID：流感猪）<br/> <br/>1.首先看了PHP的源码API函数，对于许多口水仗的争论一笑而过，只是停留在脚本级别上的什么效率，安全。。。之争完全就是无稽之谈，没有深入理解API，所有的争论都是臆测和不科学的态度。你做了吗？<br/> <br/>2.不再把PHP看作一门后台语言，而是一门类似JS的脚本，页面表现级的语言，更多的是尝试使用一种软件来做后台，PHP做前台，尝试真正的B/S开发。你的看法呢？<br/> <br/>3.知识更新。PHP中的接口你懂了吗？反射你听过吗？JS中的事件冒泡你懂了吗？原型链知道吗？一切函数都是对象，你能理解否？MySQL里面的视图，存储过程你尝试过么有？<br/> <br/>4.扎实的学知识。你是不是离开了JQ框架就连个DOM操作的原生JS都不会写了？你是不是离开了DB类，就连个简单的查询都不会写了？你是不是离开了IDE，连个表格都画不出来？你是不是到现在多表查询，子查询都还不会？你是不是到现在就只知道索引是用来加快查询的？<br/>你是不是到现在连个PHP5的稍微复杂点的OO类都还不会写？你会正则吗？你的E文水平咋样？<br/> <br/>5.扎实的算法基础。你知道选择排序，插入排序，冒泡排序，二分排序，希尔排序并且能写出来吗？你知道怎么遍历二叉树吗？知道霍夫曼吗？你知道图吗？你知道龙格-库塔，迭代，插值，雅戈尔，牛顿下山法吗？知道ZIP压缩原理吗？你是不是可爱到以为加减乘除加上循环判断就搞定了算法？你知道概率论，微积分，线性方程组在算法中是非常非常基础的吗？<br/> <br/>6.学习的主动性。你是不是自己的网站连个拿的出手的JS都没有写过？你网站的效果是不是都是你下载的JQ插件弄出来的？到现在都还没有看过JQ的代码？你现在的模板引擎是谁的？DB类是谁的？框架是谁的？你是不是一直都很鄙视重复造轮子的事情，就像中国现在，“拿来主义”，永远是MADE IN CHINA,而不是Created in China？<br/> <br/>7.广泛的基础。你会汇编吗？那C总该会点吧。。那C++呢，那简单的Java总该会吧。。。那。。那傻瓜化的VB,NET,PY。。。？什么，你只会PHP？其他啥都不会？JS总该会吧？啊，不会，只会用网上下来的JQ？你除了PHP还会点啥？那假如PHP垮台了或者你所在的公司不用PHP了你吃什么？如果老板让你学J2SE你怕不怕？<br/> <br/>8.你是不是就准备一辈子做个coder?你的知识如果让你传授给别人的话，能支撑三个月吗？三个月后你还能讲得出点其他的东西吗？<br/> <br/>9.你现在的水平和你刚开始学的时候进步了多少？你有过自己的作品吗？有多少代码是你自己写的？你认为是不是只要会写PHP代码就够了？这样的话一个初中生三个月后也就能达到你的水平了，你认为呢？你准备一直停留在这个水平吗？<br/> <br/>10.最后一问，你除了会写仅会的PHP代码，还会点其他的吗？你有把握做其他工作吗？你能养活自己老婆孩子吗？能给他们幸福吗？<br/>&nbsp; <br/>问我自己，也问所有PHPER。仅供参考。<br/> <br/>醒醒吧，雄起吧！最可爱的人！仅以此文激励自己永不放弃，奋发学习，激流勇进！！！！<br/> <br/> <br/> </p>', '渣神', 'article/2018/05/1_2.jpg', '2016-12-05 19:13:00.000000', '0', '8');
INSERT INTO `articles_article` VALUES ('5', 'javascript中的闭包', 'javascript中的闭包', '<p><span style=\"font-size: 16px;line-height: 27px\"></span></p><p>都说闭包闭包,以前也用过,不过都还很笼统,也没认真的看,今天就认真的研究了会闭包</p><p>先说说自己的理解, 文末后面有转载别人的一篇文章, 我觉得写的很好</p><p>以前用过闭包,就是简单的来说,个人理解,在函数外部访问到函数内部的局部变量\r\n全局-&gt;局部, 局部中可以访问全局的变量. 全局不能访问局部的变量</p><p><strong>函数内部访问变量,会往上父亲找找找</strong></p><p style=\"padding: 9.5px;margin: 0 0 10px;font-size: 13px;color: #333;background-color: #f5f5f5;border: 1px solid #ccc;border-radius: 4px;\">&nbsp;&nbsp;&nbsp; (function(){<br/>&nbsp;&nbsp;&nbsp; var hello=&quot;hello,world&quot;; <br/>&nbsp;&nbsp;&nbsp; function welcome(hi){ <br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; alert(hi); // 解析到作用域链的第一个对象的属性 <br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; alert(hello); // 解析到作用域链的第二个对象的属性 <br/>&nbsp;&nbsp;&nbsp; } <br/>&nbsp;&nbsp;&nbsp; welcome(&quot;It&#39;s easy&quot;); <br/>})();</p><p><strong>学习代码1</strong></p><p style=\"padding: 9.5px;margin: 0 0 10px;font-size: 13px;color: #333;background-color: #f5f5f5;border: 1px solid #ccc;border-radius: 4px;\">var a=1;<br/>var b=function(){<br/>&nbsp;&nbsp;&nbsp; return a+1 ;<br/>}<br/>var c = b();<br/>alert(c); // c = 2</p><p><strong>学习代码2</strong></p><p style=\"padding: 9.5px;margin: 0 0 10px;font-size: 13px;color: #333;background-color: #f5f5f5;border: 1px solid #ccc;border-radius: 4px;\">var foo = function(){<br/>&nbsp;&nbsp;&nbsp; var name = &quot;exe&quot;;<br/>&nbsp;&nbsp;&nbsp; console.log( 1 );<br/> <br/>&nbsp;&nbsp;&nbsp; return function inner(){<br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; console.log( name );<br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; console.log( 2 );<br/>&nbsp;&nbsp;&nbsp; }<br/>}<br/>//foo(); // console输出 1&nbsp; 最后返回一个 inner引用<br/>//console.log(foo()); // console输出 1&nbsp; function inner()<br/>//foo()(); // console输出&nbsp; 1&nbsp; exe&nbsp; 2&nbsp;&nbsp; foo()是inner的引用, foo()(); 执行了inner函数</p><p><strong>这一部分代码,是根据下面的文章后写的</strong></p><p style=\"padding: 9.5px;margin: 0 0 10px;font-size: 13px;color: #333;background-color: #f5f5f5;border: 1px solid #ccc;border-radius: 4px;\">function f1(){<br/>&nbsp;&nbsp;&nbsp; var n = 999;<br/> <br/>&nbsp;&nbsp;&nbsp; // nAdd 前没有使用var&nbsp; 所有nAdd是全局变量 , 同时匿名函数也是一个闭包<br/>&nbsp;&nbsp;&nbsp; // 所以nAdd相当于是一个setter,可以在函数外部对函数内部的局部变量进行操作。<br/>　　nAdd = function(){<br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; n += 1;<br/>&nbsp;&nbsp;&nbsp; }<br/> <br/>　　function f2(){<br/>　　　　alert(n);<br/>　　}<br/>　　return f2;<br/>}<br/>console.log( f1() ); // console输出 function f2()<br/>f1()(); // 执行了f2函数里面的 alert 999<br/>nAdd(); // 执行了 n += 1&nbsp; 现在n为1000<br/>f1()(); // var n = 999&nbsp;&nbsp; n = 999&nbsp; alert(999)<br/> <br/>var f3 = f1();&nbsp; // f3接收了 f2的引用&nbsp; f3实际上就是闭包f2函数(全局变量)<br/>f3(); // alert(999) , 往上找到f1中的n<br/>nAdd(); //&nbsp; 999+1 <br/>f3(); // alert(1000) , 往上找到f1中的n , 但此时n的值修改成了1000<br/> <br/>// f1中的局部变量n一直保存在内存中,并没有在f1结束后被清除&nbsp; why????<br/>// 原因就在于f1是f2的父函数,而f2被赋给了一个全局变量,这导致f2始终在内存中<br/>// 而f2的存在依赖于f1,因此f1也始终在内存中<br/>// 所以不会在调用结束后,被垃圾回收机制（garbage collection）回收。</p><p><br/> </p><p>转载一篇文章:&nbsp; <a href=\"http://www.ruanyifeng.com/blog/2009/08/learning_javascript_closures.html\" _src=\"http://www.ruanyifeng.com/blog/2009/08/learning_javascript_closures.html\">http://www.ruanyifeng.com/blog/2009/08/learning_javascript_closures.html</a><br/> </p><p><br/>闭包（closure）是Javascript语言的一个难点，也是它的特色，很多高级应用都要依靠闭包实现。<br/> <br/>下面就是我的学习笔记，对于Javascript初学者应该是很有用的。<br/> <br/>一、变量的作用域<br/> <br/>要理解闭包，首先必须理解Javascript特殊的变量作用域。<br/> <br/>变量的作用域无非就是两种：全局变量和局部变量。<br/> <br/>Javascript语言的特殊之处，就在于函数内部可以直接读取全局变量。<br/> <br/>&nbsp;&nbsp;&nbsp; 　　var n=999;<br/>&nbsp;&nbsp;&nbsp; 　　function f1(){<br/>&nbsp;&nbsp;&nbsp; 　　　　alert(n);<br/>&nbsp;&nbsp;&nbsp; 　　}<br/>&nbsp;&nbsp;&nbsp; 　　f1(); // 999<br/> <br/>另一方面，在函数外部自然无法读取函数内的局部变量。<br/> <br/>&nbsp;&nbsp;&nbsp; 　　function f1(){<br/>&nbsp;&nbsp;&nbsp; 　　　　var n=999;<br/>&nbsp;&nbsp;&nbsp; 　　}<br/>&nbsp;&nbsp;&nbsp; 　　alert(n); // error<br/> <br/>这里有一个地方需要注意，函数内部声明变量的时候，一定要使用var命令。如果不用的话，你实际上声明了一个全局变量！<br/> <br/>&nbsp;&nbsp;&nbsp; 　　function f1(){<br/>&nbsp;&nbsp;&nbsp; 　　　　n=999;<br/>&nbsp;&nbsp;&nbsp; 　　}<br/>&nbsp;&nbsp;&nbsp; 　　f1();<br/>&nbsp;&nbsp;&nbsp; 　　alert(n); // 999<br/> <br/>二、如何从外部读取局部变量？<br/> <br/>出于种种原因，我们有时候需要得到函数内的局部变量。但是，前面已经说过了，正常情况下，这是办不到的，只有通过变通方法才能实现。<br/> <br/>那就是在函数的内部，再定义一个函数。<br/> <br/>&nbsp;&nbsp;&nbsp; 　　function f1(){<br/>&nbsp;&nbsp;&nbsp; 　　　　var n=999;<br/>&nbsp;&nbsp;&nbsp; 　　　　function f2(){<br/>&nbsp;&nbsp;&nbsp; 　　　　　　alert(n); // 999<br/>&nbsp;&nbsp;&nbsp; 　　　　}<br/>&nbsp;&nbsp;&nbsp; 　　}<br/> <br/>在上面的代码中，函数f2就被包括在函数f1内部，这时f1内部的所有局部变量，对f2都是可见的。但是反过来就不行，f2内部的局部变量，对f1就是不可见的。这就是Javascript语言特有的&quot;链式作用域&quot;结构（chain scope），子对象会一级一级地向上寻找所有父对象的变量。所以，父对象的所有变量，对子对象都是可见的，反之则不成立。<br/> <br/>既然f2可以读取f1中的局部变量，那么只要把f2作为返回值，我们不就可以在f1外部读取它的内部变量了吗！<br/> <br/>&nbsp;&nbsp;&nbsp; 　　function f1(){<br/>&nbsp;&nbsp;&nbsp; 　　　　var n=999;<br/>&nbsp;&nbsp;&nbsp; 　　　　function f2(){<br/>&nbsp;&nbsp;&nbsp; 　　　　　　alert(n);<br/>&nbsp;&nbsp;&nbsp; 　　　　}<br/>&nbsp;&nbsp;&nbsp; 　　　　return f2;<br/>&nbsp;&nbsp;&nbsp; 　　}<br/>&nbsp;&nbsp;&nbsp; 　　var result=f1();<br/>&nbsp;&nbsp;&nbsp; 　　result(); // 999<br/> <br/>三、闭包的概念<br/> <br/>上一节代码中的f2函数，就是闭包。<br/> <br/>各种专业文献上的&quot;闭包&quot;（closure）定义非常抽象，很难看懂。我的理解是，闭包就是能够读取其他函数内部变量的函数。<br/> <br/>由于在Javascript语言中，只有函数内部的子函数才能读取局部变量，因此可以把闭包简单理解成&quot;定义在一个函数内部的函数&quot;。<br/> <br/>所以，在本质上，闭包就是将函数内部和函数外部连接起来的一座桥梁。<br/> <br/>四、闭包的用途<br/> <br/>闭包可以用在许多地方。它的最大用处有两个，一个是前面提到的可以读取函数内部的变量，另一个就是让这些变量的值始终保持在内存中。<br/> <br/>怎么来理解这句话呢？请看下面的代码。<br/> <br/>&nbsp;&nbsp;&nbsp; 　　function f1(){<br/>&nbsp;&nbsp;&nbsp; 　　　　var n=999;<br/>&nbsp;&nbsp;&nbsp; 　　　　nAdd=function(){n+=1}<br/>&nbsp;&nbsp;&nbsp; 　　　　function f2(){<br/>&nbsp;&nbsp;&nbsp; 　　　　　　alert(n);<br/>&nbsp;&nbsp;&nbsp; 　　　　}<br/>&nbsp;&nbsp;&nbsp; 　　　　return f2;<br/>&nbsp;&nbsp;&nbsp; 　　}<br/>&nbsp;&nbsp;&nbsp; 　　var result=f1();<br/>&nbsp;&nbsp;&nbsp; 　　result(); // 999<br/>&nbsp;&nbsp;&nbsp; 　　nAdd();<br/>&nbsp;&nbsp;&nbsp; 　　result(); // 1000<br/> <br/>在这段代码中，result实际上就是闭包f2函数。它一共运行了两次，第一次的值是999，第二次的值是1000。这证明了，函数f1中的局部变量n一直保存在内存中，并没有在f1调用后被自动清除。<br/> <br/>为什么会这样呢？原因就在于f1是f2的父函数，而f2被赋给了一个全局变量，这导致f2始终在内存中，而f2的存在依赖于f1，因此f1也始终在内存中，不会在调用结束后，被垃圾回收机制（garbage collection）回收。<br/> <br/>这段代码中另一个值得注意的地方，就是&quot;nAdd=function(){n+=1}&quot;这一行，首先在nAdd前面没有使用var关键字，因此nAdd是一个全局变量，而不是局部变量。其次，nAdd的值是一个匿名函数（anonymous function），而这个匿名函数本身也是一个闭包，所以nAdd相当于是一个setter，可以在函数外部对函数内部的局部变量进行操作。<br/> <br/>五、使用闭包的注意点<br/> <br/>1）由于闭包会使得函数中的变量都被保存在内存中，内存消耗很大，所以不能滥用闭包，否则会造成网页的性能问题，在IE中可能导致内存泄露。解决方法是，在退出函数之前，将不使用的局部变量全部删除。<br/> <br/>2）闭包会在父函数外部，改变父函数内部变量的值。所以，如果你把父函数当作对象（object）使用，把闭包当作它的公用方法（Public Method），把内部变量当作它的私有属性（private value），这时一定要小心，不要随便改变父函数内部变量的值。<br/> <br/>六、思考题<br/> <br/>如果你能理解下面两段代码的运行结果，应该就算理解闭包的运行机制了。<br/> <br/>代码片段一。<br/> <br/>&nbsp;&nbsp;&nbsp; 　　var name = &quot;The Window&quot;;<br/>&nbsp;&nbsp;&nbsp; 　　var object = {<br/>&nbsp;&nbsp;&nbsp; 　　　　name : &quot;My Object&quot;,<br/>&nbsp;&nbsp;&nbsp; 　　　　getNameFunc : function(){<br/>&nbsp;&nbsp;&nbsp; 　　　　　　return function(){<br/>&nbsp;&nbsp;&nbsp; 　　　　　　　　return this.name;<br/>&nbsp;&nbsp;&nbsp; 　　　　　　};<br/>&nbsp;&nbsp;&nbsp; 　　　　}<br/>&nbsp;&nbsp;&nbsp; 　　};<br/>&nbsp;&nbsp;&nbsp; 　　alert(object.getNameFunc()());<br/> <br/>代码片段二。<br/>&nbsp;&nbsp;&nbsp; 　　var name = &quot;The Window&quot;;<br/>&nbsp;&nbsp;&nbsp; 　　var object = {<br/>&nbsp;&nbsp;&nbsp; 　　　　name : &quot;My Object&quot;,<br/>&nbsp;&nbsp;&nbsp; 　　　　getNameFunc : function(){<br/>&nbsp;&nbsp;&nbsp; 　　　　　　var that = this;<br/>&nbsp;&nbsp;&nbsp; 　　　　　　return function(){<br/>&nbsp;&nbsp;&nbsp; 　　　　　　　　return that.name;<br/>&nbsp;&nbsp;&nbsp; 　　　　　　};<br/>&nbsp;&nbsp;&nbsp; 　　　　}<br/>&nbsp;&nbsp;&nbsp; 　　};<br/>&nbsp;&nbsp;&nbsp; 　　alert(object.getNameFunc()());<br/> <br/>（完） &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;&nbsp; <br/> </p>', '渣神', 'article/2018/05/20161206122153439.jpg', '2016-12-06 12:24:00.000000', '0', '1');
INSERT INTO `articles_article` VALUES ('6', 'linux下部署git环境和git的使用', 'linux下部署git环境和git的使用', '<p><span style=\"font-size: 16px;line-height: 27px\"></span></p><p>linux下部署git环境,和git命令的使用, window版的就不介绍了(作者在本地win8,github,腾讯云linux)<br/> </p><p>系统: CentOs7.2 php环境 部署git环境</p><p><strong>yum直接安装git</strong></p><p style=\"padding: 9.5px;margin: 0 0 10px;font-size: 13px;color: #333;background-color: #f5f5f5;border: 1px solid #ccc;border-radius: 4px;\">\r\n	yum install git</p><p><br/> </p><p><strong>设置username, email</strong></p><p style=\"padding: 9.5px;margin: 0 0 10px;font-size: 13px;color: #333;background-color: #f5f5f5;border: 1px solid #ccc;border-radius: 4px;\">\r\n	git config --global user.name &quot;enjoy-binbin&quot;<br/>git config --global user.email &quot;binloveplay1314@qq.com&quot;</p><p><br/> </p><p><strong>克隆远程仓库到本地<br/> </strong></p><p style=\"padding: 9.5px;margin: 0 0 10px;font-size: 13px;color: #333;background-color: #f5f5f5;border: 1px solid #ccc;border-radius: 4px;\">\r\n	git clone git@github.com:enjoy-binbin/blog<br/> </p><p><strong><br/> </strong></p><p><strong>到这里需要知道&nbsp; 工作区,暂存区,版本库这些概念了</strong></p><p><strong>工作区: 就是本地上 开发者的工作目录拉&nbsp; 当你git add -A 后,&nbsp;&nbsp;&nbsp; 就是将工作区的内容 add 进暂存区</strong></p><p><strong>暂存区</strong>: <strong>修改已被记录过的,&nbsp; 但是并没有录入版本库的区域 ,&nbsp; git commit -m &quot;&quot; 后,&nbsp; 进入版本库</strong></p><p><strong>版本库: 存储变化日志和版本信息</strong></p><p><strong>工作区 ---add&nbsp; ----&gt; 暂存区 ---commit ----&gt; 版本库&nbsp; --- push ----&gt; 远程仓库<br/> </strong></p><p><strong>最后,当 push 后, 会更新在 <strong>github</strong>远程仓库上的内容<br/> </strong></p><p><strong><br/> </strong></p><p><strong>所以一个标准的流程<br/> </strong></p><p style=\"padding: 9.5px;margin: 0 0 10px;font-size: 13px;color: #333;background-color: #f5f5f5;border: 1px solid #ccc;border-radius: 4px;\">\r\n	git add -f&nbsp; . <br/>git commit -m &quot;更新内容&quot;<br/>git push</p><p><strong>以后更新本地仓库(也可以直接 git pull)</strong></p><p style=\"padding: 9.5px;margin: 0 0 10px;font-size: 13px;color: #333;background-color: #f5f5f5;border: 1px solid #ccc;border-radius: 4px;\">\r\n	git remote -v<br/>git fetch origin master<br/>git merge</p><p>这里 origin 是本地分支&nbsp; master 是远程仓库分支名 <br/> </p><p>add 的时候使用 -f&nbsp;&nbsp; 强制将文件 add <br/> </p><p>merge是合并 两个 分支</p><p>&nbsp;&nbsp; <br/> </p><p><strong>总结一下git的常用命令<br/> </strong></p><p>git init&nbsp;&nbsp;&nbsp; // 初始化</p><p>git add -A&nbsp; //&nbsp; 参数: -f 强制&nbsp;&nbsp; -A 所有&nbsp;&nbsp;&nbsp; .&nbsp; 所有<br/> </p><p>git commit -m &quot;更新日志..&quot;&nbsp; // 提交commit<br/> </p><p>git push // push到远程仓库</p><p>git pull&nbsp;&nbsp; // pull到本地仓库<br/> </p><p>git reflog // 查看所有日志吧? git log<br/> </p><p>git log --pretty=oneline // 一行行查看日志 (版本号, commit信息)</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;HEAD 相当于 C的指针&nbsp; 一般指向当前最新的<br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;向HEAD 往后走5个版本<br/>git reset // &nbsp; git reset --hard HEAD^^^^^&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; git reset --hard 版本号<br/> </p><p>分支:<br/>git branch&nbsp; // &nbsp;查看所有分支<br/>git branch Name // 创建分支<br/>git checkout Name // 切换分支</p><p>git merge Name // 合并分支</p><p>git branch -d Name //&nbsp; 删除分支</p><p>一个例子:&nbsp; (先新建一个test分支, 在此分支上修改代码, 可行后, 切换master主分支 , 合并test分支)<br/>&nbsp;&nbsp; &nbsp;git branch test<br/>&nbsp;&nbsp; &nbsp;git checkout test</p><p>&nbsp;&nbsp;&nbsp; .....这里进行了很多代码修改代码实现</p><p>&nbsp;&nbsp;&nbsp; git add -A<br/>&nbsp;&nbsp; &nbsp;git commit -m &quot;test分支操作完成&quot;</p><p>&nbsp;&nbsp;&nbsp; git checkout master<br/>&nbsp;&nbsp; &nbsp;git merge test</p><p>&nbsp;分支的出现, 可以防止 污染 master主分支, 建议以后单操作, 建立一个新分支来操作最后再合并</p><p><br/> </p><p>远程仓库:<br/>git remote // 查看远程仓库<br/>git remote -v&nbsp; // 查看远程仓库地址 ,&nbsp; 出现中的&nbsp; origin&nbsp; 是默认本地仓库别名</p><p>git remote remove Name //&nbsp;删除仓库<br/>git remote add NickName https地址或者shh地址 // 为远程仓库添加一个别名&nbsp;&nbsp;&nbsp; <br/> </p><p>添加远程库<br/>&nbsp;&nbsp; &nbsp;git remote add myblog https://...<br/>&nbsp;&nbsp; &nbsp;git remote add myblog git@github.com:enjoy-binbin/blog.git<br/>push远程仓库时候, https是需要输入github账号密码的, ssh则不用</p><p>git push myblog master // 将本地myblog仓库push到远程master仓库</p><p><br/> </p><p>git stash: 备份当前的工作区的内容，从最近的一次提交中读取相关内容，让工作区保证和上次提交的内容一致。同时，将当前的工作区内容保存到Git栈中。<br/>git stash pop: 从Git栈中读取最近一次保存的内容，恢复工作区的相关内容。由于可能存在多个Stash的内容，所以用栈来管理，pop会从最近的一个stash中读取内容并恢复。<br/>git stash list: 显示Git栈内的所有备份，可以利用这个列表来决定从那个地方恢复。<br/>git stash clear: 清空Git栈。此时使用gitg等图形化工具会发现，原来stash的哪些节点都消失了。</p><p><br/> </p><p><strong><br/> </strong></p><p><strong>最后配置 shh 密钥公钥 , 免密登陆</strong><br/> </p><p style=\"padding: 9.5px;margin: 0 0 10px;font-size: 13px;color: #333;background-color: #f5f5f5;border: 1px solid #ccc;border-radius: 4px;\">\r\n	ssh-keygen -t rsa -C &quot;binloveplay1314@qq.com&quot;</p><p>这时会生成一个 ssh-key&nbsp; 一路默认回车<br/>最后生成密钥文件 默认放在&nbsp; /root/.ssh/id_rsa.pub<br/> <br/>cat打开,将里面的内容复制 <br/> <br/>进入github官网,登陆账号,打开设置<br/>左侧栏会有个 SSH and GPG keys <br/>New SSH key<br/>Title&nbsp; 标题<br/>Key&nbsp;&nbsp; 将复制的内容复制进去<br/> <br/>Add SSH key<br/>输入github密码 确认即可</p><p><strong>上述步骤完成后, linux终端下输入</strong></p><p style=\"padding: 9.5px;margin: 0 0 10px;font-size: 13px;color: #333;background-color: #f5f5f5;border: 1px solid #ccc;border-radius: 4px;\">\r\n	ssh -T git@github.com</p><p>出现 Hi enjoy-binbin! You&#39;ve successfully authenticated, but GitHub does not provide shell access.<br/> <br/>即成功, 有时候反应会迟钝, 确认步骤无误后, 可以等待几分钟后在试</p><p><br/> </p><p>写的好乱~~~ 也是本渣在本地上记的 散乱笔记 , 发现想要串起来也很麻烦 , 就这样了吧&nbsp; ~~<br/> </p><p>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; <br/> </p>', '渣神', 'article/2018/05/20161209224214942.jpg', '2016-12-09 22:44:00.000000', '0', '1');
INSERT INTO `articles_article` VALUES ('7', '大二第一学期和寒假', '大二第一学期和寒假', '<p><strong>\r\n &nbsp; &nbsp;		大二的第一学期也结束了,总结下这个学期吧</strong></p><p>这个学期学校社团方面,计算机协会留任了个技术部副部长,飞扬网管就退了,原因可能是感觉太累太耗费时间了,新的方面便是加入了学生团委的新媒体部,是由我部长舍友拉我进去的</p><p>\r\n	其实,我这个人有点怪,我自己说不清楚,可能接触我的人都知道,我不太喜欢和别人交流,和那种不熟识的人,其实人际交际这点我特佩服舒浩,他跟很多人都能聊的来玩的来。我就不太行</p><p>\r\n	感觉计算机协会留任是个错误的决定,当时我留任想着能够改变下协会内的那种吊郎当的氛围,其实我自己就是,哎呦。想着留任后能用自己的计算机方面的知识带带新人,顺便锻炼下自己。可是真留任后,发现自己是真的不行。前期就不行了,中后期我自己也明白了自己的缺点,也尝试的改变。但是时间已经过去了很多了。像我,刚那时,真不喜人。别人加我微信,我都不同意。这点我要对当时加我的师弟师妹说声抱歉,可能你们也看不到这篇文章。我写给自己。现在这方面的观念也渐渐的扭转过来了。</p><p>\r\n	但是我感觉计算机协会,我这个技术部副部长已经名存实亡了,我把带人,管理人的方面都推给了其他几个管理层,跟他们说就让我负责搞搞技术,这点很惭愧,其实一个学期也就帮协会写了个报修系统,和老虎一起写的,其他方面便没了。实话说,部门里的师弟们我都叫不出名字。</p><p>\r\n	反而在gis新媒体那,活跃度比较高。这可能是管理层的问题吧,新媒体那的管理层,一个个都非常的善于交际,而且可能是大团,所以招的人也是很有质量,这样的良性循环中,让部门越来越好。我在里面担任了技术组代码组里的一个师兄,平常写写代码。但是关键我还跟技术组里面的师弟师妹不太熟。反而跟资源组中的几个人熟悉,感叹到他们的人际交往是真的好,人也好,所以我也好。开端都是从去年圣诞节平安夜那会开始的,小师弟师妹们给我送了礼物。</p><p>\r\n	实话说,那感觉很棒,我现在嘴角微微上扬,我他么竟然也有人送礼物。那时我很开心,感觉到了部门内的那种感觉,自那以后,我也就开始在群里面聊天吹水,这样的循环中,我感觉自己变了很多。也收获到了很多技术之外的东西。 这点我非常感谢他们。</p><p>\r\n	大二第一学期这段就写到这了吧。诶对了,我没挂科。 哈哈哈啊哈,还考了个四级。感觉能过。出成绩的那会,如果过了我就写篇文章吹吹牛皮。没过就不写了吧。哈哈哈啊啊感觉能过</p><p><strong>\r\n		寒假开始拉</strong></p><p>\r\n	现在是17年的1月23日的 11.07分。 大二第一学期后的寒假,寒假我给自己定的目标挺高的,就是不停的学学学,之前在学校的第一学期,在学习路上迷路,感受到了迷惘,当时就感觉什么都学不了,现在这年头也换了过来,生活还得继续</p><p>\r\n	这个寒假,发生了一件事情。我外公去世了,我也终于体验过一次生死离别。17号中午赶上见的外公最后一面,见过后的一个钟外公便走了。这里我就不多说了,那天的下午我写了点东西发了微信朋友圈,这里便不说了。生命的脆弱</p><p>\r\n	17号的晚上,我发朋友圈后的晚上,有个姑娘来安慰我。她说了一段话,我保存在手机的备忘录中了,也发了条仅自己可见的朋友圈记着。我感觉我有点喜欢上她了,她也的确很漂亮和优秀。只是我感觉我自己不行,哎。实话,我很想在大学谈次恋爱。只是我的情商是真的不高。奔跑吧我的渣神。</p><p>\r\n	寒假开始的9号到17号期间,我应舒浩的任务安排。去研究了微信的小程序,这段时间内也一直在学习小程序,写小程序的代码。当然也是和老虎。中间发生了很多不开心的事情,出bug什么的,真的是头疼。基于华商gis公众号开发的小程序,完成了对学生课表 成绩 交通出行的查询。 我负责了整个的交通出行,和局部的成绩查询,其余剩下的部分是老虎完成的。</p><p>\r\n	寒假也过去了半个月了。也经历了很多事情。我还是会好好的,move forward\r\n	加油奔跑吧。我的渣神\r\n	缩略图用了个我很喜欢的壁纸,加油吧希望我也能像壁纸所说。</p>', '彬彬', 'article/2018/05/20161205191122578.jpg', '2017-01-23 11:20:00.000000', '0', '8');
INSERT INTO `articles_article` VALUES ('8', 'html+css+js完成别踩白块', '纯前端完成的一个 别踩白块，网页版游戏', '<h1 class=\"ue_t\" label=\"Title center\" name=\"tc\" style=\"border-bottom-color:#cccccc;border-bottom-width:2px;border-bottom-style:solid;padding:0px 4px 0px 0px;text-align:center;margin:0px 0px 20px;\"><span style=\"color:#c0504d;\">别踩白块网页版</span></h1><p style=\"text-align:center;\"><strong class=\"ue_t\">html+css+js完成一个别踩白块网页版游戏</strong></p><h3><span class=\"ue_t\" style=\"font-family:幼圆\">思路(from 十八哥):</span></h3><p style=\"text-indent:2em;\">首先有一个main,里面有个container容器,然后container里面有5个row<br/>&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; 实现是: 下面4个row显示,上面1个row溢出隐藏,实现无缝滚动。其实轮播图也是这样做的<br/>&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; 因为con的top为 -100px 所以有一个row超出了main&nbsp; 需要 overfloat:hidden;<br/>&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; 将con的top 逐渐从 -100 增加到 0 完成块的无缝滚动<br/>&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; con的背景颜色为 white <br/>&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; 初始化: 创建 4个row&nbsp; 每一个row 中 规定 一个cell.black 则有一个黑块<br/>&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; 移动: 将con的top 逐渐从 -100 增加到 0 而后又置为 -100<br/>&nbsp;&nbsp; &nbsp; &nbsp; 同时drow 删除最后一行的row<br/>&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; 后续: judge判断胜负 fail输出失败信息 score计算分数 start开始按钮</p><h3><span style=\"font-family:幼圆\">index.html</span></h3><p style=\"text-indent:2em;\"></p><h3><span style=\"font-family:幼圆\">index.css</span></h3><pre class=\"brush:css;toolbar:false\">body{\r\n&nbsp;&nbsp;&nbsp;&nbsp;background:&nbsp;#333;\r\n&nbsp;&nbsp;&nbsp;&nbsp;/*&nbsp;防止文本被选中插件&nbsp;*/\r\n&nbsp;&nbsp;&nbsp;&nbsp;-moz-user-select:none;/*火狐*/\r\n&nbsp;&nbsp;&nbsp;&nbsp;-webkit-user-select:none;/*webkit浏览器*/\r\n&nbsp;&nbsp;&nbsp;&nbsp;-ms-user-select:none;/*IE10*/\r\n&nbsp;&nbsp;&nbsp;&nbsp;-khtml-user-select:none;/*早期浏览器*/\r\n&nbsp;&nbsp;&nbsp;&nbsp;user-select:none;\r\n}\r\n#main{\r\n&nbsp;&nbsp;&nbsp;&nbsp;width:&nbsp;400px;\r\n&nbsp;&nbsp;&nbsp;&nbsp;height:&nbsp;400px;\r\n&nbsp;&nbsp;&nbsp;&nbsp;margin:&nbsp;0&nbsp;auto;\r\n&nbsp;&nbsp;&nbsp;&nbsp;position:&nbsp;relative;\r\n&nbsp;&nbsp;&nbsp;&nbsp;overflow:&nbsp;hidden;\r\n&nbsp;&nbsp;&nbsp;&nbsp;background:&nbsp;white;\r\n&nbsp;&nbsp;&nbsp;&nbsp;border:&nbsp;2px&nbsp;solid&nbsp;black;\r\n}\r\n#container{\r\n&nbsp;&nbsp;&nbsp;&nbsp;width:&nbsp;100%;\r\n&nbsp;&nbsp;&nbsp;&nbsp;height:&nbsp;400px;\r\n&nbsp;&nbsp;&nbsp;&nbsp;position:&nbsp;relative;\r\n&nbsp;&nbsp;&nbsp;&nbsp;top:&nbsp;-100px;\r\n}\r\n.row{\r\n&nbsp;&nbsp;&nbsp;&nbsp;width:&nbsp;100%;\r\n&nbsp;&nbsp;&nbsp;&nbsp;height:&nbsp;100px;\r\n}\r\n.cell{\r\n&nbsp;&nbsp;&nbsp;&nbsp;width:&nbsp;100px;\r\n&nbsp;&nbsp;&nbsp;&nbsp;height:&nbsp;100px;\r\n&nbsp;&nbsp;&nbsp;&nbsp;float:&nbsp;left;\r\n}\r\n.black{\r\n&nbsp;&nbsp;&nbsp;&nbsp;background:&nbsp;black;\r\n}\r\n#top{\r\n&nbsp;&nbsp;&nbsp;&nbsp;text-align:&nbsp;center;\r\n}\r\np{\r\n&nbsp;&nbsp;&nbsp;&nbsp;margin:&nbsp;10px;\r\n&nbsp;&nbsp;&nbsp;&nbsp;padding:&nbsp;0;\r\n}\r\n#top&nbsp;#score{\r\n&nbsp;&nbsp;&nbsp;&nbsp;font-size:&nbsp;30px;\r\n&nbsp;&nbsp;&nbsp;&nbsp;color:&nbsp;#abcdef;\r\n}\r\n#top&nbsp;#hint{\r\n&nbsp;&nbsp;&nbsp;&nbsp;font-size:&nbsp;20px;\r\n&nbsp;&nbsp;&nbsp;&nbsp;color:&nbsp;red;\r\n}</pre><h3><span style=\"font-family:幼圆\">js</span></h3><pre class=\"brush:js;toolbar:false\">&nbsp;&nbsp;&nbsp;&nbsp;/*&nbsp;一些全局变量&nbsp;*/\r\n&nbsp;&nbsp;&nbsp;&nbsp;var&nbsp;speed&nbsp;=&nbsp;3;&nbsp;//速度默认为3\r\n&nbsp;&nbsp;&nbsp;&nbsp;var&nbsp;clock&nbsp;=&nbsp;null;&nbsp;//&nbsp;定时器\r\n&nbsp;&nbsp;&nbsp;&nbsp;var&nbsp;state&nbsp;=&nbsp;0;&nbsp;//&nbsp;0初始化&nbsp;1进行中&nbsp;2暂停&nbsp;3失败\r\n&nbsp;&nbsp;&nbsp;&nbsp;var&nbsp;con&nbsp;=&nbsp;document.getElementById(&#39;container&#39;);&nbsp;//&nbsp;获得con对象\r\n&nbsp;&nbsp;&nbsp;&nbsp;var&nbsp;hint&nbsp;=&nbsp;document.getElementById(&#39;hint&#39;);&nbsp;//&nbsp;获得hint对象\r\n\r\n&nbsp;&nbsp;&nbsp;&nbsp;/*\r\n&nbsp;&nbsp;&nbsp;&nbsp;**游戏初始化\r\n&nbsp;&nbsp;&nbsp;&nbsp;*/\r\n&nbsp;&nbsp;&nbsp;&nbsp;function&nbsp;init(){\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;for(var&nbsp;a=0;&nbsp;a&lt;4;a++)\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;crow();\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;document.getElementById(&#39;start&#39;).onclick&nbsp;=&nbsp;function(ev){\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;start();\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;document.getElementById(&#39;restart&#39;).onclick&nbsp;=&nbsp;function(ev){\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;restart();\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}\r\n&nbsp;&nbsp;&nbsp;&nbsp;}\r\n&nbsp;&nbsp;&nbsp;&nbsp;/*\r\n&nbsp;&nbsp;&nbsp;&nbsp;**创建div\r\n&nbsp;&nbsp;&nbsp;&nbsp;**param&nbsp;div的类名\r\n&nbsp;&nbsp;&nbsp;&nbsp;*/\r\n&nbsp;&nbsp;&nbsp;&nbsp;function&nbsp;cdiv(className){\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;var&nbsp;div&nbsp;=&nbsp;document.createElement(&#39;div&#39;);\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;div.className&nbsp;=&nbsp;className;\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;return&nbsp;div;\r\n&nbsp;&nbsp;&nbsp;&nbsp;}\r\n\r\n&nbsp;&nbsp;&nbsp;&nbsp;/*\r\n&nbsp;&nbsp;&nbsp;&nbsp;**创建div.row&nbsp;一行包着4个div.cell\r\n&nbsp;&nbsp;&nbsp;&nbsp;*/\r\n&nbsp;&nbsp;&nbsp;&nbsp;function&nbsp;crow(){\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;var&nbsp;row&nbsp;=&nbsp;cdiv(&#39;row&#39;);\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;var&nbsp;classes&nbsp;=&nbsp;createSn();//&nbsp;获取cell类名\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;for(var&nbsp;i&nbsp;=&nbsp;0&nbsp;;&nbsp;i&nbsp;&lt;&nbsp;4&nbsp;;&nbsp;i++){&nbsp;//&nbsp;创建4个cell\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;var&nbsp;cell&nbsp;=&nbsp;cdiv(classes[i]);\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;row.appendChild(cell);\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;//&nbsp;创建row\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;if(con.firstChild&nbsp;==&nbsp;null)\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;//&nbsp;如果con的第一个child为空\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;//&nbsp;追加一个新的row\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;con.appendChild(row);\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;else\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;//&nbsp;否则将创建的新的row\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;//&nbsp;追加到第一个row的上面\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;con.insertBefore(row,con.firstChild);\r\n&nbsp;&nbsp;&nbsp;&nbsp;}\r\n\r\n&nbsp;&nbsp;&nbsp;&nbsp;/*\r\n&nbsp;&nbsp;&nbsp;&nbsp;**&nbsp;删除最后一行row\r\n&nbsp;&nbsp;&nbsp;&nbsp;**&nbsp;前四行显示在屏幕上&nbsp;,&nbsp;第五行在最上面\r\n&nbsp;&nbsp;&nbsp;&nbsp;**&nbsp;当第六行出现,删除屏幕上的最后一行&nbsp;\r\n&nbsp;&nbsp;&nbsp;&nbsp;*/\r\n&nbsp;&nbsp;&nbsp;&nbsp;function&nbsp;drow(){\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;if(con.childNodes.length&nbsp;==&nbsp;6)\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;con.removeChild(con.lastChild);\r\n&nbsp;&nbsp;&nbsp;&nbsp;}\r\n\r\n&nbsp;&nbsp;&nbsp;&nbsp;/*\r\n&nbsp;&nbsp;&nbsp;&nbsp;**创建cell的类&nbsp;并随机一个black\r\n&nbsp;&nbsp;&nbsp;&nbsp;**return&nbsp;array&nbsp;&nbsp;里面是类的名字\r\n&nbsp;&nbsp;&nbsp;&nbsp;*/\r\n&nbsp;&nbsp;&nbsp;&nbsp;function&nbsp;createSn(){\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;var&nbsp;arr&nbsp;=&nbsp;[&#39;cell&#39;,&#39;cell&#39;,&#39;cell&#39;,&#39;cell&#39;];\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;var&nbsp;i&nbsp;=&nbsp;Math.floor(Math.random()*4);\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;arr[i]&nbsp;=&nbsp;&#39;cell&nbsp;black&#39;;//&nbsp;随机一个黑块\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;return&nbsp;arr;\r\n&nbsp;&nbsp;&nbsp;&nbsp;}\r\n\r\n&nbsp;&nbsp;&nbsp;&nbsp;/*\r\n&nbsp;&nbsp;&nbsp;&nbsp;**控制木块移动\r\n&nbsp;&nbsp;&nbsp;&nbsp;*/\r\n&nbsp;&nbsp;&nbsp;&nbsp;function&nbsp;move(){\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;//getComputedStyle是一个可以获取当前元素所有最终使用的CSS属性值。\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;//返回的是一个CSS样式声明对象([object&nbsp;CSSStyleDeclaration])，只读\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;//console.log(window.getComputedStyle(con,null))\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;var&nbsp;top&nbsp;=&nbsp;parseInt(window.getComputedStyle(con,null)[&#39;top&#39;]);\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;//console.log(top);\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;if(speed&nbsp;+&nbsp;top&nbsp;&gt;&nbsp;0)\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;top&nbsp;=&nbsp;0;&nbsp;//&nbsp;一步都过头的情况\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;else&nbsp;\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;top&nbsp;+=&nbsp;speed;\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;con.style.top&nbsp;=&nbsp;top&nbsp;+&nbsp;&#39;px&#39;;\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;if(top&nbsp;==&nbsp;0){\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;crow();&nbsp;//&nbsp;创建一个row\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;con.style.top&nbsp;=&nbsp;&#39;-100px&#39;;&nbsp;//&nbsp;top为0时,再将top往上提100px\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;drow();&nbsp;//&nbsp;删除最后一个row\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}else&nbsp;if(top&nbsp;==&nbsp;(-100&nbsp;+&nbsp;speed)&nbsp;){\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;var&nbsp;rows&nbsp;=&nbsp;con.childNodes;\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;//&nbsp;如果有五行row&nbsp;且最后一行的pass&nbsp;!=1&nbsp;判断为输\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;if(&nbsp;(rows.length==5)&nbsp;&amp;&amp;&nbsp;(rows[rows.length-1].pass&nbsp;!=1)&nbsp;){\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;//console.log(rows);&nbsp;这边要小心rows中有文字节点删除空格\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;fail();\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}\r\n&nbsp;&nbsp;&nbsp;&nbsp;}\r\n\r\n&nbsp;&nbsp;&nbsp;&nbsp;/*\r\n&nbsp;&nbsp;&nbsp;&nbsp;**&nbsp;判断黑白\r\n&nbsp;&nbsp;&nbsp;&nbsp;*/\r\n&nbsp;&nbsp;&nbsp;&nbsp;function&nbsp;judge(ev){\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;if(state&nbsp;==&nbsp;3){\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;hint.innerHTML&nbsp;=&nbsp;&#39;失败了&#39;;\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;return;\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;//console.log(ev);\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;//&nbsp;indexOf&nbsp;返回某个指定的字符串值在字符串中首次出现的位置。\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;if(ev.target.className.indexOf(&#39;black&#39;)&nbsp;==&nbsp;-1)\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;fail();&nbsp;//&nbsp;要是没找到则点击的为白块,so失败\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;else{\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;ev.target.className&nbsp;=&nbsp;&#39;cell&#39;;&nbsp;//&nbsp;将黑块变为白块\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;ev.target.parentNode.pass&nbsp;=&nbsp;1;&nbsp;//&nbsp;parent为&nbsp;div.row\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;score();\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}&nbsp;&nbsp;&nbsp;&nbsp;\r\n&nbsp;&nbsp;&nbsp;&nbsp;}\r\n\r\n&nbsp;&nbsp;&nbsp;&nbsp;/*\r\n&nbsp;&nbsp;&nbsp;&nbsp;**&nbsp;失败\r\n&nbsp;&nbsp;&nbsp;&nbsp;*/\r\n&nbsp;&nbsp;&nbsp;&nbsp;function&nbsp;fail(){\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;clearInterval(clock);&nbsp;//&nbsp;清楚定时器\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;state&nbsp;=&nbsp;3;&nbsp;//&nbsp;设置状态\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;//alert(&#39;游戏结束了&#39;);\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;hint.innerHTML&nbsp;=&nbsp;&#39;失败了&#39;;\r\n&nbsp;&nbsp;&nbsp;&nbsp;}\r\n\r\n&nbsp;&nbsp;&nbsp;&nbsp;/*\r\n&nbsp;&nbsp;&nbsp;&nbsp;**&nbsp;计分\r\n&nbsp;&nbsp;&nbsp;&nbsp;*/\r\n&nbsp;&nbsp;&nbsp;&nbsp;function&nbsp;score(){\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;var&nbsp;score&nbsp;=&nbsp;parseInt(document.getElementById(&#39;score&#39;).innerHTML);\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;var&nbsp;newscore&nbsp;=&nbsp;score&nbsp;+&nbsp;1;\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;document.getElementById(&#39;score&#39;).innerHTML&nbsp;=&nbsp;newscore;\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;if(&nbsp;newscore&nbsp;%&nbsp;10&nbsp;==&nbsp;0&nbsp;)&nbsp;//&nbsp;每10分加一次速度\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;speedUp();\r\n&nbsp;&nbsp;&nbsp;&nbsp;}\r\n\r\n&nbsp;&nbsp;&nbsp;&nbsp;/*\r\n&nbsp;&nbsp;&nbsp;&nbsp;**&nbsp;加速\r\n&nbsp;&nbsp;&nbsp;&nbsp;*/\r\n&nbsp;&nbsp;&nbsp;&nbsp;function&nbsp;speedUp(){\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;speed&nbsp;+=&nbsp;2;\r\n&nbsp;&nbsp;&nbsp;&nbsp;}\r\n\r\n&nbsp;&nbsp;&nbsp;&nbsp;/*&nbsp;开始游戏&nbsp;*/\r\n&nbsp;&nbsp;&nbsp;&nbsp;function&nbsp;start(){\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;if(state&nbsp;==&nbsp;3){\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;hint.innerHTML&nbsp;=&nbsp;&#39;请重新开始下一局..&#39;;\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;return;\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;//&nbsp;定时器&nbsp;30ms运行一次move()\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;clock&nbsp;=&nbsp;window.setInterval(&#39;move()&#39;,30);\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;//&nbsp;给main增加一个click事件,并且将event传入judge\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;document.getElementById(&#39;main&#39;).onclick&nbsp;=&nbsp;function(ev){\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;judge(ev);\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}\r\n&nbsp;&nbsp;&nbsp;&nbsp;}\r\n\r\n&nbsp;&nbsp;&nbsp;&nbsp;function&nbsp;restart(){\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;location.reload(true);\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;//start();\r\n&nbsp;&nbsp;&nbsp;&nbsp;}\r\n\r\n&nbsp;&nbsp;&nbsp;&nbsp;init();</pre><p><br/></p><p><a name=\"Top\"></a><br/></p>', '彬彬', 'article/2018/05/20170126225143660.png', '2017-01-26 22:52:00.000000', '0', '6');
INSERT INTO `articles_article` VALUES ('9', 'Centos7.2 Apache2.4 配置https ssl证书', 'Centos7.2 Apache2.4 配置https ssl证书', '<h2 style=\"border-bottom-color:#cccccc;border-bottom-width:2px;border-bottom-style:solid;padding:0px 4px 0px 0px;margin:0px 0px 10px;text-align:center;\" class=\"ue_t\">Centos7.2 Apache2.4 配置https ssl证书</h2><p><strong><span style=\"font-size:12px;\">摘要</span></strong><span style=\"font-size:12px;\" class=\"ue_t\">：由于前面寒假大部分时间用来研究了微信小程序,里面的request只能发送https请求,现在有空也将自己服务器配置成了https<br/> </span></p><p><span style=\"font-size:12px;\" class=\"ue_t\"><img src=\"http://img.baidu.com/hi/tsj/t_0038.gif\"/>&nbsp;&nbsp;&nbsp;&nbsp;</span></p><p style=\"line-height:1.5em;\"><strong>1. 证书获取</strong></p><p style=\"text-indent:2em;\"><span style=\"font-size:14px;\">腾讯免费ssl证书获取</span></p><p style=\"text-indent:2em;\"><span style=\"font-size:14px;\">https://www.qcloud.com/product/ssl</span></p><p style=\"text-indent:2em;\"><span style=\"font-size:14px;\">立即使用-&gt;申请证书(免费版DVSSL证书 一年申请一次即可)<br/>&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;-&gt;填写信息(域名,邮箱,备注名一般也为域名即可) 其他不用填-&gt; 下一步<br/>&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;-&gt; 等待五分钟左右(因为我是腾讯云服务器,所以他会自己自动配置好域名解析信息)<br/>&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;如果是其他服务器,就请读者自己百度吧。。<br/>&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;五分钟左右申请通过,域名解析信息也帮你配好了<br/>&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;将证书下载到本地<br/>&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;解压后有三个文件夹,对应不同服务器<br/>&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;将apache目录下的三个文件 复制到 服务器上 /etc/httpd/conf 下(这个可以自己决定存放位置)</span></p><p style=\"text-indent:2em;\"><span style=\"font-size:14px;\"><br/> </span></p><p style=\"line-height:1.5em;\"><strong>2. 配置ssl</strong></p><p style=\"text-indent:2em;\"><span style=\"font-size:14px;\">参考&nbsp;&nbsp;&nbsp;&nbsp; <a href=\"https://www.qcloud.com/document/product/400/4143)\" _src=\"https://www.qcloud.com/document/product/400/4143)\">https://www.qcloud.com/document/product/400/4143</a><br/> </span></p><p style=\"text-indent:2em;\"><span style=\"font-size:14px;\"> 2.1 安装ssl</span></p><pre class=\"brush:php;toolbar:false\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;yum&nbsp;list&nbsp;all&nbsp;mod_ssl&nbsp;\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;yum&nbsp;install&nbsp;-y&nbsp;mod_ssl</pre><p style=\"text-indent:2em;\"><span style=\"font-size:14px;\"></span>&nbsp;&nbsp;&nbsp;&nbsp;安装后apache会自动引入ssl模块</p><pre class=\"brush:groovy;toolbar:false\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;rpm&nbsp;-qc&nbsp;mod_ssl</pre><p style=\"text-indent:2em;\">&nbsp;&nbsp;&nbsp;&nbsp;/etc/httpd/conf.d/ssl.conf 即为ssl配置文件</p><p style=\"text-indent:2em;\">2.2 配置ssl</p><pre class=\"brush:erlang;toolbar:false\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;cd&nbsp;/etc/httpd/conf.d\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;cp&nbsp;ssl.conf&nbsp;./ssl.conf.0202.bak\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;vi&nbsp;ssl.conf&nbsp;#(或者用外部编辑器打开)</pre><p style=\"text-indent:2em;\">&nbsp;&nbsp;&nbsp;&nbsp;下面的配置我都建议在原来的基础上 复制新的一行,将上行注释并写点说明信息(如时间)</p><pre class=\"brush:erlang;toolbar:false\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;59行&nbsp;取消这两行的注释#\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#DocumentRoot&nbsp;&quot;/var/www/html&quot;\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#ServerName&nbsp;www.example.com:443\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#&nbsp;2017年2月2日&nbsp;01:03:53&nbsp;修改\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;DocumentRoot&nbsp;&quot;/var/www/html&quot;\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;ServerName&nbsp;www.example.com:443\r\n\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;##&nbsp;下面这三个文件根据自己前面下载的证书放置(&nbsp;我将其放在了etc/httpd/conf下)\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;100行&nbsp;SSLCertificateFile&nbsp;/etc/pki/tls/certs/localhost.crt\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;SSLCertificateFile&nbsp;/etc/httpd/conf/2_www.zz-bin.cn.crt\r\n\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;107行&nbsp;SSLCertificateKeyFile&nbsp;/etc/pki/tls/private/localhost.key\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;SSLCertificateKeyFile&nbsp;/etc/httpd/conf/3_www.zz-bin.cn.key\r\n\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;116行&nbsp;#SSLCertificateChainFile&nbsp;/etc/pki/tls/certs/server-chain.crt\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;SSLCertificateChainFile&nbsp;/etc/httpd/conf/1_root_bundle.crt</pre><p style=\"text-indent:2em;\"><span style=\"font-size:14px;\" class=\"ue_t\"> </span><br/> </p><p style=\"line-height:1.5em;\"><strong>3.&nbsp; 重启apache<br/> </strong></p><pre class=\"brush:delphi;toolbar:false\">&nbsp;&nbsp;&nbsp;&nbsp;systemctl&nbsp;restart&nbsp;httpd</pre><p><br/> </p><p><strong>4.&nbsp; 访问 https 域名成功</strong><br/> </p><p><img src=\"http://img.baidu.com/hi/tsj/t_0040.gif\"/> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; <br/> </p>', '渣神', 'article/2018/05/20170202230039982.jpg', '2017-02-02 01:31:00.000000', '0', '1');
INSERT INTO `articles_article` VALUES ('10', '设置http自动跳转到https', '设置http自动跳转到https', '<h2 style=\"border-bottom-color:#cccccc;border-bottom-width:2px;border-bottom-style:solid;padding:0px 4px 0px 0px;margin:0px 0px 10px;text-align:center;\" class=\"ue_t\">设置http自动跳转到https</h2><p><strong><span style=\"font-size:12px;\">摘要</span></strong><span style=\"font-size:12px;\" class=\"ue_t\">：如何设置http自动跳转到https? 将所有来自http请求的转发到https<br/> </span></p><p><span style=\"font-size:12px;\" class=\"ue_t\"><br/> </span></p><p style=\"line-height:1.5em;\"><strong>基础知识<br/> </strong></p><p style=\"text-indent:2em;\"><span style=\"font-size:14px;\">默认下: apache监听着80端口, https的监听着443端口, ssl.conf内有ssl模块的详细配置信息<br/> </span></p><p style=\"text-indent:2em;\"><span style=\"font-size:14px;\"><a href=\"http://www.zz-bin.cn:80\" _src=\"http://www.zz-bin.cn:80\">http://www.zz-bin.cn:80</a> &nbsp; &nbsp; &nbsp; &nbsp; <br/> </span></p><p style=\"text-indent:2em;\"><span style=\"font-size:14px;\"><a href=\"https://www.zz-bin.cn:443\" _src=\"https://www.zz-bin.cn:443\">https://www.zz-bin.cn:443</a><br/> </span></p><p style=\"text-indent:2em;\"><span style=\"font-size:14px;\">我之前有尝试将 博客系统单独的 独立出来, 在apahce内做个虚拟主机 ， 其实也算成功了. 只是 https 请求发送的时候 这两个请求对应的 目录不同， 在 ssl.conf 中有个 配置信息 DocumentRoot 即是指定 443端口进来后的目录.&nbsp; 默认和 apache设置的&nbsp; var/www/html 一样&nbsp; 这个配置也可以设置到 ..../html/blog 。 只是这样又发现了一个弊端, 因为自己服务器上也夹杂着各种奇怪的&nbsp; 实验应用&nbsp; 这样将目录写成blog 会出现很多问题 。 于是乎便放弃了<br/> </span></p><p style=\"text-indent:2em;\"><span style=\"font-size:14px;\"><br/> </span></p><p style=\"line-height:1.5em;\"><strong>跳转</strong></p><p style=\"text-indent:2em;\"><span style=\"font-size:14px;\">apache环境下, http访问跳转到https 需要实现 url重定向：</span></p><p style=\"text-indent:2em;\"><span style=\"font-size:14px;\">因为我在很久前便完成了这一步, 而laravel也是需要rewrite&nbsp; 这边无法实时的更新便不写了</span></p><p style=\"text-indent:2em;\"><span style=\"font-size:14px;\">摘一段百度来的 信息 , 如有不会请百度<br/> </span></p><pre class=\"brush:html;toolbar:false\">打开url重定向支持\r\n1）打开Apache/conf/httpd.conf，找到&nbsp;#LoadModule&nbsp;rewrite_module&nbsp;modules/mod_rewrite.so&nbsp;去掉#号\r\n2）找到你网站目录的&lt;Directory&gt;段，比如我的网站目录是c:/www，找到\r\n&lt;Directory&nbsp;“C:/www”&gt;\r\n…\r\n&lt;/Directory&gt;\r\n修改其中的&nbsp;AllowOverride&nbsp;None&nbsp;为&nbsp;AllowOverride&nbsp;All\r\n3）重启apache</pre><p style=\"text-indent:2em;\"><span style=\"font-size:14px;\"></span><br/> </p><p style=\"line-height:1.5em;\"><strong>设置重定向规则<br/> </strong></p><p style=\"text-indent:2em;\"><span style=\"font-size:14px;\" class=\"ue_t\">.htaccess 写过一点东西的人应该都知道这么一个文件, laravel项目下也会有</span></p><p style=\"text-indent:2em;\"><span style=\"font-size:14px;\" class=\"ue_t\">在这个文件下 设置重定向规则</span></p><p style=\"text-indent:2em;\"><span style=\"font-size:14px;\" class=\"ue_t\">. 打头的文件在linux下为隐藏文件,&nbsp; 在win下无法直接创建&nbsp; 这样名字不合法的文件</span></p><p style=\"text-indent:2em;\"><span style=\"font-size:14px;\" class=\"ue_t\">win下的操作是&nbsp;&nbsp; 新建文本文档, 另存为 . 所有文件　名字为 .htaccess 即可</span></p><p style=\"text-indent:2em;\"><span style=\"font-size:14px;\" class=\"ue_t\"><br/> </span></p><p style=\"text-indent:2em;\"><span style=\"font-size:14px;\" class=\"ue_t\">编辑 .htaccess 写入如下规则（运用了正则）<br/> </span></p><pre class=\"brush:java;toolbar:false\">&nbsp;&nbsp;&nbsp;&nbsp;RewriteEngine&nbsp;on\r\n&nbsp;&nbsp;&nbsp;&nbsp;RewriteCond&nbsp;%{SERVER_PORT}&nbsp;!^443$\r\n&nbsp;&nbsp;&nbsp;&nbsp;RewriteCond&nbsp;%{REQUEST_URI}&nbsp;!^/index.html\r\n&nbsp;&nbsp;&nbsp;&nbsp;RewriteRule&nbsp;(.*)&nbsp;https://%{SERVER_NAME}/$1&nbsp;[R]</pre><p style=\"text-indent:2em;\"><span style=\"font-size:14px;\" class=\"ue_t\"></span>将 .htaccess 放在apache内的目录&nbsp; /var/www/html 下即可</p><p style=\"text-indent:2em;\"><br/> </p><p style=\"text-indent:2em;\">解释:</p><p style=\"text-indent:2em;\">&nbsp;&nbsp;&nbsp; 如果访问的 url地址&nbsp;&nbsp; 不是443端口&nbsp; 或者&nbsp; 不是访问的 index.html&nbsp;&nbsp; 则应用 RewriteRule重写规则</p><p style=\"text-indent:2em;\">这样便实现了&nbsp; 访问&nbsp;&nbsp; http:<a href=\"http://www.zz-bin.cn\" _src=\"http://www.zz-bin.cn\">www.zz-bin.cn</a>&nbsp; 会自动跳转到 &nbsp; <a href=\"https://www.zz-bin.cn\" _src=\"https://www.zz-bin.cn\">https://www.zz-bin.cn</a><br/> </p><p style=\"text-indent:2em;\">而访问&nbsp; http:<a href=\"http://www.zz-bin.cn/index.html\" _src=\"http://www.zz-bin.cn/index.html\">www.zz-bin.cn/index.html</a>&nbsp; 则不会跳转&nbsp; 当然这个地址也可以使用　https访问 <br/> </p><p style=\"text-indent: 2em;\"><br/> </p><p>&nbsp;&nbsp;&nbsp;&nbsp;End &nbsp;&nbsp;&nbsp; <br/> </p>', '渣神', 'article/2018/05/20170202230039982_pnfoJjI.jpg', '2017-02-02 23:22:00.000000', '1', '1');
INSERT INTO `articles_article` VALUES ('11', 'Centos7.2下 源码编译安装 lnmp环境( 上 )', 'Centos7.2下 源码编译安装 lnmp环境', '<h1 label=\"Title center\" name=\"tc\" style=\"border-bottom-color:#cccccc;border-bottom-width:2px;border-bottom-style:solid;padding:0px 4px 0px 0px;text-align:center;margin:0px 0px 20px;\"><span style=\"color:#c0504d;\">centos7.2下配置lnmp<br/> </span></h1><p style=\"text-align:center;\"><strong class=\"ue_t\">源码编译nginx+php7<br/> </strong></p><h3><span class=\"ue_t\" style=\"font-family:幼圆\">前言：</span></h3><p style=\"text-indent:2em;\">之前服务器是搭建的 lamp环境, apache2.4+php5.6, nginx现在很流行了, 因为学习原因, 我也着手在自己服务器上搭建lnmp环境, 由于之前的 lamp是用yum直接安装的, 现在想在 一台服务器上 实现 apache和nginx共同工作, 经过不断搜索实践，终于完成。总结起来.</p><p style=\"text-indent:2em;\">Centos7.2 下配置&nbsp; nginx-1.42. 和 php-7.0.16 + mysql 源码编译安装方式</p><p style=\"text-indent:2em;\">实践上是在自己原有服务器上实现的。但是服务器环境太差，下文假定是在 0 服务器上执行<br/> </p><h3><span style=\"font-family:幼圆\"># 安装编译工具</span></h3><pre class=\"brush:html;toolbar:false\">yum&nbsp;install&nbsp;gcc&nbsp;automake&nbsp;autoconf&nbsp;libtool&nbsp;gcc-c++</pre><h3><span style=\"font-family:幼圆\"># 安装基础库 ( 无则安装，有则更新)<br/> </span></h3><pre class=\"brush:css;toolbar:false\">yum&nbsp;install&nbsp;gd&nbsp;zlib&nbsp;zlib-devel&nbsp;openssl&nbsp;openssl-devel&nbsp;libxml2&nbsp;libxml2-devel&nbsp;libjpeg&nbsp;libjpeg-devel&nbsp;libpng&nbsp;libpng-devel&nbsp;freetype&nbsp;freetype-devel&nbsp;libmcrypt&nbsp;libmcrypt-devel</pre><h3><span style=\"font-family:幼圆\"># 安装mysql ( 原先lamp中有了mysql，所以这部可以不用 )<br/> </span></h3><pre class=\"brush:cpp;toolbar:false\">yum&nbsp;install&nbsp;mysql&nbsp;mysql-server</pre><h3><span style=\"font-family:幼圆\"># nginx依赖 正则PCRE库</span></h3><pre class=\"brush:cpp;toolbar:false\">yum&nbsp;install&nbsp;pcre&nbsp;pcre-devel</pre><h3><span class=\"ue_t\" style=\"font-family:幼圆\"></span></h3><h3><span style=\"font-family:幼圆\"># 编译nginx</span></h3><pre class=\"brush:cpp;toolbar:false\">cd&nbsp;/usr/local/src\r\nwget&nbsp;http://nginx.org/download/nginx-1.4.2.tar.gz\r\ntar&nbsp;zxvf&nbsp;nginx-1.4.2.tar.gz\r\n\r\ncd&nbsp;nginx-1.4.2/\r\n./configure&nbsp;--prefix=/usr/local/nginx\r\nmake&nbsp;&amp;&amp;&nbsp;make&nbsp;install\r\n\r\n#&nbsp;启动nginx\r\ncd&nbsp;/usr/local/nginx\r\n./sbin/nginx</pre><h3><span class=\"ue_t\" style=\"font-family:幼圆\"></span></h3><h3><span style=\"font-family:幼圆\"></span></h3><h3><span style=\"font-family:幼圆\"># 编译php</span></h3><pre class=\"brush:cpp;toolbar:false\">#&nbsp;源码编译php7.0.16&nbsp;\r\n&nbsp;&nbsp;&nbsp;&nbsp;cd&nbsp;/usr/local/src\r\n&nbsp;&nbsp;&nbsp;&nbsp;wget&nbsp;http://cn2.php.net/get/php-7.0.16.tar.gz/from/this/mirror\r\n&nbsp;&nbsp;&nbsp;&nbsp;mv&nbsp;./mirror&nbsp;./php-7.0.16.tar.gz\r\n&nbsp;&nbsp;&nbsp;&nbsp;tar&nbsp;zxvf&nbsp;php-7.0.16.tar.gz\r\n&nbsp;&nbsp;&nbsp;&nbsp;cd&nbsp;php-7.0.16/\r\n\r\n&nbsp;&nbsp;&nbsp;&nbsp;./configure&nbsp;--prefix=/usr/local/php7&nbsp;\\\r\n&nbsp;&nbsp;&nbsp;&nbsp;--with-gd&nbsp;\\\r\n&nbsp;&nbsp;&nbsp;&nbsp;--with-freetype-dir&nbsp;\\\r\n&nbsp;&nbsp;&nbsp;&nbsp;--enable-gd-native-ttf&nbsp;\\\r\n&nbsp;&nbsp;&nbsp;&nbsp;--enable-mysqlnd&nbsp;\\\r\n&nbsp;&nbsp;&nbsp;&nbsp;--with-pdo-mysql=mysqlnd&nbsp;\\\r\n&nbsp;&nbsp;&nbsp;&nbsp;--with-openssl&nbsp;\\\r\n&nbsp;&nbsp;&nbsp;&nbsp;--with-mcrypt&nbsp;\\\r\n&nbsp;&nbsp;&nbsp;&nbsp;--enable-mbstring&nbsp;\\\r\n&nbsp;&nbsp;&nbsp;&nbsp;--enable-zip&nbsp;\\\r\n&nbsp;&nbsp;&nbsp;&nbsp;--enable-fpm\r\n\r\n#&nbsp;这里编译安装时间会很长\r\n&nbsp;&nbsp;&nbsp;&nbsp;make&nbsp;&amp;&amp;&nbsp;make&nbsp;install\r\n&nbsp;&nbsp;&nbsp;&nbsp;\r\n#&nbsp;复制配置文件\r\n&nbsp;&nbsp;&nbsp;&nbsp;cp&nbsp;/usr/local/src/php-7.0.16/php.ini-development&nbsp;/usr/local/php7/lib/php.ini\r\n&nbsp;&nbsp;&nbsp;&nbsp;cp&nbsp;/usr/local/php7/etc/php-fpm.conf.default&nbsp;/usr/local/php7/etc/php-fpm.conf\r\n&nbsp;&nbsp;&nbsp;&nbsp;cp&nbsp;/usr/local/php7/etc/php-fpm.d/www.conf.default&nbsp;/usr/local/php7/etc/php-fpm.d/www.conf\r\n&nbsp;&nbsp;&nbsp;&nbsp;\r\n#&nbsp;启动php\r\n/usr/local/php7/sbin/php-fpm</pre><h3><span style=\"font-family:幼圆\"># nginx和php的整合<br/> </span></h3><pre class=\"brush:cpp;toolbar:false\">#&nbsp;整合nginx+php\r\n#&nbsp;编辑nginx的配置文件&nbsp;找到如下代码段,去掉注释和修改\r\n#&nbsp;将.php文件的请求转发给&nbsp;php进程\r\nlocation&nbsp;~&nbsp;\\.php$&nbsp;{\r\n&nbsp;&nbsp;&nbsp;&nbsp;root&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;html;\r\n&nbsp;&nbsp;&nbsp;&nbsp;fastcgi_pass&nbsp;&nbsp;&nbsp;127.0.0.1:9000;\r\n&nbsp;&nbsp;&nbsp;&nbsp;fastcgi_index&nbsp;&nbsp;index.php;\r\n&nbsp;&nbsp;&nbsp;&nbsp;fastcgi_param&nbsp;&nbsp;SCRIPT_FILENAME&nbsp;&nbsp;$DOCUMENT_ROOT$fastcgi_script_name;\r\n&nbsp;&nbsp;&nbsp;&nbsp;include&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;fastcgi_params;\r\n}\r\n\r\n#&nbsp;修改nginx配置文件后记得reload\r\n/usr/local/nginx/sbin/nginx&nbsp;-t\r\n/usr/local/nginx/sbin/nginx&nbsp;-s&nbsp;reload</pre><h3><span style=\"font-family:幼圆\"># 编写测试文件</span></h3><pre class=\"brush:bash;toolbar:false\">编写测试PHP页面\r\n/usr/local/nginx/html/index.php\r\n\r\n&lt;?php\r\n&nbsp;&nbsp;&nbsp;&nbsp;phpinfo();\r\n?&gt;\r\n\r\n出现phpinfo即可</pre><p>&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; <br/> </p><p># 上课去拉。 晚上还有有一篇 在nginx下测试博客系统以及nginx的一些知识点 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; <br/> </p>', '渣神', 'article/2018/05/20170301140057201_0UOZyHh.png', '2017-03-01 13:56:00.000000', '1', '1');
INSERT INTO `articles_article` VALUES ('12', 'Centos7.2下 源码编译安装 lnmp环境( 下 )', 'Centos7.2下 源码编译安装 lnmp环境( 下 )', '<h3><span class=\"ue_t\" style=\"font-family:幼圆\">前言<br/> </span></h3><p style=\"text-indent:2em;\">这篇承接着上一篇 lnmp 环境的配置, 对nginx的一些配置, 以及对blog系统测试</p><p style=\"text-indent:2em;\">以及配置过程中遇到的问题，和知识点的总结记录</p><h3><span style=\"font-family:幼圆\">nginx日志<br/> </span></h3><p style=\"text-indent:2em;\">nginx启动后在 nginx目录下会产生个logs 文件夹里面保存着一些日志文件</p><p style=\"text-indent:2em;\">其中nginx.pid 中记录了nginx的pid&nbsp;&nbsp;&nbsp;&nbsp;cat /usr/local/nginx/logs/nginx.pid</p><p style=\"text-indent:2em;\">access.log 中记录了 用户访问nginx的信息&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; error.log 中记录了 错误信息</p><h3><span style=\"font-family:幼圆\"># 80端口占用<br/> </span></h3><pre class=\"brush:bash;toolbar:false\">&nbsp;&nbsp;&nbsp;ps&nbsp;-aux&nbsp;|&nbsp;grep&nbsp;80&nbsp;&nbsp;&nbsp;&nbsp;\r\n&nbsp;&nbsp;&nbsp;ps&nbsp;-aux&nbsp;|&nbsp;grep&nbsp;nginx</pre><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;因为在自己服务器上有着之前配置的 lamp 环境, 所以存在着 apache占用了80端口的情况</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#修改nginx配置文件 监听端口 8000</p><pre class=\"brush:bash;toolbar:false\">&nbsp;&nbsp;&nbsp;cd&nbsp;/usr/local/nginx\r\n&nbsp;&nbsp;&nbsp;cd&nbsp;conf\r\n&nbsp;&nbsp;&nbsp;vi&nbsp;nginx.conf\r\n&nbsp;&nbsp;&nbsp;36行&nbsp;listen&nbsp;8000\r\n&nbsp;&nbsp;&nbsp;cd&nbsp;../sbin\r\n&nbsp;&nbsp;&nbsp;./nginx</pre><h3><span class=\"ue_t\" style=\"font-family:幼圆\"></span></h3><h3><span style=\"font-family:幼圆\"># nginx 的命令参数</span></h3><pre class=\"brush:bash;toolbar:false\">&nbsp;&nbsp;&nbsp;#&nbsp;nginx主程序在&nbsp;/nginx/sbin目录下\r\n&nbsp;&nbsp;&nbsp;进入目录&nbsp;&nbsp;./nginx&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;启动nginx\r\n\r\n&nbsp;&nbsp;&nbsp;./nginx&nbsp;-t&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;测试配置是否正确\r\n&nbsp;&nbsp;&nbsp;./nginx&nbsp;-s&nbsp;reload&nbsp;&nbsp;&nbsp;&nbsp;加载最新配置&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;kill&nbsp;-HUP&nbsp;nginx.pid\r\n&nbsp;&nbsp;&nbsp;./nginx&nbsp;-s&nbsp;stop&nbsp;&nbsp;&nbsp;&nbsp;立即停止nginx&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;kill&nbsp;-TERM\r\n&nbsp;&nbsp;&nbsp;./nginx&nbsp;-s&nbsp;quit&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;优雅停止nginx\r\n&nbsp;&nbsp;&nbsp;./nginx&nbsp;-s&nbsp;reopen&nbsp;&nbsp;&nbsp;&nbsp;重新打开日志文件</pre><h3><span style=\"font-family:幼圆\"># yum安装时提示保护多库版本的解决</span></h3><pre class=\"brush:bash;toolbar:false\">&nbsp;&nbsp;&nbsp;yum&nbsp;install&nbsp;--setopt=protected_multilib=false&nbsp;zlib</pre><h3><span style=\"font-family:幼圆\"># nginx下支持 blog/index.php&nbsp; -&gt; blog</span></h3><pre class=\"brush:bash;toolbar:false\">&nbsp;&nbsp;&nbsp;&nbsp;location&nbsp;/&nbsp;{&nbsp;&nbsp;&nbsp;&nbsp;\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;root&nbsp;&nbsp;&nbsp;html;\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;index&nbsp;&nbsp;index.php&nbsp;index.html&nbsp;index.htm;\r\n&nbsp;&nbsp;&nbsp;&nbsp;}\r\n&nbsp;&nbsp;&nbsp;&nbsp;#&nbsp;重新reload加载配置文件\r\n&nbsp;&nbsp;&nbsp;&nbsp;/usr/local/nginx/sbin/nginx&nbsp;-s&nbsp;reload</pre><h3><span style=\"font-family:幼圆\"># nginx 支持pathinfo</span></h3><pre class=\"brush:bash;toolbar:false\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#&nbsp;&nbsp;nginx默认不支持&nbsp;pathinfo&nbsp;,&nbsp;这样像thinkphp中的路由便无法支持&nbsp;\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#&nbsp;&nbsp;index.php/Admin/Index/index\r\n&nbsp;&nbsp;&nbsp;&nbsp;#&nbsp;这里提供了两种方法&nbsp;第一种为典型配置,&nbsp;第二种来自燕十八老师\r\n&nbsp;&nbsp;&nbsp;&nbsp;\r\n&nbsp;&nbsp;&nbsp;&nbsp;#&nbsp;典型配置\r\n&nbsp;&nbsp;&nbsp;&nbsp;location&nbsp;~&nbsp;\\.php$&nbsp;{\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;root&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;html;\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;fastcgi_pass&nbsp;&nbsp;&nbsp;127.0.0.1:9000;\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;fastcgi_index&nbsp;&nbsp;index.php;\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;fastcgi_param&nbsp;&nbsp;SCRIPT_FILENAME&nbsp;&nbsp;$DOCUMENT_ROOT$fastcgi_script_name;\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;include&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;fastcgi_params;\r\n&nbsp;&nbsp;&nbsp;&nbsp;}\r\n&nbsp;&nbsp;&nbsp;&nbsp;\r\n&nbsp;&nbsp;&nbsp;&nbsp;#&nbsp;修改第1,6行,支持pathinfo&nbsp;(from&nbsp;十八哥)\r\n&nbsp;&nbsp;&nbsp;&nbsp;location&nbsp;~&nbsp;\\.php(.*)$&nbsp;{&nbsp;#&nbsp;正则匹配.php后的pathinfo部分\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;root&nbsp;html;\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;fastcgi_pass&nbsp;&nbsp;&nbsp;127.0.0.1:9000;\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;fastcgi_index&nbsp;&nbsp;index.php;\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;fastcgi_param&nbsp;&nbsp;SCRIPT_FILENAME&nbsp;&nbsp;$DOCUMENT_ROOT$fastcgi_script_name;\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;fastcgi_param&nbsp;PATH_INFO&nbsp;$1;&nbsp;#&nbsp;把pathinfo部分赋给PATH_INFO变量\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;include&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;fastcgi_params;\r\n&nbsp;&nbsp;&nbsp;&nbsp;}</pre><h3><span style=\"font-family:幼圆\"># nginx 重写rewrite隐藏index.php</span></h3><pre class=\"brush:bash;toolbar:false\">&nbsp;&nbsp;&nbsp;location&nbsp;/blog&nbsp;{&nbsp;&nbsp;#&nbsp;项目目录\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;root&nbsp;&nbsp;&nbsp;html;\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;index&nbsp;&nbsp;index.php&nbsp;index.html&nbsp;index.htm;\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#&nbsp;url重写规则&nbsp;注意空格\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;if&nbsp;(&nbsp;!-e&nbsp;$request_filename)&nbsp;{\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;rewrite&nbsp;(.*)$&nbsp;/blog/index.php/$1;\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}\r\n&nbsp;&nbsp;&nbsp;&nbsp;}</pre><h3><span style=\"font-family:幼圆\"># laravel框架需要 stroage目录权限, bootstrap/cache目录权限</span>&nbsp;&nbsp; &nbsp; &nbsp;&nbsp; <br/> </h3>', '渣神', 'article/2018/05/1_5.jpg', '2017-03-01 18:21:00.000000', '0', '1');
INSERT INTO `articles_article` VALUES ('15', 'django完成博客部署', 'django完成博客部署', '<p># linux下安装python3<br/>mkdir /usr/local/python3<br/><br/>wget https://www.python.org/ftp/python/3.6.0/Python-3.6.0.tgz<br/>tar -zxvf Python-3.6.0.tgz<br/><br/><br/>./configure --prefix=/usr/local/python3<br/><br/>make &amp;&amp; make install<br/><br/># python链接文件路径<br/>cd /usr/bin<br/>ls | grep python<br/>mv /usr/bin/python /usr/bin/python2<br/><br/># 建立新的链接文件<br/>ln -s /usr/local/python3/bin/python3 /usr/bin/python<br/>ln -s /usr/local/python3/bin/python3 /usr/bin/python3<br/><br/><br/><br/># 安装pip<br/>curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py<br/>python get-pip.py&nbsp; # 仔细看最后的输出信息，可能会需要再执行一次<br/><br/># 创建pip的链接文件<br/>cd /usr/local/python3/bin<br/>./pip list<br/>ln -s /usr/local/python3/bin/pip /usr/bin/pip<br/><br/><br/># 安装虚拟环境 virtualenv和virtualenvwrapper<br/># 注意看最后的输出信息，看它是安装到哪了<br/># 默认是会安装到 环境变量 python 当前python版本文件夹下的bin<br/>pip install virtualenv<br/>pip install virtualenvwrapper<br/><br/># 创建用来存放虚拟环境的文件夹<br/># 将下面两行加入 ~/.bashrc 这个文件<br/>export WORKON_HOME=$HOME/Envs<br/>source /usr/local/python3/bin/virtualenvwrapper.sh<br/><br/><br/>source ~/.bashrc<br/>ln -s /usr/local/python3/bin/virtualenv /usr/bin/virtualenv<br/><br/># 创建虚拟环境<br/>mkvirtualenv pyblog<br/><br/><br/># 显示或切换虚拟环境<br/>workon [envName]<br/><br/># 删除虚拟环境<br/>rmvirtualenv [envName]<br/><br/># 离开虚拟环境<br/>deactivate<br/><br/><br/><br/># 解决yum问题<br/># 因为yum是依赖python，升级python后yum会出错<br/># 修改第一行，将其解释器路径设置为python2<br/>vi /usr/bin/yum<br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/>################################################################<br/># 部署django-blog<br/>mkvirtualenv pyblog<br/>workon pyblog<br/><br/># 安装依赖<br/>pip install -i https://pypi.douban.com/simple django==1.9.8<br/>yum install mysql-devel<br/>pip install -i https://pypi.douban.com/simple mysqlclient<br/>pip install pillow<br/>pip install django-import-export==1.0.0<br/>pip install future==0.15.2<br/>pip install six==1.10.0<br/>pip install django-crispy-forms==1.6.1<br/>pip install django-formtools<br/>pip install httplib2<br/><br/># 在xadmin中集成富文本编辑器 DjangoUeditor<br/># pypi或者github下下载源码进行pip安装<br/># 或者直接拷贝文件夹到python环境中&nbsp; ~/Envs/pyblog/lib/python3.6/site-packages<br/># 在settings里注册app<br/># 使用方法 github.com/zhangfisher/DjangoUeditor<br/><br/># 这边安装这个的时候报了个编码错误<br/>pip install django-pure-pagination<br/># 修改centos系统编码<br/>vim /etc/locale.conf<br/>&nbsp;&nbsp; &nbsp;LANG=&quot;en_US.UTF-8&quot;<br/>source /etc/locale.conf<br/>locale<br/># 配置好最后logout一下<br/><br/># 用django内置的服务器启动django&nbsp; (8002端口)<br/>python manage.py migrate<br/>python manage.py runserver 0.0.0.0:8002<br/><br/># 访问 外网:8002<br/># 配置项目settings<br/>ALLOWED_HOSTS = [&#39;*&#39;]<br/><br/># 移植本地数据库<br/># 因为原先我在本地win10环境上已经完成<br/>#####################################################################<br/><br/><br/><br/><br/>################################################################<br/># 使用 uwsgi启动django (8001端口)<br/>&nbsp;&nbsp; &nbsp;pip install uwsgi<br/><br/># 编写测试文件<br/>&nbsp;&nbsp; &nbsp;vim test.py<br/><br/>&nbsp;&nbsp; &nbsp;def application(env, start_response):<br/>&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;start_response(&#39;200 OK&#39;, [(&#39;Content-Type&#39;,&#39;text/html&#39;)])<br/>&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;return [b&quot;Hello World&quot;]<br/><br/>&nbsp;&nbsp;&nbsp; uwsgi --http :8001 --wsgi-file test.py<br/><br/># 在项目根目录下 blogpy下创建 uwsgi配置文件<br/>vim blogpy_uwsgi.ini<br/>&nbsp;&nbsp; &nbsp;# blogpy_uwsgi.ini file<br/>&nbsp;&nbsp; &nbsp;[uwsgi]<br/><br/>&nbsp;&nbsp; &nbsp;# Django-related settings<br/><br/>&nbsp;&nbsp; &nbsp;# 让uWSGI作为单独的web-server时，用http<br/>&nbsp;&nbsp; &nbsp;# 当配置 nginx+ uwsgi时，用socket<br/>&nbsp;&nbsp; &nbsp;http = :8001<br/>&nbsp;&nbsp; &nbsp;#socket = :8001<br/><br/>&nbsp;&nbsp; &nbsp;# the base directory (full path)<br/>&nbsp;&nbsp; &nbsp;chdir&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; = /var/www/html_py/blogpy<br/><br/>&nbsp;&nbsp; &nbsp;# Django s wsgi file&nbsp; 项目目录下的wsgi文件<br/>&nbsp;&nbsp; &nbsp;module&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; = blogpy.wsgi<br/><br/>&nbsp;&nbsp; &nbsp;# process-related settings<br/>&nbsp;&nbsp; &nbsp;# master<br/>&nbsp;&nbsp; &nbsp;master&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; = true<br/><br/>&nbsp;&nbsp; &nbsp;# maximum number of worker processes<br/>&nbsp;&nbsp; &nbsp;processes&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; = 4<br/><br/>&nbsp;&nbsp; &nbsp;# ... with appropriate permissions - may be needed<br/>&nbsp;&nbsp; &nbsp;# chmod-socket&nbsp;&nbsp;&nbsp; = 664<br/>&nbsp;&nbsp; &nbsp;# clear environment on exit<br/>&nbsp;&nbsp; &nbsp;vacuum&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; = true<br/><br/><br/><br/># 在项目目录下，用配置文件启动 uwsgi<br/>workon pyblog<br/>uwsgi --ini /var/www/html_py/blogpy/blogpy_uwsgi.ini<br/>killall -9 uwsgi<br/># 然后使用 127.0.0.1:8001 (根据自己上面配置的端口)<br/>#############################################################<br/><br/><br/>TODO:<br/>##############################################################<br/># 配置nginx+uwsgi<br/><br/># 关闭nginx&nbsp; 重启reload<br/>/usr/local/nginx/sbin/nginx -s stop<br/><br/># 设置blogpy_uwsgi.ini配置文件, 设置为socket<br/>&nbsp;&nbsp; &nbsp;socket = :8001<br/># 启动 uwsgi<br/>&nbsp;&nbsp; &nbsp;workon pyblog<br/>&nbsp;&nbsp; &nbsp;uwsgi --ini /var/www/html_py/blogpy/blogpy_uwsgi.ini<br/><br/># 修改nginx的配置文件 (/usr/local/nginx/conf)<br/>vim /usr/local/nginx/conf/nginx.conf<br/>&nbsp;&nbsp; &nbsp;server {<br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; listen&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 8003; <br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; server_name&nbsp;&nbsp;&nbsp; localhost<br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; charset UTF-8;<br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; access_log&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /usr/local/nginx/logs/myweb_access.log;<br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; error_log&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /usr/local/nginx/logs/myweb_error.log;<br/><br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; client_max_body_size 75M;<br/><br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; location / {&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;<br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; include&nbsp; uwsgi_params;<br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; uwsgi_pass&nbsp; 127.0.0.1:8001;<br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; uwsgi_read_timeout 30;<br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br/><br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; location /static{<br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;alias /var/www/html_py/blogpy/static;<br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br/>&nbsp;&nbsp;&nbsp; }<br/><br/># 重新启动nginx<br/>/usr/local/nginx/sbin/nginx -s stop<br/>/usr/local/nginx/sbin/nginx<br/><br/># 访问 127.0.0.1:8003<br/><br/><br/></p>', '彬彬', 'article/2018/05/1_8.jpg', '2018-05-26 14:46:00.000000', '3', '4');
INSERT INTO `articles_article` VALUES ('16', 'Centos7下安装mysql5.7', 'Centos7下安装mysql5.7', '<h3 id=\"1配置yum源\">1、配置YUM源</h3><p>在MySQL官网中下载YUM源rpm安装包：https://dev.mysql.com/downloads/repo/yum/</p><pre class=\"prettyprint\">#&nbsp;下载mysql源安装包，&nbsp;如果没有wget&nbsp;就&nbsp;&nbsp;yun&nbsp;-y&nbsp;install&nbsp;wget\r\n&nbsp;&nbsp;&nbsp;&nbsp;wget&nbsp;http://dev.mysql.com/get/mysql57-community-release-el7-8.noarch.rpm&nbsp;\r\n&nbsp;&nbsp;&nbsp;&nbsp;\r\n#&nbsp;安装mysql源\r\n&nbsp;&nbsp;&nbsp;&nbsp;yum&nbsp;localinstall&nbsp;mysql57-community-release-el7-8.noarch.rpm\r\n&nbsp;&nbsp;&nbsp;&nbsp;\r\n#&nbsp;检查mysql源是否安装成功,&nbsp;检查可用的包\r\n&nbsp;&nbsp;&nbsp;&nbsp;yum&nbsp;repolist&nbsp;enabled&nbsp;|&nbsp;grep&nbsp;&quot;mysql.*-community.*&quot;</pre><p><img src=\"/media/article/ueditor/图片_20180914171716_429.png\" title=\"\" alt=\"图片.png\" style=\"width: 713px; height: 86px;\" width=\"713\" height=\"86\"/> </p><p><br/> </p><h3 id=\"2安装mysql\">2、安装MySQL</h3><pre class=\"prettyprint\">#&nbsp;yum安装mysql\r\n&nbsp;&nbsp;&nbsp;&nbsp;yum&nbsp;-y&nbsp;install&nbsp;mysql-community-server\r\n&nbsp;&nbsp;&nbsp;&nbsp;\r\n#&nbsp;查看mysql运行状态\r\n&nbsp;&nbsp;&nbsp;&nbsp;systemctl&nbsp;status&nbsp;mysqld\r\n&nbsp;&nbsp;&nbsp;\r\n#&nbsp;启动mysqld服务\r\n&nbsp;&nbsp;&nbsp;&nbsp;systemctl&nbsp;start&nbsp;mysqld\r\n\r\n#&nbsp;设计开机启动\r\n&nbsp;&nbsp;&nbsp;&nbsp;systemctl&nbsp;enable&nbsp;mysqld\r\n\r\n#&nbsp;重新载入systemd,&nbsp;扫描新的或有变动的部分\r\n&nbsp;&nbsp;&nbsp;&nbsp;systemctl&nbsp;daemon-reload</pre><p><img src=\"/media/article/ueditor/图片_20180914180654_632.png\" title=\"\" alt=\"图片.png\"/> </p><h3 id=\"5修改root本地登录密码\">3、修改root登录密码</h3><p>mysql安装完成之后，会在 /var/log/mysqld.log 文件中给root生成了一个随机默认密码。</p><pre class=\"prettyprint\">grep&nbsp;&#39;temporary&nbsp;password&#39;&nbsp;/var/log/mysqld.log</pre><p><img src=\"/media/article/ueditor/图片_20180914172531_327.png\" title=\"\" alt=\"图片.png\"/> </p><p>使用这个密码进行登陆, mysql -uroot -p</p><p><br/> </p><p>修改root密码（两种方式都可以）：</p><pre class=\"prettyprint\">mysql&gt;&nbsp;ALTER&nbsp;USER&nbsp;&#39;root&#39;@&#39;localhost&#39;&nbsp;IDENTIFIED&nbsp;BY&nbsp;&#39;MyNewPass1!&#39;;</pre><pre class=\"prettyprint\">mysql&gt;&nbsp;set&nbsp;password&nbsp;for&nbsp;&#39;root&#39;@&#39;localhost&#39;=password(&#39;MyNewPass1!&#39;);</pre><p><br/> </p><p>注意：在5.7版本，mysql有新增安全策略，密码需要设置的大小写，数字，字符，否则会报错<br/> </p><p><img src=\"/media/article/ueditor/图片_20180914172954_481.png\" title=\"\" alt=\"图片.png\" style=\"width: 782px; height: 57px;\" width=\"782\" height=\"57\"/> </p><p><br/> </p><pre class=\"prettyprint\">#&nbsp;通过show命令查看mysql密码策略的相关信息\r\nmysql&gt;&nbsp;show&nbsp;variables&nbsp;like&nbsp;&#39;%password%&#39;;</pre><p><img src=\"/media/article/ueditor/图片_20180914173118_636.png\" title=\"\" alt=\"图片.png\"/> </p><p><br/> </p><h3 id=\"5修改root本地登录密码\">4、修改密码策略</h3><pre class=\"prettyprint\">#&nbsp;修改/etc/my.cnf&nbsp;配置文件\r\n&nbsp;&nbsp;&nbsp;&nbsp;yum&nbsp;-y&nbsp;install&nbsp;vim\r\n&nbsp;&nbsp;&nbsp;&nbsp;vim&nbsp;/etc/my.cnf\r\n&nbsp;&nbsp;&nbsp;&nbsp;\r\n#&nbsp;选择0（LOW），1（MEDIUM），2（STRONG）其中一种，选择2需要提供密码字典文件\r\n&nbsp;&nbsp;&nbsp;&nbsp;validate_password_policy=0\r\n&nbsp;&nbsp;&nbsp;&nbsp;\r\n#&nbsp;如果不需要密码策略，禁用密码策略即可\r\n&nbsp;&nbsp;&nbsp;&nbsp;validate_password=off\r\n&nbsp;&nbsp;&nbsp;&nbsp;\r\n#&nbsp;重新启动mysql服务使配置生效：\r\n&nbsp;&nbsp;&nbsp;&nbsp;systemctl&nbsp;restart&nbsp;mysqld</pre><p><br/> </p><p>由于是实验环境，取消了密码策略，如下可以设置简单密码了<br/> </p><p><img src=\"/media/article/ueditor/图片_20180914174504_900.png\" title=\"\" alt=\"图片.png\"/> </p><p><br/> </p><p><img src=\"/media/article/ueditor/图片_20180914174815_157.png\" title=\"\" alt=\"图片.png\" style=\"width: 787px; height: 105px;\" width=\"787\" height=\"105\"/> </p><p><br/> </p><h3 id=\"5修改root本地登录密码\">4、补充<br/> </h3><p><strong>默认配置文件路径：</strong></p><p>配置文件：/etc/my.cnf <br/>日志文件：/var/log//var/log/mysqld.log <br/>服务启动脚本：/usr/lib/systemd/system/mysqld.service <br/>socket文件：/var/run/mysqld/mysqld.pid</p><p><br/> </p><p><strong>如果忘记root密码：</strong></p><pre class=\"prettyprint\">#&nbsp;修改配置文件&nbsp;/etc/my.cnf&nbsp;在&nbsp;[mysqld]&nbsp;段中加入这行，跳过密码检查\r\n&nbsp;&nbsp;&nbsp;&nbsp;skip-grant-tables&nbsp;\r\n&nbsp;&nbsp;&nbsp;&nbsp;\r\n#&nbsp;这时便不需要密码也可以登陆mysql\r\n&nbsp;&nbsp;&nbsp;&nbsp;mysql&nbsp;&nbsp;-uroot&nbsp;-p\r\n&nbsp;&nbsp;&nbsp;&nbsp;\r\n#&nbsp;设置密码和刷新privileges\r\n&nbsp;&nbsp;&nbsp;&nbsp;update&nbsp;mysql.user&nbsp;set&nbsp;authentication_string=password(&#39;123456&#39;)&nbsp;where&nbsp;user=&#39;root&#39;;&nbsp;&nbsp;&nbsp;\r\n&nbsp;&nbsp;&nbsp;&nbsp;flush&nbsp;privileges;</pre><p><img src=\"http://127.0.0.1:8001/media/article/ueditor/图片_20180914175627_550.png\" title=\"\" alt=\"图片.png\"/> </p><p><br/> </p>', '渣神', 'article/2018/09/mysql.jpg', '2018-09-14 17:09:00.000000', '4', '1');
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
INSERT INTO `categorys_guestbook` VALUES ('11', '彬彬', '我好像，终于决定，要放弃你了。', '6666', '2018-04-30 13:36:00.000000');
INSERT INTO `categorys_guestbook` VALUES ('12', '彬彬呀', '不忘初心，方得始终。初心易得，始终难守。', '6666', '2017-11-25 23:40:00.000000');
INSERT INTO `categorys_guestbook` VALUES ('13', 'nmz~', 'hiahia 给猪彬一点鼓励~飞翔的渣神，越努力越幸运~ 相信你迟早会成为别人仰望的对象~加油~', '6666', '2017-06-21 22:11:00.000000');
INSERT INTO `categorys_guestbook` VALUES ('14', 'WJQ', 'HHH SB', '6666', '2017-03-02 21:22:00.000000');
INSERT INTO `categorys_guestbook` VALUES ('15', '渣神', 'centos7.2下配置lnmp环境留言测试', '6666', '2017-03-01 13:20:00.000000');
INSERT INTO `categorys_guestbook` VALUES ('16', '小度', '666', '6666', '2017-02-23 14:31:00.000000');
INSERT INTO `categorys_guestbook` VALUES ('17', '飞哥', '棒棒哦', '6666', '2017-02-18 01:39:00.000000');
INSERT INTO `categorys_guestbook` VALUES ('18', '彬彬', 'move forward', '6666', '2017-01-23 11:24:00.000000');
INSERT INTO `categorys_guestbook` VALUES ('19', '手机端的彬彬', '光棍节快乐！', '6666', '2016-11-11 23:37:00.000000');
INSERT INTO `categorys_guestbook` VALUES ('20', '彬彬', '光棍节快乐!!!!', '6666', '2016-11-11 23:06:00.000000');
INSERT INTO `categorys_guestbook` VALUES ('21', '渣神', '光棍节快乐!!', '6666', '2016-11-11 22:46:00.000000');
INSERT INTO `categorys_guestbook` VALUES ('22', 'bbin', '完成django + py3 + wsgi + nginx的博客系统迁移。', '', '2018-05-26 14:46:41.000000');
INSERT INTO `categorys_guestbook` VALUES ('23', '我是你妈', '期待你的逆风翻盘~', '', '2018-05-26 15:00:25.000000');
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
