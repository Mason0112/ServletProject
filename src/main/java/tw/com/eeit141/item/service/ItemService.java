package tw.com.eeit141.item.service;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

import tw.com.eeit141.item.conn.ConnectionFactory;
import tw.com.eeit141.item.model.dao.ItemDao;
import tw.com.eeit141.item.model.entity.Item;






public class ItemService {
	
	public Item getItemById(Integer itemId) {
		Item item = null;
		
		try {
			Connection conn = ConnectionFactory.getConnection();
			ItemDao itemDao = new ItemDao(conn);
			item = itemDao.findById(itemId);
			conn.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return item;
		
		
	}
	
	public void createMember(Item i) {
		// 還可以做權限驗證

		try {
			Connection conn = ConnectionFactory.getConnection();

			ItemDao itemDao = new ItemDao(conn);
			itemDao.createMember(i);

			conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
			throw new RuntimeException("新增失敗:" + e.getMessage());
		}
	}

	public List<Item> getAllItem() {
		List<Item> items = null;

		try {

			Connection conn = ConnectionFactory.getConnection();

			ItemDao itemDao = new ItemDao(conn);
			items = itemDao.findAll();

			conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return items ;
	}


	public void deleteItemById(int itemId) {
		
		try {
			Connection conn = ConnectionFactory.getConnection();
			ItemDao itemDao = new ItemDao(conn);
			itemDao.deleteItemById(itemId);
			
			conn.close();
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			throw new RuntimeException("刪除失敗:" + e.getMessage());
		}
		
		
	}
	
	
	public void updateItem(Item i) {
		
		
		try {
			Connection conn = ConnectionFactory.getConnection();
			ItemDao itemDao = new ItemDao(conn);
			itemDao.updateItem(i);
			conn.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
	}
	
	
	
	

}
