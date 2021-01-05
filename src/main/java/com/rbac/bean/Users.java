package com.rbac.bean;

import java.io.Serializable;

/**
 * @Author: Changshu
 * @Date: 2020/12/27 20:39
 * @Version 1.0
 */
public class Users implements Serializable {
    private Integer user_id;
    private String username;
    private String password;
    private String gender;
    private String realName;
//    private Integer rid;
    private Roles role;

    public Integer getUser_id() {
        return user_id;
    }

    public void setUser_id(Integer user_id) {
        this.user_id = user_id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public String getRealName() {
        return realName;
    }

    public void setRealName(String realName) {
        this.realName = realName;
    }

    public Roles getRole() {
        return role;
    }

    public void setRole(Roles role) {
        this.role = role;
    }

    public Users(){}

    public Users(Integer user_id, String username, String password, String gender, String realName, Roles role) {
        this.user_id = user_id;
        this.username = username;
        this.password = password;
        this.gender = gender;
        this.realName = realName;
        this.role = role;
    }

    @Override
    public String toString() {
        return "Users{" +
                "user_id=" + user_id +
                ", username='" + username + '\'' +
                ", password='" + password + '\'' +
                ", gender='" + gender + '\'' +
                ", realName='" + realName + '\'' +
                ", role=" + role +
                '}';
    }
}
