package dao;

import dto.PersonnelContractDTO;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

/**
 *
 * @author Asus
 */

public class PersonnelContractDAO {

    public ArrayList<PersonnelContractDTO> getAllPersonnelContract(Connection connection, String emp_id) throws SQLException {
        Statement statement = connection.createStatement();
        ResultSet result = statement.executeQuery("SELECT  wf.emp_id, wf.fname,wf.lname, d.name, cr.name, ct.contract_id, ct.contract_name, ct.period, ct.full_day, ct.short_leave, ce.date, ce.basic_salary FROM work_force wf, department d, cardre cr, contract ct, contract_employee ce WHERE (wf.emp_id=ce.emp_id) AND (wf.dept_id=d.dept_id) AND (wf.cardre_id=cr.cardre_id) AND (ct.contract_id=ce.contract_id) AND (ce.emp_id='" + emp_id + "');");

        PersonnelContractDTO con = null;
        if (result.next()) {
            con = new PersonnelContractDTO(result.getString(1), result.getString(2) + " " + result.getString(3), result.getString(4), result.getString(5), result.getString(6), result.getString(7), result.getString(8), result.getString(9), result.getString(10), result.getString(11), result.getString(12), "", "", "");

        }

        ResultSet result2 = statement.executeQuery("SELECT a.name, a.description, a.amount from allowance a where allowance_id IN (SELECT allowance_id from contract_allowance where contract_id=(SELECT contract_id FROM contract_employee WHERE contract_employee.emp_id='" + emp_id + "'))");
        ArrayList<PersonnelContractDTO> list = new ArrayList<>();

        while (result2.next()) {
            PersonnelContractDTO personnelContractDTO = new PersonnelContractDTO();
            personnelContractDTO.setEmpid(con.getEmpid());
            personnelContractDTO.setName(con.getName());
            personnelContractDTO.setCadre(con.getCadre());
            personnelContractDTO.setDept(con.getDept());
            personnelContractDTO.setContractid(con.getContractid());
            personnelContractDTO.setContractname(con.getContractname());
            personnelContractDTO.setPeriod(con.getPeriod());
            personnelContractDTO.setFullday(con.getFullday());
            personnelContractDTO.setShortleave(con.getShortleave());
            personnelContractDTO.setDate(con.getDate());
            personnelContractDTO.setBasicsalary(con.getBasicsalary());
            personnelContractDTO.setAllowancename(result2.getString(1));
            personnelContractDTO.setAllowancedes(result2.getString(2));
            personnelContractDTO.setAmount(result2.getString(3));
            list.add(personnelContractDTO);

        }
        return list;

    }

    public ArrayList<PersonnelContractDTO> getAllSalaryDetails(Connection connection, String emp_id) throws SQLException {
        Statement statement = connection.createStatement();
        ResultSet result = statement.executeQuery("SELECT wf.emp_id, wf.fname, wf.lname, ce.basic_salary FROM work_force wf, contract_employee ce where (wf.emp_id=ce.emp_id) AND (ce.emp_id='" + emp_id + "');");
        PersonnelContractDTO a = new PersonnelContractDTO();
        if (result.next()) {
            a.setEmpid(result.getString(1));
            a.setName(result.getString(2)+" "+result.getString(3));
            a.setBasicsalary(result.getString(4));            
        }
        
        ArrayList<PersonnelContractDTO> list= new ArrayList<>();
        ResultSet result1 = statement.executeQuery("SELECT name, description, amount FROM allowance WHERE allowance_id IN (SELECT allowance_id FROM contract_allowance WHERE contract_id=(SELECT contract_id FROM contract_employee WHERE emp_id='" + emp_id + "'));");
        
        while(result1.next()){
            PersonnelContractDTO pContractDTO = new PersonnelContractDTO();
                pContractDTO.setEmpid(a.getEmpid());
                pContractDTO.setName(a.getName());
                pContractDTO.setBasicsalary(a.getBasicsalary());
                pContractDTO.setAllowancename(a.getAllowancename());
                pContractDTO.setAllowancedes(a.getAllowancedes());
                pContractDTO.setAmount(a.getAmount());
                list.add(pContractDTO);
            System.out.println("89");
        }
        return list;
    }
}