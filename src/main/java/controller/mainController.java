/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;


import javax.servlet.http.HttpServletRequest;
import model.BeersService;
import model.CategoriesService;
import model.StylesService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import java.text.DecimalFormat;
import java.util.Locale;
import org.springframework.web.servlet.ModelAndView;

/**
 *
 * @author hyoku
 */

@Controller
@RestController
@RequestMapping("/main") 
public class mainController {
    
    @Autowired
    BeersService bs;
    /////////////FOr DropDown details//////////////////////////////////////////
    
    @Autowired
    StylesService ss;
    
    @Autowired
    CategoriesService cs;
            
    ////////////////////////////////////////////////////////        
    
    
    
    @RequestMapping("/displayAll")
    public ModelAndView diplayAllBrews() {
        
        return new ModelAndView("/allBeers", "beerList", bs.getAllBeers());
    }
    
    
    @RequestMapping("/search")
    public ModelAndView searchForm() {
         System.out.println("Search Form!");
        return new ModelAndView("/searchBeers");
    } 
    

    @RequestMapping("/searchedBeers")
    public ModelAndView searchedBeersList(@RequestParam(name = "name") String name) {
        System.out.println("searchedBeers list !");
        return new ModelAndView("/searchedBeers", "beerList", bs.getBeersSearchByNameResult(name));
    }
    
 //////////////////////////////////////////////////////////////////////////////////////////////////////////////   
    
//    //Path Params
//    @GetMapping("/name/{name}/age/{age}")
//    @ResponseBody // return String 
//    public String display (@PathVariable String name, @PathVariable int age) {
//        return "Hello " + name + " you are " + age;
//    }
//    @GetMapping("/hello2")
//     public ModelAndView handler(ModelAndView model) {
//         model.addObject("message", "helewslbklbvdkln");
//         model.setViewName("/index");
//         return model;
//     }
    
    @RequestMapping("/beerDetailsDropdown/{id}")
    public ModelAndView beerDropdownDetails(@PathVariable int id){
        // beers: Hocus Pocus 2001 id=1, cat_id=11, styl_id=116
        //System.out.println(bs.findByID(id)); //1
        System.out.println("Beer  iD: " + bs.findByID(id));  //1
        System.out.println("Style iD: " + bs.findByID(id).getStyleId());  //116
        System.out.println("Category ID: " + bs.findByID(id).getCatId()); //11
        ModelAndView model = new ModelAndView("/beerDetailsDropdown");  
        model.addObject("beer", bs.findByID(id));       
        model.addObject("style",ss.findByID(bs.findByID(id).getStyleId()));
        model.addObject("category",cs.findByID(bs.findByID(id).getCatId()));
        return model;
    }

/////////////////////////////////////////////////////////////////////////////////////////////////////////
    @RequestMapping("/sellPriceUpdate")
    public ModelAndView sellPriceAdjustment(
        @RequestParam("id") String idS,
        @RequestParam("percentage") String percentageS,
        @RequestParam("option") String option,
        @RequestParam("price") String priceS) throws Exception {
        System.out.println("here sellPriceAdjustment");
        DecimalFormat df2 = new DecimalFormat("#.##");
     
        int id = Integer.parseInt(idS); 
        double percent = (Double.parseDouble(percentageS))/100;
        double price = Double.parseDouble(priceS);  
        double newPrice = 0.0;
        try{
            if(percent <= 0.0 ) {throw new Exception();}      
            else{
                if(option.equals("increasing")){
                    price *= (1 + percent); newPrice = Double.parseDouble(df2.format(price)); //24 = 20 * (1 + 0.2) increasing
                
                } 
                else if(option.equals("decreasing")){
                    price *= (1 - percent); newPrice = Double.parseDouble(df2.format(price));  //16 = 20 * (1 - 0.2) decreasing
                }
            } 
            if (price <= 0.0){
                throw new Exception();
            }
            else if(bs.editSellingPrice(id, newPrice)){
                return new ModelAndView("redirect:/main/beerDetailsDropdown/" + id);
            }
            
        }catch(Exception e){
            System.out.println("Exception" + e);
        }
        return new ModelAndView("/error");
    }
    
    
    
    
    
//    
//     //Path Params
//    @GetMapping("/name/{name}/age/{age}")
//    @ResponseBody // return String 
//    public String display (@PathVariable String name, @PathVariable int age) {
//        return "Hello " + name + " you are " + age;
//    }
        
//    @RequestMapping("/LocaleEnIt/{language}")
//    public ModelAndView localeEN_IT( @PathVariable("language") String language, HttpServletRequest request){
//        //Locale locales[] = new locale[2]
//        System.out.println( request.getRequestURL().toString());
//
//        return new ModelAndView();
//    }
    
    
    
    
    
}
