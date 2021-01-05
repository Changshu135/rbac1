package com.rbac.service;

import com.rbac.bean.Rights;
import com.rbac.mapper.RightsMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @Author: Changshu
 * @Date: 2020/12/28 10:06
 * @Version 1.0
 */
@Service
public class RightsService {
    @Autowired
    private RightsMapper rightsMapper;

    public List<Rights>getAllRights(){
        return rightsMapper.getAllRights();
    }

    public Rights selectOneByRightsId(Integer right_id){
        return rightsMapper.selectOneByRightsId(right_id);
    }

    public Rights selectByRoleIdAndBuildingId(Integer rId,Integer bId){
        return rightsMapper.selectByRoleIdAndBuildingId(rId,bId);
    }

    public int insertOne(Rights right){
        return rightsMapper.insertOne(right);
    }


    public  int updateOne(Rights right){
        return rightsMapper.updateOne(right);
    }
}
