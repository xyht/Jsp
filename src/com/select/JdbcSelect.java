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
        // MySQL��JDBC URL��д��ʽ��jdbc:mysql://�������ƣ����Ӷ˿�/���ݿ������?����=ֵ
        // ������������Ҫָ��useUnicode��characterEncoding
        // ִ�����ݿ����֮ǰҪ�����ݿ����ϵͳ�ϴ���һ�����ݿ⣬�����Լ�����
        // �������֮ǰ��Ҫ�ȴ���javademo���ݿ�
        String url = "jdbc:mysql://localhost:3306/Jsp?"
                + "user=root&password=&useUnicode=true&characterEncoding=UTF8";

        // ֮����Ҫʹ������������䣬����ΪҪʹ��MySQL����������������Ҫ��������������
// ����ͨ��Class.forName�������ؽ�ȥ��Ҳ����ͨ����ʼ������������������������ʽ������
        Class.forName("com.mysql.jdbc.Driver");// ��̬����mysql����
// or:
// com.mysql.jdbc.Driver driver = new com.mysql.jdbc.Driver();
// or��
// new com.mysql.jdbc.Driver();

        System.out.println("�ɹ�����MySQL��������");
        // һ��Connection����һ�����ݿ�����
        try (java.sql.Connection conn = DriverManager.getConnection(url)) {// Statement������кܶ෽��������executeUpdate����ʵ�ֲ��룬���º�ɾ����
            Statement stmt = conn.createStatement();
          /*
          sql = "insert into student(NO,name) values('2012001','��ΰ��')";
          stmt.executeUpdate(sql);
          sql = "insert into student(NO,name) values('2012002','��С��')";
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
            System.out.println("MySQL��������");
            e.printStackTrace();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
