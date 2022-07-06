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
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import model.QuizResult;

/**
 *
 * @author ASUS
 */
public class QuizResultDAO {
     Connection con = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    public static void main(String[] args) {
        QuizResultDAO dao = new QuizResultDAO();
        System.out.println(dao.getQuizResultById(1));
    }
    
    public void setQuizResult(QuizResult quizResult) {
        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String day = formatter.format(quizResult.getSubmitAt());
        String query = "INSERT INTO [dbo].[QuizResult]\n"
                + "           ([userId]\n"
                + "           ,[quizId]\n"
                + "           ,[score]\n"
                + "           ,[time]\n"
                + "           ,[submitAt])\n"
                + "     VALUES\n"
                + "           (?,?,?,?,?)";

        try {
            con = new DBContext().getConnection();
            ps = con.prepareStatement(query);

            ps.setInt(1, quizResult.getUserId());
            ps.setInt(2, quizResult.getQuizId());
            ps.setFloat(3, (float) quizResult.getScore());
            ps.setInt(4, quizResult.getTime());
            ps.setString(5, day);
            ps.execute();
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
    }

    public QuizResult getQuizResultByUserIdAndSubmitAt(QuizResult quizResult) {
        String query = "select top(1) quizResultId, userId from QuizResult where submitAt = ? and userId = ? order by quizResultId desc";
        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String day = formatter.format(quizResult.getSubmitAt());
        try {
            con = new DBContext().getConnection();
            ps = con.prepareStatement(query);

            ps.setString(1, day);
            ps.setInt(2, quizResult.getUserId());

            rs = ps.executeQuery();
            while (rs.next()) {
                QuizResult newQuizResult = new QuizResult( rs.getInt(1),rs.getInt(2));
                return newQuizResult;
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return null;
    }
    
    public QuizResult getQuizResultById(int quizResultId) {
        String query = "SELECT quizResultId, userId, quizId, score, [time], submitAt\n"
                + "FROM QuizResult\n"
                + "WHERE quizResultId = ?";
        try {
            con = new DBContext().getConnection();
            ps = con.prepareStatement(query);
            ps.setInt(1, quizResultId);
            rs = ps.executeQuery();
            while (rs.next()) {
                QuizResult quizResult = new QuizResult(rs.getInt(1), rs.getInt(2), rs.getInt(3), rs.getInt(4), rs.getInt(5), rs.getTimestamp(6));
                return quizResult;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

}
