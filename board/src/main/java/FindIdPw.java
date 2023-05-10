

import java.io.IOException;
import java.util.Vector;

import board.MemberDDL;
import board.MembersDTO;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;



public class FindIdPw extends HttpServlet {


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		MemberDDL ddl = new MemberDDL();
		int opt = Integer.parseInt(request.getParameter("opt"));
		String val1=null, val2=null, rs1=null, rs2=null;
		if (opt == 1) {
			val1 = request.getParameter("username");
		} else {
			val1 = request.getParameter("userid");
		}
			val2 = request.getParameter("useremail");
			
		Vector data = ddl.getSelect(val1, val2, opt);
		int size = data.size();
		for (int i = 0; i < size; i++) {
			MembersDTO dt = (MembersDTO) data.elementAt(i);
			rs1 = dt.getUserid();
			rs2 = dt.getUserpass();
		}
		System.out.println(rs1 + ", " + rs2);
		
	}

}
