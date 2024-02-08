package com.example.demo.entity;

import com.example.demo.models.Student;

public class HttpResponse {
    
    private Student student;

    private int statusCode;

    private String message;

    public HttpResponse(Student student, int statusCode, String message){
        this.student = student;
        this.statusCode = statusCode;
        this.message = message;
    }

    public HttpResponse(){
        
    }

    public Student getStudent() {
        return student;
    }

    public void setStudent(Student student) {
        this.student = student;
    }

    public int getStatusCode() {
        return statusCode;
    }

    public void setStatusCode(int statusCode) {
        this.statusCode = statusCode;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }
}
