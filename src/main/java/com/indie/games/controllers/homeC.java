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
public class homeC {

    private final UserService userServ;


    @GetMapping("/home")
    public String homePage(Model model, HttpSession session){
        // condicion para retornar index en caso de cierre de sesion
        if ((Long) (session.getAttribute("userId")) == null) {
			System.out.println("fallo la sesion");
            // model.addAttribute("errorSesion", "El tiempo de la sesión a expirado");
			return "redirect:/";
		}
        Long uid = (Long) session.getAttribute("userId");
        User u = userServ.findById(uid);
        model.addAttribute("user", u);
        return "home";
    }
    
}
