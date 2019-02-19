package com.zbq.Model;

import javax.persistence.*;

@Entity
@Table(name = "t_house")
public class House {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Integer eid;
    private String ename;
    private Integer eis;

    public Integer getEid() {
        return eid;
    }

    public void setEid(Integer eid) {
        this.eid = eid;
    }

    public String getEname() {
        return ename;
    }

    public void setEname(String ename) {
        this.ename = ename;
    }

    public Integer getEis() {
        return eis;
    }

    public void setEis(Integer eis) {
        this.eis = eis;
    }
}
