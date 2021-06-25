package com.pawnini.view.cs;

import java.io.File;
import java.io.FileInputStream;
import java.io.OutputStream;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

//jsp 파일에서 다운받을 파일명을 받아와 스트림으로 전송해줌
@Controller
public class CsFileDownController {

	@RequestMapping(value="fileDownload.do")
	public void fileDownload(HttpServletRequest request, HttpServletResponse response) throws Exception {
		//String path = request.getSession().getServletContext().getRealPath("저장경로");
		
		String cs_fileName = request.getParameter("cs_fileName");
		String realFileName = "";
		System.out.println("Cs_fileName으로 저장된 데이터 printout @ CsFileDownController"+cs_fileName);
		
		try {
			String browser = request.getHeader("User-Agent");
			//파일 인코딩
			if (browser.contains("MSIE") || browser.contains("Trident") || browser.contains("Chrome")) {
				cs_fileName = URLEncoder.encode(cs_fileName, "UTF-8").replaceAll("\\+", "%20");
			} else {
				cs_fileName = new String(cs_fileName.getBytes("UTF-8"), "ISO-8859-1");
			}
		} catch (UnsupportedEncodingException ex) {
			System.out.println("UnsupportedEncodingException");
		}
		realFileName = "D:\\upload\\"+cs_fileName;
		System.out.println(realFileName);
		File file = new File(realFileName);
		if (! file.exists()) {
			return;
		}
		//파일명 지정 //멀티파트 인코딩
		response.setContentType("application/octer-stream");
		response.setHeader("Content-Transfer-Encoding","binary");
		response.setHeader("Content-Disposition",  "attachment; filename=\""+cs_fileName+"\"");	//요청의 일부라는 사실을 알려주기 위한 헤더
		
		try {
		OutputStream os = response.getOutputStream();
		FileInputStream fis = new FileInputStream(realFileName);
		
		int ncount = 0;
		byte [] bytes = new byte[512];
		
		while((ncount = fis.read(bytes)) != -1) {
			os.write(bytes, 0, ncount);
		}
		fis.close();
		os.close();		
		} catch (Exception e) {
		System.out.println("FileNotFoundException : "+e);
		}
	}
}
