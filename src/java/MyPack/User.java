package MyPack;

import java.io.Serializable;

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
/**
 *
 * @author macbookpro
 */
public class User implements Serializable {

   int uid;
   String username;
   String email;
   String passwd;
   String phone;
   int age;
   Boolean userType;

   public User() {
   }

   public void setUid(int uid) {
      this.uid = uid;
   }

   public void setUsername(String username) {
      this.username = username;
   }

   public void setEmail(String email) {
      this.email = email;
   }

   public void setPasswd(String passwd) {
      this.passwd = passwd;
   }

   public void setPhone(String phone) {
      this.phone = phone;
   }

   public void setAge(int age) {
      this.age = age;
   }

   public void setUserType(Boolean userType) {
      this.userType = userType;
   }

   public int getUid() {
      return uid;
   }

   public String getUsername() {
      return this.username;
   }

   public String getEmail() {
      return this.email;
   }

   public String getPasswd() {
      return this.passwd;
   }

   public String getPhone() {
      return this.phone;
   }

   public int getAge() {
      return this.age;
   }

   public Boolean getUserType() {
      return this.userType;
   }
}
