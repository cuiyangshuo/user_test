package com.dj.ssm.controller.page;

import com.dj.ssm.pojo.User;
import com.dj.ssm.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * <h3>user_test</h3>
 * <p></p>
 *
 * @author : CYS
 * @date : 2020-07-07 18:07
 **/
@Controller
@RequestMapping("/user/")
public class UserPageController {

    @Autowired
    private UserService userService;

    @RequestMapping("toShow")
    public String toShow(){
        return "show";
    }

    @RequestMapping("toAdd")
    public String toAdd(){
        return "add";
    }
    @RequestMapping("toUpd")
    public String toUpd(Integer id, Model model) {
        User user = userService.getById(id);
        model.addAttribute("user", user);
        return "update";
    }

    @RequestMapping("toTest")
    public String toTest(){
        return "test";
    }

}
