package manage.model;

import java.util.Date;

public class Pay {
    private String account;

    private String username;

    private Date paytime;

    private String basewage;

    private String paywage;

    private String booleanpay;

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

    public Date getPaytime() {
        return paytime;
    }

    public void setPaytime(Date paytime) {
        this.paytime = paytime;
    }

    public String getBasewage() {
        return basewage;
    }

    public void setBasewage(String basewage) {
        this.basewage = basewage == null ? null : basewage.trim();
    }

    public String getPaywage() {
        return paywage;
    }

    public void setPaywage(String paywage) {
        this.paywage = paywage == null ? null : paywage.trim();
    }

    public String getBooleanpay() {
        return booleanpay;
    }

    public void setBooleanpay(String booleanpay) {
        this.booleanpay = booleanpay == null ? null : booleanpay.trim();
    }
}