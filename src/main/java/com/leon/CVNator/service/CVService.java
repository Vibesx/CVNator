package com.leon.CVNator.service;

import com.leon.CVNator.model.CV;

import java.util.List;

/**
 * Created by Leon on 6/5/2016.
 */
public interface CVService {
    void save(CV cv);

    CV findByUserId(Long userId);

    //CV findByCvName(String name);
}
