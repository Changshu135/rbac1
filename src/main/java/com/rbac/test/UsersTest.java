package com.rbac.test;

import com.rbac.bean.Roles;
import com.rbac.bean.Users;
import com.rbac.service.RolesService;
import com.rbac.service.UsersService;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.List;

/**
 * @Author: Changshu
 * @Date: 2020/12/28 16:55
 * @Version 1.0
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:applicationContext.xml", "classpath:springmvc.xml"})
public class UsersTest {
    @Autowired
    public UsersService usersService;
    @Autowired
    public RolesService rolesService;

    @Test
    public void testAll(){
        List<Users>users=usersService.getAllUsers();
        for(Users user:users){
            System.out.println(user);
        }
    }

    @Test
    public void testInsert(){
        Users user=new Users();
        Roles role=rolesService.selectOneById(1);
        user.setUsername("stu7");
        user.setPassword("123");
        user.setGender("男");
        user.setRealName("秦十");
        user.setRole(role);
        System.out.println(usersService.insertOne(user));
    }
    @Test
    public void testUpdate(){
        Users user=usersService.selectOneByUserId(13);
        Roles role=user.getRole();
        user.setUsername("stu8");
        user.setPassword("123");
        user.setGender("女");
        user.setRealName("秦十一");
        role.setRole_id(6);
        usersService.updateOne(user);

    }
    @Test
    public void testDelete(){
        Integer user_id=13;
        System.out.println(usersService.deleteOne(user_id));
    }
}
