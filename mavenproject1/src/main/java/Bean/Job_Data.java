/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Bean;

import java.sql.DriverManager;

/**
 *
 * @author C Pravesh
 */

import java.sql.*;
public class Job_Data {
      private String jobId;
    private String jobName;
    private String jobCompany;
    private String jobHr;
    private String jobVacancy;
    private String jobCreateDate;
    private String jobEndDate;
    
    public Job_Data(){
        
    }
    
      public Job_Data(String jobId, String jobName, String jobCompany, String jobHr, String jobVacancy, String jobCreateDate, String jobEndDate) {
        this.jobId = jobId;
        this.jobName = jobName;
        this.jobCompany = jobCompany;
        this.jobHr = jobHr;
        this.jobVacancy = jobVacancy;
        this.jobCreateDate = jobCreateDate;
        this.jobEndDate = jobEndDate;
    }

    // Getter and Setter methods
    public String getJobId() {
        return jobId;
    }

    public void setJobId(String jobId) {
        this.jobId = jobId;
    }

    public String getJobName() {
        return jobName;
    }

    public void setJobName(String jobName) {
        this.jobName = jobName;
    }

    public String getJobCompany() {
        return jobCompany;
    }

    public void setJobCompany(String jobCompany) {
        this.jobCompany = jobCompany;
    }

    public String getJobHr() {
        return jobHr;
    }

    public void setJobHr(String jobHr) {
        this.jobHr = jobHr;
    }

    public String getJobVacancy() {
        return jobVacancy;
    }

    public void setJobVacancy(String jobVacancy) {
        this.jobVacancy = jobVacancy;
    }

    public String getJobCreateDate() {
        return jobCreateDate;
    }

    public void setJobCreateDate(String jobCreateDate) {
        this.jobCreateDate = jobCreateDate;
    }

    public String getJobEndDate() {
        return jobEndDate;
    }

    public void setJobEndDate(String jobEndDate) {
        this.jobEndDate = jobEndDate;
    }
    public int insert(Job_Data obj){
        try{
             Connection con;
            PreparedStatement smt;
             Class.forName("org.apache.derby.jdbc.ClientSriver");
                con = DriverManager.getConnection("jdbc:derby://localhost:1527/Hackthon","root", "root");
                String Query1 = "INSERT INTO JOB_DATA (job_id, job_name, job_company, job_hr, job_vacancy, job_create_date, job_end_date) VALUES (?,?,?,?,?,?,?)";
                smt = con.prepareStatement(Query1);
                smt.setString(1,obj.getJobId());
                smt.setString(2, obj.getJobName());
                smt.setString(3, obj.getJobCompany());
                smt.setString(4, obj.getJobHr());
                smt.setString(5,obj.getJobVacancy());
                smt.setString(6, obj.getJobCreateDate());
                smt.setString(7, obj.getJobEndDate());
                smt.executeUpdate();
                con.close();
                return 1;
                
        }
        catch(Exception ex){
            
            return 0;
        }
    }
    
    
    
    
}
