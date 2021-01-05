package com.rbac.service;

import com.rbac.bean.Users;
import com.rbac.mapper.UsersMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @Author: Changshu
 * @Date: 2020/12/27 21:17
 * @Version 1.0
 */
@Service
public class UsersService {

    @Autowired
    public UsersMapper usersMapper;

    public List<Users>getAllUsers(){
        return usersMapper.getAllUsers();
    }

    public Users selectOneByUsername(String username){
        return usersMapper.selectOneByUsername(username);
    }

    public Users selectOneByUserId(Integer users_id){
        return usersMapper.selectOneByUserId(users_id);
    }

    public int insertOne(Users user){
        int r=usersMapper.insertOne(user);
        if(r==1)
            return user.getUser_id();
        return 0;
    }

    public int updateOne(Users user){
        int r=usersMapper.updateOne(user);
        if(r==1)
            return user.getUser_id();
        return 0;
    }

    public int deleteOne(Integer user_id){
        int r=usersMapper.deleteOne(user_id);
        return r;
    }

}
