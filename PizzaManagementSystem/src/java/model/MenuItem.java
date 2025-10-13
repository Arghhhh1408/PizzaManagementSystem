/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

public class MenuItem {

    private String itemID;
    private String name;
    private String description;
    private double price;
    private String category;
    private String status;

    // Constructors
    public MenuItem() {
    }

    public MenuItem(String itemID, String name, String description, double price, String category, String status) {
        this.itemID = itemID;
        this.name = name;
        this.description = description;
        this.price = price;
        this.category = category;
        this.status = status;
    }

    // Getters and Setters
    public String getItemID() {
        return itemID;
    }

    public void setItemID(String itemID) {
        this.itemID = itemID;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    @Override
    public String toString() {
        return "MenuItem{" + "itemID='" + itemID + "', name='" + name + "', price=" + price + ", category='" + category + "', status='" + status + "'}";
    }
}
