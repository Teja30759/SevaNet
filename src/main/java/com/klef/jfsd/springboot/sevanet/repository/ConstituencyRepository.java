package com.klef.jfsd.springboot.sevanet.repository;

import com.klef.jfsd.springboot.sevanet.model.Constituency;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface ConstituencyRepository extends JpaRepository<Constituency, Integer> {
    // Custom query methods can be added here if needed
}
