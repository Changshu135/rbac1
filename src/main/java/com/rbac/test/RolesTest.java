package com.rbac.test;

import com.rbac.bean.Roles;
import com.rbac.service.RolesService;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import javax.management.relation.Role;
import java.util.List;

/**
 * @Author: Changshu
 * @Date: 2020/12/29 16:49
 * @Version 1.0
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:applicationContext.xml", "classpath:springmvc.xml"})
public class RolesTest {

    @Autowired
    public RolesService rolesService;

    @Test
    public void test1(){
        List<Roles>roles=rolesService.getAllRoles();
        for(Roles role:roles){
            System.out.println(role);
        }
    }

    @Test
    public void testInsertOne(){
        Roles role=new Roles();
        role.setRole_name("自动化学生");
        role.setRole_desc("自动化学生");
        role.setSub_rid("1");
        System.out.println(rolesService.insertOne(role));
    }

    @Test
    public void testUpdateOne(){
        Roles role=new Roles();
        role.setRole_id(5);
        role.setRole_name("教务处老师");
        role.setRole_desc("教务处老师");
        role.setSub_rid("2 3");
        System.out.println(rolesService.updateOne(role));
    }
}
