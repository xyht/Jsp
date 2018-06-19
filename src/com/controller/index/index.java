package com.controller.index;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

@Controller
public class index extends HttpServlet{
    @RequestMapping("/")
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String[][] str = new String[6][5];
        str = getNew();
        req.setCharacterEncoding("UTF-8");
        req.setAttribute("str",str);
        req.getRequestDispatcher("/link").forward(req, resp);
    }
    @RequestMapping("/link")
    public String indexs() throws Exception  {
        return "index";
    }

    public String[][] getNew(){
        String[][] str = new String[6][5];;
        //����Connection����
        Connection con;
        //����������
        String driver = "com.mysql.jdbc.Driver";
        //URLָ��Ҫ���ʵ����ݿ���mydata
        String url = "jdbc:mysql://localhost:3306/jsp";
        //MySQL����ʱ���û���
        String user = "root";
        //MySQL����ʱ������
        String password = "";
        //������ѯ�����
        try {
            //������������
            Class.forName(driver);
            //1.getConnection()����������MySQL���ݿ⣡��
            con = DriverManager.getConnection(url,user,password);
            if(!con.isClosed())
                System.out.println("Succeeded connecting to the Database!");
            //2.����statement���������ִ��SQL��䣡��
            Statement statement = con.createStatement();
            //Ҫִ�е�SQL���
            String sql = "select * from news order by id desc limit 6";
            //3.ResultSet�࣬������Ż�ȡ�Ľ��������
            ResultSet rs = statement.executeQuery(sql);
            System.out.println("-----------------");
            System.out.println("ִ�н��������ʾ:");
            System.out.println("-----------------");


            String data_day = null;
            String data_hour = null;
            String data_week = null;
            String title = null;
            String data = null;
            int i = 0;
            while(rs.next()){
                data_day = rs.getString("data_day");
                data_hour = rs.getString("data_hour");
                data_week = rs.getString("data_week");
                title = rs.getString("title");
                data = rs.getString("data");
                //������
                str[i][0]=data_day;
                str[i][1]=data_hour;
                str[i][2]=data_week;
                str[i][3]=title;
                str[i][4]=data;
                i++;
            }
            rs.close();
            con.close();
        } catch(ClassNotFoundException e) {
            //���ݿ��������쳣����
            System.out.println("Sorry,can`t find the Driver!");
            e.printStackTrace();
        } catch (Exception e) {
            // TODO: handle exception
            e.printStackTrace();
        }finally{
            System.out.println("���ݿ����ݳɹ���ȡ����");
        }
        return str;
    }
}
