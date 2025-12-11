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
import java.text.SimpleDateFormat;
import java.util.List;

import org.kio.app.service.UsersService;
import org.kio.app.service.DocService;
import org.kio.app.service.ResService;
import org.kio.app.dto.UsersDto;
import org.kio.app.dto.DocDto;
import org.kio.app.dto.ResDto;


import java.util.Date;

@Controller
@RequestMapping("/reserve")
@RequiredArgsConstructor
public class ReserveController {
    @Value("${app.url.server-url}")
    private String serverurl;
    private final UsersService usersService;
    private final DocService docService;
    private final ResService resService;
    @GetMapping("")
    public String Reserve(@RequestParam(value="phoneNumber",required=false) String phoneNumber, Model model) throws Exception {
        List<DocDto> list = docService.get();
        model.addAttribute("doctors", list);
        model.addAttribute("phoneNumber", phoneNumber);
        return "Reserve"; 
    }
    @GetMapping("/result")
    public String ReserveComplet(@RequestParam(value="phoneNumber",required=false) String phoneNumber, @RequestParam(value="docId",required=false) Integer docId, Model model) throws Exception{
        ResDto resDto = ResDto.builder()
        .docId(docId)
        .userId(usersService.getByTel(phoneNumber).getUserId())
        .resDate(new Date())    // 날짜 객체 쏙
        .build();
        resService.add(resDto);

        model.addAttribute("doc", docService.get(docId));
        model.addAttribute("res",resDto);

        return "ReserveComplet"; 
    }
    @GetMapping("/list")
    public String ReserveList(Model model) throws Exception{
        try{
            List<DocDto> doctors=docService.get();
            model.addAttribute("doctors", doctors);
            List<ResDto> reserves=resService.get();
            model.addAttribute("reserves", reserves);
            return "ReserveList";
        }catch(Exception e) {
            e.printStackTrace(); 
            return "error";
        }
    }
}