package com.uwl.common;
import java.sql.*;

import org.bson.Document;
import org.bson.conversions.Bson;
import org.bson.types.ObjectId;

import com.mongodb.*;
import com.mongodb.client.*;
import com.mongodb.client.model.Filters;
import com.mongodb.client.model.UpdateOptions;
/**
 * This is proof-of-concept for extracting the data from an Oracle 
 * database.
 * @author naveen_v01
 *
 */

public class OracleToMongo {
		
		public OracleToMongo() {
			System.out.println(this.getClass());
		}
	
		public void startOracleToMongo() {
			
	
		// Java connection
			Connection conn = null;
			
			// 몽고디비랑 연결 uwl 있으면 가져오고 없으면 만들기
			MongoClient mongoConn = new MongoClient("localhost", 27017);
			MongoDatabase mongoDB = mongoConn.getDatabase("uwlTest");
			
			// 컬렉션 있으면 가져오고 없으면 새로만들기 
			MongoCollection<Document> coll = mongoDB.getCollection("users");
			
			// 오라클에서 뭐 가져올꺼임 ?
			String gender ="";		
			String userId = "";
			String name = "";
			String nickName = "";
			String fileName = "";
			String email = "";
			String password = "";
			String selfIntroduction = "";
			
			try {
				/* Register Driver though not required for Java 6.0
				 * and above. Retained for backward compatibility
				 */
				Class.forName("oracle.jdbc.OracleDriver");
				
				String connURL = "jdbc:oracle:thin:uwl/uwl@localhost:1521:xe";
				
				conn = DriverManager.getConnection(connURL);
				
				if(conn != null) {
					System.out.println("디비 들어간다");
				}
				
				// 테이블에서 가져올거 쿼리날리기
				Statement stmnt = conn.createStatement();
				String sqlQuery = "SELECT USER_ID , NAME , NICKNAME ,GENDER , PROFILE_NAME, MAIL, PASSWORD,SELF_INTRODUCTION FROM USERS";  
				ResultSet rs = stmnt.executeQuery(sqlQuery);
		
				// 잘나오는지 확인
				System.out.println("GENDER|USER_ID|NAME|NICKNAME|PROFILE_NAME");
				
				// Print results
				while(rs.next()) {
					userId = rs.getString("USER_ID");
					name = rs.getString("NAME");
					nickName = rs.getString("NICKNAME");
					gender = rs.getString("GENDER");
					fileName = rs.getString("PROFILE_NAME");
					email = rs.getString("MAIL");
					password = rs.getString("PASSWORD");
					selfIntroduction = rs.getString("SELF_INTRODUCTION");
					
					// 잘나오는지 확인2
					System.out.println(gender+"|"+userId+"|"+name+"|"+nickName+"|"+fileName);
//					
//					// 몽고에 들어갈 컬럼같은거 만들기 -  doc
//					Document doc = new Document("GENDER", gender) 
//							.append("_id", userId)
//							.append("NAME", userName)
//							.append("NICKNAME", nickName)
//							.append("PROFILE_NAME", fileName);
//					
//					System.out.println("들어감1");
//					// 컬럼 컬렉션에 넣기 doc ->coll
//					
					//ObjectId id = new ObjectId();
					Bson filter = Filters.eq("_id",userId);
					Bson update = new Document("$set", new
							Document("_id", userId) 
							.append("online", true)
							.append("email", email)
							.append("fileName", fileName)
							.append("gender", gender)
							.append("password", password)
							.append("nickname", nickName)
						//	.append("created_at", 오늘날짜? )
							//	.append("friends", 어레이)
							//	.append("channels", 이것도어레이 )
							.append("name", name));
							
					UpdateOptions options = new UpdateOptions().upsert(true);
					System.out.println("들어감2");
//					
//					
//					//coll.insertOne(doc);  // 이놈은 73번부터 77번까지 오라클에있는 내용을 그대로  몽고db에 넣음.
//					
					coll.updateOne(filter, update, options);  // 이놈은 84번부터 90번까지에 있는놈인데 중복된건 업데이트하고 없던건 insert 하면서 몽고db에 넣음 .. 이게짱임
					System.out.println("업데이투");
					
				}

			} catch(ClassNotFoundException ex) {
				ex.printStackTrace();
			} catch(SQLException ex) {
				ex.printStackTrace();
			}finally {
				try {
					if(conn != null && !conn.isClosed()) {
						conn.close();
					}
				} catch(SQLException ex) {
					ex.printStackTrace();
				}
				// close mongodb connection
				mongoConn.close();
		}
	}
}

