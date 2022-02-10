package com.lk.web.core.domain;



/**
 *
 * @author LiKe_Ren
 */

public class Database {
//    @ApiModelProperty(value = "数据库类型")
    public int type;
//    @ApiModelProperty(value = "地址")
    public String url;
//    @ApiModelProperty(value = "用户名")
    public String username;
//    @ApiModelProperty(value = "密码")
    public String password;
//    @ApiModelProperty(value = "sql")
    public String sql;


    public enum Type {
        Oracle, SQLServer
    }

    public Database(int type, String url, String username, String password, String sql) {
        this.type = type;
        this.url = url;
        this.username = username;
        this.password = password;
        this.sql = sql;
    }
    public Database(Type type, String url, String username, String password, String sql) {
        this.type = type == Type.Oracle ? 0 : 1;
        this.url = url;
        this.username = username;
        this.password = password;
        this.sql = sql;
    }

    public int getType() {
        return type;
    }

    public void setType(int type) {
        this.type = type;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getSql() {
        return sql;
    }

    public void setSql(String sql) {
        this.sql = sql;
    }
}
