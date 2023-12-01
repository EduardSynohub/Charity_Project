package pl.coderslab.charity.donation;

import org.springframework.stereotype.Service;
import pl.coderslab.charity.category.Category;
import pl.coderslab.charity.category.JpaCategoryService;

import java.util.List;
import java.util.Optional;

@Service
public class JpaDonationService implements DonationService{

    private final DonationRepository donationRepository;
    private final JpaCategoryService jpaCategoryService;

    public JpaDonationService(DonationRepository donationRepository, JpaCategoryService jpaCategoryService) {
        this.donationRepository = donationRepository;
        this.jpaCategoryService = jpaCategoryService;
    }

    @Override
    public List<Donation> getAll() {
        return donationRepository.findAll();
    }

    @Override
    public Optional<Donation> getById(Long id) {
        return donationRepository.findById(id);
    }

    @Override
    public void create(Donation donation) {
        donationRepository.save(donation);
    }

    @Override
    public void deleteById(Long id) {
        donationRepository.deleteById(id);
    }
}
