package com.leon.web.service.impl;

import com.leon.web.model.User;
import com.leon.web.repositories.UserRepository;
import com.leon.web.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 * Created by Leon on 6/1/2016.
 */
@Service
@Transactional
public class UserServiceImpl implements UserService{
    @Autowired
    UserRepository userRepo;

    @Override
    public void saveUser(User u) {

    }

    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        return null;
    }
}
