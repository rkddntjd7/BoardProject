

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import board.MembersDTO;
import board.DBConnect;
import board.MemberDDL;


public class MembersOk extends HttpServlet {

	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
	
		
	}

	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

		MembersDTO dto = new MembersDTO();
		MemberDDL ddl = new MemberDDL();
		
		dto.setUserid(req.getParameter("userid"));
		dto.setUserpass(req.getParameter("userpass"));
		dto.setUsername(req.getParameter("username"));
		dto.setUseremail(req.getParameter("useremail"));
		dto.setPostcode(Integer.parseInt(req.getParameter("postcode")));
		dto.setAddr(req.getParameter("addr"));
		dto.setDetailaddr(req.getParameter("detailaddr"));
		dto.setTel(req.getParameter("tel"));
		dto.setUip();
		boolean isSuccess = ddl.insert(dto);
		
		if (isSuccess) {
			System.out.println("인서트 성공");
		} else {
			System.out.println("인서트 실패");
		}
		doGet(req,res);
	}

}
