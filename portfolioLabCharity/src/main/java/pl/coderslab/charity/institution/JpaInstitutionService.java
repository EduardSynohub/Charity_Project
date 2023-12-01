package pl.coderslab.charity.institution;

import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class JpaInstitutionService implements InstitutionService{

    private InstitutionRepository institutionRepository;

    public JpaInstitutionService(InstitutionRepository institutionRepository) {
        this.institutionRepository = institutionRepository;
    }

    @Override
    public List<Institution> getAll() {
        return institutionRepository.findAll();
    }

    @Override
    public Optional<Institution> getById(Long id) {
        return institutionRepository.findById(id);
    }

    @Override
    public void create(Institution institution) {
        institutionRepository.save(institution);
    }

    @Override
    public void deleteById(Long id) {
        institutionRepository.deleteById(id);
    }
}
