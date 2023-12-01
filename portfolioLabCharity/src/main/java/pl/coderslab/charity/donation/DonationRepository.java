package pl.coderslab.charity.donation;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

@Repository
public interface DonationRepository extends JpaRepository<Donation, Long> {
    @Query("SELECT COALESCE(SUM(d.quantity), 0) FROM Donation d")
    long sumOfQuantity();

    @Query("select count(a) from Donation a")
    long countOfDonation();
}
