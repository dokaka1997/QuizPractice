/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import context.DBContext;
import model.Subject;
import java.sql.*;
import java.util.ArrayList;

/**
 *
 * @author PC
 */
public class SubjectDAO {

    Connection con = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    public ArrayList<Subject> getAllSubjcet() {
        ArrayList<Subject> listSubject = new ArrayList<>();
        String query = "select * from Subject";
        try {
            con = new DBContext().getConnection();
            ps = con.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                Subject subject = new Subject(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4));
                listSubject.add(subject);
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return listSubject;
    }

    public ArrayList<Subject> getAllSubjcet(int pageIndex, int pageSize) {
        ArrayList<Subject> listSubject = new ArrayList<>();
        String query = "  SELECT * FROM(SELECT ROW_NUMBER() OVER \n"
                + "                    (ORDER BY subjectId DESC) AS rn, * FROM Subject)\n"
                + "                    AS x WHERE rn BETWEEN ? AND ?";
        try {
            int firstRecord = (pageIndex - 1) * pageSize + 1;
            int lastRecord = pageIndex * pageSize;
            con = new DBContext().getConnection();
            ps = con.prepareStatement(query);
            ps.setInt(1, firstRecord);
            ps.setInt(2, lastRecord);
            rs = ps.executeQuery();
            while (rs.next()) {
                Subject subject = new Subject(rs.getInt("subjectId"),
                        rs.getString("subjectName"),
                        rs.getString("description"),
                        rs.getString("image"));
                listSubject.add(subject);
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return listSubject;
    }

    public int getTotalSubject() {
        Connection conn = null;
        int restaurantCount = 0;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            String query = "SELECT COUNT(*) FROM Subject";
            con = new DBContext().getConnection();
            ps = con.prepareStatement(query);

            rs = ps.executeQuery();
            while (rs.next()) {
                restaurantCount = rs.getInt(1);
                break;
            }
        } catch (Exception ex) {
            System.out.println(ex.getMessage());
        }
        return restaurantCount;
    }

    public Subject getSubjectById(int id) {
        String query = "  SELECT * FROM Subject where subjectId = ?";
        try {
            con = new DBContext().getConnection();
            ps = con.prepareStatement(query);
            ps.setInt(1, id);
            rs = ps.executeQuery();
            while (rs.next()) {
                Subject subject = new Subject(rs.getInt("subjectId"),
                        rs.getString("subjectName"),
                        rs.getString("description"),
                        rs.getString("image"));
                return subject;
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return null;
    }

}
