package com.leon.CVNator.repository;

import com.leon.CVNator.model.CustomField;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

/**
 * Created by Leon on 6/5/2016.
 */
public interface CustomFieldRepository extends JpaRepository<CustomField, Long> {
    List<CustomField> findAllByUserId(Long userId);

    List<CustomField> findByCvId(Long id);
}
