/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import context.DBContext;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import model.StudentWork;

/**
 *
 * @author ASUS
 */
public class StudentWorkDAO {

    Connection con = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    public void setStudentWork(StudentWork studentWork) {

        if (studentWork.getOptionId() != 0) {
            String query = "INSERT INTO [dbo].[StudentWork]\n"
                    + "           ([userId]\n"
                    + "           ,[quizResultId]\n"
                    + "           ,[questionId]\n"
                    + "           ,[optionId])\n"
                    + "     VALUES (?,?,?,?)";

            try {
                con = new DBContext().getConnection();
                ps = con.prepareStatement(query);

                ps.setInt(1, studentWork.getUserId());
                ps.setInt(2, studentWork.getQuizResultId());
                ps.setInt(3, studentWork.getQuestionId());
                ps.setInt(4, studentWork.getOptionId());

                ps.execute();
            } catch (Exception e) {
                System.out.println(e.getMessage());
            }
        } else {
            String query = "INSERT INTO [dbo].[StudentWork]\n"
                    + "           ([userId]\n"
                    + "           ,[quizResultId]\n"
                    + "           ,[questionId]\n)"
                    + "     VALUES (?,?,?)";

            try {
                con = new DBContext().getConnection();
                ps = con.prepareStatement(query);

                ps.setInt(1, studentWork.getUserId());
                ps.setInt(2, studentWork.getQuizResultId());
                ps.setInt(3, studentWork.getQuestionId());

                ps.execute();
            } catch (Exception e) {
                System.out.println(e.getMessage());
            }
        }

    }

    public StudentWork getOptionSelected(int questionId, int quizResultId) {
        String query = "SELECT studentWorkId, userId, quizResultId, questionId, optionId\n"
                + "FROM StudentWork\n"
                + "WHERE questionId = ? AND quizResultId = ?";
        try {
            con = new DBContext().getConnection();
            ps = con.prepareStatement(query);
            ps.setInt(1, questionId);
            ps.setInt(2, quizResultId);
            rs = ps.executeQuery();
            while (rs.next()) {
                StudentWork sw = new StudentWork(rs.getInt(1), rs.getInt(2), rs.getInt(3), rs.getInt(4), rs.getInt(5));
                return sw;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }
}
