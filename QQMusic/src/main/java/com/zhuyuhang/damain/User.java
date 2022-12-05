package com.zhuyuhang.damain;

import java.util.Date;

/**
 * @author Zhuyuhang
 */
public class User {
    private int id;
    private String account;
    private String password;
    private String name;
    private String head;
    private String introduction;
    private Date register_time;

    public User() {
    }

    public User(int id, String account, String password, String name, String head, String introduction, Date register_time) {
        this.id = id;
        this.account = account;
        this.password = password;
        this.name = name;
        this.head = head;
        this.introduction = introduction;
        this.register_time = register_time;
    }

    @Override
    public String toString() {
        return "User{" +
                "id=" + id +
                ", account='" + account + '\'' +
                ", password='" + password + '\'' +
                ", name='" + name + '\'' +
                ", head='" + head + '\'' +
                ", introduction='" + introduction + '\'' +
                ", register_time=" + register_time +
                '}';
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
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

    public Date getRegister_time() {
        return register_time;
    }

    public void setRegister_time(Date register_time) {
        this.register_time = register_time;
    }
}
