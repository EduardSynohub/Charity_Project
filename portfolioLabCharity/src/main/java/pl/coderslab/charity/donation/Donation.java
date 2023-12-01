package pl.coderslab.charity.donation;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import org.springframework.format.annotation.DateTimeFormat;
import pl.coderslab.charity.category.Category;
import pl.coderslab.charity.institution.Institution;

import javax.persistence.*;
import javax.validation.constraints.*;
import java.time.LocalDate;
import java.time.LocalTime;
import java.util.List;

@Setter
@Getter
@NoArgsConstructor
@AllArgsConstructor
@Entity
public class Donation {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Min(value = 1, message = "Powinien być minimum jeden worek")
    private int quantity;

    @ManyToMany(cascade = CascadeType.ALL)
    @NotEmpty(message = "Trzeba wybrać kategorię")
    private List<Category> categories;

    @OneToOne
    @NotNull(message = "Trzeba wybrać instytucję")
    private Institution institution;

    @NotEmpty(message = "Trzeba podać nazwę ulicy")
    private String street;

    @NotEmpty(message = "Trzeba podać nazwę miasta")
    private String city;

    @Pattern(regexp = "^\\d{2}-\\d{3}$", message = "Podaj kod pocztowy w formacie xx-xxx")
    @NotEmpty(message = "Te pole nie może być pustę")
    private String zipCode;

    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private LocalDate pickUpDate;

    @NotNull(message = "Trzeba wybrać czas")
    private LocalTime pickUpTime;

    private String pickUpComment;
}
