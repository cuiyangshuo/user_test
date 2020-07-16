package com.dj.ssm.pojo;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;
import lombok.experimental.Accessors;

/**
 * <h3>user_test</h3>
 * <p></p>
 *
 * @author : CYS
 * @date : 2020-07-07 16:38
 **/
@Data
@TableName("dj_user")
public class User {
    @TableId(type = IdType.AUTO)
    private  Integer id;

    private String userName;

    private String userPwd;

    private Integer age;

    private Integer sex;

    private Integer hobbys;

}
