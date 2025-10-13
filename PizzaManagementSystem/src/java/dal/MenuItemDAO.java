package dal;

import model.MenuItem;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.HashMap;

public class MenuItemDAO {

    public List<MenuItem> getAllMenuItems() {
        List<MenuItem> menuItems = new ArrayList<>();
        String sql = "SELECT ItemID, Name, Description, Price, Category, Status FROM MenuItem WHERE Status = 'Available' ORDER BY Category, Name";

        DBContext db = null;
        try {
            db = new DBContext();
            try (PreparedStatement pstmt = db.connection.prepareStatement(sql);
                 ResultSet rs = pstmt.executeQuery()) {

                while (rs.next()) {
                    MenuItem item = new MenuItem();
                    item.setItemID(rs.getString("ItemID"));
                    item.setName(rs.getString("Name"));
                    item.setDescription(rs.getString("Description"));
                    item.setPrice(rs.getDouble("Price"));
                    item.setCategory(rs.getString("Category"));
                    item.setStatus(rs.getString("Status"));
                    menuItems.add(item);
                }
            }
        } catch (SQLException ex) {
            // Không log, để exception propagate nếu cần
        } finally {
            if (db != null) {
                db.closeConnection();
            }
        }
        return menuItems;
    }

    // Nhóm items theo category (dựa trên getAllMenuItems)
    public Map<String, List<MenuItem>> getMenuItemsByCategory() {
        List<MenuItem> allItems = getAllMenuItems();
        Map<String, List<MenuItem>> grouped = new HashMap<>();
        for (MenuItem item : allItems) {
            grouped.computeIfAbsent(item.getCategory(), k -> new ArrayList<>()).add(item);
        }
        return grouped;
    }

    // Lấy chi tiết item bằng ID (cho cart)
    public MenuItem getMenuItemById(String itemID) {
        String sql = "SELECT * FROM MenuItem WHERE ItemID = ?";
        DBContext db = null;
        try {
            db = new DBContext();
            try (PreparedStatement pstmt = db.connection.prepareStatement(sql)) {
                pstmt.setString(1, itemID);
                try (ResultSet rs = pstmt.executeQuery()) {
                    if (rs.next()) {
                        MenuItem item = new MenuItem();
                        item.setItemID(rs.getString("ItemID"));
                        item.setName(rs.getString("Name"));
                        item.setDescription(rs.getString("Description"));
                        item.setPrice(rs.getDouble("Price"));
                        item.setCategory(rs.getString("Category"));
                        item.setStatus(rs.getString("Status"));
                        return item;
                    }
                }
            }
        } catch (SQLException ex) {
            // Không log
        } finally {
            if (db != null) {
                db.closeConnection();
            }
        }
        return null;
    }
}
