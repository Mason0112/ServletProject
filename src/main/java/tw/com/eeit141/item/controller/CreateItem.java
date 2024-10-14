package tw.com.eeit141.item.controller;

import java.io.IOException;
import java.io.InputStream;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import tw.com.eeit141.item.model.entity.Item;
import tw.com.eeit141.item.service.ItemService;

@WebServlet("/CreateItem.do")
@MultipartConfig
public class CreateItem extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		request.setCharacterEncoding("UTF-8");
		// 蒐集使用者傳送的資料
		String itemName = request.getParameter("iName");
		Integer itemPrice =Integer.valueOf(request.getParameter("iPrice"));
		Integer itemProtein =Integer.valueOf(request.getParameter("iProtein"));
		Integer itemRating =Integer.valueOf(request.getParameter("iRating"));
		Part itemPhotoPart = request.getPart("iPhoto");
		
		InputStream in = itemPhotoPart.getInputStream();
		byte[] itemPhoto = in.readAllBytes();
		in.close();
		
		Item i = new Item();
		
		i.setItemName(itemName);
		i.setItemPrice(itemPrice);
		i.setItemProteinContain(itemProtein);
		i.setItemRating(itemRating);
		i.setItemPhoto(itemPhoto);
		
		
		ItemService itemService = new ItemService();
		
		itemService.createMember(i);
		
		// 轉移頁面，通知使用者完成新增
		//response.sendRedirect("GetAllItem.do");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
