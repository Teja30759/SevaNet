package com.klef.jfsd.springboot.sevanet.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.klef.jfsd.springboot.sevanet.model.Department;
import com.klef.jfsd.springboot.sevanet.model.Issue;
import com.klef.jfsd.springboot.sevanet.repository.DepartmentRepository;
import com.klef.jfsd.springboot.sevanet.repository.IssueRepository;

@Service
public class DepartmentServiceImpl implements DepartmentService
{
	
	@Autowired
	private DepartmentRepository departmentrepo;
	
	@Autowired
	private IssueRepository issuerepo;

	@Override
	public Department checkdepartmentlogin(String departmentid, String password) {
		
		return departmentrepo.checkdepartmentlogin(departmentid, password);
	}

	@Override
	public List<Issue> findByAssignedToAndConstituency(String assignedTo, String constituency) {
		
		return issuerepo.findByAssignedToAndConstituency(assignedTo, constituency);
	}

	@Override
	public String updateStatusandupdateDate(int id, String updateDate, String status) {

		issuerepo.updateStatusandupdateDate(id, updateDate, status);
		return "Issue Solved Successfully";
	}

}
