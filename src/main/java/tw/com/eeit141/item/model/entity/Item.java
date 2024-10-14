package tw.com.eeit141.item.model.entity;

import java.util.Base64;

public class Item {
	private int itemId;
	private String itemName;
	private int itemPrice;
	private int itemProteinContain;
	private int itemRating;
	private String itemPhotoBase64;
	private byte[] itemPhoto;

	
	
	
	public String getitemPhotoBase64() {
		return itemPhotoBase64;
	}

	public int getItemId() {
		return itemId;
	}
	public void setItemId(int itemId) {
		this.itemId = itemId;
	}
	public String getItemName() {
		return itemName;
	}
	public void setItemName(String itemName) {
		this.itemName = itemName;
	}
	public int getItemPrice() {
		return itemPrice;
	}
	public void setItemPrice(int itemPrice) {
		this.itemPrice = itemPrice;
	}
	public int getItemProteinContain() {
		return itemProteinContain;
	}
	public void setItemProteinContain(int itemProteinContain) {
		this.itemProteinContain = itemProteinContain;
	}
	public int getItemRating() {
		return itemRating;
	}
	public void setItemRating(int itemRating) {
		this.itemRating = itemRating;
	}
	public byte[] getItemPhoto() {
		return itemPhoto;
	}
	public void setItemPhoto(byte[] itemPhoto) {
		this.itemPhoto = itemPhoto;
		String base64String = Base64.getEncoder().encodeToString(itemPhoto);
		this.itemPhotoBase64 = "data:image/png;base64,"+base64String;
	}


	
	
}
