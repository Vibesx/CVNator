package com.leon.web.service;

import com.leon.web.model.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.stereotype.Service;

/**
 * Created by Leon on 6/1/2016.
 */
public interface UserService extends UserDetailsService {
    void saveUser(User u);
}
