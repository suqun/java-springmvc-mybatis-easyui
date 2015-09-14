package snipe.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * Created by larry on 9/14/15.
 * 登陆
 */
@Controller
public class LoginController {
    /**
     * 跳转到登陆页面
     *
     * @return login.jsp
     */
    @RequestMapping("/index")
    public String login() {
        return "/login";
    }
}
