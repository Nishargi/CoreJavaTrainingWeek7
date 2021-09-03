package com.neosoft.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import com.neosoft.entity.Student;
import com.neosoft.service.StudentServiceImpl;

@Controller
public class StudentController {

	@Autowired
	private StudentServiceImpl studentServiceImpl;
	
	@GetMapping("/students")
	public String listStudents(Model model) {
		
		model.addAttribute("students",studentServiceImpl.getAllStudents());
		
		return "students";
	}
	
	@GetMapping("/students/new")
	public String createStudentForm(Model model) {
		
		Student student = new Student();
		model.addAttribute("student", student);
		
		return "create_student";
	}
	
	@PostMapping("/students")
	public String saveStudent(@ModelAttribute("student") Student student) {
		
		studentServiceImpl.saveStudent(student);
		
		return "redirect:/students";
	}
	
	@GetMapping("/students/edit/{id}")
	public String editStudentForm(@PathVariable Long id, Model model) {
		
		model.addAttribute("student",studentServiceImpl.getStudentById(id));
		
		return "edit_student";
	}
	
	@PostMapping("/students/{id}")
	public String updateStudent(@PathVariable Long id, 
			@ModelAttribute("student") Student student,	Model model) {
		
		Student existingStudent = studentServiceImpl.getStudentById(id);
		existingStudent.setId(id);
		existingStudent.setFirstName(student.getFirstName());
		existingStudent.setLastName(student.getLastName());
		existingStudent.setEmail(student.getEmail());		
		studentServiceImpl.updateStudent(existingStudent);
		
		return "redirect:/students";
	}
	
	@GetMapping("/students/{id}")
	public String deleteStudent(@PathVariable Long id) {
		
		studentServiceImpl.deleteStudentById(id);
		
		return "redirect:/students";
	}	
}
