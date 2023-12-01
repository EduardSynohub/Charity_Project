package pl.coderslab.charity.user;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.User;

import java.util.Collection;

public class CurrentUser extends User{

    private final pl.coderslab.charity.user.User user;
    private final String firstname;
    public CurrentUser(String username, String password,
                       Collection<? extends GrantedAuthority> authorities,
                       pl.coderslab.charity.user.User user, String firstname) {
        super(username, password, authorities);
        this.user = user;
        this.firstname = firstname;
    }
    public pl.coderslab.charity.user.User getUser() {return user;}
    public String getFirstname() {
        return firstname;
    }
}
