package tw.com.eeit141.item.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import tw.com.eeit141.item.model.entity.Item;



public class ItemDao {
	private Connection conn;
	
	public ItemDao(Connection conn) {
		this.conn = conn;
	}

	
	public Item findById(Integer itemId) throws SQLException {
		
		final String SQL_QUERY = "SELECT * FROM [items] WHERE [item_id] = ?";
		Item i =null;
		
		PreparedStatement pstmt = conn.prepareStatement(SQL_QUERY);
		pstmt.setInt(1, itemId);
		ResultSet rs = pstmt.executeQuery();
		if (rs.next()) {
			i = new Item();
			i.setItemId(rs.getInt("item_id"));
			i.setItemName(rs.getString("item_name"));
			i.setItemPrice(rs.getInt("item_price"));
			i.setItemProteinContain(rs.getInt("item_protein_contain"));
			i.setItemRating(rs.getInt("item_rating"));
			i.setItemPhoto(rs.getBytes("item_photo"));
		}

		rs.close();
		pstmt.close();

		return i;
		
	}
	
	
	
	
	public void createMember(Item i) throws SQLException {
		final String SQL_QUERY = "INSERT INTO [dbo].[items]"
				+ "           ([item_name]"
				+ "           ,[item_price]"
				+ "           ,[item_protein_contain]"
				+ "           ,[item_rating]"
				+ "           ,[item_photo])"
				+ "     VALUES(?,?,?,?,?)";

		PreparedStatement pstmt = conn.prepareStatement(SQL_QUERY);

		pstmt.setString(1,i.getItemName());
		pstmt.setInt(2,i.getItemPrice() );
		pstmt.setInt(3, i.getItemProteinContain());
		pstmt.setInt(4, i.getItemRating());
		pstmt.setBytes(5, i.getItemPhoto());

		pstmt.execute();
		pstmt.close();
		
	}
	
	public List<Item> findAll() throws SQLException{
		final String SQL_QUERY = "SELECT * FROM [items]";
		List<Item> items = new ArrayList<Item>();

		PreparedStatement pstmt = conn.prepareStatement(SQL_QUERY);

		ResultSet rs = pstmt.executeQuery();

		while (rs.next()) {
			Item i  = new Item();
			i.setItemId(rs.getInt("item_id"));
			i.setItemName(rs.getString("item_name"));
			i.setItemPrice(rs.getInt("item_price"));
			i.setItemProteinContain(rs.getInt("item_protein_contain"));
			i.setItemRating(rs.getInt("item_rating"));
			i.setItemPhoto(rs.getBytes("item_photo"));
			
			items.add(i);
		}

		rs.close();
		pstmt.close();

		return items;
	}
		
	public	void deleteItemById(int itemId) throws SQLException {
		final String SQL_QUERY = "DELETE FROM [dbo].[items] WHERE [item_id] = ?";
		PreparedStatement pstmt = conn.prepareStatement(SQL_QUERY);
		pstmt.setInt(1, itemId);
		
		pstmt.execute();
		pstmt.close();
		
	}
		
	public void updateItem(Item i) throws SQLException {
		
		final String SQL_QUERY_WITH_PHOTO = "UPDATE [dbo].[items] SET item_name = ?, item_price = ?, item_protein_contain = ?, item_rating = ?, item_photo =? WHERE item_id = ?";
		// 不這樣改，你的照片那邊會回傳null，網站就甭開了
		final String SQL_QUERY_WITHOUT_PHOTO = "UPDATE [dbo].[items] SET item_name = ?, item_price = ?, item_protein_contain = ?, item_rating = ? WHERE item_id = ?";
		
		PreparedStatement pstmt;
		
		if (i.getItemPhoto() != null) {
			pstmt = conn.prepareStatement(SQL_QUERY_WITH_PHOTO);
			pstmt.setString(1,i.getItemName());
			pstmt.setInt(2,i.getItemPrice());
			pstmt.setInt(3,i.getItemProteinContain());
			pstmt.setInt(4,i.getItemRating());
			pstmt.setBytes(5, i.getItemPhoto());
			pstmt.setInt(6,i.getItemId());
			
		} else {
			pstmt = conn.prepareStatement(SQL_QUERY_WITHOUT_PHOTO);
			pstmt.setString(1,i.getItemName());
			pstmt.setInt(2,i.getItemPrice());
			pstmt.setInt(3,i.getItemProteinContain());
			pstmt.setInt(4,i.getItemRating());
			pstmt.setInt(5,i.getItemId());
	
		}
		
		pstmt.execute();
		pstmt.close();
		
	}	
	

}
