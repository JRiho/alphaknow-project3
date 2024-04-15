package login;

import java.sql.Connection;
import java.sql.DriverManager;

public class Login {
	
	private static final String driver = "oracle.jdbc.driver.OracleDriver";
	private static final String url = "jdbc:oracle:thin:@112.148.46.134:51521:xe";
	private static final String user = "alphaknow";
	private static final String password = "qwer1234";


    public static Connection getConnection() {
        try {
            Class.forName(driver);
            return DriverManager.getConnection(url, user, password);
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }
}