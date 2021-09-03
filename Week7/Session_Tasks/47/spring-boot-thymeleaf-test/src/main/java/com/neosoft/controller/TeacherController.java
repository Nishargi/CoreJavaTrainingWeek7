//47) 

package com.neosoft.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import com.neosoft.entity.Teacher;

import com.neosoft.service.TeacherServiceImpl;

@Controller
public class TeacherController {

	@Autowired
	private TeacherServiceImpl teacherServiceImpl;
	
	@GetMapping("/teachers")
	public String listTeachers(Model model) {
		
		model.addAttribute("teachers",teacherServiceImpl.getAllTeachers());
		
		return "teachers";
	}
	
	@GetMapping("/teachers/new")
	public String createTeacherForm(Model model) {
		
		Teacher teacher = new Teacher();
		model.addAttribute("teacher", teacher);
		
		return "create_teacher";
	}
	
	@PostMapping("/teachers")
	public String saveTeacher(@ModelAttribute("teacher") Teacher teacher) {
		
		teacherServiceImpl.saveTeacher(teacher);
		
		return "redirect:/teachers";
	}
	
	@GetMapping("/teachers/edit/{id}")
	public String editTeacherForm(@PathVariable Long id, Model model) {
		
		model.addAttribute("teacher",teacherServiceImpl.getTeacherById(id));
		
		return "edit_teacher";
	}
	
	@PostMapping("/teachers/{id}")
	public String updateTeacher(@PathVariable Long id, 
			@ModelAttribute("teacher") Teacher teacher,	Model model) {
		
		Teacher existingTeacher = teacherServiceImpl.getTeacherById(id);
		existingTeacher.setId(id);
		existingTeacher.setFirstName(teacher.getFirstName());
		existingTeacher.setLastName(teacher.getLastName());
		existingTeacher.setMobileNumber(teacher.getMobileNumber());
		existingTeacher.setEmailId(teacher.getEmailId());
		existingTeacher.setCityName(teacher.getCityName());
		existingTeacher.setStateName(teacher.getStateName());
		existingTeacher.setPinCode(teacher.getPinCode());
		
		teacherServiceImpl.updateTeacher(existingTeacher);
		
		return "redirect:/teachers";
	}
	
	@GetMapping("/teachers/{id}")
	public String deleteTeacher(@PathVariable Long id) {
		
		teacherServiceImpl.deleteTeacherById(id);
		
		return "redirect:/teachers";
	}	
}
