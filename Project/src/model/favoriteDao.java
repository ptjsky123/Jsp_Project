package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Vector;

import javax.naming.InitialContext;
import javax.sql.DataSource;

public class favoriteDao {
	private PreparedStatement pstmt;
	private Connection con;
	private ResultSet rs;
	private DataSource dataSource;

	public favoriteDao() {
		try {
			dataSource = (DataSource) new InitialContext()
					.lookup("java:comp/env/jdbc/mysqlDB");

		} catch (Exception e) {
			System.out.println("DB연결 객체 준비 오류 : " + e);
		}
	}

	public void freeConnection() {
		if (con != null)
			try {
				con.close();
			} catch (Exception err) {
			}
		if (pstmt != null)
			try {
				pstmt.close();
			} catch (Exception err) {
			}
		if (rs != null)
			try {
				rs.close();
			} catch (Exception err) {
			}

	}
	// 즐겨찾기 추가
	public void insertFavorite(favoriteDto dto){ 
  	  //insert 
  	  String sql="insert into favorite(member_no, business_no) "
  	  		+ "values(?, ?)";
        try{
      	  System.out.println(sql);
           con = dataSource.getConnection();
           pstmt = con.prepareStatement(sql);
           pstmt.setInt(1, dto.getMember_no());
           pstmt.setInt(2, dto.getBusiness_no());
           pstmt.executeUpdate();
           System.out.println("우다다다다닷");
        }catch(Exception e){
      	  System.out.println("insertReservation 메서드 에러 : "+e);
     }
        finally{
           freeConnection();
        } 
     }
    
    // 즐겨찾기 관리
    public Vector favoriteChk(String member_id){
    String sql="select f.favorite_no, m.member_no, b.business_name, f.business_no from favorite f, member m, business b where m.member_id = ? and b.business_no = f.business_no";
  	  
  	  Vector list = new Vector();
  	  try{
      	  
           con = dataSource.getConnection();
           pstmt = con.prepareStatement(sql);
           pstmt.setString(1, member_id);
           rs = pstmt.executeQuery();
           int cnt=0;
           while(rs.next()){
        	   favoriteDto dto = new favoriteDto();
        	   dto.setFavorite_no(rs.getInt("favorite_no")); 
        	   dto.setMember_no(rs.getInt("member_no"));    
        	   dto.setBusiness_no(rs.getInt("business_no"));
        	   dto.setBusiness_name(rs.getString("business_name"));
        	   list.add(dto);
        	   cnt++;
           }
         
           System.out.println("favoriteChk 확인");
        }catch(Exception e){
      	  System.out.println("insertReservation 메서드 에러 : "+e);
     }
        finally{
           freeConnection();
        }
		return list;
  
     }

    //즐겨찾기 삭제
    public void deleteBoard(int num){
		String sql = "delete from favorite where favorite_no=?";
		   System.out.println("삭제페이지당");
		try{
			con = dataSource.getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			pstmt.executeUpdate();
			System.out.println("삭제했당당당");
		}
		catch(Exception err){ System.out.println("deleteBoard() : " + err); }
		finally{ freeConnection(); }
	}
}
