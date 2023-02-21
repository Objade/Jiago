package com.itbank.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map.Entry;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.itbank.model.UserDTO;
import com.itbank.model.UserDonateDTO;
import com.itbank.service.DonateService;
import com.itbank.service.SurveyService;
import com.itbank.service.UserService;

@Controller
@RequestMapping("/donate")
public class DonateController {
   
   @Autowired DonateService donateService;
   @Autowired UserService userService;

   @GetMapping("/donateList")
   public ModelAndView donateList(HttpSession session) {
      ModelAndView mav = new ModelAndView("/donate/donateList");
      System.out.println("!");
      HashMap<String, UserDonateDTO> hashmap = donateService.getDonateList();
      
      mav.addObject("tree", hashmap.get("TREE"));
      mav.addObject("sum", hashmap.get("SUM"));
      mav.addObject("count", hashmap.get("COUNT"));
      
      if(session.getAttribute("login") != null) {
         int userIdx = ((UserDTO)session.getAttribute("login")).getUser_idx();
         
         String point = userService.getPoint(userIdx);
         if(point != null) mav.addObject("point",point);
      
         mav.addObject("point", point);
      }
      
      return mav;
   }
   
   @PostMapping("/donateList")
   public String donateUserPoint(UserDonateDTO dto, HttpSession session) {
      int userIdx = ((UserDTO)session.getAttribute("login")).getUser_idx();
      String user_idx = userIdx + "";
      
      HashMap<String, String> hashmap = new HashMap<String, String>();
      hashmap.put("user_idx", user_idx);
      hashmap.put("total_donate", dto.getTotal_donate()+"");
      
      donateService.minusUserPoint(hashmap);
      int row = donateService.addUserPoint(hashmap);
      
      
      return row == 1 ? "redirect:/donate/donateList" : "/";
   }
}