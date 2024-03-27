package com.efrei.gererparcitapp;

import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.GetMapping;
@RestController
public class GreeteController {

    @GetMapping("/hello")
    public String sayHello() {
        return "Hello MissSheep!";
    }

}
