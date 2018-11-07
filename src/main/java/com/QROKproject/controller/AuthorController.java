package com.QROKproject.controller;

import com.QROKproject.dto.AuthorDTO;
import com.QROKproject.service.AuthorService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;
import java.util.stream.Collectors;

@Controller
public class AuthorController {

    @Autowired
    private AuthorService authorService;

    @GetMapping("/")
    public String getHomePage() {

       // AuthorDTO authorDTO = new AuthorDTO(authorService.get(id));

        //List<Integer> listID = authorService.getAll().stream().map(author -> author.getId()).collect(Collectors.toList());

        ModelAndView mv = new ModelAndView("home");
        mv.addObject("authors", authorService.getAll());

        return "/home";
    }

    @GetMapping("/author/info/short")
    public String getAuthorInfo() {

        //ModelAndView mv = new ModelAndView("authorInfo");
        //mv.addObject("title", "Author Info");

        AuthorDTO authorDTO = new AuthorDTO(authorService.get(1));

        //mv.addObject("authorDTO", authorDTO);

        return authorDTO.getAuthorInfo();
    }



    @GetMapping("/login")
    public String login() {
        return "/login";
    }
}
