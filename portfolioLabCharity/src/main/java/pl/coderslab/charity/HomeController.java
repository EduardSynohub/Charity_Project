package pl.coderslab.charity;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import pl.coderslab.charity.donation.DonationRepository;
import pl.coderslab.charity.institution.Institution;
import pl.coderslab.charity.institution.JpaInstitutionService;

import java.util.List;

@Controller
public class HomeController {

    private final JpaInstitutionService jpaInstitutionService;
    private final DonationRepository donationRepository;

    public HomeController(JpaInstitutionService jpaInstitutionService, DonationRepository donationRepository) {
        this.jpaInstitutionService = jpaInstitutionService;
        this.donationRepository = donationRepository;
    }

    @RequestMapping("/")
    public String homeAction(Model model){
        return "index";
    }

    @GetMapping("/about")
    @ResponseBody
    public String about() { return "Here you can find some details for logged users"; }

    @ModelAttribute("all_quantities")
    public long allQuantities() {
        return donationRepository.sumOfQuantity();
    }

    @ModelAttribute("all_donations")
    public long allDonations() {
        return donationRepository.countOfDonation();
    }

    @ModelAttribute("institutions_list")
    public List<Institution> allInstitutions(){
        return jpaInstitutionService.getAll();
    }

}
