package com.dj.ssm.controller;

import com.alibaba.fastjson.JSONObject;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.dj.ssm.pojo.ResultModel;
import com.dj.ssm.pojo.User;
import com.dj.ssm.pojo.UserQuery;
import com.dj.ssm.service.UserService;

import com.dj.ssm.util.HttpClientUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * <h3>user_test</h3>
 * <p></p>
 *
 * @author : CYShh
 * idea测试ct
 * @date : 2020-07-07 16:59
 **/
@RestController
@RequestMapping("/user/")
public class UserController {

    @Autowired
    private UserService userService;

    @RequestMapping("list")
        public ResultModel list(Integer pageNo, UserQuery userQuery){
        try{
            QueryWrapper<User> queryWrapper = new QueryWrapper<>();
            if(!StringUtils.isEmpty(userQuery.getUserName())){
                queryWrapper.like("user_name",userQuery.getUserName());
            }
            if(!StringUtils.isEmpty(userQuery.getStartAge())){
                queryWrapper.ge("age",userQuery.getStartAge());
            }
            if(!StringUtils.isEmpty(userQuery.getEndAge())){
                queryWrapper.le("age",userQuery.getEndAge());
            }
            if(userQuery.getSex() != null && !StringUtils.isEmpty(userQuery.getSex())){
                queryWrapper.eq("sex",userQuery.getSex());
            }
            if(userQuery.getHobbys() != null && !StringUtils.isEmpty(userQuery.getHobbys())){
                queryWrapper.in("hobbys",userQuery.getHobbys());
            }
            IPage<User> page = new Page<>(pageNo, 2);
            IPage<User> pageInfo = userService.page(page, queryWrapper);
            Map<String, Object> map = new HashMap<>();
            map.put("userList",pageInfo.getRecords());
            map.put("pages",pageInfo.getPages());
            return new ResultModel().success(map);
        }catch (Exception e){
            e.printStackTrace();
            return new ResultModel().error("失败！");
        }
    }

/**
 * 功能描述: 增加
 * @Param: [user]
 * @Return: com.dj.ssm.pojo.ResultModel
 * @Author: CYS
 * @Date: 2020/7/13 10:47
 */
    @PostMapping
    public ResultModel insert(User user){
        try{
            userService.save(user);
            return new ResultModel().success();
        }catch (Exception e){
            e.printStackTrace();
            return new ResultModel().error("失败！");
        }
    }

/**
 * 功能描述: 修改
 * @Param: [user]
 * @Return: com.dj.ssm.pojo.ResultModel
 * @Author: CYS
 * @Date: 2020/7/13 10:46
 */
    @PutMapping
    public ResultModel update(@RequestBody User user){
        try{
            userService.updateById(user);
            return new ResultModel().success();
        }catch (Exception e){
            e.printStackTrace();
            return new ResultModel().error("失败！");
        }
    }

/**
 * 功能描述: 通过id删除
 * @Param: [id]
 * @Return: com.dj.ssm.pojo.ResultModel
 * @Author: CYS
 * @Date: 2020/7/13 10:49
 */
    @DeleteMapping
    public ResultModel delete(@RequestBody User user){
        try{
            userService.removeById(user.getId());
            return new ResultModel().success();
        }catch (Exception e){
            e.printStackTrace();
            return new ResultModel().error("失败！");
        }
    }

/**
 * 功能描述: 通过id查询
 * @Param: [id]
 * @Return: com.dj.ssm.pojo.ResultModel
 * @Author: CYSmove
 *
 * @Date: 2020/7/13 10:49
 */
    @GetMapping("{id}")
    public ResultModel get(@PathVariable Integer id){
        try{
            User user = userService.getById(id);
            return new ResultModel().success(user);
        }catch (Exception e){
            e.printStackTrace();
            return new ResultModel().error("失败！");
        }
    }

/**
 * 功能描述: 分页和页数的展示
 * @Param: [pageNo, pageSize]
 * @Return: com.dj.ssm.pojo.ResultModel
 * @Author: CYS
 * @Date: 2020/7/13 10:49
 */
    @GetMapping
    public ResultModel list1(Integer pageNo,Integer pageSize){
        try{
            IPage pageInfo = new Page(pageNo, pageSize);
            IPage page = userService.page(pageInfo);
            return new ResultModel().success(page);
        } catch (Exception e){
            e.printStackTrace();
            return new ResultModel().error("失败！");
        }
    }

/**
 * 功能描述: 条件查询
 * @Param: [user]
 * @Return: com.dj.ssm.pojo.ResultModel
 * @Author: CYS
 * @Date: 2020/7/13 10:50
 */
    @PostMapping("list")
    public ResultModel list2(@RequestBody User user){
        try{
            QueryWrapper<User> queryWrapper = new QueryWrapper<>();
            queryWrapper.like("user_name",user.getUserName());
            List<User> list = userService.list(queryWrapper);
            return new ResultModel().success(list);
        }catch (Exception e){
            e.printStackTrace();
            return new ResultModel().error("失败！");  
        }
    }

/**
 * 功能描述:
 * @Param: [url]
 * @Return: com.dj.ssm.pojo.ResultModel<java.lang.Object>
 * @Author: CYS
 * @Date: 2020/7/14 9:47
 */
    @RequestMapping("test")
    public ResultModel<Object> test(String url) {
        try {
            String s = HttpClientUtil.sendHttpRequest(url, HttpClientUtil.HttpRequestMethod.GET, null);
            System.out.println(s);
            JSONObject object = JSONObject.parseObject(s);
            if (object.getInteger("code").equals(200)) {
                return new ResultModel<>().success(object.get("data"));
            } else {
                return new ResultModel<>().error(object.getString("msg"));
            }
        } catch (Exception e) {
            e.printStackTrace();
            return new ResultModel<>().error("服务器异常,请稍后再试");
        }

    }
    @RequestMapping("upload")
    public ResultModel<Object> upload(MultipartFile file) {
        try {
            String filename = file.getOriginalFilename();
            System.out.println(filename);
            if (!file.isEmpty()) {
                String dirPath = "E:/upload/";
                File f = new File(dirPath);
                if (!f.exists()) {
                    f.mkdirs();
                }
                file.transferTo(new File(dirPath + filename));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return null;

    }

}
