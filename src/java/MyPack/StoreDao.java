package MyPack;

import MyPack.Product;
import java.io.InputStream;
import java.sql.*;
import java.util.ArrayList;

public class StoreDao {

   Connection conn;

   public StoreDao() {
      try {
         Class.forName("com.mysql.jdbc.Driver");
         String URL = "jdbc:mysql://127.0.0.1/LaptopHub";

         conn = DriverManager.getConnection(URL, "root", "rootroot123");

      } catch (Exception e) {
         System.out.println(e);
      }

   }

   public User getUser(String email, String passwd) {
      User user = null;
      try {
         PreparedStatement st = conn.prepareStatement("SELECT * FROM user WHERE email=? AND password=?");
         st.setString(1, email);
         st.setString(2, passwd);

         ResultSet rs = st.executeQuery();

         if (rs.next()) {
            int uid = rs.getInt("id");
            String name = rs.getString("username");
            String mail = rs.getString("email");
            String pass = rs.getString("password");
            String phone = rs.getString("phone");
            int age = rs.getInt("age");
            Boolean userType = rs.getBoolean("userType");

            user = new User();

            user.setUid(uid);
            user.setUsername(name);
            user.setEmail(mail);
            user.setPasswd(passwd);
            user.setPhone(phone);
            user.setAge(age);
            user.setUserType(userType);

         }

      } catch (Exception e) {
         System.out.println(e);
      }
      return user;
   }

   public int insertUser(User user) {
      int flag = 0;
      try {
         PreparedStatement st;

         String username = user.getUsername();
         String email = user.getEmail();
         String passwd = user.getPasswd();
         String phone = user.getPhone();
         int age = user.getAge();
         Boolean userType = user.getUserType();

         st = conn.prepareStatement("SELECT * FROM user WHERE email=?");
         st.setString(1, email);

         ResultSet rv = st.executeQuery();

         if (!rv.next()) {
            st = conn.prepareStatement("INSERT INTO user(username, email, password, phone, age, userType) VALUES(?,?,?,?,?,?)");
            st.setString(1, username);
            st.setString(2, email);
            st.setString(3, passwd);
            st.setString(4, phone);
            st.setInt(5, age);
            st.setBoolean(6, userType);
         } else {
            return 2;
         }

         int rs = st.executeUpdate();

         if (rs != -1) {
            flag = 1;
         }

      } catch (Exception e) {
         System.out.println(e);
      }
      return flag;
   }

   public Boolean addProduct(Product product) {
      Boolean flag = false;

      try {

         PreparedStatement st = conn.prepareStatement("INSERT INTO product(modelName, modelYear, ram, memory, memoryType, processor, gpu, display, price, image, company) VALUES(?,?,?,?,?,?,?,?,?,?,?)");
         st.setString(1, product.getModelName());
         st.setInt(2, product.getModelYear());
         st.setInt(3, product.getRam());
         st.setInt(4, product.getMemory());
         st.setString(5, product.getMemoryType());
         st.setString(6, product.getProcessor());
         st.setString(7, product.getGpu());
         st.setString(8, product.getDisplay());
         st.setFloat(9, product.getPrice());
         st.setBlob(10, product.getImage());
         st.setString(11, product.getCompanyName());

         int rv = st.executeUpdate();
         if (rv != -1) {
            flag = true;
         }

      } catch (Exception e) {

      }
      return flag;
   }

   public ArrayList getProducts() {
      ArrayList products = new ArrayList();

      try {
         PreparedStatement st;
         st = conn.prepareStatement("SELECT * FROM product");
         ResultSet rs = st.executeQuery();

         while (rs.next()) {

            int id = rs.getInt("id");
            String modelName = rs.getString("modelName");
            String companyName = rs.getString("company");
            int modelYear = rs.getInt("modelYear");
            int ram = rs.getInt("ram");
            int memory = rs.getInt("memory");
            String memoryType = rs.getString("memoryType");
            String processor = rs.getString("processor");
            String gpu = rs.getString("gpu");
            String display = rs.getString("display");
            float price = rs.getFloat("price");
            InputStream image = rs.getBinaryStream("image");

            Product product = new Product();
            product.setId(id);
            product.setCompanyName(companyName);
            product.setDisplay(display);
            product.setGpu(gpu);
            product.setImage(image);
            product.setMemory(memory);
            product.setMemoryType(memoryType);
            product.setModelName(modelName);
            product.setModelYear(modelYear);
            product.setPrice(price);
            product.setProcessor(processor);
            product.setRam(ram);

            products.add(product);

         }

      } catch (Exception e) {
         System.out.println(e);
      }

      return products;
   }

   public Product getProduct(int ID) {
      Product product = null;
      try {

         PreparedStatement st = conn.prepareStatement("SELECT * FROM product WHERE id=?");
         st.setInt(1, ID);

         ResultSet rs = st.executeQuery();

         if (rs.next()) {
            product = new Product();

            int id = rs.getInt("id");
            String modelName = rs.getString("modelName");
            String companyName = rs.getString("company");
            int modelYear = rs.getInt("modelYear");
            int ram = rs.getInt("ram");
            int memory = rs.getInt("memory");
            String memoryType = rs.getString("memoryType");
            String processor = rs.getString("processor");
            String gpu = rs.getString("gpu");
            String display = rs.getString("display");
            float price = rs.getFloat("price");
            InputStream image = rs.getBinaryStream("image");

            product.setId(id);
            product.setCompanyName(companyName);
            product.setDisplay(display);
            product.setGpu(gpu);
            product.setImage(image);
            product.setMemory(memory);
            product.setMemoryType(memoryType);
            product.setModelName(modelName);
            product.setModelYear(modelYear);
            product.setPrice(price);
            product.setProcessor(processor);
            product.setRam(ram);

         }

      } catch (Exception e) {
         System.out.println(e);
      }
      return product;
   }

   public Boolean deleteProduct(int ID) {
      Boolean flag = false;

      try {

         PreparedStatement st = conn.prepareStatement("DELETE FROM product WHERE id=?");
         st.setInt(1, ID);

         int rs = st.executeUpdate();

         if (rs == 1) {
            flag = true;
         }

      } catch (Exception e) {
         System.out.println(e);
      }
      return flag;
   }

   public Boolean updateProduct(Product product) {
      Boolean flag = null;

      try {

         int id = product.getId();
         String company = product.getCompanyName();
         String display = product.getDisplay();
         String gpu = product.getGpu();
         InputStream image = product.getImage();
         int memory = product.getMemory();
         String memoryType = product.getMemoryType();
         String modelName = product.getModelName();
         int modelYear = product.getModelYear();
         float price = product.getPrice();
         String processor = product.getProcessor();
         int ram = product.getRam();

         PreparedStatement st = conn.prepareStatement("UPDATE product set modelName=?, modelYear=?, ram=?, memory=?, memoryType=?, processor=?, gpu=?, display=?, price=?, image=?, company=? WHERE id=" + id);

         st.setString(1, modelName);
         st.setInt(2, modelYear);
         st.setInt(3, ram);
         st.setInt(4, memory);
         st.setString(5, memoryType);
         st.setString(6, processor);
         st.setString(7, gpu);
         st.setString(8, display);
         st.setFloat(9, price);
         st.setBinaryStream(10, image);
         st.setString(11, company);

         int rv = st.executeUpdate();
         if (rv != -1) {
            flag = true;
         }

      } catch (Exception e) {
         System.out.println(e);
      }

      return flag;
   }

   public ArrayList getOrders(int UID) {
      ArrayList list = new ArrayList();
      try {

         PreparedStatement st = conn.prepareStatement("SELECT * FROM `order` WHERE uid=?");
         st.setInt(1, UID);

         ResultSet rs = st.executeQuery();

         while (rs.next()) {
            Order order = new Order();
            order.setUid(rs.getInt("uid"));
            order.setTotalAmount(rs.getFloat("totalAmount"));
            order.setOrderDate(rs.getDate("orderDate"));
            list.add(order);

         }

      } catch (Exception e) {
         System.out.println(e);
      }
      return list;
   }

   public Boolean insertOrder(Order order) {
      Boolean flag = false;
      try {
         PreparedStatement st = conn.prepareStatement("INSERT INTO `order`(uid, totalAmount, orderDate) VALUES(?,?,?)");
         st.setInt(1, order.getUid());
         st.setFloat(2, order.getTotalAmount());
         st.setDate(3, order.getOrderDate());

         int rv = st.executeUpdate();

         if (rv != -1) {
            flag = true;
         }

      } catch (Exception e) {
         System.out.println(e);
      }
      return flag;
   }

   public ArrayList searchProduct(String companyName, String modelName) {
      ArrayList products = new ArrayList();
      try {

         PreparedStatement st = conn.prepareStatement("SELECT * FROM product WHERE company=? AND modelName=?");
         st.setString(1, companyName);
         st.setString(2, modelName);

         ResultSet rs = st.executeQuery();

         while (rs.next()) {
            int id = rs.getInt("id");
            String model = rs.getString("modelName");
            String company = rs.getString("company");
            int modelYear = rs.getInt("modelYear");
            int ram = rs.getInt("ram");
            int memory = rs.getInt("memory");
            String memoryType = rs.getString("memoryType");
            String processor = rs.getString("processor");
            String gpu = rs.getString("gpu");
            String display = rs.getString("display");
            float price = rs.getFloat("price");
            InputStream image = rs.getBinaryStream("image");

            Product product = new Product();
            product.setId(id);
            product.setCompanyName(companyName);
            product.setDisplay(display);
            product.setGpu(gpu);
            product.setImage(image);
            product.setMemory(memory);
            product.setMemoryType(memoryType);
            product.setModelName(modelName);
            product.setModelYear(modelYear);
            product.setPrice(price);
            product.setProcessor(processor);
            product.setRam(ram);

            products.add(product);
         }

      } catch (Exception e) {
         System.out.println(e);
      }
      return products;
   }
}
