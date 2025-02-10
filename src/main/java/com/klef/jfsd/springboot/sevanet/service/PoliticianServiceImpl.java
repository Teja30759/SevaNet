package com.klef.jfsd.springboot.sevanet.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.klef.jfsd.springboot.sevanet.model.Department;
import com.klef.jfsd.springboot.sevanet.model.Issue;
import com.klef.jfsd.springboot.sevanet.model.Politician;
import com.klef.jfsd.springboot.sevanet.repository.CitizenRepository;
import com.klef.jfsd.springboot.sevanet.repository.DepartmentRepository;
import com.klef.jfsd.springboot.sevanet.repository.IssueRepository;
import com.klef.jfsd.springboot.sevanet.repository.PoliticianRepository;

@Service
public class PoliticianServiceImpl implements PoliticianService{

	
	@Autowired
	private PoliticianRepository politicainrepository;
	
	@Autowired
	private IssueRepository issueRepository;
	
	@Autowired
	private DepartmentRepository departmentRepository;
	
	@Autowired
	private CitizenRepository citizenRepository;

	@Override
	public Politician checkPoliticainlogin(String name, String password) 
	{
		return politicainrepository.checkPoliticainlogin(name, password);
	}
	
	@Override
	public List<Issue> viewallissues() {		
		return issueRepository.findAll();
	}

	@Override
	public String updatestatuspriorityassignedto(int id, String assignedTo, String priority, String status) {

		issueRepository.updatestatuspriorityassignedto(id, assignedTo, priority, status);
		return "Issue Status Updated Successfully";
	}

	@Override
	public Politician displaypoliticanbyid(int pid) {
		// TODO Auto-generated method stub
		return politicainrepository.findById(pid).get();
	}

	@Override
	public String politicianprofileupdat(Politician poli) {
		
		Politician politician = politicainrepository.findById(poli.getId()).get();
		
		politician.setName(poli.getName());
		politician.setParty(poli.getParty());
		politician.setConstituency(poli.getConstituency());
		politician.setPosition(poli.getPosition());
		politician.setContactInfo(poli.getContactInfo());
		politician.setPassword(poli.getPassword());
		
		politicainrepository.save(politician);
		
		
		return "Profile Updated Successfully";
	}

	@Override
	public List<Issue> findByConstituency(String constituency) {
		
		return issueRepository.findByConstituency(constituency);
	}
	
	@Override
	public List<Department> findBydepConstituency(String constituency) {
		
		return departmentRepository.findByConstituency(constituency);
	}

	@Override
	public long countIssuesByConstituency(String constituency) {
		return issueRepository.countIssuesByConstituency(constituency);
	}
	
	@Override
	public List<String> findEmailsByConstituency(String constituency) {
		return citizenRepository.findEmailsByConstituency(constituency);
	}
	


}
