/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
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
import java.util.ArrayList;
import model.Question;

/**
 *
 * @author ASUS
 */
public class QuestionDAO {

    Connection con = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    public static void main(String[] args) {
        QuestionDAO dao = new QuestionDAO();
        ArrayList<Question> listQuestion = new ArrayList<>();
        listQuestion =dao.getListQuestion(1);
        for (int i = 0; i < listQuestion.size(); i++) {
            System.out.println("hello");
        }
    }

    public ArrayList<Question> getListQuestion(int quizId) {
        ArrayList<Question> listQuestion = new ArrayList<>();
        String query = "select * from Question where quizId = ?";
        try {
            con = new DBContext().getConnection();
            ps = con.prepareStatement(query);
            ps.setInt(1, quizId);
            rs = ps.executeQuery();
            while (rs.next()) {
                Question question = new Question(rs.getInt(1), rs.getInt(2), rs.getString(3), rs.getString(4), rs.getString(5));
                listQuestion.add(question);
            }
        } catch (Exception e) {

        }
        return listQuestion;
    }
    
    public ArrayList<Question> getAllQuestionsByQuizId(int quizId) {
        ArrayList<Question> list = new ArrayList<>();
        String query = "SELECT questionId, quizId, [content], media, explanation\n"
                + "FROM Question\n"
                + "WHERE quizId = ?";
        try {
            con = new DBContext().getConnection();
            ps = con.prepareStatement(query);
            ps.setInt(1, quizId);
            rs = ps.executeQuery();
            while (rs.next()) {
                Question question = new Question(rs.getInt(1), rs.getInt(2), rs.getString(3), rs.getString(4), rs.getString(5));
                list.add(question);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

}

