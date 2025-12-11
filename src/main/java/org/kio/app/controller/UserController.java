package org.kio.app.controller;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.io.IOException;
import java.net.URLEncoder;
import java.util.Date;
import java.util.List;

import org.kio.app.service.UsersService;
import org.kio.app.service.DocService;
import org.kio.app.service.ResService;
import org.kio.app.service.HistoryService;
import org.kio.app.dto.UsersDto;
import org.kio.app.dto.DocDto;
import org.kio.app.dto.ResDto;
import org.kio.app.dto.HistoryDto;

@Controller
@RequestMapping("/user")
@RequiredArgsConstructor
public class UserController {
    @Value("${app.url.server-url}")
    private String serverurl;
    private final DocService docService;
    private final ResService resService;
    private final UsersService usersService;
    private final HistoryService historyService;
    @GetMapping("/join")
    public String UserJoin(@RequestParam(value="phoneNumber",required=false) String phoneNumber, Model model){

        model.addAttribute("phoneNumber", phoneNumber);
        
        return "Join";
    }
    @GetMapping("/login")
    public String UserLogin(@RequestParam(value="type",required=false) String type, Model model){
        model.addAttribute("Type", type);
        return "Login";
    }
    @GetMapping("/payment")
    public String UserPayment(@RequestParam("phoneNumber") String phoneNumber,Model model) throws Exception {

        Integer userId = usersService.getByTel(phoneNumber).getUserId();

        HistoryDto history = historyService.get(userId);
        model.addAttribute("historys", history);
        model.addAttribute("doctor", docService.get(history.getDocId()));
        return "Payment";
    }

    @GetMapping("/check")
    @ResponseBody 
    public boolean checkUser(@RequestParam("phoneNumber") String phoneNumber) {
        try{
            UsersDto user = usersService.getByTel(phoneNumber);
            return user!=null; 
        }catch(Exception e) {
            e.printStackTrace();
            return false;
        }
    }
    @GetMapping("/regist")
    @ResponseBody 
    public boolean registUser(@RequestParam("phoneNumber") String phoneNumber, @RequestParam("name") String name) throws Exception {
        UsersDto userDto = UsersDto.builder()
        .userTel(phoneNumber)
        .userName(name)
        .build();
        usersService.add(userDto);
        return true;
    }
}