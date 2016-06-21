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

/**
 * Created by Claudiu on 6/14/2016.
 */
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

    }

    @Test
    public void testLogin() throws Exception {

    }

    @Test
    public void testWelcome() throws Exception {

    }

    @Test
    public void testInitBinder() throws Exception {

    }*/

}