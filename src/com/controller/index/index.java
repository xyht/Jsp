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
        //声明Connection对象
        Connection con;
        //驱动程序名
        String driver = "com.mysql.jdbc.Driver";
        //URL指向要访问的数据库名mydata
        String url = "jdbc:mysql://localhost:3306/jsp";
        //MySQL配置时的用户名
        String user = "root";
        //MySQL配置时的密码
        String password = "";
        //遍历查询结果集
        try {
            //加载驱动程序
            Class.forName(driver);
            //1.getConnection()方法，连接MySQL数据库！！
            con = DriverManager.getConnection(url,user,password);
            if(!con.isClosed())
                System.out.println("Succeeded connecting to the Database!");
            //2.创建statement类对象，用来执行SQL语句！！
            Statement statement = con.createStatement();
            //要执行的SQL语句
            String sql = "select * from news order by id desc limit 6";
            //3.ResultSet类，用来存放获取的结果集！！
            ResultSet rs = statement.executeQuery(sql);
            System.out.println("-----------------");
            System.out.println("执行结果如下所示:");
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
                //输出结果
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
            //数据库驱动类异常处理
            System.out.println("Sorry,can`t find the Driver!");
            e.printStackTrace();
        } catch (Exception e) {
            // TODO: handle exception
            e.printStackTrace();
        }finally{
            System.out.println("数据库数据成功获取！！");
        }
        return str;
    }
}
