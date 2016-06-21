package com.leon.CVNator.web;

import com.leon.CVNator.enums.Gender;
import com.leon.CVNator.model.CustomField;
import com.leon.CVNator.service.CVService;
import com.leon.CVNator.service.CustomFieldService;
import com.leon.CVNator.service.SecurityService;
import com.leon.CVNator.service.UserService;
//import com.leon.CVNator.validator.UserValidator;
import com.leon.CVNator.model.CV;
import com.leon.CVNator.model.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.DataBinder;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.*;

import java.beans.PropertyEditorSupport;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Controller
public class MainController {
    @Autowired
    private UserService userService;

    @Autowired
    private SecurityService securityService;

    @Autowired
    private CustomFieldService customFieldService;

    @Autowired
    private CVService cvService;

    /*@Autowired
    private UserValidator userValidator;*/

    private Long customFieldsCount = 0L;

    @RequestMapping(value = "/registration", method = RequestMethod.GET)
    public String registration(Model model) {
        model.addAttribute("userForm", new User());

        return "registration";
    }

    @RequestMapping(value = "/registration", method = RequestMethod.POST)
    public String registration(@ModelAttribute("userForm") User userForm, BindingResult bindingResult, Model model) {
        /*userValidator.validate(userForm, bindingResult);

        if (bindingResult.hasErrors()) {
            return "registration";
        }*/

        userService.save(userForm);

        securityService.autologin(userForm.getUsername(), userForm.getPasswordConfirm());

        return "redirect:/index";
    }

    /*@RequestMapping(value = "/saveadditionalfields", method = RequestMethod.POST)
    public String saveCustomField(@ModelAttribute("newCVForm") CustomField cf, BindingResult bindingResult, Model model) {

        //cf.setUserId(getCurrentUserId());

        customFieldService.save(cf);

        return "redirect:/generatecv";
    }*/

    @RequestMapping(value = "/export" , method = RequestMethod.GET)
    public String export(Model model) {
        CV cv = cvService.findByUserId(getCurrentUserId());

        if(cv != null) {
            model.addAttribute("firstName", cv.getFirstName());
            model.addAttribute("lastName", cv.getLastName());
            model.addAttribute("gender", cv.getGender());
            model.addAttribute("dateOfBirth", cv.getDateOfBirth());
            model.addAttribute("email", cv.getEmail());
            model.addAttribute("address", cv.getAddress());
            model.addAttribute("country", cv.getCountry());
            model.addAttribute("nationality", cv.getNationality());
            model.addAttribute("phoneNumber", cv.getPhoneNumber());
            model.addAttribute("education", cv.getEducation());
            model.addAttribute("workExperience", cv.getWorkExperience());
            List<CustomField> customFields = customFieldService.findByUserId(getCurrentUserId());
            model.addAttribute("customFields", customFields);
        }

        return "export";
    }

    @RequestMapping(value = "/generatecv", method = RequestMethod.GET)
    public String generateCV(Model model) {
        CV cvList = cvService.findByUserId(getCurrentUserId());

        if(cvList != null) {
            model.addAttribute("newCVForm", cvList);
        } else {
            model.addAttribute("newCVForm", new CV());
        }
        //model.addAttribute("newCVForm", new CV());
        List<CustomField> customFields = customFieldService.findByUserId(getCurrentUserId());
        model.addAttribute("customFields", customFields);
        for(CustomField cf : customFields) {
            model.addAttribute("customField" + customFieldsCount, customFields);
            customFieldsCount++;
        }
        //model.addAttribute("genders", Gender.values());

        return "generatecv";
    }

    /*@RequestMapping(value = "/loadcv", method = RequestMethod.POST)
    public String loadCV(@ModelAttribute("selectedCv") String selectedCV, BindingResult bindingResult, Model model) {
        CV cv = cvService.findByCvName(selectedCV);
        List<CustomField> customFields = new ArrayList<>();
        if(cv != null) {
            customFields = customFieldService.findByCvId(cv.getId());
        }
        return "generatecv";
    }*/

    @RequestMapping(value = "/generatecv", method = RequestMethod.POST)
    public String generateCV(@ModelAttribute("newCVForm") CV cv, @RequestParam("customField") List<String> requestedCustomFields, BindingResult bindingResult, Model model) {

        List<CustomField> customFields = customFieldService.findByUserId(getCurrentUserId());
        for(int i = 0; i < customFields.size(); i++) {
            CustomField tempCF = customFields.get(i);
            tempCF.setValue(requestedCustomFields.get(i));
            customFieldService.save(tempCF);
        }
        Long currentUserId = getCurrentUserId();
        cv.setUserId(currentUserId);
        CV foundCv = cvService.findByUserId(currentUserId);
        //CV foundCv = cvService.findByCvName(cv.getCvName());
        if(foundCv != null) {
            cv.setId(foundCv.getId());
        }

        cvService.save(cv);

        return "redirect:/generatecv";
    }



    @RequestMapping(value = "/addnewfield", method = RequestMethod.GET)
    public String addNewField(Model model) {
        model.addAttribute("addNewFieldForm", new CustomField());
        //model.addAttribute("genders", Gender.values());

        return "forms/addfieldform";
    }

    @RequestMapping(value = "/addnewfield", method = RequestMethod.POST)
    public String generateCV(@ModelAttribute("addNewFieldForm") CustomField customField, BindingResult bindingResult, Model model) {
        System.out.println(customField.getName());
        System.out.println(customField.getType());
        //System.out.println(cv.getGender().toString());
        //System.out.println(cv.getEducation());
        customField.setUserId(getCurrentUserId());

        customFieldService.save(customField);

        return "forms/addfieldform";
    }

    @RequestMapping(value = "/login", method = RequestMethod.GET)
    public String login(Model model, String error, String logout) {
        if (error != null)
            model.addAttribute("error", "Your username and password is invalid.");

        if (logout != null)
            model.addAttribute("message", "You have been logged out successfully.");

        return "login";
    }

    @RequestMapping(value = {"/", "/index"}, method = RequestMethod.GET)
    public String welcome(Model model) {
        return "index";
    }

    @RequestMapping(value = {"/contact"}, method = RequestMethod.GET)
    public String contact(Model model) {
        return "contact";
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

    @RequestMapping(value = "/getAllCustomFields", method = RequestMethod.GET)
    public @ResponseBody List<CustomField> getAllCustomFields() {
        List<CustomField> customFields = customFieldService.findByUserId(getCurrentUserId());
        return customFields;
    }


    private Long getCurrentUserId() {
        String currentUsername = SecurityContextHolder.getContext().getAuthentication().getName();
        User user = userService.findByUsername(currentUsername);
        if(user != null) {
            return user.getId();
        }
        return null;
    }
}
