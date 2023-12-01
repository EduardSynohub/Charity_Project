package pl.coderslab.charity.category;

import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class JpaCategoryService implements CategoryService{

    private CategoryRepository categoryRepository;

    public JpaCategoryService(CategoryRepository categoryRepository) {
        this.categoryRepository = categoryRepository;
    }

    @Override
    public List<Category> getAll() {
        return categoryRepository.findAll();
    }

    @Override
    public Optional<Category> getById(Long id) {
        return categoryRepository.findById(id);
    }

    @Override
    public void create(Category category) {
        categoryRepository.save(category);
    }

    @Override
    public void deleteById(Long id) {
        categoryRepository.deleteById(id);
    }
}
