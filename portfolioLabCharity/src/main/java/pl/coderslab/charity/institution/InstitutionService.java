package pl.coderslab.charity.institution;

import java.util.List;
import java.util.Optional;

public interface InstitutionService {
    List<Institution> getAll();
    Optional<Institution> getById(Long id);
    void create(Institution institution);
    void deleteById(Long id);
}
