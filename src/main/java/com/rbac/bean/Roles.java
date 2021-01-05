package com.rbac.bean;

import java.io.Serializable;

/**
 * @Author: Changshu
 * @Date: 2020/12/27 19:49
 * @Version 1.0
 */
public class Roles implements Serializable {
    private Integer role_id;
    private String role_name;
    private String role_desc;
    private String sub_rid;

    public Integer getRole_id() {
        return role_id;
    }

    public void setRole_id(Integer role_id) {
        this.role_id = role_id;
    }

    public String getRole_name() {
        return role_name;
    }

    public void setRole_name(String role_name) {
        this.role_name = role_name;
    }

    public String getRole_desc() {
        return role_desc;
    }

    public void setRole_desc(String role_desc) {
        this.role_desc = role_desc;
    }

    public String getSub_rid() {
        return sub_rid;
    }

    public void setSub_rid(String sub_rid) {
        this.sub_rid = sub_rid;
    }

    public Roles(){}

    public Roles(Integer role_id, String role_name, String role_desc, String sub_rid) {
        this.role_id = role_id;
        this.role_name = role_name;
        this.role_desc = role_desc;
        this.sub_rid = sub_rid;
    }

    @Override
    public String toString() {
        return "Roles{" +
                "role_id=" + role_id +
                ", role_name='" + role_name + '\'' +
                ", role_desc='" + role_desc + '\'' +
                ", sub_rid='" + sub_rid + '\'' +
                '}';
    }
}
