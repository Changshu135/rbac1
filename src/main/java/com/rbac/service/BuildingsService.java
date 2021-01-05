package com.rbac.service;

import com.rbac.bean.Buildings;
import com.rbac.bean.Rights;
import com.rbac.mapper.BuildingsMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @Author: Changshu
 * @Date: 2020/12/28 10:00
 * @Version 1.0
 */
@Service
public class BuildingsService {
    @Autowired
    private BuildingsMapper buildingsMapper;
    @Autowired
    private RightsService rightsService;

    public List<Buildings>getAllBuildings(){
        return buildingsMapper.getAllBuildings();
    }


    public Buildings selectOneByBuildingsId(Integer building_id){
        return buildingsMapper.selectOneByBuildingsId(building_id);
    }

    public Boolean updateBuilding(Buildings buildings){
       return buildingsMapper.updateBuilding(buildings);
    }

    public int insertOne(Buildings buildings){
//        int role_id=buildings.getBuilding_id();
        buildingsMapper.insertOne(buildings);
        int building_id=buildings.getBuilding_id();
//        Rights right=new Rights();
//        right.setRight_name("关闭 设立");
//        right.setRight_desc("可以关闭和设立");
//        right.setRid(role_id);
//        right.setBid(building_id);
//        rightsService.insertOne(right);
        return building_id;
    }
}
