<%@page import="MyPack.Order"%>
<%@page import="MyPack.Product"%>
<%@page import="javax.servlet.annotation.MultipartConfig"%>
<%@page import="java.io.InputStream"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html"%>
<%@page session="false" %>
<%@page errorPage="error.jsp" %>

<jsp:useBean id="DAO" class="MyPack.StoreDao" scope="page"/>

<%
   String action = request.getParameter("action");
   
    if(action.equals("login")) {
        String email = request.getParameter("email");
        String passwd = request.getParameter("passwd");

%>

<jsp:useBean id="user" class="MyPack.User" scope="page"/>

<%
        user = DAO.getUser(email, passwd);
        if (user != null) {
        
         HttpSession sess = request.getSession(true);
         sess.setAttribute("uid", user.getUid());
         sess.setAttribute("userType", user.getUserType());
         sess.setAttribute("username", user.getUsername());
         ArrayList cartItems = new ArrayList();
         sess.setAttribute("cartItems", cartItems);
         
         request.getRequestDispatcher("home.jsp").forward(request, response);
      } else {
         out.println("<h1>User not found!!</h1><br/>");
      }
   } else if(action.equals("signup")) {
        String username = request.getParameter("username");
        String email = request.getParameter("email");
        String passwd = request.getParameter("passwd");
        String phone = request.getParameter("phone");
        int age = Integer.parseInt(request.getParameter("age"));
        Boolean userType = false;
%>
<jsp:useBean id="newUser" class="MyPack.User" scope="page"/>
<%
        newUser.setUsername(username);
        newUser.setEmail(email);
        newUser.setPasswd(passwd);
        newUser.setPhone(phone);
        newUser.setAge(age);
        newUser.setUserType(userType);
        
        int rv = DAO.insertUser(newUser);
        
        if (rv == 1) {
         out.println("<h1>User Created Successfully!!</h1><br/>");
         out.println("<a href=\"login.jsp\"><button>Sign in</button></a>");

      } else if (rv == 0) {
         out.println("<h1>Unable to create User!!</h1><br/>");
      } else {
         out.println("<h1>User already exists!!</h1><br/>");
      }
    } else if(action.equals("insertProduct")) {
%>
<jsp:useBean id="newProduct" class="MyPack.Product" scope="page"/>
<%
        String modelName = request.getParameter("modelName");
        int modelYear = Integer.parseInt(request.getParameter("modelYear"));
        int ram = Integer.parseInt(request.getParameter("ram"));
        int memory = Integer.parseInt(request.getParameter("memory"));
        String memoryType = request.getParameter("memoryType");
        String processor = request.getParameter("processor");
        String gpu = request.getParameter("gpu");
        String display = request.getParameter("display");
        Float price = Float.parseFloat(request.getParameter("price"));
        
        InputStream image = null;

        Part filePart = request.getPart("image");
        
        if (filePart != null) {
            image = filePart.getInputStream();
        }
        
        String companyName = request.getParameter("companyName");
        
        newProduct.setModelName(modelName);
        newProduct.setCompanyName(companyName);
        newProduct.setModelYear(modelYear);
        newProduct.setRam(ram);
        newProduct.setMemory(memory);
        newProduct.setMemoryType(memoryType);
        newProduct.setProcessor(processor);
        newProduct.setGpu(gpu);
        newProduct.setDisplay(display);
        newProduct.setPrice(price);
        newProduct.setImage(image);
        
        Boolean rv = DAO.addProduct(newProduct);
        
        if(rv) {
%>
        <h1>Product Inserted Successfully!!</h1>
        <a href="insertProduct.jsp"><button>Insert More</button></a>
        <a href="home.jsp"><button>Products</button></a>
<%
            
        } else {
%>
        <h1>Product Insertion Failed!!</h1>
<%
        }
    } else if(action.equals("deleteProduct")) {
        int ID = Integer.parseInt(request.getParameter("id"));
        Boolean rv = DAO.deleteProduct(ID);
        if(rv) {
            out.println("<h1>Product Deleted Successfully!!</h1><br/>");
            out.println("<a href=\"home.jsp\"><button>View Products</button></a>");
        } else {
            out.println("<h1>Product Failed Successfully!!</h1><br/>");
        }
    } else if(action.equals("viewUpdateProduct")) {
        int ID = Integer.parseInt(request.getParameter("id"));
        Product product = DAO.getProduct(ID);
        request.setAttribute("productToUpdate", product);
        request.getRequestDispatcher("updateProduct.jsp").forward(request, response);
    } else if(action.equals("updateProduct")){
        int ID = Integer.parseInt(request.getParameter("id"));

        String modelName = request.getParameter("modelName");
        int modelYear = Integer.parseInt(request.getParameter("modelYear"));
        int ram = Integer.parseInt(request.getParameter("ram"));
        int memory = Integer.parseInt(request.getParameter("memory"));
        String memoryType = request.getParameter("memoryType");
        String processor = request.getParameter("processor");
        String gpu = request.getParameter("gpu");
        String display = request.getParameter("display");
        Float price = Float.parseFloat(request.getParameter("price"));
        
        InputStream image = null;

        Part filePart = request.getPart("image");
        
        if (filePart != null) {
            image = filePart.getInputStream();
        }
        
        String companyName = request.getParameter("companyName");

        Product product = new Product();

        product.setId(ID);
        product.setModelName(modelName);
        product.setCompanyName(companyName);
        product.setModelYear(modelYear);
        product.setRam(ram);
        product.setMemory(memory);
        product.setMemoryType(memoryType);
        product.setProcessor(processor);
        product.setGpu(gpu);
        product.setDisplay(display);
        product.setPrice(price);
        product.setImage(image);
        
        Boolean rv = DAO.updateProduct(product);
        if(rv) {
            out.println("<h1>Product Updated Successfully!!</h1><br/>");
            out.println("<a href=\"home.jsp\"><button>View Products</button></a>");
        } else {
            out.println("<h1>Product Updation Failed!!</h1><br/>");
        }
    } else if(action.equals("addToCart")) {
        int ID = Integer.parseInt(request.getParameter("id"));
        Product item = DAO.getProduct(ID);
        HttpSession sess = request.getSession(false);
        ArrayList cartItems = (ArrayList)sess.getAttribute("cartItems");
        cartItems.add(item);
        sess.setAttribute("cartItems", cartItems);
        request.getRequestDispatcher("home.jsp").forward(request, response);
    } else if(action.equals("removeFromCart")) {
        int index = Integer.parseInt(request.getParameter("index"));
        HttpSession sess = request.getSession(false);
        ArrayList cartItems = (ArrayList)sess.getAttribute("cartItems");
        cartItems.remove(index);
        sess.setAttribute("cartItems", cartItems);
        response.sendRedirect("cart.jsp");
    } else if(action.equals("checkout")) {
        HttpSession sess = request.getSession(false);
        ArrayList cartItems = (ArrayList)sess.getAttribute("cartItems");

        int uid = (int)sess.getAttribute("uid");

        java.util.Date d = new java.util.Date();
        long millis = d.getTime();
        
        Date date = new Date(millis);

        float price = 0;

        for (int i=0; i<cartItems.size(); i++) {
            Product p = (Product)cartItems.get(i);
            price += p.getPrice();
        }

        Order order = new Order();
        order.setUid(uid);
        order.setTotalAmount(price);
        order.setOrderDate(date);

        Boolean rv = DAO.insertOrder(order);

        if(rv){
            cartItems.clear();
            sess.setAttribute("cartItems", cartItems);
            out.println("<h1>Your Order Placed Successfully!!</h1><br/>");
            out.println("<a href=\"home.jsp\"><button>View Products</button></a>");
        } else {
            out.println("<h1>Order not placed!!</h1><br/>");
            out.println("<a href=\"cart.jsp\"><button>View Cart</button></a>");
        }
    } else if(action.equals("searchProduct")) {
        String modelName = request.getParameter("modelName");
        String companyName = request.getParameter("companyName");

        ArrayList p = DAO.searchProduct(companyName, modelName);

        request.setAttribute("searchResults", p);

        request.getRequestDispatcher("searchResults.jsp").forward(request, response);

    }
%>