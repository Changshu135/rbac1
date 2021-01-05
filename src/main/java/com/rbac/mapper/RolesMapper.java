package com.rbac.mapper;

import com.rbac.bean.Roles;
import org.apache.ibatis.annotations.Select;

import java.util.List;

/**
 * @Author: Changshu
 * @Date: 2020/12/27 19:46
 * @Version 1.0
 */
public interface RolesMapper {
    String TABLE_NAME="roles";
    String INSERT_FIELDS="role_name,role_desc,sub_rid";
    String SELECT_FIELDS = "role_id, " + INSERT_FIELDS;


    @Select({"select * from",TABLE_NAME})
    List<Roles> getAllRoles();

    Roles selectOneById(Integer rId);

    @Select({"select count(*) from", TABLE_NAME})
    int countRoles();

    int insertOne(Roles role);

    int updateOne(Roles role);

}
