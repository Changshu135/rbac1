package com.rbac.mapper;

import com.rbac.bean.Buildings;
import org.apache.ibatis.annotations.Select;

import java.util.List;

/**
 * @Author: Changshu
 * @Date: 2020/12/28 9:54
 * @Version 1.0
 */
public interface BuildingsMapper {
    String TABLE_NAME="buildings";
    String INSERT_FIELDS="building_name,building_desc,open";
    String SELECT_FIELDS = "building_id, " + INSERT_FIELDS;

    @Select({"select * from",TABLE_NAME})
    List<Buildings>getAllBuildings();

    Buildings selectOneByBuildingsId(Integer building_id);

    Boolean updateBuilding(Buildings building);

    int insertOne(Buildings building);


}
