package com.bean;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Connection;
import java.sql.Statement;

public class Data {
    public String name,num;

    public void init() throws Exception{
        Connection conn = null;
        String sql;
        String url = "jdbc:mysql://localhost:3306/javademo?"
                + "user=root&password&useUnicode=true&characterEncoding=UTF8";

        try {

            Class.forName("com.mysql.jdbc.Driver");

            System.out.println("成功加载MySQL驱动程序");

            Statement stmt = conn.createStatement();
            sql = "select * from student WHERE NO='2012001'";
            ResultSet rs = stmt.executeQuery(sql);
            System.out.println("学号\t姓名");
            while (rs.next()) {
                name=(rs.getString(2));
                num=(rs.getString(1));

            }
        } catch (SQLException e) {
            System.out.println("MySQL操作错误");
            e.printStackTrace();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            assert conn != null;
            conn.close();
        }
    }
    public String getName() {
        return name;
    }

    public String getNum() {
        return num;
    }
}
