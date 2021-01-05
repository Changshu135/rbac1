package com.rbac.service;

import com.rbac.bean.Roles;
import com.rbac.mapper.RolesMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.management.relation.Role;
import java.util.List;

/**
 * @Author: Changshu
 * @Date: 2020/12/27 20:00
 * @Version 1.0
 */
@Service
public class RolesService {
    @Autowired
    public RolesMapper rolesMapper;


    public List<Roles>getAllRoles(){
        return rolesMapper.getAllRoles();
    }


    public Roles selectOneById(Integer rId){
        return rolesMapper.selectOneById(rId);
    }

    public int insertOne(Roles role){
        return rolesMapper.insertOne(role);
    }

    public int updateOne(Roles role){
        return rolesMapper.updateOne(role);
    }

}
