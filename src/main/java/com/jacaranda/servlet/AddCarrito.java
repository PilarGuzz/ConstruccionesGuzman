package com.jacaranda.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.jacaranda.models.CRUDMaterial;
import com.jacaranda.models.Carrito;
import com.jacaranda.models.ItemCarrito;
import com.jacaranda.models.Material;

/**
 * Servlet implementation class AddCarrito
 */
@WebServlet("/AddCarrito")
public class AddCarrito extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddCarrito() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession userSession = request.getSession();
		Carrito carro = (Carrito) userSession.getAttribute("carrito");
		
		int cantidad = Integer.valueOf(request.getParameter("cantidad"));
		int materialCode = Integer.valueOf(request.getParameter("materialCode"));
		
		Material mat = CRUDMaterial.getMaterial(materialCode);
		ItemCarrito itemCarro = new ItemCarrito(mat, cantidad);
		
		
		if(!carro.getArticulos().contains(itemCarro)){
			try {
				carro.addItem(itemCarro);
			} catch (Exception e) {
				e.printStackTrace();
			}
			
		}
	}

}
