package model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class MemberDAO {
	
	Connection con;
	PreparedStatement psmt;
	ResultSet rs;
	
	//기본생성자를 통한 DB연결
	public MemberDAO() {
		String driver = "oracle.jdbc.OracleDriver";
		String url = "jdbc:oracle:thin:@localhost:1521:orcl";
		
		try {
			Class.forName(driver);
			String id = "kosmo";
			String pw = "1234";
			con = DriverManager.getConnection(url, id, pw);
			System.out.println("DB연결성공(디폴트생성자)");
		}
		catch(Exception e) {
			System.out.println("DB연결실패(디폴트생성자)");
			e.printStackTrace();
		}
	}
	//인자생성자 : 오라클드라이버와 url을 매개변수로 받아 연결한다.
	public MemberDAO(String driver, String url) {
		try {
			Class.forName(driver);
			String id = "kosmo";
			String pw = "1234";
			con = DriverManager.getConnection(url, id, pw);
			System.out.println("DB연결성공(인자생성자)");
		}
		catch(Exception e) {
			System.out.println("DB연결실패(인자생성자)");
			e.printStackTrace();
		}
	}
	
	//그룹함수 count()를 통해 회원의 존재유무만 판단한다.
	public boolean isMember(String id, String pass) {
		
		//쿼리문 작성
		String sql = "SELECT COUNT(*) FROM member "
				+ "WHERE id=? AND pass=?";
		int isMember = 0;
		boolean isFlag = false;
		
		try {
			//prepare객체를 통해 쿼리문을 전송한다.
			psmt = con.prepareStatement(sql);
			//쿼리문의 인파라미터 설정(DB의 인덱스는 1부터 시작)
			psmt.setString(1, id);
			psmt.setString(2, pass);
			//쿼리문 실행 후 결과는 ResultSet객체를 통해 반환받는다.
			rs = psmt.executeQuery();
			//실행결과를 가져오기 위해 next()를 호출한다.
			rs.next();
			
			//select절의 첫 번째 결과값을 얻어오기 위해 getInt()를 사용한다.
			isMember = rs.getInt(1);
			System.out.println("affected:"+isMember);
			if(isMember==0) //회원이 아닌 경우
				isFlag = false;
			else //회원인 경우(해당 아이디, 패스워드가 일치)
				isFlag = true;
		}
		catch(Exception e ) {
			//예외가 발생한다면 확인이 불가능하므로 무조건 false를 반환한다.
			isFlag = false;
			e.printStackTrace();
		}
		return isFlag;
	}
	public static void main(String[] args) {
		new MemberDAO();
	}

}
