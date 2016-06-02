package com.leon.web.repositories;

import com.leon.web.model.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Repository;

/**
 * Created by Leon on 6/1/2016.
 */
public interface UserRepository extends JpaRepository<User, Long>{

    User findByUsername(String username);
}
