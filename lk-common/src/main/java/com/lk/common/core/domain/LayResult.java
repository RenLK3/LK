package com.lk.common.core.domain;

import java.util.ArrayList;
import java.util.List;

public class LayResult {
    private int code;
    private String msg;
    private int count;
    private Object data;

    public LayResult() {
        code = 0;
        msg = "";
        count = 0;
        data = new ArrayList<>();
    }

    public LayResult(int code) {
        this.code = code;
        msg = "";
        count = 0;
        data = new ArrayList<>();
    }

    public LayResult(String msg) {
        this.msg = msg;
        code = 0;
        count = 0;
        data = new ArrayList<>();
    }

    public LayResult(int count, Object data) {
        this.msg = "";
        this.count = count;
        this.data = data;
    }

    public LayResult(int code, String msg, int count, Object data) {
        this.code = code;
        this.msg = msg;
        this.count = count;
        this.data = data;
    }

    public static LayResult ok() {
        return new LayResult();
    }

    public static LayResult error() {
        return new LayResult(-1, "", 0, 0);
    }

    public static LayResult error(String msg) {
        return new LayResult(-1, msg, 0, new ArrayList<>());
    }

    public static <T> LayResult page(List<T> data, int page, int limit) {
        return page(data.size(), data, page, limit);
    }

    public static <T> LayResult page(int count, List<T> data, int page, int limit) {
        return new LayResult(count, data.subList(limit * (page - 1), Math.min(((limit * (page - 1)) + limit), data.size())));
    }

    public int getCode() {
        return code;
    }

    public void setCode(int code) {
        this.code = code;
    }

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }

    public int getCount() {
        return count;
    }

    public void setCount(int count) {
        this.count = count;
    }

    public Object getData() {
        return data;
    }

    public void setData(Object data) {
        this.data = data;
    }

    @Override
    public String toString() {
        return "LayResult{" +
                "code=" + code +
                ", msg='" + msg + '\'' +
                ", count=" + count +
                ", data=" + data +
                '}';
    }
}
