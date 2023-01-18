package com.indie.games.controllers;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.indie.games.model.User;
import com.indie.games.services.UserService;
import com.indie.games.validator.UserValidator;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class UserC {

    private final UserService userServ;
    private final UserValidator userValid;

    @GetMapping("/")
    public String index(@ModelAttribute("user") User user, HttpSession session){
        // condicion para retornar index en caso de cierre de sesion
        if ((Long) (session.getAttribute("userId")) != null) {
			System.out.println("Ya existe una sesion");
			return "redirect:/home";
		}
        return "home";
    }

    @GetMapping("/registration")
    public String registration(@ModelAttribute("user")User user, Model model){
        model.addAttribute("user", user);
        return "registrationPage";
    }

    @PostMapping("/registration")
    public String register(@Valid @ModelAttribute("user") User user, BindingResult result, Model model, HttpSession session ){
        userValid.validate(user, result);
        if(result.hasErrors()){
            return "registrationPage";
        }
        boolean duplicated = userServ.duplicatedUser(user.getEmail());
        if(duplicated){
            model.addAttribute("error", "Email already in use! Please try again with a different email address!");
            return "registrationPage";
        }
        User u = userServ.registerUser(user);
        session.setAttribute("userId", u.getId());
        // Decicidir si redireccionar al home o al index
        return "redirect:/home";
    }

    @GetMapping("/login")
    public String loginpage(@ModelAttribute("user")User user, Model model){
        model.addAttribute("user", user);
        return "loginPage";
    }

    @PostMapping("/login")
    public String loginUser(@Valid @RequestParam("email") String email, @RequestParam("password") String password, Model model,
                            HttpSession session, @ModelAttribute("user") User user) {
        boolean isAuthenticated = userServ.authenticateUser(email, password);
        if (isAuthenticated){
            User u = userServ.findByEmail(email);
            session.setAttribute("userId", u.getId());
            return "redirect:/home";
        }else {
            model.addAttribute("error","Invalid Credentials. Please try again");
            return "loginPage";
        }
    }

    @GetMapping("/logout")
    public String logout(HttpSession session) {
        session.invalidate();
        return "redirect:/";
    }

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
