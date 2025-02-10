package com.klef.jfsd.springboot.sevanet.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.klef.jfsd.springboot.sevanet.model.Department;
import java.util.List;


public interface DepartmentRepository extends JpaRepository<Department, String> 
{
	@Query("select d from Department d where d.Departmentid=?1 and d.password=?2")
	public Department checkdepartmentlogin(String departmentid , String password);
	
	
    public List<Department> findByConstituency(String constituency);
}
