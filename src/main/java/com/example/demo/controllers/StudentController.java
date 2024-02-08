package com.example.demo.controllers;

import com.example.demo.entity.HttpResponse;
import com.example.demo.models.Student;
import com.example.demo.repository.StudentRepository;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;


@RestController
public class StudentController {

	@Autowired
	private StudentRepository studentRepository;

	@GetMapping("/api/student")
	public List<Student> getStudents() {
		return studentRepository.findAll();
	}

	@GetMapping("/api/student/{student_id}")
	public HttpResponse getStudent(@PathVariable(value = "student_id") Long student_id) {
		return new HttpResponse(studentRepository.findById(student_id).orElse(new Student()), 200, "Success");
	}

	@PostMapping("/api/student/create")
	public HttpResponse postStudent(@RequestBody Student student) {

		Student newStudent = new Student(student.getName(),student.getAge(),student.getDob(),student.getPhone(),student.getEmail(),student.getProfile(),student.getScore(),student.getStatus());
		
		return new HttpResponse(studentRepository.save(newStudent),200, "Success");
	}

	@PutMapping("/api/student/edit/{student_id}")
	public HttpResponse editStudent(@PathVariable(value = "student_id") long student_id, @RequestBody Student student) {

		Student prevStudent = studentRepository.findById(student_id).orElse(new Student());

		prevStudent.setName(student.getName());
		prevStudent.setAge(student.getAge());
		prevStudent.setDob(student.getDob());
		prevStudent.setEmail(student.getEmail());
		prevStudent.setPhone(student.getPhone());
		prevStudent.setProfile(student.getProfile());
		prevStudent.setScore(student.getScore());
		prevStudent.setStatus(student.getStatus());

		return new HttpResponse(studentRepository.save(prevStudent), 200, "Success");
	}

	@DeleteMapping("/api/student/delete/{student_id}")
	public HttpResponse deleteStudent(@PathVariable(value = "student_id") long student_id) {

		Student student = studentRepository.findById(student_id).orElse(new Student());
		
		studentRepository.deleteById(student_id);

		return new HttpResponse(student, 200, "Success");
	}

}
