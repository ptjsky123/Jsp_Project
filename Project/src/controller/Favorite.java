package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.businessDao;
import model.businessDto;
import model.favoriteDao;
import model.favoriteDto;

public class Favorite implements ICommand{

      @Override
      public Object processCommand(HttpServletRequest req,
            HttpServletResponse resp) throws ServletException, IOException {
            req.setCharacterEncoding("euc-kr");
            String member_no = req.getParameter("member_no_favorite");
            String business_no = req.getParameter("business_no_favorite");
            String business_name = req.getParameter("business_name_favorite");
            businessDao bdao = new businessDao();
            businessDto bdto = new businessDto();
            favoriteDto fdto = new favoriteDto();
            favoriteDao fdao = new favoriteDao();

            bdto = bdao.getBusinessRead(Integer.parseInt(business_no));
            fdto.setBusiness_name(bdto.getBusiness_name());
            fdto.setMember_no(Integer.parseInt(member_no));
            fdto.setBusiness_no(Integer.parseInt(business_no));
            
            fdao.insertFavorite(fdto);
            
         return "Main.jsp";
      }

   }