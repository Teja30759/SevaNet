package com.klef.jfsd.springboot.sevanet.service;

import java.util.List;

import com.klef.jfsd.springboot.sevanet.model.Citizen;
import com.klef.jfsd.springboot.sevanet.model.Constituency;
import com.klef.jfsd.springboot.sevanet.model.Issue;

public interface CitizenService
{
public String CitizenRegistration(Citizen citizen);
public Citizen checkCitizenLogin(String caadharno,String cpassword );
public String updateCitizenProfile(Citizen citizen);
public Citizen displayCitizenID(int cid);

public String addIssue(Issue issue) ;
public   List<Issue> trackIssue(String name);
public List<Issue> trackallissues();
public List<Issue> trackIssueByAadhar(String aadhar);



public List<Constituency> getAllConstituencies();

}
