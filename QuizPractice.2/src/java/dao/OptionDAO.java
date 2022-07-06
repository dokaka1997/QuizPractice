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
import model.*;

/**
 *
 * @author ASUS
 */
public class OptionDAO {

    Connection con = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    public ArrayList<Option> getListOption(int quizId) {
        ArrayList<Option> listOption = new ArrayList<>();
        String query = "select o.*  from [Option] as o\n"
                + "left outer join Question as q\n"
                + "on q.questionId=o.questionId\n"
                + "where q.quizId = ?";
        try {
            con = new DBContext().getConnection();
            ps = con.prepareStatement(query);
            ps.setInt(1, quizId);
            rs = ps.executeQuery();
            while (rs.next()) {
                Option option = new Option(rs.getInt(1), rs.getInt(2), rs.getString(3), rs.getBoolean(4));
                listOption.add(option);
            }
        } catch (Exception e) {

        }
        return listOption;
    }

    public Option getOptionById(String string) {
        int quizId = Integer.parseInt(string);
        Option option = new Option();
        String query = "select *  from [Option]  where optionId = ?";
        try {
            con = new DBContext().getConnection();
            ps = con.prepareStatement(query);
            ps.setInt(1, quizId);
            rs = ps.executeQuery();
            while (rs.next()) {
                option = new Option(rs.getInt(1), rs.getInt(2), rs.getString(3), rs.getBoolean(4));
            }
        } catch (Exception e) {

        }
        return option;

    }
    
    public ArrayList<Option> getAllOptionsByQuestionId(int questionId) {
        ArrayList<Option> list = new ArrayList<>();
        String query = "SELECT optionId, questionId, content, isCorrect\n"
                + "FROM [Option]\n"
                + "WHERE questionId = ?";
        try {
            con = new DBContext().getConnection();
            ps = con.prepareStatement(query);
            ps.setInt(1, questionId);
            rs = ps.executeQuery();
            while (rs.next()) {
                Option option = new Option(rs.getInt(1), rs.getInt(2), rs.getString(3), rs.getBoolean(4));
                list.add(option);
            }
        } catch (Exception e) {
            e.printStackTrace();;
        }
        return list;
    }

}
