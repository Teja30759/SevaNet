	package com.klef.jfsd.springboot.sevanet.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.sql.Blob;
import org.springframework.http.MediaType;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.http.MediaType;
import org.springframework.web.multipart.MultipartFile;
import com.klef.jfsd.springboot.sevanet.model.Citizen;
import com.klef.jfsd.springboot.sevanet.model.Constituency;
import com.klef.jfsd.springboot.sevanet.model.Issue;
import com.klef.jfsd.springboot.sevanet.service.CitizenService;

import java.text.ParseException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
public class CitizenController
{
    @Autowired
    private CitizenService citizenService;
    
    

    @GetMapping("citizenreg")
    public ModelAndView citizenreg() {
        ModelAndView mv = new ModelAndView();
        List<Constituency> constituencies = citizenService.getAllConstituencies(); // Fetching constituencies
        mv.addObject("constituencies", constituencies); // Passing to the view
        mv.setViewName("citizenreg");
        return mv;
    }


    @PostMapping("insertcitizen")
    public ModelAndView addCitizen(HttpServletRequest request) {
        String firstName = request.getParameter("firstName");
        String lastName = request.getParameter("lastName");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String address = request.getParameter("address");
        String contact = request.getParameter("contact");
        String aadharNumber = request.getParameter("aadharNumber");
        String constituency = request.getParameter("constituency");
        String gender = request.getParameter("gender");
        String maritalStatus = request.getParameter("maritalStatus");
        String status = "Registered"; // Default status on registration

        // Parsing date of birth
        Date dateOfBirth = null;
        try {
            dateOfBirth = new SimpleDateFormat("yyyy-MM-dd").parse(request.getParameter("dateOfBirth"));
        } catch (ParseException e) {
            e.printStackTrace();
        }

        Citizen citizen = new Citizen();
        citizen.setFirstname(firstName);
        citizen.setLastname(lastName);
        citizen.setEmail(email);
        citizen.setPassword(password);
        citizen.setAddress(address);
        citizen.setContact(contact);
        citizen.setAadharnumber(aadharNumber);
        citizen.setConstituency(constituency);
        citizen.setGender(gender);
        citizen.setMaritalstatus(maritalStatus);
        citizen.setDateofbirth(dateOfBirth);
        citizen.setStatus(status);

        String msg = citizenService.CitizenRegistration(citizen);
        ModelAndView mv = new ModelAndView("regsuccess");
        mv.addObject("message", msg);

        return mv;
    }

    @GetMapping("citizenlogin")
    public ModelAndView citizenlogin()
    {
        ModelAndView mv = new ModelAndView("citizenlogin");
        return mv;
    }

    @PostMapping("checkCitizenLogin")
    public ModelAndView checkCitizenLogin(HttpServletRequest request)
    {
        ModelAndView mv = new ModelAndView();
        String aadharno = request.getParameter("aadharNumber");
        String pwd = request.getParameter("password");
        Citizen citz = citizenService.checkCitizenLogin(aadharno, pwd);

        if (citz != null)
        {
            if ("Accepted".equals(citz.getStatus())) {
                // If status is "Accepted," proceed to citizen home
                HttpSession session = request.getSession();
                session.setAttribute("citizen", citz);
                mv.setViewName("citizenhome");
            } else {
                // If status is not "Accepted," display message
                mv.setViewName("citizenlogin");
                mv.addObject("msg", "Status not yet updated or rejected");
            }
        }
        else 
        {
            mv.setViewName("citizenlogin");
            mv.addObject("msg", "Login Failed");
        }
        return mv;
    }

    @GetMapping("citizenhome")
    public ModelAndView citizenhome()
    {
        ModelAndView mv = new ModelAndView();
        mv.setViewName("citizenhome");
        return mv;
    }
    
    @GetMapping("citizenprofile")
	public ModelAndView citizenprofile()
	{
		ModelAndView mv=new ModelAndView("citizenprofile");
		return mv;
	}
	

  @GetMapping("updatecitizen")
  public ModelAndView updatecitizen() 
  {
	  ModelAndView mv=new ModelAndView("updatecitizen");
	  return mv;
  }
  
  @PostMapping("updateCitizenProfile")
  public ModelAndView updateCitizenProfile(HttpServletRequest request) {
      ModelAndView mv = new ModelAndView();

      try {
          int id = Integer.parseInt(request.getParameter("cid"));
          String firstName = request.getParameter("firstname");
          String lastName = request.getParameter("lastname");
          String address = request.getParameter("address");
          String email = request.getParameter("email");
          String gender = request.getParameter("gender");
          String maritalStatus = request.getParameter("maritalstatus");
          

          Citizen citizen = new Citizen();
          citizen.setId(id);
          citizen.setFirstname(firstName);
          citizen.setLastname(lastName);
          citizen.setAddress(address);
          citizen.setGender(gender);
          citizen.setEmail(email);
          citizen.setMaritalstatus(maritalStatus);

          String msg = citizenService.updateCitizenProfile(citizen);

          
          Citizen citiz = citizenService.displayCitizenID(id);
          HttpSession session = request.getSession();
          session.setAttribute("citizen", citiz);

          mv.setViewName("updatesuccess");
          mv.addObject("message", msg);

      } catch (Exception e) {
          mv.setViewName("updateerror");
          mv.addObject("message", "Error updating profile: " + e.getMessage());
      }

      return mv;
  }
  
  @GetMapping("addissue")
  public ModelAndView addIssue() {
      ModelAndView mv = new ModelAndView("addissue");

      // Fetch constituencies to display in the dropdown
      List<Constituency> constituencyList = citizenService.getAllConstituencies();
      mv.addObject("constituencyData", constituencyList);

      return mv;
  }
	

  
  
  


  

  @PostMapping("insertissue")
  public ModelAndView insertIssue(HttpServletRequest request,@RequestParam("issueimage") MultipartFile file) throws Exception {
      String msg = null;
      ModelAndView mv = new ModelAndView();
      
      try {
          // Extract form parameters
          String title = request.getParameter("title");
          String description = request.getParameter("description");
          String issueType = request.getParameter("issueType");
          String status = "Reported";
          String priority = "null";
          String location = request.getParameter("location");
          String constituency = request.getParameter("constituency");
          String reportedBy = request.getParameter("reportedBy");
          String assignedTo = "null";
          String createdDate = request.getParameter("createdDate");
          String updatedDate = "null";
          String urgencyLevel = request.getParameter("urgencyLevel");
          byte[] bytes = file.getBytes();
          
		  Blob blob = new javax.sql.rowset.serial.SerialBlob(bytes);
          
          
          // Create and set attributes for Issue object
          Issue issue = new Issue();
          issue.setTitle(title);
          issue.setDescription(description);
          issue.setIssueType(issueType);
          issue.setStatus(status);
          issue.setPriority(priority);
          issue.setLocation(location);
          issue.setConstituency(constituency);
          issue.setReportedBy(reportedBy);
          issue.setAssignedTo(assignedTo);
          issue.setCreatedDate(createdDate);
          issue.setUpdatedDate(updatedDate);
          issue.setUrgencyLevel(urgencyLevel);
          issue.setImage(blob);
          
          
          // Save the Issue object using the service
          msg = citizenService.addIssue(issue);
          System.out.println(msg);
          mv.setViewName("issuemsg");
          mv.addObject("message", msg);
      } catch (Exception e) {
          msg = e.getMessage();
          System.out.println(msg);
          mv.setViewName("issueerror");
          mv.addObject("message", msg);
      }
      
      return mv;
  }
  
  @GetMapping("trackissue")
  public ModelAndView trackIssueStatus(HttpServletRequest request)
  {
  	ModelAndView mv=new ModelAndView("viewissuebycitizen");
  	HttpSession  session=request.getSession();
  	Citizen citz= (Citizen) session.getAttribute("citizen");
  	 String aadhar = citz.getAadharnumber();  // Fetch the Aadhar number from the Citizen object
  	    List<Issue> issues = citizenService.trackIssueByAadhar(aadhar);  // Use Aadhar for fetching issues
  	    mv.addObject("issues", issues);
  	return mv;
 }
  
  
    @GetMapping("citizenlogout")
	public ModelAndView adminlogout()
	{
		ModelAndView mv = new ModelAndView();
		mv.setViewName("home");
		return mv;
	}
    
    
    @GetMapping("citizensessionexpiry")
	public ModelAndView citizensessionexpiry(HttpServletRequest request)
	{
		ModelAndView mv = new ModelAndView();
		mv.setViewName("citizensessionexpiry");
		return mv;
	}
    
}
