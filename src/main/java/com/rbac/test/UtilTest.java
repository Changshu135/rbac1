package com.rbac.test;

import com.rbac.util.Util;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

/**
 * @Author: Changshu
 * @Date: 2020/12/28 17:00
 * @Version 1.0
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:applicationContext.xml", "classpath:springmvc.xml"})
public class UtilTest {
    @Autowired
    public Util util;

    @Test
    public void test1(){
        System.out.println(util.rightsJudge(7,1,"进入"));
    }

}
