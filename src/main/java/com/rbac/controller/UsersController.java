package com.rbac.controller;

import com.rbac.bean.Roles;
import com.rbac.bean.Users;
import com.rbac.mapper.UsersMapper;
import com.rbac.service.RolesService;
import com.rbac.service.UsersService;
import com.rbac.util.JsonMsg;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

/**
 * @Author: Changshu
 * @Date: 2020/12/27 21:16
 * @Version 1.0
 */
@Controller
@RequestMapping(value="/user")
public class UsersController {

    @Autowired
    public UsersService usersService;
    @Autowired
    public RolesService rolesService;

    @RequestMapping(value = "/getAllUsers",method = RequestMethod.GET)
    public String getAllUsers(Model model){
        List<Users>users=usersService.getAllUsers();
        List<Roles>roles=rolesService.getAllRoles();
        model.addAttribute("users",users);
        model.addAttribute("roles",roles);
        return "users";

    }

    @RequestMapping(value = "/checkLogin", method = RequestMethod.POST)
    @ResponseBody
    public JsonMsg checkLogin(HttpServletRequest request){
        String username = request.getParameter("username");
        String password = request.getParameter("password");
//        System.out.println(username+" "+password);
        Users user=usersService.selectOneByUsername(username);
        if(user!=null&&user.getPassword().equals(password)){
            request.getSession().setAttribute("user",user);
            return JsonMsg.success();
        }
        return JsonMsg.fail().addInfo("Login_Error","账号或者密码错误");

    }

    //跳转到主界面
    @RequestMapping(value = "/main",method = RequestMethod.GET)
    public String main(HttpServletRequest request){
        if(request.getSession().getAttribute("user")==null){
            return "login";
        }
        return "main";
    }

    //退出登陆
    @RequestMapping(value = "/logout",method = RequestMethod.GET)
    public String logout(HttpServletRequest request){
        if(request.getSession().getAttribute("user")!=null){
            request.getSession().invalidate();
        }
        return "login";
    }

    @RequestMapping(value = "/insertOneUser",method = RequestMethod.POST)
    @ResponseBody
    public JsonMsg insertOneUser(Users user,@RequestParam("rid") Integer rid){
//        System.out.println(rid);
//        System.out.println(user);
        Roles role=rolesService.selectOneById(rid);
        user.setRole(role);
        usersService.insertOne(user);
        return JsonMsg.success();

    }

    @RequestMapping(value = "/updateOneUser",method = RequestMethod.POST)
    @ResponseBody
    public JsonMsg updateOneUser(Users user,@RequestParam("rid") Integer rid){
//        System.out.println(rid);
//        System.out.println(user);
        Roles role=rolesService.selectOneById(rid);
        user.setRole(role);
        usersService.updateOne(user);

        return JsonMsg.success();
    }

    @RequestMapping(value = "/deleteOneUser",method = RequestMethod.GET)
    @ResponseBody
    public JsonMsg deleteOneUser(@RequestParam("user_id") Integer user_id){
//        System.out.println(user_id);
        usersService.deleteOne(user_id);
        return JsonMsg.success();

    }



}
