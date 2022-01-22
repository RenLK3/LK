package com.lk.web.controller.port;

import com.lk.common.core.controller.BaseController;

import com.lk.common.core.domain.LayResult;
import com.lk.common.utils.StringUtils;
import com.lk.web.core.domain.Database;
import com.lk.web.core.util.DatabaseUtil;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiImplicitParam;
import io.swagger.annotations.ApiImplicitParams;
import io.swagger.annotations.ApiOperation;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * Oracle  "jdbc:oracle:thin:@//10.131.119.199:1521/CVMDB"  select sysdate from dual   cvmquser1
 * jdbc:sqlserver://10.162.245.63:1433;DatabaseName=GSCard01DB;
 * SELECT * FROM [dbo].[Vistor_Account]  vistorUser01
 *
 *
 * @author LiKe_Ren
 */
@Api("操作数据库")
@RestController
@RequestMapping("/database")
public class DatabaseController extends BaseController {

    private String prefix = "/database";

    @ApiOperation("SQL查询")
    @ApiImplicitParams({
            @ApiImplicitParam(name = "type", value = "数据库类型", dataType = "DatabaseEntity.Type",required = true),
            @ApiImplicitParam(name = "url", value = "jdbc连接字符串", dataType = "String",required = true,example = "jdbc:oracle:thin:@//10.131.119.199:1521/CVMDB"),
            @ApiImplicitParam(name = "username", value = "用户名", dataType = "String",required = true),
            @ApiImplicitParam(name = "password", value = "密码", dataType = "String",required = true),
            @ApiImplicitParam(name = "sql", value = "sql查询语句", dataType = "String",required = true)
    })
    @PostMapping("/query")
    public LayResult query(Database database) {
        if (StringUtils.isNull(database.getUrl()) || StringUtils.isNull(database.getUsername()) || StringUtils.isNull(database.getSql()) || StringUtils.isNull(database.getPassword())) {
            return error("参数其中一项不能为空");
        }

        try {
            return new LayResult(0,DatabaseUtil.connect(database).query(database.getSql()));
        } catch (Exception e) {
            return error("运行时发生错误:" + e.getMessage());
        }
    }

    @ApiOperation("SQL执行")
    @ApiImplicitParams({
            @ApiImplicitParam(name = "type", value = "数据库类型", dataType = "DatabaseEntity.Type",required = true),
            @ApiImplicitParam(name = "url", value = "jdbc连接字符串", dataType = "String",required = true,example = "jdbc:sqlserver://10.162.245.63:1433;DatabaseName=GSCard01DB"),
            @ApiImplicitParam(name = "username", value = "用户名", dataType = "String",required = true),
            @ApiImplicitParam(name = "password", value = "密码", dataType = "String",required = true),
            @ApiImplicitParam(name = "sql", value = "sql执行语句", dataType = "String",required = true)
    })
    @PostMapping("/execute")
    public LayResult execute(Database database) {
        if (StringUtils.isNull(database.getUrl()) || StringUtils.isNull(database.getUsername()) || StringUtils.isNull(database.getSql()) || StringUtils.isNull(database.getPassword())) {
            return error("参数其中一项不能为空");
        }
        try {
            return new LayResult(0,DatabaseUtil.connect(database).execute(database.getSql()));
        } catch (Exception e) {
            return error("运行时发生错误:" + e.getMessage());
        }
    }
}

