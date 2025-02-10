package com.klef.jfsd.springboot.sevanet.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;

import com.klef.jfsd.springboot.sevanet.model.Issue;

import jakarta.transaction.Transactional;

public interface IssueRepository extends JpaRepository<Issue, Integer> 
{
  public List<Issue> findByStatus(String status);
  
  @Query("update Issue i set i.status=?4,i.priority=?3,i.assignedTo=?2 where i.id=?1")
  @Modifying
  @Transactional
  public int updatestatuspriorityassignedto(int id, String assignedTo, String priority, String status );
  
  
  public List<Issue> findByConstituency(String constituency);
  
    public List<Issue> findByAssignedToAndConstituency(String assignedTo, String constituency);
    
    @Query("update Issue i set i.status=?3 , i.updatedDate=?2 where i.id=?1")
    @Modifying
  @Transactional
  public int updateStatusandupdateDate(int id,String updateDate , String status);
    
    
    @Query("SELECT COUNT(i) FROM Issue i WHERE i.constituency = ?1")
    public long countIssuesByConstituency(String constituency);
    
    public  List<Issue> findByReportedBy(String reportedBy);
    
    long countIssuesByStatus(String status);
    
}