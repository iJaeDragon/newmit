package com.haezuo.newmit.ingredients.controller;

import jakarta.servlet.http.HttpServletRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import java.util.HashMap;
import java.util.Map;

@Controller
public class ingredientsController {

    @RequestMapping(value = "/ingredients/listView", method = RequestMethod.GET)
    public String viewIngredientsList() {

        return "/ingredients/foodList";
    }

    @RequestMapping(value = "/ingredients/listDetailView", method = RequestMethod.GET)
    public String viewIngredientsListDetail() {

        return "/ingredients/foodListDetail";
    }

    @RequestMapping(value = "/ingredients/insertIntroView", method = RequestMethod.GET)
    public String viewIngredientsInsertIntro() {

        return "/ingredients/foodInsertIntro";
    }

    @RequestMapping(value = "/ingredients/insertView", method = RequestMethod.GET)
    public String viewIngredientsInsert() {

        return "/ingredients/foodInsert";
    }

    @RequestMapping(value = "/inqredients/foodObjectRecognition", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> foodObjectRecognition(@RequestParam Map<String, Object> param) {
        Map<String, Object> result = new HashMap<>();



        return result;
    }

}
