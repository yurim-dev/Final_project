package org.test.persistence;

import java.sql.*;
import java.io.*;

import org.junit.Test;

import lombok.extern.log4j.Log4j;

@Log4j
public class JDBCTests {
	static {
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
		} catch(ClassNotFoundException e) {
			log.info("드라이버 로드 에러 발생: " + e.getMessage());
		}
	}
	
	@Test
	public void testConnection() {
		try (Connection co = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","hr","hr")){
			log.info(co);
		} catch (SQLException e) {
			log.info("DB 연결 에러 발생 " + e.getMessage());
		}
	}
}
