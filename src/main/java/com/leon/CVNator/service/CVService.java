package com.leon.CVNator.service;

import com.leon.CVNator.model.CV;

import java.util.List;

/**
 * Created by Leon on 6/5/2016.
 */
public interface CVService {
    void save(CV cv);

    List<CV> findByUserId(Long userId);
}
