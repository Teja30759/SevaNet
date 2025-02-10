package com.klef.jfsd.springboot.sevanet.service;

import java.util.List;
import java.util.Map;
import java.util.Optional;

import com.klef.jfsd.springboot.sevanet.model.Admin;
import com.klef.jfsd.springboot.sevanet.model.Citizen;
import com.klef.jfsd.springboot.sevanet.model.Constituency;
import com.klef.jfsd.springboot.sevanet.model.Department;
import com.klef.jfsd.springboot.sevanet.model.Issue;
import com.klef.jfsd.springboot.sevanet.model.Party;
import com.klef.jfsd.springboot.sevanet.model.Politician;

public interface AdminService 
{
	public Admin checkadminlogin(String uname, String pwd);
	public String AddPolitician(Politician pol);
	public String AddDepartment(Department dept);
	public List<Politician> viewAllPoliticians();
	public String deletepolitician(int pid);
	public List<Department> viewAllDepartments();
	public String deleteDepartment(String did);
	public List<Citizen> viewAllCitizens();
	//public Politician getPoliticianById(int pid);
   // public String updatePolitician(Politician pol);
	
	public Politician findPoliticianById(int id);
    public void updatePolitician(Politician politician);
    
    public Department findDepartmentById(String id);
    public void updateDepartment(Department department);
    
    public String updateCitizenStatus(String status,int eid);
    public String deleteCitizen(int cid);
    
    public List<Issue> getAllIssues();
    public List<Issue> findIssuesByStatus(String status);
    
    public long politicianscount();
    public long departmentscount();
    public long citizenscount();
    
    public String addconstitueny(Constituency con);
    public String addparty(Party par);
    
    
    //
    
   // public String addissue(Issue is);
    
    //
    
    
 public String deleteissue(int pid);
    
    
    public List<Constituency> getAllConstituencies();
    

    public long issuecount();
    
    
    public List<Party> getAllParties();
    
    
   
    public Map<String, Long> getIssueCounts();

}
