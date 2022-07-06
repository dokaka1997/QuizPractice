/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.sql.Date;
import java.sql.Timestamp;

/**
 *
 * @author ASUS
 */
public class QuizResult {
    
    private int quizResultId;
    private int userId;
    private int quizId;
    private double score;
    private int time;
    private Timestamp submitAt;

    public QuizResult() {
    }

    public QuizResult(int quizResultId, int userId) {
        this.quizResultId = quizResultId;
        this.userId = userId;
    }

    public QuizResult(int userId, int quizId, double score, int time, Timestamp submitAt) {
        this.userId = userId;
        this.quizId = quizId;
        this.score = score;
        this.time = time;
        this.submitAt = submitAt;
    }
    
    

    public QuizResult(int quizResultId, int userId, int quizId, double score, int time, Timestamp submitAt) {
        this.quizResultId = quizResultId;
        this.userId = userId;
        this.quizId = quizId;
        this.score = score;
        this.time = time;
        this.submitAt = submitAt;
    }

    public int getQuizResultId() {
        return quizResultId;
    }

    public void setQuizResultId(int quizResultId) {
        this.quizResultId = quizResultId;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public int getQuizId() {
        return quizId;
    }

    public void setQuizId(int quizId) {
        this.quizId = quizId;
    }

    public double getScore() {
        return score;
    }

    public void setScore(int score) {
        this.score = score;
    }

    public int getTime() {
        return time;
    }

    public void setTime(int time) {
        this.time = time;
    }

    public Timestamp getSubmitAt() {
        return submitAt;
    }

    public void setSubmitAt(Timestamp submitAt) {
        this.submitAt = submitAt;
    }
    
}
