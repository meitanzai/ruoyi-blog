<p align="center">
	<img alt="logo" src="https://oscimg.oschina.net/oscnet/up-dd77653d7c9f197dd9d93684f3c8dcfbab6.png">
</p>
<h1 align="center" style="margin: 30px 0 30px; font-weight: bold;">RuoYi Blog 2.0</h1>
<h4 align="center">基于RuoYi-fast v4.7.3开发的轻量级Java快速开发框架</h4>
<p align="center">
<a target="_blank" href="https://gitee.com/GiteeKey/ruoyi-blog">
    <img src="https://img.shields.io/badge/JDK-1.8+-green.svg" ></img>
        <img src="https://img.shields.io/badge/mysql-5.7-yellow.svg" >
    <img src="https://img.shields.io/badge/springboot-2.5.10.RELEASE-green" ></img>
    <img src="https://img.shields.io/badge/Blog-v1.0-brightgreen.svg">
	<img src="https://img.shields.io/badge/mybatis--plus-3.5.1-green" ></img>
</a>
	<a href="https://gitee.com/y_project/RuoYi"><img src="https://img.shields.io/badge/RuoYi-v4.7.3-brightgreen.svg"></a>
	<a href="https://gitee.com/y_project/RuoYi/blob/master/LICENSE"><img src="https://img.shields.io/github/license/mashape/apistatus.svg"></a>
</p>



## 平台简介

​		**此项目使用SpringBoot + Apache Shiro + mybatis/Mybatis Plus + Thymeleaf**

​		一直想做一个博客平台，看了很多优秀的开源项目但是发现没有合适的。于是利用空闲休息时间将**若依后台管理**与 **pb-cms**结合，在自己参考着开发一部分，如此有了这个博客系统。

​		它可以用于所有的Web应用程序，如网站管理后台，网站会员中心，CMS，CRM，OA，适合搭建博客、企业网站等，完美自适应所有前端后台代码封装过后十分精简易上手，出错概率低。同时支持移动客户端访问。系统会陆续更新一些实用功能。

此项目是一套全部开源的快速开发平台，毫无保留给个人及企业免费使用。

* 感谢 [ruoyi-fast](https://gitee.com/y_project/RuoYi-fast) 后台管理
* 感谢 [hplus](https://gitee.com/hplus_admin/hplus) 后台主题 UI 框架。
* 感谢 [LinZhaoguan/pb-cms](https://gitee.com/LinZhaoguan/pb-cms)  CMS建站系统 
* 感谢 [SpringBoot开发一个小而美的个人博客](https://search.bilibili.com/all?keyword=SpringBoot%E5%BC%80%E5%8F%91%E4%B8%80%E4%B8%AA%E5%B0%8F%E8%80%8C%E7%BE%8E%E7%9A%84%E4%B8%AA%E4%BA%BA%E5%8D%9A%E5%AE%A2&from_source=webtop_search&spm_id_from=333.1007) 李仁密老师

## 技术选型

1. 核心框架：Spring Boot。
2. 安全框架：Apache Shiro。
3. 模板引擎：Thymeleaf。
4. 持久层框架：MyBatis(若依原有的)， mybatis-plus(后期自己加的) 。
5. 定时任务:Quartz。
6. 数据库连接池：Druid。
7. 工具类：Fastjson。
8. 更多……

## 内置功能

### 若依原有的功能

1.  用户管理：用户是系统操作者，该功能主要完成系统用户配置。
2.  部门管理：配置系统组织机构（公司、部门、小组），树结构展现支持数据权限。
3.  岗位管理：配置系统用户所属担任职务。
4.  菜单管理：配置系统菜单，操作权限，按钮权限标识等。
5.  角色管理：角色菜单权限分配、设置角色按机构进行数据范围权限划分。
6.  字典管理：对系统中经常使用的一些较为固定的数据进行维护。
7.  参数管理：对系统动态配置常用参数。
8.  通知公告：系统通知公告信息发布维护。
9.  操作日志：系统正常操作日志记录和查询；系统异常信息日志记录和查询。
10.  登录日志：系统登录日志记录查询包含登录异常。
11.  在线用户：当前系统中活跃用户状态监控。
12.  定时任务：在线（添加、修改、删除)任务调度包含执行结果日志。
13.  代码生成：前后端代码的生成（java、html、xml、sql）支持CRUD下载 。
14.  系统接口：根据业务代码自动生成相关的api接口文档。
15.  服务监控：监视当前系统CPU、内存、磁盘、堆栈等相关信息。
16.  缓存监控：对系统的缓存查询，删除、清空等操作。
17.  在线构建器：拖动表单元素生成相应的HTML代码。
18.  连接池监视：监视当前系统数据库连接池状态，可进行分析SQL找出系统性能瓶颈。

### 博客功能

1. 导航管理 ：对博客前台显示配置，可以设置页面，也可设置分类

2. 分类管理：对博客进行分类

3. 标签管理：略

4. 博客管理：对文章进行管理

5. 友情链接：在前台侧边栏显示友情链接

6. 博客前台：可以预览博客前台的所有功能

   <font color=#f47920 size=6>支持markdown语法，支持博客文章代码高亮</font>

## 在线体验

<font color=#d71345 size=3>本项目我将长期维护，优化，并时刻保持与ruoyi-fast同步。目前可能还存在bug或性能问题,希望大家一起解决。</font>

- admin/admin123   （后台暂不开放）

前台演示地址：http://ryblog.vaiwan.com/blog

后台演示地址：http://ryblog.vaiwan.com

## 演示图

![image.png](https://s2.loli.net/2022/03/19/WBZ36KxVAqs5Ovf.png)

![image.png](https://s2.loli.net/2022/03/19/iQTCEsmcvILyYAb.png)

![image.png](https://s2.loli.net/2022/03/19/wpHv5n6GTqlPb4O.png)

![image.png](https://s2.loli.net/2022/03/19/98IXsOT2gcKeJQk.png)

![image.png](https://s2.loli.net/2022/03/19/YByPMCuA26jpZio.png)

![image.png](https://s2.loli.net/2022/03/19/FXfj8a5hERMkYqt.png)

![image.png](https://s2.loli.net/2022/01/28/zJa3xbRGKuWrow2.png)

![image.png](https://s2.loli.net/2022/03/19/auCJ6hne3dAkDZR.png)



<table> 
      <tr>
        <td><a href="https://sm.ms/image/zXO7UdcbIYrsEnL" ><img src="https://s2.loli.net/2022/01/28/zXO7UdcbIYrsEnL.jpg" ></a></td>
        <td><a href="https://sm.ms/image/rj8nHaZu9WYS65c" ><img src="https://s2.loli.net/2022/01/28/rj8nHaZu9WYS65c.jpg" ></a></td>
    </tr> 
       <tr>
        <td><a href="https://sm.ms/image/45Jvn9MzkHtwBNZ" ><img src="https://s2.loli.net/2022/01/28/45Jvn9MzkHtwBNZ.jpg" ></a></td>
        <td><a href="https://sm.ms/image/LAgiZVxPSoJvIW3" target="_blank"><img src="https://s2.loli.net/2022/01/28/LAgiZVxPSoJvIW3.jpg" ></a></td>
    </tr> 
        <tr>
        <td><img src="https://oscimg.oschina.net/oscnet/up-42e518aa72a24d228427a1261cb3679f395.png"/></td>
        <td><img src="https://oscimg.oschina.net/oscnet/up-7f20dd0edba25e5187c5c4dd3ec7d3d9797.png"/></td>
    </tr>
    <tr>
        <td><img src="https://oscimg.oschina.net/oscnet/up-2dae3d87f6a8ca05057db059cd9a411d51d.png"/></td>
        <td><img src="https://oscimg.oschina.net/oscnet/up-ea4d98423471e55fba784694e45d12bd4bb.png"/></td>
    </tr>
    <tr>
        <td><img src="https://oscimg.oschina.net/oscnet/up-7f6c6e9f5873efca09bd2870ee8468b8fce.png"/></td>
        <td><img src="https://oscimg.oschina.net/oscnet/up-c708b65f2c382a03f69fe1efa8d341e6cff.png"/></td>
    </tr>
    <tr>
        <td><img src="https://oscimg.oschina.net/oscnet/up-9ab586c47dd5c7b92bca0d727962c90e3b8.png"/></td>
        <td><img src="https://oscimg.oschina.net/oscnet/up-ef954122a2080e02013112db21754b955c6.png"/></td>
    </tr>	 
    <tr>
        <td><img src="https://oscimg.oschina.net/oscnet/up-088edb4d531e122415a1e2342bccb1a9691.png"/></td>
        <td><img src="https://oscimg.oschina.net/oscnet/up-f886fe19bd820c0efae82f680223cac196c.png"/></td>
    </tr>
    <tr>
        <td><img src="https://oscimg.oschina.net/oscnet/up-c7a2eb71fa65d6e660294b4bccca613d638.png"/></td>
        <td><img src="https://oscimg.oschina.net/oscnet/up-e60137fb0787defe613bd83331dc4755a70.png"/></td>
    </tr>
    <tr>
        <td><img src="https://oscimg.oschina.net/oscnet/up-7c51c1b5758f0a0f92ed3c60469b7526f9f.png"/></td>
        <td><img src="https://oscimg.oschina.net/oscnet/up-15181aed45bb2461aa97b594cbf2f86ea5f.png"/></td>
    </tr>
    <tr>
        <td><img src="https://oscimg.oschina.net/oscnet/up-83326ad52ea63f67233d126226738054d98.png"/></td>
        <td><img src="https://oscimg.oschina.net/oscnet/up-3bd6d31e913b70df00107db51d64ef81df7.png"/></td>
    </tr>
    <tr>
        <td><img src="https://oscimg.oschina.net/oscnet/up-70a2225836bc82042a6785edf6299e2586a.png"/></td>
        <td><img src="https://oscimg.oschina.net/oscnet/up-0184d6ab01fdc6667a14327fcaf8b46345d.png"/></td>
    </tr>
    <tr>
        <td><img src="https://oscimg.oschina.net/oscnet/up-64d8086dc2c02c8f71170290482f7640098.png"/></td>
        <td><img src="https://oscimg.oschina.net/oscnet/up-5e4daac0bb59612c5038448acbcef235e3a.png"/></td>
    </tr>
</table>


