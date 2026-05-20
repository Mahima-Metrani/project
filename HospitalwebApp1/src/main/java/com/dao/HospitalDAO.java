package com.dao;

import java.sql.*;
import java.sql.Date;
import java.util.*;

import com.model.Patient;

public class HospitalDAO {

    private String url = "jdbc:mysql://localhost:3306/hospitaldb";
    private String user = "root";
    private String pass = "root123";

    // DATABASE CONNECTION
    public Connection getConnection() throws Exception {

        Class.forName("com.mysql.cj.jdbc.Driver");

        return DriverManager.getConnection(url, user, pass);
    }

    // ADD PATIENT
    public boolean addPatient(Patient p) {

        String sql = "INSERT INTO Patients "
                + "(PatientName, Gender, AdmissionDate, "
                + "Ailment, AssignedDoctor, Weight, DOB) "
                + "VALUES (?, ?, CURDATE(), ?, ?, ?, ?)";

        try {

            Connection con = getConnection();

            PreparedStatement ps = con.prepareStatement(sql);

            ps.setString(1, p.getPatientName());
            ps.setString(2, p.getGender());
            ps.setString(3, p.getAilment());
            ps.setString(4, p.getAssignedDoctor());
            ps.setDouble(5, p.getWeight());
            ps.setDate(6, java.sql.Date.valueOf(p.getDob()));

            int rows = ps.executeUpdate();

            con.close();

            return rows > 0;

        } catch (Exception e) {

            e.printStackTrace();
        }

        return false;
    }

    // UPDATE PATIENT
    public boolean updatePatient(Patient p) {

        String sql = "UPDATE Patients SET "
                + "PatientName=?, "
                + "Gender=?, "
                + "Ailment=?, "
                + "AssignedDoctor=?, "
                + "Weight=?, "
                + "DOB=? "
                + "WHERE PatientID=?";

        try {

            Connection con = getConnection();

            PreparedStatement ps = con.prepareStatement(sql);

            ps.setString(1, p.getPatientName());
            ps.setString(2, p.getGender());
            ps.setString(3, p.getAilment());
            ps.setString(4, p.getAssignedDoctor());
            ps.setDouble(5, p.getWeight());
            ps.setDate(6, Date.valueOf(p.getDob()));
            ps.setInt(7, p.getPatientID());

            int rows = ps.executeUpdate();

            con.close();

            return rows > 0;

        } catch (Exception e) {

            e.printStackTrace();
        }

        return false;
    }

    // DELETE PATIENT
    public boolean deletePatient(int id) {

        String sql = "DELETE FROM Patients WHERE PatientID=?";

        try {

            Connection con = getConnection();

            PreparedStatement ps = con.prepareStatement(sql);

            ps.setInt(1, id);

            int rows = ps.executeUpdate();

            con.close();

            return rows > 0;

        } catch (Exception e) {

            e.printStackTrace();
        }

        return false;
    }

    // DISPLAY ALL PATIENTS
    public List<Patient> getAllPatients() {

        List<Patient> list = new ArrayList<>();

        String sql = "SELECT * FROM Patients";

        try {

            Connection con = getConnection();

            Statement st = con.createStatement();

            ResultSet rs = st.executeQuery(sql);

            while (rs.next()) {

            	Patient p = new Patient(

            		    rs.getInt("PatientID"),

            		    rs.getString("PatientName"),

            		    rs.getDate("DOB").toString(),

            		    rs.getString("Gender"),

            		    rs.getDouble("Weight"),

            		    rs.getDate("AdmissionDate").toString(),

            		    rs.getString("Ailment"),

            		    rs.getString("AssignedDoctor")

            		);

                list.add(p);
            }

            con.close();

        } catch (Exception e) {

            e.printStackTrace();
        }

        return list;
    }
    public Patient getPatientById(int id){

        Patient p = null;

        String sql =
            "SELECT * FROM Patients WHERE PatientID=?";

        try{

            Connection con = getConnection();

            PreparedStatement ps =
                con.prepareStatement(sql);

            ps.setInt(1, id);

            ResultSet rs = ps.executeQuery();

            if(rs.next()){

                p = new Patient(

                    rs.getInt("PatientID"),

                    rs.getString("PatientName"),

                    rs.getDate("DOB").toString(),

                    rs.getString("Gender"),

                    rs.getDouble("Weight"),

                    rs.getDate("AdmissionDate").toString(),

                    rs.getString("Ailment"),

                    rs.getString("AssignedDoctor")

                );
            }

            con.close();

        }catch(Exception e){

            e.printStackTrace();
        }

        return p;
    }

    // REPORT BY DOCTOR
    public List<Patient> getByDoctor(String doctor) {

        List<Patient> list = new ArrayList<>();

        String sql = "SELECT * FROM Patients WHERE AssignedDoctor=?";

        try {

            Connection con = getConnection();

            PreparedStatement ps = con.prepareStatement(sql);

            ps.setString(1, doctor);

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {

            	Patient p = new Patient(

            		    rs.getInt("PatientID"),

            		    rs.getString("PatientName"),

            		    rs.getDate("DOB").toString(),

            		    rs.getString("Gender"),

            		    rs.getDouble("Weight"),

            		    rs.getDate("AdmissionDate").toString(),

            		    rs.getString("Ailment"),

            		    rs.getString("AssignedDoctor")

            		);
                list.add(p);
            }

            con.close();

        } catch (Exception e) {

            e.printStackTrace();
        }

        return list;
    }

    // REPORT BY AILMENT
    public List<Patient> getByAilment(String ailment) {

        List<Patient> list = new ArrayList<>();

        String sql = "SELECT * FROM Patients WHERE Ailment=?";

        try {

            Connection con = getConnection();

            PreparedStatement ps = con.prepareStatement(sql);

            ps.setString(1, ailment);

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {

            	Patient p = new Patient(

            		    rs.getInt("PatientID"),

            		    rs.getString("PatientName"),

            		    rs.getDate("DOB").toString(),

            		    rs.getString("Gender"),

            		    rs.getDouble("Weight"),

            		    rs.getDate("AdmissionDate").toString(),

            		    rs.getString("Ailment"),

            		    rs.getString("AssignedDoctor")

            		);

                list.add(p);
            }

            con.close();

        } catch (Exception e) {

            e.printStackTrace();
        }

        return list;
    }

    // REPORT BY DATE RANGE
    public List<Patient> getByDateRange(String from, String to) {

        List<Patient> list = new ArrayList<>();

        String sql = "SELECT * FROM Patients "
                + "WHERE AdmissionDate BETWEEN ? AND ?";

        try {

            Connection con = getConnection();

            PreparedStatement ps = con.prepareStatement(sql);

            ps.setDate(1, Date.valueOf(from));
            ps.setDate(2, Date.valueOf(to));

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {

            	Patient p = new Patient(

            		    rs.getInt("PatientID"),

            		    rs.getString("PatientName"),

            		    rs.getDate("DOB").toString(),

            		    rs.getString("Gender"),

            		    rs.getDouble("Weight"),

            		    rs.getDate("AdmissionDate").toString(),

            		    rs.getString("Ailment"),

            		    rs.getString("AssignedDoctor")

            		);
                list.add(p);
            }

            con.close();

        } catch (Exception e) {

            e.printStackTrace();
        }

        return list;
    }

    // AUTO INCREMENT ID
    public int getNextPatientId() {

        int id = 1;

        try {
            Connection con = getConnection();

            Statement st = con.createStatement();

            ResultSet rs = st.executeQuery(
                "SELECT IFNULL(MAX(PatientID),0) + 1 FROM Patients"
            );

            if (rs.next()) {
                id = rs.getInt(1);
            }

            con.close();

        } catch (Exception e) {
            e.printStackTrace();
        }

        return id;
    }
}