package com.indie.games.controllers;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.indie.games.model.User;
import com.indie.games.services.UserService;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class ArcadeC {

    private final UserService userServ;

    @GetMapping("/arcade")
    public String arcade(Model model, HttpSession session){
        Long uId = (Long) session.getAttribute("userid");
        
        if(uId == null){
            return "arcade";
        }
        if(uId != null){
            User u = userServ.findById(uId);
            if(u != null){
                model.addAttribute("user", u);
            }
        }

        return "arcade";
    }
    
}
