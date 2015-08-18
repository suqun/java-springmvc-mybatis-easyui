package snipe.mybatis.model;

import java.util.Date;

public class RoleResource extends RoleResourceKey {
    private Date createtime;

    private Date updatetime;

    private String careateuserid;

    private String updateuserid;

    private String datastate;

    public Date getCreatetime() {
        return createtime;
    }

    public void setCreatetime(Date createtime) {
        this.createtime = createtime;
    }

    public Date getUpdatetime() {
        return updatetime;
    }

    public void setUpdatetime(Date updatetime) {
        this.updatetime = updatetime;
    }

    public String getCareateuserid() {
        return careateuserid;
    }

    public void setCareateuserid(String careateuserid) {
        this.careateuserid = careateuserid == null ? null : careateuserid.trim();
    }

    public String getUpdateuserid() {
        return updateuserid;
    }

    public void setUpdateuserid(String updateuserid) {
        this.updateuserid = updateuserid == null ? null : updateuserid.trim();
    }

    public String getDatastate() {
        return datastate;
    }

    public void setDatastate(String datastate) {
        this.datastate = datastate == null ? null : datastate.trim();
    }
}