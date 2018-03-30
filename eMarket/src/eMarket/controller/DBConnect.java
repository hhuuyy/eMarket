/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package eMarket.controller;

import java.sql.Connection;
import java.sql.DriverManager;

/**
 *
 * @author Huy
 */
public class DBConnect {
    public static Connection getConnection(){
        Connection conn = null;
        try{
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            conn = DriverManager.getConnection("jdbc:sqlserver://localhost;databaseName=eMarket;user=sa;password=123456Huy");
        }
        catch(Exception e){
            e.printStackTrace();
        }
        return conn;
    }
    
    public static void main(String[] args) {
        System.out.println(DBConnect.getConnection());
    }
}
