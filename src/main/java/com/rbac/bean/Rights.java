package com.rbac.bean;

import java.io.Serializable;

/**
 * @Author: Changshu
 * @Date: 2020/12/28 9:52
 * @Version 1.0
 */
public class Rights implements Serializable {

    private Integer right_id;
    private String right_name;
    private String right_desc;
    private Integer rid;
    private Integer bid;

    public Rights(){}

    public Rights(Integer right_id, String right_name, String right_desc, Integer rid, Integer bid) {
        this.right_id = right_id;
        this.right_name = right_name;
        this.right_desc = right_desc;
        this.rid = rid;
        this.bid = bid;
    }


    public Integer getRight_id() {
        return right_id;
    }

    public void setRight_id(Integer right_id) {
        this.right_id = right_id;
    }

    public String getRight_name() {
        return right_name;
    }

    public void setRight_name(String right_name) {
        this.right_name = right_name;
    }

    public String getRight_desc() {
        return right_desc;
    }

    public void setRight_desc(String right_desc) {
        this.right_desc = right_desc;
    }

    public Integer getRid() {
        return rid;
    }

    public void setRid(Integer rid) {
        this.rid = rid;
    }

    public Integer getBid() {
        return bid;
    }

    public void setBid(Integer bid) {
        this.bid = bid;
    }

    @Override
    public String toString() {
        return "Rights{" +
                "right_id=" + right_id +
                ", right_name='" + right_name + '\'' +
                ", right_desc='" + right_desc + '\'' +
                ", rid=" + rid +
                ", bid=" + bid +
                '}';
    }
}
