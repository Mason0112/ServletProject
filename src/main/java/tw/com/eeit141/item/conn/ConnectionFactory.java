package tw.com.eeit141.item.conn;

import java.sql.Connection;

import javax.naming.InitialContext;
import javax.sql.DataSource;

public class ConnectionFactory {
	public static Connection getConnection() {
		try {
			// 找到 JNDI 的 context
			InitialContext initialContext = new InitialContext();
			// 在 JNDI 實體中，尋找對應的資源，轉型成 DataSource(Connection Pool)
			DataSource ds = (DataSource) initialContext.lookup("java:comp/env/jdbc/TestDB2");

			// 從連線池中取得一條連線
			Connection conn = ds.getConnection();

			return conn;
		} catch (Exception e) {
			e.printStackTrace();
		}

		return null;
	}
}
