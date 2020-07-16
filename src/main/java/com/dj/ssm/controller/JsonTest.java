package com.dj.ssm.controller;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.dj.ssm.pojo.User;

import java.util.List;

/**
 * <h3>user_test</h3>
 * <p>JSON</p>
 *
 * @author : CYS
 * @date : 2020-07-14 08:56
 **/
public class JsonTest {
    public static void main(String[] args) {
        //json格式字符串转对象
        String str = "{\"id\": 1,\"userName\": \"kkkk\",\"userPwd\": \"123456\" }";
        JSONObject jsonObject = JSONObject.parseObject(str);
        User user = jsonObject.toJavaObject(User.class);
        System.out.println(user.getId() + " - " + user.getUserName() + " - " + user.getUserPwd());
        //User user1 = JSONObject.parseObject(str, User.class);
        //对象转json字符串
        String s = JSONObject.toJSONString(user);
        System.out.println(s);

        //json数组转对象
        String arr = "[{ \"id\": 1, \"userName\": \"kkkk\", \"userPwd\": \"123456\" },{ \"id\": 4, \"userName\": \"khkhsss\", \"userPwd\": \"123\" },{ \"id\": 5, \"userName\": \"www\", \"userPwd\": \"123\" }]";
        JSONArray jsonArray = JSONArray.parseArray(arr);
        List<User> userList = jsonArray.toJavaList(User.class);
        // String s1 = jsonArray.toJSONString(userList);
        for (User u : userList) {
            System.out.println(u);
        }

    }

}
