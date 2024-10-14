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

@WebServlet("/UpdateItem.do")
@MultipartConfig
public class UpdateItem extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		Integer itemId = Integer.valueOf(request.getParameter("id"));
		String itemName = request.getParameter("iName");
		Integer itemPrice = Integer.valueOf(request.getParameter("iPrice"));
		Integer itemProteinContain = Integer.valueOf(request.getParameter("iProteinContain"));
		Integer itemRating = Integer.valueOf(request.getParameter("iRating"));
		Part itemPhotoPart = request.getPart("iPhoto");
	
		ItemService itemService = new ItemService();
		Item item = itemService.getItemById(itemId);
		
		item.setItemName(itemName);
		item.setItemPrice(itemPrice);
		item.setItemProteinContain(itemProteinContain);
		item.setItemRating(itemRating);
		if (itemPhotoPart != null && itemPhotoPart.getSize() > 0) {
            InputStream in = itemPhotoPart.getInputStream();
            byte[] itemPhoto = in.readAllBytes();
            in.close();
            item.setItemPhoto(itemPhoto);
        }
		itemService.updateItem(item);
		  response.sendRedirect("GetAllItem.do");
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
