package com.klef.jfsd.springboot.sevanet.model;

import java.sql.Blob;
import java.util.Date;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity
@Table(name="issue_table")
public class Issue {
	
	    @Id
	    @GeneratedValue(strategy = GenerationType.AUTO)
	    @Column(name = "id")
	    private int id;

	    @Column(name = "title",nullable = false)
	    private String title;

	    @Column(name = "description",nullable = false)
	    private String description;

	    @Column(name = "issue_type",nullable = false)
	    private String issueType; // e.g., "Infrastructure", "Health", "Education"

	    @Column(name = "status")
	    private String status; // e.g., "Reported", "In Progress", "Resolved"

	    @Column(name = "priority")
	    private String priority; // e.g., "Low", "Medium", "High"

	    @Column(name = "location",nullable = false)
	    private String location;
	    // Location of the issue (could be a city, district, or specific address)

	    @Column(name = "constituency",nullable = false)
	    private String constituency; 
	    
	    @Column(name = "reported_by",nullable = false)
	    private String reportedBy; // User who reported the issue

	    @Column(name = "assigned_to")
	    private String assignedTo; // Representative or department assigned to the issue

	    @Column(name = "created_date",nullable = false)
	    private String createdDate;

	    @Column(name = "updated_date")
	    private String updatedDate;

	    @Column(name = "urgency_level",nullable = false)
	    private String urgencyLevel; // e.g., "Immediate", "Soon", "Whenever possible"
	    

		@Column(name="issue_image",nullable = false)
	    private Blob image;

		public int getId() {
			return id;
		}

		public void setId(int id) {
			this.id = id;
		}

		public String getTitle() {
			return title;
		}

		public void setTitle(String title) {
			this.title = title;
		}

		public String getDescription() {
			return description;
		}

		public void setDescription(String description) {
			this.description = description;
		}

		public String getIssueType() {
			return issueType;
		}

		public void setIssueType(String issueType) {
			this.issueType = issueType;
		}

		public String getStatus() {
			return status;
		}

		public void setStatus(String status) {
			this.status = status;
		}

		public String getPriority() {
			return priority;
		}

		public void setPriority(String priority) {
			this.priority = priority;
		}

		public String getLocation() {
			return location;
		}

		public void setLocation(String location) {
			this.location = location;
		}

		public String getReportedBy() {
			return reportedBy;
		}

		public void setReportedBy(String reportedBy) {
			this.reportedBy = reportedBy;
		}

		public String getAssignedTo() {
			return assignedTo;
		}

		public void setAssignedTo(String assignedTo) {
			this.assignedTo = assignedTo;
		}

		public String getCreatedDate() {
			return createdDate;
		}

		public void setCreatedDate(String createdDate) {
			this.createdDate = createdDate;
		}

		public String getUpdatedDate() {
			return updatedDate;
		}

		public void setUpdatedDate(String updatedDate) {
			this.updatedDate = updatedDate;
		}

		public String getUrgencyLevel() {
			return urgencyLevel;
		}

		public void setUrgencyLevel(String urgencyLevel) {
			this.urgencyLevel = urgencyLevel;
		}

		public String getConstituency() {
			return constituency;
		}

		public void setConstituency(String constituency) {
			this.constituency = constituency;
		}
	    
		public Blob getImage() {
			return image;
		}
		
		public void setImage(Blob image) {
			this.image = image;
		}
	
}
