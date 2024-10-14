package tw.com.eeit141.item.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import tw.com.eeit141.item.service.ItemService;

@WebServlet("/DeleteItemById.do")
public class DeleteItemById extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		Integer itemId = Integer.valueOf(request.getParameter("id"));
		ItemService itemService = new ItemService();
		itemService.deleteItemById(itemId);
		response.getWriter().write("done");
		
	
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
