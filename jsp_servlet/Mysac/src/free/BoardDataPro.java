package free;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import javax.sql.*;
import javax.naming.*;

public class BoardDataPro {
	//싱글톤 객체
   private static BoardDataPro instance = null;
   public static BoardDataPro getInstance() {
      if(instance == null) {
         instance = new BoardDataPro();
      }
      return instance;
   }
   
   public BoardDataPro() {
      
   }
   
   private Connection getConnection() throws Exception{
      Context cp = new InitialContext();
      DataSource ds = (DataSource)cp.lookup("java:comp/env/jdbc/nov");
      
      return ds.getConnection();
   }
   
   public List<FreeBoardBean> getArticles(int start, int end){
      Connection conn = null;
      PreparedStatement ps = null;
      ResultSet rs = null;
      List<FreeBoardBean> articleList = null;
      
      try {
         conn = getConnection();
         String sql = "SELECT * FROM FreeBoard ORDER BY ref DESC, re_step ASC LIMIT ?, ?";   
         ps = conn.prepareStatement(sql);
         ps.setInt(1, start-1);
         ps.setInt(2, end);
         rs = ps.executeQuery();
         
         if(rs.next()) {
            articleList = new ArrayList<FreeBoardBean>();
            do {
               FreeBoardBean article = new FreeBoardBean();
               article.setNum(rs.getInt("num"));
               article.setWriter(rs.getString("writer"));
               article.setEmail(rs.getString("email"));
               article.setSubject(rs.getString("subject"));
               article.setPasswd(rs.getString("passwd"));
               article.setReg_date(rs.getTimestamp("reg_data"));
               article.setReadcount(rs.getInt("readcount"));
               article.setContext(rs.getString("context"));
               article.setIp(rs.getString("ip"));
               article.setRef(rs.getInt("ref"));
               article.setRe_step(rs.getInt("re_step"));
               article.setRe_level(rs.getInt("re_level"));
               
               articleList.add(article);
            }while(rs.next());
         }
      }
      catch(Exception e) {
         e.printStackTrace();
      }
      finally {
         
         try {
            if(rs!=null)
               rs.close();
            if(ps!=null)
               ps.close();
            if(conn!=null)
               conn.close();
         } catch (SQLException e) {
            e.printStackTrace();
         }
      }
      
      return articleList;
   }
   
   public int getArticleCount() throws Exception{
      Connection conn = null;
      PreparedStatement ps = null;
      ResultSet rs = null;
      int x = 0;
      
      try {
         conn = getConnection();
         ps = conn.prepareStatement("select count(*) from freeboard");
         rs = ps.executeQuery();
         if(rs.next()) {
            x = rs.getInt(1);
         }
      }
      catch(Exception e) {
         e.printStackTrace();
      }
      finally {
         try {
            rs.close();
            ps.close();
            conn.close();
         }
         catch (SQLException e) {
            e.printStackTrace();
         }
      }
      return x;
   }
   
   public void insertArticle(FreeBoardBean article) {
		Connection conn = null;
		PreparedStatement ps = null;
		String sql=null;
		ResultSet rs = null;
		
		int num=article.getNum();
		int ref=article.getRef();
		int re_step=article.getRe_step();
		int re_level=article.getRe_level();
		int number=0;
			
		try {		
			
			conn= getConnection();
			ps = conn.prepareStatement("select max(num) from freeboard");
			rs = ps.executeQuery();
			
			if(rs.next()) {
				number = rs.getInt(1)+1;
			}
			else {
				number = 1;
			}
			if(num != 0) {
				sql = "update freeboard set re_step = re_step+1 where ref=? and re_step > ?";
				ps=conn.prepareStatement(sql);
				ps.setInt(1, ref);
				ps.setInt(2, re_step);
				ps.executeUpdate();
				re_step = re_step+1;
				re_level = re_level+1;
				
				
			}
			else {
				ref = number;
				re_step=re_level = 0;						
			}
			
			sql = "insert into freeboard values(null,?,?,?,?,?,0,?,?,?,?,?)";

           ps = conn.prepareStatement(sql);
           ps.setString(1, article.getWriter());
           ps.setString(2, article.getEmail());
           ps.setString(3, article.getSubject());
           ps.setString(4, article.getPasswd());
			ps.setTimestamp(5, article.getReg_date());
			ps.setString(6, article.getContext());
			ps.setString(7, article.getIp());
			ps.setInt(8, ref);
            ps.setInt(9, re_step);
            ps.setInt(10, re_level);
            ps.executeUpdate();		
		} catch(Exception ex) {
	        ex.printStackTrace();
	    } finally {
	    	try {					
					ps.close();
					conn.close();
				}
				catch(SQLException e) {
					e.printStackTrace();
				}
	    }		
	}	

   public FreeBoardBean getArticle(int num) {
	   	Connection conn = null;
	   	PreparedStatement ps = null;
		String sql=null;
		ResultSet rs = null;
		
		FreeBoardBean article = new FreeBoardBean();
		
		try {		
			
			conn= getConnection();
			
			sql = "update freeboard set readcount = readcount+1 where num=?";
			
			ps = conn.prepareStatement(sql);
			
			ps.setInt(1,num);
			ps.executeUpdate();
			
			sql = "select * from freeboard where num = ?";
			
			ps = conn.prepareStatement(sql);
			ps.setInt(1,num);
			
			rs = ps.executeQuery();
			
			if(rs.next()){
				article.setNum(rs.getInt("num"));
				article.setWriter(rs.getString("writer"));
				article.setEmail(rs.getString("email"));
				article.setSubject(rs.getString("subject"));
				article.setPasswd(rs.getString("passwd"));
				article.setReg_date(rs.getTimestamp("reg_data"));
				article.setReadcount(rs.getInt("readcount"));
				article.setContext(rs.getString("context"));
				article.setIp(rs.getString("ip"));
				article.setRef(rs.getInt("ref"));
				article.setRe_step(rs.getInt("re_step"));
				article.setRe_level(rs.getInt("re_level"));
				
			}
			
		}
		catch(Exception ex) {
	        ex.printStackTrace();
	    } finally {
	    	try {			
	    			rs.close();
					ps.close();
					conn.close();
				}
				catch(SQLException e) {
					e.printStackTrace();
				}
	    }		
		
		
		return article;
   }
   
}
			
			
//   public void insertArticle(FreeBoardBean article) {
//	   Connection conn = null;
//	   PreparedStatement ps = null;
//	   String sql = null;
//	   
//	   int num =article.getNum();
//	   int ref = article.getRef();
//	   int re_step = article.getRe_step();
//	   int re_level = article.getRe_level();
//	   int number = 0;
//	   
//	   try {
//		   
//		   	 conn = getConnection();
//		   	 
//		   	 //num 은 글 번호
//		   	 if(num != 0) {
//		   		 sql = "update freeboard set re_step = re_strep+1 where ref =? and re_step > ?";
//		   		 ps = conn.prepareStatement(sql);
//		   		 ps.setInt(1, ref);
//		   		 ps.setInt(2, re_step);
//		   		 ps.executeUpdate();
//		   		 
//		   		 re_step++;
//		   		 re_level++;
//		   		 
//		   		 
//		   	 }
//		   	 //num = 0
//		   	 else {
//		   		 ref = 1;
//		   		 re_step = re_level = 0;
//		   	 }
//		   	 sql ="insert into freeboard value(null,?,?,?,?,?,0,?,?,?,?,?)";
//	         ps = conn.prepareStatement(sql);
//	         ps.setString(1, article.getWriter());
//	         ps.setString(2, article.getEmail());
//	         ps.setString(3, article.getSubject());
//	         ps.setString(4, article.getPasswd());
//	         ps.setTimestamp(5, article.getReg_date());
//	         ps.setString(6, article.getContext());
//	         ps.setString(7, article.getIp());
//	         ps.setInt(8, ref);	//같은 부모?
//	         ps.setInt(9, re_step);
//	         ps.setInt(10, re_level);
//		   
//		   System.out.println("글 추가 됩니까");
//	   }catch(Exception e){
//		   e.printStackTrace();
//	   }
//	   finally {
//		   try {
//			   ps.close();
//			   conn.close();
//		   }catch (SQLException e) {
//			   e.printStackTrace();
//		   }
//	   }
//	   
//   }
//}