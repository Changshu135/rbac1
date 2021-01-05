package com.rbac.bean;

import java.io.Serializable;

/**
 * @Author: Changshu
 * @Date: 2020/12/28 9:49
 * @Version 1.0
 */
public class Buildings implements Serializable {
    private Integer building_id;
    private String building_name;
    private String building_desc;
    private Boolean Open;

    public Integer getBuilding_id() {
        return building_id;
    }

    public void setBuilding_id(Integer building_id) {
        this.building_id = building_id;
    }

    public String getBuilding_name() {
        return building_name;
    }

    public void setBuilding_name(String building_name) {
        this.building_name = building_name;
    }

    public String getBuilding_desc() {
        return building_desc;
    }

    public void setBuilding_desc(String building_desc) {
        this.building_desc = building_desc;
    }

    public Boolean getOpen() {
        return Open;
    }

    public void setOpen(Boolean open) {
        Open = open;
    }

    public Buildings(){}

    public Buildings(Integer building_id, String building_name, String building_desc, Boolean open) {
        this.building_id = building_id;
        this.building_name = building_name;
        this.building_desc = building_desc;
        Open = open;
    }

    @Override
    public String toString() {
        return "Buildings{" +
                "building_id=" + building_id +
                ", building_name='" + building_name + '\'' +
                ", building_desc='" + building_desc + '\'' +
                ", Open=" + Open +
                '}';
    }
}
