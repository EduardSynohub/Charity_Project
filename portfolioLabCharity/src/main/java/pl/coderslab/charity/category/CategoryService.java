package pl.coderslab.charity.category;

import java.util.List;
import java.util.Optional;

public interface CategoryService {
    List<Category> getAll();
    Optional<Category> getById(Long id);
    void create(Category category);
    void deleteById(Long id);
}
