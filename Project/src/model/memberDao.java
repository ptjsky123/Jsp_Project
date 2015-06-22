package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.naming.InitialContext;
import javax.sql.DataSource;

public class memberDao {
   
   private PreparedStatement pstmt;
   private Connection con;
   private ResultSet rs;
   private DataSource dataSource;
   
   
   public memberDao(){
      try{
         dataSource = (DataSource)new InitialContext().lookup("java:comp/env/jdbc/mysqlDB");
         
         
      }catch(Exception e){
            System.out.println("DB���� ��ü �غ� ���� : " + e);
      }
   }
   
   public void freeConnection(){
      if(con !=null) try{con.close();}catch(Exception err){}
      if(pstmt !=null) try{pstmt.close();}catch(Exception err){}
      if(rs !=null) try{rs.close();}catch(Exception err){}
      
   }
   
   public boolean setRegister(memberDto dto){
      
     
      String sql="insert into member (member_name, member_gender, member_id, member_pass, member_phone, member_email, member_date, member_grade) VALUES (?, ?, ?, ?, ?, ?, curdate(), 'ȸ��');";
      String sqlId="select member_id from member;";
      try{
         con = dataSource.getConnection();
         pstmt = con.prepareStatement(sql);
         PreparedStatement pstmtId = con.prepareStatement(sqlId);
         rs = pstmtId.executeQuery();
         
         while(rs.next()){
            if(dto.getMember_id().equals(rs.getString("member_id"))){
                 return false;
         }
         }
         
         pstmt.setString(1, dto.getMember_name());
         pstmt.setString(2, dto.getMember_gender());
         pstmt.setString(3, dto.getMember_id());
         pstmt.setString(4, dto.getMember_pass());
         pstmt.setString(5, dto.getMember_phone());
         pstmt.setString(6, dto.getMember_email());
         
         pstmt.executeUpdate();
         
      }catch(Exception e){
         System.out.println("setRegister ���� : " + e);
   }
      finally{
         freeConnection();
      }
      return true; 
   }
      
      public boolean LoginCheck(String member_id, String member_pass){
          
          String sql="select * from member;";
          try{
             con = dataSource.getConnection();
             pstmt = con.prepareStatement(sql);
             PreparedStatement pstmt = con.prepareStatement(sql);
             rs = pstmt.executeQuery();
             
             while(rs.next()){
                if(member_id.equals(rs.getString("member_id"))){
                	if(member_pass.equals(rs.getString("member_pass")))	
                     return true;
                }
             }
             
          }catch(Exception e){
             System.out.println("setRegister ���� : " + e);
       }
          finally{
             freeConnection();
          }
          return false; 
       }
      
      public void setUpdateRegister(memberDto dto, String member_id){
          
    	     
          String sql="UPDATE member SET member_name= ? , member_gender = ?, member_pass = ?, member_phone = ? , member_email = ?  WHERE member_id = '"+member_id+"';";
          
          try{
             con = dataSource.getConnection();
             pstmt = con.prepareStatement(sql);
            
   
             pstmt.setString(1, dto.getMember_name());
             pstmt.setString(2, dto.getMember_gender());
             pstmt.setString(3, dto.getMember_pass());
             pstmt.setString(4, dto.getMember_phone());
             pstmt.setString(5, dto.getMember_email());
           
             
             pstmt.executeUpdate();
             
          }catch(Exception e){
             System.out.println("setRegister ���� : " + e);
       }
          finally{
             freeConnection();
          }

       }
      
      
      public memberDto getRegister(String member_id){
          memberDto dto = new memberDto();
    	     
          String sql="select * from member where member_id = '"+ member_id+"';";
          
          try{
             con = dataSource.getConnection();
             pstmt = con.prepareStatement(sql);
             rs = pstmt.executeQuery();
             
             if(rs.next()){
            dto.setMember_no(rs.getInt("member_no"));
            dto.setMember_name(rs.getString("member_name"));
            dto.setMember_pass(rs.getString("member_pass"));
            dto.setMember_id(rs.getString("member_id"));
            dto.setMember_gender(rs.getString("member_gender"));
            dto.setMember_phone(rs.getString("member_phone"));
            dto.setMember_email(rs.getString("member_email"));
            dto.setMember_date(rs.getString("member_date"));
            dto.setMember_grade(rs.getString("member_grade"));
            
            	 
             }
  
             
          }catch(Exception e){
             System.out.println("setRegister ���� : " + e);
       }
          finally{
             freeConnection();
          }
          return dto; 
       }
      
      public memberDto getMemberRead(String member_id){
          memberDto dto = new memberDto();
          System.out.println(member_id+"read�޼��� �� id ��");
           String sql="select member_no, member_name, member_phone from member where member_id='"+member_id+"'";
           try{
              System.out.println("getMemberRead �޼��� �Ա�");
              con = dataSource.getConnection();
              pstmt = con.prepareStatement(sql);
              PreparedStatement pstmt = con.prepareStatement(sql);
              rs = pstmt.executeQuery();
              System.out.println("getMemberRead �޼��� �ⱸ");
              if(rs.next()){
                 System.out.println("if rs�� �Ա�");
                 dto.setMember_no(rs.getInt("member_no"));
                 dto.setMember_name(rs.getString("member_name"));
                 dto.setMember_phone(rs.getString("member_phone"));
                 System.out.println("if rs�� �ⱸ");
              }
              
           }catch(Exception e){
              System.out.println("getMemberRead �޼��� ����: "+e);
        }
           finally{
              freeConnection();
           }
           return dto; 
        }
      
      
      public memberDto getMember(String member_name){
          memberDto dto = new memberDto();
           String sql="select member_no, member_name, member_phone from member where member_name='"+member_name+"'";
           try{
              con = dataSource.getConnection();
              pstmt = con.prepareStatement(sql);
              rs = pstmt.executeQuery();
              
              if(rs.next()){
                 dto.setMember_no(rs.getInt("member_no"));
                 dto.setMember_name(rs.getString("member_name"));
                 dto.setMember_phone(rs.getString("member_phone"));
              }
              
           }catch(Exception e){
              System.out.println("setRegister ���� : " + e);
        }
           finally{
              freeConnection();
           }
           return dto; 
        }
      
    }
   
      
      
      
   
  