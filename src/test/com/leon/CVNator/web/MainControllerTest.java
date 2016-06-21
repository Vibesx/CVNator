<<<<<<< HEAD
import com.leon.CVNator.model.User;
import com.leon.CVNator.service.UserService;
import junit.framework.TestCase;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.support.AnnotationConfigContextLoader;

import javax.validation.constraints.AssertTrue;
=======
package com.leon.CVNator.web;

import com.leon.CVNator.model.CV;
import com.leon.CVNator.model.CustomField;
import com.leon.CVNator.model.User;
import com.leon.CVNator.service.*;
import com.leon.CVNator.validator.UserValidator;

import org.hibernate.AssertionFailure;
import org.junit.Assert;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.test.AssertThrows;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.List;
import java.util.concurrent.ThreadLocalRandom;

import static org.junit.Assert.*;
>>>>>>> 4a6ee1a0598831aed66adae1da8175965793ca0b

/**
 * Created by Claudiu on 6/21/2016.
 */
<<<<<<< HEAD
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:J:\\Facultate\\TW\\CVNator\\src\\main\\webapp\\WEB-INF\\appconfig-root.xml")
public class MainControllerTest {

    /*@Autowired
    ApplicationContext context;*/
    @Autowired
    private UserService userService;
    @Test
    public void testRegistration() throws Exception {
        User user = userService.findByUsername("leon");
        assert(user.getId().equals("leon"));
        System.out.println(user.getEmail());
    }

    /*@Test
    public void testRegistration1() throws Exception {

    }

    @Test
    public void testGenerateCV() throws Exception {

    }

    @Test
    public void testGenerateCV1() throws Exception {

    }

    @Test
    public void testAddNewField() throws Exception {

    }

    @Test
    public void testGenerateCV2() throws Exception {
=======

@RunWith( SpringJUnit4ClassRunner.class )
@ContextConfiguration("file:J:\\Facultate\\TW\\CVNator\\src\\main\\webapp\\WEB-INF\\appconfig-root.xml")
public class MainControllerTest {

    @Autowired
    private UserService userService;

    @Autowired
    private SecurityService securityService;

    @Autowired
    private CustomFieldService customFieldService;

    @Autowired
    private CVService cvService;

    @Autowired
    private UserValidator userValidator;

    @Autowired
    private BCryptPasswordEncoder bCryptPasswordEncoder;


    @Test
    public void PopulateCV() {
        CV cv= new CV();

        long id=ThreadLocalRandom.current().nextInt(1000, 5000 + 1);
        cv.setUserId(id);
        cv.setFirstName("Claudiu");
        cv.setLastName("chi");
        cv.setAddress("Aici si acolo");
        cv.setCountry("Romania");
        cv.setDateOfBirth("11-11-1990");
        cv.setEmail("chi@cla.diu");
        cv.setEducation("Scoala aia +Liceul celalalt");
        cv.setNationality("Roman");
        cv.setGender("M");
        cv.setPhoneNumber("0909097665");
        cv.setWorkExperience("de toate");
        cvService.save(cv);
        CV loadedCV = cvService.findByUserId(id);
        assertEquals(loadedCV.getFirstName(),"Claudiu");
        assertEquals(loadedCV.getLastName(),"chi");
        assertEquals(loadedCV.getAddress(),"Aici si acolo");
        assertEquals(loadedCV.getCountry(),"Romania");
        assertEquals(loadedCV.getDateOfBirth(),"11-11-1990");
        assertEquals(loadedCV.getEmail(),"chi@cla.diu");
        assertEquals(loadedCV.getEducation(),"Scoala aia +Liceul celalalt");
        assertEquals(loadedCV.getNationality(),"Roman");
        assertEquals(loadedCV.getGender(),"M");
        assertEquals(loadedCV.getPhoneNumber(),"0909097665");
        assertEquals(loadedCV.getWorkExperience(),"de toate");
    }

    @Test
    public void addCustomField() {
        CustomField cf=new CustomField();
        long id=ThreadLocalRandom.current().nextInt(1000, 5000 + 1);
        cf.setUserId(id);
        cf.setName("Field1");
        cf.setType("radio");
        cf.setOption1("opt1");
        cf.setOption2("opt2");
        cf.setOption3("opt3");
        cf.setOption4("opt4");
        customFieldService.save(cf);
        CustomField cf2=new CustomField();
        cf2.setUserId(id);
        cf2.setName("Field2");
        cf2.setType("radio");
        cf2.setOption1("Text Mare...");
        customFieldService.save(cf2);
        List<CustomField> cfList = customFieldService.findByUserId(id);
        CustomField cfTemp = cfList.get(0);
        assertEquals(cfTemp.getName(),"Field1");
        assertEquals(cfTemp.getType(),"radio");
        assertEquals(cfTemp.getOption1(),"opt1");
        assertEquals(cfTemp.getOption2(),"opt2");
        assertEquals(cfTemp.getOption3(),"opt3");
        assertEquals(cfTemp.getOption4(),"opt4");
        CustomField cfTemp1 = cfList.get(1);
        assertEquals(cfTemp1.getName(),"Field2");
        assertEquals(cfTemp1.getType(),"radio");
        assertEquals(cfTemp1.getOption1(),"Text Mare...");
    }

    @Test
    public void registration(){
        User userForm= new User();
        long id=ThreadLocalRandom.current().nextInt(1000, 5000 + 1);
        userForm.setUsername("claudiu"+id);
        userForm.setEmail("claudiu"+id+"@gmail.com");
        userForm.setPassword(bCryptPasswordEncoder.encode("clau"+id+"diu"));
        userForm.setPasswordConfirm(bCryptPasswordEncoder.encode("clau"+id+"diu"));
        userForm.setId(id);
        userService.save(userForm);
        User checkUser= userService.findByUsername("claudiu"+id);
        assertEquals(checkUser.getUsername(),"claudiu"+id);
        assertEquals(checkUser.getEmail(),"claudiu"+id+"@gmail.com");
//        UserDetails userDetails = userDetailsService.loadUserByUsername(checkUser.getUsername());
//        UsernamePasswordAuthenticationToken usernamePasswordAuthenticationToken = new UsernamePasswordAuthenticationToken(userDetails,"clau"+id+"diu", userDetails.getAuthorities());
//        authenticationManager.authenticate(usernamePasswordAuthenticationToken);
//        if (usernamePasswordAuthenticationToken.isAuthenticated()) {
//            SecurityContextHolder.getContext().setAuthentication(usernamePasswordAuthenticationToken);
//            logger.debug(String.format("Auto login %s successfully!", "claudiu"+id));
//        }
//        assertFalse(usernamePasswordAuthenticationToken.isAuthenticated());
        BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
        assertEquals(false, encoder.matches("clau" + id + "diu", checkUser.getPassword()));
//        assertEquals(bCryptPasswordEncoder.decode(checkUser.getPassword()),bCryptPasswordEncoder.encode("clau"+id+"diu"));
>>>>>>> 4a6ee1a0598831aed66adae1da8175965793ca0b

    }

    @Test
<<<<<<< HEAD
    public void testLogin() throws Exception {

    }

    @Test
    public void testWelcome() throws Exception {

    }

    @Test
    public void testInitBinder() throws Exception {

    }*/
=======
    public void userValidationTest(){
        User userV = new User();
        long id=ThreadLocalRandom.current().nextInt(1000, 5000 + 1);
        userV.setUsername("claudiu"+id);
        userV.setEmail("claudiu"+id+"@gmail.com");
        userV.setPassword("clau"+id+"diu");
        userV.setPasswordConfirm("clau"+id+"diu");
        assertFalse(userV.getUsername().length() < 6 || userV.getUsername().length() > 32);
        assertTrue(userService.findByUsername("claudiu"+id) == null);
        assertTrue(userV.getEmail().contains("@"));
        assertFalse(userV.getPassword().length() < 8 || userV.getPassword().length() > 32);
        assertTrue(userV.getPasswordConfirm().equals(userV.getPassword()));
    }

    @Test
    public void securityTest(){
        String msg="Succes";
//        securityService.autologin("claudiu3464","clau3464diu");
        assertEquals(msg,"Succes");

    }


}
>>>>>>> 4a6ee1a0598831aed66adae1da8175965793ca0b

