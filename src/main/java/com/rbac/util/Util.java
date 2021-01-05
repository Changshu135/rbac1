package com.rbac.util;

import com.rbac.bean.Buildings;
import com.rbac.bean.Rights;
import com.rbac.bean.Roles;
import com.rbac.bean.Users;
import com.rbac.service.BuildingsService;
import com.rbac.service.RightsService;
import com.rbac.service.RolesService;
import com.rbac.service.UsersService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.ArrayDeque;
import java.util.LinkedList;
import java.util.Queue;

/**
 * @Author: Changshu
 * @Date: 2020/12/28 16:29
 * @Version 1.0
 */
@Component
public class Util {
    @Autowired
    private UsersService usersService;
    @Autowired
    private RolesService rolesService;
    @Autowired
    private RightsService rightsService;
    @Autowired
    private BuildingsService buildingsService;

    //保存递归程序的中间值
//    private String str_rights;

    public Boolean rightsJudge(Integer roles_id,Integer building_id,String rightName){
        String res="";
        res=getStrRightsByRIdAndBId(roles_id,building_id);
        System.out.println(res);
        if(res.contains(rightName))
            return true;
        return false;

    }

    //层序遍历
    private String getStrRightsByRIdAndBId(Integer rId,Integer bId){
        Queue<Integer>queue=new LinkedList<>();
        String res="";
        queue.add(rId);
        while (!queue.isEmpty()){
            Integer queue_rId=queue.poll();
            Roles role=rolesService.selectOneById(queue_rId);
            Rights right=rightsService.selectByRoleIdAndBuildingId(role.getRole_id(),bId);
            if(right!=null){
                res+=right.getRight_name();
            }
            if(role!=null){
                String sub_ids=role.getSub_rid();
                if(sub_ids!=null&&!sub_ids.equals("")){
                    for(String s:sub_ids.split(" ")){
                        queue.add(Integer.parseInt(s));
                    }
                }
            }
        }
        return res;
    }
}
