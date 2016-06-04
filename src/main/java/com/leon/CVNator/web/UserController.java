package com.leon.CVNator.web;

import com.leon.CVNator.enums.Gender;
import com.leon.CVNator.service.SecurityService;
import com.leon.CVNator.service.UserService;
import com.leon.CVNator.validator.UserValidator;
import com.leon.CVNator.model.CV;
import com.leon.CVNator.model.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.DataBinder;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java.beans.PropertyEditorSupport;
import java.text.SimpleDateFormat;
import java.util.Date;

@Controller
public class UserController {
    @Autowired
    private UserService userService;

    @Autowired
    private SecurityService securityService;

    @Autowired
    private UserValidator userValidator;

    @RequestMapping(value = "/registration", method = RequestMethod.GET)
    public String registration(Model model) {
        model.addAttribute("userForm", new User());

        return "registration";
    }

    @RequestMapping(value = "/registration", method = RequestMethod.POST)
    public String registration(@ModelAttribute("userForm") User userForm, BindingResult bindingResult, Model model) {
        userValidator.validate(userForm, bindingResult);

        if (bindingResult.hasErrors()) {
            return "registration";
        }

        userService.save(userForm);

        securityService.autologin(userForm.getUsername(), userForm.getPasswordConfirm());

        return "redirect:/welcome";
    }

    @RequestMapping(value = "/generatecv", method = RequestMethod.GET)
    public String generateCV(Model model) {
        model.addAttribute("newCVForm", new CV());
        //model.addAttribute("genders", Gender.values());

        return "generatecv";
    }

    @RequestMapping(value = "/generatecv", method = RequestMethod.POST)
    public String generateCV(@ModelAttribute("newCVForm") CV cv, BindingResult bindingResult, Model model) {
        System.out.println(cv.getAddress());
        System.out.println(cv.getDateOfBirth());
        System.out.println(cv.getGender().toString());
        System.out.println(cv.getEducation());

        return "redirect:/welcome";
    }

    @RequestMapping(value = "/login", method = RequestMethod.GET)
    public String login(Model model, String error, String logout) {
        if (error != null)
            model.addAttribute("error", "Your username and password is invalid.");

        if (logout != null)
            model.addAttribute("message", "You have been logged out successfully.");

        return "login";
    }

    @RequestMapping(value = {"/", "/welcome"}, method = RequestMethod.GET)
    public String welcome(Model model) {
        return "welcome";
    }

    @InitBinder
    public void initBinder(WebDataBinder binder) {
        SimpleDateFormat sdf = new SimpleDateFormat("MM-dd-yyyy");
        sdf.setLenient(true);
        binder.registerCustomEditor(Date.class, new CustomDateEditor(sdf, true));
        CV cv = new CV();
        DataBinder dataBinder = new DataBinder(cv.getGender());
        dataBinder.registerCustomEditor(Gender.class, new PropertyEditorSupport() {
            @Override
            public void setAsText(String value) throws IllegalArgumentException {
                System.out.println("Setting value");
                if(value.equals(""))
                    return;

                setValue(Gender.valueOf(value));
            }
            @Override
            public String getAsText() {
                System.out.println("Getting value");
                if(getValue() == null)
                    return "";

                return ((Gender) getValue()).name();
            }
        });
    }
}
