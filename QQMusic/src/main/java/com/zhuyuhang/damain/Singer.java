package com.zhuyuhang.damain;

/**
 * @author Zhuyuhang
 */
public class Singer {
    private Integer id;
    private String account;
    private String password;
    private String name;
    private String head;
    private String introduction;

    public Singer() {
    }

    public Singer(Integer id, String account, String password, String name, String head, String introduction) {
        this.id = id;
        this.account = account;
        this.password = password;
        this.name = name;
        this.head = head;
        this.introduction = introduction;
    }

    @Override
    public String toString() {
        return "Singer{" +
                "id=" + id +
                ", account='" + account + '\'' +
                ", password='" + password + '\'' +
                ", name='" + name + '\'' +
                ", head='" + head + '\'' +
                ", introduction='" + introduction + '\'' +
                '}';
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getAccount() {
        return account;
    }

    public void setAccount(String account) {
        this.account = account;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getHead() {
        return head;
    }

    public void setHead(String head) {
        this.head = head;
    }

    public String getIntroduction() {
        return introduction;
    }

    public void setIntroduction(String introduction) {
        this.introduction = introduction;
    }
}
