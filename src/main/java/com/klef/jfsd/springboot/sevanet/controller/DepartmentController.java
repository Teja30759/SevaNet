package com.klef.jfsd.springboot.sevanet.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
//import org.springframework.web.bind.annotation.PutMapping;
//import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

//import com.klef.jfsd.springboot.sevanet.model.Admin;
import com.klef.jfsd.springboot.sevanet.model.Department;
import com.klef.jfsd.springboot.sevanet.model.Issue;
import com.klef.jfsd.springboot.sevanet.service.DepartmentService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
public class DepartmentController {
	
	@Autowired
	private DepartmentService departmentService;
	
	@GetMapping("departmentlogin")
	public ModelAndView departmentlogin()
	{
		ModelAndView mv = new ModelAndView();
		mv.setViewName("departmentlogin");
		return mv;
	}
	
	@PostMapping("checkdepartmentlogin")
	public ModelAndView checkdepartmentlogin(HttpServletRequest request)
	{
		ModelAndView mv = new ModelAndView();
		
		String did = request.getParameter("did");
		String dpwd = request.getParameter("dpwd");
		Department dep = departmentService.checkdepartmentlogin(did, dpwd);
		if(dep!=null)
		{
			HttpSession session = request.getSession();
			session.setAttribute("department", dep);
			mv.setViewName("departmenthome");
		}
		else
		{
			mv.setViewName("departmentlogin");
			mv.addObject("message", "Login Failed");
		}
		return mv;
	}
	
	@GetMapping("departmenthome")
	public ModelAndView departmenthome() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("departmenthome");
		return mv;
	}
	
	
	@GetMapping("assignedissuespage")
	public ModelAndView assignedissuespage() {
		ModelAndView mv = new ModelAndView();
		
		
		mv.setViewName("assignedissuespage");
		return mv;
	}
	
	@PostMapping("issueupdate")
	public ModelAndView issueupdate(HttpServletRequest request) {
		ModelAndView mv = new ModelAndView();
		
		String assignedto = request.getParameter("iname");
		String constituency = request.getParameter("pconstituency");
		
		List<Issue> issuelist = departmentService.findByAssignedToAndConstituency(assignedto, constituency);
		
		mv.setViewName("issuestatusupdate");
		
		mv.addObject("issues", issuelist);
		return mv;
	}
	
	
	@PostMapping("issueupdation")
	public ModelAndView issueupdation(HttpServletRequest request) {
		
		ModelAndView mv = new ModelAndView();
		
		int id = Integer.parseInt(request.getParameter("id"));
		String date = request.getParameter("updateDate");
		String status = request.getParameter("status");
		
		String msg = departmentService.updateStatusandupdateDate(id, date, status);
		
		mv.setViewName("departmenthome");
		mv.addObject("message", msg);
		
		return mv;
	}

	@GetMapping("departprofilepage")
	public ModelAndView departprofilepage() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("departprofilepage");
		return mv;
	}
	
	
	@GetMapping("departmentlogout")
	public ModelAndView departmentlogout(HttpServletRequest request) {
		ModelAndView mv = new ModelAndView();
		
		HttpSession session = request.getSession();
		session.invalidate();
		
		mv.setViewName("home");
		return mv;
	}

}
