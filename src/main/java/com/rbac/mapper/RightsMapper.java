package com.rbac.mapper;

import com.rbac.bean.Rights;
import org.apache.ibatis.annotations.Select;

import java.util.List;

/**
 * @Author: Changshu
 * @Date: 2020/12/28 9:54
 * @Version 1.0
 */
    public interface RightsMapper {

    String TABLE_NAME="rights";
    String INSERT_FIELDS="right_name,right_desc,rid,bid";
    String SELECT_FIELDS = "right_id, " + INSERT_FIELDS;

    @Select({"select * from",TABLE_NAME})
    List<Rights>getAllRights();

    Rights selectOneByRightsId(Integer right_id);

    Rights selectByRoleIdAndBuildingId(Integer rId,Integer bId);

    int insertOne(Rights right);

    int updateOne(Rights right);

}
