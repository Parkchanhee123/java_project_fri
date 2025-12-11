package org.kio.app.controller;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.io.IOException;
import java.net.URLEncoder;
import java.util.List;

@Controller
@Slf4j
@RequiredArgsConstructor
public class MainController {

    @Value("${app.url.server-url}")
    private String serverurl;


    @RequestMapping("/")
    public String main(Model model) {
        // log.info("Started Main");
        model.addAttribute("serverurl", serverurl);
        return "index";
    }
}


