

import java.io.IOException;

import board.MemberDDL;
import board.MembersDTO;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;


public class MembersLoading extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}


	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		MembersDTO dto = new MembersDTO();
		MemberDDL db = new MemberDDL();
		String url = null;
		
		//MembersDTO에 setter로 파라미터 정보를 보낸 후 db에 getter로 받을 수 있도록 함.
		dto.setUserid(req.getParameter("userid"));
		dto.setUserpass(req.getParameter("userpass"));
		
		// MemberDDL의 매게변수로 MembersDTO를 받아 getter를 통해 db를 select 해서 조사.
		// 결과를 true, false 로 출력함
		boolean isSuccess = db.checkLoging(dto);
		if (isSuccess == true) {
			// 세션등록
			url = "index.jsp";
			HttpSession session = req.getSession();
			session.setAttribute("user", req.getParameter("userid"));
			res.sendRedirect(url);
		} else {
			url = "?fname=member/login";
			req.setAttribute("message", "아이디 또는 비밀번호가 틀렸습니다.");
			// forward를 통해 실패 변수를 전달 시킨다.
			req.getRequestDispatcher(url).forward(req, res);
		}
		
		doGet(req, res);
	}

}
