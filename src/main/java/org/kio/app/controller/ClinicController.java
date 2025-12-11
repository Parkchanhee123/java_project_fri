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
@RequestMapping("/clinic")
@RequiredArgsConstructor
public class ClinicController {
    @Value("${app.url.server-url}")
    private String serverurl;
    private final DocService docService;
    private final ResService resService;
    private final UsersService usersService;
    private final HistoryService historyService;


    @GetMapping("")
    public String Clinic(Model model) throws Exception{
        List<ResDto> reserves=resService.get();
        model.addAttribute("reserves", reserves);
        List<UsersDto> users=usersService.get();
        model.addAttribute("users", users);

        return "Clinic";
    }

    @GetMapping("/addHistory")
    @ResponseBody 
    public boolean addHistory(@RequestParam("resId") Integer resId,@RequestParam("pay") Integer pay, @RequestParam("prescription") String prescription) throws Exception {
        if(resService.get(resId)==null){
            return false;
        }
        HistoryDto historyDto = HistoryDto.builder()
        .docId(resService.get(resId).getDocId())
        .userId(resService.get(resId).getUserId())
        .pay(pay)
        .cosDate(new Date())
        .prescription(prescription)
        .build();
        historyService.add(historyDto);

        resService.del(resId);
        return true;
    }
}