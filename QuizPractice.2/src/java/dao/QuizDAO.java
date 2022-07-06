/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
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
import model.*;

/**
 *
 * @author QuizPractice
 */
public class QuizDAO {

    Connection con = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    public Quiz getQuizByQuizId(int quizId) {
        String query = "select * from Quiz where quizId = ?";

        try {
            con = new DBContext().getConnection();
            ps = con.prepareStatement(query);
            ps.setInt(1, quizId);
            rs = ps.executeQuery();
            while (rs.next()) {
                Quiz quiz = new Quiz(quizId, rs.getString(2), rs.getInt(3), rs.getString(4), rs.getInt(5), rs.getInt(6), rs.getInt(7), rs.getInt(8), rs.getString(9), rs.getDate(10));
                return quiz;
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return null;
    }

    public ArrayList<Quiz> getListLastFourQuiz() {
        String query = "select top 4 q.*,u.userName from Quiz as q\n"
                + "left outer join [user] as u on q.ownerId=u.userId\n"
                + "order by quizId desc";
        ArrayList<Quiz> listQuiz = new ArrayList<>();
        try {
            con = new DBContext().getConnection();
            ps = con.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                Quiz quiz = new Quiz(rs.getInt(1), rs.getString(2), rs.getInt(3), rs.getString(4), rs.getInt(5), rs.getInt(6), rs.getInt(7), rs.getInt(8), rs.getString(9), rs.getDate(10), rs.getString(11));
                listQuiz.add(quiz);
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return listQuiz;
    }

    public int getTotalQuiz() {
        String sql = "select count (*) from Quiz";
        try {
            con = new DBContext().getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                return rs.getInt(1);
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return 0;
    }

    public int numberOfPages() {
        int count = getTotalQuiz();
        if (count % 9 != 0) {
            return ((count / 9) + 1);
        } else {
            return count;
        }
    }

    public ArrayList<Quiz> getAllQuiz(int index) {
        String query = "select q.* , u.userName , ql.quizLevelName from Quiz as q\n"
                + "left outer join [User] as u on q.ownerId = u.userId\n"
                + "left outer join [QuizLevel] as ql on  q.quizLevelId = ql.quizLevelId\n"
                + "order by quizId desc\n"
                + "OFFSET ? ROWS FETCH NEXT 9 ROWS ONLY;";
        ArrayList<Quiz> listQuiz = new ArrayList<>();
        try {
            con = new DBContext().getConnection();
            ps = con.prepareStatement(query);
            ps.setInt(1, (index - 1) * 9);
            rs = ps.executeQuery();
            while (rs.next()) {
                Quiz quiz = new Quiz(rs.getInt(1),
                        rs.getString(2),
                        rs.getInt(3),
                        rs.getString(4),
                        rs.getInt(5),
                        rs.getInt(6),
                        rs.getInt(7),
                        rs.getInt(8),
                        rs.getString(9),
                        rs.getDate(10),
                        rs.getString(11),
                        rs.getString(12));
                listQuiz.add(quiz);
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return listQuiz;
    }

    public ArrayList<Quiz> getAllQuizBySubject(String subjectID) {
        String query = "select q.* , u.userName , s.subjectName from Quiz as q\n"
                + "left outer join [User] as u on q.ownerId = u.userId\n"
                + "left outer join Subject as s on  q.subjectId = s.subjectId\n"
                + "where q.subjectId = ?\n"
                + "order by quizId desc";
        ArrayList<Quiz> listQuiz = new ArrayList<>();
        try {
            con = new DBContext().getConnection();
            ps = con.prepareStatement(query);
            ps.setString(1, subjectID);
            rs = ps.executeQuery();
            while (rs.next()) {
                Quiz quiz = new Quiz(rs.getInt(1),
                        rs.getString(2),
                        rs.getInt(3),
                        rs.getString(4),
                        rs.getInt(5),
                        rs.getInt(6),
                        rs.getInt(7),
                        rs.getInt(8),
                        rs.getString(9),
                        rs.getDate(10),
                        rs.getString(11),
                        rs.getString(12));
                listQuiz.add(quiz);
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return listQuiz;
    }

    public ArrayList<Quiz> getAllQuizByLevel(String quizLevelId) {
        String query = "select q.* , u.userName , s.subjectName from Quiz as q\n"
                + "left outer join [User] as u on q.ownerId = u.userId\n"
                + "left outer join [Subject] as s on  q.subjectId = s.subjectId\n"
                + "where q.quizLevelId  = ?\n"
                + "order by quizId desc";
        ArrayList<Quiz> listQuiz = new ArrayList<>();
        try {
            con = new DBContext().getConnection();
            ps = con.prepareStatement(query);
            ps.setString(1, quizLevelId);
            rs = ps.executeQuery();
            while (rs.next()) {
                Quiz quiz = new Quiz(rs.getInt(1),
                        rs.getString(2),
                        rs.getInt(3),
                        rs.getString(4),
                        rs.getInt(5),
                        rs.getInt(6),
                        rs.getInt(7),
                        rs.getInt(8),
                        rs.getString(9),
                        rs.getDate(10),
                        rs.getString(11),
                        rs.getString(12));
                listQuiz.add(quiz);
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return listQuiz;
    }

    public Quiz getQuizByID(String id) {
        String query = "select q.* , u.userName , ql.quizLevelName , s.subjectName from Quiz as q\n"
                + "left outer join [User] as u on q.ownerId = u.userId\n"
                + "left outer join Subject as s on q.subjectId = s.subjectId\n"
                + "left outer join [QuizLevel] as ql on  q.quizLevelId = ql.quizLevelId\n"
                + "where q.quizId = ?";

        try {
            con = new DBContext().getConnection();
            ps = con.prepareStatement(query);
            ps.setString(1, id);
            rs = ps.executeQuery();
            while (rs.next()) {
                return new Quiz(rs.getInt(1),
                        rs.getString(2),
                        rs.getInt(3),
                        rs.getString(4),
                        rs.getInt(5),
                        rs.getInt(6),
                        rs.getInt(7),
                        rs.getInt(8),
                        rs.getString(9),
                        rs.getDate(10),
                        rs.getString(11),
                        rs.getString(12),
                        rs.getString(13));

            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return null;
    }
}

  

        

