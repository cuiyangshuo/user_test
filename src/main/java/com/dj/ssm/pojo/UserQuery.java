package com.dj.ssm.pojo;

import lombok.Data;
import lombok.experimental.Accessors;

import java.util.List;

/**
 * <h3>user_test</h3>
 * <p>用户查询对象</p>
 *
 * @author : CYS
 * @date : 2020-07-09 09:29
 **/
@Data
public class UserQuery {

    private String userName;

    private Integer startAge;

    private Integer endAge;

    private Integer sex;

    private List<Integer> hobbys;
}
