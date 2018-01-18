package com.jk.controller;

import com.jk.pojo.Tree;
import com.jk.service.BookService;
import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
@EnableAutoConfiguration
public class BookController {

    @Autowired
    private BookService bookservice;

    @RequestMapping("/toqueryusers")
    public String home() {

        return "qwe.jsp";
    }

    @RequestMapping("/hello/{myName}")
    @ResponseBody
    public String index(@PathVariable String myName) {

        return "Hello "+myName+"!!!";
    }


    @RequestMapping("/queryTree")
    @ResponseBody
    public Object queryTree(){
        List<Tree> list=bookservice.queryTree("0");
        return list;
    }

}
