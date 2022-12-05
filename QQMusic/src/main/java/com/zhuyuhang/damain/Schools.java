package com.zhuyuhang.damain;

/**
 * @author Zhuyuhang
 */
public class Schools {
    private Integer id;
    private String schools_name;

    public Schools() {
    }

    public Schools(Integer id, String schools_name) {
        this.id = id;
        this.schools_name = schools_name;
    }

    @Override
    public String toString() {
        return "Schools{" +
                "id=" + id +
                ", schools_name='" + schools_name + '\'' +
                '}';
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getSchools_name() {
        return schools_name;
    }

    public void setSchools_name(String schools_name) {
        this.schools_name = schools_name;
    }
}
