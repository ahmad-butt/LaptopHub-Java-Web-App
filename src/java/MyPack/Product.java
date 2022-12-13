package MyPack;

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
/**
 *
 * @author macbookpro
 */
import java.io.*;

public class Product implements Serializable {

   int id;
   String modelName;
   String companyName;
   int modelYear;
   int ram;
   int memory;
   String memoryType;
   String processor;
   String gpu;
   String display;
   float price;
   InputStream image;

   public Product() {

   }

   public void setId(int id) {
      this.id = id;
   }

   public void setModelName(String modelName) {
      this.modelName = modelName;
   }

   public void setCompanyName(String companyName) {
      this.companyName = companyName;
   }

   public void setModelYear(int modelYear) {
      this.modelYear = modelYear;
   }

   public void setRam(int ram) {
      this.ram = ram;
   }

   public void setMemory(int memory) {
      this.memory = memory;
   }

   public void setMemoryType(String memoryType) {
      this.memoryType = memoryType;
   }

   public void setProcessor(String processor) {
      this.processor = processor;
   }

   public void setGpu(String gpu) {
      this.gpu = gpu;
   }

   public void setDisplay(String display) {
      this.display = display;
   }

   public void setPrice(float price) {
      this.price = price;
   }

   public void setImage(InputStream image) {
      this.image = image;
   }

   public int getId() {
      return id;
   }

   public String getModelName() {
      return modelName;
   }

   public String getCompanyName() {
      return companyName;
   }

   public int getModelYear() {
      return modelYear;
   }

   public int getRam() {
      return ram;
   }

   public int getMemory() {
      return memory;
   }

   public String getMemoryType() {
      return memoryType;
   }

   public String getProcessor() {
      return processor;
   }

   public String getGpu() {
      return gpu;
   }

   public String getDisplay() {
      return display;
   }

   public float getPrice() {
      return price;
   }

   public InputStream getImage() {
      return image;
   }

}
