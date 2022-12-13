/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

import java.io.IOException;
import java.io.OutputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author macbookpro
 */
public class ViewImage extends HttpServlet {

   protected void processRequest(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {
      response.setContentType("image/jpeg");

      int id = Integer.parseInt(request.getParameter("id"));

      try {
         Class.forName("com.mysql.jdbc.Driver");
         String URL = "jdbc:mysql://127.0.0.1/LaptopHub";

         Connection conn = DriverManager.getConnection(URL, "root", "rootroot123");

         String sql = "SELECT * FROM product WHERE id ='" + id + "'";

         Statement st = conn.createStatement();

         ResultSet rs = st.executeQuery(sql);

         if (rs.next()) {
            byte[] imageData = rs.getBytes("image"); // extract byte data from the resultset..
            OutputStream os = response.getOutputStream(); // output with the help of outputStream
            os.write(imageData);
            os.flush();
            os.close();
         }

      } catch (Exception e) {
         System.out.println(e);
      }

   }

   @Override
   protected void doGet(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {
      processRequest(request, response);
   }

   @Override
   protected void doPost(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {
      processRequest(request, response);
   }

}
