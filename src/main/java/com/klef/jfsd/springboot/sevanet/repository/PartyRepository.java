package com.klef.jfsd.springboot.sevanet.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.klef.jfsd.springboot.sevanet.model.Party;

public interface PartyRepository extends JpaRepository<Party, String> {

}
