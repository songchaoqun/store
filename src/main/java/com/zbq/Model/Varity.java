package com.zbq.Model;

import javax.persistence.*;

@Entity
@Table(name = "t_varity")
public class Varity {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Integer vid;
    private Integer eid;
    private String vname;
    private Integer vprice;
    @Transient
    private String ename;
    @Transient
    private Integer eis;

    public Integer getVid() {
        return vid;
    }

    public void setVid(Integer vid) {
        this.vid = vid;
    }

    public Integer getEid() {
        return eid;
    }

    public void setEid(Integer eid) {
        this.eid = eid;
    }

    public String getVname() {
        return vname;
    }

    public void setVname(String vname) {
        this.vname = vname;
    }

    public Integer getVprice() {
        return vprice;
    }

    public void setVprice(Integer vprice) {
        this.vprice = vprice;
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
