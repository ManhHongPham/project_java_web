package Homework.JW12.ArtFurniture.service.serverside.controller.User;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import Homework.JW12.ArtFurniture.service.serverside.dto.ProductSearchModel;
import Homework.JW12.ArtFurniture.service.serverside.entities.Category;
import Homework.JW12.ArtFurniture.service.serverside.entities.Product;
import Homework.JW12.ArtFurniture.service.serverside.services.CategoryService;
import Homework.JW12.ArtFurniture.service.serverside.services.ProductService;

@Controller
public class ShopController extends BaseController {

	@Autowired
	private ProductService productService;

	@Autowired
	private CategoryService categoryService;

	/**
	 * action sccess page shop
	 * 
	 * @param model
	 * @param request
	 * @param response
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = { "/shop", }, method = RequestMethod.GET)
	public String shop(final ModelMap model, final HttpServletRequest request, final HttpServletResponse response)
			throws Exception {

		List<Product> products = productService.findAll();
		List<Product> p = new ArrayList<Product>();

		for (Product product : products) {
			if (product.getStatus() == true) {
				p.add(product);
			}
		}
		List<Category> categories = categoryService.findAll();

		model.addAttribute("product", p);
		model.addAttribute("category", categories);
		return "user/shop";
	}

	/**
	 * display menu
	 * 
	 * @param model
	 * @param request
	 * @param response
	 * @param categorySeo
	 * @return
	 * @throws IOException
	 */
	@RequestMapping(value = { "/category/{categorySeo}" }, method = RequestMethod.GET)
	public String category(final ModelMap model, final HttpServletRequest request, final HttpServletResponse response,
			@PathVariable("categorySeo") String categorySeo) throws IOException {

		ProductSearchModel sm = new ProductSearchModel();
		sm.setCategorySeo(categorySeo);

		List<Product> products = productService.search(sm);

		model.addAttribute("category", categoryService.findAll());
		model.addAttribute("product", products);

		return "user/shop";
	}

	/**
	 * action search product
	 * 
	 * @param model
	 * @param request
	 * @param response
	 * @return
	 * @throws IOException
	 */
	@RequestMapping(value = { "/search" }, method = RequestMethod.GET)
	public String search(final ModelMap model, final HttpServletRequest request, final HttpServletResponse response)
			throws IOException {
		String searchText = request.getParameter("searchText");

		ProductSearchModel sm = new ProductSearchModel();
		sm.setSearchText(searchText);
		List<Product> products = productService.search(sm);

		model.addAttribute("product", products);
		return "user/shop";
	}
}
