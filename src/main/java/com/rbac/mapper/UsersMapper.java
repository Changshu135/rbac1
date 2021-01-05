package com.rbac.mapper;

import com.rbac.bean.Users;
import org.apache.ibatis.annotations.One;
import org.apache.ibatis.annotations.Result;
import org.apache.ibatis.annotations.Results;

import java.util.List;

/**
 * @Author: Changshu
 * @Date: 2020/12/27 20:44
 * @Version 1.0
 */
public interface UsersMapper {

    String TABLE_NAME="users";
    String INSERT_FIELDS="username,password,gender,realName";
    String SELECT_FIELDS = "user_id, " + INSERT_FIELDS;

    List<Users>getAllUsers();

    Users selectOneByUsername(String username);

    Users selectOneByUserId(Integer users_id);

    int insertOne(Users user);

    int updateOne(Users user);

    int deleteOne(Integer user_id);

}
