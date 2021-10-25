package com.gdj37.coronagram.web.login.service;

import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;

import com.gdj37.coronagram.util.Utils;
import com.gdj37.coronagram.web.login.VO.MemberVO;
import com.gdj37.coronagram.web.login.dao.IDaoFind_Idpw;

@Service
public class ServiceFind_Idpw implements IServiceFind_Idpw {
	@Autowired
	public IDaoFind_Idpw iDaoFind_Idpw;

	@Autowired
	public JavaMailSender mailSender;

	@Override
	public List<HashMap<String, String>> findId(HashMap<String, String> params) throws Throwable {
		return iDaoFind_Idpw.findId(params);
	}

	/*
	 * @Override public String find_pws(HashMap<String, String> params) throws
	 * Throwable { return iDaoFind_Idpw.find_pws(params); }
	 * 
	 * @Override public String updateM1(HashMap<String, String> params) throws
	 * Throwable { return iDaoFind_Idpw.updateM1(params); }
	 */

	@Override
	public void sendEmail(MemberVO vo, String div) throws Exception {

		// 보내는 사람 EMail, 제목, 내용
		/* String fromEmail = "coronagram07@gmail.com"; (받는 사람 이메일에 표시됨) */
		String fromName = "Coronagram";
		String subject = "";
		String msg = "";

		if (div.equals("findpw")) {
			subject = "Coronagram 임시 비밀번호 입니다.";
			msg += "<div align='center' style='border:1px solid black; font-family:verdana'>";
			msg += "<h3 style='color: blue;'>";
			msg += vo.getM_ID() + "님의 임시 비밀번호 입니다. 비밀번호를 변경하여 사용하세요.</h3>";
			msg += "<p>임시 비밀번호 : ";
			msg += vo.getM_PW() + "</p></div>";
		}

		// 받는 사람 E-Mail 주소
		String mail = vo.getEMAIL();
		try {
			MimeMessage message = mailSender.createMimeMessage();
			MimeMessageHelper helper = new MimeMessageHelper(message, true, "UTF-8");

			helper.setFrom(fromName);
			helper.setTo(mail);
			helper.setSubject(subject);
			helper.setText(msg, true);

			mailSender.send(message);
		} catch (Exception e) {
			System.out.println("메일발송 실패 : " + e);
		}
	}

	// 비밀번호찾기

	@Override
	public void findPw(HttpServletResponse response, MemberVO vo) throws Exception {
		response.setContentType("text/html;charset=utf-8");
		MemberVO ck = iDaoFind_Idpw.readMember(vo.getM_ID());
		PrintWriter out = response.getWriter();
		// 가입된 아이디가 없으면
		if (iDaoFind_Idpw.idCheck(vo.getM_ID()) == null) {
			out.print("등록되지 않은 아이디입니다.");
			out.close();
			// 가입된 이메일이 아니면
		} else if (!vo.getEMAIL().equals(ck.getEMAIL())) {
			out.print("회원 정보와 일치하지 않는 이메일 주소입니다.");
			out.close();
		} else { // 임시 비밀번호 생성
			String pw = "";
			for (int i = 0; i < 12; i++) {
				pw += (char) ((Math.random() * 26) + 97);
			}

			vo.setM_PW(pw);

			try {
				String enPw = Utils.encryptAES128(vo.getM_PW());
				vo.setM_PW(enPw);

			} catch (Throwable e) {
				e.printStackTrace();
			}

			// 비밀번호 변경
			iDaoFind_Idpw.updatePw(vo);
			// 비밀번호 변경 메일 발송
			try {
				String dePw = Utils.decryptAES128(vo.getM_PW());
				vo.setM_PW(dePw);
			} catch (Throwable e) {
				e.printStackTrace();
			}

			sendEmail(vo, "findpw");

			out.print("이메일로 임시 비밀번호를 발송하였습니다.");
			out.close();
		}
	}
}
