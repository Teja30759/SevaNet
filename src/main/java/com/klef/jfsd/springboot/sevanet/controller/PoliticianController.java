package com.klef.jfsd.springboot.sevanet.controller;

import java.io.IOException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
//import org.springframework.web.bind.annotation.PutMapping;
//import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.klef.jfsd.springboot.sevanet.model.Department;
//import com.klef.jfsd.springboot.sevanet.model.Department;
import com.klef.jfsd.springboot.sevanet.model.Issue;
import com.klef.jfsd.springboot.sevanet.model.Politician;
import com.klef.jfsd.springboot.sevanet.service.DepartmentService;
import com.klef.jfsd.springboot.sevanet.service.EmailService;
import com.klef.jfsd.springboot.sevanet.service.PoliticianService;

import jakarta.mail.internet.MimeMessage;
//import jakarta.security.auth.message.callback.PrivateKeyCallback.Request;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@Controller
public class PoliticianController {
	
	@Autowired
	private PoliticianService politicianservice;
	
	@Autowired
	private DepartmentService departmentservice;

	
	  @Autowired 
	  private JavaMailSender mailSender; 
	
	
	  @Autowired
	    private EmailService emailService;
	
	
	@GetMapping("politicianlogin")
	  public ModelAndView politicianlogin()
	  {
	    ModelAndView mv = new ModelAndView();
	    mv.setViewName("politicianlogin");
	    return mv;
	  }
	  
	  @PostMapping("checkpoliticianlogin")
	    public ModelAndView checkpoliticianlogin(HttpServletRequest request)
	    {
	        ModelAndView mv = new ModelAndView();
	        
	        String username = request.getParameter("username");
	        String password = request.getParameter("password");
	        Politician politician = politicianservice.checkPoliticainlogin(username, password);
	        
	        if (politician != null)
	        {
	        	HttpSession session  = request.getSession();
				session.setAttribute("politician", politician);
		
				mv.setViewName("politicianhome"); // Assuming Politician has a getName() method
	        }
	        else
	        {
	            mv.setViewName("politicianlogin");
	            mv.addObject("message", "Login Failed");
	        }
	        
	        return mv;
	    }
	  
	  
	
	
	@GetMapping("politicianhome")
	public ModelAndView politicianhome( HttpServletRequest request) {
		
		
		
		HttpSession session = request.getSession();
		Politician poli = (Politician) session.getAttribute("politician");
		
		long count = politicianservice.countIssuesByConstituency(poli.getConstituency());
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("politicianhome");
		mv.addObject("totalissues", count);
		return mv;
	}
	

	@GetMapping("viewissuespage")
	public ModelAndView viewissuespage(HttpServletRequest request) {
		ModelAndView mv = new ModelAndView("viewissuepage");
		
		HttpSession session = request.getSession();
		Politician poli = (Politician) session.getAttribute("politician");
		
		
		List<Issue> issues = politicianservice.findByConstituency(poli.getConstituency());
		
		
		mv.addObject("issuelist", issues);
		
		return mv;
		
	}
	
	
    @GetMapping("respondtoissuespage")
    public ModelAndView respondtoissuespage(HttpServletRequest request) {
        ModelAndView mv = new ModelAndView("respondtoissuepage");
		
		HttpSession session = request.getSession();
		Politician poli = (Politician) session.getAttribute("politician");
		
		
		
		List<Issue> issues = politicianservice.findByConstituency(poli.getConstituency());
		
		mv.addObject("issuelist", issues);
    	return mv;
    }
    
    
    @PostMapping("updateIssueFields")
    public void updateIssueFields(HttpServletRequest request,HttpServletResponse respoonse) throws IOException
    {
    	int id = Integer.parseInt(request.getParameter("id"));
    	String status =  request.getParameter("status");
    	String priority = request.getParameter("priority");
    	String assignedTo = request.getParameter("assignedTo");
    	
    	politicianservice.updatestatuspriorityassignedto( id,  assignedTo,  priority,  status );
    	
        ModelAndView mv = new ModelAndView();
        
       
       respoonse.sendRedirect("viewissuespage");
      
        
    	
    }
    
    @GetMapping("sendannouncementspage")
    public ModelAndView sendannouncementspage() {
    	ModelAndView mv = new ModelAndView("sendannouncementpage");
    	return mv;
    }
    
  
    @PostMapping("/sendannouncements")
    public String sendAnnouncements(@RequestParam String subject, @RequestParam String message, HttpSession session) {
        Politician politician = (Politician) session.getAttribute("politician");
        if (politician == null) {
            return "redirect:/politiciansessionexpiry";
        }

        // Logic to retrieve citizens in the constituency and send emails
        List<String> emails = politicianservice.findEmailsByConstituency(politician.getConstituency());
        emailService.sendEmail(emails.toArray(new String[0]), subject, message);

        return "redirect:/sendannouncementspage?success=true";
    }

    
    
    
    @GetMapping("ViewDepartments")
    public ModelAndView viewfeedbackpage(HttpServletRequest request) {
    	

    	ModelAndView mv = new ModelAndView("ViewDepartments");
    	HttpSession session = request.getSession();
    	Politician poli = (Politician)session.getAttribute("politician");
    	
    	List<Department>  departments = politicianservice.findBydepConstituency(poli.getConstituency());
    	mv.addObject("deplist", departments);
    	return mv;
    }
    
    

    
    @GetMapping("profilepage")
    public ModelAndView profilepage() {
    	ModelAndView mv = new ModelAndView("politicainprofilepage");
    	return mv;
    }
    
    @GetMapping("updateprofilepage")
    public ModelAndView updateprofilepage() {
    	ModelAndView mv = new ModelAndView("updateprofilepage");
    	
    	return mv;
    }
    
    @PostMapping("updatepoliticianprofile")
    public ModelAndView updatepoliticianprofile(HttpServletRequest request) {
    	
    	ModelAndView mv = new ModelAndView();
    	
    	try {
    		int id = Integer.parseInt(request.getParameter("pid"));
    		
    		String name = request.getParameter("pname");
    		String party = request.getParameter("pparty");
    		String constituency = request.getParameter("pconstituency");
    		String position = request.getParameter("pposition");
    		String contact = request.getParameter("pcontact_info");
    		String password = request.getParameter("ppassword");
    		
    		Politician p = new Politician();
    		
    		p.setId(id);
    		p.setName(name);
    		p.setParty(party);
    		p.setConstituency(constituency);
    		p.setPosition(position);
    		p.setContactInfo(contact);
    		p.setPassword(password);
    		
    		String msg = politicianservice.politicianprofileupdat(p);
    		
    		Politician poli = politicianservice.displaypoliticanbyid(id);
    		
    		HttpSession session = request.getSession();
    		session.setAttribute("politician", poli);
    		
    		
    		mv.setViewName("updateprofilepage");
    		mv.addObject("message", msg);
 
    		
    		
    		
    	}catch (Exception e) {
			mv.setViewName("updaterror");
		}
    	
    	return mv;
    }
    
    @GetMapping("politicianlogout")
    public ModelAndView politicianlogout(HttpServletRequest request) {

    	HttpSession session = request.getSession();
    	
    	session.invalidate();
    	
    	ModelAndView mv = new ModelAndView();
    	mv.setViewName("home");
    	
    	return mv;
    }
    
    @GetMapping("politiciansessionexpage")
    public ModelAndView politiciansessionexpage() {
    	ModelAndView mv = new ModelAndView();
    	mv.setViewName("sessionexpage");
    	return mv;
    }
    
    

}
