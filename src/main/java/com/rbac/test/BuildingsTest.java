package com.rbac.test;

import com.rbac.bean.Buildings;
import com.rbac.service.BuildingsService;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.List;

/**
 * @Author: Changshu
 * @Date: 2020/12/28 9:55
 * @Version 1.0
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:applicationContext.xml", "classpath:springmvc.xml"})
public class BuildingsTest {
    @Autowired
    public BuildingsService buildingsService;

    @Test
    public void testAll(){
        List<Buildings>buildings=buildingsService.getAllBuildings();
        for(Buildings building:buildings){
            System.out.println(building);
        }
    }

    @Test
    public void testUpdate(){
        Buildings buildings=buildingsService.selectOneByBuildingsId(2);
        buildings.setOpen(true);
        System.out.println(buildingsService.updateBuilding(buildings));


    }
    @Test
    public void testInset(){
        Buildings building=new Buildings();
        building.setBuilding_name("第三教学楼");
        building.setBuilding_desc("供师生上课和学习");
        buildingsService.insertOne(building);
        System.out.println(building.getBuilding_id());
    }
}
