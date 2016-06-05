package com.leon.CVNator.service;

import com.leon.CVNator.model.CV;
import com.leon.CVNator.repository.CVRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by Leon on 6/5/2016.
 */
@Service
public class CVServiceImpl implements CVService{
    @Autowired
    CVRepository cvRepo;

    @Override
    public void save(CV cv) {
        cvRepo.save(cv);
    }

    @Override
    public List<CV> findByUserId(Long userId) {
        return cvRepo.findAllByUserId(userId);
    }
}
