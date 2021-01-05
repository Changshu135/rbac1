# 基于RBAC1的访问控制web程序

## 1.设计理念
模拟校园各机构，如图书馆，食堂，教学楼，实验室对进出，使用等的权限控制。

## 2.rbac1介绍
核心就是权限的继承，高级别角色继承低角色用户的权限，并拥有独有的的权限，详见[知乎](https://zhuanlan.zhihu.com/p/91898362)

## 3.权限继承实现介绍
我的方法是在角色表中给一个字段用于存储一个角色的直接下属角色（注意是直接下属角色）如图所示：
![](https://github.com/Changshu135/rbac1/blob/master/iamgesOfResult/roles.png)  
举例：
* 学生：作为最低层级的角色是没有下属角色的，那么它的下属角色字段值就为空
* 计算机系的学生：它的直接下属角色只有一个角色--学生，那么它的下属角色字段值就为'1'（这是角色的id）
* 教务处老师：它的直接下属角色有机械系学生和计算机系学生，那么它的下属角色字段值就为'2 3'（这是角色的id），用空格隔开。

但这个方法是存在一定的问题，不完全符合rbac1的思想。建议使用方法二，就是每一个角色给一个编号（如8,10），编号大的角色继承编号小的角色的权限，这个方法可以减少权限搜索的时间。

## 4. 搜索一个角色的权限
以你要检索权限的角色为根节点，使用层序或先序遍历等方法遍历子树，将得到的权限结果字符串与你要检查的权限进行对比。

## 5. 使用的开发工具和技术
* 语言：java
* 工具：idea
* 框架：spring+mybatis+springmvc，maven
* 数据库：mysql

## 6.效果图
![](https://github.com/Changshu135/rbac1/blob/master/iamgesOfResult/登录界面.png)  
![](https://github.com/Changshu135/rbac1/blob/master/iamgesOfResult/主界面.png)  
![](https://github.com/Changshu135/rbac1/blob/master/iamgesOfResult/建筑界面.jpg)  
![](https://github.com/Changshu135/rbac1/blob/master/iamgesOfResult/用户管理界面.jpg)  
![](https://github.com/Changshu135/rbac1/blob/master/iamgesOfResult/角色管理界面.jpg)  
![](https://github.com/Changshu135/rbac1/blob/master/iamgesOfResult/操作成功.jpg)
![](https://github.com/Changshu135/rbac1/blob/master/iamgesOfResult/操作失败.jpg)  
