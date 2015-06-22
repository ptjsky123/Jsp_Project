package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.StringTokenizer;
import java.util.Vector;

import javax.naming.InitialContext;
import javax.sql.DataSource;



public class replyDao {
	private PreparedStatement pstmt;
	private Connection con;
	private ResultSet rs;
	private DataSource dataSource;

	public replyDao() {
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
	
	
	public Vector getReplyList(String member_id, int business_no){
		Vector list = new Vector();
		String sql = "select * from reply where business_no = ? order by  reply_no desc";
	
		try{
			con = dataSource.getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, business_no);
			rs = pstmt.executeQuery();
				
			while(rs.next()){
				replyDto dto = new replyDto();
				dto.setMember_id(member_id);
				dto.setReply_content(rs.getString(2));
				dto.setReply_date(rs.getString(5));
				list.add(dto);
			}
		}
		catch(Exception err){ System.out.println("getBoardList() : " + err); }
		finally{ freeConnection(); }	
		return list;
	}
	
	public void insertReply(replyDto rrrdto){
		Vector list = new Vector();
		String sql = "insert into reply(reply_content, member_no, business_no, reply_date) "
				+ "values(?, ?, ?, sysdate())";
		try{
			con = dataSource.getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, rrrdto.getReply_content());
			pstmt.setInt(2, rrrdto.getMember_no());
			pstmt.setInt(3, rrrdto.getBusiness_no());
			pstmt.executeUpdate();
		}
		catch(Exception err){ System.out.println("getBoardList() : " + err); }
		finally{ freeConnection(); }	
	}
	
	
	public int searchMem(String member_id){
		String sql = "select member_no from member where member_id = ?";
		replyDto rdto = new replyDto();
		int member_no = 0;
		StringTokenizer token = new StringTokenizer(member_id, "/");
		try{
			con = dataSource.getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, token.nextToken());
			rs = pstmt.executeQuery();
			while(rs.next()){
				member_no = rs.getInt(1);
			}
		}
		catch(Exception err){ System.out.println("getBoardList() : " + err); }
		finally{ freeConnection(); }
		return member_no;
	}
}
