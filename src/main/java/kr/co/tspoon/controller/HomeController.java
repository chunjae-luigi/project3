package kr.co.tspoon.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

@Controller
public class HomeController {
    // http:localhost:8081/pro03_war == root
    // http:localhost:8081/pro03_war/index.jsp == http:localhost:8081/pro03_war/WEB-INF/views/index.jsp
    @RequestMapping(value = "/", method = RequestMethod.GET)
    public String index(Model model){
        return "/index";
    }
}
