package tw.com.eeit141.item.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import tw.com.eeit141.item.model.entity.Item;
import tw.com.eeit141.item.service.ItemService;

@WebServlet("/GetAllItem.do")
public class GetAllItem extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		ItemService itemService = new ItemService();
		
		List<Item> items = itemService.getAllItem();
		
		request.setAttribute("items", items);

		request.getRequestDispatcher("ShowAllItem.jsp").forward(request, response);
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
