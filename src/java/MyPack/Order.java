/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package MyPack;

import java.io.Serializable;
import java.sql.Date;

/**
 *
 * @author macbookpro
 */
public class Order implements Serializable {

   int uid;
   float totalAmount;
   Date orderDate;

   public Order() {
   }

   public int getUid() {
      return uid;
   }

   public float getTotalAmount() {
      return totalAmount;
   }

   public Date getOrderDate() {
      return orderDate;
   }

   public void setUid(int uid) {
      this.uid = uid;
   }

   public void setTotalAmount(float totalAmount) {
      this.totalAmount = totalAmount;
   }

   public void setOrderDate(Date orderDate) {
      this.orderDate = orderDate;
   }

}
