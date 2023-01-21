package com.indie.games.controllers;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

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

    @GetMapping("/account/profile")
    public String profile(@ModelAttribute("user")User user, Model model, HttpSession session){
        Long uId = (Long) session.getAttribute("userId");
        if(uId == null){
			System.out.println("fallo la sesion");
            return "redirect:/";
        }
        User u = userServ.findById(uId);
        model.addAttribute("user", u);
        return "profile";
    }

    @PostMapping("/account/profile/photo")
    public String photo(@ModelAttribute("user")User user, Model model, @RequestParam("photoProfile")MultipartFile photoProFile, HttpSession session){
        Long userId = (Long) session.getAttribute("userId");
        if(userId != null){
            User u = userServ.findById(userId);
            if(u != null){
                if(photoProFile.isEmpty() == false){
                    String fileName = "fotitoperfil";
                    String imgRoute = "/image/" + userId;
                    File directory = new File("src/main/resources/static" + imgRoute);
                    if(directory.exists() == false){
                        directory.mkdirs();
                    }
                    try {
                        byte[] bytes = photoProFile.getBytes();
                        BufferedOutputStream outputStream = new BufferedOutputStream(
                            new FileOutputStream(
                                new File(directory.getAbsolutePath() + "/" + fileName)
                            )
                        );
                        outputStream.write(bytes);
                        outputStream.flush();
                        outputStream.close();
                        System.out.println("El archivo se ha cargado con exito");
                        u.setImgRoute(imgRoute + "/" + fileName);
                        userServ.save(u);
                    } catch (IOException e) {
                        e.printStackTrace();
                        System.out.println("ocurrio un error al cargar la imagen." + e);
                    }
                }
            }
        }
        return "redirect:/account/profile";
    }
    
}
