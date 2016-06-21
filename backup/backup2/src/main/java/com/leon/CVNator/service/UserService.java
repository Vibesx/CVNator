package com.leon.CVNator.service;

import com.leon.CVNator.model.User;

public interface UserService {
    void save(User user);

    User findByUsername(String username);
}
