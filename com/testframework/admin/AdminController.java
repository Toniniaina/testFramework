package testFramework.com.testframework.admin;

import framework.annotation.Controller;
import framework.annotation.GetMapping;
import framework.utilitaire.ModelAndView;
import testFramework.com.testframework.model.Employee;
import java.util.Arrays;
import java.util.List;

@Controller
public class AdminController {
    
    @GetMapping("/admin/dashboard")
    public String dashboard() {
        return "aizazzz";
    }
    
    @GetMapping("/admin/settings")
    public String settings() {
        return "Admin settings";
    }

    @GetMapping("/admin/page")
    public ModelAndView page() {
        // Restituer la vue "admin" -> résolu en /WEB-INF/views/admin.jsp (via view.prefix/suffix)
        ModelAndView mv = new ModelAndView("admin");
        mv.addObject("title", "Tableau de bord Admin")
          .addObject("message", "Bienvenue sur la page admin rendue via JSP")
          .addObject("count", 3);
        return mv;
    }

    @GetMapping("/admin/employees")
    public ModelAndView employees() {
        List<Employee> list = Arrays.asList(
                new Employee(1, "Alice", "Martin", "alice@example.com", "Manager"),
                new Employee(2, "Bob", "Durand", "bob@example.com", "Developer"),
                new Employee(3, "Chloe", "Bernard", "chloe@example.com", "QA")
        );
        ModelAndView mv = new ModelAndView("employees");
        mv.addObject("employees", list)
          .addObject("title", "Liste des employés");
        return mv;
    }
}
