package com.klef.jfsd.springboot.sevanet.controller;

import java.util.List;
//import java.util.Optional;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;

import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.klef.jfsd.springboot.sevanet.model.Admin;
import com.klef.jfsd.springboot.sevanet.model.Citizen;
import com.klef.jfsd.springboot.sevanet.model.Constituency;
import com.klef.jfsd.springboot.sevanet.model.Department;
import com.klef.jfsd.springboot.sevanet.model.Issue;
import com.klef.jfsd.springboot.sevanet.model.Party;
import com.klef.jfsd.springboot.sevanet.model.Politician;
import com.klef.jfsd.springboot.sevanet.service.AdminService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
public class AdminController 
{
	@Autowired
	private AdminService adminService;
	
	
	
	@GetMapping("/")
	public ModelAndView home()
	{
		ModelAndView mv = new ModelAndView();
		mv.setViewName("home");
		return mv;
	}
	
	@GetMapping("adminlogin")
	public ModelAndView adminlogin()
	{
		ModelAndView mv = new ModelAndView();
		mv.setViewName("adminlogin");
		return mv;
	}
	
	@PostMapping("checkadminlogin")
	public ModelAndView checkadminlogin(HttpServletRequest request)
	{
		ModelAndView mv = new ModelAndView();
		
		String auname = request.getParameter("auname");
		String apwd = request.getParameter("apwd");
		Admin admin = adminService.checkadminlogin(auname, apwd);
		if(admin!=null)
		{
			HttpSession session = request.getSession();
			session.setAttribute("admin", admin);
			mv.setViewName("adminhome");
			session.setMaxInactiveInterval(5000);
		}
		else
		{
			mv.setViewName("adminlogin");
			mv.addObject("message", "Login Failed");
		}
		return mv;
	}
	
	@GetMapping("adminhome")
	  public ModelAndView adminhome(HttpSession session) {
	      ModelAndView mv = new ModelAndView();
	      
	      // Retrieve the logged-in admin from the session
	      Admin admin = (Admin) session.getAttribute("admin");

	      // If the admin is not logged in, redirect to the session expiry page
	      if (admin == null) {
	          mv.setViewName("adminsessionexpiry");
	          return mv;
	      }

	      // Fetch counts for politicians, departments, and citizens
	      long politicianCount = adminService.politicianscount();
	      long departmentCount = adminService.departmentscount();
	      long citizenCount = adminService.citizenscount();

	      // Fetch issue counts (Reported, In Progress, Resolved)
	      Map<String, Long> issueCounts = adminService.getIssueCounts();
	      long reportedCount = issueCounts.getOrDefault("Reported", 0L);
	      long inProgressCount = issueCounts.getOrDefault("In Progress", 0L);
	      long resolvedCount = issueCounts.getOrDefault("Resolved", 0L);

	      // Add all the counts and the admin username to the model
	      mv.addObject("polcount", politicianCount);
	      mv.addObject("deptcount", departmentCount);
	      mv.addObject("citcount", citizenCount);
	      mv.addObject("reportedCount", reportedCount);
	      mv.addObject("inProgressCount", inProgressCount);
	      mv.addObject("resolvedCount", resolvedCount);
	      mv.addObject("adminUsername", admin.getUsername());

	      // Set the view name
	      mv.setViewName("adminhome");
	      
	      return mv;
	  }
	
	@GetMapping("/addpolitician")
	public ModelAndView addpolitician() {
	    ModelAndView mv = new ModelAndView();
	    try {
	        // Fetch constituency data
	        List<Constituency> constituencyList = adminService.getAllConstituencies();
	        mv.addObject("constituencyData", constituencyList);

	        // Fetch party data
	        List<Party> partyList = adminService.getAllParties();
	        mv.addObject("partyData", partyList);

	        // Set view
	        mv.setViewName("addpolitician");
	    } catch (Exception e) {
	        mv.addObject("message", "Error: Unable to fetch data.");
	        mv.setViewName("error"); // Optional: You can redirect to an error page
	    }
	    return mv;
	}

	@PostMapping("/insertpolitician")
	public ModelAndView insertpolitician(HttpServletRequest request) {
	    ModelAndView mv = new ModelAndView();
	    try {
	        // Fetch form data
	        String name = request.getParameter("pname");
	        String party = request.getParameter("pparty");
	        String constituency = request.getParameter("pconstituency");
	        String position = request.getParameter("pposition");
	        String contactInfo = request.getParameter("pcontact_info");
	        String password = request.getParameter("ppassword");

	        // Create Politician object
	        Politician politician = new Politician();
	        politician.setName(name);
	        politician.setParty(party);
	        politician.setConstituency(constituency);
	        politician.setPosition(position);
	        politician.setContactInfo(contactInfo);
	        politician.setPassword(password);

	        // Add politician using the service
	        String msg = adminService.AddPolitician(politician);
	        mv.addObject("message", msg);
	    } catch (Exception e) {
	        mv.addObject("message", "Error: Unable to add politician.");
	    }
	    mv.setViewName("addpolitician");
	    return mv;
	}

	@GetMapping("adddepartment")
	public ModelAndView adddepartment() {
	    ModelAndView mv = new ModelAndView();

	    // Fetch constituencies from the service or repository
	    List<Constituency> constituencyList = adminService.getAllConstituencies();  // Adjust with your actual service and method
	    mv.addObject("constituencyData", constituencyList);  // Passing list to JSP

	    mv.setViewName("adddepartment");
	    return mv;
	}

	
	@PostMapping("insertdepartment")
	public ModelAndView insertDepartment(HttpServletRequest request) {
	    String msg;
	    ModelAndView mv = new ModelAndView();
	    
	    try {
	        // Extract form parameters
	        String departmentId = request.getParameter("depid");
	        String name = request.getParameter("dname");
	        String constituency = request.getParameter("pconstituency");
	        String description = request.getParameter("ddescription");
	        String contactEmail = request.getParameter("dcontact_email");
	        String password = request.getParameter("dpassword");

	        // Validate mandatory fields
	        if (departmentId == null || name == null || constituency == null || contactEmail == null || password == null) {
	            throw new IllegalArgumentException("All fields are required.");
	        }
	        
	        // Set values in Department object
	        Department department = new Department();
	        department.setDepartmentid(departmentId);
	        department.setName(name);
	        department.setConstituency(constituency);
	        department.setDescription(description);
	        department.setContactEmail(contactEmail);
	        department.setPassword(password);

	        // Save department through the service
	        msg = adminService.AddDepartment(department);
	        mv.setViewName("adddepartment");
	        mv.addObject("message", msg);
	        
	    } catch (Exception e) {
	        msg = "Error: " + e.getMessage();
	        mv.setViewName("adddepartment");
	        mv.addObject("message", msg);
	        
	    }

	    
	    return mv;
	}
	
	@GetMapping("managepoliticians")
    public ModelAndView viewallemps()
    {
      ModelAndView mv = new ModelAndView();
      List<Politician> politicianslist = adminService.viewAllPoliticians();
      
      mv.setViewName("managepoliticians");
      mv.addObject("politicianslist",politicianslist);
      long count =  adminService.politicianscount();
      mv.addObject("polcount", count);
      return mv;
    }
	
	
	
	
	
	
	@GetMapping("deletepolitician")
	public String deletepolitician(@RequestParam("id") int pid)
	{
		adminService.deletepolitician(pid);
		return "redirect:/managepoliticians";
	}
	
	@GetMapping("managedepartments")
    public ModelAndView viewalldepartments()
    {
      ModelAndView mv = new ModelAndView();
      List<Department> departmentslist = adminService.viewAllDepartments();
      
      mv.setViewName("managedepartments");
      
      mv.addObject("departmentslist",departmentslist);
      long count =  adminService.departmentscount();
      mv.addObject("deptcount", count);
      return mv;
    }
	
	
	
	@GetMapping("searchpolitician")
	public ModelAndView searchPolitician() {
	    ModelAndView mv = new ModelAndView();
	    mv.setViewName("searchpolitician"); // This corresponds to searchpolitician.jsp
	    return mv;
	}


	@GetMapping("updatepolitician")
	public ModelAndView showUpdatePoliticianForm(@RequestParam("id") int id) {
	    ModelAndView mv = new ModelAndView("updatepolitician");
	    Politician politician = adminService.findPoliticianById(id);
	    mv.addObject("politician", politician);
	    return mv;
	}

	@PostMapping("updatepolitician")
	public String updatePolitician(
	        @RequestParam("id") int id,
	        @RequestParam("name") String name,
	        @RequestParam("party") String party,
	        @RequestParam("constituency") String constituency,
	        @RequestParam("position") String position,
	        @RequestParam("contactInfo") String contactInfo,
	        @RequestParam("password") String password) {
	    
	    // Fetch the existing politician record
	    Politician politician = adminService.findPoliticianById(id);
	    
	    // Update only the necessary fields
	    politician.setName(name);
	    politician.setParty(party);
	    politician.setConstituency(constituency);
	    politician.setPosition(position);
	    politician.setContactInfo(contactInfo);
	    
	    // Update password only if a new one is provided
	    if (password != null && !password.isEmpty()) {
	        politician.setPassword(password);
	    }
	    
	    // Save the updated politician
	    adminService.updatePolitician(politician);
	    
	    return "redirect:/managepoliticians";
	}




	
	@GetMapping("updatedepartment")
	public ModelAndView showUpdateDepartmentForm(@RequestParam("id") String id) {
	    ModelAndView mv = new ModelAndView("updatedepartment");
	    Department department = adminService.findDepartmentById(id);
	    mv.addObject("department", department);
	    return mv;
	}

	@PostMapping("updatedepartment")
	public String updateDepartment(
	        @RequestParam("id") String id,
	        @RequestParam("name") String name,
	        @RequestParam("constituency") String constituency,
	        @RequestParam("description") String description,
	        @RequestParam("contactEmail") String contactEmail,
	        @RequestParam("password") String password) {
		
	    
	    Department department = adminService.findDepartmentById(id);
	    department.setName(name);
	    department.setConstituency(constituency);
	    department.setDescription(description);
	    department.setContactEmail(contactEmail);
	    
	    // Only update the password if a new one is provided
	    if (password != null && !password.isEmpty()) {
	        department.setPassword(password);
	    }
	    
	    adminService.updateDepartment(department);
	    return "redirect:/managedepartments";
	}
	
	@GetMapping("deletedepartment")
	public String deletedepartment(@RequestParam("id") String did)
	{
		adminService.deleteDepartment(did);
		return "redirect:/managedepartments";
	}
	
	@GetMapping("managecitizens")
	public ModelAndView managecitizens()
	{
	      ModelAndView mv = new ModelAndView();
	      List<Citizen> citizenlist = adminService.viewAllCitizens();
	      mv.setViewName("managecitizens");
	      
	      mv.addObject("citizenlist",citizenlist);
	      long count =  adminService.citizenscount();
	      mv.addObject("citizencount", count);
	      return mv;
	}
	
	@GetMapping("deletecitizen")
	public String deletecitizen(@RequestParam("id") int cid)
	{
		adminService.deleteCitizen(cid);
		return "redirect:/managecitizens";
	}
	
	@GetMapping("updatestatus")
	public String updatestatus(@RequestParam("id")  int eid,@RequestParam("status")  String status)
	{	
		adminService.updateCitizenStatus(status, eid);
		return "redirect:/managecitizens";
	}
	
	@GetMapping("viewissues")
	public ModelAndView viewIssues(HttpServletRequest request) {
	    String status = request.getParameter("status");
	    List<Issue> issues;

	    if ("Reported".equals(status) || "In Progress".equals(status) || "Resolved".equals(status)) {
	        issues = adminService.findIssuesByStatus(status);
	    } else {
	        issues = adminService.getAllIssues(); 
	    }

	    request.setAttribute("issues", issues);
	    ModelAndView mv = new ModelAndView();
	    
	    mv.setViewName("view-issues");
	    //return "view-issues";
	    return mv;
	}
	
	@GetMapping("deleteissue")
	public String deleteissue(@RequestParam("id") int iid) {
		
		adminService.deleteissue(iid);
		return "redirect:/viewissues";
		
	}
	
	@GetMapping("addconstituency")
	public ModelAndView addconstituency() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("addconstituency");
		return mv;
	}
	
	@GetMapping("insertconstituency")
	public ModelAndView insertconstituency(HttpServletRequest request) {
		String msg;
		ModelAndView mv = new ModelAndView();
		try {
			
			int pincode =  Integer.parseInt( request.getParameter("pincode"));
			String name = request.getParameter("constname");
			
			Constituency con = new Constituency();
			con.setPincode(pincode);
			con.setName(name);
			
			msg = adminService.addconstitueny(con);
			mv.addObject("message", msg);
			mv.setViewName("addconstituency");
		
		}
		catch(Exception e) {
			msg="Error Occured";
			
			mv.addObject("message", msg);
			mv.setViewName("addconstituency");
		}
		return mv;
	}
	
	
	@GetMapping("addparty")
	public ModelAndView addparty() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("addparty");
		return mv;
	}

	
	@GetMapping("insertparty")
	public ModelAndView insertpart(HttpServletRequest request) {
		String msg;
		ModelAndView mv = new ModelAndView();
		try {
			
			
			String name = request.getParameter("constname");
			
			Party par = new Party();
			par.setName(name);
			
			msg = adminService.addparty(par);
			mv.addObject("message", msg);
			mv.setViewName("addparty");
		
		}
		catch(Exception e) {
			msg="Error Occured";
			
			mv.addObject("message", msg);
			mv.setViewName("addparty");
		}
		return mv;
	}
	
	
	
	
	

	
	@GetMapping("adminlogout")
	public ModelAndView adminlogout(HttpServletRequest request)
	{
		HttpSession session = request.getSession();
		session.removeAttribute("admin");
		ModelAndView mv = new ModelAndView();
		mv.setViewName("home");
		return mv;
	}
	
	@GetMapping("adminsessionexpiry")
	public ModelAndView adminsessionexpiry(HttpServletRequest request)
	{
		ModelAndView mv = new ModelAndView();
		mv.setViewName("adminsessionexpiry");
		return mv;
	}
	
	
	
	
	
	
	
	@GetMapping("reportissuepage")
	public ModelAndView reportissuepage() {
		ModelAndView mv = new ModelAndView("reportissuepage");
		return mv;
	}
	
	
	
}
