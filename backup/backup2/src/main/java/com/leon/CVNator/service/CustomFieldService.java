package com.leon.CVNator.service;

import com.leon.CVNator.model.CustomField;

import java.util.List;

/**
 * Created by Leon on 6/5/2016.
 */
public interface CustomFieldService {
    void save(CustomField customField);

    List<CustomField> findByUserId(Long userId);
}
