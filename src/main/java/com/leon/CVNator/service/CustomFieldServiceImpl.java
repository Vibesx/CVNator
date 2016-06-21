package com.leon.CVNator.service;

import com.leon.CVNator.model.CustomField;
import com.leon.CVNator.repository.CustomFieldRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by Leon on 6/5/2016.
 */
@Service
public class CustomFieldServiceImpl implements CustomFieldService {
    @Autowired
    CustomFieldRepository customFieldRepository;

    @Override
    public void save(CustomField customField) {
        customFieldRepository.save(customField);
    }

    @Override
    public List<CustomField> findByUserId(Long userId) {
        return customFieldRepository.findAllByUserId(userId);
    }

    /*@Override
    public CustomField findByCvId(Long id) {
        return customFieldRepository.findByCvId(id);
    }*/
}
