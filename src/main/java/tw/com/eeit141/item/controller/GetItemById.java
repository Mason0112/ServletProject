package tw.com.eeit141.item.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import tw.com.eeit141.item.model.entity.Item;
import tw.com.eeit141.item.service.ItemService;

@WebServlet("/GetItemById.do")
public class GetItemById extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String itemId = request.getParameter("id");
		
		ItemService itemService = new ItemService();
		Item item = itemService.getItemById(Integer.valueOf(itemId));
		
		request.setAttribute("i", item);
		request.getRequestDispatcher("ShowItem.jsp").forward(request, response);
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
