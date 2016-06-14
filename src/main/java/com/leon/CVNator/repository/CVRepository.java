package com.leon.CVNator.repository;

import com.leon.CVNator.model.CV;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

/**
 * Created by Leon on 6/5/2016.
 */
public interface CVRepository extends JpaRepository<CV, Long>{
    CV findAllByUserId(Long userId);
}
