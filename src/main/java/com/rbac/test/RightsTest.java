package com.rbac.test;

import com.rbac.bean.Rights;
import com.rbac.service.RightsService;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.List;

/**
 * @Author: Changshu
 * @Date: 2020/12/28 10:08
 * @Version 1.0
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:applicationContext.xml", "classpath:springmvc.xml"})
public class RightsTest {
    @Autowired
    public RightsService rightsService;

    @Test
    public void testAll(){
        List<Rights>rights=rightsService.getAllRights();
        for(Rights right:rights){
            System.out.println(right);
        }
    }

    @Test
    public void testInsert(){
        Rights right=new Rights();
        right.setRight_name("关闭 设立");
        right.setRight_desc("可以关闭和设立");
        right.setRid(7);
        right.setBid(14);
        rightsService.insertOne(right);
        System.out.println(right.getRight_id());
    }

    @Test
    public void testUpdate(){
        Rights right=new Rights();
        right.setRight_id(22);
        right.setRight_name("进入 使用");
        right.setRight_desc("可以进入 使用");
        right.setRid(1);
        right.setBid(9);
        rightsService.updateOne(right);
    }
}
