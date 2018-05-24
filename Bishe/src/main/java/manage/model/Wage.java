package manage.model;

public class Wage {
    private String account;

    private String username;

    private String departments;

    private String bsalary;

    private String premium;

    public String getAccount() {
        return account;
    }

    public void setAccount(String account) {
        this.account = account == null ? null : account.trim();
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username == null ? null : username.trim();
    }

    public String getDepartments() {
        return departments;
    }

    public void setDepartments(String departments) {
        this.departments = departments == null ? null : departments.trim();
    }

    public String getBsalary() {
        return bsalary;
    }

    public void setBsalary(String bsalary) {
        this.bsalary = bsalary == null ? null : bsalary.trim();
    }

    public String getPremium() {
        return premium;
    }

    public void setPremium(String premium) {
        this.premium = premium == null ? null : premium.trim();
    }
}