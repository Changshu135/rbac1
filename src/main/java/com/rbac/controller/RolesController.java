package com.rbac.controller;

import com.rbac.bean.Buildings;
import com.rbac.bean.Rights;
import com.rbac.bean.Roles;
import com.rbac.bean.Users;
import com.rbac.service.BuildingsService;
import com.rbac.service.RightsService;
import com.rbac.service.RolesService;
import com.rbac.util.JsonMsg;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

/**
 * @Author: Changshu
 * @Date: 2020/12/27 20:03
 * @Version 1.0
 */
@Controller
@RequestMapping(value="/roles")
public class RolesController {
    @Autowired
    private RolesService rolesService;
    @Autowired
    private BuildingsService buildingsService;
    @Autowired
    private RightsService rightsService;

    @RequestMapping(value = "/getAllRoles",method = RequestMethod.GET)
    public String getAllRoles(Model model){
        List<Roles>roles=rolesService.getAllRoles();
        List<Buildings>buildings=buildingsService.getAllBuildings();
        model.addAttribute("buildings",buildings);
        model.addAttribute("roles",roles);
        return "roles";
    }

    @RequestMapping(value = "/updateBuildingRights",method = RequestMethod.POST)
    @ResponseBody
    public JsonMsg updateBuildingRights(@RequestParam("roles_id")String roles_id,
                                        @RequestParam("rights_name")String rights_name,
                                        @RequestParam("building_ids")String[] building_ids){
        Integer rid=Integer.parseInt(roles_id);
        for(String s:building_ids){
            Integer id=Integer.parseInt(s);
            Rights right=rightsService.selectByRoleIdAndBuildingId(rid,id);
            if(right==null){
                right=new Rights();
                right.setRight_name(rights_name);
                right.setRight_desc("可以"+rights_name);
                right.setRid(rid);
                right.setBid(id);
                rightsService.insertOne(right);
            }else {
                System.out.println(right);
                if (right.getRight_name() != null && !right.getRight_name().contains(rights_name)) {
                    right.setRight_name(right.getRight_name() + " " + rights_name);
                    right.setRight_desc(right.getRight_desc()+" "+rights_name);
                    rightsService.updateOne(right);
                }
            }
        }
        return JsonMsg.success();
    }


    @RequestMapping(value = "/insertOneRole",method = RequestMethod.POST)
    @ResponseBody
    public JsonMsg insertOneRole(@RequestParam("role_ids")String[] role_ids,
                                 @RequestParam("roles_name")String roles_name,
                                 @RequestParam("role_desc")String role_desc){
        String sub_ids="";
        for(String s:role_ids){
            sub_ids+=s+" ";
        }
//        System.out.println(role_desc+" "+roles_name);
        Roles role=new Roles();
        role.setRole_name(roles_name);
        role.setRole_desc(role_desc);
        role.setSub_rid(sub_ids);
        rolesService.insertOne(role);
        return JsonMsg.success();
    }

    @RequestMapping(value = "/updateOneRole",method = RequestMethod.POST)
    @ResponseBody
    public JsonMsg updateOneRole(@RequestParam("role_ids")String[] role_ids,
                                 @RequestParam("roles_name")String roles_name,
                                 @RequestParam("role_desc")String role_desc,
                                 @RequestParam("role_id")String role_id){
        String sub_ids="";
        for(String s:role_ids){
            if(!s.equals(role_id))
                sub_ids+=s+" ";
        }
//        System.out.println(role_desc+" "+roles_name);
        Roles role=new Roles();
        role.setRole_id(Integer.parseInt(role_id));
        role.setRole_name(roles_name);
        role.setRole_desc(role_desc);
        role.setSub_rid(sub_ids);
        rolesService.updateOne(role);
        return JsonMsg.success();
    }




}
