package com.klef.jfsd.springboot.sevanet.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.klef.jfsd.springboot.sevanet.model.Politician;

@Repository
public interface PoliticianRepository extends JpaRepository<Politician, Integer> 
{
	
	@Query("select p from Politician p where p.name=?1 and p.password=?2")
	public Politician checkPoliticainlogin(String name, String password);

}
