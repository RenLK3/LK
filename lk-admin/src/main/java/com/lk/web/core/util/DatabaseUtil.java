package com.lk.web.core.util;

import com.lk.web.core.domain.Database;
import org.springframework.lang.NonNull;

import javax.validation.constraints.NotNull;
import java.lang.reflect.Field;
import java.sql.*;
import java.util.*;

/**
 * 通过反射 扫描类的属性 将数据赋值
 * List<VisFirm> firms = DatabaseUtil.connect(database).query(sql).createObject(VisFirm.class);
 *
 * @author LiKe_Ren
 */
public class DatabaseUtil {
    private Statement statement;
    private List<Map<String, Object>> result;

    public DatabaseUtil(Statement statement) {
        this.statement = statement;
    }

    /**
     * 连接数据库
     * @param database
     * @return
     * @throws SQLException
     * @throws ClassNotFoundException
     */
    public static DatabaseUtil connect(Database database) throws SQLException, ClassNotFoundException {
        return connect(database.getType() == 0 ? Database.Type.Oracle : Database.Type.SQLServer, database.getUrl(), database.getUsername(), database.getPassword());
    }

    /**
     * 连接数据库
     * @param type
     * @param url
     * @param username
     * @param password
     * @return
     * @throws ClassNotFoundException
     * @throws SQLException
     */
    public static DatabaseUtil connect(Database.Type type, String url, String username, String password) throws ClassNotFoundException, SQLException {
        if (type == Database.Type.Oracle) {
            Class.forName("oracle.jdbc.driver.OracleDriver");
        } else if (type == Database.Type.SQLServer) {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
        }
        return new DatabaseUtil(DriverManager.getConnection(url, username, password).createStatement());
    }

    /**
     * 查询数据库
     * @param sql
     * @return
     * @throws SQLException
     */
    public DatabaseUtil query(String... sql) throws SQLException {
        if (sql.length == 0) throw new NullPointerException("数据为空");
        return query(String.join(" ", sql));
    }

    /**
     * 查询数据库
     * @param sql
     * @return
     * @throws SQLException
     */
    public DatabaseUtil query(String sql) throws SQLException {
        if (statement == null) throw new NullPointerException("没有连接到数据库或连接数据库出错");
        result = convertMapList(statement.executeQuery(sql));
        statement.close();
        return this;
    }

    /**
     * 执行sql语句
     * @param sql
     * @return
     * @throws SQLException
     */
    public boolean execute(String sql) throws SQLException {
        if (statement == null) throw new NullPointerException("没有连接到数据库或连接数据库出错");
        boolean b = statement.execute(sql);
        statement.close();
        return b;
    }

    /**
     * 将返回set转换list<map>
     * @param set
     * @return
     * @throws SQLException
     */
    private List<Map<String, Object>> convertMapList(ResultSet set) throws SQLException {
        ResultSetMetaData resultSetMetaData = set.getMetaData();
        int cc = resultSetMetaData.getColumnCount();
        List<Map<String, Object>> maps = new ArrayList<>();
        while (set.next()) {
            Map<String, Object> map = new HashMap<>();
            for (int i = 0; i < cc; i++) {
                map.put(resultSetMetaData.getColumnName(i + 1).toUpperCase(), set.getObject(i + 1));
            }
            maps.add(map);
        }
        return maps;
    }

    /**
     * 通过类反射 给属性赋值 返回集合对象类
     * @param c  类
     * @param <T>
     * @return
     * @throws IllegalAccessException
     * @throws InstantiationException
     */
    public <T> List<T> createObjectList(Class<T> c) throws IllegalAccessException, InstantiationException {
        if (result == null) throw new NullPointerException("数据为空");
        List<T> list = new ArrayList<>();
        for (Map<String, Object> map : result) {
            T res = c.newInstance();
            Field[] fields = c.getDeclaredFields();
            for (Field f : fields) {
                f.setAccessible(true);
                String name = f.getName().toUpperCase();
                if (map.containsKey(name)) {
                    Object v = map.get(name);
                    f.set(res, v == null ? "" : v.toString());
                }
            }
            list.add(res);
        }
        return list;
    }

    public List<Map<String, Object>> getResult() {
        return result;
    }

}
