package com.select;

import com.mysql.jdbc.Connection;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;


public class JdbcSelect extends HttpServlet {
    String id=null;

    @Override
    public void init(ServletConfig config) throws ServletException {
        super.init(config);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Boolean flag = true ;
        String name = null;
        String password = null;
        String email = null;
        name = req.getParameter("name");
        password = req.getParameter("password");
        email = req.getParameter("email");


        try {
            Connect(name,email,password);
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }


        System.out.println(name+password+email);
        req.setAttribute("name",name);
        req.setAttribute("flag",flag);
        req.setAttribute("id",id);
        RequestDispatcher dispatcher = req.getRequestDispatcher("");
        dispatcher.forward(req,resp);
    }

    private void Connect(String names, String email, String pass) throws SQLException, ClassNotFoundException {
        String sql;
        ResultSet rs=null;
        // MySQL的JDBC URL编写方式：jdbc:mysql://主机名称：连接端口/数据库的名称?参数=值
        // 避免中文乱码要指定useUnicode和characterEncoding
        // 执行数据库操作之前要在数据库管理系统上创建一个数据库，名字自己定，
        // 下面语句之前就要先创建javademo数据库
        String url = "jdbc:mysql://localhost:3306/Jsp?"
                + "user=root&password=&useUnicode=true&characterEncoding=UTF8";

        // 之所以要使用下面这条语句，是因为要使用MySQL的驱动，所以我们要把它驱动起来，
// 可以通过Class.forName把它加载进去，也可以通过初始化来驱动起来，下面三种形式都可以
        Class.forName("com.mysql.jdbc.Driver");// 动态加载mysql驱动
// or:
// com.mysql.jdbc.Driver driver = new com.mysql.jdbc.Driver();
// or：
// new com.mysql.jdbc.Driver();

        System.out.println("成功加载MySQL驱动程序");
        // 一个Connection代表一个数据库连接
        try (java.sql.Connection conn = DriverManager.getConnection(url)) {// Statement里面带有很多方法，比如executeUpdate可以实现插入，更新和删除等
            Statement stmt = conn.createStatement();
          /*
          sql = "insert into student(NO,name) values('2012001','陶伟基')";
          stmt.executeUpdate(sql);
          sql = "insert into student(NO,name) values('2012002','周小俊')";
          stmt.executeUpdate(sql);
          */
            sql = "insert into user(name,pass,email) values('"+names+"','"+pass+"','"+email+"')";
            int result = stmt.executeUpdate(sql);
            sql="select last_insert_id() as id ";
            ResultSet re = stmt.executeQuery(sql);
            re.next();
            id=re.getString(1);
            System.out.println(id);

        } catch (SQLException e) {
            System.out.println("MySQL操作错误");
            e.printStackTrace();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
