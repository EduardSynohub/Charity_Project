package pl.coderslab.charity.donation;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import pl.coderslab.charity.category.Category;
import pl.coderslab.charity.category.JpaCategoryService;
import pl.coderslab.charity.institution.Institution;
import pl.coderslab.charity.institution.JpaInstitutionService;

import javax.validation.Valid;
import java.util.List;

@Controller
public class DonationController {

    private final JpaDonationService jpaDonationService;
    private final JpaCategoryService jpaCategoryService;
    private final JpaInstitutionService jpaInstitutionService;

    public DonationController(JpaDonationService jpaDonationService, JpaCategoryService jpaCategoryService, JpaInstitutionService jpaInstitutionService) {
        this.jpaDonationService = jpaDonationService;
        this.jpaCategoryService = jpaCategoryService;
        this.jpaInstitutionService = jpaInstitutionService;
    }


    @ModelAttribute("categories_list")
    public List<Category> allCategories() {
        return jpaCategoryService.getAll();
    }

    @ModelAttribute("institutions_list")
    public List<Institution> allInstitutions(){
        return jpaInstitutionService.getAll();
    }

    @GetMapping("/addDonation")
    public String showDonationForm(Model model) {
        model.addAttribute("donation", new Donation());
        return "donationForm";
    }

    @PostMapping("/addDonation")
    public String addDonation(@ModelAttribute("donation") @Valid Donation donation, BindingResult bindingResult) {
        if (bindingResult.hasErrors()) {
            return "donationForm";
        }
        jpaDonationService.create(donation);
        return "redirect:/addDonationSuccess";
    }

    @GetMapping("/addDonationSuccess")
    public String showDonationSuccess() {
        return "donationSuccess";
    }
}
