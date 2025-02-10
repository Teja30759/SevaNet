package com.klef.jfsd.springboot.sevanet.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.klef.jfsd.springboot.sevanet.model.Admin;
import com.klef.jfsd.springboot.sevanet.model.Citizen;
import com.klef.jfsd.springboot.sevanet.model.Constituency;
import com.klef.jfsd.springboot.sevanet.model.Department;
import com.klef.jfsd.springboot.sevanet.model.Issue;
import com.klef.jfsd.springboot.sevanet.model.Party;
import com.klef.jfsd.springboot.sevanet.model.Politician;
import com.klef.jfsd.springboot.sevanet.repository.AdminRepository;
import com.klef.jfsd.springboot.sevanet.repository.CitizenRepository;
import com.klef.jfsd.springboot.sevanet.repository.ConstituencyRepository;
import com.klef.jfsd.springboot.sevanet.repository.DepartmentRepository;
import com.klef.jfsd.springboot.sevanet.repository.IssueRepository;
import com.klef.jfsd.springboot.sevanet.repository.PartyRepository;
import com.klef.jfsd.springboot.sevanet.repository.PoliticianRepository;

import jakarta.persistence.EntityNotFoundException;

@Service
public class AdminServiceImpl implements AdminService 
{
	@Autowired
	private AdminRepository adminRepository;
	
	@Autowired
	private PoliticianRepository politicianRepository;
	
	@Autowired
	private DepartmentRepository departmentRepository;
	
	@Autowired
	private CitizenRepository citizenRepository;
	
	@Autowired
	private IssueRepository issueRepository;
	
	@Autowired
	private ConstituencyRepository constituencyRepository;

	@Autowired
    private PartyRepository partyRepository;
	
	
	
	@Override
	public Admin checkadminlogin(String uname, String pwd) 
	{
		return adminRepository.checkadminlogin(uname, pwd);
	}

	@Override
	public String AddPolitician(Politician pol) {
		politicianRepository.save(pol);
		return "Politician Added Successfully";
	}

	@Override
	public String AddDepartment(Department dept) {
	    // Check if department with the same ID already exists
	    Optional<Department> existingDepartment = departmentRepository.findById(dept.getDepartmentid());
	    
	    if (existingDepartment.isPresent()) {
	        // If department exists, return an error message
	        return "Error: Department with this ID already exists.";
	    }

	    // Save the department if it doesn't exist
	    departmentRepository.save(dept);
	    return "Department Added Successfully";
	}


	@Override
	public List<Politician> viewAllPoliticians() {
		return politicianRepository.findAll();
	}

	@Override
	public String deletepolitician(int pid) {
		politicianRepository.deleteById(pid);
		return "Politician Deleted Successfully";
	}

	@Override
	public List<Department> viewAllDepartments() {
		return departmentRepository.findAll();
	}

	@Override
	public String deleteDepartment(String did) {
		departmentRepository.deleteById(did);
		return "Department Deleted Successfully";
	}

	/* @Override
	    public Politician getPoliticianById(int pid) {
	        Optional<Politician> politician = politicianRepository.findById(pid);
	        return politician.orElseThrow(() -> new EntityNotFoundException("Politician not found"));
	    }

	    @Override
	    public String updatePolitician(Politician pol) {
	        politicianRepository.save(pol);
	        return "Politician Updated Successfully";
	    }*/
	
	
	public Politician findPoliticianById(int id) {
	    return politicianRepository.findById(id)
	            .orElseThrow(() -> new EntityNotFoundException("Politician not found"));
	}

	@Override
	public void updatePolitician(Politician politician) {
	    politicianRepository.save(politician);
	}
	
	@Override
	public Department findDepartmentById(String id) {
	    return departmentRepository.findById(id)
	            .orElseThrow(() -> new EntityNotFoundException("Department not found"));
	}

	@Override
	public void updateDepartment(Department department) {
	    departmentRepository.save(department);
	}

	@Override
	public List<Citizen> viewAllCitizens() {
		return citizenRepository.findAll();
	}

	@Override
	public String updateCitizenStatus(String status, int eid) {
		citizenRepository.updateCitizenStatus(status, eid);
		return "Citizen Status Updated Successfully";
	}

	@Override
	public String deleteCitizen(int cid) {
		citizenRepository.deleteById(cid);
		return "Citizen Deleted Successfully";
	}


	
	@Override
    public List<Issue> getAllIssues() {
        return issueRepository.findAll();
    }

    @Override
    public List<Issue> findIssuesByStatus(String status) {
        return issueRepository.findByStatus(status);
    }

	@Override
	public long politicianscount() {
		return politicianRepository.count();
	}

	@Override
	public long departmentscount() {
		return departmentRepository.count();
	}

	@Override
	public long citizenscount() {
		return citizenRepository.count();
	}

	
	

	@Override
	public String deleteissue(int iid) {
		issueRepository.deleteById(iid);
		return "Issue Deleted Successfully";
	}
	
	public List<Constituency> getAllConstituencies() {
        return constituencyRepository.findAll();
    }
	
	@Override
	public long issuecount() {
		return issueRepository.count();
	}

	public List<Party> getAllParties() {
        return partyRepository.findAll();
    }

	@Override
	public String addconstitueny(Constituency con) {
		constituencyRepository.save(con);
		return "New Constituency Added Succcessfully";
	}

	@Override
	public String addparty(Party par) {
		partyRepository.save(par);
		return "New party Added Succcessfully";
	}

	@Override
	public Map<String, Long> getIssueCounts() {
        // Fetching counts based on issue status
        long reportedCount = issueRepository.countIssuesByStatus("Reported");
        long inProgressCount = issueRepository.countIssuesByStatus("In Progress");
        long resolvedCount = issueRepository.countIssuesByStatus("Resolved");

        // Creating a Map to hold the issue counts
        Map<String, Long> issueCount = new HashMap<>();
        issueCount.put("Reported", reportedCount);
        issueCount.put("In Progress", inProgressCount);
        issueCount.put("Resolved", resolvedCount);

        return issueCount;
    }



}
