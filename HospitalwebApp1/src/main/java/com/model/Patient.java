package com.model;

public class Patient {

    private int patientID;
    private String patientName;
    private String dob;
    private String gender;
    private double weight;
    private String admissionDate;
    private String ailment;
    private String assignedDoctor;

    // Constructor WITHOUT ID
    public Patient(String patientName,
                   String dob,
                   String gender,
                   double weight,
                   String admissionDate,
                   String ailment,
                   String assignedDoctor) {

        this.patientName = patientName;
        this.dob = dob;
        this.gender = gender;
        this.weight = weight;
        this.admissionDate = admissionDate;
        this.ailment = ailment;
        this.assignedDoctor = assignedDoctor;
    }

    // Constructor WITH ID
    public Patient(int patientID,
                   String patientName,
                   String dob,
                   String gender,
                   double weight,
                   String admissionDate,
                   String ailment,
                   String assignedDoctor) {

        this.patientID = patientID;
        this.patientName = patientName;
        this.dob = dob;
        this.gender = gender;
        this.weight = weight;
        this.admissionDate = admissionDate;
        this.ailment = ailment;
        this.assignedDoctor = assignedDoctor;
    }

    // Getters

    public int getPatientID() {
        return patientID;
    }

    public String getPatientName() {
        return patientName;
    }

    public String getDob() {
        return dob;
    }

    public String getGender() {
        return gender;
    }

    public double getWeight() {
        return weight;
    }

    public String getAdmissionDate() {
        return admissionDate;
    }

    public String getAilment() {
        return ailment;
    }

    public String getAssignedDoctor() {
        return assignedDoctor;
    }
}