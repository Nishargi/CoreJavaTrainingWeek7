//47) 

package com.neosoft.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


import com.neosoft.entity.Teacher;
import com.neosoft.repository.TeacherRepository;


@Service
public class TeacherServiceImpl implements TeacherService {

	@Autowired
	private TeacherRepository teacherRepository;	
	
	@Override
	public List<Teacher> getAllTeachers() {
		// TODO Auto-generated method stub
		return teacherRepository.findAll();
	}

	@Override
	public Teacher saveTeacher(Teacher teacher) {
		// TODO Auto-generated method stub
		return teacherRepository.save(teacher);
	}

	@Override
	public Teacher getTeacherById(Long id) {
		// TODO Auto-generated method stub
		return teacherRepository.findById(id).get();
	}

	@Override
	public Teacher updateTeacher(Teacher teacher) {
		// TODO Auto-generated method stub
		return teacherRepository.save(teacher);
	}

	@Override
	public void deleteTeacherById(Long id) {
		// TODO Auto-generated method stub
		teacherRepository.deleteById(id);
	}

	
}
