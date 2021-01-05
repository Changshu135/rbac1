package com.rbac.test;


import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

/**
 * @Author: Changshu
 * @Date: 2020/12/28 18:30
 * @Version 1.0
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:applicationContext.xml", "classpath:springmvc.xml"})
public class Test {

    @org.junit.Test
    public void test1(){
        String[] s="".split(" ");
        for(String t:s){
            System.out.println(t);
        }
    }
}
