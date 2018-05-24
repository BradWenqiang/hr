package manage.model;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class Employee {
    private String eid;//应聘者编号

    private String ename;//姓名	

    private String eage;//年龄

    private String education;//学历

    private String job;//应聘职位
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date sendtime;//投递时间

    public String getEid() {
        return eid;
    }

    public void setEid(String eid) {
        this.eid = eid == null ? null : eid.trim();
    }

    public String getEname() {
        return ename;
    }

    public void setEname(String ename) {
        this.ename = ename == null ? null : ename.trim();
    }

    public String getEage() {
        return eage;
    }

    public void setEage(String eage) {
        this.eage = eage == null ? null : eage.trim();
    }

    public String getEducation() {
        return education;
    }

    public void setEducation(String education) {
        this.education = education == null ? null : education.trim();
    }

    public String getJob() {
        return job;
    }

    public void setJob(String job) {
        this.job = job == null ? null : job.trim();
    }

    public Date getSendtime() {
        return sendtime;
    }

    public void setSendtime(Date sendtime) {
        this.sendtime = sendtime;
    }
}