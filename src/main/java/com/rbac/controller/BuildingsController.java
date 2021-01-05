package com.rbac.controller;

import com.rbac.bean.Buildings;
import com.rbac.bean.Rights;
import com.rbac.bean.Users;
import com.rbac.service.BuildingsService;
import com.rbac.service.RightsService;
import com.rbac.util.JsonMsg;
import com.rbac.util.Util;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

/**
 * @Author: Changshu
 * @Date: 2020/12/28 15:31
 * @Version 1.0
 */
@Controller
@RequestMapping(value="/building")
public class BuildingsController {
    @Autowired
    public BuildingsService buildingsService;
    @Autowired
    public RightsService rightsService;
    @Autowired
    public Util util;

    @RequestMapping(value = "/toBuildingPage",method = RequestMethod.GET)
    public ModelAndView toBuildingPage(){
        ModelAndView mv=new ModelAndView("buildings");
        List<Buildings>buildings=buildingsService.getAllBuildings();
        mv.addObject("buildings", buildings);
        return mv;
    }

    @RequestMapping(value = "/isPermitted", method = RequestMethod.POST)
    @ResponseBody
    public JsonMsg isPermitted(@RequestParam("roles_id") Integer roles_id,
                               @RequestParam("building_id") Integer building_id,
                               @RequestParam("rights_name")String rights_name){
        if(util.rightsJudge(roles_id,building_id,rights_name)){
            return JsonMsg.success();
        }
        return JsonMsg.fail();
    }

    @RequestMapping(value = "/switchOpen", method = RequestMethod.POST)
    @ResponseBody
    public JsonMsg switchOpen(@RequestParam("roles_id") Integer roles_id,
                              @RequestParam("building_id") Integer building_id,
                              @RequestParam("rights_name") String rights_name){
        if(util.rightsJudge(roles_id,building_id,rights_name)){
            Buildings building=buildingsService.selectOneByBuildingsId(building_id);
            if(building.getOpen())
                building.setOpen(false);
            else
                building.setOpen(true);
            buildingsService.updateBuilding(building);
            return JsonMsg.success();
        }
//        return JsonMsg.fail().addInfo("building_error","你没有权限");
        return JsonMsg.fail();
    }


    @RequestMapping(value = "/insertOne",method = RequestMethod.POST)
    @ResponseBody
    public JsonMsg insertOne(@RequestParam("building_name") String building_name,
                          @RequestParam("building_desc") String building_desc,
                             HttpServletRequest request){
        System.out.println(building_desc+building_name);
        Buildings building=new Buildings();
        Users user=(Users)request.getSession().getAttribute("user");
        building.setBuilding_name(building_name);
        building.setBuilding_desc(building_desc);
        Integer building_id=buildingsService.insertOne(building);

        Rights rights=new Rights();
        rights.setRight_name("关闭 设立");
        rights.setRight_desc("可以关闭和设立");
        rights.setRid(user.getRole().getRole_id());
        rights.setBid(building_id);
        rightsService.insertOne(rights);
        return JsonMsg.success();
    }


}
