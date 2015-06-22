package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Vector;

import javax.naming.InitialContext;
import javax.sql.DataSource;

public class businessDao {

    private PreparedStatement pstmt;
      private Connection con;
      private ResultSet rs;
      private DataSource dataSource;
      
      
      public businessDao(){
         try{
            dataSource = (DataSource)new InitialContext().lookup("java:comp/env/jdbc/mysqlDB");
            
            
         }catch(Exception e){
               System.out.println("DB연결 객체 준비 오류 : " + e);
         }
      }
      
      public void freeConnection(){
         if(con !=null) try{con.close();}catch(Exception err){}
         if(pstmt !=null) try{pstmt.close();}catch(Exception err){}
         if(rs !=null) try{rs.close();}catch(Exception err){}
         
      }
      
public Vector getBusinessAreaList(String area){
          
          System.out.println("지역리스트 메서드 area 값 : "+area);
          String sql="select * from business where business_addr like '%"+area+"%'";
        
          Vector list = new Vector();
          try{
             con = dataSource.getConnection();
             pstmt = con.prepareStatement(sql);
             rs = pstmt.executeQuery();
             
             while(rs.next()){
                businessDto dto = new businessDto();
                dto.setBusiness_no(rs.getInt("Business_no"));
                dto.setBusiness_name(rs.getString("Business_name"));
                dto.setBusiness_addr(rs.getString("Business_addr"));
                dto.setBusiness_phone(rs.getString("Business_phone"));
                dto.setBusiness_content(rs.getString("Business_content"));
                dto.setBusiness_count(rs.getInt("Business_count"));
             list.add(dto);
             }
             
             
          }catch(Exception e){
             System.out.println("BusinessAreaList 오류 : " + e);
       }
          finally{
             freeConnection();
          }
          return list; 
       }

public Vector getBusinessTypeList(String type){
    
    System.out.println("음식 메뉴  메서드 type 값 : "+type);
    String sql="select * from business where tof='"+type+"'";
  
    Vector list = new Vector();
    try{
       con = dataSource.getConnection();
       pstmt = con.prepareStatement(sql);
       rs = pstmt.executeQuery();
       
       while(rs.next()){
          businessDto dto = new businessDto();
          dto.setBusiness_no(rs.getInt("Business_no"));
          dto.setBusiness_name(rs.getString("Business_name"));
          dto.setBusiness_addr(rs.getString("Business_addr"));
          dto.setBusiness_phone(rs.getString("Business_phone"));
          dto.setBusiness_content(rs.getString("Business_content"));
          dto.setBusiness_count(rs.getInt("Business_count"));
       list.add(dto);
       }
       
       
    }catch(Exception e){
       System.out.println("BusinessTypeList 오류 : " + e);
 }
    finally{
       freeConnection();
    }
    return list; 
 }

public Vector getContent(int num, String page){
    String sql="";
    String content = "";
    String business_phone ="";
    Vector list = new Vector();
    
    try{
    	con = dataSource.getConnection();
    	
    	if(page.equals("read")){
    		sql = "update business set business_count= business_count+1 where business_no=?";
    		pstmt = con.prepareStatement(sql);
    		pstmt.setInt(1,  num);
    		pstmt.executeUpdate();
    	}
    	
     
       
    sql="select business_content, business_phone from business where business_no=?";
   	 pstmt = con.prepareStatement(sql);
   	 pstmt.setInt(1, num);
     rs = pstmt.executeQuery();
        
        if(rs.next()){ 	
           content = rs.getString("business_content");
           business_phone = rs.getString("business_phone");
           list.add(content);
           list.add(business_phone);
        }
        
        
     }catch(Exception e){
        System.out.println("setRegister 오류 : " + e);
  }
     finally{
        freeConnection();
     }
     return list; 
  }

      
      public Vector getBusinessList(){
         
        
         String sql="select * from business";
       
         Vector list = new Vector();
         try{
            con = dataSource.getConnection();
            pstmt = con.prepareStatement(sql);
            rs = pstmt.executeQuery();
            
            while(rs.next()){
               businessDto dto = new businessDto();
               dto.setBusiness_no(rs.getInt("Business_no"));
               dto.setBusiness_name(rs.getString("Business_name"));
               dto.setBusiness_addr(rs.getString("Business_addr"));
               dto.setBusiness_phone(rs.getString("Business_phone"));
               dto.setBusiness_content(rs.getString("Business_content"));
               dto.setBusiness_count(rs.getInt("Business_count"));
            list.add(dto);
            }
            
            
         }catch(Exception e){
            System.out.println("setRegister 오류 : " + e);
      }
         finally{
            freeConnection();
         }
         return list; 
      }
      
      // cmd = MAINSEARCH로 왔을때 호출되는 메서드 (메인창 검색기능) 
      public Vector getSearchBusinessList(String search){
          String sql= "";        
          Vector list = new Vector();
       
          try{
        	  con = dataSource.getConnection();
        	  for(int i = 0 ; i < 2 ; i++){
        		  if(i == 0){
        		  sql="select * from business where business_addr like '%"+ search + "%';";}
        		  else if(i == 1){
        		  sql="select * from business where business_name like '%"+ search + "%';";}	  
       	 
             pstmt = con.prepareStatement(sql);
             rs = pstmt.executeQuery();
             
             while(rs.next()){
                businessDto dto = new businessDto();
                dto.setBusiness_no(rs.getInt("Business_no"));
                dto.setBusiness_name(rs.getString("Business_name"));
                dto.setBusiness_addr(rs.getString("Business_addr"));
                dto.setBusiness_phone(rs.getString("Business_phone"));
                dto.setBusiness_content(rs.getString("Business_content"));
                dto.setBusiness_count(rs.getInt("Business_count"));
             list.add(dto);
             }
          
         }
          }catch(Exception e){
             System.out.println("setRegister 오류 : " + e);
       }
          finally{
             freeConnection();
          }
          return list; 
       }
      
      public Vector getBusinessMain(){
          
          
          String sql="select * from business order by business_count desc";
        
          Vector list = new Vector();
          try{
             con = dataSource.getConnection();
             pstmt = con.prepareStatement(sql);
             rs = pstmt.executeQuery();
             
             while(rs.next()){
         
            businessDto dto = new businessDto();
            dto.setBusiness_no(rs.getInt("Business_no"));
            dto.setBusiness_name(rs.getString("Business_name"));
            dto.setBusiness_addr(rs.getString("Business_addr"));
            dto.setBusiness_phone(rs.getString("Business_phone"));
            dto.setBusiness_content(rs.getString("Business_content"));
            dto.setBusiness_count(rs.getInt("Business_count"));
         
            list.add(dto);
             
             }
             
          }catch(Exception e){
             System.out.println("setRegister 오류 : " + e);
       }
          finally{
             freeConnection();
          }
          return list; 
       }
      public businessDto getPos(int num){
          businessDto dto = new businessDto();
          System.out.println("pos 메서드 입구");
          String sql="select xpos, ypos, business_name, business_addr from business where business_no = ?" ;
        
          try{
             con = dataSource.getConnection();
             pstmt = con.prepareStatement(sql);
             pstmt.setInt(1, num);
             rs = pstmt.executeQuery();
             
             if(rs.next()){
                dto.setBusiness_xpos(rs.getString("xpos"));
                dto.setBusiness_ypos(rs.getString("ypos"));
                dto.setBusiness_name(rs.getString("business_name"));
                dto.setBusiness_addr(rs.getString("business_addr"));

             }
             
             
          }catch(Exception e){
             System.out.println("pos 메서드  오류 : " + e);
       }
          finally{
             freeConnection();
          }
          return dto; 
       }
      public businessDto getBusinessRead(int business_no){
    	    businessDto dto = new businessDto();
    	      String sql="select business_name from business where business_no = ?";
    	      try{
    	         con = dataSource.getConnection();
    	         pstmt = con.prepareStatement(sql);
    	         pstmt.setInt(1, business_no);
    	         rs = pstmt.executeQuery();
    	         if(rs.next()){
    	            dto.setBusiness_name(rs.getString("business_name"));
    	         }
    	         
    	      }catch(Exception e){
    	         System.out.println("getMemberRead 메서드 에러: "+e);
    	   }
    	      finally{
    	         freeConnection();
    	      }
    	      return dto; 
    	   }
      
      
      
      
   
}