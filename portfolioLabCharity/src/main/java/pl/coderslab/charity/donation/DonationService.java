package pl.coderslab.charity.donation;

import java.util.List;
import java.util.Optional;

public interface DonationService {
    List<Donation> getAll();
    Optional<Donation> getById(Long id);
    void create(Donation donation);
    void deleteById(Long id);
}
