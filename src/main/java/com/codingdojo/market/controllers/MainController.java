package com.codingdojo.market.controllers;

import java.util.List;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.codingdojo.market.models.Item;
import com.codingdojo.market.models.ItemSearch;
import com.codingdojo.market.models.LoginUser;
import com.codingdojo.market.models.Supermarket;
import com.codingdojo.market.models.User;
import com.codingdojo.market.services.CategoryService;
import com.codingdojo.market.services.ItemService;
import com.codingdojo.market.services.StateService;
import com.codingdojo.market.services.SupermarketService;
import com.codingdojo.market.services.UserService;
import com.codingdojo.market.validator.ItemValidator;
import com.codingdojo.market.validator.SupermarketValidator;
import com.codingdojo.market.validator.UserValidator;

@Controller
public class MainController {
	@Autowired
	private UserService userService;
	@Autowired
	private UserValidator userValidator;
	@Autowired
	private StateService stateService;
	@Autowired
	private SupermarketService supermarketService;
	@Autowired
	SupermarketValidator supermarketValidator;
	@Autowired
	private ItemService itemService;
	@Autowired
	ItemValidator itemValidator;
	@Autowired
	CategoryService categoryService;

	private static final String USERID = "userId";

	@GetMapping("/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/";
	}

	@GetMapping("/")
	public String index(Model model) {
		model.addAttribute("newUser", new User());
		model.addAttribute("newLogin", new LoginUser());
		
		return "login.jsp";
	}

	@PostMapping("/registration")
	public String register(@Valid @ModelAttribute("newUser") User newUser, 
			BindingResult result, Model model, HttpSession session) {

		userValidator.validate(newUser, result);

		if (result.hasErrors()) {
			model.addAttribute("newLogin", new LoginUser());
			return "login.jsp";
		} else {
			User user = userService.registerUser(newUser);
			session.setAttribute(USERID, user.getId());
			return "redirect:/dashboard";
		}		
	}
	@PostMapping("/login")
	public String login(@Valid @ModelAttribute("newLogin") LoginUser newLogin, 
			BindingResult result, Model model, HttpSession session, RedirectAttributes redirectAttributes) {

		if(result.hasErrors()) {
			model.addAttribute("newUser", new User());
			return "login.jsp";
		}

		User user = userService.login(newLogin, result);

		if (result.hasErrors()) {
			model.addAttribute("newUser", new User());
			return "login.jsp";
		}

		redirectAttributes.addFlashAttribute("error", "Accepted !!!!!");
		session.setAttribute(USERID, user.getId());
		
		return "redirect:/dashboard";
	}
	
	@GetMapping("/dashboard")
	public String mainMenu(HttpSession session, Model model) {
		Long userId = (Long) session.getAttribute(USERID);

		if(userId == null) {
			 return "redirect:/";
		}
		   
		model.addAttribute("searchFields", new ItemSearch());		
		model.addAttribute("items",itemService.getAllByName());		
		model.addAttribute("user", userService.findById(userId));		
		return "dashboard.jsp";
	}
	
	@PostMapping("/items/query")
	public String getQueryResults(@ModelAttribute("searchFields") ItemSearch itemSearch, Model model) {
		List<Item> item = itemService.getBySpecificItem(itemSearch.getItem());
		List<Item> category = itemService.getBySpecificCategory(itemSearch.getCategory()); 
		
		if (item.size() > 0) {
			model.addAttribute("items",item);
			return  "dashboard.jsp";
		} else if (category.size() > 0 ) {
			model.addAttribute("items",category);
			return  "dashboard.jsp";
		} else {
			return "redirect:/dashboard";
		}
		
	}

	@GetMapping("/supermarkets")
	public String addSuperMarket(@ModelAttribute("supermarket") Supermarket supermarket, Model model, HttpSession session) {
		Long userId = (Long) session.getAttribute(USERID);

		if(userId == null) {
			 return "redirect:/";
		}
		
		model.addAttribute("allStates", stateService.getAll());
		model.addAttribute("supermarkets",supermarketService.getAllByName());
		model.addAttribute("user", userService.findById(userId));
		
		return "addSupermarket.jsp";
	}

	@PostMapping("/supermarkets/add") 
	public String insertSuperMarket(@Valid @ModelAttribute("supermarket") Supermarket supermarket, BindingResult result,
			HttpSession session, Model model) {

		supermarketValidator.validate(supermarket, result);

		if (result.hasErrors()) {	
			model.addAttribute("allStates", stateService.getAll());
			model.addAttribute("supermarkets",supermarketService.getAll());
			model.addAttribute("user", userService.findById((Long) session.getAttribute(USERID)));
			
			return "addSupermarket.jsp";
		} else {
			supermarketService.create(supermarket);
			return "redirect:/supermarkets";
		}				  
	}

	@GetMapping("/supermarkets/{id}/edit")
	public String editPage( @ModelAttribute("supermarket") Supermarket supermarket, Model model, @PathVariable("id") Long id, 
			HttpSession session) {		
		
		Long userId = (Long) session.getAttribute(USERID);

		if(userId == null) {
			 return "redirect:/";
		}
		
				
		Supermarket market = supermarketService.findById(id);
		model.addAttribute("supermarket", market);
		model.addAttribute("allStates", stateService.getAll());
		model.addAttribute("user", userService.findById(userId));
		return "editSupermarket.jsp";
	}

	@PostMapping("/supermarkets/{id}/edit")
	public String updateSupermarket(@Valid @ModelAttribute("supermarket") Supermarket supermarket, BindingResult result, Model model) {	    	 

		supermarketValidator.validate(supermarket, result);

		if (result.hasErrors()) {
			return "editSupermarket.jsp";
		} 	

		supermarketService.update(supermarket);	    	
		return "redirect:/supermarkets";
	}
	
    @DeleteMapping("/supermarkets/{id}/delete")
    public String destroy(@PathVariable("id") Long id) {
    	supermarketService.delete(id);
        return "redirect:/supermarkets";
    }
    
	@GetMapping("/items/add")
	public String addItem(@ModelAttribute("item") Item item, Model model, HttpSession session) {
		 Long userId = (Long) session.getAttribute(USERID);

		if(userId == null) {
			 return "redirect:/";
		}
		
		model.addAttribute("user", userService.findById(userId));
		//model.addAttribute("items",itemService.getAll());
		model.addAttribute("items",itemService.getAllByName());		
		model.addAttribute("allCategories", categoryService.getAll());
		model.addAttribute("supermarkets", supermarketService.getAllByName());
		return "addItem.jsp";
	}
	
	@PostMapping("/items/add") 
	public String insertItem(@Valid @ModelAttribute("item") Item item, BindingResult result,
			HttpSession session, Model model) {

		itemValidator.validate(item, result);
		
		System.out.println(item.getSupermarket().getId());
		if (result.hasErrors()) {
			model.addAttribute("items",itemService.getAll());
			model.addAttribute("allCategories", categoryService.getAll());
			model.addAttribute("user", userService.findById((Long) session.getAttribute(USERID)));
			model.addAttribute("supermarkets", supermarketService.getAllByName());
		
			return "addItem.jsp";
		} else {
			itemService.create(item);
			return "redirect:/dashboard";
		}				  
	}
	
	@GetMapping("/items/{id}/edit")
	public String editPage(@ModelAttribute("item") Item item, Model model, @PathVariable("id") Long id, HttpSession session) {
		Long userId = (Long) session.getAttribute(USERID);
		
		if(userId == null) {
			 return "redirect:/";
		}
		
		model.addAttribute("user", userService.findById(userId));
		
		
		Item itemEntry = itemService.findById(id);
		model.addAttribute("item", itemEntry);
		
		model.addAttribute("superM", supermarketService.findById(itemEntry.getSupermarket().getId()));
		return "editItem.jsp";
	}

	@PostMapping("/items/{id}/edit")
	public String updateShow(@Valid @ModelAttribute("item") Item item, BindingResult result, Model model, HttpSession session) {	    	 

		itemValidator.validate(item, result);

		if (result.hasErrors()) {
			Long userId = (Long) session.getAttribute(USERID);
			model.addAttribute("user", userService.findById(userId));
			model.addAttribute("superM", supermarketService.findById(item.getSupermarket().getId()));
			return "editItem.jsp";
		} 	

		itemService.update(item);	    	
		return "redirect:/dashboard";
	}
	
    @DeleteMapping("/items/{id}/delete")
    public String destroyItem(@PathVariable("id") Long id) {
    	itemService.delete(id);
        return "redirect:/dashboard";
    }	
    
	@GetMapping("/items/view/{id}")
	public String viewItem(Model model, @PathVariable("id") Long id, HttpSession session) {
		Long userId = (Long) session.getAttribute(USERID);
		
		if(userId == null) {
			 return "redirect:/";
		}
		
		model.addAttribute("user", userService.findById(userId));		
		
		Item itemEntry = itemService.findById(id);
		model.addAttribute("item", itemEntry);
		
		Supermarket superMarket = supermarketService.findById(itemEntry.getSupermarket().getId());		
		
		model.addAttribute("supermarket", superMarket);
		
		return "viewItem.jsp";
	}
}
