/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import context.DBContext;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import model.User;

/**
 *
 * @author ASUS
 */
public class UserDAO {

    Connection con = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    public static void main(String[] args) {
        UserDAO dao = new UserDAO();
        System.out.println(dao.getUserByEmail("Admin@gmail.com"));
    }

    public User getUserByName(String username) {
        String query = "SELECT [userId],[userName],[email],[password],[avatar],"
                + "[gender],[dob],[roleId],[status],[code] FROM [USER] WHERE USERNAME = ?";
        try {
            con = new DBContext().getConnection();
            ps = con.prepareStatement(query);
            ps.setString(1, username);
            rs = ps.executeQuery();
            while (rs.next()) {
                return new User(rs.getInt(1), rs.getString(2), rs.getString(3),
                        rs.getString(4), rs.getString(5), rs.getBoolean(6),
                        rs.getDate(7), rs.getInt(8),
                        rs.getBoolean(9),rs.getString(10));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    public User getUserByEmail(String email) {
        String query = "SELECT [userId],[userName],[email],[password],[avatar],"
                + "[gender],[dob],[roleId],[status],[code] FROM [USER] WHERE EMAIL = ?";
        try {
            con = new DBContext().getConnection();
            ps = con.prepareStatement(query);
            ps.setString(1, email);
            rs = ps.executeQuery();
            while (rs.next()) {
                return new User(rs.getInt(1), rs.getString(2), rs.getString(3),
                        rs.getString(4), rs.getString(5), rs.getBoolean(6),
                        rs.getDate(7), rs.getInt(8),
                        rs.getBoolean(9),rs.getString(10));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }
    
    public User getUserByPassword(String password) {
        String query = "SELECT [userId],[userName],[email],[password],[avatar],"
                + "[gender],[dob],[roleId],[status],[code] FROM [USER] WHERE PASSWORD = ?";
        try {
            con = new DBContext().getConnection();
            ps = con.prepareStatement(query);
            ps.setString(1, password);
            rs = ps.executeQuery();
            while (rs.next()) {
                return new User(rs.getInt(1), rs.getString(2), rs.getString(3),
                        rs.getString(4), rs.getString(5), rs.getBoolean(6),
                        rs.getDate(7), rs.getInt(8),
                        rs.getBoolean(9), rs.getString(10));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    public void registerAccount(String username, String email, String password, boolean gender, Date dob) {
        String query = "INSERT INTO [USER]([userName],[email],[password],[avatar],[gender],[dob],[roleId],[status],[code])"
                + " VALUES(?,?,?,NULL,?,?,3,0,NULL)";
        try {
            con = new DBContext().getConnection();
            ps = con.prepareStatement(query);
            ps.setString(1, username);
            ps.setString(2, email);
            ps.setString(3, password);
            ps.setBoolean(4, gender);
            ps.setDate(5, dob);
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void updateUserStatus(boolean status, String email) {
        String query = "UPDATE [USER] SET [STATUS] = ? WHERE EMAIL = ?";
        try {
            con = new DBContext().getConnection();
            ps = con.prepareStatement(query);
            ps.setBoolean(1, status);
            ps.setString(2, email);
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void changePassword(User user) throws Exception {

        try {
            String query = " update  [QuizPracticeSystem].[dbo].[User] set password = ? where email = ?";
            con = new DBContext().getConnection();
            ps = con.prepareStatement(query);
            ps.setString(1, user.getPassword());
            ps.setString(2, user.getEmail());
            ps.executeUpdate();
        } catch (ClassNotFoundException | NumberFormatException | SQLException e) {
            e.printStackTrace();
        }
    }
    
    public User verifyCode(String email,boolean status, String code) {
        String query = "SELECT [userId],[userName],[email],[password],[avatar],"
                + "[gender],[dob],[roleId],[status],[code] FROM [USER] WHERE EMAIL = ? and STATUS = ? and CODE = ?";
        try {
            con = new DBContext().getConnection();
            ps = con.prepareStatement(query);
            ps.setString(1, email);
            ps.setBoolean(2, status);
            ps.setString(3, code);
            rs = ps.executeQuery();
            while (rs.next()) {
                return new User(rs.getInt(1), rs.getString(2), rs.getString(3),
                        rs.getString(4), rs.getString(5), rs.getBoolean(6),
                        rs.getDate(7), rs.getInt(8),
                        rs.getBoolean(9), rs.getString(10));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return null;
    }

    public void updateCode(String code,String email) {
        String query = "UPDATE [USER] SET [CODE] = ? WHERE EMAIL = ?";
        try {
            con = new DBContext().getConnection();
            ps = con.prepareStatement(query);
            ps.setString(1, code);
            ps.setString(2, email);
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    
    public void getPassword(String newPassword, String email) {
        String query = "update [USER] set [password] = ? where email = ?";
        try {
            con = new DBContext().getConnection();//mo ket noi voi sql
            ps = con.prepareStatement(query);
            ps.setString(1, newPassword);
            ps.setString(2, email);
            ps.executeUpdate();
        } catch (Exception e) {
            System.err.println(e.getMessage());
        }
    }

    public boolean checkEmail(String email) throws Exception {
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            String query = "select * from  [QuizPracticeSystem].[dbo].[User] where email  = ?";
            con = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, email);
            rs = ps.executeQuery();
            if (rs.next()) {
                return true;
            }
        } catch (ClassNotFoundException | NumberFormatException | SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    
}
